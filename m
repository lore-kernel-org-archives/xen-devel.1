From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] x86: fix "xpti=" and "pv-l1tf=" yet again
Date: Tue, 21 Aug 2018 15:59:45 +0200
Message-ID: <c0e95b10-fae1-321f-cd3c-e9888962edef@suse.com>
References: <5B7BED1B02000078001E063C@suse.com>
 <eea4129d-f92d-166e-0bb5-4b8b8b966529@suse.com>
 <5B7C084A02000078001E07CD@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=wce4=le=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1fs7CH-0004ic-OM
 for xen-devel@lists.xenproject.org; Tue, 21 Aug 2018 13:59:49 +0000
In-Reply-To: <5B7C084A02000078001E07CD@suse.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMjEvMDgvMTggMTQ6NDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDIxLjA4LjE4IGF0
IDE0OjEzLCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPj4gT24gMjEvMDgvMTggMTI6NDQsIEph
biBCZXVsaWNoIHdyb3RlOgo+Pj4gQEAgLTIxOSwxNyArMjE2LDEzIEBAIHN0YXRpYyBpbnQgX19p
bml0IHBhcnNlX3NwZWNfY3RybChjb25zdAo+Pj4gIH0KPj4+ICBjdXN0b21fcGFyYW0oInNwZWMt
Y3RybCIsIHBhcnNlX3NwZWNfY3RybCk7Cj4+PiAgCj4+PiAtaW50OF90IF9fcmVhZF9tb3N0bHkg
b3B0X3B2X2wxdGYgPSAtMTsKPj4+ICt1aW50OF90IF9fcmVhZF9tb3N0bHkgb3B0X3B2X2wxdGYg
PSBPUFRfUFZfTDFURl9ET01VX0RFRkFVTFQ7Cj4+PiAgCj4+PiAgc3RhdGljIF9faW5pdCBpbnQg
cGFyc2VfcHZfbDF0Zihjb25zdCBjaGFyICpzKQo+Pj4gIHsKPj4+ICAgICAgY29uc3QgY2hhciAq
c3M7Cj4+PiAgICAgIGludCB2YWwsIHJjID0gMDsKPj4+ICAKPj4+IC0gICAgLyogSW5oaWJpdCB0
aGUgZGVmYXVsdHMgYXMgYW4gZXhwbGljaXQgY2hvaWNlIGhhcyBiZWVuIGdpdmVuLiAqLwo+Pj4g
LSAgICBpZiAoIG9wdF9wdl9sMXRmID09IC0xICkKPj4+IC0gICAgICAgIG9wdF9wdl9sMXRmID0g
MDsKPj4KPj4gV291bGRuJ3Qgc2V0dGluZyB0aGUgZGVmYXVsdCB2YWx1ZSAoRE9NVSkgaGVyZSBi
ZSBlbm91Z2g/IFNhbWUgZm9yCj4+IHhwdGkgYmVsb3c/Cj4gCj4gTm8sIGJlY2F1c2Ugd2Ugd2Fu
dCB0byBkZWZlciBkZWZhdWx0IHByb2Nlc3NpbmcgdW50aWwgd2UndmUKPiBhY3R1YWxseSBvYnRh
aW5lZCB0aGUgbmVjZXNzYXJ5IGRhdGEuIFdoaWxlIHBhcnNpbmcgd2UgZG9uJ3QKPiBrbm93IHll
dCB3aGV0aGVyICJkZWZhdWx0IiBtZWFucyAib24iIG9yICJvZmYiLgo+IAo+IE9yIHBlcmhhcHMg
SSBkb24ndCB1bmRlcnN0YW5kIHdoYXQgeW91IG1lYW4/CgpJIG1lYW50OgoKICAgICBpZiAoIG9w
dF9wdl9sMXRmID09IC0xICkKLSAgICAgICAgb3B0X3B2X2wxdGYgPSAwOworICAgICAgICBvcHRf
cHZfbDF0ZiA9IE9QVF9QVl9MMVRGX0RPTVU7CgpUaGlzIHN0YXJ0cyBhdCB0aGUgZGVmYXVsdCBz
ZXR0aW5nIGFuZCB0aGVuIGFwcGxpZXMgdGhlIHNldHRpbmdzIG9mIHRoZQpzdWItb3B0aW9ucyBv
biB0b3Agb2YgaXQsIGluc3RlYWQgb2Ygc3RhcnRpbmcgYXQgImV2ZXJ5dGhpbmcgb2ZmIi4KCgpK
dWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
