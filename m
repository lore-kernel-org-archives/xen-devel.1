From: Sasha Levin <sashal@kernel.org>
Subject: Re: [PATCH] xen-blkfront: switch kcalloc to kvcalloc
 for large array allocation
Date: Sun, 5 May 2019 15:12:58 -0400
Message-ID: <20190505191258.GB1747__37875.9945322358$1557083647$gmane$org@sasha-vm>
References: <20190503150401.15904-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=U2sm=TF=kernel.org=sashal@srs-us1.protection.inumbo.net>)
 id 1hNMZM-0002QI-Ua
 for xen-devel@lists.xenproject.org; Sun, 05 May 2019 19:13:04 +0000
Content-Disposition: inline
In-Reply-To: <20190503150401.15904-1-roger.pau@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Jens Axboe <axboe@kernel.dk>, Stefano Stabellini <sstabellini@kernel.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, linux-kernel@vger.kernel.org, stable@vger.kernel.org, linux-block@vger.kernel.org, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBNYXkgMDMsIDIwMTkgYXQgMDU6MDQ6MDFQTSArMDIwMCwgUm9nZXIgUGF1IE1vbm5l
IHdyb3RlOgo+VGhlcmUncyBubyByZWFzb24gdG8gcmVxdWVzdCBwaHlzaWNhbGx5IGNvbnRpZ3Vv
dXMgbWVtb3J5IGZvciB0aG9zZQo+YWxsb2NhdGlvbnMuCj4KPlJlcG9ydGVkLWJ5OiBJYW4gSmFj
a3NvbiA8aWFuLmphY2tzb25AY2l0cml4LmNvbT4KPlNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBN
b25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgo+LS0tCgpZb3UgcmVhbGx5IGRvbid0IHdhbnQg
dGhpcyBzY2lzc29yIGxpbmUgaGVyZSwgZ2l0IHdpbGwgdHJpbSBhbGwgeW91cgptZXNzYWdlIGNv
bnRlbnQgYmVsb3cgaXQuCgotLQpUaGFua3MsClNhc2hhCgo+Q2M6IEJvcmlzIE9zdHJvdnNreSA8
Ym9yaXMub3N0cm92c2t5QG9yYWNsZS5jb20+Cj5DYzogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1
c2UuY29tPgo+Q2M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4K
PkNjOiBLb25yYWQgUnplc3p1dGVrIFdpbGsgPGtvbnJhZC53aWxrQG9yYWNsZS5jb20+Cj5DYzog
SmVucyBBeGJvZSA8YXhib2VAa2VybmVsLmRrPgo+Q2M6IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwo+Q2M6IGxpbnV4LWJsb2NrQHZnZXIua2VybmVsLm9yZwo+Q2M6IHN0YWJsZUB2Z2Vy
Lmtlcm5lbC5vcmcKPi0tLQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
