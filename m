Return-Path: <SRS0=GDwr=LT=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09CEDC2B9F4
	for <xen-devel@archiver.kernel.org>; Fri, 25 Jun 2021 14:48:50 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C3D5561474
	for <xen-devel@archiver.kernel.org>; Fri, 25 Jun 2021 14:48:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C3D5561474
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.147280.271354 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwn8G-0000OJ-Sk; Fri, 25 Jun 2021 14:48:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 147280.271354; Fri, 25 Jun 2021 14:48:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwn8G-0000OC-Ns; Fri, 25 Jun 2021 14:48:36 +0000
Received: by outflank-mailman (input) for mailman id 147280;
 Fri, 25 Jun 2021 14:48:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EvRe=LT=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1lwn8F-0000O5-Do
 for xen-devel@lists.xenproject.org; Fri, 25 Jun 2021 14:48:35 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a32020a9-b58a-4680-93d1-53db3094e33d;
 Fri, 25 Jun 2021 14:48:34 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 87D6521CD8;
 Fri, 25 Jun 2021 14:48:33 +0000 (UTC)
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 58B1111A97;
 Fri, 25 Jun 2021 14:48:33 +0000 (UTC)
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id 3H1uFMHs1WBNIAAALh3uQQ
 (envelope-from <jgross@suse.com>); Fri, 25 Jun 2021 14:48:33 +0000
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
X-Inumbo-ID: a32020a9-b58a-4680-93d1-53db3094e33d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1624632513; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=aDKc2sUUuqzsaNgqaaJJMe7pZHE+SjbV9/47hMBhTNA=;
	b=LV7yM8b82FGsU+VWDq435TKFBEs5osvyYWWd4K4KoeYnkiQiS6ns8zH1wfiTb2ALEoSBcQ
	WFLhvk2BTmt8mvARqhFHsrr3cHK7gUww7VMLHG03l/H44IlJ8YqOcMJRVxWGNbVjNSs7Aw
	wZJu7LP1sWyouQ2vl4Sueiba29m/E64=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1624632513; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=aDKc2sUUuqzsaNgqaaJJMe7pZHE+SjbV9/47hMBhTNA=;
	b=LV7yM8b82FGsU+VWDq435TKFBEs5osvyYWWd4K4KoeYnkiQiS6ns8zH1wfiTb2ALEoSBcQ
	WFLhvk2BTmt8mvARqhFHsrr3cHK7gUww7VMLHG03l/H44IlJ8YqOcMJRVxWGNbVjNSs7Aw
	wZJu7LP1sWyouQ2vl4Sueiba29m/E64=
From: Juergen Gross <jgross@suse.com>
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	boris.ostrovsky@oracle.com
Subject: [GIT PULL] xen: branch for v5.13-rc8
Date: Fri, 25 Jun 2021 16:48:32 +0200
Message-Id: <20210625144832.20839-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Linus,

Please git pull the following tag:

 git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.13b-rc8-tag

xen: branch for v5.13-rc8

It contains a fix for a regression introduced in 5.12: when migrating
an irq related to a Xen user event to another cpu, a race might result
in a WARN() triggering.

Thanks.

Juergen

 drivers/xen/events/events_base.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

Juergen Gross (1):
      xen/events: reset active flag for lateeoi events later

