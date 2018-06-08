From: Juergen Gross <jgross@suse.com>
Subject: [PATCH] tools/libxencall: enforce proper alignment of
 hypercall buffers
Date: Fri,  8 Jun 2018 11:51:12 +0200
Message-ID: <20180608095112.27650-1-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=+jl5=i2=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1fRE3E-0004rk-Mn
 for xen-devel@lists.xenproject.org; Fri, 08 Jun 2018 09:51:20 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, wei.liu2@citrix.com, ian.jackson@eu.citrix.com
List-Id: xen-devel@lists.xenproject.org

eGVuY2FsbF9hbGxvY19idWZmZXIoKSBpcyB1c2VkIHRocm91Z2hvdXQgWGVuIHRvb2xzIGZvciBh
bGxvY2F0aW5nCmh5cGVyY2FsbCBidWZmZXJzLiBBbGxvY2F0aW9uIGlzIGRvbmUgYXQgcGFnZSBn
cmFudWxhcml0eS4gRm9yIHNpbXBsZQphZG1pbmlzdHJhdGlvbiBlYWNoIGFsbG9jYXRlZCBzZXQg
b2YgcGFnZXMgY29udGFpbnMgYSBzbWFsbCBoZWFkZXIKaG9sZGluZyB0aGUgbnVtYmVyIG9mIHBh
Z2VzIG9mIHRoYXQgc2V0LiBUaGUgaHlwZXJjYWxsIGJ1ZmZlciBpcwpsb2NhdGVkIGRpcmVjdGx5
IGFmdGVyIHRoZSA0IGJ5dGUgc2l6ZWQgaGVhZGVyLCBsZWFkaW5nIHRvIGEgd3JvbmcKYWxpZ25t
ZW50IGZvciBlLmcuIHBvaW50ZXJzLgoKUmVwYWlyIHRoYXQgYnkgdXNpbmcgYSAxNiBieXRlIHNp
emVkIGhlYWRlciBlbmZvcmNpbmcgdGhlIHNhbWUKYWxpZ25tZW50IGFzIG1hbGxvYygpLgoKU2ln
bmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgotLS0KTm90IHN1cmUg
d2hldGhlciB0aGlzIHdhbnRzIHRvIGJlIGJhY2twb3J0ZWQuIEluIGNhc2UgdGhlIGFuc3dlciBp
cwoieWVzIiBJIHRoaW5rIGl0IHNob3VsZCBiZSBwYXJ0IG9mIDQuMTEuCi0tLQogdG9vbHMvbGli
cy9jYWxsL2J1ZmZlci5jIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRp
ZmYgLS1naXQgYS90b29scy9saWJzL2NhbGwvYnVmZmVyLmMgYi90b29scy9saWJzL2NhbGwvYnVm
ZmVyLmMKaW5kZXggMmQ4ZmMyOWFjNi4uMGI2YWYyZGI2MCAxMDA2NDQKLS0tIGEvdG9vbHMvbGli
cy9jYWxsL2J1ZmZlci5jCisrKyBiL3Rvb2xzL2xpYnMvY2FsbC9idWZmZXIuYwpAQCAtMTUxLDYg
KzE1MSw3IEBAIHZvaWQgeGVuY2FsbF9mcmVlX2J1ZmZlcl9wYWdlcyh4ZW5jYWxsX2hhbmRsZSAq
eGNhbGwsIHZvaWQgKnAsIHNpemVfdCBucl9wYWdlcykKIAogc3RydWN0IGFsbG9jYXRpb25faGVh
ZGVyIHsKICAgICBpbnQgbnJfcGFnZXM7CisgICAgaW50IHBhZFszXTsKIH07CiAKIHZvaWQgKnhl
bmNhbGxfYWxsb2NfYnVmZmVyKHhlbmNhbGxfaGFuZGxlICp4Y2FsbCwgc2l6ZV90IHNpemUpCi0t
IAoyLjEzLjcKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
