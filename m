From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v1] x86/hvm: Generic instruction
 re-execution mechanism for execute faults
Date: Thu, 22 Nov 2018 11:07:39 +0100
Message-ID: <20181122100739.li2fcsaquq6rens7@mac>
References: <20181116100624.21977-1-aisaila@bitdefender.com>
 <20181116170412.xrwuun3cqxll22l3@mac>
 <b83547dc-f8bd-d537-0407-fc371fee2ea7@bitdefender.com>
 <e5dcca5e-6f19-f2d6-05f1-8659ea1dd2bb@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mIHh=OB=citrix.com=prvs=8571d395d=roger.pau@srs-us1.protection.inumbo.net>)
 id 1gPltz-0005By-73
 for xen-devel@lists.xenproject.org; Thu, 22 Nov 2018 10:08:03 +0000
Content-Disposition: inline
In-Reply-To: <e5dcca5e-6f19-f2d6-05f1-8659ea1dd2bb@bitdefender.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
Cc: "kevin.tian@intel.com" <kevin.tian@intel.com>, "tamas@tklengyel.com" <tamas@tklengyel.com>, "wei.liu2@citrix.com" <wei.liu2@citrix.com>, "jun.nakajima@intel.com" <jun.nakajima@intel.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>, "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, Mihai =?utf-8?B?RG9uyJt1?= <mdontu@bitdefender.com>, Andrei Vlad LUTAS <vlutas@bitdefender.com>, "jbeulich@suse.com" <jbeulich@suse.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Anshul Makkar <anshul.makkar@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBOb3YgMjIsIDIwMTggYXQgMDk6NTA6MjhBTSArMDAwMCwgQWxleGFuZHJ1IFN0ZWZh
biBJU0FJTEEgd3JvdGU6Cj4gCj4gT24gMjEuMTEuMjAxOCAyMDo1NSwgUmF6dmFuIENvam9jYXJ1
IHdyb3RlOgo+ID4+ICsgICAgICAgICAgICBpZiAoIGEgPT0gdiApCj4gPj4gKyAgICAgICAgICAg
ICAgICBjb250aW51ZTsKPiA+PiArCj4gPj4gKyAgICAgICAgICAgIC8qIFBhdXNlLCBzeW5jZWQu
ICovCj4gPj4gKyAgICAgICAgICAgIHdoaWxlICggIWEtPmFyY2guaW5faG9zdCApCj4gPiBXaHkg
bm90IHVzZSBhLT5pc19ydW5uaW5nIGFzIGEgd2F5IHRvIGtub3cgd2hldGhlciB0aGUgdkNQVSBp
cwo+ID4gcnVubmluZz8KPiA+IAo+ID4gSSB0aGluayB0aGUgbG9naWMgb2YgdXNpbmcgdmNwdV9w
YXVzZSBhbmQgZXhwZWN0aW5nIHRoZSBydW5uaW5nIHZjcHUKPiA+IHRvIHRha2UgYSB2bWV4aXQg
YW5kIHRodXMgc2V0IGluX2hvc3QgaXMgd3JvbmcgYmVjYXVzZSBhIHZjcHUgdGhhdAo+ID4gd2Fz
bid0IHJ1bm5pbmcgd2hlbiB2Y3B1X3BhdXNlX25vc3luYyBpcyBjYWxsZWQgd29uJ3QgZ2V0IHNj
aGVkdWxlZAo+ID4gYW55bW9yZSwgdGh1cyBub3QgdGFraW5nIGEgdm1leGl0IGFuZCB0aGlzIGZ1
bmN0aW9uIHdpbGwgbG9ja3VwLgo+IAo+IFdlIGNhbiByZXNvbHZlIHRoaXMgYnkgdXNpbmcgd2hp
bGUgKCAhdmNwdV9ydW5uYWJsZShhKSAmJiAKPiAhYS0+YXJjaC5pbl9ob3N0ICksIGlmIHRoaXMg
aXMgc3VpdGFibGUuCgpJJ20gYWZyYWlkIHRoYXQgd2l0aG91dCBhIHJlYXNvbiB3aHkgdGhlIGdl
bmVyaWMgdmNwdV9wYXVzZSBpcyBub3QKc3VpdGFibGUgaGVyZSBhZGRpbmcgbW9yZSBjb2RlIHRv
IGl0IGlzIGp1c3QgcGFwZXJpbmcgb3ZlciB0aGUgcmVhbAppc3N1ZS4KClRoYW5rcywgUm9nZXIu
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
