import requests
import pandas as pd
import json
import os
import warnings

# 读取Excel文件中指定sheet的基金代码列
input_file_path = "个人养老金基金名录.xlsx"
output_file_path = "个人养老金基金名录_基金详情.xlsx"
sheet_name = "截至20230928"
# sheet_name = "test"
df = pd.read_excel(input_file_path, sheet_name=sheet_name, dtype=str)
df["基金代码"] = df["基金代码"].str.strip()
codes = df["基金代码"]

# 指定接口地址和起始日期
base_url = "https://api.doctorxiong.club/v1/fund/detail"
start_date = "2023-11-03"

# 创建一个空的DataFrame对象，用于存储返回的数据
result = pd.DataFrame()

# 遍历基金代码，并填入Excel中
for code in codes:
    print(code)
    api_url = f"{base_url}?code={code}&startDate={start_date}"
    try:
        response = requests.get(api_url)
        if response.status_code == 200:
            # 解析响应内容，返回一个字典对象
            data = json.loads(response.text)
            # 判断返回的数据是否为空，即是否有基金详情
            if data.get("data"):
                # 获取data中的基金详情，返回一个字典对象
                fund = data["data"]
                # 删除不需要写入excel的数据
                fund.pop("netWorthData")
                fund.pop("totalNetWorthData")
                fund.pop("requestFail")
                fund.pop("resolveFail")
                # 将基金详情转换为一个Series对象，添加到result中
                with warnings.catch_warnings():
                    warnings.simplefilter(action='ignore', category=FutureWarning)
                    result = result.append(pd.Series(fund), ignore_index=True)
            else:
                # 如果返回的数据为空，打印提示信息
                print(f"没有找到基金代码为{code}的基金详情")
        else:
            # 如果响应状态码不为200，打印提示信息
            print(f"请求接口失败，状态码为{response.status_code}")
    except Exception as e:
        print(f"An unexpected error occurred: {e}")


merged_df = df.merge(result, how="outer", left_on="基金代码", right_on="code")

new_sheet_name = f"{sheet_name}_基金详情"
# 检查文件是否存在
if os.path.exists(output_file_path):
    # 如果文件存在，以追加模式打开文件
    with pd.ExcelWriter(output_file_path, mode='a', if_sheet_exists='new') as writer:
        merged_df.to_excel(writer, sheet_name=new_sheet_name, index=False)
else:
    # 如果文件不存在，创建一个新的Excel文件
    merged_df.to_excel(output_file_path, sheet_name=new_sheet_name, index=False)
