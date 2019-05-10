From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH 09/14] xen: Introduce HAS_M2P config and use
 to protect mfn_to_gmfn call
Date: Fri, 10 May 2019 15:34:48 +0100
Message-ID: <16cea000-3b02-08f6-4b0e-2df1024ed245@arm.com>
References: <20190507151458.29350-1-julien.grall@arm.com>
 <20190507151458.29350-10-julien.grall@arm.com>
 <5CD56F04020000780022D80B@prv1-mh.provo.novell.com>
 <4f29c1a6-308b-eacf-002a-83a402d570b9@arm.com>
 <5CD57D71020000780022D8ED@prv1-mh.provo.novell.com>
 <3a359c40-ec6e-db96-b86e-17829c8ccf88@arm.com>
 <5CD5805F020000780022D939@prv1-mh.provo.novell.com>
 <9e696d26-0d3b-da9e-7427-f29da07dde7c@arm.com>
 <5CD58873020000780022D9FC@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=thpN=TK=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hP6bt-0003L6-P1
 for xen-devel@lists.xenproject.org; Fri, 10 May 2019 14:34:53 +0000
In-Reply-To: <5CD58873020000780022D9FC@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, oleksandr_tyshchenko@epam.com, xen-devel <xen-devel@lists.xenproject.org>, "andrii_anisov@epam.com" <andrii_anisov@epam.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

SGkgSmFuLAoKT24gMTAvMDUvMjAxOSAxNToxOSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24g
MTAuMDUuMTkgYXQgMTY6MDQsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4gd3JvdGU6Cj4+IE9uIDEw
LzA1LzIwMTkgMTQ6NDUsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4gT24gMTAuMDUuMTkgYXQg
MTU6NDEsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4gd3JvdGU6Cj4+Pj4gVGhlIHBvaW50IGhlcmUs
IHdlIGtlZXAgd2l0aGluIHRoZSBoeXBlcnZpc29yIHRoZSBpZGVhIG9mIHdoYXQncyB2YWxpZCBv
cgo+Pj4+IGludmFsaWQuIFRoaXMgYWxsb3dzIHVzIG1vcmUgZmxleGliaWxpdHkgb24gdGhlIHZh
bHVlIGhlcmUgKGltYWdpbmUgd2UgZGVjaWRlIHRvCj4+Pj4gY2hhbmdlIHRoZSB2YWx1ZSBvZiBH
Rk5fSU5WQUxJRCBpbiB0aGUgZnV0dXJlLi4uKS4KPj4+Cj4+PiBFeGFjdGx5LCBhbmQgaGVuY2Ug
SU5WQUxJRF9HRk4gc2hvdWxkIG5vdCBiZWNvbWUgdmlzaWJsZSB0byB0aGUKPj4+IG91dHNpZGUu
IEhlbmNlIG15IHJlcXVlc3QgdG8gdXNlIGFuIGFsbC1vbmVzIHZhbHVlIGhlcmUuCj4+IEl0IGlz
IG9ubHkgdmlzaWJsZSBpZiB5b3UgcHV0IGFuIGV4YWN0IHZhbHVlIGluIHRoZSBkb2N1bWVudGF0
aW9uLiBZb3VyCj4+IHN1Z2dlc3Rpb24gaXMgdG8gcHV0IGEgZXhhY3RseSB2YWx1ZSBhbmQgSSB3
b3VsZCByYXRoZXIgbm90IHNlZSB0aGF0Lgo+IAo+IEkgZGlkIHNwZWNpZmljYWxseSBzdWdnZXN0
IHRvIF9ub3RfIHN0b3JlIElOVkFMSURfR0ZOIGhlcmUsIGJ1dCB0bwo+IHN0b3JlIDY0LWJpdCBi
aXRzIG9mIG9uZXMuIE5vdGUgdGhlIGRpZmZlcmVuY2UgYmV0d2VlbiB0aGUgdHdvIG9uCj4gMzIt
Yml0IEFybS4KWW91ciBwb2ludCBvZiBoYXZpbmcgYW4gZXhhY3QgdmFsdWUgaXMgb25seSB1c2Vm
dWwgaWYgeW91IHdhbnQgdG8gdG9vbHN0YWNrIHRvIApzaWxlbnRseSBpZ25vcmUgdGhlIG1pc3Np
bmcgZnJhbWUgYW5kIGF2b2lkIGEgY2FsbC4KClRoZSBmb3JtZXIgaXMgcHJldHR5IG11Y2ggd3Jv
bmcgYXMgaWYgeW91IHdlcmUgdHJ5aW5nIHRvIHJlYWQgdGhlIGZyYW1lIHRoZW4gCm1vc3QgbGlr
ZWx5IHlvdSB3YW50ZWQgdG8gYWNjZXNzIGl0LiBTbyBhIG1lc3NhZ2UgbWFrZXMgc2Vuc2UgaGVy
ZS4KCkZvciB0aGUgbGF0dGVyLCBhdm9pZGluZyB0aGUgY2FsbCBpcyBvbmx5IGdvaW5nIHRvIHNh
dmUgeW91IGEgY291cGxlIG9mIGN5Y2xlcyAKaW4gYSBsaWtlbHkgY29sZCBwYXRoLgoKWW91IHJl
YWxseSBkb24ndCBuZWVkIHRvIGdpdmUgYW4gZXhhY3QgKGluY2x1ZGluZyBzYXkgYWxsIG9uZXMp
LiBZb3Ugb25seSBuZWVkIAp0byBzYXkgdGhhdCB0aGUgYWRkcmVzcyByZXR1cm4gbWF5IG5vdCBi
ZSBtYXBwYWJsZS4gVGhlIHRvb2xzdGFjayB3aWxsIHRyeSB0byAKbWFwIGl0IGFuZCBmYWlsLiBU
aGF0J3Mgbm90IGEgYmlnIGRlYWwuCgpBbnl3YXksIEkgd2lsbCB3YWl0IGFuZCBzZWUgd2hhdCdz
IHRoZSB2aWV3IGZyb20gdGhlIHRvb2xzIG1haW50YWluZXIuCgo+IAo+IFByZWZlcmFibHkgeWVz
OyBkZXBlbmRzIG9uIGhvdyBleGFjdGx5IHlvdSBjb2RlIHRoZSBhc3NlcnRpb24uCj4gSWYgeW91
IGZvbGxvdyB0aGUgaWYoKS1BU1NFUlRfVU5SRUFDSEFCTEUoKS1yZXR1cm4gc3R5bGUgd2UndmUK
PiBiZWVuIHVzaW5nIGVsc2V3aGVyZSwgdGhlbiBubyBtYXR0ZXIgaG93IHlvdSBwbGFjZSB0aGUg
I2Vsc2UKPiBvciAjZW5kaWYgdGhlIHByaW50aygpIHdpbGwgYmUgY29tcGlsZWQgb3V0LgoKSSB3
aWxsIGhhdmUgYSBsb29rLgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
