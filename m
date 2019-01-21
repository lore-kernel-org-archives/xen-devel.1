From: Paul Durrant <Paul.Durrant@citrix.com>
Subject: Re: [PATCH] iommu: specify page_count rather than
 page_order to iommu_map/unmap()...
Date: Mon, 21 Jan 2019 09:19:59 +0000
Message-ID: <b865eadc234d4c7982a4e0c2461e2c21@AMSPEX02CL03.citrite.net>
References: <20190118160328.10455-1-paul.durrant@citrix.com>
 <7c75ca26-d297-2ca4-3c5c-79e2d0106ec0@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=u29s=P5=citrix.com=prvs=917a3d296=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1glVkR-0008O7-29
 for xen-devel@lists.xenproject.org; Mon, 21 Jan 2019 09:20:03 +0000
In-Reply-To: <7c75ca26-d297-2ca4-3c5c-79e2d0106ec0@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, "Tim (Xen.org)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>, Sander Eikelenboom <linux@eikelenboom.it>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, Ian Jackson <Ian.Jackson@citrix.com>, Chao Gao <chao.gao@intel.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBBbmRyZXcgQ29vcGVyDQo+IFNl
bnQ6IDE4IEphbnVhcnkgMjAxOSAxNzo0MQ0KPiBUbzogUGF1bCBEdXJyYW50IDxQYXVsLkR1cnJh
bnRAY2l0cml4LmNvbT47IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZw0KPiBDYzogQ2hh
byBHYW8gPGNoYW8uZ2FvQGludGVsLmNvbT47IFNhbmRlciBFaWtlbGVuYm9vbQ0KPiA8bGludXhA
ZWlrZWxlbmJvb20uaXQ+OyBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+OyBXZWkgTGl1
DQo+IDx3ZWkubGl1MkBjaXRyaXguY29tPjsgUm9nZXIgUGF1IE1vbm5lIDxyb2dlci5wYXVAY2l0
cml4LmNvbT47IEdlb3JnZQ0KPiBEdW5sYXAgPEdlb3JnZS5EdW5sYXBAY2l0cml4LmNvbT47IElh
biBKYWNrc29uIDxJYW4uSmFja3NvbkBjaXRyaXguY29tPjsNCj4gSnVsaWVuIEdyYWxsIDxqdWxp
ZW4uZ3JhbGxAYXJtLmNvbT47IEtvbnJhZCBSemVzenV0ZWsgV2lsaw0KPiA8a29ucmFkLndpbGtA
b3JhY2xlLmNvbT47IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47
IFRpbQ0KPiAoWGVuLm9yZykgPHRpbUB4ZW4ub3JnPjsgSnVuIE5ha2FqaW1hIDxqdW4ubmFrYWpp
bWFAaW50ZWwuY29tPjsgS2V2aW4gVGlhbg0KPiA8a2V2aW4udGlhbkBpbnRlbC5jb20+DQo+IFN1
YmplY3Q6IFJlOiBbUEFUQ0hdIGlvbW11OiBzcGVjaWZ5IHBhZ2VfY291bnQgcmF0aGVyIHRoYW4g
cGFnZV9vcmRlciB0bw0KPiBpb21tdV9tYXAvdW5tYXAoKS4uLg0KPiANCj4gT24gMTgvMDEvMjAx
OSAxNjowMywgUGF1bCBEdXJyYW50IHdyb3RlOg0KPiA+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVk
ZS94ZW4vaW9tbXUuaCBiL3hlbi9pbmNsdWRlL3hlbi9pb21tdS5oDQo+ID4gaW5kZXggY2RjODAy
MWNiZC4uODJmYjg2YzdmZiAxMDA2NDQNCj4gPiAtLS0gYS94ZW4vaW5jbHVkZS94ZW4vaW9tbXUu
aA0KPiA+ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi9pb21tdS5oDQo+ID4gQEAgLTExMSwxNyArMTEx
LDE3IEBAIGVudW0NCj4gPiAgI2RlZmluZSBJT01NVV9GTFVTSEZfbW9kaWZpZWQgKDF1IDw8IF9J
T01NVV9GTFVTSEZfbW9kaWZpZWQpDQo+ID4NCj4gPiAgaW50IF9fbXVzdF9jaGVjayBpb21tdV9t
YXAoc3RydWN0IGRvbWFpbiAqZCwgZGZuX3QgZGZuLCBtZm5fdCBtZm4sDQo+ID4gLSAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCBwYWdlX29yZGVyLCB1bnNpZ25lZCBpbnQg
ZmxhZ3MsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCBwYWdl
X2NvdW50LCB1bnNpZ25lZCBpbnQgZmxhZ3MsDQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHVuc2lnbmVkIGludCAqZmx1c2hfZmxhZ3MpOw0KPiANCj4gSSdkIHRha2UgdGhlIG9wcG9y
dHVuaXR5IHRvIG1ha2UgcGFnZV9jb3VudCBhbiB1bnNpZ25lZCBsb25nLCBhcyB3ZSBjYW4NCj4g
bm93IHNlbnNpYmx5IGlzc3VlIGEgc2luZ2xlIGNhbGwgZm9yIGFuIGVudGlyZSBCQVIsIGFuZCBz
b21lIGdyYXBoaWNzDQo+IGNhcmQgQkFScyBhcmUgZ2V0dGluZyB0byBiZSBhIGx1ZGljcm91cyBz
aXplLg0KDQpUaGUgMUcgb3JkZXIgaXMgc3RpbGwgdmV0b2VkIGJ5IG1taW9fb3JkZXIgKGh0dHA6
Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViLz9wPXhlbi5naXQ7YT1ibG9iO2Y9eGVuL2FyY2gveDg2
L21tL3AybS5jI2wyMjI4KSBzbyB0aGUgQkFSIGxpbWl0IGZvciBhIHNpbmdsZSBtYXBwaW5nIG9w
ZXJhdGlvbiBpcyBzdGlsbCBnb2luZyB0byAyTS4gU28gSSB0aGluayB3ZSdyZSBhIHdheSBvZmYg
bmVlZGluZyBhIDY0LWJpdCBjb3VudC4NCg0KPiANCj4gT3RoZXJ3aXNlLCBMR1RNIGFuZCBjYW4g
YWxzbyBiZSBmaXhlZCBvbiBjb21taXQuDQo+IA0KDQpCZWFyIGluIG1pbmQgdGhhdCwgaWYgeW91
IHdhbnQgdG8gbW92ZSB0byBhIDY0LWJpdCBjb3VudCwgdGhlbiB0aGUgZmx1c2ggb3BlcmF0aW9u
cyBzaG91bGQgYmUgYWRqdXN0ZWQgYWNjb3JkaW5nbHk7IHdoaWNoIGlzIGEgbm9uLXRyaXZpYWwg
YW1vdW50IG9mIGNvZGUgY2h1cm4uDQoNCiAgUGF1bA0KDQo+IH5BbmRyZXcNCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
