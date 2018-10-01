From: Julien Grall <julien.grall@arm.com>
Subject: [PATCH v3 0/3] tools/libxl: Switch Arm guest type to PVH
Date: Mon,  1 Oct 2018 19:57:16 +0100
Message-ID: <20181001185721.15467-1-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=7rit=mn=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1g73Np-0001Ex-Hw
 for xen-devel@lists.xenproject.org; Mon, 01 Oct 2018 18:57:29 +0000
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
cnMsCgpKdWxpZW4gR3JhbGwgKDMpOgogIHRvb2xzL2xpYnhsOiBSZW5hbWUgbGlieGxfX2FyY2hf
ZG9tYWluX2J1aWxkX2luZm9fYWNwaV9zZXRkZWZhdWx0CiAgICB0by4uLgogIHRvb2xzL2xpYnhs
OiBEZXByZWNhdGUgUFYgZmllbGRzIGtlcm5lbCwgcmFtZGlzaywgY21kbGluZQogIHRvb2xzL2xp
YnhsOiBTd2l0Y2ggQXJtIGd1ZXN0IHR5cGUgdG8gUFZICgogZG9jcy9tYW4veGwuY2ZnLnBvZC41
LmluICAgIHwgIDUgKysrLS0KIHRvb2xzL2xpYnhsL2xpYnhsX2FyY2guaCAgICB8ICA0ICsrLS0K
IHRvb2xzL2xpYnhsL2xpYnhsX2FybS5jICAgICB8IDI4ICsrKysrKysrKysrKysrKysrKysrKysr
KystLS0KIHRvb2xzL2xpYnhsL2xpYnhsX2NyZWF0ZS5jICB8IDIxICstLS0tLS0tLS0tLS0tLS0t
LS0tLQogdG9vbHMvbGlieGwvbGlieGxfdHlwZXMuaWRsIHwgIDYgKysrLS0tCiB0b29scy9saWJ4
bC9saWJ4bF94ODYuYyAgICAgfCAgNCArKy0tCiB0b29scy94bC94bF9wYXJzZS5jICAgICAgICAg
fCAgNCArKysrCiA3IGZpbGVzIGNoYW5nZWQsIDQwIGluc2VydGlvbnMoKyksIDMyIGRlbGV0aW9u
cygtKQoKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
