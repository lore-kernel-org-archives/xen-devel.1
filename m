From: Paul Durrant <Paul.Durrant@citrix.com>
Subject: Re: [RFC PATCH 4/6] vm_event: Use slotted channels for
 sync requests.
Date: Thu, 20 Dec 2018 14:28:23 +0000
Message-ID: <df56b6495ff64236aac9a85c2f53a33d@AMSPEX02CL03.citrite.net>
References: <cover.1545245243.git.ppircalabu@bitdefender.com>
 <01b5a66439239a23384c7939d961edbca81e41ae.1545245243.git.ppircalabu@bitdefender.com>
 <a043ec46eed445c28b24e84fc7822019@AMSPEX02CL03.citrite.net>
 <2d3e6587946c1f82e07303876e6d03a4dc2f525b.camel@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=iZSg=O5=citrix.com=prvs=88558fdb8=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1gZzJR-00024a-Qy
 for xen-devel@lists.xenproject.org; Thu, 20 Dec 2018 14:28:33 +0000
In-Reply-To: <2d3e6587946c1f82e07303876e6d03a4dc2f525b.camel@bitdefender.com>
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
QUJVIFttYWlsdG86cHBpcmNhbGFidUBiaXRkZWZlbmRlci5jb21dDQo+IFNlbnQ6IDIwIERlY2Vt
YmVyIDIwMTggMTQ6MjYNCj4gVG86IFBhdWwgRHVycmFudCA8UGF1bC5EdXJyYW50QGNpdHJpeC5j
b20+OyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcNCj4gQ2M6IFN0ZWZhbm8gU3RhYmVs
bGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47IFdlaSBMaXUNCj4gPHdlaS5saXUyQGNpdHJp
eC5jb20+OyBSYXp2YW4gQ29qb2NhcnUgPHJjb2pvY2FydUBiaXRkZWZlbmRlci5jb20+OyBLb25y
YWQNCj4gUnplc3p1dGVrIFdpbGsgPGtvbnJhZC53aWxrQG9yYWNsZS5jb20+OyBHZW9yZ2UgRHVu
bGFwDQo+IDxHZW9yZ2UuRHVubGFwQGNpdHJpeC5jb20+OyBBbmRyZXcgQ29vcGVyIDxBbmRyZXcu
Q29vcGVyM0BjaXRyaXguY29tPjsgSWFuDQo+IEphY2tzb24gPElhbi5KYWNrc29uQGNpdHJpeC5j
b20+OyBUaW0gKFhlbi5vcmcpIDx0aW1AeGVuLm9yZz47IEp1bGllbg0KPiBHcmFsbCA8anVsaWVu
LmdyYWxsQGFybS5jb20+OyBUYW1hcyBLIExlbmd5ZWwgPHRhbWFzQHRrbGVuZ3llbC5jb20+OyBK
YW4NCj4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+OyBSb2dlciBQYXUgTW9ubmUgPHJvZ2Vy
LnBhdUBjaXRyaXguY29tPg0KPiBTdWJqZWN0OiBSZTogW1hlbi1kZXZlbF0gW1JGQyBQQVRDSCA0
LzZdIHZtX2V2ZW50OiBVc2Ugc2xvdHRlZCBjaGFubmVscw0KPiBmb3Igc3luYyByZXF1ZXN0cy4N
Cj4gDQo+IE9uIFRodSwgMjAxOC0xMi0yMCBhdCAxMjowNSArMDAwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOg0KPiA+ID4gVGhlIG1lbW9yeSBmb3IgdGhlIGFzeW5jaHJvbm91cyByaW5nIGFuZCB0aGUg
c3luY2hyb25vdXMgY2hhbm5lbHMNCj4gPiA+IHdpbGwNCj4gPiA+IGJlIGFsbG9jYXRlZCBmcm9t
IGRvbWhlYXAgYW5kIG1hcHBlZCB0byB0aGUgY29udHJvbGxpbmcgZG9tYWluDQo+ID4gPiB1c2lu
ZyB0aGUNCj4gPiA+IGZvcmVpZ25tZW1vcnlfbWFwX3Jlc291cmNlIGludGVyZmFjZS4gVW5saWtl
IHRoZSBjdXJyZW50DQo+ID4gPiBpbXBsZW1lbnRhdGlvbiwNCj4gPiA+IHRoZSBhbGxvY2F0ZWQg
cGFnZXMgYXJlIG5vdCBwYXJ0IG9mIHRoZSB0YXJnZXQgRG9tVSwgc28gdGhleSB3aWxsDQo+ID4g
PiBub3QgYmUNCj4gPiA+IHJlY2xhaW1lZCB3aGVuIHRoZSB2bV9ldmVudCBkb21haW4gaXMgZGlz
YWJsZWQuDQo+ID4NCj4gPiBXaHkgcmUtaW52ZW50IHRoZSB3aGVlbCBoZXJlPyBUaGUgaW9yZXEg
aW5mcmFzdHJ1Y3R1cmUgYWxyZWFkeSBkb2VzDQo+ID4gcHJldHR5IG11Y2ggZXZlcnl0aGluZyB5
b3UgbmVlZCBBRkFJQ1QuDQo+ID4NCj4gPiAgIFBhdWwNCj4gDQo+IEkgd2FudGVkIHByZXNldmUg
YXMgbXVjaCBhcyBwb3NzaWJsZSBmcm9tIHRoZSBleGlzdGluZyB2bV9ldmVudCBET01DVEwNCj4g
aW50ZXJmYWNlIGFuZCBhZGQgb25seSB0aGUgbmVjZXNzYXJ5IGNvZGUgdG8gYWxsb2NhdGUgYW5k
IG1hcCB0aGUNCj4gdm1fZXZlbnRfcGFnZXMuDQoNClRoYXQgbWVhbnMgd2UgaGF2ZSB0d28gc3Vi
c3lzdGVtcyBkdXBsaWNhdGluZyBhIGxvdCBvZiBmdW5jdGlvbmFsaXR5IHRob3VnaC4gSXQgd291
bGQgYmUgbXVjaCBiZXR0ZXIgdG8gdXNlIGlvcmVxIHNlcnZlciBpZiBwb3NzaWJsZSB0aGFuIHBy
b3ZpZGUgYSBjb21wYXRpYmlsaXR5IGludGVyZmFjZSB2aWEgRE9NQ1RMLg0KDQo+IEFsc28sIHRv
IG15IGtub3dsZWRnZSwgdGhlIGlvcmVxIHNlcnZlciBpcyBvbmx5IHN1cHBvcnRlZCBmb3IgeDg2
IGh2bQ0KPiB0YXJnZXRzLiBJIGRpZG4ndCB3YW50IHRvIGFkZCBhbiBleHRyYSBsaW1pdGF0aW9u
IHRvIHRoZSB2bV9ldmVudA0KPiBzeXN0ZW0uDQoNCkkgYmVsaWV2ZSBKdWxpZW4gaXMgYWxyZWFk
eSBwb3J0aW5nIGl0IHRvIEFSTS4NCg0KICBQYXVsDQoNCj4gLy9QZXRyZQ0KDQpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
