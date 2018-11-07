From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v3 1/5] viridian: separate interrupt related
 enlightenment implementations...
Date: Wed, 7 Nov 2018 12:36:58 +0100
Message-ID: <20181107113658.x3zj6wekhomeo5lo@mac.citrite.net>
References: <20181107105223.27013-1-paul.durrant@citrix.com>
 <20181107105223.27013-2-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=kqzb=ns=citrix.com=prvs=842e1f2a3=roger.pau@srs-us1.protection.inumbo.net>)
 id 1gKM90-0006t3-5S
 for xen-devel@lists.xenproject.org; Wed, 07 Nov 2018 11:37:10 +0000
Content-Disposition: inline
In-Reply-To: <20181107105223.27013-2-paul.durrant@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBOb3YgMDcsIDIwMTggYXQgMTA6NTI6MTlBTSArMDAwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+IC4uLmludG8gbmV3ICdzeW5pYycgbW9kdWxlLgo+IAo+IFRoZSBTeW5JQyAoc3ludGhl
dGljIGludGVycnVwdCBjb250cm9sbGVyKSBpcyBzcGVjaWZpZWQgWzFdIHRvIGJlIGEgc3VwZXIt
Cj4gc2V0IG9mIGEgdmlydHVhbGl6ZWQgTEFQSUMsIGFuZCBpdHMgZGVmaW5pdGlvbiBlbmNvbXBh
c3NlcyBhbGwKPiBlbmxpZ2h0ZW5tZW50cyByZWxhdGVkIHRvIHZpcnR1YWwgaW50ZXJydXB0IGNv
bnRyb2wuCj4gCj4gVGhpcyBwYXRjaCByZWR1Y2VzIHRoZSBzaXplIG9mIHRoZSBtYWluIHZpcmlk
aWFuIHNvdXJjZSBtb2R1bGUgYnkgZ2l2aW5nCj4gdGhlc2UgZW5saWdodGVubWVudHMgdGhlaXIg
b3duIG1vZHVsZS4gVGhpcyBpcyBkb25lIGluIGFudGljaXBhdGlvbiBvZgo+IGltcGxlbWVudGF0
aW9uIG9mIG1vcmUgc3VjaCBlbmxpZ2h0ZW5tZW50cyBhbmQgYSBkZXNpcmUgbm90IHRvIGZ1cnRo
ZXIKPiBsZW5ndGhlbiB0aGVuIG1haW4gc291cmNlIG1vZHVsZSB3aGVuIHRoaXMgd29yayBpcyBk
b25lLgo+IAo+IFdoaWxzdCBtb3ZpbmcgdGhlIGNvZGU6Cj4gCj4gLSBGaXggdmFyaW91cyBzdHls
ZSBpc3N1ZXMuCj4gLSBNb3ZlIHRoZSBNU1IgZGVmaW5pdGlvbnMgaW50byB0aGUgaGVhZGVyIChz
aW5jZSB0aGV5IGFyZSBub3cgbmVlZGVkIGluCj4gICBtb3JlIHRoYW4gb25lIHNvdXJjZSBtb2R1
bGUpLgo+IAo+IFsxXSBodHRwczovL2dpdGh1Yi5jb20vTWljcm9zb2Z0RG9jcy9WaXJ0dWFsaXph
dGlvbi1Eb2N1bWVudGF0aW9uL3Jhdy9saXZlL3RsZnMvSHlwZXJ2aXNvciUyMFRvcCUyMExldmVs
JTIwRnVuY3Rpb25hbCUyMFNwZWNpZmljYXRpb24lMjB2NS4wQy5wZGYKPiAKPiBTaWduZWQtb2Zm
LWJ5OiBQYXVsIER1cnJhbnQgPHBhdWwuZHVycmFudEBjaXRyaXguY29tPgo+IFJldmlld2VkLWJ5
OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgoKUmV2aWV3ZWQtYnk6IFJvZ2VyIFBhdSBN
b25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
