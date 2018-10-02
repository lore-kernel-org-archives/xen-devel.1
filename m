From: "Suthikulpanit, Suravee" <Suravee.Suthikulpanit@amd.com>
Subject: Re: [PATCH v2 2/2] amd/iommu: remove hidden AMD
 inclusive mappings
Date: Tue, 2 Oct 2018 11:04:25 +0000
Message-ID: <39b07782-32f8-e8d2-1ec5-01cb3a15c091@amd.com>
References: <20181002080836.76712-1-roger.pau@citrix.com>
 <20181002080836.76712-2-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=idwg=mo=amd.com=suravee.suthikulpanit@srs-us1.protection.inumbo.net>)
 id 1g7IY2-0005Tc-2v
 for xen-devel@lists.xenproject.org; Tue, 02 Oct 2018 11:09:02 +0000
In-Reply-To: <20181002080836.76712-2-roger.pau@citrix.com>
Content-Language: en-US
Content-ID: <8390B7B05D9C594283CC728BF0F58DD7@namprd12.prod.outlook.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Kevin Tian <kevin.tian@intel.com>, Paul Durrant <paul.durrant@citrix.com>, "Woods, Brian" <Brian.Woods@amd.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

Um9nZXIsDQoNCk9uIDEwLzIvMTggMzowOCBQTSwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOg0KPiBB
bmQganVzdCByZWx5IG9uIGFyY2hfaW9tbXVfaHdkb21faW5pdCB0byBzZXR1cCB0aGUgY29ycmVj
dCBpbmNsdXNpdmUNCj4gbWFwcGluZ3MgYXMgaXQncyBkb25lIGZvciBJbnRlbC4NCj4gDQo+IEFN
RCBoYXMgY29kZSBpbiBhbWRfaW9tbXVfaHdkb21faW5pdCB0byBzZXR1cCBpbmNsdXNpdmUgbWFw
cGluZ3MgdXAgdG8NCj4gbWF4X3BkeCwgcmVtb3ZlIHRoaXMgc2luY2UgaXQncyBub3cgYSBkdXBs
aWNhdGlvbiBvZg0KPiBhcmNoX2lvbW11X2h3ZG9tX2luaXQuIE5vdGUgdGhhdCBBTUQgbWFwcGVk
IGV2ZXJ5IHBhZ2Ugd2l0aCBhIHZhbGlkDQo+IG1mbiB1cCB0byBtYXhfcGR4LCBhcmNoX2lvbW11
X2h3ZG9tX2luaXQgd2lsbCBvbmx5IGRvIHNvIGZvciBtZW1vcnkNCj4gYmVsb3cgNEdCLCBzbyB0
aGlzIGlzIGEgZnVuY3Rpb25hbCBjaGFuZ2UgZm9yIEFNRC4NCj4gDQo+IE1vdmUgdGhlIGRlZmF1
bHQgc2V0dGluZyBvZiBpb21tdV9od2RvbV97aW5jbHVzaXZlL3Jlc2VydmVkfSB0bw0KPiBhcmNo
X2lvbW11X2h3ZG9tX2luaXQgc2luY2UgdGhlIGRlZmF1bHRzIGFyZSBub3cgdGhlIHNhbWUgZm9y
IGJvdGgNCj4gSW50ZWwgYW5kIEFNRC4NCj4gDQo+IFJlcG9ydGVkLWJ5OiBQYXVsIER1cnJhbnQg
PHBhdWwuZHVycmFudEBjaXRyaXguY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9u
bsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4NCj4gUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxq
YmV1bGljaEBzdXNlLmNvbT4NCj4gUmV2aWV3ZWQtYnk6IEtldmluIFRpYW4gPGtldmluLnRpYW5A
aW50ZWwuY29tPg0KPiAtLS0NCj4gQ2M6IFN1cmF2ZWUgU3V0aGlrdWxwYW5pdCA8c3VyYXZlZS5z
dXRoaWt1bHBhbml0QGFtZC5jb20+DQo+IENjOiBCcmlhbiBXb29kcyA8YnJpYW4ud29vZHNAYW1k
LmNvbT4NCj4gQ2M6IEtldmluIFRpYW4gPGtldmluLnRpYW5AaW50ZWwuY29tPg0KPiBDYzogSmFu
IEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiBDYzogUGF1bCBEdXJyYW50IDxwYXVsLmR1
cnJhbnRAY2l0cml4LmNvbT4NCj4gLS0tDQo+ICAgeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1k
L3BjaV9hbWRfaW9tbXUuYyB8IDM5IC0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiAgIHhlbi9kcml2
ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9pb21tdS5jICAgICAgICAgfCAgNyAtLS0tDQo+ICAgeGVuL2Ry
aXZlcnMvcGFzc3Rocm91Z2gveDg2L2lvbW11LmMgICAgICAgICB8ICA4ICsrKystDQo+ICAgMyBm
aWxlcyBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDQ3IGRlbGV0aW9ucygtKQ0KPiANCg0KQWNr
ZWQtYnk6IFN1cmF2ZWUgU3V0aGlrdWxwYW5pdCA8c3VyYXZlZS5zdXRoaWt1cGFuaXRAYW1kLmNv
bT4NCg0KVGhhbmtzLA0KU3VyYXZlZQ0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
