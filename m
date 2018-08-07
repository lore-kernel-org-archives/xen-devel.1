From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH 8/9] x86/time: only HVM has RTC
Date: Tue, 7 Aug 2018 11:00:51 +0100
Message-ID: <41f775f770813c5e78f560d4be7b5a34d3ceac7d.1533636027.git-series.wei.liu2@citrix.com>
References: <cover.3198a0d9ad2683b74afcc86654a244d17cd8795e.1533636027.git-series.wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=xdgf=kw=citrix.com=prvs=7503460ff=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fmynS-00047U-Ec
 for xen-devel@lists.xenproject.org; Tue, 07 Aug 2018 10:00:58 +0000
In-Reply-To: <cover.3198a0d9ad2683b74afcc86654a244d17cd8795e.1533636027.git-series.wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

UFYgZG9lc24ndCBoYXZlIFJUQy4gRW5jbG9zZSByZWxldmFudCBjb2RlIGluIENPTkZJR19IVk0u
CgpTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgotLS0KIHhlbi9h
cmNoL3g4Ni90aW1lLmMgfCA0ICsrKysKIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykK
CmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvdGltZS5jIGIveGVuL2FyY2gveDg2L3RpbWUuYwpp
bmRleCA1MzY0NDliLi44ZDc0MjEwIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvdGltZS5jCisr
KyBiL3hlbi9hcmNoL3g4Ni90aW1lLmMKQEAgLTExNDQsNiArMTE0NCw3IEBAIHZvaWQgZm9yY2Vf
dXBkYXRlX3ZjcHVfc3lzdGVtX3RpbWUoc3RydWN0IHZjcHUgKnYpCiAKIHN0YXRpYyB2b2lkIHVw
ZGF0ZV9kb21haW5fcnRjKHZvaWQpCiB7CisjaWYgQ09ORklHX0hWTQogICAgIHN0cnVjdCBkb21h
aW4gKmQ7CiAKICAgICByY3VfcmVhZF9sb2NrKCZkb21saXN0X3JlYWRfbG9jayk7CkBAIC0xMTUz
LDEzICsxMTU0LDE2IEBAIHN0YXRpYyB2b2lkIHVwZGF0ZV9kb21haW5fcnRjKHZvaWQpCiAgICAg
ICAgICAgICBydGNfdXBkYXRlX2Nsb2NrKGQpOwogCiAgICAgcmN1X3JlYWRfdW5sb2NrKCZkb21s
aXN0X3JlYWRfbG9jayk7CisjZW5kaWYKIH0KIAogdm9pZCBkb21haW5fc2V0X3RpbWVfb2Zmc2V0
KHN0cnVjdCBkb21haW4gKmQsIGludDY0X3QgdGltZV9vZmZzZXRfc2Vjb25kcykKIHsKICAgICBk
LT50aW1lX29mZnNldF9zZWNvbmRzID0gdGltZV9vZmZzZXRfc2Vjb25kczsKKyNpZiBDT05GSUdf
SFZNCiAgICAgaWYgKCBpc19odm1fZG9tYWluKGQpICkKICAgICAgICAgcnRjX3VwZGF0ZV9jbG9j
ayhkKTsKKyNlbmRpZgogICAgIHVwZGF0ZV9kb21haW5fd2FsbGNsb2NrX3RpbWUoZCk7CiB9CiAK
LS0gCmdpdC1zZXJpZXMgMC45LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
