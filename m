From: "hch@infradead.org" <hch@infradead.org>
Subject: Re: [RFC] virtio_ring: check dma_mem for xen_domain
Date: Mon, 21 Jan 2019 00:28:30 -0800
Message-ID: <20190121082830.GC12420__28200.1595398926$1548059371$gmane$org@infradead.org>
References: <20190121050056.14325-1-peng.fan@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WrwR=P5=bombadil.srs.infradead.org=batv+795868f1a23072595e3d+5629+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1glUwe-0004JM-4i
 for xen-devel@lists.xenproject.org; Mon, 21 Jan 2019 08:28:36 +0000
Content-Disposition: inline
In-Reply-To: <20190121050056.14325-1-peng.fan@nxp.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Peng Fan <peng.fan@nxp.com>
Cc: "sstabellini@kernel.org" <sstabellini@kernel.org>, "mst@redhat.com" <mst@redhat.com>, "jasowang@redhat.com" <jasowang@redhat.com>, "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "virtualization@lists.linux-foundation.org" <virtualization@lists.linux-foundation.org>, "hch@infradead.org" <hch@infradead.org>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBKYW4gMjEsIDIwMTkgYXQgMDQ6NTE6NTdBTSArMDAwMCwgUGVuZyBGYW4gd3JvdGU6
Cj4gb24gaS5NWDhRTSwgTTRfMSBpcyBjb21tdW5pY2F0aW5nIHdpdGggRG9tVSB1c2luZyBycG1z
ZyB3aXRoIGEgZml4ZWQKPiBhZGRyZXNzIGFzIHRoZSBkbWEgbWVtIGJ1ZmZlciB3aGljaCBpcyBw
cmVkZWZpbmVkLgo+IAo+IFdpdGhvdXQgdGhpcyBwYXRjaCwgdGhlIGZsb3cgaXM6Cj4gdnJpbmdf
bWFwX29uZV9zZyAtPiB2cmluZ191c2VfZG1hX2FwaQo+ICAgICAgICAgICAgICAgICAgLT4gZG1h
X21hcF9wYWdlCj4gCQkgICAgICAgLT4gX19zd2lvdGxiX21hcF9wYWdlCj4gCQkgICAgICAgICAg
ICAgICAgLT5zd2lvdGxiX21hcF9wYWdlCj4gCQkJCS0+X19kbWFfbWFwX2FyZWEocGh5c190b192
aXJ0KGRtYV90b19waHlzKGRldiwgZGV2X2FkZHIpKSwgc2l6ZSwgZGlyKTsKPiBIb3dldmVyIHdl
IGFyZSB1c2luZyBwZXIgZGV2aWNlIGRtYSBhcmVhIGZvciBycG1zZywgcGh5c190b192aXJ0Cj4g
Y291bGQgbm90IHJldHVybiBhIGNvcnJlY3QgdmlydHVhbCBhZGRyZXNzIGZvciB2aXJ0dWFsIGFk
ZHJlc3MgaW4KPiB2bWFsbG9jIGFyZWEuIFRoZW4ga2VybmVsIHBhbmljLgoKQW5kIHRoYXQgaXMg
dGhlIHJpZ2h0IHRoaW5nIHRvIGRvLiAgWW91IG11c3Qgbm90IGNhbGwgZG1hX21hcF8qIG9uCm1l
bW9yeSB0aGF0IHdhcyBhbGxvY2F0ZWQgZnJvbSBkbWFfYWxsb2NfKi4KCldlIGFjdHVhbGx5IGhh
dmUgYW5vdGhlciB0aHJlYWQgd2hpY2ggYXBwZWFycyB0byBiZSBmb3IgdGhpcyBzYW1lIGlzc3Vl
LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
