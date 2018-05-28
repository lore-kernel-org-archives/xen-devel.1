From: Manish Jaggi <mjaggi@caviumnetworks.com>
Subject: [PATCH v3 17/17] arm64: if trapping a
 read-from-write-only GICv3 access inject undef exception in guest
Date: Mon, 28 May 2018 08:51:21 +0530
Message-ID: <2ef44b8f89d886f3a60889acb370fdfd246523e0.1527247385.git.mjaggi@caviumnetworks.com>
References: <cover.1527247385.git.mjaggi@caviumnetworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=grxy=ip=cavium.com=manish.jaggi@srs-us1.protection.inumbo.net>)
 id 1fN8kf-0005KT-6V
 for xen-devel@lists.xenproject.org; Mon, 28 May 2018 03:23:17 +0000
In-Reply-To: <cover.1527247385.git.mjaggi@caviumnetworks.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org, julien.grall@arm.com, sstabellini@kernel.org, marc.zyngier@arm.com, andre.przywara@arm.com
Cc: Manish Jaggi <mjaggi@caviumnetworks.com>, manish.jaggi@cavium.com
List-Id: xen-devel@lists.xenproject.org

VGhpcyBwYXRjaCBpcyBwb3J0ZWQgdG8geGVuIGZyb20gbGludXggY29tbWl0OgplN2YxZDFlZWY0
ODIxNTBhNjRhNmU2YWQ4ZmFmNDBmOGY5N2VlZDY3CktWTTogYXJtNjQ6IExvZyBhbiBlcnJvciBp
ZiB0cmFwcGluZyBhIHJlYWQtZnJvbS13cml0ZS1vbmx5IEdJQ3YzIGFjY2VzcwoKQSByZWFkLWZy
b20td3JpdGUtb25seSBHSUN2MyBhY2Nlc3Mgc2hvdWxkIFVOREVGIGF0IEVMMS4gQnV0IHNpbmNl
CndlJ3JlIGluIGNvbXBsZXRlIHBhcmFub2lhLWxhbmQgd2l0aCBicm9rZW4gQ1BVcywgbGV0J3Mg
YXNzdW1lIHRoZQp3b3JzZSBhbmQgZ3JhY2VmdWxseSBoYW5kbGUgdGhlIGNhc2UuCgpTaWduZWQt
b2ZmLWJ5OiBNYW5pc2ggSmFnZ2kgPG1hbmlzaC5qYWdnaUBjYXZpdW0uY29tPgoKZGlmZiAtLWdp
dCBhL3hlbi9hcmNoL2FybS9hcm02NC92Z2ljLXYzLXNyLmMgYi94ZW4vYXJjaC9hcm0vYXJtNjQv
dmdpYy12My1zci5jCmluZGV4IGFjMzllYjVlMWQuLjFiMzZiMTA0YmMgMTAwNjQ0Ci0tLSBhL3hl
bi9hcmNoL2FybS9hcm02NC92Z2ljLXYzLXNyLmMKKysrIGIveGVuL2FyY2gvYXJtL2FybTY0L3Zn
aWMtdjMtc3IuYwpAQCAtNzkyLDYgKzc5MiwxMSBAQCBib29sIHZnaWNfdjNfaGFuZGxlX2NwdWlm
X2FjY2VzcyhzdHJ1Y3QgY3B1X3VzZXJfcmVncyAqcmVncykKIAogICAgIGNhc2UgSFNSX1NZU1JF
R19JQ0NfRU9JUjBfRUwxOgogICAgIGNhc2UgSFNSX1NZU1JFR19JQ0NfRU9JUjFfRUwxOgorICAg
ICAgICBpZiAoIHVubGlrZWx5KGlzX3JlYWQpICkKKyAgICAgICAgeworICAgICAgICAgICAgcmV0
ID0gZmFsc2U7CisgICAgICAgICAgICBnb3RvIGVuZDsKKyAgICAgICAgfQogICAgICAgICBmbiA9
IHZnaWNfdjNfd3JpdGVfZW9pcjsKICAgICAgICAgYnJlYWs7CiAKLS0gCjIuMTQuMQoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
