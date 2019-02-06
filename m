From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
Subject: Re: [PATCH RFC v2 2/2] x86/emulate: Send vm_event from
 emulate
Date: Wed, 6 Feb 2019 10:17:10 +0000
Message-ID: <10089484-6813-94a2-e717-959fb1eb482b@bitdefender.com>
References: <20190111153657.13532-1-aisaila@bitdefender.com>
 <20190111153657.13532-2-aisaila@bitdefender.com>
 <20190204151014.wqy5zuo63byrwe2z@mac>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=lnaG=QN=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1grKGZ-0000G2-Fb
 for xen-devel@lists.xenproject.org; Wed, 06 Feb 2019 10:17:15 +0000
In-Reply-To: <20190204151014.wqy5zuo63byrwe2z@mac>
Content-Language: en-US
Content-ID: <B496F0016B648F4EBBF8F63C1F032024@eurprd02.prod.outlook.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Cc: "tamas@tklengyel.com" <tamas@tklengyel.com>, "wei.liu2@citrix.com" <wei.liu2@citrix.com>, "rcojocaru@bitdefender.com" <rcojocaru@bitdefender.com>, "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>, "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, "paul.durrant@citrix.com" <paul.durrant@citrix.com>, "jbeulich@suse.com" <jbeulich@suse.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

DQo+PiAgIA0KPj4gICAvKiBGUFUgc3ViLXR5cGVzIHdoaWNoIG1heSBiZSByZXF1ZXN0ZWQgdmlh
IC0+Z2V0X2ZwdSgpLiAqLw0KPj4gICBlbnVtIHg4Nl9lbXVsYXRlX2ZwdV90eXBlIHsNCj4+IGRp
ZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20teDg2L2h2bS9lbXVsYXRlLmggYi94ZW4vaW5jbHVk
ZS9hc20teDg2L2h2bS9lbXVsYXRlLmgNCj4+IGluZGV4IDI2YTAxZTgzYTQuLjcyMWUxNzViMDQg
MTAwNjQ0DQo+PiAtLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L2h2bS9lbXVsYXRlLmgNCj4+ICsr
KyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvaHZtL2VtdWxhdGUuaA0KPj4gQEAgLTQ3LDYgKzQ3LDcg
QEAgc3RydWN0IGh2bV9lbXVsYXRlX2N0eHQgew0KPj4gICAgICAgdWludDMyX3QgaW50cl9zaGFk
b3c7DQo+PiAgIA0KPj4gICAgICAgYm9vbF90IHNldF9jb250ZXh0Ow0KPj4gKyAgICBib29sIHNl
bmRfZXZlbnQ7DQo+IA0KPiBJJ20gbm90IHN1cmUgSSBzZWUgd2h5IGEgc2VuZF9ldmVudCBmaWVs
ZCBuZWVkcyB0byBiZSBhZGRlZCB0byB0aGUNCj4gY3R4dCBzdHJ1Y3QsIGlzbid0IGlzIHBvc3Np
YmxlIHRvIHBhc3MgdGhpcyBwYXJhbWV0ZXIgdG8gdGhlIHJlbGV2YW50DQo+IGZ1bmN0aW9ucyB0
aGF0IGNhcmUgYWJvdXQgaXQ/DQo+IA0KVGhpcyB3YXMgZG9uZSB0byBoYXZlIGFzIGxpdHRsZSBj
b2RlIGNoYW5nZSBhcyBwb3NzaWJsZSBhbmQgaXQgaGFzIGEgDQpwcmVjZWRlbnQgd2l0aCB0aGUg
c2V0X2NvbnRleHQgYm9vbC4gSWYgYSBzZW5kX2V2ZW50IHBhcmFtZXRlciB3b3VsZCBiZSANCnVz
ZWQgdGhlbiBpdCB3aWxsIGhhdmUgdG8gYmUgcGFzc2VkIGRvd24gdGhlIGxpbmUgYW5kIHRoZW4g
YSBsb3Qgb2YgDQpmdW5jdGlvbiBzaWduYXR1cmVzIGhhdmUgdG8gY2hhbmdlLiBJIHRoaW5rIHRo
ZSBjdXJyZW50IHdheSBpcyB0aGUgYmVzdCANCndheSB0byBoYXZlIHRoaXMgZG9uZS4NCg0KVGhh
bmtzLA0KQWxleA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
