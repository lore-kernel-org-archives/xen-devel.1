From: Andre Przywara <andre.przywara@linaro.org>
Subject: [PATCH 17/17] ARM: GICv2: fix GICH_V2_LR definitions
Date: Fri,  9 Mar 2018 15:11:33 +0000
Message-ID: <20180309151133.31371-18-andre.przywara@linaro.org>
References: <20180309151133.31371-1-andre.przywara@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=stbu=f7=linaro.org=andre.przywara@srs-us1.protection.inumbo.net>)
 id 1euJgg-000673-Qq
 for xen-devel@lists.xenproject.org; Fri, 09 Mar 2018 15:12:02 +0000
Received: by mail-wr0-x244.google.com with SMTP id v65so9332086wrc.11
 for <xen-devel@lists.xenproject.org>; Fri, 09 Mar 2018 07:12:01 -0800 (PST)
In-Reply-To: <20180309151133.31371-1-andre.przywara@linaro.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien.grall@arm.com>
Cc: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

VGhlIGJpdCBkZWZpbml0aW9uIGZvciB0aGUgQ1BVSUQgbWFzayBpbiB0aGUgR0lDdjIgTFIgcmVn
aXN0ZXIgd2FzCndyb25nLCBmb3J0dW5hdGVseSB0aGUgY3VycmVudCBpbXBsZW1lbnRhdGlvbiBk
b2VzIG5vdCB1c2UgdGhhdCBiaXQuCkZpeCBpdCB1cCAoaXQncyBzdGFydGluZyBhdCBiaXQgMTAs
IG5vdCBiaXQgOSkgYW5kIGNsZWFuIHVwIHNvbWUKbmVhcmJ5IGRlZmluaXRpb25zIG9uIHRoZSB3
YXkuClRoaXMgd2lsbCBiZSB1c2VkIGJ5IHRoZSBuZXcgVkdJQyBzaG9ydGx5LgoKU2lnbmVkLW9m
Zi1ieTogQW5kcmUgUHJ6eXdhcmEgPGFuZHJlLnByenl3YXJhQGxpbmFyby5vcmc+ClJldmlld2Vk
LWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgotLS0KIHhlbi9hcmNoL2Fy
bS9naWMtdjIuYyB8IDkgKysrKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCsp
LCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9naWMtdjIuYyBiL3hl
bi9hcmNoL2FybS9naWMtdjIuYwppbmRleCBmYTlhZmMyYmU4Li5mMTZlMTdjMWEzIDEwMDY0NAot
LS0gYS94ZW4vYXJjaC9hcm0vZ2ljLXYyLmMKKysrIGIveGVuL2FyY2gvYXJtL2dpYy12Mi5jCkBA
IC01NywxMCArNTcsMTEgQEAKICNkZWZpbmUgR0lDSF9WMl9MUl9IV19NQVNLICAgICAgICAgMHgx
CiAjZGVmaW5lIEdJQ0hfVjJfTFJfR1JQX1NISUZUICAgICAgIDMwCiAjZGVmaW5lIEdJQ0hfVjJf
TFJfR1JQX01BU0sgICAgICAgIDB4MQotI2RlZmluZSBHSUNIX1YyX0xSX01BSU5URU5BTkNFX0lS
USAoMTw8MTkpCi0jZGVmaW5lIEdJQ0hfVjJfTFJfR1JQMSAgICAgICAgICAgICgxPDwzMCkKLSNk
ZWZpbmUgR0lDSF9WMl9MUl9IVyAgICAgICAgICAgICAgKDE8PDMxKQotI2RlZmluZSBHSUNIX1Yy
X0xSX0NQVUlEX1NISUZUICAgICA5CisjZGVmaW5lIEdJQ0hfVjJfTFJfTUFJTlRFTkFOQ0VfSVJR
ICgxVSA8PCAxOSkKKyNkZWZpbmUgR0lDSF9WMl9MUl9HUlAxICAgICAgICAgICAgKDFVIDw8IDMw
KQorI2RlZmluZSBHSUNIX1YyX0xSX0hXICAgICAgICAgICAgICAoMVUgPDwgR0lDSF9WMl9MUl9I
V19TSElGVCkKKyNkZWZpbmUgR0lDSF9WMl9MUl9DUFVJRF9TSElGVCAgICAgMTAKKyNkZWZpbmUg
R0lDSF9WMl9MUl9DUFVJRF9NQVNLICAgICAgMHg3CiAjZGVmaW5lIEdJQ0hfVjJfVlRSX05STFJH
UyAgICAgICAgIDB4M2YKIAogI2RlZmluZSBHSUNIX1YyX1ZNQ1JfUFJJT1JJVFlfTUFTSyAgIDB4
MWYKLS0gCjIuMTQuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
