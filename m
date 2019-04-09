Return-Path: <SRS0=7ods=SL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72A49C10F0E
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 11:28:18 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B20220883
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 11:28:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4B20220883
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hDov9-0000cu-6y; Tue, 09 Apr 2019 11:28:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+Yc4=SL=citrix.com=prvs=99536ed25=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hDov7-0000ab-3Q
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2019 11:28:05 +0000
X-Inumbo-ID: 899f702a-5aba-11e9-9e45-bb18f1a59bb6
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 899f702a-5aba-11e9-9e45-bb18f1a59bb6;
 Tue, 09 Apr 2019 11:28:03 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,329,1549929600"; d="scan'208";a="83096435"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <devel@edk2.groups.io>
Date: Tue, 9 Apr 2019 12:08:28 +0100
Message-ID: <20190409110844.14746-16-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190409110844.14746-1-anthony.perard@citrix.com>
References: <20190409110844.14746-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 15/31] OvmfPkg/XenHypercallLib: Enable it in
 PEIM
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Jordan Justen <jordan.l.justen@intel.com>, Julien Grall <julien.grall@arm.com>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Laszlo Ersek <lersek@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190409110828.TBecCUEKj9ay7xaV62jp9SAJgtrK0zTSwuPR15fzjFY@z>

QWxsb3cgdG8gdXNlIFhlbiBoeXBlcmNhbGxzIGVhcmxpZXIsIGR1cmluZyB0aGUgUEVJTSBzdGFn
ZSwgYnV0Clhlbkh5cGVyY2FsbExpYlJlSW5pdCgpIG11c3QgYmUgY2FsbGVkIG9uY2UgdGhlIFhl
bkluZm8gSE9CIGlzIGNyZWF0ZWQKd2l0aCB0aGUgSHlwZXJQYWdlIHNldHVwLgoKQ29udHJpYnV0
ZWQtdW5kZXI6IFRpYW5vQ29yZSBDb250cmlidXRpb24gQWdyZWVtZW50IDEuMQpTaWduZWQtb2Zm
LWJ5OiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KLS0tCiBPdm1m
UGtnL0xpYnJhcnkvWGVuSHlwZXJjYWxsTGliL1hlbkh5cGVyY2FsbExpYi5pbmYgfCAgMiArLQog
T3ZtZlBrZy9YZW5QbGF0Zm9ybVBlaS9YZW5QbGF0Zm9ybVBlaS5pbmYgICAgICAgICAgIHwgIDEg
KwogT3ZtZlBrZy9JbmNsdWRlL0xpYnJhcnkvWGVuSHlwZXJjYWxsTGliLmggICAgICAgICAgIHwg
MTIgKysrKysrKysrKysrCiBPdm1mUGtnL0xpYnJhcnkvWGVuSHlwZXJjYWxsTGliL1g4Nlhlbkh5
cGVyY2FsbC5jICAgfCAxMSArKysrKysrKysrKwogT3ZtZlBrZy9YZW5QbGF0Zm9ybVBlaS9YZW4u
YyAgICAgICAgICAgICAgICAgICAgICAgIHwgIDcgKysrKysrKwogNSBmaWxlcyBjaGFuZ2VkLCAz
MiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvT3ZtZlBrZy9MaWJy
YXJ5L1hlbkh5cGVyY2FsbExpYi9YZW5IeXBlcmNhbGxMaWIuaW5mIGIvT3ZtZlBrZy9MaWJyYXJ5
L1hlbkh5cGVyY2FsbExpYi9YZW5IeXBlcmNhbGxMaWIuaW5mCmluZGV4IGQyNjhlNTQwZmUuLmUw
YTE4ODkxNzEgMTAwNjQ0Ci0tLSBhL092bWZQa2cvTGlicmFyeS9YZW5IeXBlcmNhbGxMaWIvWGVu
SHlwZXJjYWxsTGliLmluZgorKysgYi9Pdm1mUGtnL0xpYnJhcnkvWGVuSHlwZXJjYWxsTGliL1hl
bkh5cGVyY2FsbExpYi5pbmYKQEAgLTIxLDcgKzIxLDcgQEAgW0RlZmluZXNdCiAgIENPTlNUUlVD
VE9SICAgICAgICAgICAgICAgICAgICA9IFhlbkh5cGVyY2FsbExpYkluaXQKIAogW0RlZmluZXMu
SUEzMiwgRGVmaW5lcy5YNjRdCi0gIExJQlJBUllfQ0xBU1MgICAgICAgICAgICAgICAgICA9IFhl
bkh5cGVyY2FsbExpYnxEWEVfRFJJVkVSIFVFRklfRFJJVkVSCisgIExJQlJBUllfQ0xBU1MgICAg
ICAgICAgICAgICAgICA9IFhlbkh5cGVyY2FsbExpYnxQRUlNIERYRV9EUklWRVIgVUVGSV9EUklW
RVIKIAogW0RlZmluZXMuQVJNLCBEZWZpbmVzLkFBUkNINjRdCiAgIExJQlJBUllfQ0xBU1MgICAg
ICAgICAgICAgICAgICA9IFhlbkh5cGVyY2FsbExpYgpkaWZmIC0tZ2l0IGEvT3ZtZlBrZy9YZW5Q
bGF0Zm9ybVBlaS9YZW5QbGF0Zm9ybVBlaS5pbmYgYi9Pdm1mUGtnL1hlblBsYXRmb3JtUGVpL1hl
blBsYXRmb3JtUGVpLmluZgppbmRleCAxODcwZTM5MjA4Li5iYzYwNjVhNzA5IDEwMDY0NAotLS0g
YS9Pdm1mUGtnL1hlblBsYXRmb3JtUGVpL1hlblBsYXRmb3JtUGVpLmluZgorKysgYi9Pdm1mUGtn
L1hlblBsYXRmb3JtUGVpL1hlblBsYXRmb3JtUGVpLmluZgpAQCAtNjYsNiArNjYsNyBAQCBbTGli
cmFyeUNsYXNzZXNdCiAgIE10cnJMaWIKICAgTWVtRW5jcnlwdFNldkxpYgogICBQY2RMaWIKKyAg
WGVuSHlwZXJjYWxsTGliCiAKIFtQY2RdCiAgIGdVZWZpT3ZtZlBrZ1Rva2VuU3BhY2VHdWlkLlBj
ZE92bWZQZWlNZW1GdkJhc2UKZGlmZiAtLWdpdCBhL092bWZQa2cvSW5jbHVkZS9MaWJyYXJ5L1hl
bkh5cGVyY2FsbExpYi5oIGIvT3ZtZlBrZy9JbmNsdWRlL0xpYnJhcnkvWGVuSHlwZXJjYWxsTGli
LmgKaW5kZXggMzZlMzM0NGUyZi4uMzhlNjRhYjEwOCAxMDA2NDQKLS0tIGEvT3ZtZlBrZy9JbmNs
dWRlL0xpYnJhcnkvWGVuSHlwZXJjYWxsTGliLmgKKysrIGIvT3ZtZlBrZy9JbmNsdWRlL0xpYnJh
cnkvWGVuSHlwZXJjYWxsTGliLmgKQEAgLTE2LDYgKzE2LDE4IEBACiAjaWZuZGVmIF9fWEVOX0hZ
UEVSQ0FMTF9MSUJfSF9fCiAjZGVmaW5lIF9fWEVOX0hZUEVSQ0FMTF9MSUJfSF9fCiAKKy8qKgor
ICBUbyBjYWxsIHdoZW4gdGhlIGdFZmlYZW5JbmZvR3VpZCBIT0IgYmVjYW1lIGF2YWlsYWJsZSBh
ZnRlciB0aGUgbGlicmFyeSBpbml0CisgIGZ1bmN0aW9uIGhhcyBhbHJlYWR5IGJlZW4gZXhlY3V0
ZWQuCisKKyAgVGhpcyBhbGxvdyB0byBtYWtlIGh5cGVyY2FsbCBpbiB0aGUgUEVJTSBzdGFnZS4K
KyoqLworVk9JRAorRUZJQVBJCitYZW5IeXBlcmNhbGxMaWJSZUluaXQgKAorICBWT0lECisgICk7
CisKIC8qKgogICBDaGVjayBpZiB0aGUgWGVuIEh5cGVyY2FsbCBsaWJyYXJ5IGlzIGFibGUgdG8g
bWFrZSBjYWxscyB0byB0aGUgWGVuCiAgIGh5cGVydmlzb3IuCmRpZmYgLS1naXQgYS9Pdm1mUGtn
L0xpYnJhcnkvWGVuSHlwZXJjYWxsTGliL1g4Nlhlbkh5cGVyY2FsbC5jIGIvT3ZtZlBrZy9MaWJy
YXJ5L1hlbkh5cGVyY2FsbExpYi9YODZYZW5IeXBlcmNhbGwuYwppbmRleCA3Y2I3ZjQ2YzliLi4y
YWM3MjU0NzU5IDEwMDY0NAotLS0gYS9Pdm1mUGtnL0xpYnJhcnkvWGVuSHlwZXJjYWxsTGliL1g4
Nlhlbkh5cGVyY2FsbC5jCisrKyBiL092bWZQa2cvTGlicmFyeS9YZW5IeXBlcmNhbGxMaWIvWDg2
WGVuSHlwZXJjYWxsLmMKQEAgLTc4LDYgKzc4LDE3IEBAIFhlbkh5cGVyY2FsbExpYkluaXQgKAog
ICByZXR1cm4gUkVUVVJOX1NVQ0NFU1M7CiB9CiAKK1ZPSUQKK0VGSUFQSQorWGVuSHlwZXJjYWxs
TGliUmVJbml0ICgKKyAgVk9JRAorICApCit7CisgIGlmIChIeXBlclBhZ2UgPT0gTlVMTCkgewor
ICAgIFhlbkh5cGVyY2FsbExpYkluaXQoKTsKKyAgfQorfQorCiAvKioKICAgVGhpcyBmdW5jdGlv
biB3aWxsIHB1dCB0aGUgdHdvIGFyZ3VtZW50cyBpbiB0aGUgcmlnaHQgcGxhY2UgKHJlZ2lzdGVy
cykgYW5kCiAgIGludm9rZSB0aGUgaHlwZXJjYWxsIGlkZW50aWZpZWQgYnkgSHlwZXJjYWxsSUQu
CmRpZmYgLS1naXQgYS9Pdm1mUGtnL1hlblBsYXRmb3JtUGVpL1hlbi5jIGIvT3ZtZlBrZy9YZW5Q
bGF0Zm9ybVBlaS9YZW4uYwppbmRleCBmYjAxMDk0YmE5Li45ZDllOWY4MDIwIDEwMDY0NAotLS0g
YS9Pdm1mUGtnL1hlblBsYXRmb3JtUGVpL1hlbi5jCisrKyBiL092bWZQa2cvWGVuUGxhdGZvcm1Q
ZWkvWGVuLmMKQEAgLTMyLDYgKzMyLDcgQEAKICNpbmNsdWRlIDxMaWJyYXJ5L1Jlc291cmNlUHVi
bGljYXRpb25MaWIuaD4KICNpbmNsdWRlIDxMaWJyYXJ5L010cnJMaWIuaD4KICNpbmNsdWRlIDxJ
bmR1c3RyeVN0YW5kYXJkL1hlbi9hcmNoLXg4Ni9odm0vc3RhcnRfaW5mby5oPgorI2luY2x1ZGUg
PExpYnJhcnkvWGVuSHlwZXJjYWxsTGliLmg+CiAKICNpbmNsdWRlICJQbGF0Zm9ybS5oIgogI2lu
Y2x1ZGUgIlhlbi5oIgpAQCAtMTU3LDYgKzE1OCwxMiBAQCBYZW5Db25uZWN0ICgKICAgICBzaXpl
b2YobVhlbkluZm8pCiAgICAgKTsKIAorICAvLworICAvLyBJbml0aWFsaXplIHRoZSBYZW5IeXBl
cmNhbGwgbGlicmFyeSwgbm93IHRoYXQgdGhlIFhlbkluZm8gSE9CIGlzCisgIC8vIGF2YWlsYWJs
ZQorICAvLworICBYZW5IeXBlcmNhbGxMaWJSZUluaXQgKCk7CisKICAgcmV0dXJuIEVGSV9TVUND
RVNTOwogfQogCi0tIApBbnRob255IFBFUkFSRAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
