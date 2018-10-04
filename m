From: Paul Durrant <Paul.Durrant@citrix.com>
Subject: Re: [PATCH v14 4/9] iommu: don't domain_crash() inside
 iommu_map/unmap_page()
Date: Thu, 4 Oct 2018 16:36:28 +0000
Message-ID: <456a887cbf714c2f84c2548168df1b97@AMSPEX02CL03.citrite.net>
References: <20181004104547.32316-1-paul.durrant@citrix.com>
 <20181004104547.32316-5-paul.durrant@citrix.com>
 <37e5e689-110e-6bc4-1a54-8401d58dc282@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=mwgx=mq=citrix.com=prvs=808647837=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1g86c3-0003cB-Po
 for xen-devel@lists.xenproject.org; Thu, 04 Oct 2018 16:36:31 +0000
In-Reply-To: <37e5e689-110e-6bc4-1a54-8401d58dc282@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim (Xen.org)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, Ian Jackson <Ian.Jackson@citrix.com>
List-Id: xen-devel@lists.xenproject.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBHZW9yZ2UgRHVubGFwIFttYWls
dG86Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tXQ0KPiBTZW50OiAwNCBPY3RvYmVyIDIwMTggMTc6
MzANCj4gVG86IFBhdWwgRHVycmFudCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+OyB4ZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcNCj4gQ2M6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5j
b20+OyBTdGVmYW5vIFN0YWJlbGxpbmkNCj4gPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+OyBBbmRy
ZXcgQ29vcGVyIDxBbmRyZXcuQ29vcGVyM0BjaXRyaXguY29tPjsgSWFuDQo+IEphY2tzb24gPElh
bi5KYWNrc29uQGNpdHJpeC5jb20+OyBLb25yYWQgUnplc3p1dGVrIFdpbGsNCj4gPGtvbnJhZC53
aWxrQG9yYWNsZS5jb20+OyBUaW0gKFhlbi5vcmcpIDx0aW1AeGVuLm9yZz47IEp1biBOYWthamlt
YQ0KPiA8anVuLm5ha2FqaW1hQGludGVsLmNvbT47IEdlb3JnZSBEdW5sYXAgPEdlb3JnZS5EdW5s
YXBAY2l0cml4LmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MTQgNC85XSBpb21tdTogZG9u
J3QgZG9tYWluX2NyYXNoKCkgaW5zaWRlDQo+IGlvbW11X21hcC91bm1hcF9wYWdlKCkNCj4gDQo+
IE9uIDEwLzA0LzIwMTggMTE6NDUgQU0sIFBhdWwgRHVycmFudCB3cm90ZToNCj4gPiBUaGlzIHBh
dGNoIHJlbW92ZXMgdGhlIGltcGxpY2l0IGRvbWFpbl9jcmFzaCgpIGZyb20gaW9tbXVfbWFwKCks
DQo+ID4gdW5tYXBfcGFnZSgpIGFuZCBpb21tdV9pb3RsYl9mbHVzaCgpIGFuZCB0dXJucyB0aGVt
IGludG8gc3RyYWlnaHRmb3J3YXJkDQo+ID4gd3JhcHBlcnMgdGhhdCBjaGVjayB0aGUgZXhpc3Rl
bmNlIG9mIHRoZSByZWxldmFudCBpb21tdV9vcCBhbmQgY2FsbA0KPiA+IHRocm91Z2ggdG8gaXQu
IFRoaXMgbWFrZXMgdGhlbSB1c2FibGUgYnkgUFYgSU9NTVUgY29kZSB0byBiZSBkZWxpdmVyZWQN
Cj4gaW4NCj4gPiBmdXR1cmUgcGF0Y2hlcy4NCj4gDQo+IEhtbSwgYXBwYXJlbnRseSBJIGdhdmUg
dGhpcyBhbiBSLWIgYmVmb3JlLCBidXQgbm93IEknbSBub3QgdG90YWxseSBoYXBweQ0KPiB3aXRo
IGl0LiAgVGhlIHBvaW50IG9mIHB1dHRpbmcgdGhlIGRvbWFpbl9jcmFzaCgpIGluc2lkZSB0aG9z
ZSBmdW5jdGlvbnMNCj4gd2FzIGJlY2F1c2UgZm9yZ2V0dGluZyB0byBjcmFzaCB0aGUgZG9tYWlu
LCBwYXJ0aWN1bGFybHkgaW4gdGhlIGV2ZW50IG9mDQo+IGFuIHVubWFwIG9yIGEgZmx1c2gsIHdh
cyB2ZXJ5IGxpa2VseSB0byBiZSBhIHNlY3VyaXR5IGlzc3VlLg0KPiANCj4gV291bGQgaXQgYmUg
cG9zc2libGUgdG8gZWl0aGVyIGFkZCBhIGBtYXlmYWlsYCBwYXJhbWV0ZXIsIG9yIGEgbmV3DQo+
IGZ1bmN0aW9uIChpb21tdV9tYXBfbWF5ZmFpbCgpIG9yIHNvbWV0aGluZyksIHRoYXQgdGhlIFBW
IElPTU1VIGNvZGUNCj4gY291bGQgdXNlIGluc3RlYWQ/DQo+IA0KPiBJdCBsb29rcyBsaWtlIGdp
dCBpcyBjb21mb3J0YWJsZSBwdXR0aW5nIHRoaXMgcGF0Y2ggYXQgdGhlIGVuZDsgYWxsIHRoZQ0K
PiBvdGhlciBwYXRjaGVzIGxvb2sgbGlrZSB0aGV5IHByb2JhYmx5IGhhdmUgZW5vdWdoIGFja3Mg
dG8gZ28gaW4gd2hpbGUgd2UNCj4gZGlzY3VzcyB0aGlzIG9uZS4NCj4gDQoNCkkgc3RpbGwgdGhp
bmsgYW4gaW1wbGljaXQgZG9tYWluX2NyYXNoKCkgZG9lc24ndCByZWFsbHkgYmVsb25nIGluIHNv
bWV0aGluZyB0aGF0IGxvb2tzIGxpa2UgYSBzdHJhaWdodGZvcndhcmQgd3JhcHBlciBhcm91bmQg
YSBwZXItaW1wbGVtZW50YXRpb24ganVtcCB0YWJsZS4gSG93IGFib3V0IGlvbW11X21hcC91bm1h
cF9tYXlfY3Jhc2goKSBpbnN0ZWFkIHRvIGhpZ2hsaWdodCB0aGUgc2VtYW50aWM/DQoNCiAgUGF1
bA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
