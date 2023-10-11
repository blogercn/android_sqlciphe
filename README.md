# android_sqlcipher 
### 克隆代码
git clone  https://github.com/blogercn/android_sqlciphe.git
### 进入工作目录
cd jni
### 设置你的NDK路径
export PATH=$PATH:/Users/jiazhiguo/Library/Android/sdk/ndk/25.0.8775105/
### 执行命令
ndk-build
这个命令有一些参数可以帮助我们编译，比如指定目录，指定Application.mk路径，指定android.mk路径,感觉除了android.mk文件，其他变量都可以指定：
ndk-build NDK_PROJECT_PATH=.       
NDK_APPLICATION_MK=Application.mk
APP_BUILD_SCRIPT := $(LOCAL_PATH)/Android.mk
### 生成so库
### 在项目中应用
    const char* pwd = "abcdefg";
    result = sqlite3_open(path, &db);

    if (result == SQLITE_OK)
        cout << "打开数据库成功" << endl;
    else
        cout << "打开数据库失败" << endl;

    result = sqlite3_key(db, pwd, strnlen(pwd, 1000));
    cout << "指定数据库密码：" << result << endl;

