From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/HVM: p2m_ram_ro is incompatible with
 device pass-through
Date: Thu, 2 May 2019 14:42:10 +0100
Message-ID: <a99e7a6b-6c45-759b-ee0e-ed9174397de3@citrix.com>
References: <5CCAE2A5020000780022B35E@prv1-mh.provo.novell.com>
 <8300afef-e75e-1d81-83e4-7f020595f81a@citrix.com>
 <5CCAEDAB020000780022B3EC@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Flb6=TC=citrix.com=prvs=018be947d=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hMByY-0006ES-57
 for xen-devel@lists.xenproject.org; Thu, 02 May 2019 13:42:14 +0000
In-Reply-To: <5CCAEDAB020000780022B3EC@prv1-mh.provo.novell.com>
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Paul Durrant <paul.durrant@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDIvMDUvMjAxOSAxNDoxNiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMDIuMDUuMTkg
YXQgMTQ6NTksIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToKPj4gT24gMDIvMDUv
MjAxOSAxMzoyOSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+PiAtLS0gYS94ZW4vZHJpdmVycy9wYXNz
dGhyb3VnaC9wY2kuYwo+Pj4gKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvcGNpLmMKPj4+
IEBAIC0xNDUwLDE3ICsxNDUwLDM2IEBAIHN0YXRpYyBpbnQgYXNzaWduX2RldmljZShzdHJ1Y3Qg
ZG9tYWluICoKPj4+ICAgICAgaWYgKCAhaW9tbXVfZW5hYmxlZCB8fCAhaGQtPnBsYXRmb3JtX29w
cyApCj4+PiAgICAgICAgICByZXR1cm4gMDsKPj4+ICAKPj4+IC0gICAgLyogUHJldmVudCBkZXZp
Y2UgYXNzaWduIGlmIG1lbSBwYWdpbmcgb3IgbWVtIHNoYXJpbmcgaGF2ZSBiZWVuIAo+Pj4gLSAg
ICAgKiBlbmFibGVkIGZvciB0aGlzIGRvbWFpbiAqLwo+Pj4gLSAgICBpZiAoIHVubGlrZWx5KGQt
PmFyY2guaHZtLm1lbV9zaGFyaW5nX2VuYWJsZWQgfHwKPj4+IC0gICAgICAgICAgICAgICAgICB2
bV9ldmVudF9jaGVja19yaW5nKGQtPnZtX2V2ZW50X3BhZ2luZykgfHwKPj4+ICsgICAgZG9tYWlu
X2xvY2soZCk7Cj4+PiArCj4+PiArICAgIC8qCj4+PiArICAgICAqIFByZXZlbnQgZGV2aWNlIGFz
c2lnbm1lbnQgaWYgYW55IG9mCj4+PiArICAgICAqIC0gbWVtIHBhZ2luZwo+Pj4gKyAgICAgKiAt
IG1lbSBzaGFyaW5nCj4+PiArICAgICAqIC0gdGhlIHAybV9yYW1fcm8gdHlwZQo+Pj4gKyAgICAg
KiAtIGdsb2JhbCBsb2ctZGlydHkgbW9kZQo+PiBYZW5TZXJ2ZXIgaGFzIHdvcmtpbmcgbGl2ZSBt
aWdyYXRpb24gd2l0aCBHUFVzLCB3aGljaCB0aGlzIGNoYW5nZSB3b3VsZAo+PiByZWdyZXNzLgo+
Pgo+PiBCZWhpbmQgdGhlIHNjZW5lcywgd2UgY29tYmluZSBYZW4ncyBsb2dkaXJ0eSBiaXRtYXAg
d2l0aCBvbmUgcHJvdmlkZWQgYnkKPj4gdGhlIEdQVSwgdG8gZW5zdXJlIHRoYXQgYWxsIGRpcnR5
IHVwZGF0ZXMgYXJlIHRyYWNrZWQuCj4gQnV0IHRoaXMgc2F5cyBub3RoaW5nIGZvciB0aGUgcGF0
Y2ggaGVyZS4KClllcyBpdCBkb2VzLgoKVGhlcmUgaXMgbm90aGluZyBpbmhlcmVudCBhYm91dCBn
bG9iYWwgbG9nLWRpcnR5IG1vZGUgd2hpY2ggaXMKaW5jb21wYXRpYmxlIHdpdGggcGFzc3Rocm91
Z2ggd2hlbiB0aGUgSU9NTVUgcGFnZXRhYmxlcyBhcmUgbm90IHNoYXJlZAp3aXRoIEVQVC4KCj4g
QXMgbG9uZyBhcyBpdCBkb2Vzbid0IHdvcmsgaW4gdGhlIHN0YWdpbmcgdHJlZSwgaXQgc2hvdWxk
IGJlIHByZXZlbnRlZC4KCi4uLiBidXQgaXQgZG9lcyB3b3JrLgoKPiBJbiBYZW5TZXJ2ZXIKPiB5
b3UgY291bGQgdGhlbiBwYXRjaCBvdXQgdGhhdCBjaGVjayBhbmQgY29tbWVudCBsaW5lIHRvZ2V0
aGVyCj4gd2l0aCB3aGF0ZXZlciBvdGhlciBjaGFuZ2VzIHlvdSBoYXZlIHRvIG1ha2UgZm9yIHRo
aW5zIHRvCj4gd29yay4KCkV2ZXJ5dGhpbmcgaXMgdXBzdHJlYW0gaW4gdGhlIHZhcmlvdXMgcHJv
amVjdHMsIG90aGVyIHRoYW4gdGhlIHZlbmRvcidzCmNsb3NlZCBzb3VyY2UgbGlicmFyeSBhbmQg
a2VybmVsIGRyaXZlci4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
