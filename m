From: Christoph Hellwig <hch@lst.de>
Subject: [PATCH 2/5] xen: remove the xen_biovec_phys_mergeable
 export
Date: Tue, 25 Sep 2018 13:30:06 -0700
Message-ID: <20180925203009.1838-3-hch@lst.de>
References: <20180925203009.1838-1-hch@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180925203009.1838-1-hch@lst.de>
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

QklPVkVDX1BIWVNfTUVSR0VBQkxFIGlzIG9ubHkgY2FsbGVkIGZyb20gY29yZSBibG9jayBjb2Rl
LgoKU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+Ci0tLQogZHJp
dmVycy94ZW4vYmlvbWVyZ2UuYyB8IDEgLQogMSBmaWxlIGNoYW5nZWQsIDEgZGVsZXRpb24oLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL3hlbi9iaW9tZXJnZS5jIGIvZHJpdmVycy94ZW4vYmlvbWVy
Z2UuYwppbmRleCA1NWVkODBjM2ExN2MuLjM5OWM0ZTMwZjcyMyAxMDA2NDQKLS0tIGEvZHJpdmVy
cy94ZW4vYmlvbWVyZ2UuYworKysgYi9kcml2ZXJzL3hlbi9iaW9tZXJnZS5jCkBAIC0yMCw0ICsy
MCwzIEBAIGJvb2wgeGVuX2Jpb3ZlY19waHlzX21lcmdlYWJsZShjb25zdCBzdHJ1Y3QgYmlvX3Zl
YyAqdmVjMSwKIAlyZXR1cm4gZmFsc2U7CiAjZW5kaWYKIH0KLUVYUE9SVF9TWU1CT0woeGVuX2Jp
b3ZlY19waHlzX21lcmdlYWJsZSk7Ci0tIAoyLjE5LjAKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
