Return-Path: <SRS0=ZpmR=ST=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28F15C282DC
	for <xen-devel@archiver.kernel.org>; Wed, 17 Apr 2019 17:58:43 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC42420663
	for <xen-devel@archiver.kernel.org>; Wed, 17 Apr 2019 17:58:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EC42420663
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hGopN-0004Eq-FK; Wed, 17 Apr 2019 17:58:33 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Uj5y=ST=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hGopM-0004DH-4e
 for xen-devel@lists.xenproject.org; Wed, 17 Apr 2019 17:58:32 +0000
X-Inumbo-ID: 68f85e92-613a-11e9-92d7-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 68f85e92-613a-11e9-92d7-bc764e045a96;
 Wed, 17 Apr 2019 17:58:30 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AC4BD1688;
 Wed, 17 Apr 2019 10:58:30 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9C1773F59C;
 Wed, 17 Apr 2019 10:58:29 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Wed, 17 Apr 2019 18:58:15 +0100
Message-Id: <20190417175815.16905-8-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190417175815.16905-1-julien.grall@arm.com>
References: <20190417175815.16905-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH 7/7] xen/arm: mm: Flush the TLBs even if a
 mapping failed in create_xen_entries
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
Message-ID: <20190417175815.jVkGlyISAQK9Xt3Dutd86DycQ6k-B_tZeQibd0ZsXhg@z>

