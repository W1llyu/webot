# WeiXin Api


## 1. 获取UUID
### Request
```
GET  /jslogin
UrlParams
{
  "appid": "",
  "fun": "new"
}
Headers
{
  "User-Agent": ""
}
```
### Response
```
'window.QRLogin.code = 200; window.QRLogin.uuid = "4a914KmLzA==";'
```

## 2. 登录二维码Url
```
https://login.weixin.qq.com/l/:uuid
```

## 3. 获取登录链接
### Request
```
GET /cgi-bin/mmwebwx-bin/login
UrlParams
{
  "loginicon": "true",
  "uuid": "",
  "tip": "1",
  "r": "-958786",
  "_": "1513922271"
}
```
### Response
```
# 超时
'window.code=408;'

# 手机扫码
window.code=201;window.userAvatar = '*';

# 手机扫码完成
'window.code=200;
window.redirect_uri="https://wx.qq.com/cgi-bin/mmwebwx-bin/webwxnewloginpage?ticket=Ab_yr7Yr6WvKsemcObL59fjA@qrticket_0&uuid=YaF5FnN99A==&lang=zh_CN&scan=1513922416";'
```

## 4. 登录
### Request
```
GET
```
### Response
```
<error>
  <ret>0</ret>
  <message></message>
  <skey>@crypt_1533a725_c3f334541b894cc7c82c3e6ff11daec9</skey>
  <wxsid>7VvAoIRIYVQ3KiF7</wxsid>
  <wxuin>2450346660</wxuin>
  <pass_ticket>RKWoJHbo6pkiL0q%2FzEdyMz1Wf%2FmZ3f5NQgwm3SvmXqbNFnc6%2FdS7qDlIdop5ZeT4</pass_ticket>
  <isgrayscale>1</isgrayscale>
</error>
```

