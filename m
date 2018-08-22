From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH 22/34] x86/mm: put HVM only code under
 CONFIG_HVM
Date: Wed, 22 Aug 2018 15:14:05 +0100
Message-ID: <20180822141405.modzgqaolpkv6sfa@citrix.com>
References: <cover.f5351150954129956fcf53a7781206b6295df78d.1534518694.git-series.wei.liu2@citrix.com>
 <fda67a2a1da3fc7fdca0231352ef4989ebb0d81b.1534518694.git-series.wei.liu2@citrix.com>
 <5B7BC83A02000078001E0476@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=om3v=lf=citrix.com=prvs=7650e4d92=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fsTtn-00063k-UN
 for xen-devel@lists.xenproject.org; Wed, 22 Aug 2018 14:14:15 +0000
Content-Disposition: inline
In-Reply-To: <5B7BC83A02000078001E0476@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wei.liu2@citrix.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBBdWcgMjEsIDIwMTggYXQgMDI6MDc6MjJBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDE3LjA4LjE4IGF0IDE3OjEyLCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gPiAtLS0gYS94ZW4vYXJjaC94ODYvbW0vTWFrZWZpbGUKPiA+ICsrKyBiL3hlbi9hcmNo
L3g4Ni9tbS9NYWtlZmlsZQo+ID4gQEAgLTIsOCArMiw5IEBAIHN1YmRpci15ICs9IHNoYWRvdwo+
ID4gIHN1YmRpci15ICs9IGhhcAo+ID4gIAo+ID4gIG9iai15ICs9IHBhZ2luZy5vCj4gPiAtb2Jq
LXkgKz0gcDJtLm8gcDJtLXB0Lm8gcDJtLWVwdC5vIHAybS1wb2Qubwo+ID4gLW9iai15ICs9IGFs
dHAybS5vCj4gPiArb2JqLXkgKz0gcDJtLm8gcDJtLXB0Lm8gcDJtLXBvZC5vCj4gPiArb2JqLSQo
Q09ORklHX0hWTSkgKz0gcDJtLWVwdC5vCj4gPiArb2JqLSQoQ09ORklHX0hWTSkgKz0gYWx0cDJt
Lm8KPiAKPiBQb0QgaXMgSFZNLW9ubHkgdG9vLgo+IAo+ID4gLS0tIGEveGVuL2FyY2gveDg2L21t
L2hhcC9NYWtlZmlsZQo+ID4gKysrIGIveGVuL2FyY2gveDg2L21tL2hhcC9NYWtlZmlsZQo+ID4g
QEAgLTMsNyArMyw3IEBAIG9iai15ICs9IGd1ZXN0X3dhbGtfMmxldmVsLm8KPiA+ICBvYmoteSAr
PSBndWVzdF93YWxrXzNsZXZlbC5vCj4gPiAgb2JqLXkgKz0gZ3Vlc3Rfd2Fsa180bGV2ZWwubwo+
ID4gIG9iai15ICs9IG5lc3RlZF9oYXAubwo+ID4gLW9iai15ICs9IG5lc3RlZF9lcHQubwo+ID4g
K29iai0kKENPTkZJR19IVk0pICs9IG5lc3RlZF9lcHQubwo+IAo+IEFzIGZvbGxvd3MgZnJvbSB0
aGUgcmVwbHkgdG8gdGhlIHByZXZpb3VzIHBhdGNoLCB0aGUgZW50aXJlIGhhcC8gc2hvdWxkCj4g
YmUgZXhjbHVkZWQgd2hlbiAhSFZNLgoKT0suIEkgd2lsbCBwdXQgcG9kIGFuZCBoYXAgdW5kZXIg
Q09ORklHX0hWTSBhcyB3ZWxsLgoKPiAKPiA+IC0tLSBhL3hlbi9hcmNoL3g4Ni9tbS9wMm0uYwo+
ID4gKysrIGIveGVuL2FyY2gveDg2L21tL3AybS5jCj4gPiBAQCAtNTMxLDcgKzUzMSw3IEBAIHN0
cnVjdCBwYWdlX2luZm8gKnAybV9nZXRfcGFnZV9mcm9tX2dmbigKPiA+ICBpbnQgcDJtX3NldF9l
bnRyeShzdHJ1Y3QgcDJtX2RvbWFpbiAqcDJtLCBnZm5fdCBnZm4sIG1mbl90IG1mbiwKPiA+ICAg
ICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgcGFnZV9vcmRlciwgcDJtX3R5cGVfdCBwMm10
LCBwMm1fYWNjZXNzX3QgcDJtYSkKPiA+ICB7Cj4gPiAtICAgIHN0cnVjdCBkb21haW4gKmQgPSBw
Mm0tPmRvbWFpbjsKPiA+ICsgICAgc3RydWN0IGRvbWFpbiAqIF9fbWF5YmVfdW51c2VkIGQgPSBw
Mm0tPmRvbWFpbjsKPiAKPiBUaGlzIHByZXN1bWFibHkgYWdhaW4gaXMgYSByZXN1bHQgb2YgdXNp
bmcgYSBtYWNybyBzb21ld2hlcmUgd2hpY2gKPiBkb2Vzbid0IGV2YWx1YXRlIGl0cyBhcmd1bWVu
dChzKT8KCk5vLiBJbiB0aGlzIGNhc2UgaXQgaXMgYmVjYXVzZSB0aGUgY29kZSB3aGljaCB1c2Vz
IGQgaXMgZ3VhcmRlZCBieQpDT05GSUdfSFZNLgoKPiAKPiA+IEBAIC0yMTY1LDYgKzIxNTksMTQg
QEAgaW50IHVubWFwX21taW9fcmVnaW9ucyhzdHJ1Y3QgZG9tYWluICpkLAo+ID4gICAgICByZXR1
cm4gaSA9PSBuciA/IDAgOiBpID86IHJldDsKPiA+ICB9Cj4gPiAgCj4gPiArI2lmIENPTkZJR19I
Vk0KPiAKPiAjaWZkZWYgKGFsc28gZWxzZXdoZXJlOyBkaWQgSSBvdmVybG9vayBzaW1pbGFyIGlz
c3VlcyBpbiBlYXJsaWVyIHBhdGNoZXM/KQo+IAoKT0suCgpXZWkuCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
