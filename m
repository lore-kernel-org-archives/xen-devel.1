From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: [RFC PATCH v2 14/17] xenconsoled: deduplicate error
 handling
Date: Tue,  7 Aug 2018 04:16:19 +0200
Message-ID: <df71ff3653c9df69f0cdaf3b33b68a5cc7586f33.1533608042.git-series.marmarek@invisiblethingslab.com>
References: <cover.f20f4d9289206c83fc15e632ed8ec76ac4e8c8cd.1533608042.git-series.marmarek@invisiblethingslab.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=+atq=kw=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1fmrc4-0000zo-QG
 for xen-devel@lists.xenproject.org; Tue, 07 Aug 2018 02:20:44 +0000
In-Reply-To: <cover.f20f4d9289206c83fc15e632ed8ec76ac4e8c8cd.1533608042.git-series.marmarek@invisiblethingslab.com>
In-Reply-To: <cover.f20f4d9289206c83fc15e632ed8ec76ac4e8c8cd.1533608042.git-series.marmarek@invisiblethingslab.com>
References: <cover.f20f4d9289206c83fc15e632ed8ec76ac4e8c8cd.1533608042.git-series.marmarek@invisiblethingslab.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
List-Id: xen-devel@lists.xenproject.org

U2lnbmVkLW9mZi1ieTogTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpIDxtYXJtYXJla0BpbnZp
c2libGV0aGluZ3NsYWIuY29tPgotLS0KIHRvb2xzL2NvbnNvbGUvZGFlbW9uL2lvLmMgfCAxNyAr
KysrKysrKystLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgOCBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS90b29scy9jb25zb2xlL2RhZW1vbi9pby5jIGIvdG9vbHMv
Y29uc29sZS9kYWVtb24vaW8uYwppbmRleCBjMmMzN2RjLi5lYTA3NDQyIDEwMDY0NAotLS0gYS90
b29scy9jb25zb2xlL2RhZW1vbi9pby5jCisrKyBiL3Rvb2xzL2NvbnNvbGUvZGFlbW9uL2lvLmMK
QEAgLTgxOSw5ICs4MTksNyBAQCBzdGF0aWMgaW50IGNvbnNvbGVfY3JlYXRlX3Jpbmcoc3RydWN0
IGNvbnNvbGUgKmNvbikKIAogCWlmIChyYyA9PSAtMSkgewogCQllcnIgPSBlcnJubzsKLQkJeGVu
ZXZ0Y2huX2Nsb3NlKGNvbi0+eGNlX2hhbmRsZSk7Ci0JCWNvbi0+eGNlX2hhbmRsZSA9IE5VTEw7
Ci0JCWdvdG8gb3V0OworCQlnb3RvIGVycl94Y2U7CiAJfQogCWNvbi0+bG9jYWxfcG9ydCA9IHJj
OwogCWNvbi0+cmVtb3RlX3BvcnQgPSByZW1vdGVfcG9ydDsKQEAgLTgyOSwxMSArODI3LDcgQEAg
c3RhdGljIGludCBjb25zb2xlX2NyZWF0ZV9yaW5nKHN0cnVjdCBjb25zb2xlICpjb24pCiAJaWYg
KGNvbi0+bWFzdGVyX2ZkID09IC0xKSB7CiAJCWlmICghY29uc29sZV9jcmVhdGVfdHR5KGNvbikp
IHsKIAkJCWVyciA9IGVycm5vOwotCQkJeGVuZXZ0Y2huX2Nsb3NlKGNvbi0+eGNlX2hhbmRsZSk7
Ci0JCQljb24tPnhjZV9oYW5kbGUgPSBOVUxMOwotCQkJY29uLT5sb2NhbF9wb3J0ID0gLTE7Ci0J
CQljb24tPnJlbW90ZV9wb3J0ID0gLTE7Ci0JCQlnb3RvIG91dDsKKwkJCWdvdG8gZXJyX3hjZTsK
IAkJfQogCX0KIApAQCAtODQzLDYgKzgzNywxMyBAQCBzdGF0aWMgaW50IGNvbnNvbGVfY3JlYXRl
X3Jpbmcoc3RydWN0IGNvbnNvbGUgKmNvbikKIAkvKiBpZiBldmVyeXRoaW5nIG9rLCBzaWduYWwg
YmFja2VuZCByZWFkaW5lc3MsIGluIGJhY2tlbmQgdHJlZSAqLwogCXNldF9iYWNrZW5kX3N0YXRl
KGNvbiwgWGVuYnVzU3RhdGVDb25uZWN0ZWQpOwogCisgZXJyX3hjZToKKwlpZiAoZXJyKSB7CisJ
CXhlbmV2dGNobl9jbG9zZShjb24tPnhjZV9oYW5kbGUpOworCQljb24tPnhjZV9oYW5kbGUgPSBO
VUxMOworCQljb24tPmxvY2FsX3BvcnQgPSAtMTsKKwkJY29uLT5yZW1vdGVfcG9ydCA9IC0xOwor
CX0KICBvdXQ6CiAJcmV0dXJuIGVycjsKIH0KLS0gCmdpdC1zZXJpZXMgMC45LjEKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
