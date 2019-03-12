From: Ming Lei <ming.lei@redhat.com>
Subject: Re: [PATCH 2/6] block: don't merge adjacent bvecs to
 one segment in bio blk_queue_split
Date: Tue, 12 Mar 2019 09:22:21 +0800
Message-ID: <20190312012220.GC28841@ming.t460p>
References: <20190309013737.27741-1-ming.lei@redhat.com>
 <20190309013737.27741-3-ming.lei@redhat.com>
 <20190311142106.GB7850@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=VQh8=RP=redhat.com=ming.lei@srs-us1.protection.inumbo.net>)
 id 1h3W7m-0001vb-3Z
 for xen-devel@lists.xenproject.org; Tue, 12 Mar 2019 01:22:34 +0000
Content-Disposition: inline
In-Reply-To: <20190311142106.GB7850@lst.de>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Juergen Gross <jgross@suse.com>, linux-block@vger.kernel.org, xen-devel@lists.xenproject.org, ris Ostrovsky <boris.ostrovsky@oracle.com>, Omar Sandoval <osandov@fb.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBNYXIgMTEsIDIwMTkgYXQgMDM6MjE6MDZQTSArMDEwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gT24gU2F0LCBNYXIgMDksIDIwMTkgYXQgMDk6Mzc6MzNBTSArMDgwMCwgTWlu
ZyBMZWkgd3JvdGU6Cj4gPiBGb3Igbm9ybWFsIGZpbGVzeXN0ZW0gSU8sIGVhY2ggcGFnZSBpcyBh
ZGRlZCB2aWEgYmxrX2FkZF9wYWdlKCksCj4gPiBpbiB3aGljaCBidmVjKHBhZ2UpIG1lcmdlIGhh
cyBiZWVuIGhhbmRsZWQgYWxyZWFkeSwgYW5kIGJhc2ljYWxseQo+ID4gbm90IHBvc3NpYmxlIHRv
IG1lcmdlIHR3byBhZGphY2VudCBidmVjcyBpbiBvbmUgYmlvLgo+ID4gCj4gPiBTbyBub3QgdHJ5
IHRvIG1lcmdlIHR3byBhZGphY2VudCBidmVjcyBpbiBibGtfcXVldWVfc3BsaXQoKSwgYWxzbyBh
ZGQKPiA+IGNoZWNrIGlmIG9uZSBwYWdlIGlzIG1lcmdlYWJsZSB0byBjdXJyZW50IGJ2ZWMgaW4g
YmlvX2FkZF9wYWdlKCkgZm9yCj4gPiBhdm9pZGluZyB0byBicmVhayBYRU4uCj4gCj4gSXNuJ3Qg
dGhpcyB0d28gZW50aXJlbHkgZGlmZmVyZW50IHRoaW5ncz8gIEJvdGggbG9vayBnb29kIHRvIG1l
LAo+IGJ1dCBJIGRvbid0IHVuZGVyc3RhbmQgd2h5IHRoaXMgaXMgb25lIHBhdGNoIHZzIHR3by4K
CllvdSBhcmUgcmlnaHQsIGl0IHNob3VsZCBoYXZlIGJlZW4gdHdvIHRoaW5ncyBsb2dpY2FsbHku
CgpUaGFua3MsCk1pbmcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
