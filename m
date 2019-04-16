From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
Subject: Re: [PATCH v4] x86/mm: Aggregate get entry and populate
 into common funcs
Date: Tue, 16 Apr 2019 07:27:50 +0000
Message-ID: <0afeb362-03df-9c38-8540-2e35835c30ff@bitdefender.com>
References: <20190415092243.3349-1-aisaila@bitdefender.com>
 <5CB4A5310200007800155529@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=IVQq=SS=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1hGIVl-00017u-VQ
 for xen-devel@lists.xenproject.org; Tue, 16 Apr 2019 07:28:10 +0000
In-Reply-To: <5CB4A5310200007800155529@prv1-mh.provo.novell.com>
Content-Language: en-US
Content-ID: <D933EACFBF88224F8A4D0BC0947BBF0A@eurprd02.prod.outlook.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: "tamas@tklengyel.com" <tamas@tklengyel.com>, "wei.liu2@citrix.com" <wei.liu2@citrix.com>, "rcojocaru@bitdefender.com" <rcojocaru@bitdefender.com>, "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>, "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, "george.dunlap@citrix.com" <george.dunlap@citrix.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "roger.pau@citrix.com" <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

DQoNCk9uIDE1LjA0LjIwMTkgMTg6MzcsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+PiBBbGV4YW5k
cnUgU3RlZmFuIElTQUlMQSA8YWlzYWlsYUBiaXRkZWZlbmRlci5jb20+IDA0LzE1LzE5IDExOjIz
IEFNID4+Pg0KPj4gLS0tIGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9wMm0uaA0KPj4gKysrIGIveGVu
L2luY2x1ZGUvYXNtLXg4Ni9wMm0uaA0KPj4gQEAgLTUxNCw2ICs1MTQsMjMgQEAgc3RhdGljIGlu
bGluZSB1bnNpZ25lZCBsb25nIG1mbl90b19nZm4oc3RydWN0IGRvbWFpbiAqZCwgbWZuX3QgbWZu
KQ0KPiAgICAgICAgICAgPnJldHVybiBtZm5feChtZm4pOw0KPj4gfQ0KPiAgID4NCj4+ICtpbnQg
Z2V0X2FsdHAybV9lbnRyeShzdHJ1Y3QgcDJtX2RvbWFpbiAqYXAybSwgZ2ZuX3QgZ2ZuLCBtZm5f
dCAqbWZuLA0KPj4gKyAgICAgICAgICAgICAgICAgICAgIHAybV90eXBlX3QgKnQsIHAybV9hY2Nl
c3NfdCAqYSwgYm9vbCBwcmVwb3B1bGF0ZSk7DQo+PiArDQo+PiArc3RhdGljIGlubGluZSBpbnQg
YWx0cDJtX2dldF9lbnRyeV9kaXJlY3Qoc3RydWN0IHAybV9kb21haW4gKmFwMm0sDQo+PiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGdmbl90IGdmbiwgbWZu
X3QgKm1mbiwNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgcDJtX3R5cGVfdCAqdCwgcDJtX2FjY2Vzc190ICphKQ0KPj4gK3sNCj4+ICsgICAgcmV0dXJu
IGdldF9hbHRwMm1fZW50cnkoYXAybSwgZ2ZuLCBtZm4sIHQsIGEsIGZhbHNlKTsNCj4+ICt9DQo+
PiArDQo+PiArc3RhdGljIGlubGluZSBpbnQgYWx0cDJtX2dldF9lbnRyeV9wcmVwb3B1bGF0ZShz
dHJ1Y3QgcDJtX2RvbWFpbiAqYXAybSwNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGdmbl90IGdmbiwgbWZuX3QgKm1mbiwNCj4+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHAybV90eXBlX3QgKnQsIHAybV9h
Y2Nlc3NfdCAqYSkNCj4+ICt7DQo+PiArICAgIHJldHVybiBnZXRfYWx0cDJtX2VudHJ5KGFwMm0s
IGdmbiwgbWZuLCB0LCBhLCB0cnVlKTsNCj4+ICt9DQo+IA0KPiBUaGUgd29ya2VyIGZ1bmN0aW9u
IG5hbWUgd291bGQgaW1vIGJldHRlciBiZSBhbHRwMm1fZ2V0X2VudHJ5KCksIHRoZW4gaW4gbGlu
ZQ0KPiB3aXRoIGl0cyB0d28gd3JhcHBlcnMuDQo+IA0KDQpPayBpdCB3aWxsIGJlIGNoYW5nZWQg
aW4gdGhlIG5leHQgdmVyc2lvbi4NCg0KQWxleA0KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
