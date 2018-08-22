From: Julien Grall <julien.grall@arm.com>
Subject: [PATCH 0/2] tools/libxl: Switch Arm guest type to PVH
Date: Wed, 22 Aug 2018 16:00:43 +0100
Message-ID: <20180822150045.22864-1-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=cicq=lf=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1fsUcw-0002Gk-Dq
 for xen-devel@lists.xenproject.org; Wed, 22 Aug 2018 15:00:54 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: wei.liu2@citrix.com, Julien Grall <julien.grall@arm.com>, sstabellini@kernel.org, ian.jackson@eu.citrix.com, roger.pau@citrix.com
List-Id: xen-devel@lists.xenproject.org

SGkgYWxsLAoKVGhpcyBzbWFsbCBwYXRjaCBzZXJpZXMgYWRkcyBzd2l0Y2ggQXJtIGd1ZXN0IHR5
cGUgdG8gUFZIIGluIGxpYnhsLiBTZWUKcGF0Y2ggIzIgZm9yIHRoZSByYXRpb25hbGUuCgpDaGVl
cnMsCgpKdWxpZW4gR3JhbGwgKDIpOgogIHRvb2xzL2xpYnhsOiBSZW5hbWUgbGlieGxfX2FyY2hf
ZG9tYWluX2J1aWxkX2luZm9fYWNwaV9zZXRkZWZhdWx0CiAgICB0by4uLgogIHRvb2xzL2xpYnhs
OiBTd2l0Y2ggQXJtIGd1ZXN0IHR5cGUgdG8gUFZICgogZG9jcy9tYW4veGwuY2ZnLnBvZC41Lmlu
ICAgfCAgMyArKy0KIHRvb2xzL2xpYnhsL2xpYnhsX2FyY2guaCAgIHwgIDQgKystLQogdG9vbHMv
bGlieGwvbGlieGxfYXJtLmMgICAgfCA0MSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKy0tLQogdG9vbHMvbGlieGwvbGlieGxfY3JlYXRlLmMgfCAgMiArLQogdG9vbHMvbGli
eGwvbGlieGxfeDg2LmMgICAgfCAgNCArKy0tCiB0b29scy94bC94bF9wYXJzZS5jICAgICAgICB8
ICA0ICsrKysKIDYgZmlsZXMgY2hhbmdlZCwgNDkgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMo
LSkKCi0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
