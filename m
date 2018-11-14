From: Sergey Dyasli <sergey.dyasli@citrix.com>
Subject: [PATCH v3 1/8] x86/nestedhvm: init nv_vvmcxaddr in
 hvm_vcpu_initialise()
Date: Wed, 14 Nov 2018 10:23:16 +0000
Message-ID: <20181114102323.7771-2-sergey.dyasli@citrix.com>
References: <20181114102323.7771-1-sergey.dyasli@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20181114102323.7771-1-sergey.dyasli@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xen.org
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>
List-Id: xen-devel@lists.xenproject.org

VGhpcyBhbGxvd3MgdG8gc2FmZWx5IHVzZSBuZXN0ZWRodm0gZnVuY3Rpb25zIHRoYXQgcmVseSBv
biB0aGUgdmFsdWVzCmluc2lkZSBzdHJ1Y3QgbmVzdGVkdmNwdSBpbmRlcGVuZGVudGx5IG9mIHRo
ZSBuZXN0ZWQgdmlydHVhbGlzYXRpb24KKEhWTV9QQVJBTV9ORVNURURIVk0pIHN0YXR1cyBvZiBh
IGRvbWFpbi4KClNpZ25lZC1vZmYtYnk6IFNlcmdleSBEeWFzbGkgPHNlcmdleS5keWFzbGlAY2l0
cml4LmNvbT4KLS0tCnYzOgotIG5ldyBwYXRjaAotLS0KIHhlbi9hcmNoL3g4Ni9odm0vaHZtLmMg
fCAyICsrCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEveGVu
L2FyY2gveDg2L2h2bS9odm0uYyBiL3hlbi9hcmNoL3g4Ni9odm0vaHZtLmMKaW5kZXggNWQyNjNj
NDA5MC4uYzBhM2RiNTg1OCAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L2h2bS9odm0uYworKysg
Yi94ZW4vYXJjaC94ODYvaHZtL2h2bS5jCkBAIC0xNTE2LDYgKzE1MTYsOCBAQCBpbnQgaHZtX3Zj
cHVfaW5pdGlhbGlzZShzdHJ1Y3QgdmNwdSAqdikKICAgICBpZiAoIHJjICE9IDAgKQogICAgICAg
ICBnb3RvIGZhaWw0OwogCisgICAgdmNwdV9uZXN0ZWRodm0odikubnZfdnZtY3hhZGRyID0gSU5W
QUxJRF9QQUREUjsKKwogICAgIGlmICggbmVzdGVkaHZtX2VuYWJsZWQoZCkKICAgICAgICAgICYm
IChyYyA9IG5lc3RlZGh2bV92Y3B1X2luaXRpYWxpc2UodikpIDwgMCApIC8qIHRlYXJkb3duOiBu
ZXN0ZWRodm1fdmNwdV9kZXN0cm95ICovCiAgICAgICAgIGdvdG8gZmFpbDU7Ci0tIAoyLjE3LjEK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
