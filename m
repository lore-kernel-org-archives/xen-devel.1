From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] x86: don't build guest-walk code without
 HVM and SHADOW_PAGING
Date: Fri, 5 Oct 2018 12:00:00 +0100
Message-ID: <20181005110000.wk4vhr4nudlpzt3p@zion.uk.xensource.com>
References: <5BB73B0502000078001EEBB6@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=qudt=mr=citrix.com=prvs=80982b68a=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1g8Nq1-0003vg-BI
 for xen-devel@lists.xenproject.org; Fri, 05 Oct 2018 11:00:05 +0000
Content-Disposition: inline
In-Reply-To: <5BB73B0502000078001EEBB6@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Tim Deegan <tim@xen.org>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBPY3QgMDUsIDIwMTggYXQgMDQ6MjA6NTNBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gSXQncyBkZWFkIGNvZGUgaW4gdGhhdCBjYXNlLgo+IAo+IFdlIGNvdWxkIGdvIGZ1cnRo
ZXIsIGFzIHdlIGRvbid0IHJlYWxseSBuZWVkIHRoZSAyLSBhbmQgMy1sZXZlbCB3YWxrCj4gY29k
ZSBpbiBQViBtb2RlLCBidXQgdG8gZHJvcCB0aGVpciBjb21waWxhdGlvbiByZXF1aXJlcyBxdWl0
ZSBhIGJpdCBvZgo+IGRpc2VudGFuZ2xpbmcgb2Ygc2hhZG93IG1vZGUgY29kZS4KPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpXaXRoIG9yIHdpdGhv
dXQgdGhlIGFkanVzdG1lbnQgQW5kcmV3IGFza2VkIGZvcjoKClJldmlld2VkLWJ5OiBXZWkgTGl1
IDx3ZWkubGl1MkBjaXRyaXguY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
