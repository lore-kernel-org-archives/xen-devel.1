From: Julien Grall <julien.grall@arm.com>
Subject: [PATCH for-4.12 v2 2/7] xen/arm: p2m: Provide an helper
 to generate the VTTBR
Date: Mon, 28 Jan 2019 11:50:21 +0000
Message-ID: <20190128115026.3336-3-julien.grall@arm.com>
References: <20190128115026.3336-1-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=CKwR=QE=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1go5Qx-00034b-Rb
 for xen-devel@lists.xenproject.org; Mon, 28 Jan 2019 11:50:35 +0000
In-Reply-To: <20190128115026.3336-1-julien.grall@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Julien Grall <julien.grall@arm.com>, sstabellini@kernel.org, Andrii Anisov <andrii_anisov@epam.com>
List-Id: xen-devel@lists.xenproject.org

QSBmb2xsb3ctdXAgcGF0Y2ggd2lsbCBuZWVkIHRvIGdlbmVyYXRlIHRoZSBWVFRCUiBpbiBhIGZl
dyBwbGFjZXMuCgpTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0u
Y29tPgpSZXZpZXdlZC1ieTogQW5kcmlpIEFuaXNvdiA8YW5kcmlpX2FuaXNvdkBlcGFtLmNvbT4K
UmV2aWV3ZWQtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4K
Ci0tLQogICAgQ2hhbmdlcyBpbiB2MjoKICAgICAgICAtIEFkZCBBbmRyaWkncyBhbmQgU3RlZmFu
bydzIHJldmlld2VkLWJ5Ci0tLQogeGVuL2FyY2gvYXJtL3AybS5jIHwgNyArKysrKystCiAxIGZp
bGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEv
eGVuL2FyY2gvYXJtL3AybS5jIGIveGVuL2FyY2gvYXJtL3AybS5jCmluZGV4IDA1OWEzOTE1N2Eu
LjM4YmZhOTk2NGYgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL2FybS9wMm0uYworKysgYi94ZW4vYXJj
aC9hcm0vcDJtLmMKQEAgLTQxLDYgKzQxLDExIEBAIHN0YXRpYyBjb25zdCBwYWRkcl90IGxldmVs
X21hc2tzW10gPQogc3RhdGljIGNvbnN0IHVpbnQ4X3QgbGV2ZWxfb3JkZXJzW10gPQogICAgIHsg
WkVST0VUSF9PUkRFUiwgRklSU1RfT1JERVIsIFNFQ09ORF9PUkRFUiwgVEhJUkRfT1JERVIgfTsK
IAorc3RhdGljIHVpbnQ2NF90IGdlbmVyYXRlX3Z0dGJyKHVpbnQxNl90IHZtaWQsIG1mbl90IHJv
b3RfbWZuKQoreworICAgIHJldHVybiAobWZuX3RvX21hZGRyKHJvb3RfbWZuKSB8ICgodWludDY0
X3Qpdm1pZCA8PCA0OCkpOworfQorCiAvKiBVbmxvY2sgdGhlIGZsdXNoIGFuZCBkbyBhIFAyTSBU
TEIgZmx1c2ggaWYgbmVjZXNzYXJ5ICovCiB2b2lkIHAybV93cml0ZV91bmxvY2soc3RydWN0IHAy
bV9kb21haW4gKnAybSkKIHsKQEAgLTEzNjQsNyArMTM2OSw3IEBAIHN0YXRpYyBpbnQgcDJtX2Fs
bG9jX3RhYmxlKHN0cnVjdCBkb21haW4gKmQpCiAKICAgICBwMm0tPnJvb3QgPSBwYWdlOwogCi0g
ICAgcDJtLT52dHRiciA9IHBhZ2VfdG9fbWFkZHIocDJtLT5yb290KSB8ICgodWludDY0X3QpcDJt
LT52bWlkIDw8IDQ4KTsKKyAgICBwMm0tPnZ0dGJyID0gZ2VuZXJhdGVfdnR0YnIocDJtLT52bWlk
LCBwYWdlX3RvX21mbihwMm0tPnJvb3QpKTsKIAogICAgIC8qCiAgICAgICogTWFrZSBzdXJlIHRo
YXQgYWxsIFRMQnMgY29ycmVzcG9uZGluZyB0byB0aGUgbmV3IFZNSUQgYXJlIGZsdXNoZWQKLS0g
CjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
