From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] tools: only call git when necessary in OVMF
 Makefile
Date: Tue, 15 Jan 2019 12:41:19 +0100
Message-ID: <e4f01d0e-539c-b8f9-aa84-1ec210e575ec@suse.com>
References: <20190115110940.29403-1-wei.liu2@citrix.com>
 <20190115114028.cbf7wp7kihsltxha@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=93tI=PX=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1gjN5w-0001tp-2q
 for xen-devel@lists.xenproject.org; Tue, 15 Jan 2019 11:41:24 +0000
In-Reply-To: <20190115114028.cbf7wp7kihsltxha@zion.uk.xensource.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@citrix.com>, Olaf Hering <olaf@aepfle.de>, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTUvMDEvMjAxOSAxMjo0MCwgV2VpIExpdSB3cm90ZToKPiBGb3Jnb3QgdG8gQ0MgSnVlcmdl
bi4gTm93IGRvbmUuCj4gCj4gT24gVHVlLCBKYW4gMTUsIDIwMTkgYXQgMTE6MDk6NDBBTSArMDAw
MCwgV2VpIExpdSB3cm90ZToKPj4gVXNlcnMgbWF5IGNob29zZSB0byBleHBvcnQgYSBzbmFwc2hv
dCBvZiBPVk1GIGFuZCBidWlsZCBpdAo+PiB3aXRoIHhlbi5naXQgc3VwcGxpZWQgb3ZtZi1tYWtl
ZmlsZS4gSW4gdGhhdCBjYXNlIHdlIGRvbid0Cj4+IG5lZWQgdG8gY2FsbCBgZ2l0IHN1Ym1vZHVs
ZWAuCj4+Cj4+IEZpeGVzIGIxNjI4MTg3MGUuCj4+Cj4+IFJlcG9ydGVkLWJ5OiBPbGFmIEhlcmlu
ZyA8b2xhZkBhZXBmbGUuZGU+Cj4+IFNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNp
dHJpeC5jb20+CgpSZWxlYXNlLWFja2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5j
b20+CgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
