From: Tamas K Lengyel <tamas@tklengyel.com>
Subject: Re: [PATCH v3 1/4] x86/mem_sharing: reorder when pages
 are unlocked and released
Date: Mon, 29 Apr 2019 10:36:52 -0600
Message-ID: <CABfawhnH1GO54XJrigxBXRPq-15aZT7MQSDXC_LtTaqqT=WFHg@mail.gmail.com>
References: <20190426172138.14669-1-tamas@tklengyel.com>
 <5CC711DC020000780022A111@prv1-mh.provo.novell.com>
 <CABfawhnxZA5+FXj5uRb59sJ9RGm71uC0MHv4=J5PGfejXiX2qg@mail.gmail.com>
 <4b3607ed-5596-496b-f6a6-19548703b773@citrix.com>
 <CABfawhk4AnVBMTssrqsDr7e9FB2GSiCn9iE13L5=sBKhQdiEeQ@mail.gmail.com>
 <5CC722F8020000780022A22C@prv1-mh.provo.novell.com>
 <CABfawh=z06LhrWsPn8ot2o55Rt4GJX0M08mABEK63cxwFH3Ajw@mail.gmail.com>
 <15941682-d84c-9991-40b7-bff5e0d5cf9b@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NplV=S7=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1hL9Ha-0006nf-LE
 for xen-devel@lists.xenproject.org; Mon, 29 Apr 2019 16:37:34 +0000
Received: by mail-wr1-f42.google.com with SMTP id a12so16983987wrq.10
 for <xen-devel@lists.xenproject.org>; Mon, 29 Apr 2019 09:37:30 -0700 (PDT)
In-Reply-To: <15941682-d84c-9991-40b7-bff5e0d5cf9b@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <george.dunlap@citrix.com>
Cc: Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBBcHIgMjksIDIwMTkgYXQgMTA6MjkgQU0gR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1
bmxhcEBjaXRyaXguY29tPiB3cm90ZToKPgo+IE9uIDQvMjkvMTkgNToyNiBQTSwgVGFtYXMgSyBM
ZW5neWVsIHdyb3RlOgo+ID4gT24gTW9uLCBBcHIgMjksIDIwMTkgYXQgMTA6MTQgQU0gSmFuIEJl
dWxpY2ggPEpCZXVsaWNoQHN1c2UuY29tPiB3cm90ZToKPiA+Pgo+ID4+Pj4+IE9uIDI5LjA0LjE5
IGF0IDE4OjA1LCA8dGFtYXNAdGtsZW5neWVsLmNvbT4gd3JvdGU6Cj4gPj4+IE9uIE1vbiwgQXBy
IDI5LCAyMDE5IGF0IDk6NTIgQU0gR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXgu
Y29tPiB3cm90ZToKPiA+Pj4+IEkgaGF2ZW4ndCByZS1ncm9ra2VkIHRoZSBjb2RlIGhlcmUsIGJ1
dCBhc3N1bWluZyBJIHdhcyBjb3JyZWN0IDIgd2Vla3MKPiA+Pj4+IGFnbywgaWYgeW91IGhhdmUg
dGhlIEJVR19PTigpIHRoZXJlLCB5b3UgY2FuIGdldCByaWQgb2YgdGhlIGV4dHJhCj4gPj4+PiBy
ZWZlcmVuY2VzLgo+ID4+Pgo+ID4+PiBTdXJlLCBidXQgYWdhaW4sIHRoZSBvdmVyaGVhZCBvZiBo
YXZpbmcgdGhlbSBpbi1wbGFjZSBpcyBuZWdsaWdpYmxlIHNvCj4gPj4+IG1pZ2h0IGFzIHdlbGwg
anVzdCBrZWVwIGl0Lgo+ID4+Cj4gPj4gVGhlIG92ZXJoZWFkIGlzIG9ubHkgb25lIGFzcGVjdCBo
ZXJlLiBQZW9wbGUgbG9va2luZyBhdCB0aGUgY29kZQo+ID4+IG1heSBhbHNvIGJlIG1pc2xlYWQg
aW50byB0cnlpbmcgdG8gZmlndXJlIG91dCB3aHkgdGhlIGhlY2sgdGhpcwo+ID4+IGV4dHJhIHJl
ZmVyZW5jZSBnZXRzIG9idGFpbmVkLiBQbHVzIHN1Yi1vcHRpbWFsIGNvZGUgdGVuZHMgdG8gZ2V0
Cj4gPj4gY2xvbmVkIC4uLgo+ID4KPiA+IFllYSwgSSdtIHdpdGggeW91Li4gQWxyaWdodCwgaW4g
dGhhdCBjYXNlIEFuZHJldyBwdWxsZWQgaW4gdGhhdAo+ID4gcHJldmlvdXMgcGF0Y2ggaW50byB4
ODYtbmV4dCBmb3Igbm8gZ29vZCByZWFzb24gYXMgdGhhdCB3aG9sZSB0aGluZyBpcwo+ID4gZ29p
bmcgdG8gZ2V0IGRyb3BwZWQgbm93LiBBbmRyZXcgLSBpZiB5b3UgY2FuIGp1c3QgZHJvcCB0aGF0
IHBhdGNoCj4gPiBmcm9tIHg4Ni1uZXh0IEknbGwgcmViYXNlIG9uIHN0YWdpbmcgYW5kIHJlc2Vu
ZCB3aXRob3V0IHRoYXQgcGF0Y2guCj4KPiBJIGFzc3VtZSBoZSB3YW50cyB0aGF0IGJyYW5jaCB0
byBiZSBmYXN0LWZvcndhcmRpbmc7IGlmIHNvLCBoZSBjYW4ndAo+IHJlYWxseSBwdWxsIGl0IG91
dC4KPgoKWWVhLCBmaWd1cmVkLi4gT2ggd2VsbCwgbm90IHJlYWxseSBhIGJpZyBkZWFsLgoKVGFt
YXMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
