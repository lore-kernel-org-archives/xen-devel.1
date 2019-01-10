From: George Dunlap <George.Dunlap@citrix.com>
Subject: Re: [PATCH for-4.12 V2] x86/p2m: fix
 p2m_finish_type_change()
Date: Thu, 10 Jan 2019 23:58:10 +0000
Message-ID: <09D9E1BC-BE86-45AD-9CE8-3E2D2E85F8A7@citrix.com>
References: <1547036665-27356-1-git-send-email-rcojocaru@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=n6Fr=PS=citrix.com=prvs=906c3ced9=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1ghkDU-0000b9-A4
 for xen-devel@lists.xenproject.org; Thu, 10 Jan 2019 23:58:28 +0000
In-Reply-To: <1547036665-27356-1-git-send-email-rcojocaru@bitdefender.com>
Content-Language: en-US
Content-ID: <0C85F2A783DFD2498F537DDE7AA973D1@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>
Cc: Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, George Dunlap <George.Dunlap@citrix.com>, "jbeulich@suse.com" <jbeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

DQoNCj4gT24gSmFuIDksIDIwMTksIGF0IDEwOjI0IFBNLCBSYXp2YW4gQ29qb2NhcnUgPHJjb2pv
Y2FydUBiaXRkZWZlbmRlci5jb20+IHdyb3RlOg0KPiANCj4gZmluaXNoX3R5cGVfY2hhbmdlKCkg
cmV0dXJucyBhIG5lZ2F0aXZlIGludCBvbiBlcnJvciwgYnV0IHRoZQ0KPiBjdXJyZW50IGNvZGUg
Y2hlY2tzIGlmICggIXJjICkuIFdlIGFsc28gbmVlZCB0byB0cmVhdA0KPiBmaW5pc2hfdHlwZV9j
aGFuZ2UoKSdzIHJldHVybiBjb2RlcyBjdW11bGF0aXZlbHkgaW4gdGhlDQo+IHN1Y2Nlc3MgY2Fz
ZSAoZG9uJ3Qgb3ZlcndyaXRlIGEgMSByZXR1cm5lZCB3aGlsZSBwcm9jZXNzaW5nDQo+IHRoZSBo
b3N0cDJtIGlmIHByb2Nlc3NpbmcgYW4gYWx0cDJtIHJldHVybnMgMCkuDQo+IA0KPiBUaGUgYnJl
YWthZ2Ugd2FzIGludHJvZHVjZWQgYnkgY29tbWl0IDBmYjRiNThjOGINCj4gKCJ4ODYvYWx0cDJt
OiBmaXggZGlzcGxheSBmcm96ZW4gd2hlbiBzd2l0Y2hpbmcgdG8gYSBuZXcgdmlldw0KPiBlYXJs
eSIpLg0KPiANCj4gUHJvcGVybHkgaW5kZW50IHRoZSBvdXQ6IGxhYmVsIHdoaWxlIGF0IGl0Lg0K
PiANCj4gU2lnbmVkLW9mZi1ieTogUmF6dmFuIENvam9jYXJ1IDxyY29qb2NhcnVAYml0ZGVmZW5k
ZXIuY29tPg0KPiANCj4gLS0tDQo+IENoYW5nZXMgc2luY2UgVjE6DQo+IC0gVXBkYXRlZCBkZXNj
cmlwdGlvbi4NCj4gLSBOb3cgdHJlYXRpbmcgZmluaXNoX3R5cGVfY2hhbmdlKCkncyByZXR1cm4g
dmFsdWUgY3VtdWxhdGl2ZWx5DQo+ICAgZm9yIHRoZSBzdWNjZXNzIGNhc2UuDQoNCk9oLCBJIHNl
ZSB5b3UgYWxyZWFkeSBkaWQgdGhlIG1vcmUgY29tcGxpY2F0ZWQgdGhpbmcuICBJ4oCZbSBzbGln
aHRseSB3b3JyaWVkIGFib3V0IHRoZSByZXR1cm4gdmFsdWUgb2YgdGhlIGh5cGVyY2FsbCwgYnV0
IHNpbmNlIHRoYXQgd2FzIHRoZSBzZW1hbnRpYyBiZWZvcmUsIEkgZ3Vlc3MgaXQgc2hvdWxkbuKA
mXQgY2F1c2UgYW55IHByb2JsZW1zOg0KDQpBY2tlZC1ieTogR2VvcmdlIER1bmxhcCA8Z2Vvcmdl
LmR1bmxhcEBjaXRyaXguY29tPg0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
