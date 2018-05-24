From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] x86/XPTI: fix S3 resume (and CPU offlining
 in general)
Date: Thu, 24 May 2018 08:08:36 -0600
Message-ID: <5B06C76402000078001C5983@prv1-mh.provo.novell.com>
References: <5B06C0F902000078001C5925@prv1-mh.provo.novell.com>
 <5946c6fe-73f0-bfbb-bc0b-2026d1231f79@invisiblethingslab.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=y5hq=il=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fLqv5-0002tq-0f
 for xen-devel@lists.xenproject.org; Thu, 24 May 2018 14:08:43 +0000
In-Reply-To: <5946c6fe-73f0-bfbb-bc0b-2026d1231f79@invisiblethingslab.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Simon Gaiser <simon@invisiblethingslab.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI0LjA1LjE4IGF0IDE2OjAwLCA8c2ltb25AaW52aXNpYmxldGhpbmdzbGFiLmNvbT4g
d3JvdGU6Cj4gSmFuIEJldWxpY2g6Cj4+IEluIGNvbW1pdCBkMWQ2ZmM5N2Q2ICgieDg2L3hwdGk6
IHJlYWxseSBoaWRlIGFsbW9zdCBhbGwgb2YgWGVuIGltYWdlIikKPj4gSSd2ZSBmYWlsZWQgdG8g
cmVtZW1iZXIgdGhlIGZhY3QgdGhhdCBtdWx0aXBsZSBDUFVzIHNoYXJlIGEgc3R1Ygo+PiBtYXBw
aW5nIHBhZ2UuIFRoZXJlZm9yZSBpdCBpcyB3cm9uZyB0byB1bmNvbmRpdGlvbmFsbHkgemFwIHRo
ZSBtYXBwaW5nCj4+IHdoZW4gYnJpbmdpbmcgZG93biBhIENQVTsgaXQgbWF5IG9ubHkgYmUgdW5t
YXBwZWQgd2hlbiBubyBvdGhlciBvbmxpbmUKPj4gQ1BVIHVzZXMgdGhhdCBzYW1lIHBhZ2UuCj4+
IAo+PiBSZXBvcnRlZC1ieTogU2ltb24gR2Fpc2VyIDxzaW1vbkBpbnZpc2libGV0aGluZ3NsYWIu
Y29tPgo+PiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4+
IAo+PiAtLS0gYS94ZW4vYXJjaC94ODYvc21wYm9vdC5jCj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9z
bXBib290LmMKPj4gQEAgLTg3Niw3ICs4NzYsMjEgQEAgc3RhdGljIHZvaWQgY2xlYW51cF9jcHVf
cm9vdF9wZ3QodW5zaWduZQo+PiAgCj4+ICAgICAgZnJlZV94ZW5fcGFnZXRhYmxlKHJwdCk7Cj4+
ICAKPj4gLSAgICAvKiBBbHNvIHphcCB0aGUgc3R1YiBtYXBwaW5nIGZvciB0aGlzIENQVS4gKi8K
Pj4gKyAgICAvKgo+PiArICAgICAqIEFsc28gemFwIHRoZSBzdHViIG1hcHBpbmcgZm9yIHRoaXMg
Q1BVLCBpZiBubyBvdGhlciBvbmxpbmUgb25lIHVzZXMKPj4gKyAgICAgKiB0aGUgc2FtZSBwYWdl
Lgo+PiArICAgICAqLwo+PiArICAgIGlmICggc3R1Yl9saW5lYXIgKQo+PiArICAgIHsKPj4gKyAg
ICAgICAgdW5zaWduZWQgaW50IG90aGVyOwo+PiArCj4+ICsgICAgICAgIGZvcl9lYWNoX29ubGlu
ZV9jcHUob3RoZXIpCj4+ICsgICAgICAgICAgICBpZiAoICEoKHBlcl9jcHUoc3R1YnMuYWRkciwg
b3RoZXIpIF4gc3R1Yl9saW5lYXIpID4+IFBBR0VfU0hJRlQpICkKPj4gKyAgICAgICAgICAgIHsK
Pj4gKyAgICAgICAgICAgICAgICBzdHViX2xpbmVhciA9IDA7Cj4+ICsgICAgICAgICAgICAgICAg
YnJlYWs7Cj4+ICsgICAgICAgICAgICB9Cj4+ICsgICAgfQo+PiAgICAgIGlmICggc3R1Yl9saW5l
YXIgKQo+PiAgICAgIHsKPj4gICAgICAgICAgbDNfcGdlbnRyeV90ICpsM3QgPSBsNGVfdG9fbDNl
KGNvbW1vbl9wZ3QpOwo+IAo+IFRyaWVkIHRoaXMgb24tdG9wIG9mIHN0YWdpbmcgKGZjNTgwNWRh
ZWYpIGFuZCBJIHN0aWxsIGdldCB0aGUgc2FtZQo+IGRvdWJsZSBmYXVsdC4KCkhtbSwgaXQgd29y
a2VkIGZvciBtZSBvZmZsaW5pbmcgKGFuZCBsYXRlciByZS1vbmxpbmluZykgc2V2ZXJhbCBwQ1BV
LXMuIFdoYXQKc2l6ZSBhIHN5c3RlbSBhcmUgeW91IHRlc3Rpbmcgb24/IE1pbmUgaGFzIGdvdCBv
bmx5IDEyIENQVXMsIGkuZS4gYWxsIHN0dWJzCmFyZSBpbiB0aGUgc2FtZSBwYWdlIChhbmQgSSdk
IG5ldmVyIHVubWFwIGFueXRoaW5nIGhlcmUgYXQgYWxsKS4KCkphbgoKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
