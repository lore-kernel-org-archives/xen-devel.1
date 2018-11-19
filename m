From: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>
Subject: [PATCH 20/22] xen_backend: Convert sysbus init function
 to realize function
Date: Mon, 19 Nov 2018 20:08:18 +0800
Message-ID: <20181119120820.29878-21-maozhongyi__4220.70464487678$1542630085$gmane$org@cmss.chinamobile.com>
References: <20181119120820.29878-1-maozhongyi@cmss.chinamobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Nj6P=N6=cmss.chinamobile.com=maozhongyi@srs-us1.protection.inumbo.net>)
 id 1gOiMN-00065b-J2
 for xen-devel@lists.xenproject.org; Mon, 19 Nov 2018 12:08:59 +0000
In-Reply-To: <20181119120820.29878-1-maozhongyi@cmss.chinamobile.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: qemu-devel@nongnu.org
Cc: anthony.perard@citrix.com, xen-devel@lists.xenproject.org, sstabellini@kernel.org, Zhang Shengju <zhangshengju@cmss.chinamobile.com>, Mao Zhongyi <maozhongyi@cmss.chinamobile.com>
List-Id: xen-devel@lists.xenproject.org

VXNlIERldmljZUNsYXNzIHJhdGhlciB0aGFuIFN5c0J1c0RldmljZUNsYXNzIGluCnhlbl9zeXNk
ZXZfY2xhc3NfaW5pdCgpLgoKQ2M6IHNzdGFiZWxsaW5pQGtlcm5lbC5vcmcKQ2M6IGFudGhvbnku
cGVyYXJkQGNpdHJpeC5jb20KQ2M6IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwoKU2ln
bmVkLW9mZi1ieTogTWFvIFpob25neWkgPG1hb3pob25neWlAY21zcy5jaGluYW1vYmlsZS5jb20+
ClNpZ25lZC1vZmYtYnk6IFpoYW5nIFNoZW5nanUgPHpoYW5nc2hlbmdqdUBjbXNzLmNoaW5hbW9i
aWxlLmNvbT4KLS0tCiBody94ZW4veGVuX2JhY2tlbmQuYyB8IDYgKystLS0tCiAxIGZpbGUgY2hh
bmdlZCwgMiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2h3L3hl
bi94ZW5fYmFja2VuZC5jIGIvaHcveGVuL3hlbl9iYWNrZW5kLmMKaW5kZXggOWE4ZTg3NzFlYy4u
NzNiMGVkMDE2OSAxMDA2NDQKLS0tIGEvaHcveGVuL3hlbl9iYWNrZW5kLmMKKysrIGIvaHcveGVu
L3hlbl9iYWNrZW5kLmMKQEAgLTgwOSw5ICs4MDksOCBAQCBzdGF0aWMgY29uc3QgVHlwZUluZm8g
eGVuc3lzYnVzX2luZm8gPSB7CiAgICAgfQogfTsKIAotc3RhdGljIGludCB4ZW5fc3lzZGV2X2lu
aXQoU3lzQnVzRGV2aWNlICpkZXYpCitzdGF0aWMgdm9pZCB4ZW5fc3lzZGV2X3JlYWxpemUoRGV2
aWNlU3RhdGUgKmRldiwgRXJyb3IgKiplcnJwKQogewotICAgIHJldHVybiAwOwogfQogCiBzdGF0
aWMgUHJvcGVydHkgeGVuX3N5c2Rldl9wcm9wZXJ0aWVzW10gPSB7CkBAIC04MjEsOSArODIwLDgg
QEAgc3RhdGljIFByb3BlcnR5IHhlbl9zeXNkZXZfcHJvcGVydGllc1tdID0gewogc3RhdGljIHZv
aWQgeGVuX3N5c2Rldl9jbGFzc19pbml0KE9iamVjdENsYXNzICprbGFzcywgdm9pZCAqZGF0YSkK
IHsKICAgICBEZXZpY2VDbGFzcyAqZGMgPSBERVZJQ0VfQ0xBU1Moa2xhc3MpOwotICAgIFN5c0J1
c0RldmljZUNsYXNzICprID0gU1lTX0JVU19ERVZJQ0VfQ0xBU1Moa2xhc3MpOwogCi0gICAgay0+
aW5pdCA9IHhlbl9zeXNkZXZfaW5pdDsKKyAgICBkYy0+cmVhbGl6ZSA9IHhlbl9zeXNkZXZfcmVh
bGl6ZTsKICAgICBkYy0+cHJvcHMgPSB4ZW5fc3lzZGV2X3Byb3BlcnRpZXM7CiAgICAgZGMtPmJ1
c190eXBlID0gVFlQRV9YRU5TWVNCVVM7CiB9Ci0tIAoyLjE3LjEKCgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
