From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v3 13/25] x86emul: adjust_bnd() should check
 XCR0
Date: Fri, 2 Feb 2018 16:28:17 +0000
Message-ID: <4de42589-2733-9a7f-6555-bc93df29e3e8@citrix.com>
References: <5A29550C020000780019585B@prv-mh.provo.novell.com>
 <5A29597D0200007800195900@prv-mh.provo.novell.com>
 <6b93de9a-44af-d28e-8660-1c685e3fb8bd@citrix.com>
 <5A749DA502000078001A4AE5@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=g0dj=e4=citrix.com=prvs=564f8cbd0=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1eheGj-0005Bs-80
 for xen-devel@lists.xenproject.org; Fri, 02 Feb 2018 16:32:53 +0000
In-Reply-To: <5A749DA502000078001A4AE5@prv-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMDIvMDIvMTggMTY6MTksIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDAyLjAyLjE4IGF0
IDE0OjMwLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4+IE9uIDA3LzEyLzE3
IDE0OjA4LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+IEV4cGVyaW1lbnRhbGx5IE1QWCBpbnN0cnVj
dGlvbnMgaGF2ZSBiZWVuIGNvbmZpcm1lZCB0byBiZWhhdmUgYXMgTk9Qcwo+Pj4gdW5sZXNzIGJv
dGggcmVsYXRlZCBYQ1IwIGJpdHMgYXJlIHNldCB0byAxLiBCeSBpbXBsaWNhdGlvbiBicmFuY2hl
cwo+Pj4gdGhlbiBhbHNvIGRvbid0IGNsZWFyIEJORG4uCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+Pj4KPj4+IC0tLSBhL3hlbi9hcmNoL3g4
Ni94ODZfZW11bGF0ZS94ODZfZW11bGF0ZS5jCj4+PiArKysgYi94ZW4vYXJjaC94ODYveDg2X2Vt
dWxhdGUveDg2X2VtdWxhdGUuYwo+Pj4gQEAgLTIxNDMsMTIgKzIxNDMsMTYgQEAgc3RhdGljIGJv
b2wgdW1pcF9hY3RpdmUoc3RydWN0IHg4Nl9lbXVsYQo+Pj4gIHN0YXRpYyB2b2lkIGFkanVzdF9i
bmQoc3RydWN0IHg4Nl9lbXVsYXRlX2N0eHQgKmN0eHQsCj4+PiAgICAgICAgICAgICAgICAgICAg
ICAgICBjb25zdCBzdHJ1Y3QgeDg2X2VtdWxhdGVfb3BzICpvcHMsIGVudW0gdmV4X3BmeCBwZngp
Cj4+PiAgewo+Pj4gLSAgICB1aW50NjRfdCBibmRjZmc7Cj4+PiArICAgIHVpbnQ2NF90IHhjcjAs
IGJuZGNmZzsKPj4+ICAgICAgaW50IHJjOwo+Pj4gIAo+Pj4gICAgICBpZiAoIHBmeCA9PSB2ZXhf
ZjIgfHwgIWNwdV9oYXNfbXB4IHx8ICF2Y3B1X2hhc19tcHgoKSApCj4+PiAgICAgICAgICByZXR1
cm47Cj4+PiAgCj4+PiArICAgIGlmICggIW9wcy0+cmVhZF94Y3IgfHwgb3BzLT5yZWFkX3hjcigw
LCAmeGNyMCwgY3R4dCkgIT0gWDg2RU1VTF9PS0FZIHx8Cj4+PiArICAgICAgICAgISh4Y3IwICYg
WFNUQVRFX0JORFJFR1MpIHx8ICEoeGNyMCAmIFhTVEFURV9CTkRDU1IpICkKPj4gISh4Y3IwICYg
KFhTVEFURV9CTkRSRUdTIHwgWFNUQVRFX0JORENTUikpID8KPiBObywgSSBtZWFuICJpZiBlaXRo
ZXIgYml0IGlzIGNsZWFyIiwgbm90ICJpZiBib3RoIGJpdHMgYXJlIGNsZWFyIi4gSSB0aGluawo+
IHdlIGhhZCBkaXNjdXNzZWQgYmVmb3JlIHRoYXQgYm90aCBiaXRzIG5lZWQgdG8gYmUgMSBpbiBv
cmRlciBmb3IKPiBib3VuZHMgY2hlY2tpbmcgdG8gYWN0dWFsbHkgd29yay4KPgo+PiBPdGhlcndp
c2UsIFJldmlld2VkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29t
Pgo+IFBsZWFzZSBjbGFyaWZ5IHRoaXMgaW4gbGlnaHQgb2YgdGhlIGFib3ZlLgoKQXJjaGl0ZWN0
dXJhbGx5LCB0aGV5IGNhbid0IGJlIGRpZmZlcmVudCwgd2hpY2ggaXMgd2h5IHRoZSBhYm92ZSBs
b2dpYwpsb29rcyBzdXNwaWNpb3VzLgoKR2l2ZW4gdGhhdCB0aGUgYWN0dWFsIGlzbid0IHdyb25n
LCBJIHdvbid0IG9iamVjdCwgYnV0IGl0IGRvZXMgbG9vawp3cm9uZyB0byBjb21wYXJlIHRoZW0g
aW5kaXZpZHVhbGx5LgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