## 5. 初始化
### Request
```
POST /webwxinit
UrlParams
{
  "r": "-958785",
  "pass_ticket": ""
}
Body
{
  "BaseRequest": {
    "Uin": "",
    "Skey": "",
    "Sid": "",
    "DeviceID": ""  # pass_ticket
  }
}
Headers
{
  "User-Agent": "",
  "ContentType": "application/json; charset=UTF-8"
}
```
### Response
```
{
  "BaseResponse": {
    "Ret": 0,
    "ErrMsg": ""
  },
  "Count": 2,
  "ContactList": [
    {
      "Uin": 0,
      "UserName": "filehelper",
      "NickName": "文件传输助手",
      "HeadImgUrl": "/cgi-bin/mmwebwx-bin/webwxgeticon?seq=621332481&username=filehelper&skey=@crypt_1533a725_c3f334541b894cc7c82c3e6ff11daec9",
      "ContactFlag": 2,
      "MemberCount": 0,
      "MemberList": [],
      "RemarkName": "",
      "HideInputBarFlag": 0,
      "Sex": 0,
      "Signature": "",
      "VerifyFlag": 0,
      "OwnerUin": 0,
      "PYInitial": "WJCSZS",
      "PYQuanPin": "wenjianchuanshuzhushou",
      "RemarkPYInitial": "",
      "RemarkPYQuanPin": "",
      "StarFriend": 0,
      "AppAccountFlag": 0,
      "Statues": 0,
      "AttrStatus": 0,
      "Province": "",
      "City": "",
      "Alias": "",
      "SnsFlag": 0,
      "UniFriend": 0,
      "DisplayName": "",
      "ChatRoomId": 0,
      "KeyWord": "fil",
      "EncryChatRoomId": "",
      "IsOwner": 0
    },
    {
      "Uin": 0,
      "UserName": "@@0f524ac5f167e843981a3e48edec9b497bc1b9c7f744e354f3c88b7711b5f867",
      "NickName": "微信机器人测试裙",
      "HeadImgUrl": "/cgi-bin/mmwebwx-bin/webwxgetheadimg?seq=0&username=@@0f524ac5f167e843981a3e48edec9b497bc1b9c7f744e354f3c88b7711b5f867&skey=@crypt_1533a725_c3f334541b894cc7c82c3e6ff11daec9",
      "ContactFlag": 0,
      "MemberCount": 3,
      "MemberList": [
        {
          "Uin": 0,
          "UserName": "@485fa7db07e061ef82a43d9259492066",
          "NickName": "",
          "AttrStatus": 0,
          "PYInitial": "",
          "PYQuanPin": "",
          "RemarkPYInitial": "",
          "RemarkPYQuanPin": "",
          "MemberStatus": 0,
          "DisplayName": "",
          "KeyWord": "soi"
        },
        {
          "Uin": 0,
          "UserName": "@9df3a8fcfb4c90e7849ff204e4f016613ab59cb0a3528bda3872b77ae7bdbc32",
          "NickName": "",
          "AttrStatus": 0,
          "PYInitial": "",
          "PYQuanPin": "",
          "RemarkPYInitial": "",
          "RemarkPYQuanPin": "",
          "MemberStatus": 0,
          "DisplayName": "",
          "KeyWord": ""
        },
        {
          "Uin": 0,
          "UserName": "@97bd921d6335b07f58a04cea08181b35",
          "NickName": "",
          "AttrStatus": 0,
          "PYInitial": "",
          "PYQuanPin": "",
          "RemarkPYInitial": "",
          "RemarkPYQuanPin": "",
          "MemberStatus": 0,
          "DisplayName": "",
          "KeyWord": "ysr"
        }
      ],
      "RemarkName": "",
      "HideInputBarFlag": 0,
      "Sex": 0,
      "Signature": "",
      "VerifyFlag": 0,
      "OwnerUin": 0,
      "PYInitial": "",
      "PYQuanPin": "",
      "RemarkPYInitial": "",
      "RemarkPYQuanPin": "",
      "StarFriend": 0,
      "AppAccountFlag": 0,
      "Statues": 1,
      "AttrStatus": 0,
      "Province": "",
      "City": "",
      "Alias": "",
      "SnsFlag": 0,
      "UniFriend": 0,
      "DisplayName": "",
      "ChatRoomId": 0,
      "KeyWord": "",
      "EncryChatRoomId": "",
      "IsOwner": 1
    }
  ]，
  "SyncKey": {
    "Count": 4,
    "List": [
      {
        "Key": 1,
        "Val": 651991553
      },
      {
        "Key": 2,
        "Val": 651996455
      },
      {
        "Key": 3,
        "Val": 651996384
      },
      {
        "Key": 1000,
        "Val": 1513904762
      }
    ]
  },
  "User": {
    "Uin": 2450346660,
    "UserName": "@97bd921d6335b07f58a04cea08181b35",
    "NickName": "Will",
    "HeadImgUrl": "/cgi-bin/mmwebwx-bin/webwxgeticon?seq=1594975619&username=@97bd921d6335b07f58a04cea08181b35&skey=@crypt_1533a725_c3f334541b894cc7c82c3e6ff11daec9",
    "RemarkName": "",
    "PYInitial": "",
    "PYQuanPin": "",
    "RemarkPYInitial": "",
    "RemarkPYQuanPin": "",
    "HideInputBarFlag": 0,
    "StarFriend": 0,
    "Sex": 1,
    "Signature": "nothing",
    "AppAccountFlag": 0,
    "VerifyFlag": 0,
    "ContactFlag": 0,
    "WebWxPluginSwitch": 0,
    "HeadImgFlag": 1,
    "SnsFlag": 49
  },
  "ChatSet": "filehelper,@@0f524ac5f167e843981a3e48edec9b497bc1b9c7f744e354f3c88b7711b5f867",
  "SKey": "@crypt_1533a725_c3f334541b894cc7c82c3e6ff11daec9",
  "ClientVersion": 369492002,
  "SystemTime": 1513922685,
  "GrayScale": 1,
  "InviteStartCount": 40,
  "MPSubscribeMsgCount": 1,
  "MPSubscribeMsgList": [
    {
      "UserName": "@53a19d641977ac6bc495b90d3b60e739",
      "MPArticleCount": 5,
      "MPArticleList": [
        {
          "Title": "2018在上海，这些统统免费啦！想不到连......都不要钱！",
          "Digest": "明年起，免费的东西多了去了！明年在上海做这些，统统不要钱！",
          "Cover": "http://mmbiz.qpic.cn/mmbiz_jpg/PM9AfVUDnSN0OPNo6p7PuGFoxNgzSvnNp3JcJJq2PBkbs5KNkzXDzOQ108n4pjKySJ2ia3jf4XaD1ibhRZicHVajQ/640?wxtype=jpeg&wxfrom=0",
          "Url": "http://mp.weixin.qq.com/s?__biz=MzI1MzA5MDEyNQ==&mid=2657819596&idx=1&sn=d74c6abbd40f517c5e7f0168ad134157&chksm=f2467beec531f2f8a86bc36947fa50a7a5e7f067686f51b4734c2e1eb27b6df6c9742bf56b98&scene=0#rd"
        },
        {
          "Title": "升升升！上海明天最高15°C！新的冷空气又在路上了...",
          "Digest": "今天将迎来2017年的最后一个节气——冬至上海人吃啥？反正不吃饺子！",
          "Cover": "http://mmbiz.qpic.cn/mmbiz_jpg/PM9AfVUDnSN0OPNo6p7PuGFoxNgzSvnNc3lMdl3jS6ObMsWU3mkaeziaiaUXjtic5chccYmPPW90KP26f6NOCZgYA/300?wxtype=jpeg&wxfrom=0",
          "Url": "http://mp.weixin.qq.com/s?__biz=MzI1MzA5MDEyNQ==&mid=2657819596&idx=2&sn=b862f42593743483914072b158793b15&chksm=f2467beec531f2f840fe9efa8e6690a834c8572da8ea467ab6dc1ff81020d11dcb8157bf56c7&scene=0#rd"
        },
        {
          "Title": "还有10天！没买车的要哭了，买车将多花10000元！",
          "Digest": "房子、车子都是大家生活的一部分，网上有很多段子“今年不买房，明年又白忙”不过小编今天要说的是“今年不买车，明",
          "Cover": "http://mmbiz.qpic.cn/mmbiz_jpg/PM9AfVUDnSN0OPNo6p7PuGFoxNgzSvnNu5SO1hoEHVKic6nhCpygScN3ULTUd7hFgyjJMou4H5AO4frKE9pM9Bg/300?wxtype=jpeg&wxfrom=0",
          "Url": "http://mp.weixin.qq.com/s?__biz=MzI1MzA5MDEyNQ==&mid=2657819596&idx=3&sn=5556e952a1ddec3590cf2c3cf563a180&chksm=f2467beec531f2f8bdaf38e1be73e6e346201d3f86b3a75d7a2ae27a3d85ffcac11b6deb8f67&scene=0#rd"
        },
        {
          "Title": "2018节假日“加班工资版”日历！加班族，这笔钱一定要领！",
          "Digest": "距离元旦仅剩10天啦！是不是突然有点小激动？这些天上班的你一定是这样的▼有多少人，每逢节假日都在加班前线看着",
          "Cover": "http://mmbiz.qpic.cn/mmbiz_jpg/PM9AfVUDnSN0OPNo6p7PuGFoxNgzSvnNvQDYbpicibcqfN1QSUhsqwBib4zh2icsVgfApx3130GfjrLvKIBHpeTvcQ/300?wxtype=jpeg&wxfrom=0",
          "Url": "http://mp.weixin.qq.com/s?__biz=MzI1MzA5MDEyNQ==&mid=2657819596&idx=4&sn=a5c318114f1e533487107a14dcc99e3d&chksm=f2467beec531f2f8eb3b4c034071693eb1bf163a28b3315c9f8132eacdff41e3a57f65ee1343&scene=0#rd"
        },
        {
          "Title": "神奇！洗衣机里倒点这个，脏东西自动跑出来！",
          "Digest": "又get一个新技能！！！",
          "Cover": "http://mmbiz.qpic.cn/mmbiz_jpg/PM9AfVUDnSPuRH9CXmq4CtYNS9jJD2M0zwp8gPErsUGWddRYRtkSHZhTTCpSYYicZ9fBwRMe9pjOK8XUwwWIftA/300?wxtype=jpeg&wxfrom=0",
          "Url": "http://mp.weixin.qq.com/s?__biz=MzI1MzA5MDEyNQ==&mid=2657819596&idx=5&sn=4b66791379094e01a6941e2dffc0348a&chksm=f2467beec531f2f889bedab45608b7252174b99d6d9609734bb1970f85448073afabb662635f&scene=0#rd"
        }
      ],
      "Time": 1513916103,
      "NickName": "上海本地宝"
    }
  ],
  "ClickReportInterval": 600000
}
```

