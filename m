From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
Subject: Re: [PATCH v4 2/2] x86/emulate: Send vm_event from
 emulate
Date: Wed, 22 May 2019 13:50:33 +0000
Message-ID: <b2619cfc-1ee1-c495-40e2-2652b24ad78c@bitdefender.com>
References: <20190520125454.14805-1-aisaila@bitdefender.com>
 <20190520125454.14805-2-aisaila@bitdefender.com>
 <5CE51CBD0200007800231438@prv1-mh.provo.novell.com>
 <608cae57-7a7a-6502-9c9a-439aa0b88f25@bitdefender.com>
 <5CE54FD30200007800231603@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=AhM0=TW=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1hTRde-00028X-Ds
 for xen-devel@lists.xenproject.org; Wed, 22 May 2019 13:50:38 +0000
In-Reply-To: <5CE54FD30200007800231603@prv1-mh.provo.novell.com>
Content-Language: en-US
Content-ID: <F9FBEAAE223E2F40BE62E8206C1F1923@eurprd02.prod.outlook.com>
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

DQo+Pj4gRGVzcGl0ZSB3aGF0IHdhcyBzYWlkIGJlZm9yZSB5b3UncmUgc3RpbGwgZG9pbmcgdGhp
bmdzIGEgMm5kIHRpbWUNCj4+PiBoZXJlIGp1c3QgYmVjYXVzZSBvZiBodm1lbXVsX3NlbmRfdm1f
ZXZlbnQoKSdzIG5lZWRzLCBldmVuDQo+Pj4gaWYgdGhhdCBmdW5jdGlvbiBlbmRzIHVwIGJhaWxp
bmcgcmlnaHQgYXdheS4NCj4+DQo+PiBJIGRvbid0IHVuZGVyc3RhbmQgd2hhdCB0aGluZ3MgYXJl
IGRvbmUgMiB0aW1lcy4gQ2FuIHlvdSBwbGVhc2UgZXhwbGFpbj8NCj4gDQo+IFlvdSBhZGQgY29k
ZSBhYm92ZSB0aGF0IGV4aXN0cyBhbHJlYWR5IGluIF9faHZtZW11bF9yZWFkKCkuDQo+IEV2ZW4g
d29yc2UsIF9faHZtZW11bF9yZWFkKCkgbWF5IG5vdCBuZWVkIGNhbGxpbmcgYXQgYWxsLCBpbg0K
PiB3aGljaCBjYXNlIHRoZXJlJ3Mgbm8gKGVtdWxhdGVkKSBtZW1vcnkgYWNjZXNzIGFuZCBoZW5j
ZQ0KPiBpbW8gdGhlcmUgc2hvdWxkbid0IGJlIGFueSBldmVudC4gUGx1cywganVzdCBsaWtlIGlu
IHRoZQ0KPiBodm1lbXVsX2xpbmVhcl90b19waHlzKCkgY2FzZSB0aGVyZSBtYXkgYmUgYW4gZXhj
ZXB0aW9uDQo+IHJhaXNlZCBieSB0aGUgZnVuY3Rpb24sIHlldCBqdXN0IGxpa2UgdGhlcmUgeW91
IGFsc28gZGlzY2FyZCB0aGUNCj4gcmV0dXJuIHZhbHVlIHNheWluZyBzbyB3aXRob3V0IGFsc28g
emFwcGluZyB0aGUgZXhjZXB0aW9uLg0KPiANCg0KSXNuJ3QgaXQgc2FmZXIgdG8gbW92ZSB0aGUg
aHZtZW11bF9zZW5kX3ZtX2V2ZW50KCkgZm9ybSANCmh2bWVtdWxfaW5zbl9mZXRjaCgpIHRvIF9f
aHZtZW11bF9yZWFkKCk/DQoNCkFsZXgNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
