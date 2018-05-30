From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
Subject: Re: [PATCH v1 1/2] x86/mm: Add mem access rights to NPT
Date: Wed, 30 May 2018 11:20:09 +0000
Message-ID: <1527679210.25123.20.camel@bitdefender.com>
References: <1526037083-29920-1-git-send-email-aisaila@bitdefender.com>
 <5AFEF17C02000078001C4210@prv1-mh.provo.novell.com>
 <98b0d49b-07ba-1703-e25e-ceae271038fe@bitdefender.com>
 <5B03E7A702000078001C48B4@prv1-mh.provo.novell.com>
 <1526996127.25123.3.camel@bitdefender.com>
 <5B041ECB02000078001C4B3D@prv1-mh.provo.novell.com>
 <1527671092.25123.9.camel@bitdefender.com>
 <5B0E744002000078001C6E56@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5B0E744002000078001C6E56@prv1-mh.provo.novell.com>
Content-Language: en-US
Content-ID: <0E2064C925191D4B93756AD39705C4BD@bitdefender.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "rcojocaru@bitdefender.com" <rcojocaru@bitdefender.com>, "JBeulich@suse.com" <JBeulich@suse.com>
Cc: "George.Dunlap@eu.citrix.com" <George.Dunlap@eu.citrix.com>, "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, "tamas@tklengyel.com" <tamas@tklengyel.com>, "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gTWksIDIwMTgtMDUtMzAgYXQgMDM6NTIgLTA2MDAsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiA+
DQo+ID4gPg0KPiA+ID4gPg0KPiA+ID4gPiBPbiAzMC4wNS4xOCBhdCAxMTowNCwgPGFpc2FpbGFA
Yml0ZGVmZW5kZXIuY29tPiB3cm90ZToNCj4gPiBTb3JyeSBmb3IgdGhlIG1pc3VuZGVyc3RhbmRp
bmcsIEkgd2FudGVkIHRvIGNsYXJpZnkgaWYgdGhlIDU5OjU2DQo+ID4gYml0cw0KPiA+IGFyZSBm
dWxseSBvayB0byBiZSB1c2VkIG9yIGlmIG5vdCB0aGVuIHdoZXJlIHNob3VsZCBJIHVzZSA0IGJp
dHMgdG8NCj4gPiBzdG9yZSB0aGUgbWVtIGFjY2VzcyBpbmZvPw0KPiBJIHRob3VnaHQgSSBoYWQg
c3VmZmljaWVudGx5IGV4cGxhaW5lZCB0aGlzIC0geW91IGhhdmUgdHdvIG9wdGlvbnM6DQo+IDEp
IE1ha2Ugc3VyZSAodmlhIHNvbWUgcHJlcmVxIHBhdGNoKGVzKSkgYml0IDU5IGhhcyBubyBvdGhl
ciB1c2UsIGFuZA0KPiAgICB0aGVuIHVzZSA1OTo1Ni4NCj4gMikgVXNlIGFub3RoZXIgcmFuZ2Ug
dGhhdCdzIHByb3ZhYmx5IGhhdmluZyBubyBvdGhlciB1c2UsIGUuZy4NCj4gICAgNTg6NTUuDQpJ
J3ZlIGNoZWNrZWQgYW5kIGJpdHMgNDA6NTIgYXJlIGRlZmluZWQgaW4gYXNtL3BhZ2UuaCBmb3Ig
cGFnZSBmbGFncy4NCkkndmUgdHJpZWQgYml0cyA1Mzo1NiBhbmQgdGhlcmUgd2hlcmUgc29tZSBw
cm9ibGVtcyB3aXRoIHRoZSBndWVzdCBub3QNCnN0YXJ0aW5nIG9yIHRoZSBpbWFnZSBmcmVlemlu
ZywgYml0cyA2MiBhbmQgNjMgYXJlIG5vdCBmcmVlIHNvIDU5OjU2IGlzDQp0aGUgb25seSBzcGFj
ZSB0byBiZSB1c2VkIGZvciB0aGlzIHB1cnBvc2UgYW5kIGlzIHNlZW1zIHRvIGZ1bmN0aW9uDQpj
b3JyZWN0bHkuIElzIHRoZXJlIGFueSB0ZXN0IEkgc2hvdWxkIHJ1bj8NCg0KVGhhbmtzLA0KQWxl
eA0KDQoNCl9fX19fX19fX19fX19fX19fX19fX19fXw0KVGhpcyBlbWFpbCB3YXMgc2Nhbm5lZCBi
eSBCaXRkZWZlbmRlcg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
