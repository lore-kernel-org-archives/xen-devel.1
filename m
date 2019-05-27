From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH 3/5] pci: switch pci_conf_{read/write} to
 use pci_sbdf_t
Date: Mon, 27 May 2019 18:44:19 +0200
Message-ID: <20190527164419.oc75p6kmegiv3m7v@Air-de-Roger>
References: <20190510161056.48648-1-roger.pau@citrix.com>
 <20190510161056.48648-4-roger.pau@citrix.com>
 <5CE7C0F30200007800231EEB@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BTdu=T3=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hVIji-0005TG-LY
 for xen-devel@lists.xenproject.org; Mon, 27 May 2019 16:44:34 +0000
Content-Disposition: inline
In-Reply-To: <5CE7C0F30200007800231EEB@prv1-mh.provo.novell.com>
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

T24gRnJpLCBNYXkgMjQsIDIwMTkgYXQgMDQ6MDE6MjNBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDEwLjA1LjE5IGF0IDE4OjEwLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdy
b3RlOgo+ID4gLS0tIGEveGVuL2FyY2gveDg2L2NwdS9hbWQuYwo+ID4gKysrIGIveGVuL2FyY2gv
eDg2L2NwdS9hbWQuYwo+ID4gQEAgLTg1NSwyMCArODU5LDIyIEBAIHN0YXRpYyB2b2lkIF9uczE2
NTUwX3Jlc3VtZShzdHJ1Y3Qgc2VyaWFsX3BvcnQgKnBvcnQpCj4gPiAgewo+ID4gICNpZmRlZiBD
T05GSUdfSEFTX1BDSQo+ID4gICAgICBzdHJ1Y3QgbnMxNjU1MCAqdWFydCA9IHBvcnQtPnVhcnQ7
Cj4gPiArICAgIGNvbnN0IHBjaV9zYmRmX3Qgc2JkZiA9IHsKPiA+ICsgICAgICAgIC5idXMgPSB1
YXJ0LT5wc19iZGZbMF0sCj4gPiArICAgICAgICAuZGV2ID0gdWFydC0+cHNfYmRmWzFdLAo+ID4g
KyAgICAgICAgLmZ1bmMgPSB1YXJ0LT5wc19iZGZbMl0sCj4gPiArICAgIH07Cj4gCj4gSW4gY2Fz
ZXMgbGlrZSB0aGlzIG9uZSwgaXMgdGhlcmUgYW55IHBhcnRpY3VsYXIgcmVhc29uIHlvdSBkb24n
dCB1c2UgdGhlCj4gbWFjcm8geW91IGludHJvZHVjZT8KCkF0IGZpcnN0IEkgcHJlZmVycmVkIHRo
aXMgZXhwbGljaXQgZmllbGQgYmFzZWQgaW5pdGlhbGl6YXRpb24gYmVjYXVzZQppdCBtYWtlcyBp
dCBlYXNpZXIgdG8gcmVhZCBJTU8sIGJ1dCBJIHdpbGwgc3dpdGNoIHRvIHVzZSB0aGUgbWFjcm8u
Cgo+ID4gLS0tIGEveGVuL2luY2x1ZGUveGVuL3BjaS5oCj4gPiArKysgYi94ZW4vaW5jbHVkZS94
ZW4vcGNpLmgKPiA+IEBAIC01OCw2ICs1OCwxMSBAQCB0eXBlZGVmIHVuaW9uIHsKPiA+ICAgICAg
fTsKPiA+ICB9IHBjaV9zYmRmX3Q7Cj4gPiAgCj4gPiArI2RlZmluZSBQQ0lfU0JERl9UKHMsIGIs
IGQsIGYpIFwKPiA+ICsgICAgKChwY2lfc2JkZl90KSB7IC5zZWcgPSAocyksIC5idXMgPSAoYiks
IC5kZXYgPSAoZCksIC5mdW5jID0gKGYpIH0pCj4gCj4gSSdkIHByZWZlciBpZiB0aGUgX1Qgc3Vm
Zml4IGNvdWxkIGJlIG9taXR0ZWQuIEFmYWljcyB0aGVyZSdzIG5vIHVzZSBvZiB0aGUKPiBleGlz
dGluZyBQQ0lfU0JERigpIGFueXdoZXJlIGluIHRoZSB0cmVlLCBzbyB0aGlzIHNob3VsZCBiZSBm
aW5lLiBGb3IKPiB0aGUgMm5kIG1hY3JvIGJlbG93IEkgY2FuJ3QgZWFzaWx5IHRlbGwgd2hldGhl
ciB0aGUgZmV3IGV4aXN0aW5nIHVzZWQKPiBoYXZlIGFsbCBkaXNhcHBlYXJlZCBieSBub3csIGJ1
dCBpdCBzZWVtcyBsaWtlbHkuCgpJIGNhbiBzZWUgYWJvdXQgZHJvcHBpbmcgdGhlIF9UIHN1ZmZp
eCwgYnV0IEkgdGhpbmsgdGhlcmUncyBsaWtlbHkKc29tZSBvdmVybGFwIGJldHdlZW4gdGhlIGlu
dHJvZHVjdGlvbiBvZiBQQ0lfU0JERl9UIGFuZCB0aGUgbGFzdCB1c2VyCm9mIHRoZSBjdXJyZW50
IFBDSV9TQkRGIGhlbHBlcnMsIHNvIG1heWJlIGl0J3MgZmluZSB0byB1c2UgdGhlIF9UCnN1ZmZp
eCBhdCBmaXJzdCBhbmQgaGF2ZSBvbmUgZmluYWwgcGF0Y2ggdGhhdCByZW1vdmVzIGl0PwoKPiBB
bHNvIEknbSBhZnJhaWQgaW5pdGlhbGl6ZXJzIG9mIHRoaXMga2luZCB3aWxsIGJyZWFrIHRoZSBi
dWlsZCB3aXRoIG9sZCBnY2MuCgpJIHRob3VnaHQgd2UgZHJvcHBlZCBzdXBwb3J0IGZvciBzdWNo
IG9sZCB2ZXJzaW9ucyBvZiBnY2MsIGlzIHRoYXQgbm90CnRoZSBjYXNlPwoKSWYgbm90IHRoaXMg
aXMgYWxsIGEgbm8tZ28uCgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
