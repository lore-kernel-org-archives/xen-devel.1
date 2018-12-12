From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: Interrupt injection with ISR set on Intel hardware
Date: Wed, 12 Dec 2018 13:17:30 +0100
Message-ID: <20181212121730.kprvmtyhrwyhm62t@mac>
References: <20181015103015.cyvld52tngd4d3qy@mac.bytemobile.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19BE9DA20@SHSMSX101.ccr.corp.intel.com>
 <20181212112436.dtnd6sum5mztleih@mac>
 <AADFC41AFE54684AB9EE6CBC0274A5D19BE9DB2A@SHSMSX101.ccr.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9xWB=OV=citrix.com=prvs=87720dd39=roger.pau@srs-us1.protection.inumbo.net>)
 id 1gX3SP-0000NT-6Q
 for xen-devel@lists.xenproject.org; Wed, 12 Dec 2018 12:17:41 +0000
Content-Disposition: inline
In-Reply-To: <AADFC41AFE54684AB9EE6CBC0274A5D19BE9DB2A@SHSMSX101.ccr.corp.intel.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "Tian, Kevin" <kevin.tian@intel.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, "Nakajima, Jun" <jun.nakajima@intel.com>, Jan Beulich <JBeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBEZWMgMTIsIDIwMTggYXQgMTE6NDg6NTJBTSArMDAwMCwgVGlhbiwgS2V2aW4gd3Jv
dGU6Cj4gPiBGcm9tOiBSb2dlciBQYXUgTW9ubsOpIFttYWlsdG86cm9nZXIucGF1QGNpdHJpeC5j
b21dCj4gPiBTZW50OiBXZWRuZXNkYXksIERlY2VtYmVyIDEyLCAyMDE4IDc6MjUgUE0KPiA+IAo+
ID4gT24gV2VkLCBEZWMgMTIsIDIwMTggYXQgMTA6MzY6NDRBTSArMDAwMCwgVGlhbiwgS2V2aW4g
d3JvdGU6Cj4gPiA+ID4gRnJvbTogUm9nZXIgUGF1IE1vbm7DqSBbbWFpbHRvOnJvZ2VyLnBhdUBj
aXRyaXguY29tXQo+ID4gPiA+IFNlbnQ6IE1vbmRheSwgT2N0b2JlciAxNSwgMjAxOCA2OjMwIFBN
Cj4gPiA+ID4gKFhFTikgICBbMjI2NDJdIFBPV0VSICAgIFRZUEUgNAo+ID4gPiA+IChYRU4pICAg
WzIyNjQzXSBJRExFICAgICBQUFIgMHgwMDAwMDAyMAo+ID4gPiA+IChYRU4pICAgICAgICAgICAg
ICAgICAgICBJUlIKPiA+ID4gPgo+ID4gMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAKPiA+ID4gPiAwMAo+ID4gPiA+IChYRU4pICAg
ICAgICAgICAgICAgICAgICBJU1IKPiA+ID4gPgo+ID4gMDAwMDAwMDAwMjAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAKPiA+ID4gPiAwMAo+ID4gPiA+
IChYRU4pICAgWzIyNjQ0XSBXQUtFICAgICBQUFIgMHgwMDAwMDAyMAo+ID4gPiA+IChYRU4pICAg
ICAgICAgICAgICAgICAgICBJUlIKPiA+ID4gPgo+ID4gMDAwMDAwMDAwMjAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAKPiA+ID4gPiAwMAo+ID4gPiA+
IChYRU4pICAgICAgICAgICAgICAgICAgICBJU1IKPiA+ID4gPgo+ID4gMDAwMDAwMDAwMjAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAKPiA+ID4gPiAw
MAo+ID4gPgo+ID4gPiBsb29rcyBwZW5kaW5nIElSUiAoMHgyMSkgZG9lc24ndCBhbHdheXMgdHJp
Z2dlciBhIHNwdXJpb3VzIGludGVycnVwdD8KPiA+IAo+ID4gWWVzLCB0aGF0J3MgY29ycmVjdC4g
SGF2aW5nIGEgcGVuZGluZyBJUlIgYW5kIGdvaW5nIGlkbGUgZG9lc24ndAo+ID4gYWx3YXlzIHRy
aWdnZXIgdGhlIHNwdXJpb3VzIGludGVycnVwdCByZS1pbmplY3Rpb24uCj4gPiAKPiA+ID4gaXMg
aXQgYSBmaXhlZCBwYXR0ZXJuIGFmdGVyIGhvdyBtYW55IHJvdW5kcyBvZiBDc3RhdGUgZW50ZXIv
ZXhpdCB3aXRoCj4gPiA+IHBlbmRpbmcgSVJSKDB4MjEpIHRoZW4geW91IHNlZSBhc3NlcnRpb24g
aGFwcGVuZWQgKGluIHRoaXMgZXhhbXBsZQo+ID4gPiBpdCBoYXBwZW5zIGF0IDNyZCB0aW1lKT8K
PiA+IAo+ID4gSXQncyBub3QgYSBmaXhlZCBwYXR0ZXJuLCBoZXJlJ3MgYW5vdGhlciB0cmFjZSB3
aXRoIElSUigweDIxKSBiZWluZwo+ID4gcGVuZGluZyBqdXN0IG9uY2UgZHVyaW5nIHRoZSBDc3Rh
dGUgdHJhbnNpdGlvbnM6Cj4gCj4gZGlkIHlvdSBvYnNlcnZlIGEgY2FzZSB3aGVyZSBzdWNoIGFz
c2V0IG1heSBvY2N1ciB3aGVuIElSUigweDIxKQo+IGlzIGNsZWFyZWQgYnV0IElTUiAoMHgyMSkg
aXMgc2V0PwoKTm8sIEkndmUgYWx3YXlzIHNlZW4gYm90aCBJU1IgYW5kIElSUiBzZXQgd2hlbiB0
aGUgaW50ZXJydXB0IGluamVjdGlvbgpoYXBwZW5zLiBUaGlzIG9mIGNvdXJzZSBkb2Vzbid0IG1l
YW4gaXQncyBub3QgcG9zc2libGUsIGJ1dCBJIGhhdmUgbm90CnNlZW4gYW55IHRyYWNlIHdpdGgg
SVNSKDB4MjEpIHNldCBhbmQgSVJSKDB4MjEpIGNsZWFyLgoKVGhhbmtzLCBSb2dlci4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
