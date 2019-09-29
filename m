Return-Path: <SRS0=EKNO=XY=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65E69C4360C
	for <xen-devel@archiver.kernel.org>; Sun, 29 Sep 2019 16:35:36 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 39163217F5
	for <xen-devel@archiver.kernel.org>; Sun, 29 Sep 2019 16:35:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 39163217F5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iEcAL-0006HU-Nd; Sun, 29 Sep 2019 16:35:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=kiTL=XY=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iEcAJ-0006HP-TM
 for xen-devel@lists.xenproject.org; Sun, 29 Sep 2019 16:35:19 +0000
X-Inumbo-ID: 1de297fe-e2d7-11e9-bf31-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by localhost (Halon) with ESMTP
 id 1de297fe-e2d7-11e9-bf31-bc764e2007e4;
 Sun, 29 Sep 2019 16:35:16 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 78C851000;
 Sun, 29 Sep 2019 09:35:15 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9FC933F706;
 Sun, 29 Sep 2019 09:35:14 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Sun, 29 Sep 2019 17:35:10 +0100
Message-Id: <20190929163510.15688-1-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
Subject: [Xen-devel] [PATCH for-4.13] xen/arm: p2m: Fix typo in the comment
 on top of P2M_ROOT_LEVEL
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
Cc: jgross@suse.com, Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KLS0tCiB4
ZW4vYXJjaC9hcm0vcDJtLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vcDJtLmMgYi94ZW4vYXJj
aC9hcm0vcDJtLmMKaW5kZXggNWZmNmNlMTVmNi4uNGE0MjlkYzFiZSAxMDA2NDQKLS0tIGEveGVu
L2FyY2gvYXJtL3AybS5jCisrKyBiL3hlbi9hcmNoL2FybS9wMm0uYwpAQCAtMjUsNyArMjUsNyBA
QCBzdGF0aWMgdW5zaWduZWQgaW50IF9fcmVhZF9tb3N0bHkgbWF4X3ZtaWQgPSBNQVhfVk1JRF84
X0JJVDsKIC8qIFZNSUQgaXMgYnkgZGVmYXVsdCA4IGJpdCB3aWR0aCBvbiBBQXJjaDY0ICovCiAj
ZGVmaW5lIE1BWF9WTUlEICAgICAgIG1heF92bWlkCiAjZWxzZQotLyogRmlyc3QgbGV2ZWwgUDJN
IGlzIGFsd2F5IDIgY29uc2VjdXRpdmUgcGFnZXMgKi8KKy8qIEZpcnN0IGxldmVsIFAyTSBpcyBh
bHdheXMgMiBjb25zZWN1dGl2ZSBwYWdlcyAqLwogI2RlZmluZSBQMk1fUk9PVF9MRVZFTCAxCiAj
ZGVmaW5lIFAyTV9ST09UX09SREVSICAgIDEKIC8qIFZNSUQgaXMgYWx3YXlzIDggYml0IHdpZHRo
IG9uIEFBcmNoMzIgKi8KLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
