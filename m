From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [PATCH] tools/libfsimage: Set soname to 4.12 not 0.4.12
Date: Mon, 15 Oct 2018 16:23:06 +0100
Message-ID: <20181015152306.4613-1-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=w2gt=m3=citrix.com=prvs=81941a82a=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1gC4iD-00025a-NM
 for xen-devel@lists.xenproject.org; Mon, 15 Oct 2018 15:23:17 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhpcyB3YXMgc2V0IHRvIDAuNC4xMiBieSBhY2NpZGVudCBpbgogIGM2OWE2YWNhODUyMmM3ZjY3
Njk1M2U1NjE5MTU4NDM4MWFkZjJjMDYKICB0b29scy9saWJmc2ltYWdlOiBCdW1wIHNvbmFtZSB0
byA0LjEyCgpUaGUgZXh0cmEgMC4gaXMgaGFybWxlc3MgYnV0IHVnbHkuICBXZSBzaG91bGQgYmUg
c29tZXdoYXQgY29uc2lzdGVudC4KClJlcG9ydGVkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcu
Y29vcGVyM0BjaXRyaXguY29tPgpTaWduZWQtb2ZmLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tz
b25AZXUuY2l0cml4LmNvbT4KLS0tCiB0b29scy9saWJmc2ltYWdlL2NvbW1vbi9NYWtlZmlsZSB8
IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS90b29scy9saWJmc2ltYWdlL2NvbW1vbi9NYWtlZmlsZSBiL3Rvb2xzL2xp
YmZzaW1hZ2UvY29tbW9uL01ha2VmaWxlCmluZGV4IGYyMGUxMzk0YTguLjhmYjQ4MzQzYWYgMTAw
NjQ0Ci0tLSBhL3Rvb2xzL2xpYmZzaW1hZ2UvY29tbW9uL01ha2VmaWxlCisrKyBiL3Rvb2xzL2xp
YmZzaW1hZ2UvY29tbW9uL01ha2VmaWxlCkBAIC0xLDggKzEsOCBAQAogWEVOX1JPT1QgPSAkKENV
UkRJUikvLi4vLi4vLi4KIGluY2x1ZGUgJChYRU5fUk9PVCkvdG9vbHMvbGliZnNpbWFnZS9SdWxl
cy5tawogCi1NQUpPUiA9IDAKLU1JTk9SID0gNC4xMgorTUFKT1IgPSA0CitNSU5PUiA9IDEyCiAK
IExERkxBR1MtJChDT05GSUdfU3VuT1MpID0gLVdsLC1NIC1XbCxtYXBmaWxlLVN1bk9TCiBMREZM
QUdTLSQoQ09ORklHX0xpbnV4KSA9IC1XbCxtYXBmaWxlLUdOVQotLSAKMi4xMS4wCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
