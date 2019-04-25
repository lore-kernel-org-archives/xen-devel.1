Return-Path: <SRS0=w6oi=S3=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BC92C43218
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 20:24:46 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AAD3E206BF
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 20:24:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AAD3E206BF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hJkuz-0001Iz-9b; Thu, 25 Apr 2019 20:24:29 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tBju=S3=citrix.com=prvs=011b478a6=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1hJkux-0001IU-LR
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2019 20:24:27 +0000
X-Inumbo-ID: 1e40da25-6798-11e9-843c-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 1e40da25-6798-11e9-843c-bc764e045a96;
 Thu, 25 Apr 2019 20:24:25 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,394,1549929600"; d="scan'208";a="84450964"
From: Igor Druzhinin <igor.druzhinin@citrix.com>
To: <devel@edk2.groups.io>
Date: Thu, 25 Apr 2019 21:23:55 +0100
Message-ID: <1556223838-5176-1-git-send-email-igor.druzhinin@citrix.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 0/3] Xen PCI passthrough fixes
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
Cc: Igor Druzhinin <igor.druzhinin@citrix.com>, ard.biesheuvel@linaro.org,
 jordan.l.justen@intel.com, julien.grall@arm.com, anthony.perard@citrix.com,
 xen-devel@lists.xenproject.org, lersek@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190425202355.p30RkuhnPNQMv2aRcFyBbgDnfB9KjAVP5ULR-m35EEI@z>

SWdvciBEcnV6aGluaW4gKDMpOgogIE92bWZQa2cvWGVuU3VwcG9ydDogcmVtb3ZlIHVzYWdlIG9m
IHByZWZldGNoYWJsZSBQQ0kgaG9zdCBicmlkZ2UKICAgIGFwZXJ0dXJlCiAgT3ZtZlBrZy9YZW5T
dXBwb3J0OiB1c2UgYSBjb3JyZWN0IFBDSSBob3N0IGJyaWRnZSBhcGVydHVyZSBmb3IgQkFSNjQK
ICBPdm1mUGtnL1hlblN1cHBvcnQ6IHR1cm4gb2ZmIGFkZHJlc3MgZGVjb2RpbmcgYmVmb3JlIEJB
UiBzaXppbmcKCiBPdm1mUGtnL0xpYnJhcnkvUGNpSG9zdEJyaWRnZUxpYi9YZW5TdXBwb3J0LmMg
fCA1MyArKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAzNCBpbnNl
cnRpb25zKCspLCAxOSBkZWxldGlvbnMoLSkKCi0tIAoyLjcuNAoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
