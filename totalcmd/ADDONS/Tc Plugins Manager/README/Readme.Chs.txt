TC PlugMan 简体中文自述文件（2007/05）

翻译由 SunYJ
----------------------------------------------------------------
TC PlugMan 是 Total Commander (http://ghisler.com) 的插件管理器。
允许你更容易的管理 TC 插件。你可以从：http://totalcmd.net 获取
这些插件的收集。

特点：

 - 管理全部类型的插件
 - 安装/卸载/配置插件 -比 TC 更容易！
 - 禁用/激活插件 - TC 做不到！
 - 运行/重新启动 TC
 - 记录安装和解包过程


注意：

1. 它显示 TC 是否正在运行着。如果是，那么你做了一些改变后，要使改变
   生效，你必须重新启动 TC。

2. “从存档安装”功能需要安装外部解包器：

   - 对于 ZIP 存档：WinRAR, UnZip, PKUnZip, WZUnZip, PKZipC
   - 对于 RAR 存档：WinRAR, Rar.exe, UnRar.exe

   推荐使用 WinRAR (http://rarlab.com) 处理 ZIP 和 RAR 存档。

   UnZip/UnRAR 免费解包器已包含在分布里。不需要复制它们到任何位置，直接
   从 Plugman 文件夹运行它们。
   如果你安装了 WinRAR，你可以删除它们。

3. “安装自存档”命令允许你安装大的插件包！一个存档有任何深度的单独文件
   夹内的多个插件。
   注意：同一存档文件夹内不允许有多个 .W?X 文件 - 否则你将得到错误讯息！

4. “安装自文件夹”命令是“安装自存档”的备用。如果你有压缩的插件包，
   推荐使用“安装自存档” - 这将在安装期间创建适当的插件文件夹。

命令行选项：

  1. /restart           - 重新启动 Total Commander 并退出
  2. /orderWLX
     /orderWDX          - 显示“插件顺序”对话框
     /orderWCX            
  3. Path\Filename.W?X  - 安装给与的插件文件


免费软件/开源。

版权 (c) 2006 Alexey Torgashin atorg@yandex.ru
http://atorg.net.ru
http://totalcmd.net/plugring/tc_plugman.html
