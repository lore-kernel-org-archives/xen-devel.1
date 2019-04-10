From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 13/62] Extend workaround
 `clk_ignore_unused' to stretch
Date: Wed, 10 Apr 2019 15:23:19 +0100
Message-ID: <20190410142408.22848-14-ian.jackson@eu.citrix.com>
References: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xn7x=SM=citrix.com=prvs=996f5bc6d=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hEEAC-0006D0-Rx
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 14:25:20 +0000
In-Reply-To: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Julien Grall <julien.grall@linaro.org>
List-Id: xen-devel@lists.xenproject.org

RnJvbTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KClRoaXMgaXMgaHR0cHM6Ly9idWdz
LnhlbnByb2plY3Qub3JnL3hlbi9idWcvNDUKCldpdGhvdXQgdGhhdCBwYXJhbWV0ZXIgd2UgbG9z
ZSB1YXJ0IG91dHB1dC4KClNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5j
b20+CkNDOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+CkNDOiBK
dWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBsaW5hcm8ub3JnPgotLS0KIE9zc3Rlc3QvRGViaWFu
LnBtIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
CgpkaWZmIC0tZ2l0IGEvT3NzdGVzdC9EZWJpYW4ucG0gYi9Pc3N0ZXN0L0RlYmlhbi5wbQppbmRl
eCA4MmI1ZmI0MC4uOTFiZmZkZmYgMTAwNjQ0Ci0tLSBhL09zc3Rlc3QvRGViaWFuLnBtCisrKyBi
L09zc3Rlc3QvRGViaWFuLnBtCkBAIC0yNDEsNyArMjQxLDcgQEAgRU5ECiAJcHVzaCBAeGVua29w
dCwgJHhlbmtvcHQ7CiAJIyBodHRwOi8vYnVncy54ZW5wcm9qZWN0Lm9yZy94ZW4vYnVnLzQ1CiAJ
cHVzaCBAeGVua29wdCwgImNsa19pZ25vcmVfdW51c2VkIgotCSAgICBpZiAkaG8tPntTdWl0ZX0g
PX4gbS93aGVlenl8amVzc2llLzsKKwkgICAgaWYgJGhvLT57U3VpdGV9ID1+IG0vd2hlZXp5fGpl
c3NpZXxzdHJldGNoLzsKIAogCSR4ZW5rb3B0ID0gam9pbiAnICcsIEB4ZW5rb3B0OwogCWxvZ20o
IkRvbTAgTGludXggb3B0aW9uczogJHhlbmtvcHQiKTsKLS0gCjIuMTEuMAoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
