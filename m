From: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 2/6] block: don't merge adjacent bvecs to
 one segment in bio blk_queue_split
Date: Mon, 11 Mar 2019 15:21:06 +0100
Message-ID: <20190311142106.GB7850@lst.de>
References: <20190309013737.27741-1-ming.lei@redhat.com>
 <20190309013737.27741-3-ming.lei@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=tHd4=RO=lst.de=hch@srs-us1.protection.inumbo.net>)
 id 1h3Lnn-0004mK-3T
 for xen-devel@lists.xenproject.org; Mon, 11 Mar 2019 14:21:15 +0000
Content-Disposition: inline
In-Reply-To: <20190309013737.27741-3-ming.lei@redhat.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ming Lei <ming.lei@redhat.com>
Cc: Jens Axboe <axboe@kernel.dk>, Juergen Gross <jgross@suse.com>, Christoph Hellwig <hch@lst.de>, linux-block@vger.kernel.org, xen-devel@lists.xenproject.org, ris Ostrovsky <boris.ostrovsky@oracle.com>, Omar Sandoval <osandov@fb.com>
List-Id: xen-devel@lists.xenproject.org

T24gU2F0LCBNYXIgMDksIDIwMTkgYXQgMDk6Mzc6MzNBTSArMDgwMCwgTWluZyBMZWkgd3JvdGU6
Cj4gRm9yIG5vcm1hbCBmaWxlc3lzdGVtIElPLCBlYWNoIHBhZ2UgaXMgYWRkZWQgdmlhIGJsa19h
ZGRfcGFnZSgpLAo+IGluIHdoaWNoIGJ2ZWMocGFnZSkgbWVyZ2UgaGFzIGJlZW4gaGFuZGxlZCBh
bHJlYWR5LCBhbmQgYmFzaWNhbGx5Cj4gbm90IHBvc3NpYmxlIHRvIG1lcmdlIHR3byBhZGphY2Vu
dCBidmVjcyBpbiBvbmUgYmlvLgo+IAo+IFNvIG5vdCB0cnkgdG8gbWVyZ2UgdHdvIGFkamFjZW50
IGJ2ZWNzIGluIGJsa19xdWV1ZV9zcGxpdCgpLCBhbHNvIGFkZAo+IGNoZWNrIGlmIG9uZSBwYWdl
IGlzIG1lcmdlYWJsZSB0byBjdXJyZW50IGJ2ZWMgaW4gYmlvX2FkZF9wYWdlKCkgZm9yCj4gYXZv
aWRpbmcgdG8gYnJlYWsgWEVOLgoKSXNuJ3QgdGhpcyB0d28gZW50aXJlbHkgZGlmZmVyZW50IHRo
aW5ncz8gIEJvdGggbG9vayBnb29kIHRvIG1lLApidXQgSSBkb24ndCB1bmRlcnN0YW5kIHdoeSB0
aGlzIGlzIG9uZSBwYXRjaCB2cyB0d28uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