QXQgdGhlIG1vbWVudCwgY3JlYXRlX3hlbl9lbnRyaWVzIHdpbGwgb25seSBmbHVzaCB0aGUgVExC
cyBpZiB0aGUgZnVsbApyYW5nZSBoYXMgc3VjY2Vzc2Z1bGx5IGJlZW4gdXBkYXRlZC4gVGhpcyBt
YXkgbGVhZCB0byBsZWF2ZSB1bndhbnRlZAplbnRyaWVzIGluIHRoZSBUTEJzIGlmIHdlIGZhaWwg
dG8gdXBkYXRlIHNvbWUgZW50cmllcy4KClNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVs
aWVuLmdyYWxsQGFybS5jb20+Ci0tLQogeGVuL2FyY2gvYXJtL21tLmMgfCAyMCArKysrKysrKysr
KysrLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL21tLmMgYi94ZW4vYXJjaC9hcm0vbW0uYwpp
bmRleCA4ZWU4MjhkNDQ1Li45ZDU4NGU0Y2JmIDEwMDY0NAotLS0gYS94ZW4vYXJjaC9hcm0vbW0u
YworKysgYi94ZW4vYXJjaC9hcm0vbW0uYwpAQCAtOTg0LDcgKzk4NCw3IEBAIHN0YXRpYyBpbnQg
Y3JlYXRlX3hlbl9lbnRyaWVzKGVudW0geGVubWFwX29wZXJhdGlvbiBvcCwKICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgbnJfbWZucywKICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCBmbGFncykKIHsKLSAgICBpbnQgcmM7CisgICAg
aW50IHJjID0gMDsKICAgICB1bnNpZ25lZCBsb25nIGFkZHIgPSB2aXJ0LCBhZGRyX2VuZCA9IGFk
ZHIgKyBucl9tZm5zICogUEFHRV9TSVpFOwogICAgIGxwYWVfdCBwdGUsICplbnRyeTsKICAgICBs
cGFlX3QgKnRoaXJkID0gTlVMTDsKQEAgLTEwMTMsNyArMTAxMyw4IEBAIHN0YXRpYyBpbnQgY3Jl
YXRlX3hlbl9lbnRyaWVzKGVudW0geGVubWFwX29wZXJhdGlvbiBvcCwKICAgICAgICAgICAgICAg
ICB7CiAgICAgICAgICAgICAgICAgICAgIHByaW50aygiJXM6IHRyeWluZyB0byByZXBsYWNlIGFu
IGV4aXN0aW5nIG1hcHBpbmcgYWRkcj0lbHggbWZuPSUiUFJJX21mbiJcbiIsCiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBfX2Z1bmNfXywgYWRkciwgbWZuX3gobWZuKSk7Ci0gICAgICAgICAg
ICAgICAgICAgIHJldHVybiAtRUlOVkFMOworICAgICAgICAgICAgICAgICAgICByYyA9IC1FSU5W
QUw7CisgICAgICAgICAgICAgICAgICAgIGdvdG8gb3V0OwogICAgICAgICAgICAgICAgIH0KICAg
ICAgICAgICAgICAgICBpZiAoIG9wID09IFJFU0VSVkUgKQogICAgICAgICAgICAgICAgICAgICBi
cmVhazsKQEAgLTEwMzAsNyArMTAzMSw4IEBAIHN0YXRpYyBpbnQgY3JlYXRlX3hlbl9lbnRyaWVz
KGVudW0geGVubWFwX29wZXJhdGlvbiBvcCwKICAgICAgICAgICAgICAgICB7CiAgICAgICAgICAg
ICAgICAgICAgIHByaW50aygiJXM6IHRyeWluZyB0byAlcyBhIG5vbi1leGlzdGluZyBtYXBwaW5n
IGFkZHI9JWx4XG4iLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgX19mdW5jX18sIG9wID09
IFJFTU9WRSA/ICJyZW1vdmUiIDogIm1vZGlmeSIsIGFkZHIpOwotICAgICAgICAgICAgICAgICAg
ICByZXR1cm4gLUVJTlZBTDsKKyAgICAgICAgICAgICAgICAgICAgcmMgPSAtRUlOVkFMOworICAg
ICAgICAgICAgICAgICAgICBnb3RvIG91dDsKICAgICAgICAgICAgICAgICB9CiAgICAgICAgICAg
ICAgICAgaWYgKCBvcCA9PSBSRU1PVkUgKQogICAgICAgICAgICAgICAgICAgICBwdGUuYml0cyA9
IDA7CkBAIC0xMDQzLDcgKzEwNDUsOCBAQCBzdGF0aWMgaW50IGNyZWF0ZV94ZW5fZW50cmllcyhl
bnVtIHhlbm1hcF9vcGVyYXRpb24gb3AsCiAgICAgICAgICAgICAgICAgICAgIHsKICAgICAgICAg
ICAgICAgICAgICAgICAgIHByaW50aygiJXM6IEluY29ycmVjdCBjb21iaW5hdGlvbiBmb3IgYWRk
cj0lbHhcbiIsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgX19mdW5jX18sIGFkZHIp
OwotICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7CisgICAgICAgICAgICAg
ICAgICAgICAgICByYyA9IC1FSU5WQUw7CisgICAgICAgICAgICAgICAgICAgICAgICBnb3RvIG91
dDsKICAgICAgICAgICAgICAgICAgICAgfQogICAgICAgICAgICAgICAgIH0KICAgICAgICAgICAg
ICAgICB3cml0ZV9wdGUoZW50cnksIHB0ZSk7CkBAIC0xMDUyLDExICsxMDU1LDE0IEBAIHN0YXRp
YyBpbnQgY3JlYXRlX3hlbl9lbnRyaWVzKGVudW0geGVubWFwX29wZXJhdGlvbiBvcCwKICAgICAg
ICAgICAgICAgICBCVUcoKTsKICAgICAgICAgfQogICAgIH0KK291dDoKKyAgICAvKgorICAgICAq
IEZsdXNoIHRoZSBUTEJzIGV2ZW4gaW4gY2FzZSBvZiBmYWlsdXJlIGJlY2F1c2Ugd2UgbWF5IGhh
dmUKKyAgICAgKiBwYXJ0aWFsbHkgbW9kaWZpZWQgdGhlIFBULiBUaGlzIHdpbGwgcHJldmVudCBh
bnkgdW5leHBlY3RlZAorICAgICAqIGJlaGF2aW9yIGFmdGVyd2FyZHMuCisgICAgICovCiAgICAg
Zmx1c2hfeGVuX3RsYl9yYW5nZV92YSh2aXJ0LCBQQUdFX1NJWkUgKiBucl9tZm5zKTsKIAotICAg
IHJjID0gMDsKLQotb3V0OgogICAgIHJldHVybiByYzsKIH0KIAotLSAKMi4xMS4wCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
