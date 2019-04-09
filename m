Return-Path: <SRS0=7ods=SL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1261DC10F13
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 03:13:14 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF2FC20880
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 03:13:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DF2FC20880
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hDhBy-0006lU-MU; Tue, 09 Apr 2019 03:12:58 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=nMgv=SL=citrix.com=prvs=995126bee=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1hDhBw-0006l1-R1
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2019 03:12:56 +0000
X-Inumbo-ID: 5e26c32d-5a75-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 5e26c32d-5a75-11e9-92d7-bc764e045a96;
 Tue, 09 Apr 2019 03:12:55 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,327,1549929600"; d="scan'208";a="83070517"
From: Igor Druzhinin <igor.druzhinin@citrix.com>
To: <edk2-devel@lists.01.org>
Date: Tue, 9 Apr 2019 04:12:37 +0100
Message-ID: <1554779560-26204-1-git-send-email-igor.druzhinin@citrix.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 0/3] Xen PCI passthrough fixes
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
Message-ID: <20190409031237.fRF9PEyjxydag1NpR8TTKXFf0jpaDtsei_o_-2yTfdw@z>

SWdvciBEcnV6aGluaW4gKDMpOgogIE92bWZQa2cvWGVuU3VwcG9ydDogcmVtb3ZlIHVzYWdlIG9m
IHByZWZldGNoYWJsZSBQQ0kgaG9zdCBicmlkZ2UKICAgIGFwZXJ0dXJlCiAgT3ZtZlBrZy9YZW5T
dXBwb3J0OiB1c2UgYSBjb3JyZWN0IFBDSSBob3N0IGJyaWRnZSBhcGVydHVyZSBmb3IgQkFSNjQK
ICBPdm1mUGtnL1hlblN1cHBvcnQ6IHR1cm4gb2ZmIGFkZHJlc3MgZGVjb2RpbmcgYmVmb3JlIEJB
UiBzaXppbmcKCiBPdm1mUGtnL0xpYnJhcnkvUGNpSG9zdEJyaWRnZUxpYi9YZW5TdXBwb3J0LmMg
fCA0NCArKysrKysrKysrKysrKysrKysrKysrLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAzNyBpbnNl
cnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQoKLS0gCjIuNy40CgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
