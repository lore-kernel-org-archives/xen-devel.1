From: Paul Durrant <Paul.Durrant@citrix.com>
Subject: Re: [PATCH v2 03/13] iommu: make use of type-safe BFN
 and MFN in exported functions
Date: Tue, 10 Jul 2018 14:10:17 +0000
Message-ID: <985628ec89744222bac572772231bed8@AMSPEX02CL03.citrite.net>
References: <20180707110526.35822-1-paul.durrant@citrix.com>
 <20180707110526.35822-4-paul.durrant@citrix.com>
 <42026221-c065-9b31-20e9-21ea6b9a8548@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=07cm=j2=citrix.com=prvs=72274ee0c=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1fctOG-00024v-Qp
 for xen-devel@lists.xenproject.org; Tue, 10 Jul 2018 14:13:16 +0000
In-Reply-To: <42026221-c065-9b31-20e9-21ea6b9a8548@citrix.com>
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
Cc: Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim (Xen.org)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, Ian Jackson <Ian.Jackson@citrix.com>
List-Id: xen-devel@lists.xenproject.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBHZW9yZ2UgRHVubGFwIFttYWls
dG86Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tXQ0KPiBTZW50OiAxMCBKdWx5IDIwMTggMTU6MDEN
Cj4gVG86IFBhdWwgRHVycmFudCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+OyB4ZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcNCj4gQ2M6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNv
bT47IEFuZHJldyBDb29wZXINCj4gPEFuZHJldy5Db29wZXIzQGNpdHJpeC5jb20+OyBHZW9yZ2Ug
RHVubGFwDQo+IDxHZW9yZ2UuRHVubGFwQGNpdHJpeC5jb20+OyBJYW4gSmFja3NvbiA8SWFuLkph
Y2tzb25AY2l0cml4LmNvbT47IEtvbnJhZA0KPiBSemVzenV0ZWsgV2lsayA8a29ucmFkLndpbGtA
b3JhY2xlLmNvbT47IFN0ZWZhbm8gU3RhYmVsbGluaQ0KPiA8c3N0YWJlbGxpbmlAa2VybmVsLm9y
Zz47IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+OyBUaW0gKFhlbi5vcmcpDQo+
IDx0aW1AeGVuLm9yZz47IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+OyBKdW4gTmFrYWpp
bWENCj4gPGp1bi5uYWthamltYUBpbnRlbC5jb20+OyBLZXZpbiBUaWFuIDxrZXZpbi50aWFuQGlu
dGVsLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MiAwMy8xM10gaW9tbXU6IG1ha2UgdXNl
IG9mIHR5cGUtc2FmZSBCRk4gYW5kIE1GTg0KPiBpbiBleHBvcnRlZCBmdW5jdGlvbnMNCj4gDQo+
IE9uIDA3LzA3LzIwMTggMTI6MDUgUE0sIFBhdWwgRHVycmFudCB3cm90ZToNCj4gPiBUaGlzIHBh
dGNoIG1vZGlmaWVzIHRoZSBkZWNsYXJhdGlvbiBvZiB0aGUgZW50cnkgcG9pbnRzIHRvIHRoZSBJ
T01NVQ0KPiA+IHN1Yi1zeXN0ZW0gdG8gdXNlIGJmbl90IGFuZCBtZm5fdCBpbiBwbGFjZSBvZiB1
bnNpZ25lZCBsb25nLiBBDQo+IHN1YnNlcXVlbnQNCj4gPiBwYXRjaCB3aWxsIHNpbWlsYXJseSBt
b2RpZnkgdGhlIG1ldGhvZHMgaW4gdGhlIGlvbW11X29wcyBzdHJ1Y3R1cmUuDQo+ID4NCj4gPiBT
aWduZWQtb2ZmLWJ5OiBQYXVsIER1cnJhbnQgPHBhdWwuZHVycmFudEBjaXRyaXguY29tPg0KPiA+
IC0tLQ0KPiA+IENjOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+ID4gQ2M6IEFu
ZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+DQo+ID4gQ2M6IEdlb3JnZSBE
dW5sYXAgPEdlb3JnZS5EdW5sYXBAZXUuY2l0cml4LmNvbT4NCj4gPiBDYzogSWFuIEphY2tzb24g
PGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+DQo+ID4gQ2M6IEtvbnJhZCBSemVzenV0ZWsgV2ls
ayA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT4NCj4gPiBDYzogU3RlZmFubyBTdGFiZWxsaW5pIDxz
c3RhYmVsbGluaUBrZXJuZWwub3JnPg0KPiA+IENjOiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFs
bEBhcm0uY29tPg0KPiA+IENjOiBUaW0gRGVlZ2FuIDx0aW1AeGVuLm9yZz4NCj4gPiBDYzogV2Vp
IExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4NCj4gPiBDYzogSnVuIE5ha2FqaW1hIDxqdW4ubmFr
YWppbWFAaW50ZWwuY29tPg0KPiA+IENjOiBLZXZpbiBUaWFuIDxrZXZpbi50aWFuQGludGVsLmNv
bT4NCj4gPiBDYzogR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBldS5jaXRyaXguY29tPg0K
PiA+DQo+ID4gdjI6DQo+ID4gIC0gQWRkcmVzc2VkIGNvbW1lbnRzIGZyb20gSmFuLg0KPiA+ICAt
IFVzZSBpbnRlcm1lZGlhdGUgJ2ZyYW1lJyB2YXJpYWJsZSB0byBhdm9pZCBkaXJlY3RseSBlbmNh
cHN1bGF0aW5nDQo+ID4gICAgbWZuIG9yIGdmbiB2YWx1ZXMgYXMgYmZucy4NCj4gDQo+IEV4cGxh
aW4gdGhpcyBvbmUgdG8gbWU/ICBBdCB0aGUgbW9tZW50IEkgZG9uJ3Qgc2VlIGFueSB2YWx1ZSBm
cm9tIGhhdmluZw0KPiB0aGUgZXh0cmEgdmFyaWFibGUgaW4gdGhlIG1pZGRsZS4NCg0KVGhpcyB3
YXMgc29tZXRoaW5nIHRoYXQgSmFuIHdhbnRlZC4NCg0KICBQYXVsDQoNCj4gDQo+IEV2ZXJ5dGhp
bmcgZWxzZSBsb29rcyBnb29kLg0KPiANCj4gIC1HZW9yZ2UNCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
