From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] x86emul: suppress general register update
 upon AVX gather failures
Date: Mon, 01 Apr 2019 09:12:15 -0600
Message-ID: <5CA22A4F0200007800223B0F@prv1-mh.provo.novell.com>
References: <5C9DE7E40200007800222BA7@prv1-mh.provo.novell.com>
 <6715048e-a509-ec71-dbca-10735f872326@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=uvFD=SD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hAybm-0001QF-BF
 for xen-devel@lists.xenproject.org; Mon, 01 Apr 2019 15:12:22 +0000
In-Reply-To: <6715048e-a509-ec71-dbca-10735f872326@citrix.com>
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, Juergen Gross <jgross@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAxLjA0LjE5IGF0IDE2OjA0LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMjkvMDMvMjAxOSAwOTozOSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IC0tLSBhL3hl
bi9hcmNoL3g4Ni94ODZfZW11bGF0ZS94ODZfZW11bGF0ZS5jCj4+ICsrKyBiL3hlbi9hcmNoL3g4
Ni94ODZfZW11bGF0ZS94ODZfZW11bGF0ZS5jCj4+IEBAIC04NTQ3LDYgKzg1NDcsOSBAQCB4ODZf
ZW11bGF0ZSgKPj4gICAgICAgICAgaW52b2tlX3N0dWIoIiIsICIiLCAiK20iIChtYXNrKSA6ICJh
IiAoJm1hc2spKTsKPj4gICAgICAgICAgcHV0X3N0dWIoc3R1Yik7Cj4+ICAKPj4gKyAgICAgICAg
aWYgKCByYyAhPSBYODZFTVVMX09LQVkgKQo+PiArICAgICAgICAgICAgZ290byBkb25lOwo+IAo+
IFRoaXMgb2J2aW91c2x5IGlzIG5lZWRlZCB0byBmaXggdGhlIHByb2JsZW0gYXMgaXQgbWFuaWZl
c3RlZCBmb3IgR2VvcmdlLAo+IGJ1dCBpbiB0aGUgY2FzZSB0aGF0IHdlIHRha2UgYSBmYXVsdC9y
ZXRyeSBvbiBpdGVyYXRpb24gMCwgc2hvdWxkbid0IHdlCj4gc2tpcCB0aGUgd3JpdGViYWNrIGFz
IHdlbGw/CgpObywgbm90IHJlYWxseSwgb3IgYXQgbGVhc3Qgbm90IGluIGFsbCBjYXNlczoKCiJJ
ZiB0aGUgZGF0YSBzaXplIGFuZCBpbmRleCBzaXplIGFyZSBkaWZmZXJlbnQsIHBhcnQgb2YgdGhl
IGRlc3RpbmF0aW9uCiByZWdpc3RlciBhbmQgcGFydCBvZiB0aGUgbWFzayByZWdpc3RlciBkbyBu
b3QgY29ycmVzcG9uZCB0byBhbnkKIGVsZW1lbnRzIGJlaW5nIGdhdGhlcmVkLiBUaGlzIGluc3Ry
dWN0aW9uIHNldHMgdGhvc2UgcGFydHMgdG8gemVyby4gSXQKIG1heSBkbyB0aGlzIHRvIG9uZSBv
ciBib3RoIG9mIHRob3NlIHJlZ2lzdGVycyBldmVuIGlmIHRoZSBpbnN0cnVjdGlvbgogdHJpZ2dl
cnMgYW4gZXhjZXB0aW9uLCBhbmQgZXZlbiBpZiB0aGUgaW5zdHJ1Y3Rpb24gdHJpZ2dlcnMgdGhl
CiBleGNlcHRpb24gYmVmb3JlIGdhdGhlcmluZyBhbnkgZWxlbWVudHMuIgoKSSByZWFsaXplIHRo
aXMgaXMgYWxsICJtYXkiLCBidXQgaWlyYyBJIGhhZCB0cmllZCBpdCBvdXQgb24gc29tZSBvZiB0
aGUKaGFyZHdhcmUgSSBoYXZlLCBhbmQgaXQgaW5kZWVkIGRpZCBzbyB0aGVyZS4KCkphbgoKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
