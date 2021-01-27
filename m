Return-Path: <SRS0=2Mj5=G6=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BE84C433DB
	for <xen-devel@archiver.kernel.org>; Wed, 27 Jan 2021 16:17:28 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3338B207A0
	for <xen-devel@archiver.kernel.org>; Wed, 27 Jan 2021 16:17:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3338B207A0
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.76241.137495 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4nVN-0007qq-4L; Wed, 27 Jan 2021 16:17:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 76241.137495; Wed, 27 Jan 2021 16:17:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4nVN-0007qj-1K; Wed, 27 Jan 2021 16:17:17 +0000
Received: by outflank-mailman (input) for mailman id 76241;
 Wed, 27 Jan 2021 16:17:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rFzC=G6=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1l4nVL-0007qL-AP
 for xen-devel@lists.xenproject.org; Wed, 27 Jan 2021 16:17:15 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6f0b0ddb-4458-4e47-aec4-bab22c8e630b;
 Wed, 27 Jan 2021 16:17:14 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C04D4AAC6;
 Wed, 27 Jan 2021 16:17:13 +0000 (UTC)
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
X-Inumbo-ID: 6f0b0ddb-4458-4e47-aec4-bab22c8e630b
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611764233; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=8QWPF32PMzIYm1r3Dt8qTK+es988J3qaXFRz72Bpmrg=;
	b=jsb+No49HmKyqYxekqzgze588QBZcOdMM0/HNkowE+R6jS+29ezSOvJDTGThdDcdXC2aQu
	/iD1+/bn/sCRcaezFQDlboz6ccPKHhQf1nuSrPfC7litvAX3sBQNY8KEWengz6kpBsptsx
	yY+5dLAD0ySW7G+CpQfgRpNXlFYSk/g=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] MAINTAINERS: fix entry for LIBXENLIGHT
Date: Wed, 27 Jan 2021 17:17:11 +0100
Message-Id: <20210127161711.24005-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When splitting libxl into libs/light and libs/util the related
MAINTAINERS entry was modified in a wrong way.

Reported-by: Jan Beulich <jbeulich@suse.com>
Fixes: 032a96e5ef38f96 ("maintainers: fix libxl paths")
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 14240e8e1e..8ce2ad5187 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -363,8 +363,8 @@ M:	Ian Jackson <iwj@xenproject.org>
 M:	Wei Liu <wl@xen.org>
 M:	Anthony PERARD <anthony.perard@citrix.com>
 S:	Supported
-F:	tools/libs/guest/
 F:	tools/libs/light/
+F:	tools/libs/util/
 F:	tools/xl/
 
 LIVEPATCH
-- 
2.26.2


