From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/xen: init %gs very early to avoid page
 faults with stack protector
Date: Thu, 1 Feb 2018 12:22:05 +0000
Message-ID: <66ad81d7-0230-d0a5-f4fb-9dbbd8162884__23084.3377220028$1517487668$gmane$org@citrix.com>
References: <20180201121601.1268-1-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=mbmt=e3=citrix.com=prvs=5634bc667=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ehDsb-00028T-PE
 for xen-devel@lists.xenproject.org; Thu, 01 Feb 2018 12:22:13 +0000
In-Reply-To: <20180201121601.1268-1-jgross@suse.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org
Cc: boris.ostrovsky@oracle.com, stable@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

T24gMDEvMDIvMTggMTI6MTYsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4gV2hlbiBydW5uaW5nIGFz
IFhlbiBwdiBndWVzdCAlZ3MgaXMgaW5pdGlhbGl6ZWQgc29tZSB0aW1lIGFmdGVyCj4gQyBjb2Rl
IGlzIHN0YXJ0ZWQuIERlcGVuZGluZyBvbiBzdGFjayBwcm90ZWN0b3IgdXNhZ2UgdGhpcyBtaWdo
dCBiZQo+IHRvbyBsYXRlLCByZXN1bHRpbmcgaW4gcGFnZSBmYXVsdHMuCj4KPiBTbyBzZXR1cCAl
Z3MgYW5kIE1TUl9HU19CQVNFIGluIGFzc2VtYmx5IGNvZGUgYWxyZWFkeS4KPgo+IENjOiBzdGFi
bGVAdmdlci5rZXJuZWwub3JnCj4gU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3Nz
QHN1c2UuY29tPgo+IC0tLQo+ICBhcmNoL3g4Ni94ZW4veGVuLWhlYWQuUyB8IDE0ICsrKysrKysr
KysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0
IGEvYXJjaC94ODYveGVuL3hlbi1oZWFkLlMgYi9hcmNoL3g4Ni94ZW4veGVuLWhlYWQuUwo+IGlu
ZGV4IDQ5N2NjNTVhMGMxNi4uYjQ3ZDg3MDc2ZWZiIDEwMDY0NAo+IC0tLSBhL2FyY2gveDg2L3hl
bi94ZW4taGVhZC5TCj4gKysrIGIvYXJjaC94ODYveGVuL3hlbi1oZWFkLlMKPiBAQCAtOSw3ICs5
LDkgQEAKPiAgCj4gICNpbmNsdWRlIDxhc20vYm9vdC5oPgo+ICAjaW5jbHVkZSA8YXNtL2FzbS5o
Pgo+ICsjaW5jbHVkZSA8YXNtL21zci5oPgo+ICAjaW5jbHVkZSA8YXNtL3BhZ2VfdHlwZXMuaD4K
PiArI2luY2x1ZGUgPGFzbS9wZXJjcHUuaD4KPiAgI2luY2x1ZGUgPGFzbS91bndpbmRfaGludHMu
aD4KPiAgCj4gICNpbmNsdWRlIDx4ZW4vaW50ZXJmYWNlL2VsZm5vdGUuaD4KPiBAQCAtMzUsNiAr
MzcsMTggQEAgRU5UUlkoc3RhcnR1cF94ZW4pCj4gIAltb3YgJV9BU01fU0ksIHhlbl9zdGFydF9p
bmZvCj4gIAltb3YgJGluaXRfdGhyZWFkX3VuaW9uK1RIUkVBRF9TSVpFLCAlX0FTTV9TUAo+ICAK
PiArCS8qIFNldCB1cCAlZ3MuCj4gKwkgKgo+ICsJICogVGhlIGJhc2Ugb2YgJWdzIGFsd2F5cyBw
b2ludHMgdG8gdGhlIGJvdHRvbSBvZiB0aGUgaXJxc3RhY2sKPiArCSAqIHVuaW9uLiAgSWYgdGhl
IHN0YWNrIHByb3RlY3RvciBjYW5hcnkgaXMgZW5hYmxlZCwgaXQgaXMKPiArCSAqIGxvY2F0ZWQg
YXQgJWdzOjQwLiAgTm90ZSB0aGF0LCBvbiBTTVAsIHRoZSBib290IGNwdSB1c2VzCj4gKwkgKiBp
bml0IGRhdGEgc2VjdGlvbiB0aWxsIHBlciBjcHUgYXJlYXMgYXJlIHNldCB1cC4KPiArCSAqLwo+
ICsJbW92bAkkTVNSX0dTX0JBU0UsJWVjeAo+ICsJbW92cQkkSU5JVF9QRVJfQ1BVX1ZBUihpcnFf
c3RhY2tfdW5pb24pLCVyYXgKPiArCWNkcQo+ICsJd3Jtc3IKCllvdSBzdXJlbHkgd2FudCBhICNp
ZmRlZiBfX3g4Nl82NF9fID/CoCBUaGlzIHBhdGggaXMgY29tbW9uIHRvIHRoZSAzMmJpdAplbnRy
eSBhcyB3ZWxsPwoKfkFuZHJldwoKPiArCj4gIAlqbXAgeGVuX3N0YXJ0X2tlcm5lbAo+ICBFTkQo
c3RhcnR1cF94ZW4pCj4gIAlfX0ZJTklUCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
