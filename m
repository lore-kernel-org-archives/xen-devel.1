From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
Subject: Re: [PATCH v4 2/2] x86/emulate: Send vm_event from
 emulate
Date: Thu, 30 May 2019 08:59:13 +0000
Message-ID: <b6f3254b-2bce-ecd6-cddb-10131f075fb6@bitdefender.com>
References: <20190520125454.14805-1-aisaila@bitdefender.com>
 <20190520125454.14805-2-aisaila@bitdefender.com>
 <5CE51CBD0200007800231438@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XWjc=T6=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1hWGu6-0003Me-Hx
 for xen-devel@lists.xenproject.org; Thu, 30 May 2019 08:59:18 +0000
In-Reply-To: <5CE51CBD0200007800231438@prv1-mh.provo.novell.com>
Content-Language: en-US
Content-ID: <5673A7100E62F34AA40E52A9DD371A08@eurprd02.prod.outlook.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wei.liu2@citrix.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul.durrant@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

PiANCj4+ICsgICAgICAgIHJldHVybiBmYWxzZTsNCj4+ICsNCj4+ICsgICAgcmMgPSBodm1lbXVs
X2xpbmVhcl90b19waHlzKGdsYSwgJmdwYSwgYnl0ZXMsICZyZXBzLCBwZmVjLCAmY3R4dCk7DQo+
IA0KPiBBcyBzYWlkIGJlZm9yZSAtIEkgZG9uJ3QgdGhpbmsgaXQncyBhIGdvb2QgaWRlYSB0byBk
byB0aGUgcGFnZSB3YWxrDQo+IHR3aWNlOiBUaGlzIGFuZCB0aGUgcHJlLWV4aXN0aW5nIG9uZSBj
YW4gZWFzaWx5IHJldHVybiBkaWZmZXJlbnQNCj4gcmVzdWx0cy4NCg0KV2hhdCBwcmVleGlzdGlu
ZyBwYWdlIHdhbGsgYXJlIHlvdSB0YWxraW5nIGFib3V0IGhlcmU/IEkgZG9uJ3QgdGhpbmsgDQp0
aGVyZSBpcyBhIHdheSB0byBnZXQgdGhlIGdwYSBieSBwYXNzaW5nIGl0IGZyb20gc29tZXdoZXJl
Lg0KDQpBbGV4DQoNCj4gDQo+IEFkZGl0aW9uYWxseSwgYXMgYWxzbyBzYWlkIGJlZm9yZSAoSSB0
aGluayksIHRoZSBmdW5jdGlvbiBtYXkgcmFpc2UNCj4gI1BGLCB3aGljaCB5b3UgZG9uJ3Qgc2Vl
bSB0byBkZWFsIHdpdGggZGVzcGl0ZSBkaXNjYXJkaW5nIHRoZQ0KPiBYODZFTVVMX0VYQ0VQVElP
TiByZXR1cm4gdmFsdWUgLi4uDQo+IA0KPj4gKyAgICBpZiAoIHJjICE9IFg4NkVNVUxfT0tBWSAp
DQo+PiArICAgICAgICByZXR1cm4gZmFsc2U7DQo+IA0KPiAuLi4gaGVyZS4NCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
