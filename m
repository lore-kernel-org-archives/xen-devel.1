From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v5 05/14] x86/HVM: eliminate custom #MF/#XM
 handling
Date: Thu, 22 Mar 2018 08:38:19 -0600
Message-ID: <5AB3CDEB02000078001B5269@prv-mh.provo.novell.com>
References: <5AAA7BAF02000078001B2242@prv-mh.provo.novell.com>
 <5AAA7DEC02000078001B2262@prv-mh.provo.novell.com>
 <20180322141238.ojp4mxdouvyeqmqz@MacBook-Pro-de-Roger.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=hhfi=gm=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ez1MG-0005He-GA
 for xen-devel@lists.xenproject.org; Thu, 22 Mar 2018 14:38:24 +0000
In-Reply-To: <20180322141238.ojp4mxdouvyeqmqz@MacBook-Pro-de-Roger.local>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIyLjAzLjE4IGF0IDE1OjEyLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIFRodSwgTWFyIDE1LCAyMDE4IGF0IDA3OjA2OjM2QU0gLTA2MDAsIEphbiBCZXVsaWNoIHdy
b3RlOgo+PiBAQCAtODQ3OCw3ICs4NDExLDggQEAgeDg2X2VtdWxhdGUoCj4+ICAgICAgfQo+PiAg
Cj4+ICAgY29tcGxldGVfaW5zbjogLyogQ29tbWl0IHNoYWRvdyByZWdpc3RlciBzdGF0ZS4gKi8K
Pj4gLSAgICBwdXRfZnB1KCZmaWMsIGZhbHNlLCBzdGF0ZSwgY3R4dCwgb3BzKTsKPj4gKyAgICBw
dXRfZnB1KGZwdV90eXBlLCBmYWxzZSwgc3RhdGUsIGN0eHQsIG9wcyk7Cj4+ICsgICAgZnB1X3R5
cGUgPSBYODZFTVVMX0ZQVV9ub25lOwo+PiAgCj4+ICAgICAgLyogWmVybyB0aGUgdXBwZXIgMzIg
Yml0cyBvZiAlcmlwIGlmIG5vdCBpbiA2NC1iaXQgbW9kZS4gKi8KPj4gICAgICBpZiAoICFtb2Rl
XzY0Yml0KCkgKQo+PiBAQCAtODUwMiwxMyArODQzNiwyMiBAQCB4ODZfZW11bGF0ZSgKPj4gICAg
ICBjdHh0LT5yZWdzLT5lZmxhZ3MgJj0gflg4Nl9FRkxBR1NfUkY7Cj4+ICAKPj4gICBkb25lOgo+
PiAtICAgIHB1dF9mcHUoJmZpYywgZmljLmluc25fYnl0ZXMgPiAwICYmIGRzdC50eXBlID09IE9Q
X01FTSwgc3RhdGUsIGN0eHQsIG9wcyk7Cj4+ICsgICAgcHV0X2ZwdShmcHVfdHlwZSwgaW5zbl9i
eXRlcyA+IDAgJiYgZHN0LnR5cGUgPT0gT1BfTUVNLCBzdGF0ZSwgY3R4dCwgb3BzKTsKPj4gICAg
ICBwdXRfc3R1YihzdHViKTsKPj4gICAgICByZXR1cm4gcmM7Cj4+ICAjdW5kZWYgc3RhdGUKPj4g
IAo+PiAgI2lmZGVmIF9fWEVOX18KPj4gICBlbXVsYXRpb25fc3R1Yl9mYWlsdXJlOgo+PiArICAg
IGdlbmVyYXRlX2V4Y2VwdGlvbl9pZihzdHViX2V4bi5pbmZvLmZpZWxkcy50cmFwbnIgPT0gRVhD
X01GLCBFWENfTUYpOwo+PiArICAgIGlmICggc3R1Yl9leG4uaW5mby5maWVsZHMudHJhcG5yID09
IEVYQ19YTSApCj4+ICsgICAgewo+PiArICAgICAgICB1bnNpZ25lZCBsb25nIGNyNDsKPj4gKwo+
PiArICAgICAgICBpZiAoICFvcHMtPnJlYWRfY3IgfHwgIW9wcy0+cmVhZF9jcig0LCAmY3I0LCBj
dHh0KSA9PSBYODZFTVVMX09LQVkgKQo+IAo+IElzIHRoZSBzZWNvbmQgZXhwcmVzc2lvbiBpbiB0
aGUgYWJvdmUgbGluZSBtaXNzaW5nIHBhcmVudGhlc2VzOgo+IAo+IGlmICggIW9wcy0+cmVhZF9j
ciB8fCAhKG9wcy0+cmVhZF9jcig0LCAmY3I0LCBjdHh0KSA9PSBYODZFTVVMX09LQVkpICkKPiAK
PiBPciBzaG91bGQgdGhpcyBiZToKPiAKPiBpZiAoICFvcHMtPnJlYWRfY3IgfHwgb3BzLT5yZWFk
X2NyKDQsICZjcjQsIGN0eHQpICE9IFg4NkVNVUxfT0tBWSApCgpPb3BzLCB5ZXMgaW5kZWVkLCB0
aGUgbGF0dGVyLiBUaGFua3MgZm9yIHRoZSByZXBvcnQuCgpKYW4KCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
