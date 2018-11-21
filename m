From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
Subject: Re: [PATCH v1] x86/hvm: Generic instruction
 re-execution mechanism for execute faults
Date: Wed, 21 Nov 2018 12:00:48 +0000
Message-ID: <1b78eeb1-395b-71c3-d1c1-f6d1d84e19fd@bitdefender.com>
References: <20181116100624.21977-1-aisaila@bitdefender.com>
 <20181116170412.xrwuun3cqxll22l3@mac>
 <3d3ae38a-bfae-9908-dac6-163216f900e3@bitdefender.com>
 <20181119150824.lfquw2j2ehhvjbhk@mac>
 <638d0c37-68aa-6e68-480e-f3c1cc74777d@bitdefender.com>
 <20181121095654.6lez6zzstpl45qtt@mac>
 <bc6dfdf4-bd99-237c-707e-6f08eda0f825@bitdefender.com>
 <20181121114126.sblh3te5pkcciwuw@mac>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=nvd6=oa=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1gPRBd-0003cI-U0
 for xen-devel@lists.xenproject.org; Wed, 21 Nov 2018 12:00:54 +0000
In-Reply-To: <20181121114126.sblh3te5pkcciwuw@mac>
Content-Language: en-US
Content-ID: <337552B7A6FBAF42ABE6E905E0B3C1E9@eurprd02.prod.outlook.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Cc: "kevin.tian@intel.com" <kevin.tian@intel.com>, "tamas@tklengyel.com" <tamas@tklengyel.com>, "wei.liu2@citrix.com" <wei.liu2@citrix.com>, "jbeulich@suse.com" <jbeulich@suse.com>, "rcojocaru@bitdefender.com" <rcojocaru@bitdefender.com>, "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>, "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, =?utf-8?B?TWloYWkgRG9uyJt1?= <mdontu@bitdefender.com>, Andrei Vlad LUTAS <vlutas@bitdefender.com>, "jun.nakajima@intel.com" <jun.nakajima@intel.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Anshul Makkar <anshul.makkar@citrix.com>
List-Id: xen-devel@lists.xenproject.org

DQoNCk9uIDIxLjExLjIwMTggMTM6NDEsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6DQo+IE9uIFdl
ZCwgTm92IDIxLCAyMDE4IGF0IDEwOjI4OjE4QU0gKzAwMDAsIEFsZXhhbmRydSBTdGVmYW4gSVNB
SUxBIHdyb3RlOg0KPj4NCj4+DQo+PiBPbiAyMS4xMS4yMDE4IDExOjU2LCBSb2dlciBQYXUgTW9u
bsOpIHdyb3RlOg0KPj4+IE9uIE1vbiwgTm92IDE5LCAyMDE4IGF0IDAzOjU2OjE0UE0gKzAwMDAs
IEFsZXhhbmRydSBTdGVmYW4gSVNBSUxBIHdyb3RlOg0KPj4+PiBPbiAxOS4xMS4yMDE4IDE3OjA4
LCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOg0KPj4+IEFsc28sIGFmdGVyIGxvb2tpbmcgYXQgdGhl
IGNvZGUgSSdtIG5vdCBzdXJlIEkgc2VlIHdoeSB0aGlzIG5lZWRzIHRvDQo+Pj4gYmUgVk1YIHNw
ZWNpZmljLCBBRkFJQ1QgaXQgZG9lc24ndCBkaXJlY3RseSBjYWxsIGFueSBWTVggZnVuY3Rpb25z
Pw0KPj4+DQo+Pg0KPj4gSXQgaXMgdm14IHNwZWNpZmljIGJlY2F1c2Ugc3ZtIGRvZXMgbm90IGhh
dmUgc2luZ2xlIHN0ZXAuIFdlIHRhbGtlZA0KPj4gYWJvdXQgaW4gdGhlIHBhc3QgYWJvdXQgdGhp
cyBhbmQgaXQgdHVybmVkIG91dCB0aGF0IGl0IHdhcyB0byBtdWNoDQo+PiB0cm91YmxlIHRvIG1h
a2UgYSBjdXN0b20gc2luZ2xlIHN0ZXAuDQo+IA0KPiBJIHN0aWxsIHRoaW5rIHRoaXMgc2hvdWxk
bid0IGJlIFZNWCBzcGVjaWZpYywgYW5kIHlvdSBzaG91bGQganVzdA0KPiByZXR1cm4gLUVPUE5P
VFNVUFAgaWYgc2luZ2xlIHN0ZXBwaW5nIGlzIG5vdCBzdXBwb3J0ZWQsIGp1c3QgbGlrZQ0KPiBo
dm1fZGVidWdfb3AgZG9lcy4gSW4gZmFjdCBJJ20gbWlzc2luZyBhIGhlbHBlciB0byBzZXQgc2lu
Z2xlDQo+IHN0ZXBwaW5nLCB3aGljaCB3b3VsZCBiZSB0aGUgcmlnaHQgcGxhY2UgdG8gcmV0dXJu
IC1FT1BOT1RTVVBQLg0KPiANCj4gVGhlbiB5b3VyIHJleGVjIHdvdWxkbid0IG5lZWQgdG8ga25v
dyBhbnl0aGluZyBhYm91dCB0aGUgaGFyZHdhcmUgYW5kDQo+IHdvdWxkIGp1c3QgYXR0ZW1wdCB0
byBzZXQgc2luZ2xlIHN0ZXBwaW5nLCBmYWlsaW5nIGlmIGl0IGNhbm5vdCBiZQ0KPiBlbmFibGVk
Lg0KPiANCg0KVGhlcmUgaXMgYSBoZWxwZXIgZnVuY3Rpb24gZm9yIHNpbmdsZSBzdGVwICJodm1f
aXNfc2luZ2xlc3RlcF9zdXBwb3J0ZWQiIA0KYW5kIHdlIGhhdmUgdGhlIGQtPmFyY2gubW9uaXRv
ci5pbmd1ZXN0X3BhZ2VmYXVsdF9kaXNhYmxlZCBtb25pdG9yIGZsYWcuIA0KSSBjYW4gcmV0dXJu
IG5vdCBzdXBwb3J0ZWQgaW4gdGhlIHhjX21vbml0b3JfaW5ndWVzdF9wYWdlZmF1bHQgY2FsbCBh
bmQgDQpzYXZlIHRpbWUgb24gdGhlIHByb2Nlc3MuDQoNCn5BbGV4DQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
