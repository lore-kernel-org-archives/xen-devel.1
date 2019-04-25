From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 2/2 v2] x86/acpi: Improve suspend and resume
 process for Zhaoxin CPU
Date: Thu, 25 Apr 2019 07:37:28 -0600
Message-ID: <5CC1B818020000780022916A@prv1-mh.provo.novell.com>
References: <1555663857-4173-1-git-send-email-fionali-oc@zhaoxin.com>
 <5CC1B46B0200007800229134@prv1-mh.provo.novell.com>
 <89dcdf84-214d-d100-e2a1-8bd151f215bd@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=iCIG=S3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hJeZB-0007kQ-NM
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2019 13:37:33 +0000
In-Reply-To: <89dcdf84-214d-d100-e2a1-8bd151f215bd@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, FionaLi-oc <fionali-oc@zhaoxin.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, cobechen@zhaoxin.com, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI1LjA0LjE5IGF0IDE1OjI1LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMjUvMDQvMjAxOSAxNDoyMSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDE5
LjA0LjE5IGF0IDEwOjUwLCA8ZmlvbmFsaS1vY0B6aGFveGluLmNvbT4gd3JvdGU6Cj4+PiAtLS0g
YS94ZW4vYXJjaC94ODYveDg2XzY0L3RyYXBzLmMKPj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni94ODZf
NjQvdHJhcHMuYwo+Pj4gQEAgLTMzNCw3ICszMzQsOCBAQCB2b2lkIHN1YmFyY2hfcGVyY3B1X3Ry
YXBzX2luaXQodm9pZCkKPj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICh1
bnNpZ25lZCBsb25nKWxzdGFyX2VudGVyKTsKPj4+ICAgICAgc3R1Yl92YSArPSBvZmZzZXQ7Cj4+
PiAgCj4+PiAtICAgIGlmICggYm9vdF9jcHVfZGF0YS54ODZfdmVuZG9yICYgKFg4Nl9WRU5ET1Jf
SU5URUwgfCBYODZfVkVORE9SX0NFTlRBVVIpIAo+ICkKPj4+ICsgICAgaWYgKCBib290X2NwdV9k
YXRhLng4Nl92ZW5kb3IgJgo+Pj4gKyAgICAgICAgKFg4Nl9WRU5ET1JfSU5URUwgfCBYODZfVkVO
RE9SX0NFTlRBVVIgfCBYODZfVkVORE9SX1NIQU5HSEFJKSApCj4+PiAgICAgIHsKPj4+ICAgICAg
ICAgIC8qIFNZU0VOVEVSIGVudHJ5LiAqLwo+Pj4gICAgICAgICAgd3Jtc3JsKE1TUl9JQTMyX1NZ
U0VOVEVSX0VTUCwgc3RhY2tfYm90dG9tKTsKPj4gSG93IGlzIHRoaXMgaHVuayByZWxhdGVkIHRv
IHRoZSB0aXRsZSBvZiB0aGUgY2hhbmdlPyBJIHRoaW5rIHRoZQo+PiB0aXRsZSB3YW50cyB0byBi
ZSBhZGp1c3RlZC4KPj4KPj4gRnVydGhlcm1vcmUgZm9yIGFsbCBvZiB0aGUgY2hhbmdlcyBkb25l
LCB3b3VsZG4ndCB3ZSBiZXR0ZXIKPj4gc3dpdGNoIHRvIHVzZSBjcHVfaGFzX3NlcD8gaW5pdF9h
bWQoKSBhcyB3ZWxsIGFzIGRlZmF1bHRfaW5pdCgpCj4+IGFscmVhZHkgY2xlYXIgdGhpcyBmbGFn
LiBBbmRyZXcsIHRob3VnaHRzPwo+IAo+IEkgd29uZGVyZWQgZXhhY3RseSB0aGF0IGFmdGVyIHF1
ZXVpbmcgdGhpcyBwYXRjaCwgYnV0IGRpZG4ndCBnZXQgYXJvdW5kCj4gdG8gZXhwZXJpbWVudGlu
Zy4KPiAKPiBXZSBoYXZlIHRvIGJlIGEgbGl0dGxlIGNhcmVmdWwgd2l0aCB0aGUgb3JkZXJpbmcg
b2Ygb3BlcmF0aW9ucy4gCj4gY3B1X2hhc19zZXAgaXMgdmlzaWJsZSBpbiBDUFVJRCBidXQgbmVl
ZHMgY2xvYmJlcmluZyBpbiBBTUQvSHlnb24gYmVmb3JlCj4gY3B1X2hhc19zZXAgaXMgc2FmZSB0
byB1c2UgKGFsdGhvdWdoIGZvciB0aGUgTVNScywgaXQgc2hvdWxkIGJlIHNhZmUpLgoKdHJhcF9p
bml0KCkgKGFuZCBoZW5jZSBwZXJjcHVfdHJhcHNfaW5pdCgpKSBydW5zIGFmdGVyLCBpbgpwYXJ0
aWN1bGFyLCBpbml0X3NwZWN1bGF0aW9uX21pdGlnYXRpb25zKCksIHdoaWNoIG1lYW5zIGFsbApm
ZWF0dXJlIGNvbGxlY3Rpb24gYW5kIG1hc3NhZ2luZyBtdXN0IGhhdmUgaGFwcGVuZWQuIFNvCnVu
bGVzcyB5b3UgZXhwbGljaXRseSBzYXkgb3RoZXJ3aXNlLCBJJ2QgbGlrZSB0byBhc2sgRmlvbmFM
aQp0byBzdWJtaXQgYSB2MiB3aXRoIHRoYXQgY2hhbmdlIChhbmQgd2l0aCB0aGUgb3RoZXIgY29z
bWV0aWMKYWRqdXN0bWVudHMgY2FycmllZCBvdXQpLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
