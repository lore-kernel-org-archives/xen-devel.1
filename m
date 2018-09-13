From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v8 7/7] vtd: add lookup_page method to
 iommu_ops
Date: Thu, 13 Sep 2018 08:50:52 -0600
Message-ID: <5B9A794C02000078001E84E8@prv1-mh.provo.novell.com>
References: <20180913103153.33377-1-paul.durrant@citrix.com>
 <20180913103153.33377-9-paul.durrant@citrix.com>
 <5B9A662D02000078001E83F4@prv1-mh.provo.novell.com>
 <f69c1a46c5764297b7dfdb8f55e7b1f8@AMSPEX02CL03.citrite.net>
 <5B9A69CF02000078001E8448@prv1-mh.provo.novell.com>
 <0bc9e5bbc5aa4b7ab07d023ffeef570f@AMSPEX02CL03.citrite.net>
 <5B9A6C9A02000078001E849B@prv1-mh.provo.novell.com>
 <33c6c87a30cd471ab3499e297da768ca@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=jl0+=l3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1g0SxN-00052H-2d
 for xen-devel@lists.xenproject.org; Thu, 13 Sep 2018 14:50:57 +0000
In-Reply-To: <33c6c87a30cd471ab3499e297da768ca@AMSPEX02CL03.citrite.net>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, george.dunlap@citrix.com
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEzLjA5LjE4IGF0IDE2OjA0LCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+PiAgLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPj4gRnJvbTogSmFuIEJldWxpY2ggW21h
aWx0bzpKQmV1bGljaEBzdXNlLmNvbV0KPj4gU2VudDogMTMgU2VwdGVtYmVyIDIwMTggMTQ6NTcK
Pj4gVG86IFBhdWwgRHVycmFudCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+Cj4+IENjOiBHZW9y
Z2UgRHVubGFwIDxHZW9yZ2UuRHVubGFwQGNpdHJpeC5jb20+OyBXZWkgTGl1Cj4+IDx3ZWkubGl1
MkBjaXRyaXguY29tPjsgS2V2aW4gVGlhbiA8a2V2aW4udGlhbkBpbnRlbC5jb20+OyB4ZW4tZGV2
ZWwgPHhlbi0KPj4gZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc+Cj4+IFN1YmplY3Q6IFJFOiBb
UEFUQ0ggdjggNy83XSB2dGQ6IGFkZCBsb29rdXBfcGFnZSBtZXRob2QgdG8gaW9tbXVfb3BzCj4+
IAo+PiA+Pj4gT24gMTMuMDkuMTggYXQgMTU6NTAsIDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT4g
d3JvdGU6Cj4+ID4gT2suIEknbGwgc3BlbGwgaXQgb3V0IGluIHRoZSBoZWFkZXIgaWYgeW91IHRo
aW5rIGl0IGlzIG5vbi1vYnZpb3VzLgo+PiAKPj4gT2J2aW91cyBvciBub3QgLSBkbyB3ZSBfaGF2
ZV8gYW55IHN1Y2ggb3V0ZXIgbG9ja2luZyBpbiBwbGFjZSByaWdodCBub3c/Cj4+IAo+IAo+IFll
cy4gVGhlIGxvY2tpbmcgaXMgZWl0aGVyIHZpYSB0aGUgUDJNIG9yIGdyYW50IHRhYmxlIGxvY2tz
IGZvciBhbGwgY3VycmVudCAKPiB1c2VzIG9yIG1hcCBhbmQgdW5tYXAgdGhhdCBJIGNhbiBzZWUu
CgpCdXQgdHdvIGRpZmZlcmVudCBsb2NrcyBzdGlsbCBtZWFucyBubyBndWFyYW50ZWVzIGF0IGFs
bC4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
