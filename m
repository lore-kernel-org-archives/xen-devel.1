From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: [PATCH v2] tools/misc/xenpm: fix getting info when some
 CPUs are offline
Date: Wed, 31 Oct 2018 14:04:58 +0100
Message-ID: <20181031130458.1181-1-marmarek@invisiblethingslab.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=zqf5=nl=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1gHqBG-0000I5-Mc
 for xen-devel@lists.xenproject.org; Wed, 31 Oct 2018 13:05:06 +0000
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

VXNlIHBoeXNpbmZvLm1heF9jcHVfaWQgaW5zdGVhZCBvZiBwaHlzaW5mby5ucl9jcHVzIHRvIGdl
dCBtYXggQ1BVIGlkLgpUaGlzIGZpeGVzIGZvciBleGFtcGxlICd4ZW5wbSBnZXQtY3B1ZnJlcS1w
YXJhJyB3aXRoIHNtdD1vZmYsIHdoaWNoCm90aGVyd2lzZSB3b3VsZCBtaXNzIGhhbGYgb2YgdGhl
IGNvcmVzLgoKU2lnbmVkLW9mZi1ieTogTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpIDxtYXJt
YXJla0BpbnZpc2libGV0aGluZ3NsYWIuY29tPgotLS0KUmVwb3J0ZWQgYnkgQHRmbTE6Cmh0dHBz
Oi8vZ2l0aHViLmNvbS9RdWJlc09TL3F1YmVzLWlzc3Vlcy9pc3N1ZXMvNDQ1NgoKQ2hhbmdlcyBp
biB2MjoKIC0gZml4IG9mZiBieSBvbmUgZXJyb3IKLS0tCiB0b29scy9taXNjL3hlbnBtLmMgfCAy
ICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYg
LS1naXQgYS90b29scy9taXNjL3hlbnBtLmMgYi90b29scy9taXNjL3hlbnBtLmMKaW5kZXggODZj
MTJlYTVmYi4uNjVhYTRjOWQ0MiAxMDA2NDQKLS0tIGEvdG9vbHMvbWlzYy94ZW5wbS5jCisrKyBi
L3Rvb2xzL21pc2MveGVucG0uYwpAQCAtMTIzMSw3ICsxMjMxLDcgQEAgaW50IG1haW4oaW50IGFy
Z2MsIGNoYXIgKmFyZ3ZbXSkKICAgICAgICAgeGNfaW50ZXJmYWNlX2Nsb3NlKHhjX2hhbmRsZSk7
CiAgICAgICAgIHJldHVybiByZXQ7CiAgICAgfQotICAgIG1heF9jcHVfbnIgPSBwaHlzaW5mby5u
cl9jcHVzOworICAgIG1heF9jcHVfbnIgPSBwaHlzaW5mby5tYXhfY3B1X2lkICsgMTsKIAogICAg
IC8qIGNhbGN1bGF0ZSBob3cgbWFueSBvcHRpb25zIG1hdGNoIHdpdGggdXNlcidzIGlucHV0ICov
CiAgICAgZm9yICggaSA9IDA7IGkgPCBBUlJBWV9TSVpFKG1haW5fb3B0aW9ucyk7IGkrKyApCi0t
IAoyLjE3LjIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
