From: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 1/6] block: pass page to
 xen_biovec_phys_mergeable
Date: Mon, 11 Mar 2019 15:16:08 +0100
Message-ID: <20190311141608.GA7850@lst.de>
References: <20190309013737.27741-1-ming.lei@redhat.com>
 <20190309013737.27741-2-ming.lei@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=tHd4=RO=lst.de=hch@srs-us1.protection.inumbo.net>)
 id 1h3Lj1-00042m-P1
 for xen-devel@lists.xenproject.org; Mon, 11 Mar 2019 14:16:19 +0000
Content-Disposition: inline
In-Reply-To: <20190309013737.27741-2-ming.lei@redhat.com>
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

T24gU2F0LCBNYXIgMDksIDIwMTkgYXQgMDk6Mzc6MzJBTSArMDgwMCwgTWluZyBMZWkgd3JvdGU6
Cj4geGVuX2Jpb3ZlY19waHlzX21lcmdlYWJsZSgpIG9ubHkgbmVlZHMgLmJ2X3BhZ2Ugb2YgdGhl
IDJuZCBiaW8gYnZlYwo+IGZvciBjaGVja2luZyBpZiB0aGUgdHdvIGJ2ZWNzIGNhbiBiZSBtZXJn
ZWQsIHNvIHBhc3MgcGFnZSB0bwo+IHhlbl9iaW92ZWNfcGh5c19tZXJnZWFibGUoKSBkaXJlY3Rs
eS4KCkxvb2tzIGZpbmU6CgpSZXZpZXdlZC1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3Qu
ZGU+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
