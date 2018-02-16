From: Dario Faggioli <dfaggioli@suse.com>
Subject: [PATCH v2] tools: libxenstat: fix format string overflow
Date: Fri, 16 Feb 2018 19:38:48 +0100
Message-ID: <151880632858.7225.12179941056303264938.stgit@Solace.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=20ul=fk=gmail.com=raistlin.df@srs-us1.protection.inumbo.net>)
 id 1emkuR-0002sk-0q
 for xen-devel@lists.xenproject.org; Fri, 16 Feb 2018 18:38:59 +0000
Received: by mail-wm0-f67.google.com with SMTP id r71so4837633wmd.1
 for <xen-devel@lists.xenproject.org>; Fri, 16 Feb 2018 10:38:52 -0800 (PST)
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

V2l0aCBnY2MgNy4zLjAsIHRoZSBidWlsZCBmYWlscyBsaWtlIHRoaXM6CgpzcmMveGVuc3RhdF9s
aW51eC5jOiBJbiBmdW5jdGlvbiDigJhnZXRCcmlkZ2XigJkKc3JjL3hlbnN0YXRfbGludXguYzo3
ODozNDogd2FybmluZzog4oCYJXPigJkgZGlyZWN0aXZlIHdyaXRpbmcgdXAgdG8gMjU1IGJ5dGVz
IGludG8gYSByZWdpb24gb2Ygc2l6ZSAyNDEgWy1XZm9ybWF0LW92ZXJmbG93PV0KICAgICBzcHJp
bnRmKHRtcCwgIi9zeXMvY2xhc3MvbmV0LyVzL2JyaWRnZSIsIGRlLT5kX25hbWUpOwogICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgXn4Kc3JjL3hlbnN0YXRfbGludXguYzo3ODo1OiBu
b3RlOiDigJhzcHJpbnRm4oCZIG91dHB1dCBiZXR3ZWVuIDIzIGFuZCAyNzggYnl0ZXMgaW50byBh
IGRlc3RpbmF0aW9uIG9mIHNpemUgMjU2CiAgICAgc3ByaW50Zih0bXAsICIvc3lzL2NsYXNzL25l
dC8lcy9icmlkZ2UiLCBkZS0+ZF9uYW1lKTsKICAgICBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+CgpGaXggYnkgbWFraW5nIHRoZSBidWZmZXIgYmln
Z2VyLgoKU2lnbmVkLW9mZi1ieTogRGFyaW8gRmFnZ2lvbGkgPGRmYWdnaW9saUBzdXNlLmNvbT4K
LS0tCkNjOiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KQ2M6IFdlaSBM
aXUgPHdlaS5saXUyQGNpdHJpeC5jb20+CkNjOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVy
M0BjaXRyaXguY29tPgotLS0KQ2hhbmdlcyBmcm9tIHYxOgotIGluY3JlYXNlIHRoZSBidWZmZXIg
aXN0ZWFkIG9mIHVzaW5nIGFzcHJpbnRmKCkuCi0tLQogdG9vbHMveGVuc3RhdC9saWJ4ZW5zdGF0
L3NyYy94ZW5zdGF0X2xpbnV4LmMgfCAgICAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS90b29scy94ZW5zdGF0L2xpYnhlbnN0
YXQvc3JjL3hlbnN0YXRfbGludXguYyBiL3Rvb2xzL3hlbnN0YXQvbGlieGVuc3RhdC9zcmMveGVu
c3RhdF9saW51eC5jCmluZGV4IDkwN2Q2NWZhNjMuLjdjZGQzYmY5MWYgMTAwNjQ0Ci0tLSBhL3Rv
b2xzL3hlbnN0YXQvbGlieGVuc3RhdC9zcmMveGVuc3RhdF9saW51eC5jCisrKyBiL3Rvb2xzL3hl
bnN0YXQvbGlieGVuc3RhdC9zcmMveGVuc3RhdF9saW51eC5jCkBAIC02OSw3ICs2OSw3IEBAIHZv
aWQgZ2V0QnJpZGdlKGNoYXIgKmV4Y2x1ZGVOYW1lLCBjaGFyICpyZXN1bHQsIHNpemVfdCByZXN1
bHRMZW4pCiAJc3RydWN0IGRpcmVudCAqZGU7CiAJRElSICpkOwogCi0JY2hhciB0bXBbMjU2XSA9
IHsgMCB9OworCWNoYXIgdG1wWzUxMl0gPSB7IDAgfTsKIAogCWQgPSBvcGVuZGlyKCIvc3lzL2Ns
YXNzL25ldCIpOwogCXdoaWxlICgoZGUgPSByZWFkZGlyKGQpKSAhPSBOVUxMKSB7CgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
