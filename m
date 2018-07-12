From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH 8/8] cpumask: tidy {,z}alloc_cpumask_var()
Date: Thu, 12 Jul 2018 16:13:03 +0100
Message-ID: <20180712151303.jg3w5uvaxrbvfwcu@citrix.com>
References: <5B45F01B02000078001D30FF@prv1-mh.provo.novell.com>
 <5B45F41E02000078001D3174@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ay1y=j4=citrix.com=prvs=72409e2aa=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fddHc-0000NT-29
 for xen-devel@lists.xenproject.org; Thu, 12 Jul 2018 15:13:28 +0000
Content-Disposition: inline
In-Reply-To: <5B45F41E02000078001D3174@prv1-mh.provo.novell.com>
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

T24gV2VkLCBKdWwgMTEsIDIwMTggYXQgMDY6MTI6MTRBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gRHJvcCB1bm5lY2Vzc2FyeSBjYXN0cyBhbmQgdXNlIGJvb2wgaW4gZmF2b3Igb2YgYm9v
bF90Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4K
ClJldmlld2VkLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
