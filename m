From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
Subject: Re: [PATCH v1] x86/hvm: Generic instruction
 re-execution mechanism for execute faults
Date: Wed, 19 Dec 2018 16:49:43 +0000
Message-ID: <516bea73-f88a-9f96-9619-fa32f9726dca@bitdefender.com>
References: <20181123085402.663pdh75rhqtxsf4@mac>
 <67fa7dc6-3aff-a5fd-4105-dce19a89448c@bitdefender.com>
 <20181127113205.ohli6saatlwid7ua@mac>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0gmM=O4=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1gZf2a-0003PL-HK
 for xen-devel@lists.xenproject.org; Wed, 19 Dec 2018 16:49:48 +0000
In-Reply-To: <20181127113205.ohli6saatlwid7ua@mac>
Content-Language: en-US
Content-ID: <21A5637DD9DBB44E9EC56287D58625D4@eurprd02.prod.outlook.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>
Cc: "kevin.tian@intel.com" <kevin.tian@intel.com>, "tamas@tklengyel.com" <tamas@tklengyel.com>, "wei.liu2@citrix.com" <wei.liu2@citrix.com>, "jbeulich@suse.com" <jbeulich@suse.com>, "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>, "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, =?utf-8?B?TWloYWkgRG9uyJt1?= <mdontu@bitdefender.com>, Andrei Vlad LUTAS <vlutas@bitdefender.com>, "jun.nakajima@intel.com" <jun.nakajima@intel.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMjcuMTEuMjAxOCAxMzozMiwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToNCj4gV291bGQgaXQg
YmUgcG9zc2libGUgdG8gYWRkIHNvbWUga2luZCBvZiBmbGFnIHRvIHRoZSBlbXVsYXRvciB0bw0K
PiBzaWduYWwgd2hldGhlciBwMm0gcmVzdHJpY3Rpb25zIHNob3VsZCBiZSBlbmZvcmNlZC9pZ25v
cmVkPw0KPiBodm1lbXVsX2FjcXVpcmVfcGFnZSBzZWVtcyBsaWtlIGEgc3VpdGFibGUgcGxhY2Us
IGJ1dCBJJ20gbm90IHRoYXQNCj4gZmFtaWxpYXIgd2l0aCB0aGUgZW11bGF0b3IuDQo+IA0KPiBU
aGVuIHlvdSBjb3VsZCBnZW5lcmF0ZSB2bSBldmVudHMgZnJvbSB0aGUgZW11bGF0b3IgaXRzZWxm
LCB3aGljaA0KPiBBRkFJQ1QgaXMgdGhlIG9ubHkgd2F5IHRvIGhhbmRsZSB0aGlzIGluc3RydWN0
aW9uIGV4ZWN1dGlvbiBpc3N1ZS4NCg0KSSd2ZSBiZWVuIHRlc3Rpbmcgd2hhdCBwbGFjZSB3b3Vs
ZCBiZSB0aGUgYmVzdCB0byBoYXZlIHRoZSBlbXVsYXRvciBzZW5kIA0KYSBldmVudCBhbmQgaXQg
dHVybnMgb3V0IHRoZSBodm1lbXVsX2FjcXVpcmVfcGFnZSBpcyBub3Qgb2suIFdoYXQgd29ya2Vk
IA0KZm9ybSBtZSB3YXMgaGF2aW5nIHRoZSBlbXVsYXRvciBzZW5kIHdyaXRlIGFjY2VzcyB2aW9s
YXRpb25zIGZyb20gDQpodm1lbXVsX21hcF9saW5lYXJfYWRkcigpLiBIZXJlIEkgY2FuIGdldCB0
aGUgZ2ZuLCBnbGEgYW5kIG9mZnNldCBmb3IgDQp0aGUgZXZlbnQuDQoNCkZvciB0aGUgZXhlYyBh
Y2Nlc3MgdmlvbGF0aW9uIEkndmUgdHJpZWQgdG8gc2VuZCBldmVudHMgZnJvbSANCmh2bWVtdWxf
aW5zbl9mZXRjaCgpIGJ1dCB0aGVyZSBpcyBhIHByb2JsZW0gdG8gZ2V0IHRoZSBzYW1lIHZhcmlh
YmxlcyANCmZvciB0aGUgZXZlbnQuIElzIHRoZXJlIGEgd2F5IHRvIGdvIGFyb3VuZCBhbmQgZ2V0
IHRob3NlIHBhcmFtcyBmb3IgdGhlIA0KZXZlbnQ/IEFueSB0aG91Z2h0cyBhcmUgYXBwcmVjaWF0
ZWQuDQoNClJlZ2FyZHMsDQpBbGV4DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
