From: Christoph Hellwig <hch@lst.de>
Subject: [PATCH 11/13] block: don't include io.h from bio.h
Date: Tue,  4 Sep 2018 12:14:29 -0700
Message-ID: <20180904191431.20102-12-hch@lst.de>
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

Tm93IHRoYXQgd2UgZG9uJ3QgbmVlZCBhbiBvdmVycmlkZSBmb3IgQklPVkVDX1BIWVNfTUVSR0VB
QkxFIHRoZXJlIGlzCm5vIG5lZWQgdG8gZHJhZyB0aGlzIGhlYWRlciBpbi4KClNpZ25lZC1vZmYt
Ynk6IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPgotLS0KIGluY2x1ZGUvbGludXgvYmlv
LmggfCAzIC0tLQogMSBmaWxlIGNoYW5nZWQsIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
aW5jbHVkZS9saW51eC9iaW8uaCBiL2luY2x1ZGUvbGludXgvYmlvLmgKaW5kZXggZmNiNWY1NjE4
ZWQ0Li4zYWYyZmVhNjg2YTkgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvbGludXgvYmlvLmgKKysrIGIv
aW5jbHVkZS9saW51eC9iaW8uaApAQCAtMjQsOSArMjQsNiBAQAogI2luY2x1ZGUgPGxpbnV4L2J1
Zy5oPgogCiAjaWZkZWYgQ09ORklHX0JMT0NLCi0KLSNpbmNsdWRlIDxhc20vaW8uaD4KLQogLyog
c3RydWN0IGJpbywgYmlvX3ZlYyBhbmQgQklPXyogZmxhZ3MgYXJlIGRlZmluZWQgaW4gYmxrX3R5
cGVzLmggKi8KICNpbmNsdWRlIDxsaW51eC9ibGtfdHlwZXMuaD4KIAotLSAKMi4xOC4wCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