## 6. 通知手机
### Request
```
POST /cgi-bin/mmwebwx-bin/webwxstatusnotify
UrlParams
{
  "lang": "zh_CN",
  "pass_ticket": ""
}
Body
{
  "BaseRequest": {
    "Uin": "",
    "Skey": "",
    "Sid": "",
    "DeviceID": ""  # pass_ticket
  },
  "Code": 3,
  "FromUserName": "",
  "ToUserName": "",
  "ClientMsgId": "1513924043"
}
Headers
{
  "User-Agent": "",
  "ContentType": "application/json; charset=UTF-8"
}
```
### Response
```
{
  "BaseResponse": {
    "Ret": 1101,
    "ErrMsg": ""
  },
  "MsgID": ""
}
```

## 7. 同步消息
```
POST /cgi-bin/mmwebwx-bin/webwxsync
UrlParams
{
  "sid": "",
  "skey": "",
  "pass_ticket": ""
}
Body
{
  "BaseRequest": {
    "Uin": 2450346660,
    "Sid": "O70Qt1OLFf9QLx2M",
    "Skey": "@crypt_1533a725_f0380c92f9dbccbcc365f6e8403afab0",
    "DeviceID": "e944972306651598"
  },
  "SyncKey": {
    "Count": 1,
    "List": [
      {
        "Key": 1,
        "Val": 651991553
      },
      {
        "Key": 2,
        "Val": 651995902
      },
      {
        "Key": 3,
        "Val": 651995504
      },
      {
        "Key": 1000,
        "Val": 123
      }
    ]
  },
  "rr": -2083591885
}
Headers
{
  "User-Agent": "",
  "ContentType": "application/json; charset=UTF-8"
}
```

