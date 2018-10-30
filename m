From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: [PATCH] tools/misc/xenpm: fix getting info when some
 CPUs are offline
Date: Tue, 30 Oct 2018 23:16:15 +0100
Message-ID: <20181030221615.24171-1-marmarek@invisiblethingslab.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=s4yt=nk=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1gHcJN-0000FE-5B
 for xen-devel@lists.xenproject.org; Tue, 30 Oct 2018 22:16:33 +0000
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
Oi8vZ2l0aHViLmNvbS9RdWJlc09TL3F1YmVzLWlzc3Vlcy9pc3Vlcy80NDU2Ci0tLQogdG9vbHMv
bWlzYy94ZW5wbS5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRl
bGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvdG9vbHMvbWlzYy94ZW5wbS5jIGIvdG9vbHMvbWlzYy94
ZW5wbS5jCmluZGV4IDg2YzEyZWE1ZmIuLjExMjU5MGZiNjcgMTAwNjQ0Ci0tLSBhL3Rvb2xzL21p
c2MveGVucG0uYworKysgYi90b29scy9taXNjL3hlbnBtLmMKQEAgLTEyMzEsNyArMTIzMSw3IEBA
IGludCBtYWluKGludCBhcmdjLCBjaGFyICphcmd2W10pCiAgICAgICAgIHhjX2ludGVyZmFjZV9j
bG9zZSh4Y19oYW5kbGUpOwogICAgICAgICByZXR1cm4gcmV0OwogICAgIH0KLSAgICBtYXhfY3B1
X25yID0gcGh5c2luZm8ubnJfY3B1czsKKyAgICBtYXhfY3B1X25yID0gcGh5c2luZm8ubWF4X2Nw
dV9pZDsKIAogICAgIC8qIGNhbGN1bGF0ZSBob3cgbWFueSBvcHRpb25zIG1hdGNoIHdpdGggdXNl
cidzIGlucHV0ICovCiAgICAgZm9yICggaSA9IDA7IGkgPCBBUlJBWV9TSVpFKG1haW5fb3B0aW9u
cyk7IGkrKyApCi0tIAoyLjE3LjIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
