From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v3 2/9] x86/HVM: patch indirect calls
 through hvm_funcs to direct ones
Date: Fri, 21 Sep 2018 11:50:00 +0100
Message-ID: <20180921105000.hi7fswecmapqv6ik@zion.uk.xensource.com>
References: <5B97C28802000078001E7456@prv1-mh.provo.novell.com>
 <5B97C40702000078001E747F@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=4pl1=md=citrix.com=prvs=7953d62ed=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1g3J0d-0004p8-Vq
 for xen-devel@lists.xenproject.org; Fri, 21 Sep 2018 10:50:04 +0000
Content-Disposition: inline
In-Reply-To: <5B97C40702000078001E747F@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Paul Durrant <paul.durrant@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBTZXAgMTEsIDIwMTggYXQgMDc6MzI6NTVBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gVGhpcyBpcyBpbnRlbnRpb25hbGx5IG5vdCB0b3VjaGluZyBob29rcyB1c2VkIHJhcmVs
eSAob3Igbm90IGF0IGFsbCkKPiBkdXJpbmcgdGhlIGxpZmV0aW1lIG9mIGEgVk0sIGxpa2Uge2Rv
bWFpbix2Y3B1fV9pbml0aWFsaXNlIG9yIGNwdV91cCwKPiBhcyB3ZWxsIGFzIG5lc3RlZCwgVk0g
ZXZlbnQsIGFuZCBhbHRwMm0gb25lcyAodGhleSBjYW4gYWxsIGJlIGRvbmUKPiBsYXRlciwgaWYg
c28gZGVzaXJlZCkuIFZpcnR1YWwgSW50ZXJydXB0IGRlbGl2ZXJ5IG9uZXMgd2lsbCBiZSBkZWFs
dAo+IHdpdGggaW4gYSBzdWJzZXF1ZW50IHBhdGNoLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEphbiBC
ZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KClJldmlld2VkLWJ5OiBXZWkgTGl1IDx3ZWkubGl1
MkBjaXRyaXguY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
