From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] xen-swiotlb: use actually allocated size on
 check physical contiguous
Date: Tue, 4 Sep 2018 21:13:30 +0200
Message-ID: <20180904191330.GA16532__49497.6717899137$1536088345$gmane$org@kroah.com>
References: <d578b69a-848b-2c86-175a-1b1933d82a36@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ohbg=ls=linuxfoundation.org=gregkh@srs-us1.protection.inumbo.net>)
 id 1fxGlb-00033A-A5
 for xen-devel@lists.xenproject.org; Tue, 04 Sep 2018 19:13:35 +0000
Content-Disposition: inline
In-Reply-To: <d578b69a-848b-2c86-175a-1b1933d82a36@oracle.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Joe Jin <joe.jin@oracle.com>
Cc: John Sobecki <john.sobecki@oracle.com>, "DONGLI.ZHANG" <dongli.zhang@oracle.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, stable@vger.kernel.org, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBTZXAgMDQsIDIwMTggYXQgMTE6MTY6NThBTSAtMDcwMCwgSm9lIEppbiB3cm90ZToK
PiB4ZW5fc3dpb3RsYl97YWxsb2MsZnJlZX1fY29oZXJlbnQoKSBhY3R1YWxseSBhbGxvY2F0ZS9m
cmVlIHNpemUgYnkgb3JkZXIKPiBidXQgdXNlZCB0aGUgcmVxdWlyZWQgc2l6ZSB0byBjaGVjayBp
ZiBhZGRyZXNzIGlzIHBoeXNpY2FsIGNvbnRpZ3VvdXMsCj4gaWYgZmlyc3QgcGFnZXMgYXJlIHBo
eXNpY2FsIGNvbnRpZ3VvdXMgYWxzbyBwYXNzZWQKPiByYW5nZV9zdHJhZGRsZXNfcGFnZV9ib3Vu
ZGFyeSgpIGNoZWNrLCBidXQgb3RoZXJzIHdlcmUgbm90IGl0IHdpbGwKPiBsZWFkIGtlcm5lbCBw
YW5pYy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKb2UgSmluIDxqb2UuamluQG9yYWNsZS5jb20+Cj4g
Q2M6IEtvbnJhZCBSemVzenV0ZWsgV2lsayA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT4KPiAtLS0K
PiAgZHJpdmVycy94ZW4vc3dpb3RsYi14ZW4uYyB8IDYgKysrKysrCj4gIDEgZmlsZSBjaGFuZ2Vk
LCA2IGluc2VydGlvbnMoKykKPiAKCjxmb3JtbGV0dGVyPgoKVGhpcyBpcyBub3QgdGhlIGNvcnJl
Y3Qgd2F5IHRvIHN1Ym1pdCBwYXRjaGVzIGZvciBpbmNsdXNpb24gaW4gdGhlCnN0YWJsZSBrZXJu
ZWwgdHJlZS4gIFBsZWFzZSByZWFkOgogICAgaHR0cHM6Ly93d3cua2VybmVsLm9yZy9kb2MvaHRt
bC9sYXRlc3QvcHJvY2Vzcy9zdGFibGUta2VybmVsLXJ1bGVzLmh0bWwKZm9yIGhvdyB0byBkbyB0
aGlzIHByb3Blcmx5LgoKPC9mb3JtbGV0dGVyPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
