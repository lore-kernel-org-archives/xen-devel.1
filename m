From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 6/7] vtd: change lookup_page failure
 semantics
Date: Fri, 21 Sep 2018 04:27:37 -0600
Message-ID: <5BA4C79902000078001EA7D4@prv1-mh.provo.novell.com>
References: <20180920141149.1643-1-paul.durrant@citrix.com>
 <20180920141149.1643-7-paul.durrant@citrix.com>
 <5BA4C4FE02000078001EA795@prv1-mh.provo.novell.com>
 <97f290771d6d4b6da376e8cf962ce31a@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=q3to=md=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1g3Iey-0002Yr-Mr
 for xen-devel@lists.xenproject.org; Fri, 21 Sep 2018 10:27:40 +0000
In-Reply-To: <97f290771d6d4b6da376e8cf962ce31a@AMSPEX02CL03.citrite.net>
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, Kevin Tian <kevin.tian@intel.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIxLjA5LjE4IGF0IDEyOjE4LCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+PiAgLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPj4gRnJvbTogSmFuIEJldWxpY2ggW21h
aWx0bzpKQmV1bGljaEBzdXNlLmNvbV0KPj4gU2VudDogMjEgU2VwdGVtYmVyIDIwMTggMTE6MTcK
Pj4gVG86IFBhdWwgRHVycmFudCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+Cj4+IENjOiBLZXZp
biBUaWFuIDxrZXZpbi50aWFuQGludGVsLmNvbT47IHhlbi1kZXZlbCA8eGVuLQo+PiBkZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZz4KPj4gU3ViamVjdDogUmU6IFtYZW4tZGV2ZWxdIFtQQVRDSCA2
LzddIHZ0ZDogY2hhbmdlIGxvb2t1cF9wYWdlIGZhaWx1cmUKPj4gc2VtYW50aWNzCj4+IAo+PiA+
Pj4gT24gMjAuMDkuMTggYXQgMTY6MTEsIDxwYXVsLmR1cnJhbnRAY2l0cml4LmNvbT4gd3JvdGU6
Cj4+ID4gQ29tbWl0IDQzZDE2MjJiICJ2dGQ6IGFkZCBsb29rdXBfcGFnZSBtZXRob2QgdG8gaW9t
bXVfb3BzIiBhZGRlZCBhCj4+ID4gbG9va3VwIG1ldGhvZCBpbiB0byB0aGUgVlQtZCBJT01NVSBp
bXBsZW1lbnRhdGlvbi4KPj4gCj4+IFdpdGggdGhpcyBub3QgaGF2aW5nIGdvbmUgaW4geWV0LCBp
cyB0aGVyZSBhbnkgcmVhc29uIG5vdCB0byBtYWtlIHRoZQo+PiBhZGp1c3RtZW50IHJpZ2h0IHRo
ZXJlPwo+PiAKPiAKPiBObywgb3RoZXIgdGhhbiB0aGF0IGNvbW1pdCBoYXZpbmcgYWxsIHRoZSBu
ZWNlc3NhcnkgYWNrcyBhbmQgdGh1cyAKPiBwb3RlbnRpYWxseSBiZWluZyBjb21taXR0ZWQgd2hp
bHN0IEkgd2FzIHdvcmtpbmcgb24gdGhpcyBzZXJpZXMuIFdvdWxkIHlvdSAKPiByYXRoZXIgSSBz
dWJtaXR0ZWQgdjExIG9mIHRoZSBvdGhlciBzZXJpZXM/CgpJJ20gbm90IGdvaW5nIHRvIGluc2lz
dCwgYnV0IGl0IHdvdWxkIGxvb2sgY2xlYW5lciB0aGF0IHdheS4gQU1EIGFja3MgZm9yCnRoZSBm
aXJzdCBvZiB5b3VyIHNlcmllcyBhcmUgc3RpbGwgd2F5IG91dCBhbnl3YXksIEknbSBhZnJhaWQu
CgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
