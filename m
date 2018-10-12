From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] x86: restrict HVMOP_pagetable_dying to
 current
Date: Fri, 12 Oct 2018 15:49:23 +0100
Message-ID: <20181012144923.ndbb5yvyyaku6s7x@zion.uk.xensource.com>
References: <5BB74B1A02000078001EECBE@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=zta5=my=citrix.com=prvs=8166c57ff=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gAykp-00076s-Eh
 for xen-devel@lists.xenproject.org; Fri, 12 Oct 2018 14:49:27 +0000
Content-Disposition: inline
In-Reply-To: <5BB74B1A02000078001EECBE@prv1-mh.provo.novell.com>
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

T24gRnJpLCBPY3QgMDUsIDIwMTggYXQgMDU6Mjk6MzBBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gVGhpcyBpcyBub3QgdXNlZCAoYW5kIHByb2JhYmx5IHdhcyBuZXZlciBtZWFudCB0byBi
ZSkgYnkgdGhlIHRvb2wgc3RhY2suCj4gTGltaXRpbmcgaXQgdG8gdGhlIGN1cnJlbnQgZG9tYWlu
IGluIHBhcnRpY3VsYXIgYWxsb3dzIHRvIGVsaW1pbmF0ZSBhCj4gYm9ndXMgdXNlIG9mIHZDUFUg
MCBpbiBwYWdldGFibGVfZHlpbmcoKS4KPiAKPiBSZW1vdmUgdGhlIG5vdyB1bm5lY2Vzc2FyeSBk
b21haW4vdkNQVSBwYXJhbWV0ZXJzIGZyb20gdGhlIHdyYXBwZXIvaG9vawo+IGZ1bmN0aW9ucyBh
dCB0aGUgc2FtZSB0aW1lLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGlj
aEBzdXNlLmNvbT4KClJldmlld2VkLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
