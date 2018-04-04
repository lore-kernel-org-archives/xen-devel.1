From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH] x86/hvm/ioreq: fix out of bounds access in
 error path
Date: Wed, 4 Apr 2018 12:03:14 +0100
Message-ID: <20180404110314.16762-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=2hdy=gz=citrix.com=prvs=6255a1c57=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1f3gCJ-0007iE-TF
 for xen-devel@lists.xenproject.org; Wed, 04 Apr 2018 11:03:23 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul.durrant@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

SXQgaXMgcG9zc2libGUgdG8gY2FsbCB0aGUgZXJyb3IgcGF0aCB3aXRoIGkgcG9pbnRpbmcgYmV5
b25kIHRoZSBlbmQKb2YgdGhlIGFycmF5LgoKVGhlcmUgaXMgYW5vdGhlciBidWcgdGhhdCBpZiB0
aGVyZSBpcyBhbHJlYWR5IGEgZGVmYXVsdCBpb3JlcSBzZXJ2ZXIsCnRoZSBjb2RlIHdpbGwgYWN0
dWFsbHkgc2V0cyB0aGUgZWxlbWVudCB0byBOVUxMLCBoZW5jZSBsZWFraW5nIG1lbW9yeS4KCk1v
dmUgc2V0dGluZyBOVUxMIHRvIHdoZXJlIGl0IGlzIG5lZWRlZC4KCkNvdmVyaXR5LUlEOiAxNDMz
Nzc3ClNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Ci0tLQpDYzog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpDYzogQW5kcmV3IENvb3BlciA8YW5kcmV3
LmNvb3BlcjNAY2l0cml4LmNvbT4KQ2M6IFBhdWwgRHVycmFudCA8cGF1bC5kdXJyYW50QGNpdHJp
eC5jb20+Ci0tLQogeGVuL2FyY2gveDg2L2h2bS9pb3JlcS5jIHwgNSArKystLQogMSBmaWxlIGNo
YW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4v
YXJjaC94ODYvaHZtL2lvcmVxLmMgYi94ZW4vYXJjaC94ODYvaHZtL2lvcmVxLmMKaW5kZXggOTQz
NTI5MWU4Ny4uMjI3NTI3ODMwNSAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L2h2bS9pb3JlcS5j
CisrKyBiL3hlbi9hcmNoL3g4Ni9odm0vaW9yZXEuYwpAQCAtODExLDcgKzgxMSwxMCBAQCBpbnQg
aHZtX2NyZWF0ZV9pb3JlcV9zZXJ2ZXIoc3RydWN0IGRvbWFpbiAqZCwgYm9vbCBpc19kZWZhdWx0
LAogCiAgICAgcmMgPSBodm1faW9yZXFfc2VydmVyX2luaXQocywgZCwgYnVmaW9yZXFfaGFuZGxp
bmcsIGkpOwogICAgIGlmICggcmMgKQorICAgIHsKKyAgICAgICAgc2V0X2lvcmVxX3NlcnZlcihk
LCBpLCBOVUxMKTsKICAgICAgICAgZ290byBmYWlsOworICAgIH0KIAogICAgIGlmICggaSA9PSBE
RUZBVUxUX0lPU0VSVklEICkKICAgICAgICAgaHZtX2lvcmVxX3NlcnZlcl9lbmFibGUocyk7CkBA
IC04MjUsOCArODI4LDYgQEAgaW50IGh2bV9jcmVhdGVfaW9yZXFfc2VydmVyKHN0cnVjdCBkb21h
aW4gKmQsIGJvb2wgaXNfZGVmYXVsdCwKICAgICByZXR1cm4gMDsKIAogIGZhaWw6Ci0gICAgc2V0
X2lvcmVxX3NlcnZlcihkLCBpLCBOVUxMKTsKLQogICAgIHNwaW5fdW5sb2NrX3JlY3Vyc2l2ZSgm
ZC0+YXJjaC5odm1fZG9tYWluLmlvcmVxX3NlcnZlci5sb2NrKTsKICAgICBkb21haW5fdW5wYXVz
ZShkKTsKIAotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
