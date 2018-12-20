From: Paul Durrant <Paul.Durrant@citrix.com>
Subject: Re: [PATCH v5 1/4] amd-iommu: add flush iommu_ops
Date: Thu, 20 Dec 2018 22:24:02 +0000
Message-ID: <22ccfa48f38b44528b17357e121ccf31@AMSPEX02CL03.citrite.net>
References: <20181217092259.19762-1-paul.durrant@citrix.com>,
 <20181217092259.19762-2-paul.durrant@citrix.com>
 <CY4PR12MB176842B86D122A2A5FD4580CE5BF0@CY4PR12MB1768.namprd12.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=iZSg=O5=citrix.com=prvs=88558fdb8=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1ga6jq-00020B-M4
 for xen-devel@lists.xenproject.org; Thu, 20 Dec 2018 22:24:18 +0000
In-Reply-To: <CY4PR12MB176842B86D122A2A5FD4580CE5BF0@CY4PR12MB1768.namprd12.prod.outlook.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "'Woods, Brian'" <Brian.Woods@amd.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, "Suthikulpanit, Suravee" <Suravee.Suthikulpanit@amd.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBYZW4tZGV2ZWwgW21haWx0bzp4
ZW4tZGV2ZWwtYm91bmNlc0BsaXN0cy54ZW5wcm9qZWN0Lm9yZ10gT24gQmVoYWxmDQo+IE9mIFdv
b2RzLCBCcmlhbg0KPiBTZW50OiAyMCBEZWNlbWJlciAyMDE4IDE5OjQ2DQo+IFRvOiBQYXVsIER1
cnJhbnQgPFBhdWwuRHVycmFudEBjaXRyaXguY29tPjsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnDQo+IENjOiBBbmRyZXcgQ29vcGVyIDxBbmRyZXcuQ29vcGVyM0BjaXRyaXguY29tPjsg
V2VpIExpdQ0KPiA8d2VpLmxpdTJAY2l0cml4LmNvbT47IFN1dGhpa3VscGFuaXQsIFN1cmF2ZWUN
Cj4gPFN1cmF2ZWUuU3V0aGlrdWxwYW5pdEBhbWQuY29tPjsgUm9nZXIgUGF1IE1vbm5lIDxyb2dl
ci5wYXVAY2l0cml4LmNvbT4NCj4gU3ViamVjdDogUmU6IFtYZW4tZGV2ZWxdIFtQQVRDSCB2NSAx
LzRdIGFtZC1pb21tdTogYWRkIGZsdXNoIGlvbW11X29wcw0KPiANCj4gRnJvbTogUGF1bCBEdXJy
YW50IDxwYXVsLmR1cnJhbnRAY2l0cml4LmNvbT4NCj4gU2VudDogTW9uZGF5LCBEZWNlbWJlciAx
NywgMjAxOCAzOjIyIEFNDQo+IFRvOiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcNCj4g
Q2M6IFBhdWwgRHVycmFudDsgU3V0aGlrdWxwYW5pdCwgU3VyYXZlZTsgV29vZHMsIEJyaWFuOyBB
bmRyZXcgQ29vcGVyOyBXZWkNCj4gTGl1OyBSb2dlciBQYXUgTW9ubsOpDQo+IFN1YmplY3Q6IFtQ
QVRDSCB2NSAxLzRdIGFtZC1pb21tdTogYWRkIGZsdXNoIGlvbW11X29wcw0KPiANCj4gVGhlIGlv
bW11X29wcyBzdHJ1Y3R1cmUgY29udGFpbnMgdHdvIG1ldGhvZHMgZm9yIGZsdXNoaW5nOiAnaW90
bGJfZmx1c2gnDQo+IGFuZA0KPiAnaW90bGJfZmx1c2hfYWxsJy4gVGhpcyBwYXRjaCBhZGRzIGlt
cGxlbWVudGF0aW9ucyBvZiB0aGVzZSBmb3IgQU1EDQo+IElPTU1Vcy4NCj4gDQo+IFRoZSBpb3Rs
Yl9mbHVzaCBtZXRob2QgdGFrZXMgYSBiYXNlIERGTiBhbmQgYSAoNGspIHBhZ2UgY291bnQsIGJ1
dCB0aGUNCj4gZmx1c2ggbmVlZHMgdG8gYmUgZG9uZSBieSBwYWdlIG9yZGVyIChpLmUuIDAsIDkg
b3IgMTgpLiBCZWNhdXNlIGEgZmx1c2gNCj4gb3BlcmF0aW9uIGlzIGZhaXJseSBleHBlbnNpdmUg
dG8gcGVyZm9ybSwgdGhlIGNvZGUgY2FsY3VsYXRlcyB0aGUgbWluaW11bQ0KPiBvcmRlciBzaW5n
bGUgZmx1c2ggdGhhdCB3aWxsIGNvdmVyIHRoZSBzcGVjaWZpZWQgcGFnZSByYW5nZSByYXRoZXIg
dGhhbg0KPiBwZXJmb3JtaW5nIG11bHRpcGxlIGZsdXNoZXMuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5
OiBQYXVsIER1cnJhbnQgPHBhdWwuZHVycmFudEBjaXRyaXguY29tPg0KPiBSZXZpZXdlZC1ieTog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiANCj4gQWNrZWQtYnk6IEJyaWFuIFdv
b2RzIDxicmlhbi53b29kc0BhbWQuY29tPg0KDQpUaGFua3MgQnJpYW4sDQoNCiAgUGF1bA0KDQo+
IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+IFhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QNCj4gWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQo+IGh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWwNCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
