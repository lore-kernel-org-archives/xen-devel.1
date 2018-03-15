From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v5 03/14] x86emul: abstract out XCRn accesses
Date: Thu, 15 Mar 2018 15:41:57 +0000
Message-ID: <f3208b0b-b7cb-92bb-c75b-577aa10a8e07@citrix.com>
References: <5AAA7BAF02000078001B2242@prv-mh.provo.novell.com>
 <5AAA7D6902000078001B225C@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=h5rp=gf=citrix.com=prvs=605c7d53e=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ewVEO-0006Z5-Je
 for xen-devel@lists.xenproject.org; Thu, 15 Mar 2018 15:55:52 +0000
In-Reply-To: <5AAA7D6902000078001B225C@prv-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Paul Durrant <paul.durrant@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTUvMDMvMTggMTM6MDQsIEphbiBCZXVsaWNoIHdyb3RlOgo+IC0tLSBhL3hlbi9hcmNoL3g4
Ni94ODZfZW11bGF0ZS5jCj4gKysrIGIveGVuL2FyY2gveDg2L3g4Nl9lbXVsYXRlLmMKPiBAQCAt
NDIsMyArNDIsNTAgQEAKPiAgfSkKPiAgCj4gICNpbmNsdWRlICJ4ODZfZW11bGF0ZS94ODZfZW11
bGF0ZS5jIgo+ICsKPiAraW50IHg4NmVtdWxfcmVhZF94Y3IodW5zaWduZWQgaW50IHJlZywgdWlu
dDY0X3QgKnZhbCwKPiArICAgICAgICAgICAgICAgICAgICAgc3RydWN0IHg4Nl9lbXVsYXRlX2N0
eHQgKmN0eHQpCj4gK3sKPiArICAgIHN3aXRjaCAoIHJlZyApCj4gKyAgICB7Cj4gKyAgICBjYXNl
IDA6Cj4gKyAgICAgICAgKnZhbCA9IGN1cnJlbnQtPmFyY2gueGNyMDsKPiArICAgICAgICByZXR1
cm4gWDg2RU1VTF9PS0FZOwo+ICsKPiArICAgIGNhc2UgMToKPiArICAgICAgICBpZiAoIGNwdV9o
YXNfeGdldGJ2MSAmJiBjdXJyZW50LT5kb21haW4tPmFyY2guY3B1aWQtPnhzdGF0ZS54Z2V0YnYx
ICkKPiArICAgICAgICAgICAgYnJlYWs7Cj4gKyAgICAgICAgLyogZmFsbCB0aHJvdWdoICovCj4g
KyAgICBkZWZhdWx0Ogo+ICsgICAgICAgIHg4Nl9lbXVsX2h3X2V4Y2VwdGlvbihUUkFQX2dwX2Zh
dWx0LCAwLCBjdHh0KTsKPiArICAgICAgICByZXR1cm4gWDg2RU1VTF9FWENFUFRJT047Cj4gKyAg
ICB9Cj4gKwo+ICsgICAgKnZhbCA9IHhnZXRidihyZWcpOwo+ICsKPiArICAgIHJldHVybiBYODZF
TVVMX09LQVk7Cj4gK30KPiArCj4gK2ludCB4ODZlbXVsX3dyaXRlX3hjcih1bnNpZ25lZCBpbnQg
cmVnLCB1aW50NjRfdCB2YWwsCj4gKyAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgeDg2X2Vt
dWxhdGVfY3R4dCAqY3R4dCkKPiArewo+ICsgICAgc3dpdGNoICggcmVnICkKPiArICAgIHsKPiAr
ICAgIGNhc2UgMDoKPiArICAgICAgICBicmVhazsKPiArCj4gKyAgICBjYXNlIDE6Cj4gKyAgICAg
ICAgaWYgKCBjcHVfaGFzX3hnZXRidjEgJiYgY3VycmVudC0+ZG9tYWluLT5hcmNoLmNwdWlkLT54
c3RhdGUueGdldGJ2MSApCj4gKyAgICAgICAgICAgIGJyZWFrOwo+ICsgICAgICAgIC8qIGZhbGwg
dGhyb3VnaCAqLwoKQWN0dWFsbHksIHRoaXMgaXMgd3JvbmcuwqAgY3B1X2hhc194Z2V0YnYxIGFw
cGxpZXMgb25seSB0byB0aGUgcmVhZApzaWRlLsKgIHhzZXRidlsxXSBpcyBzdGlsbCBzdHJpY3Rs
eSByZXNlcnZlZCBhbmQgeWllbGRzICNHUC7CoCAoR2l2ZW4gdGhlCndheSBvdGhlciBiaXRzIGlu
IHhjcjAgd29yaywgSSB3b3VsZG4ndCBiZSBzdXJwcmlzZWQgaWYgeHNldGJ2WzFdIGlzCnJlc2Vy
dmVkIGZvcmV2ZXIgbW9yZS4pCgpJJ2QganVzdCBkcm9wIHRoaXMgY2FzZSBibG9jayBhbmQgbGV0
IDEgZmFsbCBpbnRvIHRoZSBkZWZhdWx0IGNhc2UsCnJhdGhlciB0aGFuIHJlbHlpbmcgb24gdGhl
IHNhbml0eSBjaGVjayBpbiBoYW5kbGVfeHNldGJ2KCkKCn5BbmRyZXcKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
