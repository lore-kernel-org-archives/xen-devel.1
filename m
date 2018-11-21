From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v1] x86/hvm: Generic instruction
 re-execution mechanism for execute faults
Date: Wed, 21 Nov 2018 12:41:26 +0100
Message-ID: <20181121114126.sblh3te5pkcciwuw@mac>
References: <20181116100624.21977-1-aisaila@bitdefender.com>
 <20181116170412.xrwuun3cqxll22l3@mac>
 <3d3ae38a-bfae-9908-dac6-163216f900e3@bitdefender.com>
 <20181119150824.lfquw2j2ehhvjbhk@mac>
 <638d0c37-68aa-6e68-480e-f3c1cc74777d@bitdefender.com>
 <20181121095654.6lez6zzstpl45qtt@mac>
 <bc6dfdf4-bd99-237c-707e-6f08eda0f825@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=uxe6=oa=citrix.com=prvs=856d7c560=roger.pau@srs-us1.protection.inumbo.net>)
 id 1gPQtJ-0001Sw-TO
 for xen-devel@lists.xenproject.org; Wed, 21 Nov 2018 11:41:57 +0000
Content-Disposition: inline
In-Reply-To: <bc6dfdf4-bd99-237c-707e-6f08eda0f825@bitdefender.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
Cc: "kevin.tian@intel.com" <kevin.tian@intel.com>, "tamas@tklengyel.com" <tamas@tklengyel.com>, "wei.liu2@citrix.com" <wei.liu2@citrix.com>, "jbeulich@suse.com" <jbeulich@suse.com>, "rcojocaru@bitdefender.com" <rcojocaru@bitdefender.com>, "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>, "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, Mihai =?utf-8?B?RG9uyJt1?= <mdontu@bitdefender.com>, Andrei Vlad LUTAS <vlutas@bitdefender.com>, "jun.nakajima@intel.com" <jun.nakajima@intel.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Anshul Makkar <anshul.makkar@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBOb3YgMjEsIDIwMTggYXQgMTA6Mjg6MThBTSArMDAwMCwgQWxleGFuZHJ1IFN0ZWZh
biBJU0FJTEEgd3JvdGU6Cj4gCj4gCj4gT24gMjEuMTEuMjAxOCAxMTo1NiwgUm9nZXIgUGF1IE1v
bm7DqSB3cm90ZToKPiA+IE9uIE1vbiwgTm92IDE5LCAyMDE4IGF0IDAzOjU2OjE0UE0gKzAwMDAs
IEFsZXhhbmRydSBTdGVmYW4gSVNBSUxBIHdyb3RlOgo+ID4+IE9uIDE5LjExLjIwMTggMTc6MDgs
IFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4gPiBBbHNvLCBhZnRlciBsb29raW5nIGF0IHRoZSBj
b2RlIEknbSBub3Qgc3VyZSBJIHNlZSB3aHkgdGhpcyBuZWVkcyB0bwo+ID4gYmUgVk1YIHNwZWNp
ZmljLCBBRkFJQ1QgaXQgZG9lc24ndCBkaXJlY3RseSBjYWxsIGFueSBWTVggZnVuY3Rpb25zPwo+
ID4gCj4gCj4gSXQgaXMgdm14IHNwZWNpZmljIGJlY2F1c2Ugc3ZtIGRvZXMgbm90IGhhdmUgc2lu
Z2xlIHN0ZXAuIFdlIHRhbGtlZCAKPiBhYm91dCBpbiB0aGUgcGFzdCBhYm91dCB0aGlzIGFuZCBp
dCB0dXJuZWQgb3V0IHRoYXQgaXQgd2FzIHRvIG11Y2ggCj4gdHJvdWJsZSB0byBtYWtlIGEgY3Vz
dG9tIHNpbmdsZSBzdGVwLgoKSSBzdGlsbCB0aGluayB0aGlzIHNob3VsZG4ndCBiZSBWTVggc3Bl
Y2lmaWMsIGFuZCB5b3Ugc2hvdWxkIGp1c3QKcmV0dXJuIC1FT1BOT1RTVVBQIGlmIHNpbmdsZSBz
dGVwcGluZyBpcyBub3Qgc3VwcG9ydGVkLCBqdXN0IGxpa2UKaHZtX2RlYnVnX29wIGRvZXMuIElu
IGZhY3QgSSdtIG1pc3NpbmcgYSBoZWxwZXIgdG8gc2V0IHNpbmdsZQpzdGVwcGluZywgd2hpY2gg
d291bGQgYmUgdGhlIHJpZ2h0IHBsYWNlIHRvIHJldHVybiAtRU9QTk9UU1VQUC4KClRoZW4geW91
ciByZXhlYyB3b3VsZG4ndCBuZWVkIHRvIGtub3cgYW55dGhpbmcgYWJvdXQgdGhlIGhhcmR3YXJl
IGFuZAp3b3VsZCBqdXN0IGF0dGVtcHQgdG8gc2V0IHNpbmdsZSBzdGVwcGluZywgZmFpbGluZyBp
ZiBpdCBjYW5ub3QgYmUKZW5hYmxlZC4KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
