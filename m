From: Julien Grall <julien.grall@arm.com>
Subject: [PATCH 02/15] xen/arm: cpregs: Fix typo in the
 documentation of TTBCR
Date: Mon, 16 Jul 2018 18:26:59 +0100
Message-ID: <20180716172712.20294-3-julien.grall@arm.com>
References: <20180716172712.20294-1-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=j3cc=ka=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1ff7HO-0006Qg-DD
 for xen-devel@lists.xenproject.org; Mon, 16 Jul 2018 17:27:22 +0000
In-Reply-To: <20180716172712.20294-1-julien.grall@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Julien Grall <julien.grall@arm.com>, sstabellini@kernel.org, Julien Grall <julien.grall@linaro.org>
List-Id: xen-devel@lists.xenproject.org

U2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAbGluYXJvLm9yZz4KLS0t
CiB4ZW4vaW5jbHVkZS9hc20tYXJtL2NwcmVncy5oIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNt
LWFybS9jcHJlZ3MuaCBiL3hlbi9pbmNsdWRlL2FzbS1hcm0vY3ByZWdzLmgKaW5kZXggNGM3NGU4
MTYxYi4uMDdlNTc5MTk4MyAxMDA2NDQKLS0tIGEveGVuL2luY2x1ZGUvYXNtLWFybS9jcHJlZ3Mu
aAorKysgYi94ZW4vaW5jbHVkZS9hc20tYXJtL2NwcmVncy5oCkBAIC0xNDEsNyArMTQxLDcgQEAK
ICNkZWZpbmUgSFNUUiAgICAgICAgICAgIHAxNSw0LGMxLGMxLDMgICAvKiBIeXAuIFN5c3RlbSBU
cmFwIFJlZ2lzdGVyICovCiAKIC8qIENQMTUgQ1IyOiBUcmFuc2xhdGlvbiBUYWJsZSBCYXNlIGFu
ZCBDb250cm9sIFJlZ2lzdGVycyAqLwotI2RlZmluZSBUVEJDUiAgICAgICAgICAgcDE1LDAsYzIs
YzAsMiAgIC8qIFRyYW5zbGF0YXRpb24gVGFibGUgQmFzZSBDb250cm9sIFJlZ2lzdGVyICovCisj
ZGVmaW5lIFRUQkNSICAgICAgICAgICBwMTUsMCxjMixjMCwyICAgLyogVHJhbnNsYXRpb24gVGFi
bGUgQmFzZSBDb250cm9sIFJlZ2lzdGVyICovCiAjZGVmaW5lIFRUQlIwICAgICAgICAgICBwMTUs
MCxjMiAgICAgICAgLyogVHJhbnNsYXRpb24gVGFibGUgQmFzZSBSZWcuIDAgKi8KICNkZWZpbmUg
VFRCUjEgICAgICAgICAgIHAxNSwxLGMyICAgICAgICAvKiBUcmFuc2xhdGlvbiBUYWJsZSBCYXNl
IFJlZy4gMSAqLwogI2RlZmluZSBIVFRCUiAgICAgICAgICAgcDE1LDQsYzIgICAgICAgIC8qIEh5
cC4gVHJhbnNsYXRpb24gVGFibGUgQmFzZSBSZWdpc3RlciAqLwotLSAKMi4xMS4wCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
