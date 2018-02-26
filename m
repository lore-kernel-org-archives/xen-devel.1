From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH][next] xen-netback: make function
	xenvif_rx_skb static
Date: Mon, 26 Feb 2018 11:37:18 -0500 (EST)
Message-ID: <20180226.113718.2265855249140521271.davem__14482.2785201997$1519662980$gmane$org@davemloft.net>
References: <20180223171657.5748-1-colin.king@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=hscu=fu=davemloft.net=davem@srs-us1.protection.inumbo.net>)
 id 1eqLmJ-0002Tm-PV
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2018 16:37:27 +0000
In-Reply-To: <20180223171657.5748-1-colin.king@canonical.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: colin.king@canonical.com
Cc: wei.liu2@citrix.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, paul.durrant@citrix.com, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

RnJvbTogQ29saW4gS2luZyA8Y29saW4ua2luZ0BjYW5vbmljYWwuY29tPgpEYXRlOiBGcmksIDIz
IEZlYiAyMDE4IDE3OjE2OjU3ICswMDAwCgo+IEZyb206IENvbGluIElhbiBLaW5nIDxjb2xpbi5r
aW5nQGNhbm9uaWNhbC5jb20+Cj4gCj4gVGhlIGZ1bmN0aW9uIHhlbnZpZl9yeF9za2IgaXMgbG9j
YWwgdG8gdGhlIHNvdXJjZSBhbmQgZG9lcyBub3QgbmVlZAo+IHRvIGJlIGluIGdsb2JhbCBzY29w
ZSwgc28gbWFrZSBpdCBzdGF0aWMuCj4gCj4gQ2xlYW5zIHVwIHNwYXJzZSB3YXJuaW5nOgo+IGRy
aXZlcnMvbmV0L3hlbi1uZXRiYWNrL3J4LmM6NDIyOjY6IHdhcm5pbmc6IHN5bWJvbCAneGVudmlm
X3J4X3NrYicKPiB3YXMgbm90IGRlY2xhcmVkLiBTaG91bGQgaXQgYmUgc3RhdGljPwo+IAo+IFNp
Z25lZC1vZmYtYnk6IENvbGluIElhbiBLaW5nIDxjb2xpbi5raW5nQGNhbm9uaWNhbC5jb20+CgpB
cHBsaWVkLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
