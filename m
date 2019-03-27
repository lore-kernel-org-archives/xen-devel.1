From: Julien Grall <julien.grall@arm.com>
Subject: [PATCH 03/12] xen/arm: zynqmp: Fix header guard for
 xilinx-zynqmp-eemi.h
Date: Wed, 27 Mar 2019 18:45:22 +0000
Message-ID: <20190327184531.30986-4-julien.grall@arm.com>
References: <20190327184531.30986-1-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=h58V=R6=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1h9DYZ-0001hm-W3
 for xen-devel@lists.xenproject.org; Wed, 27 Mar 2019 18:45:48 +0000
In-Reply-To: <20190327184531.30986-1-julien.grall@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Artem_Mygaiev@epam.com, Oleksandr_Tyshchenko@epam.com, Julien Grall <julien.grall@arm.com>, sstabellini@kernel.org, Andrii_Anisov@epam.com
List-Id: xen-devel@lists.xenproject.org

VGhlIGhlYWRlciBndWFyZCBmb3IgeGlsaW54LXp5bnFtcC1lZW1pLmggaXMgbm90IGZvbGxvd2Vk
IGJ5IGEgI2RlZmluZQpvZiB0aGUgbWFjcm8gdXNlZCBpbiB0aGUgZ3VhcmQuCgpTaWduZWQtb2Zm
LWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgotLS0KIHhlbi9pbmNsdWRl
L2FzbS1hcm0vcGxhdGZvcm1zL3hpbGlueC16eW5xbXAtZWVtaS5oIHwgMiArLQogMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2lu
Y2x1ZGUvYXNtLWFybS9wbGF0Zm9ybXMveGlsaW54LXp5bnFtcC1lZW1pLmggYi94ZW4vaW5jbHVk
ZS9hc20tYXJtL3BsYXRmb3Jtcy94aWxpbngtenlucW1wLWVlbWkuaAppbmRleCA3MmFhZGY3YTQ0
Li5jZjI1YTkwMTRkIDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS9hc20tYXJtL3BsYXRmb3Jtcy94
aWxpbngtenlucW1wLWVlbWkuaAorKysgYi94ZW4vaW5jbHVkZS9hc20tYXJtL3BsYXRmb3Jtcy94
aWxpbngtenlucW1wLWVlbWkuaApAQCAtMTIsNyArMTIsNyBAQAogICovCiAKICNpZm5kZWYgX19B
U01fQVJNX1BMQVRGT1JNU19aWU5RTVBfSAotI2RlZmluZSBfX0FTTV9BU01fUExBVEZPUk1TX1pZ
TlFNUF9ICisjZGVmaW5lIF9fQVNNX0FSTV9QTEFURk9STVNfWllOUU1QX0gKIAogI2luY2x1ZGUg
PGFzbS9wcm9jZXNzb3IuaD4KICNpbmNsdWRlIDxhc20vc21jY2MuaD4KLS0gCjIuMTEuMAoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
