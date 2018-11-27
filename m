From: Paul Durrant <paul.durrant@citrix.com>
Subject: [PATCH] tools/libs: xenforeignmemory_unmap_resource()
 should be idempotent...
Date: Tue, 27 Nov 2018 16:39:17 +0000
Message-ID: <20181127163917.17759-1-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=MIvs=OG=citrix.com=prvs=8623b3373=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1gRgP2-0005iH-JN
 for xen-devel@lists.xenproject.org; Tue, 27 Nov 2018 16:40:00 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul.durrant@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <Ian.Jackson@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Li4uYW5kIGlzIG5vdCBiZWNhdXNlIGxpbnV4IG9zZGVwX3hlbmZvcmVpZ25tZW1vcnlfdW5tYXBf
cmVzb3VyY2UoKSBpcyBub3QuCgpSZXBvcnRlZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNv
b3BlcjNAY2l0cml4LmNvbT4KU2lnbmVkLW9mZi1ieTogUGF1bCBEdXJyYW50IDxwYXVsLmR1cnJh
bnRAY2l0cml4LmNvbT4KLS0tCkNjOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRy
aXguY29tPgpDYzogSWFuIEphY2tzb24gPElhbi5KYWNrc29uQGNpdHJpeC5jb20+CkNjOiBXZWkg
TGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgoKVGhpcyBpcyBhbiBhbHRlcm5hdGl2ZSB0byB0aGUg
c2ltaWxhcmx5IG5hbWVkIHBhdGNoIHBvc3RlZCBieSBBbmRyZXcuIFRoaXMKb25lIGZpeGVzIHRo
ZSB1bmRlcmx5aW5nIGlzc3VlIGluIHRoZSBvc2RlcCBpbXBsZW1lbnRhdGlvbi4KQW5kcmV3IHJl
cXVlc3RlZCB0aGlzIGJlIGJhY2twb3J0ZWQgdG8gNC4xMS4KLS0tCiB0b29scy9saWJzL2ZvcmVp
Z25tZW1vcnkvbGludXguYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
MSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnMvZm9yZWlnbm1lbW9yeS9saW51
eC5jIGIvdG9vbHMvbGlicy9mb3JlaWdubWVtb3J5L2xpbnV4LmMKaW5kZXggMTMyODc1ZGY4YS4u
OGRhYTU4MjhlMyAxMDA2NDQKLS0tIGEvdG9vbHMvbGlicy9mb3JlaWdubWVtb3J5L2xpbnV4LmMK
KysrIGIvdG9vbHMvbGlicy9mb3JlaWdubWVtb3J5L2xpbnV4LmMKQEAgLTI5OCw3ICsyOTgsNyBA
QCBpbnQgb3NkZXBfeGVuZm9yZWlnbm1lbW9yeV9yZXN0cmljdCh4ZW5mb3JlaWdubWVtb3J5X2hh
bmRsZSAqZm1lbSwKIGludCBvc2RlcF94ZW5mb3JlaWdubWVtb3J5X3VubWFwX3Jlc291cmNlKAog
ICAgIHhlbmZvcmVpZ25tZW1vcnlfaGFuZGxlICpmbWVtLCB4ZW5mb3JlaWdubWVtb3J5X3Jlc291
cmNlX2hhbmRsZSAqZnJlcykKIHsKLSAgICByZXR1cm4gbXVubWFwKGZyZXMtPmFkZHIsIGZyZXMt
Pm5yX2ZyYW1lcyA8PCBQQUdFX1NISUZUKTsKKyAgICByZXR1cm4gZnJlcyA/IG11bm1hcChmcmVz
LT5hZGRyLCBmcmVzLT5ucl9mcmFtZXMgPDwgUEFHRV9TSElGVCkgOiAwOwogfQogCiBpbnQgb3Nk
ZXBfeGVuZm9yZWlnbm1lbW9yeV9tYXBfcmVzb3VyY2UoCi0tIAoyLjExLjAKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
