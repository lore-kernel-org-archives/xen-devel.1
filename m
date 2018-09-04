From: Christoph Hellwig <hch@lst.de>
Subject: [PATCH 08/13] block: add a missing BIOVEC_SEG_BOUNDARY
 check in bio_add_pc_page
Date: Tue,  4 Sep 2018 12:14:26 -0700
Message-ID: <20180904191431.20102-9-hch@lst.de>
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

VGhlIGFjdHVhbCByZWNhY3VsYXRpb24gb2Ygc2VnbWVudHMgaW4gX19ibGtfcmVjYWxjX3JxX3Nl
Z21lbnRzIHdpbGwKZG8gdGhpcyBjaGVjaywgc28gdGhlcmUgaXMgbm8gcG9pbnQgaW4gZm9yY2lu
ZyBpdCBpZiB3ZSBrbm93IGl0IHdvbid0CnN1Y2NlZWQuCgpTaWduZWQtb2ZmLWJ5OiBDaHJpc3Rv
cGggSGVsbHdpZyA8aGNoQGxzdC5kZT4KLS0tCiBibG9jay9iaW8uYyB8IDQgKysrLQogMSBmaWxl
IGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2Js
b2NrL2Jpby5jIGIvYmxvY2svYmlvLmMKaW5kZXggN2Y3MjMwMTQwYjY2Li5kMTVhMjI4ZDFiZmMg
MTAwNjQ0Ci0tLSBhL2Jsb2NrL2Jpby5jCisrKyBiL2Jsb2NrL2Jpby5jCkBAIC03MjksNyArNzI5
LDkgQEAgaW50IGJpb19hZGRfcGNfcGFnZShzdHJ1Y3QgcmVxdWVzdF9xdWV1ZSAqcSwgc3RydWN0
IGJpbyAqYmlvLCBzdHJ1Y3QgcGFnZQogCX0KIAogCS8qIElmIHdlIG1heSBiZSBhYmxlIHRvIG1l
cmdlIHRoZXNlIGJpb3ZlY3MsIGZvcmNlIGEgcmVjb3VudCAqLwotCWlmIChiaW8tPmJpX3ZjbnQg
PiAxICYmIGJpb3ZlY19waHlzX21lcmdlYWJsZShidmVjLTEsIGJ2ZWMpKQorCWlmIChiaW8tPmJp
X3ZjbnQgPiAxICYmCisJICAgIGJpb3ZlY19waHlzX21lcmdlYWJsZShidmVjIC0gMSwgYnZlYykg
JiYKKwkgICAgQklPVkVDX1NFR19CT1VOREFSWShxLCBidmVjIC0gMSwgYnZlYykpCiAJCWJpb19j
bGVhcl9mbGFnKGJpbywgQklPX1NFR19WQUxJRCk7CiAKICBkb25lOgotLSAKMi4xOC4wCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
