From: Andre Przywara <andre.przywara@linaro.org>
Subject: [PATCH 20/57] ARM: GICv2: fix GICH_V2_LR definitions
Date: Mon,  5 Mar 2018 16:03:38 +0000
Message-ID: <20180305160415.16760-21-andre.przywara@linaro.org>
References: <20180305160415.16760-1-andre.przywara@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=oang=f3=linaro.org=andre.przywara@srs-us1.protection.inumbo.net>)
 id 1essbV-0007W4-9S
 for xen-devel@lists.xenproject.org; Mon, 05 Mar 2018 16:04:45 +0000
Received: by mail-wr0-x241.google.com with SMTP id v18so17183736wrv.0
 for <xen-devel@lists.xenproject.org>; Mon, 05 Mar 2018 08:04:43 -0800 (PST)
In-Reply-To: <20180305160415.16760-1-andre.przywara@linaro.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

VGhlIGJpdCBkZWZpbml0aW9uIGZvciB0aGUgQ1BVSUQgbWFzayBpbiB0aGUgR0lDdjIgTFIgcmVn
aXN0ZXIgd2FzCndyb25nLCBmb3J0dW5hdGVseSB0aGUgY3VycmVudCBpbXBsZW1lbnRhdGlvbiBk
b2VzIG5vdCB1c2UgdGhhdCBiaXQuCkZpeCBpdCB1cCAoaXQncyBzdGFydGluZyBhdCBiaXQgMTAs
IG5vdCBiaXQgOSkgYW5kIGNsZWFuIHVwIHNvbWUKbmVhcmJ5IGRlZmluaXRpb25zIG9uIHRoZSB3
YXkuClRoaXMgd2lsbCBiZSB1c2VkIGJ5IHRoZSBuZXcgVkdJQyBzaG9ydGx5LgoKU2lnbmVkLW9m
Zi1ieTogQW5kcmUgUHJ6eXdhcmEgPGFuZHJlLnByenl3YXJhQGxpbmFyby5vcmc+Ci0tLQpDaGFu
Z2Vsb2cgUkZDIC4uLiB2MToKLSBuZXcgcGF0Y2gKIHhlbi9hcmNoL2FybS9naWMtdjIuYyB8IDkg
KysrKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9naWMtdjIuYyBiL3hlbi9hcmNoL2FybS9naWMt
djIuYwppbmRleCA2MThkZDk0MTIwLi4wMzFiZTkyMGNjIDEwMDY0NAotLS0gYS94ZW4vYXJjaC9h
cm0vZ2ljLXYyLmMKKysrIGIveGVuL2FyY2gvYXJtL2dpYy12Mi5jCkBAIC01NywxMCArNTcsMTEg
QEAKICNkZWZpbmUgR0lDSF9WMl9MUl9IV19NQVNLICAgICAgICAgMHgxCiAjZGVmaW5lIEdJQ0hf
VjJfTFJfR1JQX1NISUZUICAgICAgIDMwCiAjZGVmaW5lIEdJQ0hfVjJfTFJfR1JQX01BU0sgICAg
ICAgIDB4MQotI2RlZmluZSBHSUNIX1YyX0xSX01BSU5URU5BTkNFX0lSUSAoMTw8MTkpCi0jZGVm
aW5lIEdJQ0hfVjJfTFJfR1JQMSAgICAgICAgICAgICgxPDwzMCkKLSNkZWZpbmUgR0lDSF9WMl9M
Ul9IVyAgICAgICAgICAgICAgKDE8PDMxKQotI2RlZmluZSBHSUNIX1YyX0xSX0NQVUlEX1NISUZU
ICAgICA5CisjZGVmaW5lIEdJQ0hfVjJfTFJfTUFJTlRFTkFOQ0VfSVJRICgxVSA8PCAxOSkKKyNk
ZWZpbmUgR0lDSF9WMl9MUl9HUlAxICAgICAgICAgICAgKDFVIDw8IDMwKQorI2RlZmluZSBHSUNI
X1YyX0xSX0hXICAgICAgICAgICAgICAoMVUgPDwgR0lDSF9WMl9MUl9IV19TSElGVCkKKyNkZWZp
bmUgR0lDSF9WMl9MUl9DUFVJRF9TSElGVCAgICAgMTAKKyNkZWZpbmUgR0lDSF9WMl9MUl9DUFVJ
RF9NQVNLICAgICAgMHg3CiAjZGVmaW5lIEdJQ0hfVjJfVlRSX05STFJHUyAgICAgICAgIDB4M2YK
IAogI2RlZmluZSBHSUNIX1YyX1ZNQ1JfUFJJT1JJVFlfTUFTSyAgIDB4MWYKLS0gCjIuMTQuMQoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
