Return-Path: <SRS0=b8XE=TB=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB616C43219
	for <xen-devel@archiver.kernel.org>; Wed,  1 May 2019 10:49:05 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C079C21670
	for <xen-devel@archiver.kernel.org>; Wed,  1 May 2019 10:49:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C079C21670
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hLmnE-0005Wc-KP; Wed, 01 May 2019 10:48:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9pMH=TB=citrix.com=prvs=01726d3a8=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hLmnD-0005Vd-7S
 for xen-devel@lists.xenproject.org; Wed, 01 May 2019 10:48:51 +0000
X-Inumbo-ID: b34fa282-6bfe-11e9-9f5e-1b07f8b49dba
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b34fa282-6bfe-11e9-9f5e-1b07f8b49dba;
 Wed, 01 May 2019 10:48:48 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,417,1549929600"; d="scan'208";a="84837303"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 1 May 2019 11:48:32 +0100
Message-ID: <20190501104839.21621-9-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190501104839.21621-1-ian.jackson@eu.citrix.com>
References: <20190501104839.21621-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH v2 08/15] arch replumbing: make-flight:
 Fix $r{arch} comment
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190501104832.pG76RBw00NmBhpv9a6k3xeoBSZPeX1wzPxycC36OZz4@z>

VGhpcyBjb21tZW50IHdhcyBsYW1lbnRpbmcgdGhlIHZlcnkgcHJvYmxlbSB3ZSBhcmUgZml4aW5n
IG5vdy4gIEl0CndvdWxkIG5vdyBiZSBwb3NzaWJsZSB0byB0ZXN0IGkzODYtPmFtZDY0IHRvb2xz
IG1pZ3JhdGlvbiwgYnkgd3JpdGluZwphbiBhcHByb3ByaWF0ZSB0ZXN0IGpvYiB3aXRoIGRpZmZl
cmVudCBzcmNfaG9zdF9hcmNoIGFuZApkc3RfaG9zdF9hcmNoIGV0Yy4KClNpZ25lZC1vZmYtYnk6
IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgotLS0KIG1ha2UtZmxpZ2h0
IHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL21ha2UtZmxpZ2h0IGIvbWFrZS1mbGlnaHQKaW5kZXggYzU0MTE0MTIu
LjAyMGFkNWYxIDEwMDc1NQotLS0gYS9tYWtlLWZsaWdodAorKysgYi9tYWtlLWZsaWdodApAQCAt
ODMzLDggKzgzMyw4IEBAIHRlc3RfbWF0cml4X2RvX29uZSAoKSB7CiAgICAgICAgICAgICAgICAg
ICAgICAgYWxsX2hvc3RmbGFncz0iJGhmIgogICAgICAgZmkKICAgICAgICMgVE9ETyBpdCB3b3Vs
ZCBiZSBuaWNlIHRvIHRlc3QgaTM4Ni0+YW1kNjQgdG9vbHMgbWlncmF0aW9uIHRvbyAoZm9yCi0g
ICAgICAjIFhlbiA+PSA0LjYpLCBidXQgY3VycmVudGx5ICRye2FyY2h9IGlzIHVzZWQgaW4gc2V2
ZXJhbCBwbGFjZXMsCi0gICAgICAjIHdoaWNoIHdvdWxkIG5lZWQgbG9va2luZyBhdC4KKyAgICAg
ICMgWGVuID49IDQuNikuICBQcmV2aW91c2x5ICRye2FyY2h9IHdhcyB1c2VkIGluIHNldmVyYWwg
cGxhY2VzLAorICAgICAgIyB3aGljaCBtYWRlIHRoaXMgbW9yZSBjb21wbGljYXRlZCwgYnV0IHRo
aXMgaXMgbm93IGZpeGVkLgogICBmaQogCiAgIGlmIFsgeCR0ZXN0X3B2aCA9IHh5IC1hICR4ZW5h
cmNoID0gYW1kNjQgLWEgJGRvbTBhcmNoID0gYW1kNjQgXTsgdGhlbgotLSAKMi4xMS4wCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
