From: Julien Grall <julien.grall@arm.com>
Subject: [PATCH] xen/arm64: livepatch: Fix build after 03957f58db
Date: Tue, 21 May 2019 15:29:13 +0100
Message-ID: <20190521142913.22394-1-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=YYEG=TV=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hT5la-0008Vc-Ba
 for xen-devel@lists.xenproject.org; Tue, 21 May 2019 14:29:22 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@arm.com>, sstabellini@kernel.org
List-Id: xen-devel@lists.xenproject.org

Q29tbWl0IDAzOTU3ZjU4ZGIgInhlbi9jb25zdDogRXh0ZW5kIHRoZSBleGlzdGluZyBtYWNybyBC
SVQgdG8gdGFrZSBhCnN1ZmZpeCBpbiBwYXJhbWV0ZXIiIGRpZG4ndCBjb252ZXJ0IGFsbCB0aGUg
Y2FsbGVycyBvZiB0aGUgbWFjcm8gQklULgoKVGhpcyB3aWxsIHJlc3VsdCB0byBhIGJ1aWxkIGJy
ZWFrYWdlIHdoZW4gZW5hYmxpbmcgTGl2ZXBhdGNoIG9uIGFybTY0LgoKUmVwb3J0ZWQtYnk6IEFu
ZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+ClNpZ25lZC1vZmYtYnk6IEp1
bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Ci0tLQogeGVuL2FyY2gvYXJtL2FybTY0
L2xpdmVwYXRjaC5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRl
bGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2FybTY0L2xpdmVwYXRjaC5jIGIv
eGVuL2FyY2gvYXJtL2FybTY0L2xpdmVwYXRjaC5jCmluZGV4IDIyNDdiOTI1YTAuLjVjNzU3Nzky
ODQgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL2FybS9hcm02NC9saXZlcGF0Y2guYworKysgYi94ZW4v
YXJjaC9hcm0vYXJtNjQvbGl2ZXBhdGNoLmMKQEAgLTIwOCw3ICsyMDgsNyBAQCBzdGF0aWMgaW50
IHJlbG9jX2luc25faW1tKGVudW0gYWFyY2g2NF9yZWxvY19vcCBvcCwgdm9pZCAqZGVzdCwgdTY0
IHZhbCwKICAgICBzdmFsID4+PSBsc2I7CiAKICAgICAvKiBFeHRyYWN0IHRoZSB2YWx1ZSBiaXRz
IGFuZCBzaGlmdCB0aGVtIHRvIGJpdCAwLiAqLwotICAgIGltbV9tYXNrID0gKEJJVChsc2IgKyBs
ZW4pIC0gMSkgPj4gbHNiOworICAgIGltbV9tYXNrID0gKEJJVChsc2IgKyBsZW4sIFVMKSAtIDEp
ID4+IGxzYjsKICAgICBpbW0gPSBzdmFsICYgaW1tX21hc2s7CiAKICAgICAvKiBVcGRhdGUgdGhl
IGluc3RydWN0aW9uJ3MgaW1tZWRpYXRlIGZpZWxkLiAqLwotLSAKMi4xMS4wCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
