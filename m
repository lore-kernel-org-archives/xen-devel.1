From: Petre Ovidiu PIRCALABU <ppircalabu@bitdefender.com>
Subject: Re: [RFC PATCH 4/6] vm_event: Use slotted channels for
 sync requests.
Date: Thu, 10 Jan 2019 15:30:49 +0000
Message-ID: <1b4efb83302a0b8a6655a160f9ca15f381af3045.camel@bitdefender.com>
References: <cover.1545245243.git.ppircalabu@bitdefender.com>
 <01b5a66439239a23384c7939d961edbca81e41ae.1545245243.git.ppircalabu@bitdefender.com>
 <a043ec46eed445c28b24e84fc7822019@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=n1xr=PS=bitdefender.com=ppircalabu@srs-us1.protection.inumbo.net>)
 id 1ghcIJ-0002Jc-81
 for xen-devel@lists.xenproject.org; Thu, 10 Jan 2019 15:30:55 +0000
In-Reply-To: <a043ec46eed445c28b24e84fc7822019@AMSPEX02CL03.citrite.net>
Content-Language: en-US
Content-ID: <DD7BD9F2C84B8846899C1E8C952D5134@eurprd02.prod.outlook.com>
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

T24gVGh1LCAyMDE4LTEyLTIwIGF0IDEyOjA1ICswMDAwLCBQYXVsIER1cnJhbnQgd3JvdGU6DQo+
ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiANCj4gPiBUaGUgbWVtb3J5IGZvciB0
aGUgYXN5bmNocm9ub3VzIHJpbmcgYW5kIHRoZSBzeW5jaHJvbm91cyBjaGFubmVscw0KPiA+IHdp
bGwNCj4gPiBiZSBhbGxvY2F0ZWQgZnJvbSBkb21oZWFwIGFuZCBtYXBwZWQgdG8gdGhlIGNvbnRy
b2xsaW5nIGRvbWFpbg0KPiA+IHVzaW5nIHRoZQ0KPiA+IGZvcmVpZ25tZW1vcnlfbWFwX3Jlc291
cmNlIGludGVyZmFjZS4gVW5saWtlIHRoZSBjdXJyZW50DQo+ID4gaW1wbGVtZW50YXRpb24sDQo+
ID4gdGhlIGFsbG9jYXRlZCBwYWdlcyBhcmUgbm90IHBhcnQgb2YgdGhlIHRhcmdldCBEb21VLCBz
byB0aGV5IHdpbGwNCj4gPiBub3QgYmUNCj4gPiByZWNsYWltZWQgd2hlbiB0aGUgdm1fZXZlbnQg
ZG9tYWluIGlzIGRpc2FibGVkLg0KPiANCj4gV2h5IHJlLWludmVudCB0aGUgd2hlZWwgaGVyZT8g
VGhlIGlvcmVxIGluZnJhc3RydWN0dXJlIGFscmVhZHkgZG9lcw0KPiBwcmV0dHkgbXVjaCBldmVy
eXRoaW5nIHlvdSBuZWVkIEFGQUlDVC4NCj4gDQo+ICAgUGF1bA0KPiANCg0KSGkgUGF1bCwNCg0K
SSdtIHN0aWxsIHN0cnVnZ2xpbmcgdG8gdW5kZXJzdGFuZCBob3cgdGhlIHZtX2V2ZW50IHN1YnN5
c3RlbSBjb3VsZCBiZQ0KaW50ZWdyYXRlZCB3aXRoIGFuIElPUkVRIHNlcnZlci4NCg0KQW4gSU9S
RVEgc2VydmVyIHNoYXJlcyB3aXRoIHRoZSBlbXVsYXRvciAyIHBhZ2VzLCBvbmUgZm9yIGlvcmVx
cyBhbmQNCm9uZSBmb3IgYnVmZmVyZWRfaW9yZXFzLiBGb3Igdm1fZXZlbnQgd2UgbmVlZCB0byBz
aGFyZSBhbHNvIG9uZSBvciBtb3JlDQpwYWdlcyBmb3IgdGhlIGFzeW5jIHJpbmcgYW5kIGEgZmV3
IHBhZ2VzIGZvciB0aGUgc2xvdHRlZCBzeW5jaHJvbm91cw0Kdm1fZXZlbnRzLg0KU28sIHRvIG15
IHVuZGVyc3RhbmRpbmcsIHlvdXIgaWRlYSB0byB1c2UgdGhlIGlvcmVxIGluZnJhc3RydWN0dXJl
IGZvcg0Kdm1fZXZlbnRzIGlzIGJhc2ljYWxseSB0byByZXBsYWNlIHRoZSBjdXN0b20gc2lnbmFs
bGluZyAoZXZlbnQgY2hhbm5lbHMNCisgcmluZyAvIGN1c3RvbSBzdGF0ZXMpIHdpdGggaW9yZXFz
LiBTaW5jZSB0aGUNCnZtX2V2ZW50X3JlcXVlc3QvcmVzcG9uc2Ugc3RydWN0dXJlcyBhcmUgbGFy
Z2VyIHRoYW4gOCBieXRlcywgdGhlDQoiZGF0YV9pc19wdHIiIGZsYWcgc2hvdWxkIGJlIHVzZWQg
aW4gY29uanVuY3Rpb24gd2l0aCB0aGUgYWRkcmVzc2VzDQooaW5kZXhlcykgZnJvbSB0aGUgc2hh
cmVkIHZtX2V2ZW50IGJ1ZmZlcnMuIA0KDQpJcyB0aGlzIHRoZSBtZWNoYW5pc20geW91IGhhZCBp
biBtaW5kPw0KDQpNYW55IHRoYW5rcywNClBldHJlDQoNCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
