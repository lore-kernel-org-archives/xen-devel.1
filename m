Return-Path: <SRS0=hjEX=LK=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41C40C48BE6
	for <xen-devel@archiver.kernel.org>; Wed, 16 Jun 2021 14:43:43 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 06E1461042
	for <xen-devel@archiver.kernel.org>; Wed, 16 Jun 2021 14:43:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 06E1461042
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.143284.264163 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltWlU-0006Cl-Re; Wed, 16 Jun 2021 14:43:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 143284.264163; Wed, 16 Jun 2021 14:43:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltWlU-0006BQ-IP; Wed, 16 Jun 2021 14:43:36 +0000
Received: by outflank-mailman (input) for mailman id 143284;
 Wed, 16 Jun 2021 14:43:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ltWlT-00064H-Qb
 for xen-devel@lists.xenproject.org; Wed, 16 Jun 2021 14:43:35 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ltWlS-0004Do-Qy; Wed, 16 Jun 2021 14:43:34 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ltWlS-0007D0-IH; Wed, 16 Jun 2021 14:43:34 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	 bh=fKULMeUXfmVrCVmVDhYu2L9+CZLfHs4b31xT1ty4foo=; b=KXkJfhVMqSRa/+S2GRnCjEDdU
	HWFmyaOk78Yma8CB6ovb7dkMDNwYuZNUYC8WEO7NDWzue6ckQuGp7+KdibTHe0f8Qfn0fJw0+nshB
	O8l4YNMeVVboKM1Epm8CzaK1REWCwGrqTDcaCGRLnDiGRWFXZXKfxkP9dKRlsPg8TROGk=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: raphning@amazon.co.uk,
	doebel@amazon.de,
	Julien Grall <jgrall@amazon.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>
Subject: [PATCH 05/10] tools/xenstored: xenstored_core.h should include fcntl.h
Date: Wed, 16 Jun 2021 15:43:19 +0100
Message-Id: <20210616144324.31652-6-julien@xen.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210616144324.31652-1-julien@xen.org>
References: <20210616144324.31652-1-julien@xen.org>

From: Julien Grall <jgrall@amazon.com>

xenstored_core.h will consider live-udpate is not supported if
O_CLOEXEC doesn't exist. However, the header doesn't include the one
defining O_CLOEXEC (i.e. fcntl.h). This means that depending on
the header included, some source file will think Live-Update is not
supported.

I am not aware of any issue with the existing. Therefore this is just
a latent bug so far.

Prevent any potential issue by including fcntl.h in xenstored_core.h

Fixes: cd831ee438 ("tools/xenstore: handle CLOEXEC flag for local files and pipes")
Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 tools/xenstore/xenstored_core.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/xenstore/xenstored_core.h b/tools/xenstore/xenstored_core.h
index 34839b34f6e9..dac517156993 100644
--- a/tools/xenstore/xenstored_core.h
+++ b/tools/xenstore/xenstored_core.h
@@ -24,6 +24,7 @@
 
 #include <sys/types.h>
 #include <dirent.h>
+#include <fcntl.h>
 #include <stdbool.h>
 #include <stdint.h>
 #include <errno.h>
-- 
2.17.1


