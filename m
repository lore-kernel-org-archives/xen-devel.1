From: Christoph Hellwig <hch@lst.de>
Subject: [PATCH 01/13] arm: remove the unused BIOVEC_MERGEABLE
 define
Date: Tue,  4 Sep 2018 12:14:19 -0700
Message-ID: <20180904191431.20102-2-hch@lst.de>
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

U2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+Ci0tLQogYXJjaC9h
cm0vaW5jbHVkZS9hc20vaW8uaCB8IDcgLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDcgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vaW5jbHVkZS9hc20vaW8uaCBiL2FyY2gvYXJt
L2luY2x1ZGUvYXNtL2lvLmgKaW5kZXggMmNmYmM1MzFmNjNiLi42Nzc0NTUzZGMyMTQgMTAwNjQ0
Ci0tLSBhL2FyY2gvYXJtL2luY2x1ZGUvYXNtL2lvLmgKKysrIGIvYXJjaC9hcm0vaW5jbHVkZS9h
c20vaW8uaApAQCAtNDU5LDEzICs0NTksNiBAQCBleHRlcm4gdm9pZCBwY2lfaW91bm1hcChzdHJ1
Y3QgcGNpX2RldiAqZGV2LCB2b2lkIF9faW9tZW0gKmFkZHIpOwogCiAjaW5jbHVkZSA8YXNtLWdl
bmVyaWMvaW8uaD4KIAotLyoKLSAqIGNhbiB0aGUgaGFyZHdhcmUgbWFwIHRoaXMgaW50byBvbmUg
c2VnbWVudCBvciBub3QsIGdpdmVuIG5vIG90aGVyCi0gKiBjb25zdHJhaW50cy4KLSAqLwotI2Rl
ZmluZSBCSU9WRUNfTUVSR0VBQkxFKHZlYzEsIHZlYzIpCVwKLQkoKGJ2ZWNfdG9fcGh5cygodmVj
MSkpICsgKHZlYzEpLT5idl9sZW4pID09IGJ2ZWNfdG9fcGh5cygodmVjMikpKQotCiBzdHJ1Y3Qg
YmlvX3ZlYzsKIGV4dGVybiBib29sIHhlbl9iaW92ZWNfcGh5c19tZXJnZWFibGUoY29uc3Qgc3Ry
dWN0IGJpb192ZWMgKnZlYzEsCiAJCQkJICAgICAgY29uc3Qgc3RydWN0IGJpb192ZWMgKnZlYzIp
OwotLSAKMi4xOC4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
