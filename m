From: Julien Grall <julien.grall@arm.com>
Subject: [PATCH for-4.12 v2 03/17] xen/arm: p2m: Clean-up
 headers included and order them alphabetically
Date: Tue,  4 Dec 2018 20:26:37 +0000
Message-ID: <20181204202651.8836-4-julien.grall@arm.com>
References: <20181204202651.8836-1-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aD1Q=ON=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1gUHHt-00085j-MQ
 for xen-devel@lists.xenproject.org; Tue, 04 Dec 2018 20:27:21 +0000
In-Reply-To: <20181204202651.8836-1-julien.grall@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Julien Grall <julien.grall@arm.com>, sstabellini@kernel.org
List-Id: xen-devel@lists.xenproject.org

QSBsb3Qgb2YgdGhlIGhlYWRlcnMgYXJlIG5vdCBuZWNlc3NhcnksIHNvIHJlbW92ZSB0aGVtLiBB
dCB0aGUgc2FtZQp0aW1lLCByZS1vcmRlciB0aGVtIGFscGhhYmV0aWNhbGx5LgoKU2lnbmVkLW9m
Zi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KLS0tCiB4ZW4vYXJjaC9h
cm0vcDJtLmMgfCAxOCArKysrKy0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2Vy
dGlvbnMoKyksIDEzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9wMm0u
YyBiL3hlbi9hcmNoL2FybS9wMm0uYwppbmRleCA2Yzc2Mjk4ZWJjLi44MWYzMTA3ZGQyIDEwMDY0
NAotLS0gYS94ZW4vYXJjaC9hcm0vcDJtLmMKKysrIGIveGVuL2FyY2gvYXJtL3AybS5jCkBAIC0x
LDE5ICsxLDExIEBACi0jaW5jbHVkZSA8eGVuL3NjaGVkLmg+Ci0jaW5jbHVkZSA8eGVuL2xpYi5o
PgotI2luY2x1ZGUgPHhlbi9lcnJuby5oPgorI2luY2x1ZGUgPHhlbi9jcHUuaD4KICNpbmNsdWRl
IDx4ZW4vZG9tYWluX3BhZ2UuaD4KLSNpbmNsdWRlIDx4ZW4vYml0b3BzLmg+Ci0jaW5jbHVkZSA8
eGVuL3ZtX2V2ZW50Lmg+Ci0jaW5jbHVkZSA8eGVuL21vbml0b3IuaD4KICNpbmNsdWRlIDx4ZW4v
aW9jYXAuaD4KLSNpbmNsdWRlIDx4ZW4vbWVtX2FjY2Vzcy5oPgotI2luY2x1ZGUgPHhlbi94bWFs
bG9jLmg+Ci0jaW5jbHVkZSA8eGVuL2NwdS5oPgotI2luY2x1ZGUgPHhlbi9ub3RpZmllci5oPgot
I2luY2x1ZGUgPHB1YmxpYy92bV9ldmVudC5oPgotI2luY2x1ZGUgPGFzbS9mbHVzaHRsYi5oPgor
I2luY2x1ZGUgPHhlbi9saWIuaD4KKyNpbmNsdWRlIDx4ZW4vc2NoZWQuaD4KKwogI2luY2x1ZGUg
PGFzbS9ldmVudC5oPgotI2luY2x1ZGUgPGFzbS9oYXJkaXJxLmg+CisjaW5jbHVkZSA8YXNtL2Zs
dXNodGxiLmg+CiAjaW5jbHVkZSA8YXNtL3BhZ2UuaD4KIAogI2RlZmluZSBNQVhfVk1JRF84X0JJ
VCAgKDFVTCA8PCA4KQotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
