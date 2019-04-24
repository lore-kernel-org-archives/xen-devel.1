Return-Path: <SRS0=MKw+=S2=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1265FC282CE
	for <xen-devel@archiver.kernel.org>; Wed, 24 Apr 2019 17:00:40 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E061E218FE
	for <xen-devel@archiver.kernel.org>; Wed, 24 Apr 2019 17:00:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E061E218FE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hJLFp-0007ob-1c; Wed, 24 Apr 2019 17:00:17 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8RIj=S2=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hJLFn-0007o4-OR
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2019 17:00:15 +0000
X-Inumbo-ID: 6dc2e40a-66b2-11e9-92d7-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 6dc2e40a-66b2-11e9-92d7-bc764e045a96;
 Wed, 24 Apr 2019 17:00:14 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1DB67EBD;
 Wed, 24 Apr 2019 10:00:14 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 028153F557;
 Wed, 24 Apr 2019 10:00:12 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Wed, 24 Apr 2019 17:59:50 +0100
Message-Id: <20190424165955.23718-8-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190424165955.23718-1-julien.grall@arm.com>
References: <20190424165955.23718-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH 07/12] xen/arm: mm: Rework xen_pt_update_entry
 to avoid use xenmap_operation
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
Cc: Oleksandr_Tyshchenko@epam.com, Julien Grall <julien.grall@arm.com>,
 sstabellini@kernel.org, Andrii_Anisov@epam.com
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190424165950.vuaT6MiCMV96dDNu4QDvG7l3y2CzIQlvmhZxhVPvqAU@z>

