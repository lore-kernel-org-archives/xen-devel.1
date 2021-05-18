Return-Path: <SRS0=1gSS=KN=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2118C433B4
	for <xen-devel@archiver.kernel.org>; Tue, 18 May 2021 06:19:44 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 61BB6610FA
	for <xen-devel@archiver.kernel.org>; Tue, 18 May 2021 06:19:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 61BB6610FA
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.128707.241575 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lit4f-0004rQ-3I; Tue, 18 May 2021 06:19:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 128707.241575; Tue, 18 May 2021 06:19:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lit4f-0004rJ-0D; Tue, 18 May 2021 06:19:25 +0000
Received: by outflank-mailman (input) for mailman id 128707;
 Tue, 18 May 2021 06:19:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+8gn=KN=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1lit4d-0004r5-Gb
 for xen-devel@lists.xenproject.org; Tue, 18 May 2021 06:19:23 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b2ff66ce-25e5-4b24-a9d4-6c2f2447f62d;
 Tue, 18 May 2021 06:19:21 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D0D42AEFF;
 Tue, 18 May 2021 06:19:20 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: b2ff66ce-25e5-4b24-a9d4-6c2f2447f62d
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1621318760; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=z6KF+YTRzP6/Lbt7W9Y/V0Lrtmt/kNDWUTq2Wg8gNHU=;
	b=kErWyrRD9ASwp2ZUgI2yDeV0aaMzRntC9NDH1/HVtgwTOinfw0Lmr3EjnK6QBG1mvVBVV7
	iHDszG6XSdBN+yezJY1idn/B+Ty53BENNnYM/9DqXBujf91Hn5ZS+ct6zyomMBnrWOdfKK
	zDq52J25hHLMcMZUYGeokLNlij2I6Pw=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v3 0/2] tools/xenstore: simplify xenstored main loop
Date: Tue, 18 May 2021 08:19:05 +0200
Message-Id: <20210518061907.16374-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Small series to make the main loop of xenstored more readable.

Changes in V2:
- split into two patches
- use const
- NO_SOCKETS handling

Changes in V3:
- guard extern declaration with NO_SOCKETS

Juergen Gross (2):
  tools/xenstore: move per connection read and write func hooks into a
    struct
  tools/xenstore: simplify xenstored main loop

 tools/xenstore/xenstored_core.c   | 121 ++++++++++++++----------------
 tools/xenstore/xenstored_core.h   |  23 +++---
 tools/xenstore/xenstored_domain.c |  15 +++-
 3 files changed, 81 insertions(+), 78 deletions(-)

-- 
2.26.2


