From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH 1/2] guest/pvh: fix handling of multiboot
 info and module list
Date: Mon, 12 Nov 2018 16:17:16 +0100
Message-ID: <20181112151716.j35hs224xqww3zdq@mac.citrite.net>
References: <20181109172250.12894-1-roger.pau@citrix.com>
 <20181109172250.12894-2-roger.pau@citrix.com>
 <5BE955D502000078001FAC06@prv1-mh.provo.novell.com>
 <20181112114909.rovrjxp2ynrlgx2n@mac.citrite.net>
 <5BE974B502000078001FAF6F@prv1-mh.provo.novell.com>
 <20181112150006.qzk6gmxzevg5hgnv@mac.citrite.net>
 <5BE9987802000078001FB0D1@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=dr1o=nx=citrix.com=prvs=847277b8a=roger.pau@srs-us1.protection.inumbo.net>)
 id 1gMDxx-0006ft-Sq
 for xen-devel@lists.xenproject.org; Mon, 12 Nov 2018 15:17:29 +0000
Content-Disposition: inline
In-Reply-To: <5BE9987802000078001FB0D1@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBOb3YgMTIsIDIwMTggYXQgMDg6MTI6NTZBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDEyLjExLjE4IGF0IDE2OjAwLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdy
b3RlOgo+ID4gWWVzLCBpdCdzIG9ubHkgdGhlIG1vZHVsZSBsaXN0IHRoYXQncyBwYXNzZWQgYnkg
cGh5c2ljYWwgYWRkcmVzcyBhbmQKPiA+IHRoZW4gbWFwcGVkIHVzaW5nIF9fdmEuIEhvdyBhYm91
dCB0aGUgZm9sbG93aW5nIGRlc2NyaXB0aW9uOgo+ID4gCj4gPiAiV2hlbiBib290aW5nIFhlbiBh
cyBhIFBWSCBndWVzdCB0aGUgZGF0YSBpbiB0aGUgUFZIIHN0YXJ0IGluZm8KPiA+IHN0cnVjdHVy
ZSBpcyBjb3BpZWQgb3ZlciB0byBhIG11bHRpYm9vdCBzdHJ1Y3R1cmUgYW5kIGEgbW9kdWxlIGxp
c3QKPiA+IGFycmF5IHRoYXQgcmVzaWRlcyBpbiB0aGUgLmluaXQgc2VjdGlvbiBvZiB0aGUgWGVu
IGltYWdlLiBUaGUKPiA+IHJlc3VsdGluZyBtdWx0aWJvb3QgbW9kdWxlIGxpc3QgaXMgdGhlbiBo
YW5kZWQgdG8gdGhlIGdlbmVyaWMgYm9vdAo+ID4gcHJvY2VzcyB1c2luZyB0aGUgcGh5c2ljYWwg
YWRkcmVzcyBpbiBtYmktPm1vZHNfYWRkci4KPiA+IAo+ID4gVGhpcyB3b3JrcyBmaW5lIGFzIGxv
bmcgYXMgdGhlIFhlbiBpbWFnZSBkb2Vzbid0IHJlbG9jYXRlIGl0c2VsZiwgaWYKPiA+IHRoZXJl
J3Mgc3VjaCBhIHJlbG9jYXRpb24gdGhlIHBoeXNpY2FsIGFkZHJlc3NlcyBvZiBtdWx0aWJvb3Qg
bW9kdWxlCj4gPiBsaXN0IGlzIG5vIGxvbmdlciB2YWxpZC4KPiA+IAo+ID4gRml4IHRoaXMgYnkg
aGFuZGluZyB0aGUgdmlydHVhbCBhZGRyZXNzIG9mIHRoZSBtb2R1bGUgbGlzdCB0byB0aGUKPiA+
IGdlbmVyaWMgYm9vdCBwcm9jZXNzIGluc3RlYWQgb2YgaXQncyBwaHlzaWNhbCBhZGRyZXNzLiIK
PiAKPiBTb3VuZHMgZmluZS4gQnV0IGRpZG4ndCBTZXJnZXkgc3BvdCB0d28gcmVnaW9ucyB0aGF0
IHdlcmUgbm90Cj4gdGFrZW4gY2FyZSBvZj8gT3IgaXMgdGhlIG90aGVyIHBhcnQgZGVhbHQgd2l0
aCBpbiBwYXRjaCAyPwoKSUlSQyB0aGUgb3RoZXIgb25lIHdhcyB0aGUgbW9kdWxlKHMpIGNvbW1h
bmQgbGluZSwgd2hpY2ggYXJlIHJlbG9jYXRlZAppbiB0aGUgbG93IDFNQiBieSBwdmhfaW5mb19y
ZWxvYyB3aGljaCBzaG91bGQgYmUgZml4ZWQgYnkgcGF0Y2ggIzIuCgpUaGFua3MsIFJvZ2VyLgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
