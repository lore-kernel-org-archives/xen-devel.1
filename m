From: Petre Ovidiu PIRCALABU <ppircalabu@bitdefender.com>
Subject: Re: [RFC PATCH 4/6] vm_event: Use slotted channels for
 sync requests.
Date: Tue, 8 Jan 2019 16:13:44 +0000
Message-ID: <ede9771e7285a8d8632cf0c37b1c601d9abc4429.camel@bitdefender.com>
References: <cover.1545245243.git.ppircalabu@bitdefender.com>
 <01b5a66439239a23384c7939d961edbca81e41ae.1545245243.git.ppircalabu@bitdefender.com>
 <a043ec46eed445c28b24e84fc7822019@AMSPEX02CL03.citrite.net>
 <5b276d9187a7e03d5efc950757f35891c6b14846.camel@bitdefender.com>
 <2f2544fc404a49628103c6b08c629d60@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Gnh4=PQ=bitdefender.com=ppircalabu@srs-us1.protection.inumbo.net>)
 id 1ggu0i-0008Sl-JK
 for xen-devel@lists.xenproject.org; Tue, 08 Jan 2019 16:13:48 +0000
In-Reply-To: <2f2544fc404a49628103c6b08c629d60@AMSPEX02CL03.citrite.net>
Content-Language: en-US
Content-ID: <6721D4DC4AF2134584F58F0C3A4F81A7@eurprd02.prod.outlook.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <Paul.Durrant@citrix.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim (Xen.org)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>, Tamas K Lengyel <tamas@tklengyel.com>, Jan Beulich <jbeulich@suse.com>, Ian Jackson <Ian.Jackson@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCAyMDE5LTAxLTA4IGF0IDE1OjA4ICswMDAwLCBQYXVsIER1cnJhbnQgd3JvdGU6DQo+
ID4gDQo+ID4gDQo+ID4gQWxzbywgZm9yIHRoZSBjdXJyZW50IHZtX2V2ZW50IGltcGxlbWVudGF0
aW9uLCBvdGhlciB0aGFuIHVzaW5nIHRoZQ0KPiA+IGh2bV9wYXJhbXMgdG8gc3BlY2lmeSB0aGUg
cmluZyBwYWdlIGdmbiwgSSBjb3VsZG4ndCBzZWUgYW55IHJlYXNvbg0KPiA+IHdoeQ0KPiA+IGl0
IHNob3VsZCBiZSBsaW1pdGVkIHRvIEhWTSBndWVzdHMgb25seS4gSXMgaXQgZmVhc2libGUgdG8g
YXNzdW1lDQo+ID4gdGhlDQo+ID4gdm1fZXZlbnQgbWVjaGFuaXNtIHdpbGwgbm90IGV2ZXIgYmUg
ZXh0ZW5kZWQgdG8gUFYgZ3Vlc3RzPw0KPiA+IA0KPiANCj4gVW5sZXNzIHlvdSBsaW1pdCB0aGlu
Z3MgdG8gSFZNIChhbmQgUFZIKSBndWVzdHMgdGhlbiBJIGd1ZXNzIHlvdSdsbA0KPiBydW4gaW50
byB0aGUgc2FtZSBwYWdlIG93bmVyc2hpcCBwcm9ibGVtcyB0aGF0IGlvcmVxIHNlcnZlciByYW4g
aW50bw0KPiAoZHVlIHRvIGEgUFYgZ3Vlc3QgYmVpbmcgYWxsb3dlZCB0byBtYXAgYW55IHBhZ2Ug
YXNzaWduZWQgdG8gaXQuLi4NCj4gaW5jbHVkaW5nIHRob3NlIHRoYXQgbWF5IGJlICdyZXNvdXJj
ZXMnIGl0IHNob3VsZCBub3QgYmUgYWJsZSB0byBzZWUNCj4gZGlyZWN0bHkpLiBBbnkgcGFydGlj
dWxhciByZWFzb24gd2h5IHlvdSdkIGRlZmluaXRlbHkgd2FudCB0byBzdXBwb3J0DQo+IHB1cmUg
UFYgZ3Vlc3RzPw0KPiANCj4gICBQYXVsDQoNCk5vLCBidXQgYXQgdGhpcyBwb2ludCBJIGp1c3Qg
d2FudCB0byBtYWtlIHN1cmUgSSdtIG5vdCBsaW1pdGluZyB0aGUNCnZtX2V2ZW50cyB1c2FnZS4N
Cg0KTWFueSB0aGFua3MsDQpQZXRyZQ0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
