Return-Path: <SRS0=i/8b=MW=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E038C4320A
	for <xen-devel@archiver.kernel.org>; Fri, 30 Jul 2021 12:27:19 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 36CBA6103B
	for <xen-devel@archiver.kernel.org>; Fri, 30 Jul 2021 12:27:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 36CBA6103B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.162518.298039 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m9RbV-0004xG-S5; Fri, 30 Jul 2021 12:27:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 162518.298039; Fri, 30 Jul 2021 12:27:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m9RbV-0004x8-OF; Fri, 30 Jul 2021 12:27:05 +0000
Received: by outflank-mailman (input) for mailman id 162518;
 Fri, 30 Jul 2021 12:27:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MkAV=MW=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1m9RbV-0004PS-5J
 for xen-devel@lists.xenproject.org; Fri, 30 Jul 2021 12:27:05 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 794644bc-92da-4584-b995-127eed0518aa;
 Fri, 30 Jul 2021 12:26:59 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 7FBB91FDE6;
 Fri, 30 Jul 2021 12:26:58 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 34345137F9;
 Fri, 30 Jul 2021 12:26:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id N2fkCBLwA2FOVgAAGKfGzw
 (envelope-from <jgross@suse.com>); Fri, 30 Jul 2021 12:26:58 +0000
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
X-Inumbo-ID: 794644bc-92da-4584-b995-127eed0518aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1627648018; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=LWzZkVzQMh0+aoBZBkmzQk3xk4z+Q2z4JMszPPOibOw=;
	b=WYl6cpBGp0twcPJ92td+t21lQeb0WVu5lO6+TuWJTP8yPjMtMqhOsZBF+Xz4EB96l/4ZYq
	HA/kYLx6ZGaJG5Yov2l3TwpGmGQjiQaoabFacepJTB+0l/ZDzScwmLduJYsXkt+VszDcUQ
	5NHI0NjiR++DrpWR1UTXTjQOBGiGPtY=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Juergen Gross <jgross@suse.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v3 0/2] tools/xenstore: set resource limits of xenstored
Date: Fri, 30 Jul 2021 14:26:41 +0200
Message-Id: <20210730122643.2043-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Set some limits for xenstored in order to avoid it being killed by
OOM killer, or to run out of file descriptors.

Changes in V3:
- make oom score configurable

Changes in V2:
- split into 2 patches
- set limits from start script

Juergen Gross (2):
  tools/xenstore: set oom score for xenstore daemon on Linux
  tools/xenstore: set open file descriptor limit for xenstored

 tools/hotplug/Linux/init.d/sysconfig.xencommons.in | 14 ++++++++++++++
 tools/hotplug/Linux/launch-xenstore.in             |  9 +++++++++
 2 files changed, 23 insertions(+)

-- 
2.26.2


