From: Christoph Hellwig <hch@lst.de>
Subject: [PATCH 12/13] block: don't include bug.h from bio.h
Date: Tue,  4 Sep 2018 12:14:30 -0700
Message-ID: <20180904191431.20102-13-hch@lst.de>
References: <20180904191431.20102-1-hch@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180904191431.20102-1-hch@lst.de>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jens Axboe <axboe@kernel.dk>
Cc: linux-block@vger.kernel.org, xen-devel@lists.xen.org, linux-arm-kernel@lists.infradead.org, Ming Lei <ming.lei@redhat.com>
List-Id: xen-devel@lists.xenproject.org

Tm8gbmVlZCB0byBwdWxsIGluIHRoZSBCVUcoKSBkZWZpbnRpb24uCgpTaWduZWQtb2ZmLWJ5OiBD
aHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4KLS0tCiBpbmNsdWRlL2xpbnV4L2Jpby5oIHwg
MSAtCiAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2luY2x1ZGUv
bGludXgvYmlvLmggYi9pbmNsdWRlL2xpbnV4L2Jpby5oCmluZGV4IDNhZjJmZWE2ODZhOS4uODVm
MmU1NmVjZGI4IDEwMDY0NAotLS0gYS9pbmNsdWRlL2xpbnV4L2Jpby5oCisrKyBiL2luY2x1ZGUv
bGludXgvYmlvLmgKQEAgLTIxLDcgKzIxLDYgQEAKICNpbmNsdWRlIDxsaW51eC9oaWdobWVtLmg+
CiAjaW5jbHVkZSA8bGludXgvbWVtcG9vbC5oPgogI2luY2x1ZGUgPGxpbnV4L2lvcHJpby5oPgot
I2luY2x1ZGUgPGxpbnV4L2J1Zy5oPgogCiAjaWZkZWYgQ09ORklHX0JMT0NLCiAvKiBzdHJ1Y3Qg
YmlvLCBiaW9fdmVjIGFuZCBCSU9fKiBmbGFncyBhcmUgZGVmaW5lZCBpbiBibGtfdHlwZXMuaCAq
LwotLSAKMi4xOC4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
