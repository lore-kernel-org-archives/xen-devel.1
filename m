From: Norbert Manthey <nmanthey@amazon.de>
Subject: [goto-label] memory: fix label syntax
Date: Tue, 31 Jul 2018 09:18:18 +0200
Message-ID: <1533021498-21452-1-git-send-email-nmanthey@amazon.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=vjw3=kp=amazon.de=prvs=74377f6f8=nmanthey@srs-us1.protection.inumbo.net>)
 id 1fkOxO-0005jO-D9
 for xen-devel@lists.xenproject.org; Tue, 31 Jul 2018 07:20:34 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, George
 Dunlap <george.dunlap@citrix.com>
Cc: Elizabeth Polgreen <polgreen@amazon.de>, Norbert Manthey <nmanthey@amazon.de>
List-Id: xen-devel@lists.xenproject.org

VG8gYmUgYWJsZSB0byBjb21waWxlIFhlbiB3aXRoIGdvdG9jYywgdGhlIGxhYmVsIHN0YXRlbWVu
dCBoYXMgdG8gYmUKZm9sbG93ZWQgYnkgYSBzZW1pY29sb24uCgpSZXBvcnRlZC1ieTogRWxpemFi
ZXRoIFBvbGdyZWVuIDxwb2xncmVlbkBhbWF6b24uZGU+ClNpZ25lZC1vZmYtYnk6IE5vcmJlcnQg
TWFudGhleSA8bm1hbnRoZXlAYW1hem9uLmRlPgotLS0KIHhlbi9jb21tb24vbWVtb3J5LmMgfCAy
ICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYg
LS1naXQgYS94ZW4vY29tbW9uL21lbW9yeS5jIGIveGVuL2NvbW1vbi9tZW1vcnkuYwppbmRleCA3
NTAxMGI3Li5lMjlkNTk2IDEwMDY0NAotLS0gYS94ZW4vY29tbW9uL21lbW9yeS5jCisrKyBiL3hl
bi9jb21tb24vbWVtb3J5LmMKQEAgLTM4Nyw3ICszODcsNyBAQCBpbnQgZ3Vlc3RfcmVtb3ZlX3Bh
Z2Uoc3RydWN0IGRvbWFpbiAqZCwgdW5zaWduZWQgbG9uZyBnbWZuKQogICAgICAgICBwdXRfcGFn
ZShwYWdlKTsKIAogICAgIHB1dF9wYWdlKHBhZ2UpOwotIG91dF9wdXRfZ2ZuOiBfX21heWJlX3Vu
dXNlZAorIG91dF9wdXRfZ2ZuOiBfX21heWJlX3VudXNlZDsKICAgICBwdXRfZ2ZuKGQsIGdtZm4p
OwogCiAgICAgLyoKLS0gCjIuNy40CgpBbWF6b24gRGV2ZWxvcG1lbnQgQ2VudGVyIEdlcm1hbnkg
R21iSApCZXJsaW4gLSBEcmVzZGVuIC0gQWFjaGVuCm1haW4gb2ZmaWNlOiBLcmF1c2Vuc3RyLiAz
OCwgMTAxMTcgQmVybGluCkdlc2NoYWVmdHNmdWVocmVyOiBEci4gUmFsZiBIZXJicmljaCwgQ2hy
aXN0aWFuIFNjaGxhZWdlcgpVc3QtSUQ6IERFMjg5MjM3ODc5CkVpbmdldHJhZ2VuIGFtIEFtdHNn
ZXJpY2h0IENoYXJsb3R0ZW5idXJnIEhSQiAxNDkxNzMgQgoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
