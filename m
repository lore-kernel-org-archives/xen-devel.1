From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] rangeset: make inquiry functions tolerate
 NULL inputs
Date: Fri, 17 Aug 2018 10:51:46 +0100
Message-ID: <20180817095146.uaam5wkjivfexwm3@citrix.com>
References: <5B76934B02000078001DF480@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=v/z7=la=citrix.com=prvs=760f4e3ef=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fqbQ5-0002DJ-SC
 for xen-devel@lists.xenproject.org; Fri, 17 Aug 2018 09:51:49 +0000
Content-Disposition: inline
In-Reply-To: <5B76934B02000078001DF480@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBBdWcgMTcsIDIwMTggYXQgMDM6MjA6MTFBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gUmF0aGVyIHRoYW4gc3BlY2lhbCBjYXNpbmcgdGhlIC0+aW9tZW1fY2FwcyBjaGVjayBp
biB4ODYncwo+IGdldF9wYWdlX2Zyb21fbDFlKCkgZm9yIHRoZSBkb21feGVuIGNhc2UsIGxldCdz
IGJlIG1vcmUgdG9sZXJhbnQgaW4KPiBnZW5lcmFsLCBhbG9uZyB0aGUgbGluZXMgb2YgcmFuZ2Vz
ZXRfaXNfZW1wdHkoKTogQSBuZXZlciBhbGxvY2F0ZWQKPiByYW5nZXNldCBjYW4ndCBwb3NzaWJs
eSBjb250YWluIG9yIG92ZXJsYXAgYW55IHJhbmdlLgo+IAo+IFJlcG9ydGVkLWJ5OiBBbmRyZXcg
Q29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgo+IFNpZ25lZC1vZmYtYnk6IEphbiBC
ZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KClJldmlld2VkLWJ5OiBXZWkgTGl1IDx3ZWkubGl1
MkBjaXRyaXguY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