### Response
```
{
  "BaseResponse": {
    "Ret": 0,
    "ErrMsg": ""
  },
  "AddMsgCount": 1,
  "AddMsgList": [
    {
      "MsgId": "7466342607691052416",
      "FromUserName": "@@3c2deacf1b60335ef5b07c1d364551afc2a4cc0dcd8aaa8430570f753e56f625",
      "ToUserName": "@66d5c1c16a94a12453fde8ff82c3c548",
      "MsgType": 1,
      "Content": "@da84612cd0f1409ee1feeee03d85e70faf7275cbf84326eae071293df8883941:<br/>有",
      "Status": 3,
      "ImgStatus": 1,
      "CreateTime": 1513913385,
      "VoiceLength": 0,
      "PlayLength": 0,
      "FileName": "",
      "FileSize": "",
      "MediaId": "",
      "Url": "",
      "AppMsgType": 0,
      "StatusNotifyCode": 0,
      "StatusNotifyUserName": "",
      "RecommendInfo": {
        "UserName": "",
        "NickName": "",
        "QQNum": 0,
        "Province": "",
        "City": "",
        "Content": "",
        "Signature": "",
        "Alias": "",
        "Scene": 0,
        "VerifyFlag": 0,
        "AttrStatus": 0,
        "Sex": 0,
        "Ticket": "",
        "OpCode": 0
      },
      "ForwardFlag": 0,
      "AppInfo": {
        "AppID": "",
        "Type": 0
      },
      "HasProductId": 0,
      "Ticket": "",
      "ImgHeight": 0,
      "ImgWidth": 0,
      "SubMsgType": 0,
      "NewMsgId": 7466342607691052416,
      "OriContent": "",
      "EncryFileName": ""
    }
  ],
  "ModContactCount": 0,
  "ModContactList": [],
  "DelContactCount": 0,
  "DelContactList": [],
  "ModChatRoomMemberCount": 0,
  "ModChatRoomMemberList": [],
  "Profile": {
    "BitFlag": 0,
    "UserName": {
      "Buff": ""
    },
    "NickName": {
      "Buff": ""
    },
    "BindUin": 0,
    "BindEmail": {
      "Buff": ""
    },
    "BindMobile": {
      "Buff": ""
    },
    "Status": 0,
    "Sex": 0,
    "PersonalCard": 0,
    "Alias": "",
    "HeadImgUpdateFlag": 0,
    "HeadImgUrl": "",
    "Signature": ""
  },
  "ContinueFlag": 0,
  "SyncKey": {
    "Count": 5,
    "List": [
      {
        "Key": 2,
        "Val": 651995969
      },
      {
        "Key": 13,
        "Val": 651910002
      },
      {
        "Key": 201,
        "Val": 1513913385
      },
      {
        "Key": 1000,
        "Val": 1513904762
      },
      {
        "Key": 1001,
        "Val": 1513904833
      }
    ]
  },
  "SKey": "",
  "SyncCheckKey": {
    "Count": 5,
    "List": [
      {
        "Key": 2,
        "Val": 651995969
      },
      {
        "Key": 13,
        "Val": 651910002
      },
      {
        "Key": 201,
        "Val": 1513913385
      },
      {
        "Key": 1000,
        "Val": 1513904762
      },
      {
        "Key": 1001,
        "Val": 1513904833
      }
    ]
  }
}
```

## 8. 发送消息
### Request
```
POST /cgi-bin/mmwebwx-bin/webwxsendmsg
UrlParams
{
  "lang": "zh_CN",
  "pass_ticket": ""
}
Body
{
  "BaseRequest": {
    "Uin": 2450346660,
    "Sid": "O70Qt1OLFf9QLx2M",
    "Skey": "@crypt_1533a725_f0380c92f9dbccbcc365f6e8403afab0",
    "DeviceID": "e944972306651598"
  },
  "Msg": {
    "ClientMsgId": "15139251046900833",
    "Content": "Test",
    "FromUserName": "",
    "LocalID": "15139251046900833",
    "ToUserName": "",
    "Type": 1
  },
  "Scene": 0
}
Headers
{
  "User-Agent": "",
  "ContentType": "application/json; charset=UTF-8"
}
```
### Response
```
{
  "BaseResponse": {
	"Ret": -1,
	"ErrMsg": ""
  },
  "MsgID": "",
  "LocalID": ""
}
```