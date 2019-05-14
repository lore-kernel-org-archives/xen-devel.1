Return-Path: <SRS0=qwBA=TO=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6C30C04AB4
	for <xen-devel@archiver.kernel.org>; Tue, 14 May 2019 12:22:26 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 93E0320850
	for <xen-devel@archiver.kernel.org>; Tue, 14 May 2019 12:22:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 93E0320850
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQWRj-0000BL-4S; Tue, 14 May 2019 12:22:15 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zxYt=TO=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hQWRh-00007X-3N
 for xen-devel@lists.xenproject.org; Tue, 14 May 2019 12:22:13 +0000
X-Inumbo-ID: e6741eb8-7642-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id e6741eb8-7642-11e9-8980-bc764e045a96;
 Tue, 14 May 2019 12:22:11 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A4EE315AB;
 Tue, 14 May 2019 05:22:11 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 71D213F71E;
 Tue, 14 May 2019 05:22:10 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 14 May 2019 13:21:28 +0100
Message-Id: <20190514122136.28215-20-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190514122136.28215-1-julien.grall@arm.com>
References: <20190514122136.28215-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH MM-PART2 v2 11/19] xen/arm32: head: Don't set
 MAIR0 and MAIR1
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
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrii Anisov <andrii_anisov@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190514122128.S9hXTPpzkylXrv6StszRLwGzBvEQqx-tFKbL-N7tcOs@z>

VGhlIGNvLXByb2Nlc3NvciByZWdpc3RlcnMgTUFJUjAgYW5kIE1BSVIxIGFyZSBtYW5hZ2VkIGJ5
IEVMMS4gU28gdGhlcmUKYXJlIG5vIG5lZWQgdG8gaW5pdGlhbGl6ZSB0aGVtIGR1cmluZyBYZW4g
Ym9vdC4KClNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+
ClJldmlld2VkLWJ5OiBBbmRyaWkgQW5pc292IDxhbmRyaWlfYW5pc292QGVwYW0uY29tPgoKLS0t
CiAgICBDaGFuZ2VzIGluIHYyCiAgICAgICAgLSBBZGQgQW5kcmlpJ3MgcmV2aWV3ZWQtYnkKLS0t
CiB4ZW4vYXJjaC9hcm0vYXJtMzIvaGVhZC5TIHwgMiAtLQogMSBmaWxlIGNoYW5nZWQsIDIgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2FybTMyL2hlYWQuUyBiL3hlbi9h
cmNoL2FybS9hcm0zMi9oZWFkLlMKaW5kZXggZDQyYTEzNTU2Yy4uMzQ0ODgxN2FhYiAxMDA2NDQK
LS0tIGEveGVuL2FyY2gvYXJtL2FybTMyL2hlYWQuUworKysgYi94ZW4vYXJjaC9hcm0vYXJtMzIv
aGVhZC5TCkBAIC0yMTIsOCArMjEyLDYgQEAgY3B1X2luaXRfZG9uZToKICAgICAgICAgLyogU2V0
IHVwIG1lbW9yeSBhdHRyaWJ1dGUgdHlwZSB0YWJsZXMgKi8KICAgICAgICAgbGRyICAgcjAsID1N
QUlSMFZBTAogICAgICAgICBsZHIgICByMSwgPU1BSVIxVkFMCi0gICAgICAgIG1jciAgIENQMzIo
cjAsIE1BSVIwKQotICAgICAgICBtY3IgICBDUDMyKHIxLCBNQUlSMSkKICAgICAgICAgbWNyICAg
Q1AzMihyMCwgSE1BSVIwKQogICAgICAgICBtY3IgICBDUDMyKHIxLCBITUFJUjEpCiAKLS0gCjIu
MTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
