Return-Path: <SRS0=5Xtu=SY=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A3D8C282CE
	for <xen-devel@archiver.kernel.org>; Mon, 22 Apr 2019 16:50:19 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E6D77214AE
	for <xen-devel@archiver.kernel.org>; Mon, 22 Apr 2019 16:50:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E6D77214AE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hIc8v-000585-AA; Mon, 22 Apr 2019 16:50:09 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tD/7=SY=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hIc8t-0004xh-7J
 for xen-devel@lists.xenproject.org; Mon, 22 Apr 2019 16:50:07 +0000
X-Inumbo-ID: ae5a5d71-651e-11e9-92d7-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id ae5a5d71-651e-11e9-92d7-bc764e045a96;
 Mon, 22 Apr 2019 16:50:06 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E1096EBD;
 Mon, 22 Apr 2019 09:50:05 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D153C3F557;
 Mon, 22 Apr 2019 09:50:04 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Mon, 22 Apr 2019 17:49:28 +0100
Message-Id: <20190422164937.21350-12-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190422164937.21350-1-julien.grall@arm.com>
References: <20190422164937.21350-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH 11/20] xen/arm32: head: Don't set MAIR0 and MAIR1
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
Message-ID: <20190422164928.ILSvpJUoNA1R472pfQMNcEmmAaueqgITDBPmxFofYYg@z>

VGhlIGNvLXByb2Nlc3NvciByZWdpc3RlcnMgTUFJUjAgYW5kIE1BSVIxIGFyZSBtYW5hZ2VkIGJ5
IEVMMS4gU28gdGhlcmUKYXJlIG5vIG5lZWQgdG8gaW5pdGlhbGl6ZSB0aGVtIGR1cmluZyBYZW4g
Ym9vdC4KClNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+
Ci0tLQogeGVuL2FyY2gvYXJtL2FybTMyL2hlYWQuUyB8IDIgLS0KIDEgZmlsZSBjaGFuZ2VkLCAy
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9hcm0zMi9oZWFkLlMgYi94
ZW4vYXJjaC9hcm0vYXJtMzIvaGVhZC5TCmluZGV4IGQ0MmExMzU1NmMuLjM0NDg4MTdhYWIgMTAw
NjQ0Ci0tLSBhL3hlbi9hcmNoL2FybS9hcm0zMi9oZWFkLlMKKysrIGIveGVuL2FyY2gvYXJtL2Fy
bTMyL2hlYWQuUwpAQCAtMjEyLDggKzIxMiw2IEBAIGNwdV9pbml0X2RvbmU6CiAgICAgICAgIC8q
IFNldCB1cCBtZW1vcnkgYXR0cmlidXRlIHR5cGUgdGFibGVzICovCiAgICAgICAgIGxkciAgIHIw
LCA9TUFJUjBWQUwKICAgICAgICAgbGRyICAgcjEsID1NQUlSMVZBTAotICAgICAgICBtY3IgICBD
UDMyKHIwLCBNQUlSMCkKLSAgICAgICAgbWNyICAgQ1AzMihyMSwgTUFJUjEpCiAgICAgICAgIG1j
ciAgIENQMzIocjAsIEhNQUlSMCkKICAgICAgICAgbWNyICAgQ1AzMihyMSwgSE1BSVIxKQogCi0t
IAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
