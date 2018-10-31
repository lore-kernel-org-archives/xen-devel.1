From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v2 5/9] viridian: separate interrupt related
 enlightenment implementations...
Date: Wed, 31 Oct 2018 15:40:30 +0000
Message-ID: <20181031154030.fqszvjey2fos62lc@zion.uk.xensource.com>
References: <20181031124335.23867-1-paul.durrant@citrix.com>
 <20181031124335.23867-6-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=qv1o=nl=citrix.com=prvs=835e3026f=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gHsbi-0006D7-O6
 for xen-devel@lists.xenproject.org; Wed, 31 Oct 2018 15:40:34 +0000
Content-Disposition: inline
In-Reply-To: <20181031124335.23867-6-paul.durrant@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBPY3QgMzEsIDIwMTggYXQgMTI6NDM6MzFQTSArMDAwMCwgUGF1bCBEdXJyYW50IHdy
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
LWJ5OiBQYXVsIER1cnJhbnQgPHBhdWwuZHVycmFudEBjaXRyaXguY29tPgoKUmV2aWV3ZWQtYnk6
IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