V2l0aCB0aGUgbmV3bHkgaW50cm9kdWNlZCBmbGFncywgaXQgaXMgbm93IHBvc3NpYmxlIHRvIGtu
b3cgaG93IHRoZSBwYWdlCndpbGwgYmUgdXBkYXRlZCB0aHJvdWdoIHRoZSBmbGFncy4KCkFsbCB0
aGUgdXNlIG9mIHhlbm1hcF9vcGVyYXRpb24gYXJlIG5vdCByZXBsYWNlZCB3aXRoIHRoZSBmbGFn
cy4gQXQgdGhlCnNhbWUgdGltZSwgdmFsaWRpdHkgY2hlY2sgYXJlIG5vdyByZW1vdmVkIGFzIHRo
ZXkgYXJlIGdhdGhlcmVkIGluCnhlbl9wdF9jaGVja19lbnRyeSgpLgoKU2lnbmVkLW9mZi1ieTog
SnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KLS0tCiB4ZW4vYXJjaC9hcm0vbW0u
YyB8IDQ3ICsrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiAx
IGZpbGUgY2hhbmdlZCwgMjMgaW5zZXJ0aW9ucygrKSwgMjQgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEveGVuL2FyY2gvYXJtL21tLmMgYi94ZW4vYXJjaC9hcm0vbW0uYwppbmRleCA1ZWI2ZjQ3
ZDc0Li42MTFlYTUzOTkyIDEwMDY0NAotLS0gYS94ZW4vYXJjaC9hcm0vbW0uYworKysgYi94ZW4v
YXJjaC9hcm0vbW0uYwpAQCAtMTA2MiwzNCArMTA2MiwzMyBAQCBzdGF0aWMgaW50IHhlbl9wdF91
cGRhdGVfZW50cnkoZW51bSB4ZW5tYXBfb3BlcmF0aW9uIG9wLCB1bnNpZ25lZCBsb25nIGFkZHIs
CiAgICAgaWYgKCAheGVuX3B0X2NoZWNrX2VudHJ5KCplbnRyeSwgbWZuLCBmbGFncykgKQogICAg
ICAgICByZXR1cm4gLUVJTlZBTDsKIAotICAgIHN3aXRjaCAoIG9wICkgewotICAgICAgICBjYXNl
IElOU0VSVDoKLSAgICAgICAgY2FzZSBSRVNFUlZFOgotICAgICAgICAgICAgaWYgKCBvcCA9PSBS
RVNFUlZFICkKLSAgICAgICAgICAgICAgICBicmVhazsKKyAgICAvKiBJZiB3ZSBhcmUgb25seSBw
b3B1bGF0aW5nIHBhZ2UtdGFibGUsIHRoZW4gd2UgYXJlIGRvbmUuICovCisgICAgaWYgKCBmbGFn
cyAmIF9QQUdFX1BPUFVMQVRFICkKKyAgICAgICAgcmV0dXJuIDA7CisKKyAgICAvKiBXZSBhcmUg
cmVtb3ZpbmcgdGhlIHBhZ2UgKi8KKyAgICBpZiAoICEoZmxhZ3MgJiBfUEFHRV9QUkVTRU5UKSAp
CisgICAgICAgIG1lbXNldCgmcHRlLCAweDAwLCBzaXplb2YocHRlKSk7CisgICAgZWxzZQorICAg
IHsKKyAgICAgICAgLyogV2UgYXJlIGluc2VydGluZyBhIG1hcHBpbmcgPT4gQ3JlYXRlIG5ldyBw
dGUuICovCisgICAgICAgIGlmICggIW1mbl9lcShtZm4sIElOVkFMSURfTUZOKSApCisgICAgICAg
IHsKICAgICAgICAgICAgIHB0ZSA9IG1mbl90b194ZW5fZW50cnkobWZuLCBQQUdFX0FJX01BU0so
ZmxhZ3MpKTsKLSAgICAgICAgICAgIHB0ZS5wdC5ybyA9IFBBR0VfUk9fTUFTSyhmbGFncyk7Ci0g
ICAgICAgICAgICBwdGUucHQueG4gPSBQQUdFX1hOX01BU0soZmxhZ3MpOwotICAgICAgICAgICAg
QlVHX09OKCFwdGUucHQucm8gJiYgIXB0ZS5wdC54bik7CisKKyAgICAgICAgICAgIC8qIFRoaXJk
IGxldmVsIGVudHJpZXMgc2V0IHB0ZS5wdC50YWJsZSA9IDEgKi8KICAgICAgICAgICAgIHB0ZS5w
dC50YWJsZSA9IDE7Ci0gICAgICAgICAgICB3cml0ZV9wdGUoZW50cnksIHB0ZSk7Ci0gICAgICAg
ICAgICBicmVhazsKLSAgICAgICAgY2FzZSBNT0RJRlk6Ci0gICAgICAgIGNhc2UgUkVNT1ZFOgot
ICAgICAgICAgICAgaWYgKCBvcCA9PSBSRU1PVkUgKQotICAgICAgICAgICAgICAgIHB0ZS5iaXRz
ID0gMDsKLSAgICAgICAgICAgIGVsc2UKLSAgICAgICAgICAgIHsKLSAgICAgICAgICAgICAgICBw
dGUgPSAqZW50cnk7Ci0gICAgICAgICAgICAgICAgcHRlLnB0LnJvID0gUEFHRV9ST19NQVNLKGZs
YWdzKTsKLSAgICAgICAgICAgICAgICBwdGUucHQueG4gPSBQQUdFX1hOX01BU0soZmxhZ3MpOwot
ICAgICAgICAgICAgfQotICAgICAgICAgICAgd3JpdGVfcHRlKGVudHJ5LCBwdGUpOwotICAgICAg
ICAgICAgYnJlYWs7Ci0gICAgICAgIGRlZmF1bHQ6Ci0gICAgICAgICAgICBCVUcoKTsKKyAgICAg
ICAgfQorICAgICAgICBlbHNlIC8qIFdlIGFyZSB1cGRhdGluZyB0aGUgcGVybWlzc2lvbiA9PiBD
b3B5IHRoZSBjdXJyZW50IHB0ZS4gKi8KKyAgICAgICAgICAgIHB0ZSA9ICplbnRyeTsKKworICAg
ICAgICAvKiBTZXQgcGVybWlzc2lvbiAqLworICAgICAgICBwdGUucHQucm8gPSBQQUdFX1JPX01B
U0soZmxhZ3MpOworICAgICAgICBwdGUucHQueG4gPSBQQUdFX1hOX01BU0soZmxhZ3MpOwogICAg
IH0KIAorICAgIHdyaXRlX3B0ZShlbnRyeSwgcHRlKTsKKwogICAgIHJldHVybiAwOwogfQogCi0t
IAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
