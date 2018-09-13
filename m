From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] pass-through: adjust pIRQ migration
Date: Thu, 13 Sep 2018 17:44:19 +0100
Message-ID: <20180913164419.jv7hfq2dcjenncwk@zion.uk.xensource.com>
References: <5B9678B402000078001E6CD6@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=p4g3=l3=citrix.com=prvs=78776abe6=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1g0UjA-0001XJ-Gg
 for xen-devel@lists.xenproject.org; Thu, 13 Sep 2018 16:44:24 +0000
Content-Disposition: inline
In-Reply-To: <5B9678B402000078001E6CD6@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBTZXAgMTAsIDIwMTggYXQgMDc6NTk6MTZBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gRm9yIG9uZSBpdCBpcyBxdWl0ZSBwb2ludGxlc3MgdG8gaXRlcmF0ZSBvdmVyIGFsbCBw
SVJRLXMgdGhlIGRvbWFpbiBoYXMKPiB3aGVuIGp1c3Qgb25lIGlzIGJlaW5nIGFkanVzdGVkLiBJ
bnRyb2R1Y2UgaHZtX21pZ3JhdGVfcGlycSgpLgo+IAo+IEFkZGl0aW9uYWxseSBpdCBpcyBib2d1
cyB0byBtaWdyYXRlIHRoZSBwSVJRIHRvIGEgdkNQVSBkaWZmZXJlbnQgZnJvbQo+IHRoZSBvbmUg
dGhlIGV2ZW50IGlzIHN1cHBvc2VkIHRvIGJlIHBvc3RlZCB0byAtIGlmIGFueXRoaW5nLCBpdCBt
aWdodCBiZQo+IHdvcnRoIGNvbnNpZGVyaW5nIG5vdCB0byBtaWdyYXRlIHRoZSBwSVJRIGF0IGFs
bCBpbiB0aGUgcG9zdGluZyBjYXNlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxq
YmV1bGljaEBzdXNlLmNvbT4KClJldmlld2VkLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXgu
Y29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
