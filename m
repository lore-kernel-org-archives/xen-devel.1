From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
Subject: Re: [PATCH v1] x86/hvm: Generic instruction
 re-execution mechanism for execute faults
Date: Thu, 22 Nov 2018 09:50:28 +0000
Message-ID: <e5dcca5e-6f19-f2d6-05f1-8659ea1dd2bb@bitdefender.com>
References: <20181116100624.21977-1-aisaila@bitdefender.com>
 <20181116170412.xrwuun3cqxll22l3@mac>
 <b83547dc-f8bd-d537-0407-fc371fee2ea7@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=5xyu=ob=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1gPld3-0002jd-H4
 for xen-devel@lists.xenproject.org; Thu, 22 Nov 2018 09:50:33 +0000
In-Reply-To: <b83547dc-f8bd-d537-0407-fc371fee2ea7@bitdefender.com>
Content-Language: en-US
Content-ID: <4DDA1ECE15BC0143B240938B436297D6@eurprd02.prod.outlook.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Cc: "kevin.tian@intel.com" <kevin.tian@intel.com>, "tamas@tklengyel.com" <tamas@tklengyel.com>, "wei.liu2@citrix.com" <wei.liu2@citrix.com>, "jbeulich@suse.com" <jbeulich@suse.com>, "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>, "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, =?utf-8?B?TWloYWkgRG9uyJt1?= <mdontu@bitdefender.com>, Andrei Vlad LUTAS <vlutas@bitdefender.com>, "jun.nakajima@intel.com" <jun.nakajima@intel.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Anshul Makkar <anshul.makkar@citrix.com>
List-Id: xen-devel@lists.xenproject.org

DQpPbiAyMS4xMS4yMDE4IDIwOjU1LCBSYXp2YW4gQ29qb2NhcnUgd3JvdGU6DQo+PiArICAgICAg
ICAgICAgaWYgKCBhID09IHYgKQ0KPj4gKyAgICAgICAgICAgICAgICBjb250aW51ZTsNCj4+ICsN
Cj4+ICsgICAgICAgICAgICAvKiBQYXVzZSwgc3luY2VkLiAqLw0KPj4gKyAgICAgICAgICAgIHdo
aWxlICggIWEtPmFyY2guaW5faG9zdCApDQo+IFdoeSBub3QgdXNlIGEtPmlzX3J1bm5pbmcgYXMg
YSB3YXkgdG8ga25vdyB3aGV0aGVyIHRoZSB2Q1BVIGlzDQo+IHJ1bm5pbmc/DQo+IA0KPiBJIHRo
aW5rIHRoZSBsb2dpYyBvZiB1c2luZyB2Y3B1X3BhdXNlIGFuZCBleHBlY3RpbmcgdGhlIHJ1bm5p
bmcgdmNwdQ0KPiB0byB0YWtlIGEgdm1leGl0IGFuZCB0aHVzIHNldCBpbl9ob3N0IGlzIHdyb25n
IGJlY2F1c2UgYSB2Y3B1IHRoYXQNCj4gd2Fzbid0IHJ1bm5pbmcgd2hlbiB2Y3B1X3BhdXNlX25v
c3luYyBpcyBjYWxsZWQgd29uJ3QgZ2V0IHNjaGVkdWxlZA0KPiBhbnltb3JlLCB0aHVzIG5vdCB0
YWtpbmcgYSB2bWV4aXQgYW5kIHRoaXMgZnVuY3Rpb24gd2lsbCBsb2NrdXAuDQoNCldlIGNhbiBy
ZXNvbHZlIHRoaXMgYnkgdXNpbmcgd2hpbGUgKCAhdmNwdV9ydW5uYWJsZShhKSAmJiANCiFhLT5h
cmNoLmluX2hvc3QgKSwgaWYgdGhpcyBpcyBzdWl0YWJsZS4NCg0KfkFsZXgNCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
