From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 1/2] xen-pciback: Fix error return in
 bar_write() and rom_write()
Date: Mon, 03 Dec 2018 03:55:03 -0700
Message-ID: <5C050B87020000780020222E__23737.5012402937$1543834554$gmane$org@prv1-mh.provo.novell.com>
References: <cover.55c0e31b75e2fbdf4206cc39c2fd7581793ae7ae.1543772656.git-series.marmarek@invisiblethingslab.com><cover.55c0e31b75e2fbdf4206cc39c2fd7581793ae7ae.1543772656.git-series.marmarek@invisiblethingslab.com>
 <f5ea0f3c2e29a96b59e409e4ae4c62de11a05fc8.1543772656.git-series.marmarek@invisiblethingslab.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=cZP0=OM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gTluW-0007Mr-Im
 for xen-devel@lists.xenproject.org; Mon, 03 Dec 2018 10:57:08 +0000
In-Reply-To: <f5ea0f3c2e29a96b59e409e4ae4c62de11a05fc8.1543772656.git-series.marmarek@invisiblethingslab.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Marek Marczykowski <marmarek@invisiblethingslab.com>
Cc: Dwayne Litzenberger <dlitz@dlitz.net>, Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, linux-kernel@vger.kernel.org, xen-devel <xen-devel@lists.xenproject.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAyLjEyLjE4IGF0IDE4OjQ3LCA8bWFybWFyZWtAaW52aXNpYmxldGhpbmdzbGFiLmNv
bT4gd3JvdGU6Cj4gRnJvbTogRHdheW5lIExpdHplbmJlcmdlciA8ZGxpdHpAZGxpdHoubmV0Pgo+
IAo+IFNpZ25lZC1vZmYtYnk6IER3YXluZSBMaXR6ZW5iZXJnZXIgPGRsaXR6QGRsaXR6Lm5ldD4K
CkF0IGxlYXN0IGluIHRoZSBrZXJuZWwgd29ybGQgSSB0aGluayB5b3VyIG93biBTT0IgaXMgZXhw
ZWN0ZWQgaGVyZS4KCkFsc28gdGhlIGRlc2NyaXB0aW9uIHdvdWxkIGJldHRlciBiZSBub24tZW1w
dHksIGV4cGxhaW5pbmcgdW5kZXIKd2hhdCBjb25kaXRpb25zIGZhaWx1cmUgd2FzIG9ic2VydmVk
IChhbmQgd3JvbmdseSBpZ25vcmVkKSwgb3IKd2hldGhlciBpbnN0ZWFkIHRoZSBjaGFuZ2UgaXMg
c29sZWx5ICJqdXN0IGluIGNhc2UiLgoKU29tZSBzdHlsaXN0aWMgYWRqdXN0bWVudHMgd291bGQg
YWxzbyBzZWVtIG9uIG9yZGVyLCBidXQgc2luY2UKSSdtIG5vdCBlbnRpcmVseSBjZXJ0YWluIGFi
b3V0IHRoZSBrZXJuZWwgcG9saWN5IGluIHRoaXMgcmVnYXJkIEknbGwKb21pdCByZXNwZWN0aXZl
IHJlbWFya3MuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
