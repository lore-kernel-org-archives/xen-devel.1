From: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>
Subject: [PATCH v2 20/21] xen_backend: remove xen_sysdev_init()
 function
Date: Fri, 23 Nov 2018 23:30:39 +0800
Message-ID: <20181123153040.18933-21-maozhongyi@cmss.chinamobile.com>
References: <20181123153040.18933-1-maozhongyi@cmss.chinamobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SZ/P=OC=cmss.chinamobile.com=maozhongyi@srs-us1.protection.inumbo.net>)
 id 1gQDSP-0007HY-J6
 for xen-devel@lists.xenproject.org; Fri, 23 Nov 2018 15:33:25 +0000
In-Reply-To: <20181123153040.18933-1-maozhongyi@cmss.chinamobile.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, sstabellini@kernel.org, Mao Zhongyi <maozhongyi@cmss.chinamobile.com>, anthony.perard@citrix.com, xen-devel@lists.xenproject.org, Zhang Shengju <zhangshengju@cmss.chinamobile.com>
List-Id: xen-devel@lists.xenproject.org

VGhlIGluaXQgZnVuY3Rpb24gZG9lc24ndCBkbyBhbnl0aGluZyBhdCBhbGwsIHNvIHdlCmp1c3Qg
b21pdCBpdC4KCkNjOiBzc3RhYmVsbGluaUBrZXJuZWwub3JnCkNjOiBhbnRob255LnBlcmFyZEBj
aXRyaXguY29tCkNjOiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKQ2M6IHBldGVyLm1h
eWRlbGxAbGluYXJvLm9yZwoKU2lnbmVkLW9mZi1ieTogTWFvIFpob25neWkgPG1hb3pob25neWlA
Y21zcy5jaGluYW1vYmlsZS5jb20+ClNpZ25lZC1vZmYtYnk6IFpoYW5nIFNoZW5nanUgPHpoYW5n
c2hlbmdqdUBjbXNzLmNoaW5hbW9iaWxlLmNvbT4KLS0tCiBody94ZW4veGVuX2JhY2tlbmQuYyB8
IDcgLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDcgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
aHcveGVuL3hlbl9iYWNrZW5kLmMgYi9ody94ZW4veGVuX2JhY2tlbmQuYwppbmRleCA5YThlODc3
MWVjLi4wYmM2YjFkZTYwIDEwMDY0NAotLS0gYS9ody94ZW4veGVuX2JhY2tlbmQuYworKysgYi9o
dy94ZW4veGVuX2JhY2tlbmQuYwpAQCAtODA5LDExICs4MDksNiBAQCBzdGF0aWMgY29uc3QgVHlw
ZUluZm8geGVuc3lzYnVzX2luZm8gPSB7CiAgICAgfQogfTsKIAotc3RhdGljIGludCB4ZW5fc3lz
ZGV2X2luaXQoU3lzQnVzRGV2aWNlICpkZXYpCi17Ci0gICAgcmV0dXJuIDA7Ci19Ci0KIHN0YXRp
YyBQcm9wZXJ0eSB4ZW5fc3lzZGV2X3Byb3BlcnRpZXNbXSA9IHsKICAgICB7LyogZW5kIG9mIHBy
b3BlcnR5IGxpc3QgKi99LAogfTsKQEAgLTgyMSw5ICs4MTYsNyBAQCBzdGF0aWMgUHJvcGVydHkg
eGVuX3N5c2Rldl9wcm9wZXJ0aWVzW10gPSB7CiBzdGF0aWMgdm9pZCB4ZW5fc3lzZGV2X2NsYXNz
X2luaXQoT2JqZWN0Q2xhc3MgKmtsYXNzLCB2b2lkICpkYXRhKQogewogICAgIERldmljZUNsYXNz
ICpkYyA9IERFVklDRV9DTEFTUyhrbGFzcyk7Ci0gICAgU3lzQnVzRGV2aWNlQ2xhc3MgKmsgPSBT
WVNfQlVTX0RFVklDRV9DTEFTUyhrbGFzcyk7CiAKLSAgICBrLT5pbml0ID0geGVuX3N5c2Rldl9p
bml0OwogICAgIGRjLT5wcm9wcyA9IHhlbl9zeXNkZXZfcHJvcGVydGllczsKICAgICBkYy0+YnVz
X3R5cGUgPSBUWVBFX1hFTlNZU0JVUzsKIH0KLS0gCjIuMTcuMQoKCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
