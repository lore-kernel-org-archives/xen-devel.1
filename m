From: "hch@infradead.org" <hch@infradead.org>
Subject: Re: [RFC] virtio_ring: check dma_mem for xen_domain
Date: Tue, 22 Jan 2019 23:12:32 -0800
Message-ID: <20190123071232.GA20526__45451.5500737884$1548227634$gmane$org@infradead.org>
References: <20190121050056.14325-1-peng.fan@nxp.com>
 <alpine.DEB.2.10.1901221113410.17936@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=CYfd=P7=bombadil.srs.infradead.org=batv+a9ed82934d27690332c0+5631+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1gmCiD-0002FS-Gk
 for xen-devel@lists.xenproject.org; Wed, 23 Jan 2019 07:12:37 +0000
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.10.1901221113410.17936@sstabellini-ThinkPad-X260>
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

T24gVHVlLCBKYW4gMjIsIDIwMTkgYXQgMTE6NTk6MzFBTSAtMDgwMCwgU3RlZmFubyBTdGFiZWxs
aW5pIHdyb3RlOgo+ID4gIAlpZiAoIXZpcnRpb19oYXNfaW9tbXVfcXVpcmsodmRldikpCj4gPiAg
CQlyZXR1cm4gdHJ1ZTsKPiA+ICAKPiA+IEBAIC0yNjAsNyArMjYyLDcgQEAgc3RhdGljIGJvb2wg
dnJpbmdfdXNlX2RtYV9hcGkoc3RydWN0IHZpcnRpb19kZXZpY2UgKnZkZXYpCj4gPiAgCSAqIHRo
ZSBETUEgQVBJIGlmIHdlJ3JlIGEgWGVuIGd1ZXN0LCB3aGljaCBhdCBsZWFzdCBhbGxvd3MKPiA+
ICAJICogYWxsIG9mIHRoZSBzZW5zaWJsZSBYZW4gY29uZmlndXJhdGlvbnMgdG8gd29yayBjb3Jy
ZWN0bHkuCj4gPiAgCSAqLwo+ID4gLQlpZiAoeGVuX2RvbWFpbigpKQo+ID4gKwlpZiAoeGVuX2Rv
bWFpbigpICYmICFkbWFfZGV2LT5kbWFfbWVtKQo+ID4gIAkJcmV0dXJuIHRydWU7Cj4gPiAgCj4g
PiAgCXJldHVybiBmYWxzZTsKPiAKPiBJIGNhbiBzZWUgeW91IHNwb3R0ZWQgYSByZWFsIGlzc3Vl
LCBidXQgdGhpcyBpcyBub3QgdGhlIHJpZ2h0IGZpeC4gV2UKPiBqdXN0IG5lZWQgc29tZXRoaW5n
IGEgYml0IG1vcmUgZmxleGlibGUgdGhhbiB4ZW5fZG9tYWluKCk6IHRoZXJlIGFyZQo+IG1hbnkg
a2luZHMgb2YgWGVuIGRvbWFpbnMgb24gZGlmZmVyZW50IGFyY2hpdGVjdHVyZXMsIHdlIGJhc2lj
YWxseSB3YW50Cj4gdG8gZW5hYmxlIHRoaXMgKHJldHVybiB0cnVlIGZyb20gdnJpbmdfdXNlX2Rt
YV9hcGkpIG9ubHkgd2hlbiB0aGUgeGVuCj4gc3dpb3RsYiBpcyBtZWFudCB0byBiZSB1c2VkLiBE
b2VzIHRoZSBhcHBlbmRlZCBwYXRjaCBmaXggdGhlIGlzc3VlIHlvdQo+IGhhdmU/CgpUaGUgcHJv
YmxlbSBnZW5lcmFsbHkgaXMgdGhlIG90aGVyIHdheSBhcm91bmQgLSBpZiBkbWFfZGV2LT5kbWFf
bWVtCmlzIHNldCB0aGUgZGV2aWNlIGRlY3JpcHRpb24gaW4gdGhlIGRldmljZSB0cmVlIGV4cGxp
Y2l0bHkgcmVxdWlyZXMKdXNpbmcgdGhpcyBtZW1vcnksIHNvIHdlIG11c3QgX2Fsd2F5c18gdXNl
IHRoZSBETUEgQVBJLgoKVGhlIHByb2JsZW0gaXMganVzdCB0aGF0IHRoYXQgcnByb2MgZHJpdmVy
IGFic3VzZXMgdGhlIERNQSBBUEkKaW4gaG9ycmlibGUgd2F5cy4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
