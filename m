From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH] mm: fix LLVM code-generation issue
Date: Fri, 23 Nov 2018 13:15:03 +0100
Message-ID: <20181123121503.bpqfjqp5wz7goy4n@mac>
References: <a1236490-870a-bdac-2a79-0a487417713c@citrix.com>
 <20873c8e-a087-a414-e8fe-dde56ac05cb7@arm.com>
 <20181123112340.fb5jsjoqwmtd3khy@mac>
 <6A900FE40200004F0063616D@prv1-mh.provo.novell.com>
 <EED9718A020000A45C475325@prv1-mh.provo.novell.com>
 <07D102DD0200008F8E2C01CD@prv1-mh.provo.novell.com>
 <8B4AD5A1020000935C475325@prv1-mh.provo.novell.com>
 <84A23E9D020000170063616D@prv1-mh.provo.novell.com>
 <5BF7E5A002000078001FF5B6@prv1-mh.provo.novell.com>
 <34cc742e-3f66-b368-65e4-82d4b33ce4b1@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2k7W=OC=citrix.com=prvs=8582a9f6d=roger.pau@srs-us1.protection.inumbo.net>)
 id 1gQAMf-000146-SZ
 for xen-devel@lists.xenproject.org; Fri, 23 Nov 2018 12:15:17 +0000
Content-Disposition: inline
In-Reply-To: <34cc742e-3f66-b368-65e4-82d4b33ce4b1@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, george.dunlap@citrix.com, Tim Deegan <tim@xen.org>, Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBOb3YgMjMsIDIwMTggYXQgMTE6Mzk6MzJBTSArMDAwMCwgSnVsaWVuIEdyYWxsIHdy
b3RlOgo+IEhpIEphbiwKPiAKPiBPbiAyMy8xMS8yMDE4IDExOjMzLCBKYW4gQmV1bGljaCB3cm90
ZToKPiA+ID4gPiA+IE9uIDIzLjExLjE4IGF0IDEyOjIzLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+
IHdyb3RlOgo+ID4gPiBJbWFnZSBhbiBBUCByZWFkcyBzeXN0ZW1fc3RhdGUgPCBTWVNfU1RBVEVf
YWN0aXZlLCB0aGVuIEJTUCBzZXRzCj4gPiA+IHN5c3RlbV9zdGF0ZSA9IFNZU19TVEFURV9hY3Rp
dmUgYW5kIGNsZWFycyB0aGUgaW5pdCBtYXBwaW5ncywgdGhlbgo+ID4gPiB3aGVuIHRoZSBBUCB0
cmllcyB0byByZWFkIGFuIGluaXQgdmFyaWFibGUgaXQgd291bGQgZ2V0IGEgcGFnZSBmYXVsdC4K
PiA+IAo+ID4gQXMgc2FpZCBiZWZvcmUgLSBBUHMgYXJlIHN1cHBvc2VkIHRvIGJlIHF1aWVzY2Vu
dCBkdXJpbmcgdGhpcwo+ID4gcGFydGljdWxhciB0cmFuc2l0aW9uIG9mIHN5c3RlbV9zdGF0ZSwg
YW5kIHRoZSBpZGxlIHNjcnViYmluZyBhZGRlZAo+ID4gYW4gZXhjZXB0aW9uIHRvIHRoYXQgcnVs
ZS4gSSBkb24ndCBzZWUgd2h5IHN1Y2ggYW4gZXhjZXB0aW9uIG1heQo+ID4gbm90IGludm9sdmUg
ZXhjZXB0aW9uYWwgdHJlYXRtZW50IG9uIHRoZSBwYXJ0aWN1bGFyIHJlYWRpbmcgcGF0aC4KPiA+
IEZ1cnRoZXJtb3JlIEFQcywgd2hpY2ggbWF5IGFsc28gYmUgYnJvdWdodCB1cCBhdCBydW4gdGlt
ZSwgbWF5Cj4gPiBuZXZlciBldmVyIHRvdWNoIGluaXQgbWFwcGluZ3Mgb2YgYW55IGtpbmQuCj4g
Cj4gVGhlICJzdXBwb3NlZCIgaXMgcXVpdGUgd29ycnlpbmcgYmVjYXVzZSB3ZSBoYXZlIG5vIHdh
eSB0byB2ZXJpZnkgdGhhdAo+IGFzc3VtcHRpb24gdW50aWwgd2UgZ2V0IGEgcmFuZG9tIGNyYXNo
Lgo+IAo+IEFsc28sIHRoZSBjb3N0IG9mIHRoZSBiYXJyaWVyIHNob3VsZCBiZSBxdWl0ZSBjaGVh
cCBvdmVyIHRoZSByZXN0IG9mIHRoZSBmdW5jdGlvbi4KClJpZ2h0LCBidXQgdW5sZXNzIEknbSBt
aXNzaW5nIHNvbWV0aGluZyB0aGF0IHdvbid0IGNvbXBsZXRlbHkgZml4IHRoZQppc3N1ZSBlaXRo
ZXI/CgpUaGUgb25seSB3YXkgSSBzZWUgdG8gYmUgY29tcGxldGVseSBzYWZlIGlzIHRvIGVpdGhl
ciB1c2UgYSBtdXRleCBvcgp0byBtYWtlIG9wdF9ib290c2NydWIgbm9uLWluaXQuCgpSb2dlci4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
