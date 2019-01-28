From: "hch@infradead.org" <hch@infradead.org>
Subject: Re: [RFC] virtio_ring: check dma_mem for xen_domain
Date: Mon, 28 Jan 2019 00:00:29 -0800
Message-ID: <20190128080028.GA18476__8632.1363852889$1548662497$gmane$org@infradead.org>
References: <20190121050056.14325-1-peng.fan@nxp.com>
 <alpine.DEB.2.10.1901221113410.17936@sstabellini-ThinkPad-X260>
 <20190123071232.GA20526@infradead.org>
 <alpine.DEB.2.10.1901230935280.17936@sstabellini-ThinkPad-X260>
 <20190123211405.GA4971@infradead.org>
 <AM0PR04MB4481F3986CFB6D1EF26FA135889B0@AM0PR04MB4481.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=X/KA=QE=bombadil.srs.infradead.org=batv+6bbf09bfe8aea74a20fb+5636+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1go1qO-0006xF-2h
 for xen-devel@lists.xenproject.org; Mon, 28 Jan 2019 08:00:36 +0000
Content-Disposition: inline
In-Reply-To: <AM0PR04MB4481F3986CFB6D1EF26FA135889B0@AM0PR04MB4481.eurprd04.prod.outlook.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Peng Fan <peng.fan@nxp.com>
Cc: "jgross@suse.com" <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Andy Duan <fugang.duan@nxp.com>, "mst@redhat.com" <mst@redhat.com>, "jasowang@redhat.com" <jasowang@redhat.com>, "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "virtualization@lists.linux-foundation.org" <virtualization@lists.linux-foundation.org>, "hch@infradead.org" <hch@infradead.org>, "luto@kernel.org" <luto@kernel.org>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBKYW4gMjUsIDIwMTkgYXQgMDk6NDU6MjZBTSArMDAwMCwgUGVuZyBGYW4gd3JvdGU6
Cj4gSnVzdCBoYXZlIGEgcXVlc3Rpb24sIAo+IAo+IFNpbmNlIHZtYWxsb2NfdG9fcGFnZSBpcyBv
ayBmb3IgY21hIGFyZWEsIG5vIG5lZWQgdG8gdGFrZSBjbWEgYW5kIHBlciBkZXZpY2UKPiBjbWEg
aW50byBjb25zaWRlcmF0aW9uIHJpZ2h0PyAKClRoZSBDTUEgYXJlYSBpdHNlbGYgaXQgYSBwaHlz
aWNhbCBtZW1vcnkgcmVnaW9uLiAgSWYgaXQgaXMgYSBub24taGlnaG1lbQpyZWdpb24geW91IGNh
biBjYWxsIHZpcnRfdG9fcGFnZSBvbiB0aGUgdmlydHVhbCBhZGRyZXNzZXMgZm9yIGl0LiAgSWYK
aXQgaXMgaW4gaGlnaG1lbSBpdCBkb2Vzbid0IGV2ZW4gaGF2ZSBhIGtlcm5lbCB2aXJ0dWFsIGFk
ZHJlc3MgYnkKZGVmYXVsdC4KCj4gd2Ugb25seSBuZWVkIHRvIGltcGxlbWVudCBhIHBpZWNlIGNv
ZGUgdG8gaGFuZGxlIHBlciBkZXZpY2Ugc3BlY2lmaWMgcmVnaW9uCj4gdXNpbmcgUkVTRVJWRURN
RU1fT0ZfREVDTEFSRSwganVzdCBsaWtlOgo+IFJFU0VSVkVETUVNX09GX0RFQ0xBUkUocnBtc2ct
ZG1hLCAicnBtc2ctZG1hLXBvb2wiLCAKPiBybWVtX3JwbXNnX2RtYV9zZXR1cCk7Cj4gQW5kIGlt
cGxlbWVudCB0aGUgZGV2aWNlX2luaXQgY2FsbCBiYWNrIGFuZCBidWlsZCBhIG1hcCBiZXR3ZWVu
IHBhZ2UgYW5kIHBoeXMuCj4gVGhlbiBpbiBycG1zZyBkcml2ZXIsIHNjYXR0ZXIgbGlzdCBjb3Vs
ZCB1c2UgcGFnZSBzdHJ1Y3R1cmUsIG5vIG5lZWQgdm1hbGxvY190b19wYWdlCj4gZm9yIHBlciBk
ZXZpY2UgZG1hLgo+IAo+IElzIHRoaXMgdGhlIHJpZ2h0IHdheT8KCkkgdGhpbmsgdGhpcyBzaG91
bGQgd29yayBmaW5lLiAgSWYgeW91IGhhdmUgdGhlIGN5Y2xlcyBmb3IgaXQgSSdkCmFjdHVhbGx5
IGxvdmUgdG8gYmUgYWJsZSB0byBoYXZlIGdlbmVyaWMgQ01BIERUIGdsdWUgZm9yIG5vbiBETUEg
QVBJCmRyaXZlciBhbGxvY2F0aW9ucywgYXMgdGhlcmUgb2J2aW91c2x5IGlzIGEgbmVlZCBmb3Ig
aXQuICBTbyBiYXNpY2FsbHkKdGhlIHNhbWUgYXMgYWJvdmUsIGp1c3QgYWRkZWQgdG8ga2VybmVs
L2NtYS5jIGFzIGEgZ2VuZXJpYyBBUEkuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
