From: Joe Jin <joe.jin@oracle.com>
Subject: Re: [PATCH V2] xen-swiotlb: use actually allocated size
 on check physical continuous
Date: Fri, 19 Oct 2018 09:17:33 -0700
Message-ID: <09206a13-0fad-bfbd-062d-259f857b6a90__40445.333303842$1539965785$gmane$org@oracle.com>
References: <0453c762-1f8b-079f-5fdf-548e90909318@oracle.com>
 <20181018235219.GA36047@konrads-mbp.lan>
 <e476c3e8-d501-c5c6-d389-8b0b33adf4b1@oracle.com>
 <20181019134303.GC54336@Konrads-MacBook-Pro.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=e8ot=m7=oracle.com=joe.jin@srs-us1.protection.inumbo.net>)
 id 1gDXT8-0008TY-DZ
 for xen-devel@lists.xenproject.org; Fri, 19 Oct 2018 16:17:46 +0000
In-Reply-To: <20181019134303.GC54336@Konrads-MacBook-Pro.local>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: John Sobecki <john.sobecki@oracle.com>, "DONGLI.ZHANG" <dongli.zhang@oracle.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, konrad@kernel.org, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Christoph Helwig <hch@lst.de>
List-Id: xen-devel@lists.xenproject.org

T24gMTAvMTkvMTggNjo0MyBBTSwgS29ucmFkIFJ6ZXN6dXRlayBXaWxrIHdyb3RlOgo+IEkgd2ls
bCBmb2xkIGluIHRoZSBzdGFjayB0cmFjZSBpbiBsYXRlciB0b25pZ2h0LiBUaGFua3MhCgpUaGFu
ayB5b3UgdmVyeSBtdWNoIQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
