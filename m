From: "hch@infradead.org" <hch@infradead.org>
Subject: Re: [RFC] virtio_ring: check dma_mem for xen_domain
Date: Wed, 23 Jan 2019 13:14:05 -0800
Message-ID: <20190123211405.GA4971__43402.4253788934$1548278109$gmane$org@infradead.org>
References: <20190121050056.14325-1-peng.fan@nxp.com>
 <alpine.DEB.2.10.1901221113410.17936@sstabellini-ThinkPad-X260>
 <20190123071232.GA20526@infradead.org>
 <alpine.DEB.2.10.1901230935280.17936@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=CYfd=P7=bombadil.srs.infradead.org=batv+a9ed82934d27690332c0+5631+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1gmPqc-0004vA-Tf
 for xen-devel@lists.xenproject.org; Wed, 23 Jan 2019 21:14:11 +0000
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.10.1901230935280.17936@sstabellini-ThinkPad-X260>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: jgross@suse.com, Peng Fan <peng.fan@nxp.com>, "mst@redhat.com" <mst@redhat.com>, "jasowang@redhat.com" <jasowang@redhat.com>, "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "virtualization@lists.linux-foundation.org" <virtualization@lists.linux-foundation.org>, "hch@infradead.org" <hch@infradead.org>, luto@kernel.org, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, boris.ostrovsky@oracle.com
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBKYW4gMjMsIDIwMTkgYXQgMDE6MDQ6MzNQTSAtMDgwMCwgU3RlZmFubyBTdGFiZWxs
aW5pIHdyb3RlOgo+IElmIHZyaW5nX3VzZV9kbWFfYXBpIGlzIGFjdHVhbGx5IHN1cHBvc2VkIHRv
IHJldHVybiB0cnVlIHdoZW4KPiBkbWFfZGV2LT5kbWFfbWVtIGlzIHNldCwgdGhlbiBib3RoIFBl
bmcncyBwYXRjaCBhbmQgdGhlIHBhdGNoIEkgd3JvdGUKPiBhcmUgbm90IGZpeGluZyB0aGUgcmVh
bCBpc3N1ZSBoZXJlLgo+IAo+IEkgZG9uJ3Qga25vdyBlbm91Z2ggYWJvdXQgcmVtb3RlcHJvYyB0
byBrbm93IHdoZXJlIHRoZSBwcm9ibGVtIGFjdHVhbGx5Cj4gbGllcyB0aG91Z2guCgpUaGUgcHJv
YmxlbSBpcyB0aGUgZm9sbG93aW5nOgoKRGV2aWNlcyBjYW4gZGVjbGFyZSBhIHNwZWNpZmljIG1l
bW9yeSByZWdpb24gdGhhdCB0aGV5IHdhbnQgdG8gdXNlIHdoZW4KdGhlIGRyaXZlciBjYWxscyBk
bWFfYWxsb2NfY29oZXJlbnQgZm9yIHRoZSBkZXZpY2UsIHRoaXMgaXMgZG9uZSB1c2luZwp0aGUg
c2hhcmVkLWRtYS1wb29sIERUIGF0dHJpYnV0ZSwgd2hpY2ggY29tZXMgaW4gdHdvIHZhcmlhbnRz
IHRoYXQKd291bGQgYmUgYSBsaXR0bGUgdG8gbXVjaCB0byBleHBsYWluIGhlcmUuCgpyZW1vdGVw
cm9jIG1ha2VzIHVzZSBvZiB0aGF0IGJlY2F1c2UgYXBwYXJlbnRseSB0aGUgZGV2aWNlIGNhbgpv
bmx5IGNvbW11bmljYXRlIHVzaW5nIHRoYXQgcmVnaW9uLiAgQnV0IGl0IHRoZW4gZmVlZHMgYmFj
ayBtZW1vcnkKb2J0YWluZWQgd2l0aCBkbWFfYWxsb2NfY29oZXJlbnQgaW50byB0aGUgdmlydGlv
IGNvZGUuICBGb3IgdGhhdAppdCBjYWxscyB2bWFsbG9jX3RvX3BhZ2Ugb24gdGhlIGRtYV9hbGxv
Y19jb2hlcmVudCwgd2hpY2ggaXMgYSBodWdlCm5vLWdvIGZvciB0aGUgxJBNQSBBUEkgYW5kIG9u
bHkgd29ya2VkIGFjY2lkZW50YWxseSBvbiBhIGZldyBwbGF0Zm9ybSwKYW5kIGFwcGFyZW50bHkg
YXJtNjQganVzdCBjaGFuZ2VkIGEgZmV3IGludGVybmFscyB0aGF0IG1hZGUgaXQgc3RvcAp3b3Jr
aW5nIGZvciByZW1vdGVwcm9jLgoKVGhlIHJpZ2h0IGFuc3dlciBpcyB0byBub3QgdXNlIHRoZSBE
TUEgQVBJIHRvIGFsbG9jYXRlIG1lbW9yeSBmcm9tCmEgZGV2aWNlLXNwZWZpY2ljIHJlZ2lvbiwg
YnV0IHRvIHRpZSB0aGUgZHJpdmVyIGRpcmVjdGx5IGludG8gdGhlCkRUIHJlc2VydmVkIG1lbW9y
eSBBUEkgaW4gYSB3YXkgdGhhdCBhbGxvd3MgaXQgdG8gZWFzaWx0IG9idGFpbgphIHN0cnVjdCBk
ZXZpY2UgZm9yIGl0LgoKVGhpcyBpcyBvcnRob2dvbmFsIHRvIGFub3RoZXIgaXNzdWUsIGFuZCB0
aGF0IGlzIHRoYXQgaGFyZHdhcmUKdmlydGlvIGRldmljZXMgcmVhbGx5IGFsd2F5cyBuZWVkIHRv
IHVzZSB0aGUgRE1BIEFQSSwgb3RoZXJ3aXNlCndlJ2xsIGJ5cGFzcyBzdWNoIGZlYXR1cmVzIGFz
IHRoZSBkZXZpY2Ugc3BlY2lmaWMgRE1BIHBvb2xzLApETUEgb2Zmc2V0cywgY2FjaGUgZmx1c2hp
bmcsIGV0YywgZXRjLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
