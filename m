Return-Path: <SRS0=5Xtu=SY=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06297C10F11
	for <xen-devel@archiver.kernel.org>; Mon, 22 Apr 2019 16:50:29 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D4936214AE
	for <xen-devel@archiver.kernel.org>; Mon, 22 Apr 2019 16:50:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D4936214AE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hIc94-0005Rd-Vz; Mon, 22 Apr 2019 16:50:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tD/7=SY=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hIc92-0005Ne-NJ
 for xen-devel@lists.xenproject.org; Mon, 22 Apr 2019 16:50:16 +0000
X-Inumbo-ID: b3e13c88-651e-11e9-aa2e-a7481e74956a
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id b3e13c88-651e-11e9-aa2e-a7481e74956a;
 Mon, 22 Apr 2019 16:50:15 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 22EDC15AB;
 Mon, 22 Apr 2019 09:50:15 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 12FCE3F557;
 Mon, 22 Apr 2019 09:50:13 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Mon, 22 Apr 2019 17:49:35 +0100
Message-Id: <20190422164937.21350-19-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190422164937.21350-1-julien.grall@arm.com>
References: <20190422164937.21350-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH 18/20] xen/arm: mm: Check start is always before
 end in {destroy, modify}_xen_mappings
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
Message-ID: <20190422164935.zKjff-pNPorc1cwKvgaXx8GlzJs-mrOuAayIUiLpXpQ@z>

VGhlIHR3byBoZWxwZXJzIHtkZXN0cm95LCBtb2RpZnl9X3hlbl9tYXBwaW5ncyBkb24ndCBjaGVj
ayB0aGF0IHRoZQpzdGFydCBpcyBhbHdheXMgYmVmb3JlIHRoZSBlbmQuIFRoaXMgc2hvdWxkIG5l
dmVyIGhhcHBlbiBidXQgaWYgaXQKaGFwcGVucywgaXQgd2lsbCByZXN1bHQgdG8gdW5leHBlY3Rl
ZCBiZWhhdmlvci4KCkNhdGNoIHN1Y2ggaXNzdWVzIGVhcmxpZXIgb24gYnkgYWRkaW5nIGFuIEFT
U0VSVCBpbiBkZXN0cm95X3hlbl9tYXBwaW5ncwphbmQgbW9kaWZ5X3hlbl9tYXBwaW5ncy4KClNp
Z25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Ci0tLQogeGVu
L2FyY2gvYXJtL21tLmMgfCAyICsrCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpk
aWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL21tLmMgYi94ZW4vYXJjaC9hcm0vbW0uYwppbmRleCBl
ZTU0MWEzOGUzLi5kNjE1N2MzNWQ2IDEwMDY0NAotLS0gYS94ZW4vYXJjaC9hcm0vbW0uYworKysg
Yi94ZW4vYXJjaC9hcm0vbW0uYwpAQCAtMTA3MiwxMSArMTA3MiwxMyBAQCBpbnQgcG9wdWxhdGVf
cHRfcmFuZ2UodW5zaWduZWQgbG9uZyB2aXJ0LCB1bnNpZ25lZCBsb25nIG5yX21mbnMpCiAKIGlu
dCBkZXN0cm95X3hlbl9tYXBwaW5ncyh1bnNpZ25lZCBsb25nIHYsIHVuc2lnbmVkIGxvbmcgZSkK
IHsKKyAgICBBU1NFUlQodiA8PSBlKTsKICAgICByZXR1cm4gY3JlYXRlX3hlbl9lbnRyaWVzKFJF
TU9WRSwgdiwgSU5WQUxJRF9NRk4sIChlIC0gdikgPj4gUEFHRV9TSElGVCwgMCk7CiB9CiAKIGlu
dCBtb2RpZnlfeGVuX21hcHBpbmdzKHVuc2lnbmVkIGxvbmcgcywgdW5zaWduZWQgbG9uZyBlLCB1
bnNpZ25lZCBpbnQgZmxhZ3MpCiB7CisgICAgQVNTRVJUKHMgPD0gZSk7CiAgICAgcmV0dXJuIGNy
ZWF0ZV94ZW5fZW50cmllcyhNT0RJRlksIHMsIElOVkFMSURfTUZOLCAoZSAtIHMpID4+IFBBR0Vf
U0hJRlQsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBmbGFncyk7CiB9Ci0tIAoyLjEx
LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
