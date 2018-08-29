From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH 3/3] xen-netback: handle page straddling in
 xenvif_set_hash_mapping()
Date: Wed, 29 Aug 2018 09:26:07 +0100
Message-ID: <20180829082607.ev57m7chj7xb3yt6__13011.7903616794$1535531087$gmane$org@citrix.com>
References: <5B85622302000078001E2A35@prv1-mh.provo.novell.com>
 <5B85637E02000078001E2A50@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=vupe=lm=citrix.com=prvs=7720ea622=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fuvnm-0003x3-Vx
 for xen-devel@lists.xenproject.org; Wed, 29 Aug 2018 08:26:11 +0000
Content-Disposition: inline
In-Reply-To: <5B85637E02000078001E2A50@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Paul Durrant <paul.durrant@citrix.com>, Wei Liu <wei.liu2@citrix.com>, davem@davemloft.net, netdev@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBBdWcgMjgsIDIwMTggYXQgMDk6MDA6MTRBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gVGhlcmUncyBubyBndWFyYW50ZWUgdGhhdCB0aGUgbWFwcGluZyBhcnJheSBkb2Vzbid0
IGNyb3NzIGEgcGFnZQo+IGJvdW5kYXJ5LiBVc2UgYSBzZWNvbmQgZ3JhbnQgY29weSBvcGVyYXRp
b24gaWYgbmVjZXNzYXJ5Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGlj
aEBzdXNlLmNvbT4KCkFja2VkLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
