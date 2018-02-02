From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v3 13/25] x86emul: adjust_bnd() should check
	XCR0
Date: Fri, 02 Feb 2018 09:19:33 -0700
Message-ID: <5A749DA502000078001A4AE5@prv-mh.provo.novell.com>
References: <5A29550C020000780019585B@prv-mh.provo.novell.com>
 <5A29597D0200007800195900@prv-mh.provo.novell.com>
 <6b93de9a-44af-d28e-8660-1c685e3fb8bd@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=z1uz=e4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ehe3y-0003Rq-Ku
 for xen-devel@lists.xenproject.org; Fri, 02 Feb 2018 16:19:42 +0000
In-Reply-To: <6b93de9a-44af-d28e-8660-1c685e3fb8bd@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAyLjAyLjE4IGF0IDE0OjMwLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMDcvMTIvMTcgMTQ6MDgsIEphbiBCZXVsaWNoIHdyb3RlOgo+PiBFeHBlcmltZW50
YWxseSBNUFggaW5zdHJ1Y3Rpb25zIGhhdmUgYmVlbiBjb25maXJtZWQgdG8gYmVoYXZlIGFzIE5P
UHMKPj4gdW5sZXNzIGJvdGggcmVsYXRlZCBYQ1IwIGJpdHMgYXJlIHNldCB0byAxLiBCeSBpbXBs
aWNhdGlvbiBicmFuY2hlcwo+PiB0aGVuIGFsc28gZG9uJ3QgY2xlYXIgQk5Ebi4KPj4KPj4gU2ln
bmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+Pgo+PiAtLS0gYS94
ZW4vYXJjaC94ODYveDg2X2VtdWxhdGUveDg2X2VtdWxhdGUuYwo+PiArKysgYi94ZW4vYXJjaC94
ODYveDg2X2VtdWxhdGUveDg2X2VtdWxhdGUuYwo+PiBAQCAtMjE0MywxMiArMjE0MywxNiBAQCBz
dGF0aWMgYm9vbCB1bWlwX2FjdGl2ZShzdHJ1Y3QgeDg2X2VtdWxhCj4+ICBzdGF0aWMgdm9pZCBh
ZGp1c3RfYm5kKHN0cnVjdCB4ODZfZW11bGF0ZV9jdHh0ICpjdHh0LAo+PiAgICAgICAgICAgICAg
ICAgICAgICAgICBjb25zdCBzdHJ1Y3QgeDg2X2VtdWxhdGVfb3BzICpvcHMsIGVudW0gdmV4X3Bm
eCBwZngpCj4+ICB7Cj4+IC0gICAgdWludDY0X3QgYm5kY2ZnOwo+PiArICAgIHVpbnQ2NF90IHhj
cjAsIGJuZGNmZzsKPj4gICAgICBpbnQgcmM7Cj4+ICAKPj4gICAgICBpZiAoIHBmeCA9PSB2ZXhf
ZjIgfHwgIWNwdV9oYXNfbXB4IHx8ICF2Y3B1X2hhc19tcHgoKSApCj4+ICAgICAgICAgIHJldHVy
bjsKPj4gIAo+PiArICAgIGlmICggIW9wcy0+cmVhZF94Y3IgfHwgb3BzLT5yZWFkX3hjcigwLCAm
eGNyMCwgY3R4dCkgIT0gWDg2RU1VTF9PS0FZIHx8Cj4+ICsgICAgICAgICAhKHhjcjAgJiBYU1RB
VEVfQk5EUkVHUykgfHwgISh4Y3IwICYgWFNUQVRFX0JORENTUikgKQo+IAo+ICEoeGNyMCAmIChY
U1RBVEVfQk5EUkVHUyB8IFhTVEFURV9CTkRDU1IpKSA/CgpObywgSSBtZWFuICJpZiBlaXRoZXIg
Yml0IGlzIGNsZWFyIiwgbm90ICJpZiBib3RoIGJpdHMgYXJlIGNsZWFyIi4gSSB0aGluawp3ZSBo
YWQgZGlzY3Vzc2VkIGJlZm9yZSB0aGF0IGJvdGggYml0cyBuZWVkIHRvIGJlIDEgaW4gb3JkZXIg
Zm9yCmJvdW5kcyBjaGVja2luZyB0byBhY3R1YWxseSB3b3JrLgoKPiBPdGhlcndpc2UsIFJldmll
d2VkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoKUGxlYXNl
IGNsYXJpZnkgdGhpcyBpbiBsaWdodCBvZiB0aGUgYWJvdmUuCgpKYW4KCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
