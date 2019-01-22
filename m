From: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [RFC] virtio_ring: check dma_mem for xen_domain
Date: Mon, 21 Jan 2019 21:36:39 -0500
Message-ID: <20190121213617-mutt-send-email-mst__40264.2021932238$1548124683$gmane$org@kernel.org>
References: <20190121050056.14325-1-peng.fan@nxp.com>
 <20190121082830.GC12420@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=N4as=P6=redhat.com=mst@srs-us1.protection.inumbo.net>)
 id 1gllw9-00043B-0R
 for xen-devel@lists.xenproject.org; Tue, 22 Jan 2019 02:37:13 +0000
Content-Disposition: inline
In-Reply-To: <20190121082830.GC12420@infradead.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "hch@infradead.org" <hch@infradead.org>
Cc: Peng Fan <peng.fan@nxp.com>, "sstabellini@kernel.org" <sstabellini@kernel.org>, "jasowang@redhat.com" <jasowang@redhat.com>, "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "virtualization@lists.linux-foundation.org" <virtualization@lists.linux-foundation.org>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBKYW4gMjEsIDIwMTkgYXQgMTI6Mjg6MzBBTSAtMDgwMCwgaGNoQGluZnJhZGVhZC5v
cmcgd3JvdGU6Cj4gT24gTW9uLCBKYW4gMjEsIDIwMTkgYXQgMDQ6NTE6NTdBTSArMDAwMCwgUGVu
ZyBGYW4gd3JvdGU6Cj4gPiBvbiBpLk1YOFFNLCBNNF8xIGlzIGNvbW11bmljYXRpbmcgd2l0aCBE
b21VIHVzaW5nIHJwbXNnIHdpdGggYSBmaXhlZAo+ID4gYWRkcmVzcyBhcyB0aGUgZG1hIG1lbSBi
dWZmZXIgd2hpY2ggaXMgcHJlZGVmaW5lZC4KPiA+IAo+ID4gV2l0aG91dCB0aGlzIHBhdGNoLCB0
aGUgZmxvdyBpczoKPiA+IHZyaW5nX21hcF9vbmVfc2cgLT4gdnJpbmdfdXNlX2RtYV9hcGkKPiA+
ICAgICAgICAgICAgICAgICAgLT4gZG1hX21hcF9wYWdlCj4gPiAJCSAgICAgICAtPiBfX3N3aW90
bGJfbWFwX3BhZ2UKPiA+IAkJICAgICAgICAgICAgICAgIC0+c3dpb3RsYl9tYXBfcGFnZQo+ID4g
CQkJCS0+X19kbWFfbWFwX2FyZWEocGh5c190b192aXJ0KGRtYV90b19waHlzKGRldiwgZGV2X2Fk
ZHIpKSwgc2l6ZSwgZGlyKTsKPiA+IEhvd2V2ZXIgd2UgYXJlIHVzaW5nIHBlciBkZXZpY2UgZG1h
IGFyZWEgZm9yIHJwbXNnLCBwaHlzX3RvX3ZpcnQKPiA+IGNvdWxkIG5vdCByZXR1cm4gYSBjb3Jy
ZWN0IHZpcnR1YWwgYWRkcmVzcyBmb3IgdmlydHVhbCBhZGRyZXNzIGluCj4gPiB2bWFsbG9jIGFy
ZWEuIFRoZW4ga2VybmVsIHBhbmljLgo+IAo+IEFuZCB0aGF0IGlzIHRoZSByaWdodCB0aGluZyB0
byBkby4gIFlvdSBtdXN0IG5vdCBjYWxsIGRtYV9tYXBfKiBvbgo+IG1lbW9yeSB0aGF0IHdhcyBh
bGxvY2F0ZWQgZnJvbSBkbWFfYWxsb2NfKi4KPiAKPiBXZSBhY3R1YWxseSBoYXZlIGFub3RoZXIg
dGhyZWFkIHdoaWNoIGFwcGVhcnMgdG8gYmUgZm9yIHRoaXMgc2FtZSBpc3N1ZS4KClNvcnJ5LCB3
aGljaCB0aHJlYWQgZG8geW91IHJlZmVyIHRvPwoKLS0gCk1TVAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
