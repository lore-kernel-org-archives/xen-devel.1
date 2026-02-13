Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF224EDF144
	for <xen-devel@archiver.kernel.org>; Fri, 13 Feb 2026 10:19:45 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1230583.1536051 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqqGo-0007km-SJ; Fri, 13 Feb 2026 10:19:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1230583.1536051; Fri, 13 Feb 2026 10:19:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqqGo-0007kf-PX; Fri, 13 Feb 2026 10:19:30 +0000
Received: by outflank-mailman (input) for mailman id 1230583;
 Fri, 13 Feb 2026 10:19:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1vqqGn-0007kZ-Lj
 for xen-devel@lists.xenproject.org; Fri, 13 Feb 2026 10:19:29 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1vqqGn-006pK4-1D;
 Fri, 13 Feb 2026 10:19:29 +0000
Received: from [2a01:e0a:1da:8420:b77:bd5:6e45:7633] (helo=l14..)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1vqqGm-006GRm-21;
 Fri, 13 Feb 2026 10:19:29 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From;
	bh=OhxTuNBvsGrgpoOFLyTruEhn44xNVgI26+k4zgLjXkY=; b=FgvMcaimOz4vE30mQvOjjCy6Nc
	ShP407LFcKYVvP2V6G2owEdvIT8P6w/Z3AUlKJ3o7Ql91TuBH1f1MbYPGyOfhS10EI2hJlMj2fZfy
	V1ifsbM+9EaqfHpgpFhgN55hndCHji+/uXiwJBUTlFkF/bxTqvlLKbLIeA6dIeb4cT4k=;
From: Anthony PERARD <anthony@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH] CI: Remove `brctl` from Arch Linux container
Date: Fri, 13 Feb 2026 11:19:21 +0100
Message-ID: <20260213101921.61888-1-anthony@xenproject.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Anthony PERARD <anthony.perard@vates.tech>

Package "bridge-utils" have been removed from the official repos, it
contained `brctl`. That utility is used by network hotplug scripts,
but they already check if it is available and switch to use "iproute2"
(`ip`) when not.

Signed-off-by: Anthony PERARD <anthony.perard@vates.tech>
---
 automation/build/archlinux/current.dockerfile | 1 -
 1 file changed, 1 deletion(-)

diff --git a/automation/build/archlinux/current.dockerfile b/automation/build/archlinux/current.dockerfile
index 4e53c835fa..a257027772 100644
--- a/automation/build/archlinux/current.dockerfile
+++ b/automation/build/archlinux/current.dockerfile
@@ -6,7 +6,6 @@ LABEL maintainer.name="The Xen Project" \
 RUN pacman-key --init
 
 RUN pacman -S --refresh --sysupgrade --noconfirm --noprogressbar --needed \
-        bridge-utils \
         bzip2 \
         cpio \
         discount \
-- 
Anthony PERARD


