From: Paul Durrant <Paul.Durrant@citrix.com>
Subject: Re: [RFC PATCH 4/6] vm_event: Use slotted channels for
 sync requests.
Date: Tue, 8 Jan 2019 16:25:16 +0000
Message-ID: <76299234d7ec4a49a3fc90d569613105@AMSPEX02CL03.citrite.net>
References: <cover.1545245243.git.ppircalabu@bitdefender.com>
 <01b5a66439239a23384c7939d961edbca81e41ae.1545245243.git.ppircalabu@bitdefender.com>
 <a043ec46eed445c28b24e84fc7822019@AMSPEX02CL03.citrite.net>
 <5b276d9187a7e03d5efc950757f35891c6b14846.camel@bitdefender.com>
 <2f2544fc404a49628103c6b08c629d60@AMSPEX02CL03.citrite.net>
 <ede9771e7285a8d8632cf0c37b1c601d9abc4429.camel@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=vjXc=PQ=citrix.com=prvs=904727a53=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1gguCj-00018Y-IR
 for xen-devel@lists.xenproject.org; Tue, 08 Jan 2019 16:26:13 +0000
In-Reply-To: <ede9771e7285a8d8632cf0c37b1c601d9abc4429.camel@bitdefender.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: 'Petre Ovidiu PIRCALABU' <ppircalabu@bitdefender.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim (Xen.org)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>, Tamas K Lengyel <tamas@tklengyel.com>, Jan Beulich <jbeulich@suse.com>, Ian Jackson <Ian.Jackson@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBQZXRyZSBPdmlkaXUgUElSQ0FM
QUJVIFttYWlsdG86cHBpcmNhbGFidUBiaXRkZWZlbmRlci5jb21dDQo+IFNlbnQ6IDA4IEphbnVh
cnkgMjAxOSAxNjoxNA0KPiBUbzogUGF1bCBEdXJyYW50IDxQYXVsLkR1cnJhbnRAY2l0cml4LmNv
bT47IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZw0KPiBDYzogU3RlZmFubyBTdGFiZWxs
aW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPjsgV2VpIExpdQ0KPiA8d2VpLmxpdTJAY2l0cml4
LmNvbT47IFJhenZhbiBDb2pvY2FydSA8cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbT47IEtvbnJh
ZA0KPiBSemVzenV0ZWsgV2lsayA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT47IEdlb3JnZSBEdW5s
YXANCj4gPEdlb3JnZS5EdW5sYXBAY2l0cml4LmNvbT47IEFuZHJldyBDb29wZXIgPEFuZHJldy5D
b29wZXIzQGNpdHJpeC5jb20+OyBJYW4NCj4gSmFja3NvbiA8SWFuLkphY2tzb25AY2l0cml4LmNv
bT47IFRpbSAoWGVuLm9yZykgPHRpbUB4ZW4ub3JnPjsgSnVsaWVuDQo+IEdyYWxsIDxqdWxpZW4u
Z3JhbGxAYXJtLmNvbT47IFRhbWFzIEsgTGVuZ3llbCA8dGFtYXNAdGtsZW5neWVsLmNvbT47IEph
bg0KPiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT47IFJvZ2VyIFBhdSBNb25uZSA8cm9nZXIu
cGF1QGNpdHJpeC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbWGVuLWRldmVsXSBbUkZDIFBBVENIIDQv
Nl0gdm1fZXZlbnQ6IFVzZSBzbG90dGVkIGNoYW5uZWxzDQo+IGZvciBzeW5jIHJlcXVlc3RzLg0K
PiANCj4gT24gVHVlLCAyMDE5LTAxLTA4IGF0IDE1OjA4ICswMDAwLCBQYXVsIER1cnJhbnQgd3Jv
dGU6DQo+ID4gPg0KPiA+ID4NCj4gPiA+IEFsc28sIGZvciB0aGUgY3VycmVudCB2bV9ldmVudCBp
bXBsZW1lbnRhdGlvbiwgb3RoZXIgdGhhbiB1c2luZyB0aGUNCj4gPiA+IGh2bV9wYXJhbXMgdG8g
c3BlY2lmeSB0aGUgcmluZyBwYWdlIGdmbiwgSSBjb3VsZG4ndCBzZWUgYW55IHJlYXNvbg0KPiA+
ID4gd2h5DQo+ID4gPiBpdCBzaG91bGQgYmUgbGltaXRlZCB0byBIVk0gZ3Vlc3RzIG9ubHkuIElz
IGl0IGZlYXNpYmxlIHRvIGFzc3VtZQ0KPiA+ID4gdGhlDQo+ID4gPiB2bV9ldmVudCBtZWNoYW5p
c20gd2lsbCBub3QgZXZlciBiZSBleHRlbmRlZCB0byBQViBndWVzdHM/DQo+ID4gPg0KPiA+DQo+
ID4gVW5sZXNzIHlvdSBsaW1pdCB0aGluZ3MgdG8gSFZNIChhbmQgUFZIKSBndWVzdHMgdGhlbiBJ
IGd1ZXNzIHlvdSdsbA0KPiA+IHJ1biBpbnRvIHRoZSBzYW1lIHBhZ2Ugb3duZXJzaGlwIHByb2Js
ZW1zIHRoYXQgaW9yZXEgc2VydmVyIHJhbiBpbnRvDQo+ID4gKGR1ZSB0byBhIFBWIGd1ZXN0IGJl
aW5nIGFsbG93ZWQgdG8gbWFwIGFueSBwYWdlIGFzc2lnbmVkIHRvIGl0Li4uDQo+ID4gaW5jbHVk
aW5nIHRob3NlIHRoYXQgbWF5IGJlICdyZXNvdXJjZXMnIGl0IHNob3VsZCBub3QgYmUgYWJsZSB0
byBzZWUNCj4gPiBkaXJlY3RseSkuIEFueSBwYXJ0aWN1bGFyIHJlYXNvbiB3aHkgeW91J2QgZGVm
aW5pdGVseSB3YW50IHRvIHN1cHBvcnQNCj4gPiBwdXJlIFBWIGd1ZXN0cz8NCj4gPg0KPiA+ICAg
UGF1bA0KPiANCj4gTm8sIGJ1dCBhdCB0aGlzIHBvaW50IEkganVzdCB3YW50IHRvIG1ha2Ugc3Vy
ZSBJJ20gbm90IGxpbWl0aW5nIHRoZQ0KPiB2bV9ldmVudHMgdXNhZ2UuDQoNCk9rLCBidXQgZ2l2
ZW4gdGhhdCBhIGZyYW1ld29yayAoaS5lLiBpb3JlcSkgZXhpc3RzIGZvciBIVk0vUFZIIGd1ZXN0
cyB0aGVuIElNTyBpdCBtYWtlcyBzZW5zZSB0byB0YXJnZXQgdGhvc2UgZ3Vlc3RzIGZpcnN0IGFu
ZCB0aGVuIGZpZ3VyZSBvdXQgaG93IHRvIG1ha2UgdGhpbmdzIHdvcmsgZm9yIFBWIGxhdGVyIGlm
IG5lZWQgYmUuDQoNCiAgUGF1bA0KDQo+IA0KPiBNYW55IHRoYW5rcywNCj4gUGV0cmUNCg0KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
