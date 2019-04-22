Return-Path: <SRS0=5Xtu=SY=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8993C10F11
	for <xen-devel@archiver.kernel.org>; Mon, 22 Apr 2019 16:50:21 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A42EB214AE
	for <xen-devel@archiver.kernel.org>; Mon, 22 Apr 2019 16:50:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A42EB214AE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hIc8x-0005E4-6Q; Mon, 22 Apr 2019 16:50:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tD/7=SY=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hIc8v-000591-VL
 for xen-devel@lists.xenproject.org; Mon, 22 Apr 2019 16:50:09 +0000
X-Inumbo-ID: b0009bfe-651e-11e9-8219-37847f238d1e
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id b0009bfe-651e-11e9-8219-37847f238d1e;
 Mon, 22 Apr 2019 16:50:08 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 875D7374;
 Mon, 22 Apr 2019 09:50:08 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 77F3E3F557;
 Mon, 22 Apr 2019 09:50:07 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Mon, 22 Apr 2019 17:49:30 +0100
Message-Id: <20190422164937.21350-14-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190422164937.21350-1-julien.grall@arm.com>
References: <20190422164937.21350-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH 13/20] xen/arm32: mm: Avoid to zero and clean
 cache for CPU0 domheap
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
Message-ID: <20190422164930.tDA5SErAAxiahjuI9DsUWxB0NrHaUEwOrq2ydPm98uI@z>

VGhlIHBhZ2UtdGFibGUgd2Fsa2VyIGlzIGNvbmZpZ3VyZWQgdG8gdXNlIHRoZSBzYW1lIHNoYXJl
YWJpbGl0eSBhbmQKY2FjaGVhYmlsaXR5IGFzIHRoZSBhY2Nlc3MgcGVyZm9ybWVkIHdoZW4gdXBk
YXRpbmcgdGhlIHBhZ2UtdGFibGVzLiBUaGlzCm1lYW5zIGNsZWFuaW5nIHRoZSBjYWNoZSBmb3Ig
Q1BVMCBkb21oZWFwIGlzIHVubmVjZXNzYXJ5LgoKRnVydGhlcm1vcmUsIENQVTAgcGFnZS10YWJs
ZXMgYXJlIHBhcnQgb2YgWGVuIGJpbmFyeSBhbmQgd2lsbCBhbHJlYWR5IGJlCnplcm9lZCBiZWZv
cmVoYW5kLiBTbyBpdCBpcyBwb2ludGxlc3MgdG8gemVybyB0aGUgZG9taGVhcCBhZ2Fpbi4KClNp
Z25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Ci0tLQogeGVu
L2FyY2gvYXJtL21tLmMgfCA1IC0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNSBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vbW0uYyBiL3hlbi9hcmNoL2FybS9tbS5jCmluZGV4
IGUwOTBhZmI5NzYuLmNkYTI4NDdkMDAgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL2FybS9tbS5jCisr
KyBiL3hlbi9hcmNoL2FybS9tbS5jCkBAIC03MjQsMTEgKzcyNCw2IEBAIHZvaWQgX19pbml0IHNl
dHVwX3BhZ2V0YWJsZXModW5zaWduZWQgbG9uZyBib290X3BoeXNfb2Zmc2V0KQogI2lmZGVmIENP
TkZJR19BUk1fMzIKICAgICBwZXJfY3B1KHhlbl9wZ3RhYmxlLCAwKSA9IGNwdTBfcGd0YWJsZTsK
ICAgICBwZXJfY3B1KHhlbl9kb21tYXAsIDApID0gY3B1MF9kb21tYXA7Ci0KLSAgICAvKiBNYWtl
IHN1cmUgaXQgaXMgY2xlYXIgKi8KLSAgICBtZW1zZXQodGhpc19jcHUoeGVuX2RvbW1hcCksIDAs
IERPTUhFQVBfU0VDT05EX1BBR0VTKlBBR0VfU0laRSk7Ci0gICAgY2xlYW5fZGNhY2hlX3ZhX3Jh
bmdlKHRoaXNfY3B1KHhlbl9kb21tYXApLAotICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
RE9NSEVBUF9TRUNPTkRfUEFHRVMqUEFHRV9TSVpFKTsKICNlbmRpZgogfQogCi0tIAoyLjExLjAK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
