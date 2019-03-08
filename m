From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 6/6] x86: introduce dr_mask_idx() helper
 function...
Date: Fri, 8 Mar 2019 17:10:01 +0000
Message-ID: <48d42739-27ab-b7a0-2130-a19ffdacfe8d@citrix.com>
References: <20190107120258.17897-1-paul.durrant@citrix.com>
 <20190107120258.17897-7-paul.durrant@citrix.com>
 <5C829F19020000780021CC80@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NONk=RL=citrix.com=prvs=9636e147a=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1h2J1c-0007ii-DK
 for xen-devel@lists.xenproject.org; Fri, 08 Mar 2019 17:11:12 +0000
In-Reply-To: <5C829F19020000780021CC80@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Paul Durrant <paul.durrant@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDgvMDMvMjAxOSAxNjo1OCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMDcuMDEuMTkg
YXQgMTM6MDIsIDxwYXVsLmR1cnJhbnRAY2l0cml4LmNvbT4gd3JvdGU6Cj4+IEBAIC0yMDIsMTMg
KzIwMSwxMCBAQCBpbnQgZ3Vlc3RfcmRtc3Ioc3RydWN0IHZjcHUgKnYsIHVpbnQzMl90IG1zciwg
dWludDY0X3QgKnZhbCkKPj4gICAgICAgICAgICovCj4+ICAjaWZkZWYgQ09ORklHX0hWTQo+PiAg
ICAgICAgICBpZiAoIHYgPT0gY3VycmVudCAmJiBpc19odm1fZG9tYWluKGQpICYmIHYtPmFyY2gu
aHZtLmZsYWdfZHJfZGlydHkgKQo+PiAtICAgICAgICAgICAgcmRtc3JsKG1zciwgKnZhbCk7Cj4+
IC0gICAgICAgIGVsc2UKPj4gKyAgICAgICAgICAgIHJkbXNybChtc3IsIG1zcnMtPmRyX21hc2tb
ZHJfbWFza19pZHgobXNyKV0pOwo+PiAgI2VuZGlmCj4+IC0gICAgICAgICAgICAqdmFsID0gbXNy
cy0+ZHJfbWFza1sKPj4gLSAgICAgICAgICAgICAgICBhcnJheV9pbmRleF9ub3NwZWMoKG1zciA9
PSBNU1JfQU1ENjRfRFIwX0FERFJFU1NfTUFTSykKPj4gLSAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgPyAwIDogKG1zciAtIE1TUl9BTUQ2NF9EUjFfQUREUkVTU19NQVNLICsgMSks
Cj4+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEFSUkFZX1NJWkUobXNycy0+
ZHJfbWFzaykpXTsKPj4gKwo+PiArICAgICAgICAqdmFsID0gbXNycy0+ZHJfbWFza1tkcl9tYXNr
X2lkeChtc3IpXTsKPj4gICAgICAgICAgYnJlYWs7Cj4gV2hpbGUgSSBkb24ndCByZWFsbHkgbWlu
ZCB0aGlzIGJlaGF2aW9yYWwgY2hhbmdlIChvZiB1cGRhdGluZyAqbXNycyksCj4gSSdkIGxpa2Ug
dG8gZ2V0IEFuZHJldydzIG9waW5pb24gb24gdGhpcyBmcm9tIGEgY29uY2VwdHVhbCBwb3YuCgpT
bywgY29uc2lkZXJpbmcuLi4KCj4KPj4gQEAgLTMxNyw2ICszMTgsMjYgQEAgc3RydWN0IHZjcHVf
bXNycwo+PiAgICAgIH0geHNzOwo+PiAgfTsKPj4gIAo+PiArc3RhdGljIGlubGluZSB1bnNpZ25l
ZCBpbnQgZHJfbWFza19pZHgodWludDMyX3QgbXNyKQo+PiArewo+PiArICAgIHN3aXRjaCAobXNy
KQo+IE1pc3NpbmcgYmxhbmtzIGltbWVkaWF0ZWx5IGluc2lkZSB0aGUgcGFyZW50aGVzZXMuCj4K
Pj4gKyAgICB7Cj4+ICsgICAgZGVmYXVsdDoKPj4gKyAgICAgICAgQVNTRVJUX1VOUkVBQ0hBQkxF
KCk7Cj4+ICsgICAgICAgIC8qIEZhbGx0aHJvdWdoICovCj4+ICsgICAgY2FzZSBNU1JfQU1ENjRf
RFIwX0FERFJFU1NfTUFTSzoKPj4gKyAgICAgICAgcmV0dXJuIDA7CgouLi4gdGhpcyByZWludHJv
ZHVjZXMgYSBoYWxmLVNwZWN0cmUtdjEgZ2FkZ2V0LCBJJ20gLTEgZm9yIHRoZSBjaGFuZ2UuCgpJ
IGRvbid0IGFudGljaXBhdGUgdGhpcyB0cmFuc2xhdGlvbiBiZWluZyBuZWVkZWQgYW55d2hlcmUg
ZWxzZSwgd2hpY2ggaXMKd2h5IEkgZGlkbid0IGludHJvZHVjZSBhIGhlbHBlciB0aGUgZmlyc3Qg
dGltZSBhcm91bmQuCgpJJ2QganVzdCBkcm9wIHRoZSBwYXRjaCBhbmQgbGVhdmUgdGhlIGNvZGUg
YXMgaXQgaXMuCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
