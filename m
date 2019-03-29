From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2] x86emul: don't read mask register on
 AVX512F-incapable platforms
Date: Fri, 29 Mar 2019 09:19:56 +0000
Message-ID: <0eaf98eb-3e30-0136-1c75-1deb7c8a3bbc@citrix.com>
References: <5C9CFE7102000078002229A1@prv1-mh.provo.novell.com>
 <5C9DCC4A0200007800222AEA@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/vMr=SA=citrix.com=prvs=9848b938e=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1h9ngj-0003mr-Pt
 for xen-devel@lists.xenproject.org; Fri, 29 Mar 2019 09:20:37 +0000
In-Reply-To: <5C9DCC4A0200007800222AEA@prv1-mh.provo.novell.com>
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Juergen Gross <jgross@suse.com>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjkvMDMvMjAxOSAwNzo0MiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gTm9yIHdoZW4gcmVnaXN0
ZXIgc3RhdGUgaXNuJ3Qgc3VmZmljaWVudGx5IGVuYWJsZWQuCj4KPiBSZXBvcnRlZC1ieTogR2Vv
cmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPgo+IFNpZ25lZC1vZmYtYnk6IEph
biBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiAtLS0KPiBUaGlzIGlzIHN1cmVseSBhIHN0
YWJsZSB0cmVlIGNhbmRpZGF0ZSwgdW5sZXNzIGl0IGNvdWxkIHN0aWxsIG1ha2UgaXQKPiBpbnRv
IDQuMTIgYmVmb3JlIHRoZSByZWxlYXNlLgo+IC0tLQo+IHYyOiBBZGQgWENSMCBjaGVjay4KPgo+
IC0tLSBhL3hlbi9hcmNoL3g4Ni94ODZfZW11bGF0ZS94ODZfZW11bGF0ZS5jCj4gKysrIGIveGVu
L2FyY2gveDg2L3g4Nl9lbXVsYXRlL3g4Nl9lbXVsYXRlLmMKPiBAQCAtMzUxMSw3ICszNTExLDgg
QEAgeDg2X2VtdWxhdGUoCj4gICAgICB9Cj4gIAo+ICAgICAgLyogV2l0aCBhIG1lbW9yeSBvcGVy
YW5kLCBmZXRjaCB0aGUgbWFzayByZWdpc3RlciBpbiB1c2UgKGlmIGFueSkuICovCj4gLSAgICBp
ZiAoIGVhLnR5cGUgPT0gT1BfTUVNICYmIGV2ZXgub3Btc2sgKQo+ICsgICAgaWYgKCBlYS50eXBl
ID09IE9QX01FTSAmJiBjcHVfaGFzX2F2eDUxMmYgJiYgZXZleC5vcG1zayAmJgo+ICsgICAgICAg
ICBfZ2V0X2ZwdShmcHVfdHlwZSA9IFg4NkVNVUxfRlBVX29wbWFzaywgY3R4dCwgb3BzKSA9PSBY
ODZFTVVMX09LQVkgKQoKVGhlIGNwdV9oYXNfYXZ4NTEyZiBjaGVjayBpcyBub3cgcmVkdW5kYW50
LsKgIEl0IGlzIGZ1bGx5IGVuY2Fwc3VsYXRlZCBieQpfZ2V0X2ZwdSgpIGJlaW5nIGhhcHB5IHdp
dGggWDg2RU1VTF9GUFVfb3BtYXNrLgoKUHJlZmVyYWJseSB3aXRoIGl0IGRyb3BwZWQsIFJldmll
d2VkLWJ5OiBBbmRyZXcgQ29vcGVyCjxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoKPiAgICAg
IHsKPiAgICAgICAgICB1aW50OF90ICpzdGIgPSBnZXRfc3R1YihzdHViKTsKPiAgCj4gQEAgLTM1
MzIsNiArMzUzMywxNCBAQCB4ODZfZW11bGF0ZSgKPiAgICAgICAgICBmYXVsdF9zdXBwcmVzc2lv
biA9IHRydWU7Cj4gICAgICB9Cj4gIAo+ICsgICAgaWYgKCBmcHVfdHlwZSA9PSBYODZFTVVMX0ZQ
VV9vcG1hc2sgKQo+ICsgICAgewo+ICsgICAgICAgIC8qIFNxdWFzaCAoc2lkZSkgZWZmZWN0cyBv
ZiB0aGUgX2dldF9mcHUoKSBhYm92ZS4gKi8KPiArICAgICAgICB4ODZfZW11bF9yZXNldF9ldmVu
dChjdHh0KTsKPiArICAgICAgICBwdXRfZnB1KFg4NkVNVUxfRlBVX29wbWFzaywgZmFsc2UsIHN0
YXRlLCBjdHh0LCBvcHMpOwo+ICsgICAgICAgIGZwdV90eXBlID0gWDg2RU1VTF9GUFVfbm9uZTsK
PiArICAgIH0KPiArCj4gICAgICAvKiBEZWNvZGUgKGJ1dCBkb24ndCBmZXRjaCkgdGhlIGRlc3Rp
bmF0aW9uIG9wZXJhbmQ6IHJlZ2lzdGVyIG9yIG1lbW9yeS4gKi8KPiAgICAgIHN3aXRjaCAoIGQg
JiBEc3RNYXNrICkKPiAgICAgIHsKPgo+Cj4KPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
