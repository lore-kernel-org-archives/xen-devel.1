From: Christoph Hellwig <hch@lst.de>
Subject: clean up physical merging helpers
Date: Tue, 25 Sep 2018 13:30:04 -0700
Message-ID: <20180925203009.1838-1-hch@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jens Axboe <axboe@kernel.dk>
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, xen-devel@lists.xen.org, linux-block@vger.kernel.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Ming Lei <ming.lei@redhat.com>, linux-arm-kernel@lists.infradead.org
List-Id: xen-devel@lists.xenproject.org

SGkgSmVucywKCnRoaXMgc2VyaWVzIG1vdmVzIFhlbiBzcGVjaWFsIGhhbmRsaW5nIG9mIGJsb2Nr
IG1lcmdlcyBmcm9tIGFyY2ggaG9va3MKaW50byBjb21tb24gY29kZS4gIEEgcHJldmlvdXMgdmVy
c2lvbiBoYXMgYmVlbiByZXZpZXdlZCBieSBCb3Jpcy4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
