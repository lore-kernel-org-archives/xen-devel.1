From: Paul Durrant <Paul.Durrant@citrix.com>
Subject: Re: [PATCH 2/5] iommu / x86: move call to
 scan_pci_devices() out of vendor code
Date: Tue, 14 May 2019 16:13:03 +0000
Message-ID: <9a476c95c1fb410b9330c45fa6799b9a@AMSPEX02CL03.citrite.net>
References: <20190508132403.1454-1-paul.durrant@citrix.com>
 <20190508132403.1454-3-paul.durrant@citrix.com>
 <5CD98EC4020000780022E421@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9bz0=TO=citrix.com=prvs=030a53c6a=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hQa39-0001YL-24
 for xen-devel@lists.xenproject.org; Tue, 14 May 2019 16:13:07 +0000
In-Reply-To: <5CD98EC4020000780022E421@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: 'Jan Beulich' <JBeulich@suse.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, xen-devel <xen-devel@lists.xenproject.org>, Brian Woods <brian.woods@amd.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IEphbiBCZXVsaWNoIFttYWlsdG86
SkJldWxpY2hAc3VzZS5jb21dCj4gU2VudDogMTMgTWF5IDIwMTkgMDg6MzYKPiBUbzogUGF1bCBE
dXJyYW50IDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT4KPiBDYzogQnJpYW4gV29vZHMgPGJyaWFu
Lndvb2RzQGFtZC5jb20+OyBTdXJhdmVlIFN1dGhpa3VscGFuaXQgPHN1cmF2ZWUuc3V0aGlrdWxw
YW5pdEBhbWQuY29tPjsgQW5kcmV3Cj4gQ29vcGVyIDxBbmRyZXcuQ29vcGVyM0BjaXRyaXguY29t
PjsgUm9nZXIgUGF1IE1vbm5lIDxyb2dlci5wYXVAY2l0cml4LmNvbT47IFdlaSBMaXUKPiA8d2Vp
LmxpdTJAY2l0cml4LmNvbT47IEtldmluIFRpYW4gPGtldmluLnRpYW5AaW50ZWwuY29tPjsgeGVu
LWRldmVsIDx4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc+Cj4gU3ViamVjdDogUmU6IFtQ
QVRDSCAyLzVdIGlvbW11IC8geDg2OiBtb3ZlIGNhbGwgdG8gc2Nhbl9wY2lfZGV2aWNlcygpIG91
dCBvZiB2ZW5kb3IgY29kZQo+IAo+ID4+PiBPbiAwOC4wNS4xOSBhdCAxNToyNCwgPHBhdWwuZHVy
cmFudEBjaXRyaXguY29tPiB3cm90ZToKPiA+IEl0J3Mgbm90IHZlbmRvciBzcGVjaWZpYyBzbyBp
dCBzaG91bGRuJ3QgcmVhbGx5IGJlIHRoZXJlLgo+IAo+IFBlcmhhcHMsIGJ1dCB0aGlzIG5lZWRz
IGJldHRlciBqdXN0aWZpY2F0aW9uOgo+IAo+ID4gLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91
Z2gvdnRkL2lvbW11LmMKPiA+ICsrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9pb21t
dS5jCj4gPiBAQCAtMjM3MiwxMCArMjM3Miw2IEBAIHN0YXRpYyBpbnQgX19pbml0IHZ0ZF9zZXR1
cCh2b2lkKQo+ID4gICAgICBQKGlvbW11X2hhcF9wdF9zaGFyZSwgIlNoYXJlZCBFUFQgdGFibGVz
Iik7Cj4gPiAgI3VuZGVmIFAKPiA+Cj4gPiAtICAgIHJldCA9IHNjYW5fcGNpX2RldmljZXMoKTsK
PiA+IC0gICAgaWYgKCByZXQgKQo+ID4gLSAgICAgICAgZ290byBlcnJvcjsKPiA+IC0KPiA+ICAg
ICAgcmV0ID0gaW5pdF92dGRfaHcoKTsKPiAKPiBFdmVuIGFmdGVyIHNvbWUgbG9va2luZyBhcm91
bmQsIGl0J3Mgbm90IG9idmlvdXMgdG8gbWUgdGhhdCB0aGUgbGF0dGVyCj4gY2FsbCBkb2Vzbid0
IGRlcGVuZCBvbiBQQ0kgZGV2aWNlcyBiZWluZyBrbm93biwgbW9yZSBzcGVjaWZpY2FsbHkKPiBz
ZWdtZW50IDAncyBidXMyYnJpZGdlW10gaGF2aW5nIGJlZW4gZmlsbGVkLiBOb3IgY2FuIEkgdGVs
bCB3aGV0aGVyCj4gdGhlcmUgd291bGQgYmUgc29tZSBub3RpY2VhYmxlIG1pc2JlaGF2aW9yIChw
cmlvciB0byBhbnkgZ3Vlc3RzCj4gc3RhcnRpbmcpIGlmIHRoZXJlIHdhcyBhIGRlcGVuZGVuY3kg
YW5kIGl0IGdvdCBicm9rZW4gYnkgdGhlIHJlLQo+IG9yZGVyaW5nLgoKSSBkb24ndCBzZWUgYW55
IGRlcGVuZGVuY3kgYnV0IHRoZSBjb2RlIGlzIHNvbWV3aGF0IHRhbmdsZWQuIFBlcmhhcHMgaXQg
d291bGQgYmUgYmV0dGVyIHRvIGJ1aWxkIHRoZSBQQ0kgdG9wb2xvZ3kgKmJlZm9yZSogSU9NTVUg
aW5pdCBhbmQgdGhlbiBpdGVyYXRlIG92ZXIgdGhlIHRoZSBkZXZpY2VzIGFmdGVyIGluaXQgdG8g
ZG8gdGhlIGdyb3VwIGFzc2lnbm1lbnQuIEkgY2VydGFpbmx5IGNhbid0IHNlZSBhbnl0aGluZyBp
biB0aGUgc2NhbiBhcyBpdCBzdGFuZHMgdGhhdCB3b3VsZCBuZWVkIHRoZSBJT01NVSB0byBoYXZl
IGJlZW4gaW5pdGlhbGl6ZWQuCgogIFBhdWwKCj4gCj4gSmFuCj4gCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
