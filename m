From: Petre Ovidiu PIRCALABU <ppircalabu@bitdefender.com>
Subject: Re: [RFC PATCH 4/6] vm_event: Use slotted channels for
 sync requests.
Date: Tue, 8 Jan 2019 14:49:35 +0000
Message-ID: <5b276d9187a7e03d5efc950757f35891c6b14846.camel@bitdefender.com>
References: <cover.1545245243.git.ppircalabu@bitdefender.com>
 <01b5a66439239a23384c7939d961edbca81e41ae.1545245243.git.ppircalabu@bitdefender.com>
 <a043ec46eed445c28b24e84fc7822019@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Gnh4=PQ=bitdefender.com=ppircalabu@srs-us1.protection.inumbo.net>)
 id 1ggshI-0006Qs-Q6
 for xen-devel@lists.xenproject.org; Tue, 08 Jan 2019 14:49:40 +0000
In-Reply-To: <a043ec46eed445c28b24e84fc7822019@AMSPEX02CL03.citrite.net>
Content-Language: en-US
Content-ID: <EECD2FB759751E41B0C998191F023552@eurprd02.prod.outlook.com>
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
eXRoaW5nIHlvdSBuZWVkIEFGQUlDVC4NCj4gDQo+ICAgUGF1bA0KPiANCg0KVG8gbXkgdW5kZXJz
dGFuZGluZywgdGhlIGN1cnJlbnQgaW1wbGVtZW50YXRpb24gb2YgdGhlIGlvcmVxIHNlcnZlciBp
cw0KbGltaXRlZCB0byBqdXN0IDIgYWxsb2NhdGVkIHBhZ2VzIChpb3JlcSBhbmQgYnVmaW9yZXEp
LiANClRoZSBtYWluIGdvYWwgb2YgdGhlIG5ldyB2bV9ldmVudCBpbXBsZW1lbnRhdGlvbiBwcm9w
b3NhbCBpcyB0byBiZSBtb3JlDQpmbGV4aWJsZSBpbiByZXNwZWN0IG9mIHRoZSBudW1iZXIgb2Yg
cGFnZXMgbmVjZXNzYXJ5IGZvciB0aGUNCnJlcXVlc3QvcmVzcG9uc2UgYnVmZmVycyAoIHRoZSBz
bG90dGVkIHN0cnVjdHVyZSB3aGljaCBob2xkcyBvbmUNCnJlcXVlc3QvcmVzcG9uc2UgcGVyIHZj
cHUgb3IgdGhlIHJpbmcgc3Bhbm5pbmcgbXVsdGlwbGUgcGFnZXMgaW4gdGhlDQpwcmV2aW91cyBw
cm9wb3NhbCkuDQpJcyBpdCBmZWFzaWJsZSB0byBleHRlbmQgdGhlIGN1cnJlbnQgaW9yZXEgc2Vy
dmVyIGltcGxlbWVudGF0aW9uDQphbGxvY2F0ZSBkeW5hbWljYWxseSBhIHNwZWNpZmljIG51bWJl
ciBvZiBwYWdlcz8NCg0KQWxzbywgZm9yIHRoZSBjdXJyZW50IHZtX2V2ZW50IGltcGxlbWVudGF0
aW9uLCBvdGhlciB0aGFuIHVzaW5nIHRoZQ0KaHZtX3BhcmFtcyB0byBzcGVjaWZ5IHRoZSByaW5n
IHBhZ2UgZ2ZuLCBJIGNvdWxkbid0IHNlZSBhbnkgcmVhc29uIHdoeQ0KaXQgc2hvdWxkIGJlIGxp
bWl0ZWQgdG8gSFZNIGd1ZXN0cyBvbmx5LiBJcyBpdCBmZWFzaWJsZSB0byBhc3N1bWUgdGhlDQp2
bV9ldmVudCBtZWNoYW5pc20gd2lsbCBub3QgZXZlciBiZSBleHRlbmRlZCB0byBQViBndWVzdHM/
DQoNCk1hbnkgdGhhbmtzLA0KUGV0cmUNCg0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
