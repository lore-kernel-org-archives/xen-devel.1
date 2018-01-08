From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2 16/23] vixen: pass grant table operations
 through to the outer Xen
Date: Mon, 8 Jan 2018 10:35:37 +0000
Message-ID: <20180108103537.sq22zirheaqhxjxm@MacBook-Pro-de-Roger.local>
References: <1515356919-922-1-git-send-email-aliguori@amzn.com>
 <1515356919-922-17-git-send-email-aliguori@amzn.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=q3al=ed=citrix.com=prvs=539ca8c7b=roger.pau@srs-us1.protection.inumbo.net>)
 id 1eYUmU-0000Wi-Hk
 for xen-devel@lists.xenproject.org; Mon, 08 Jan 2018 10:35:50 +0000
Content-Disposition: inline
In-Reply-To: <1515356919-922-17-git-send-email-aliguori@amzn.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Anthony Liguori <aliguori@amzn.com>
Cc: Wei Liu <wei.liu2@citrix.com>, Anthony Liguori <aliguori@amazon.com>, KarimAllah Ahmed <karahmed@amazon.de>, Andrew Cooper <andrew.cooper3@citrix.com>, Jan =?iso-8859-1?Q?H=2E_Sch=F6nherr?= <jschoenh@amazon.de>, Matt Wilson <msw@amazon.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gU3VuLCBKYW4gMDcsIDIwMTggYXQgMTI6Mjg6MzJQTSAtMDgwMCwgQW50aG9ueSBMaWd1b3Jp
IHdyb3RlOgo+ICBzdGF0aWMgbG9uZwo+ICt2aXhlbl9nbnR0YWJfc2V0dXBfdGFibGUoCj4gKyAg
ICBYRU5fR1VFU1RfSEFORExFX1BBUkFNKGdudHRhYl9zZXR1cF90YWJsZV90KSB1b3AsIHVuc2ln
bmVkIGludCBjb3VudCkKPiArewo+ICsgICAgbG9uZyByYzsKPiArCj4gKyAgICBzdHJ1Y3QgZ250
dGFiX3NldHVwX3RhYmxlIG9wOwo+ICsgICAgeGVuX3Bmbl90ICpmcmFtZV9saXN0ID0gTlVMTDsK
PiArICAgIFhFTl9HVUVTVF9IQU5ETEUoeGVuX3Bmbl90KSBvbGRfZnJhbWVfbGlzdDsKPiArCj4g
KyAgICBpZiAoIGNvdW50ICE9IDEgKQo+ICsgICAgICAgIHJldHVybiAtRUlOVkFMOwo+ICsKPiAr
ICAgIGlmICggdW5saWtlbHkoY29weV9mcm9tX2d1ZXN0KCZvcCwgdW9wLCAxKSAhPSAwKSApCj4g
KyAgICB7Cj4gKyAgICAgICAgZ2RwcmludGsoWEVOTE9HX0lORk8sICJGYXVsdCB3aGlsZSByZWFk
aW5nIGdudHRhYl9zZXR1cF90YWJsZV90LlxuIik7Cj4gKyAgICAgICAgcmV0dXJuIC1FRkFVTFQ7
Cj4gKyAgICB9Cj4gKwo+ICsgICAgaWYgKCBvcC5ucl9mcmFtZXMgPiAwICkgewo+ICsgICAgICAg
IGZyYW1lX2xpc3QgPSB4emFsbG9jX2FycmF5KHhlbl9wZm5fdCwgb3AubnJfZnJhbWVzKTsKPiAr
ICAgICAgICBpZiAoIGZyYW1lX2xpc3QgPT0gTlVMTCApCj4gKyAgICAgICAgICAgIHJldHVybiAt
RU5PTUVNOwo+ICsgICAgfQo+ICsKPiArICAgIG9sZF9mcmFtZV9saXN0ID0gb3AuZnJhbWVfbGlz
dDsKPiArICAgIG9wLmZyYW1lX2xpc3QucCA9IGZyYW1lX2xpc3Q7Cj4gKwo+ICsgICAgcmMgPSBI
WVBFUlZJU09SX2dyYW50X3RhYmxlX29wKEdOVFRBQk9QX3NldHVwX3RhYmxlLCAmb3AsIGNvdW50
KTsKPiArICAgIG9wLmZyYW1lX2xpc3QgPSBvbGRfZnJhbWVfbGlzdDsKCkFyZSB5b3Ugc3VyZSB0
aGlzIHdvcmtzPyBIVk0gYmFzZWQgZ3Vlc3RzIG5lZWQgdG8gdXNlClhFTk1BUFNQQUNFX2dyYW50
X3RhYmxlIHNvIHRoYXQgdGhleSBtYXAgdGhlIGdyYW50IHRhYmxlIHNvbWV3aGVyZSBpbgp0aGUg
cDJtLgoKTXkgY29tbWVudCB3YXMgdGhlIG90aGVyIHdheSBhcm91bmQ6IHlvdSBjYW4gZGl0Y2gg
dGhlCkdOVFRBQk9QX3NldHVwX3RhYmxlIGNhbGwsIGJ1dCB5b3UgbmVlZCB0byBrZWVwIHRoZQpY
RU5NQVBTUEFDRV9ncmFudF90YWJsZSBvbmUuCgo+ICBsb25nCj4gIGRvX2dyYW50X3RhYmxlX29w
KAo+ICAgICAgdW5zaWduZWQgaW50IGNtZCwgWEVOX0dVRVNUX0hBTkRMRV9QQVJBTSh2b2lkKSB1
b3AsIHVuc2lnbmVkIGludCBjb3VudCkKPiBAQCAtMzMyNCw2ICszNDIyLDkgQEAgZG9fZ3JhbnRf
dGFibGVfb3AoCj4gICAgICBpZiAoIChjbWQgJj0gR05UVEFCT1BfQ01EX01BU0spICE9IEdOVFRB
Qk9QX2NhY2hlX2ZsdXNoICYmIG9wYXF1ZV9pbiApCj4gICAgICAgICAgcmV0dXJuIC1FSU5WQUw7
Cj4gIAo+ICsgICAgaWYgKCBpc192aXhlbigpICkKPiArICAgICAgICByZXR1cm4gdml4ZW5fZG9f
Z3JhbnRfdGFibGVfb3AoY21kLCB1b3AsIGNvdW50KTsKCllvdSBzZWVtIHRvIGJlIG1pc3Npbmcg
dGhlIGNvbXBhdCBjb2RlLgoKUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
