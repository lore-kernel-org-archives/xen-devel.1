From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 02/10] xen: rename un/map_mmio_regions to
 un/map_regions
Date: Thu, 2 May 2019 11:55:06 -0700 (PDT)
Message-ID: <alpine.DEB.2.10.1905021150580.1347@sstabellini-ThinkPad-X260>
References: <alpine.DEB.2.10.1904301358560.13269@sstabellini-ThinkPad-X260>
 <1556658172-8824-2-git-send-email-sstabellini@kernel.org>
 <5CCB06C9020000780022B577@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6X+8=TC=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hMGrW-0004xj-Jj
 for xen-devel@lists.xenproject.org; Thu, 02 May 2019 18:55:18 +0000
In-Reply-To: <5CCB06C9020000780022B577@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Stefano Stabellini <stefanos@xilinx.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCAyIE1heSAyMDE5LCBKYW4gQmV1bGljaCB3cm90ZToKPiA+Pj4gT24gMzAuMDQuMTkg
YXQgMjM6MDIsIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPiB3cm90ZToKPiA+IE5vdyB0aGF0IG1h
cF9tbWlvX3JlZ2lvbnMgdGFrZXMgYSBwMm10IHBhcmFtZXRlciwgdGhlcmUgaXMgbm8gbmVlZCB0
bwo+ID4ga2VlcCAibW1pbyIgaW4gdGhlIG5hbWUuIFRoZSBwMm10IHBhcmFtZXRlciBkb2VzIGEg
YmV0dGVyIGpvYiBhdAo+ID4gZXhwcmVzc2luZyB3aGF0IHRoZSBtYXBwaW5nIGlzIGFib3V0LiBM
ZXQncyBzYXZlIHRoZSBlbnZpcm9ubWVudCA1Cj4gPiBjaGFyYWN0ZXJzIGF0IGEgdGltZS4KPiAK
PiBCdXQgYXMgcGVyIHRoZSBjb3ZlciBsZXR0ZXIgdGhlIHB1cnBvc2UgaXMgdG8gYWxsb3cgbWFw
cGluZwo+IGlvbWVtICh3aGljaCBJIHRha2UgaXMganVzdCBhbiBhbHRlcm5hdGl2ZSB0ZXJtIGZv
ciBNTUlPKS4KPiBFdmVuIGlmIHRoYXQncyBtaXNsZWFkaW5nLCB7LHVufW1hcF9yZWdpb25zKCkg
aXMgYSBsaXR0bGUgdG9vCj4gdW5zcGVjaWZpYyBmb3IgbXkgdGFzdGUuIEF0IHdoaWNoIHBvaW50
IGF0IGxlYXN0IHRoZQo+IGVudmlyb25tZW50IHNhdmluZyBhcmd1bWVudCBnb2VzIGF3YXkgOy0p
CgpIb25lc3RseSwgSSBhbSBub3Qgb25lIHRvIGNhcmUgZm9yIGZ1bmN0aW9ucyBuYW1lcy4gQXMg
bG9uZyBhcyB0aGUgb3RoZXIKbWFpbnRhaW5lcnMgYWdyZWUgd2l0aCBlYWNoIG90aGVycywgSSBh
bSBoYXBweSB0byBtYWtlIHRoZSByZXF1aXJlZApjaGFuZ2VzLgoKCj4gQXMgdG8gdGhlIHNlcmll
cyBhcyBhIHdob2xlLCBJIGd1ZXNzIHlvdSBmaXJzdCB3YW50IHRvIGNvbWUKPiB0byBhbiBhZ3Jl
ZW1lbnQgd2l0aCBKdWxpZW4uIE9ubHkgdGhlbiBpdCdsbCBtYWtlIHNlbnNlIHRvCj4gYWN0dWFs
bHkgcmV2aWV3IHRoZSBjaGFuZ2VzLCBJIHRoaW5rLgoKRmFpciBlbm91Z2gsIGJ1dCBJIGRvbid0
IHRoaW5rIEp1bGllbiBhbmQgSSBoYXZlIHN1Y2ggYSBiaWcgZGlzYWdyZWVtZW50Cm9uIHRoZSBz
aGFwZSBvZiB0aGUgc2VyaWVzLiAoSGUgc3RpbGwgbmVlZHMgdG8gY29tcGxldGUgaGlzIHJldmll
dyBvZiB2Mgp0aG91Z2guKQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
