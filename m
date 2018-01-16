From: Julien Grall <julien.grall@linaro.org>
Subject: [PATCH 3/5] xen/arm: cpuerrata: Add MIDR_ALL_VERSIONS
Date: Tue, 16 Jan 2018 14:23:35 +0000
Message-ID: <20180116142337.24942-4-julien.grall@linaro.org>
References: <20180116142337.24942-1-julien.grall@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180116142337.24942-1-julien.grall@linaro.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xen.org
Cc: sstabellini@kernel.org, Julien Grall <julien.grall@linaro.org>, andre.przywara@linaro.org
List-Id: xen-devel@lists.xenproject.org

SW50cm9kdWNlIGEgbmV3IG1hY3JvIE1JRFJfQUxMX1ZFUlNJT05TIHRvIG1hdGNoIGFsbCB2YXJp
YW50L3JldmlzaW9uIG9mIGEKZ2l2ZW4gQ1BVIG1vZGVsLgoKVGhpcyBpcyBwYXJ0IG9mIFhTQS0y
NTQuCgpTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBsaW5hcm8ub3Jn
PgotLS0KIHhlbi9hcmNoL2FybS9jcHVlcnJhdGEuYyB8IDYgKysrKysrCiAxIGZpbGUgY2hhbmdl
ZCwgNiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2NwdWVycmF0YS5j
IGIveGVuL2FyY2gvYXJtL2NwdWVycmF0YS5jCmluZGV4IDc3MjU4N2MwNWEuLmM1MGQzMzMxZjIg
MTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL2FybS9jcHVlcnJhdGEuYworKysgYi94ZW4vYXJjaC9hcm0v
Y3B1ZXJyYXRhLmMKQEAgLTcsNiArNywxMiBAQAogICAgIC5taWRyX3JhbmdlX21pbiA9IG1pbiwg
ICAgICAgICAgICAgIFwKICAgICAubWlkcl9yYW5nZV9tYXggPSBtYXgKIAorI2RlZmluZSBNSURS
X0FMTF9WRVJTSU9OUyhtb2RlbCkgICAgICAgIFwKKyAgICAubWF0Y2hlcyA9IGlzX2FmZmVjdGVk
X21pZHJfcmFuZ2UsICBcCisgICAgLm1pZHJfbW9kZWwgPSBtb2RlbCwgICAgICAgICAgICAgICAg
XAorICAgIC5taWRyX3JhbmdlX21pbiA9IDAsICAgICAgICAgICAgICAgIFwKKyAgICAubWlkcl9y
YW5nZV9tYXggPSAoTUlEUl9WQVJJQU5UX01BU0sgfCBNSURSX1JFVklTSU9OX01BU0spCisKIHN0
YXRpYyBib29sIF9fbWF5YmVfdW51c2VkCiBpc19hZmZlY3RlZF9taWRyX3JhbmdlKGNvbnN0IHN0
cnVjdCBhcm1fY3B1X2NhcGFiaWxpdGllcyAqZW50cnkpCiB7Ci0tIAoyLjExLjAKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
