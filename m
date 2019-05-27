From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH 1/5] pci: use pci_sbdf_t in pci_dev
Date: Mon, 27 May 2019 17:51:43 +0200
Message-ID: <20190527155143.khxljfjmq5lsdxxa@Air-de-Roger>
References: <20190510161056.48648-1-roger.pau@citrix.com>
 <20190510161056.48648-2-roger.pau@citrix.com>
 <5CE6BC680200007800231C8F@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BTdu=T3=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hVHup-0000YZ-9g
 for xen-devel@lists.xenproject.org; Mon, 27 May 2019 15:51:59 +0000
Content-Disposition: inline
In-Reply-To: <5CE6BC680200007800231C8F@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, xen-devel <xen-devel@lists.xenproject.org>, Brian Woods <brian.woods@amd.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBNYXkgMjMsIDIwMTkgYXQgMDk6Mjk6NDRBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDEwLjA1LjE5IGF0IDE4OjEwLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdy
b3RlOgo+ID4gLS0tIGEveGVuL2luY2x1ZGUveGVuL3BjaS5oCj4gPiArKysgYi94ZW4vaW5jbHVk
ZS94ZW4vcGNpLmgKPiA+IEBAIC04MCw5ICs4MCw4IEBAIHN0cnVjdCBwY2lfZGV2IHsKPiA+ICAg
ICAgc3RydWN0IGFyY2hfbXNpeCAqbXNpeDsKPiA+ICAKPiA+ICAgICAgc3RydWN0IGRvbWFpbiAq
ZG9tYWluOwo+ID4gLSAgICBjb25zdCB1MTYgc2VnOwo+ID4gLSAgICBjb25zdCB1OCBidXM7Cj4g
PiAtICAgIGNvbnN0IHU4IGRldmZuOwo+ID4gKwo+ID4gKyAgICBjb25zdCBwY2lfc2JkZl90IHNi
ZGY7Cj4gCj4gVG8gaGVscCB0aGUgdHJhbnNpdGlvbiwgZGlkIHlvdSBjb25zaWRlciBmaXJzdCBt
YWtpbmcgdGhpcyBhIHVuaW9uIG9mCj4gdGhlIGV4aXN0aW5nIGZpZWxkcyBhbmQgdGhlIG5ldyBv
bmUsIG5leHQgcmVwbGFjaW5nIHVzZWQgaW4gYSBwZXIKPiBjb21wb25lbnQgbWFubmVyIChzbyB0
aGF0IGluZGl2aWR1YWwgbWFpbnRhaW5lcnMgd291bGQgaGF2ZSB0bwo+IGxvb2sgYXQgc21hbGxl
ciBwYXRjaGVzIGVhY2ggb25seSksIGFuZCBmaW5hbGx5IGRyb3BwaW5nIHRoZSB1bmlvbgo+IGFu
ZCBpdHMgb2xkIGZpZWxkcz8KCk5vLCB0aGF0IGRpZG4ndCBvY2N1ciB0byBtZSBhbmQgaXQncyBp
bmRlZWQgbGlrZWx5IHRvIG1ha2UgdGhpcyBtdWNoCmxlc3MgcGFpbmZ1bC4gTXkgcGxhbiB3YXMg
dG8gc3dpdGNoIHRoaXMgaW4gb25lIGdvIGFkIGRvbmUgaW4gdGhpcwpzZXJpZXMsIGJ1dCB1c2lu
ZyBzdWNoIHVuaW9uIHdvdWxkIGFsbG93IGZvciBzbWFsbGVyIHBhdGNoZXMuCgpUaGFua3MsIFJv
Z2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
