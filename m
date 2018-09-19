From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH RFC] x86/lapic: remove the PIT usage to
 calibrate the lapic timer
Date: Wed, 19 Sep 2018 17:48:49 +0100
Message-ID: <20180919164849.snpsx25sdjnsovfm@zion.uk.xensource.com>
References: <20180919162554.80569-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=wwm0=mb=citrix.com=prvs=79313d28f=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1g2fen-0007jJ-DB
 for xen-devel@lists.xenproject.org; Wed, 19 Sep 2018 16:48:53 +0000
Content-Disposition: inline
In-Reply-To: <20180919162554.80569-1-roger.pau@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBTZXAgMTksIDIwMTggYXQgMDY6MjU6NTRQTSArMDIwMCwgUm9nZXIgUGF1IE1vbm5l
IHdyb3RlOgo+IEFuZCBpbnN0ZWFkIHVzZSBOT1cgd2hpY2ggaXMgYmFzZWQgb24gdGhlIFRTQy4g
VGhpcyB3YXMgYWxyZWFkeSB1c2VkCj4gd2hlbiBydW5uaW5nIGluIHNoaW0gbW9kZSwgc2luY2Ug
dGhlcmUncyBsaWtlbHkgbm8gUElUIGluIHRoYXQKPiBlbnZpcm9ubWVudC4KPiAKPiBSZW1vdmUg
cHJpbnRpbmcgdGhlIENQVSBmcmVxdWVuY3ksIHNpbmNlIGl0J3MgYWxyZWFkeSBwcmludGVkIGVh
cmxpZXIKPiBhdCBib290LCBhbmQgZ2V0dGluZyB0aGUgQ1BVIGZyZXF1ZW5jeSBhZ2FpbnN0IHRo
ZSBUU0Mgd2l0aG91dCBhbnkKPiBleHRlcm5hbCByZWZlcmVuY2UgdGltZXIgaXMgcG9pbnRsZXNz
Lgo+IAo+IFRoZSBtb3RpdmF0aW9uIGJlaGluZCB0aGlzIGNoYW5nZSBpcyB0byBhbGxvdyBYZW4g
dG8gYm9vdCBvbiBIeXBlclYKPiBnZW4yIGluc3RhbmNlcywgd2hpY2ggbGFjayBhIFBJVC4KCmxh
Y2tzCgo+IAo+IFNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRy
aXguY29tPgo+IC0tLQo+IEknbSBub3Qgc3VyZSBhYm91dCB0aGUgcmVhc29uIGJlaGluZCB0aGUg
dXNhZ2Ugb2YgdGhlIFBJVCBpbnN0ZWFkIG9mCj4gdGhlIFRTQywgbWF5YmUgdGhpcyB3YXMgZG9u
ZSBiZWNhdXNlIHRoZSBUU0Mgd2Fzbid0IGF2YWlsYWJsZSB1bnRpbAo+IHRoZSBQZW50aXVtPyBY
ZW4gY2VydGFpbmx5IGRvZXNuJ3QgY2FyZSBhYm91dCBzdWNoIGhhcmR3YXJlIGFueW1vcmUsCj4g
YW5kIHRoZSBUU0MgaXMgYWxyZWFkeSB1c2VkIHVuY29uZGl0aW9uYWxseSBpbiBYZW4uCj4gCj4g
TGludXggc2VlbXMgdG8gcHJlZmVyIHRvIGNhbGlicmF0ZSB0aGUgbGFwaWMgdGltZXIgYWdhaW5z
dCB0aGUgUE0KPiB0aW1lciBhbmQgaGFzIGFscmVhZHkgZHJvcHBlZCBQSVQgdXNhZ2UgZm9yIHRo
YXQuCj4gCj4gTXkgZWFybHkgdGVzdHMgb24gYSBzaW5nbGUgYm94IHNob3cgbm8gZGlmZmVyZW5j
ZXMgYmV0d2VlbiB0aGUgVFNDIG9yCj4gdGhlIFBJVCBmb3IgbGFwaWMgdGltZXIgY2FsaWJyYXRp
b24sIGJ1dCB0aGF0J3MgYSBzaW5nbGUgYm94Lgo+IAo+IFRoZSBSRkMgaXMgYmVjYXVzZSBJJ20g
bm90IHN1cmUgSSB1bmRlcnN0YW5kIHRoZSBtb3RpdmF0aW9uIGZvciB1c2luZwo+IHRoZSBQSVQg
aW4gdGhlIGZpcnN0IHBsYWNlLCBzbyBJIG1pZ2h0IGJlIG1pc3Npbmcgc29tZXRoaW5nIHJlbGV2
YW50Cj4gdGhhdCBjb3VsZCBtYWtlIHRoaXMgcGF0Y2ggbW9vdC4KCkkgd29uZGVyZWQgdGhlIHNh
bWUuCgpXZWkuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
