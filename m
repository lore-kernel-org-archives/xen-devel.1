From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH 2/2] xen-netfront: Fix race between device
 setup and open
Date: Thu, 11 Jan 2018 11:08:10 -0500 (EST)
Message-ID: <20180111.110810.1332044409040498618.davem__28549.2171220996$1515686839$gmane$org@davemloft.net>
References: <20180111093638.28937-3-ross.lagerwall@citrix.com>
 <20180111.102622.769744562294438306.davem@davemloft.net>
 <f297b1a4-d287-ba66-ad44-bf6073950bdf@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=93p6=eg=davemloft.net=davem@srs-us1.protection.inumbo.net>)
 id 1eZfOo-0005Ie-TQ
 for xen-devel@lists.xenproject.org; Thu, 11 Jan 2018 16:08:14 +0000
In-Reply-To: <f297b1a4-d287-ba66-ad44-bf6073950bdf@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: ross.lagerwall@citrix.com
Cc: jgross@suse.com, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com, linux-kernel@vger.kernel.org, netdev@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

RnJvbTogUm9zcyBMYWdlcndhbGwgPHJvc3MubGFnZXJ3YWxsQGNpdHJpeC5jb20+CkRhdGU6IFRo
dSwgMTEgSmFuIDIwMTggMTU6NDk6MDcgKzAwMDAKCj4gSSd2ZSBub3cgYWRkZWQgQ0MnZCBuZXRk
ZXYgb24gdGhlIG90aGVyIHR3by4KClRoYXQgZG9lc24ndCB3b3JrLgoKSWYgeW91IGRvbid0IHBv
c3QgdGhlIG9yaWdpbmFscyBleHBsaWNpdGx5IHRvIG5ldGRldiB0aGVuIGl0IHdvbid0CmdldCBw
cm9wZXJseSBxdWV1ZWQgaW4gcGF0Y2h3b3JrLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
