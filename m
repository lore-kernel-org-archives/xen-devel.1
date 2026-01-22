Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B768D3EE66
	for <xen-devel@archiver.kernel.org>; Thu, 22 Jan 2026 14:12:32 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1211096.1522628 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vivQ6-0002hd-8X; Thu, 22 Jan 2026 14:12:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1211096.1522628; Thu, 22 Jan 2026 14:12:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vivQ6-0002hW-5l; Thu, 22 Jan 2026 14:12:22 +0000
Received: by outflank-mailman (input) for mailman id 1211096;
 Thu, 22 Jan 2026 14:12:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DCSd=73=bitdefender.com=mdontu@srs-se1.protection.inumbo.net>)
 id 1vivQ4-0002hQ-Sl
 for xen-devel@lists.xenproject.org; Thu, 22 Jan 2026 14:12:20 +0000
Received: from mx-robo01.bitdefender.com (mx-robo.bitdefender.com
 [195.189.155.117]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5ccc64b5-f79c-11f0-b15e-2bf370ae4941;
 Thu, 22 Jan 2026 15:12:19 +0100 (CET)
Received: from mdontu-l.bitdefender.biz (unknown [10.22.91.150])
 by mx-robo01.bitdefender.com (Postfix) with ESMTP id 7F11CA4;
 Thu, 22 Jan 2026 16:12:18 +0200 (EET)
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
X-Inumbo-ID: 5ccc64b5-f79c-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bitdefender.com;
	s=mx-robo; t=1769091138;
	bh=Kk50ChF+yX2UTCKAMx8cwaUVuymeyydjBUGzAqwieV4=;
	h=From:To:Cc:Subject:Date:From;
	b=BidChGXg9fNijGEH5osx1WXCHtvpfuPPtROFgxxH4PhozYXKuhc64d6Mb2olqFhRh
	 av4KlJt4oaOjAmpaFF9UrAFmT+bZWGN5bgHkf0BSLtySl1tOFvlvXPB6FvUxhoO4y8
	 gTAtZTKAImHc3RuYS0BYa/kiEcFrRGTGWH37eGjY=
X-Is-Junk-Enabled: fGZTSsP0qEJE2AIKtlSuFiRRwg9xyHmJ
From: =?UTF-8?q?Mihai=20Don=C8=9Bu?= <mdontu@bitdefender.com>
To: xen-devel@lists.xenproject.org
Cc: alexandru.isaila@gmail.com,
	petrepircalabu@yahoo.com,
	=?UTF-8?q?Mihai=20Don=C8=9Bu?= <mdontu@bitdefender.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] MAINTAINERS: remove Alexandru Isaila and Petre Pircalabu as vm_event reviewers
Date: Thu, 22 Jan 2026 16:11:54 +0200
Message-ID: <43ab3051082a2f9a0291752ace7104738c1156fb.1769089923.git.mdontu@bitdefender.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Alexandru and Petre are no longer with Bitdefender.

Signed-off-by: Mihai Donțu <mdontu@bitdefender.com>
---
 MAINTAINERS | 2 --
 1 file changed, 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index bf00be928c..0ceb4bba21 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -569,8 +569,6 @@ F:	tools/
 
 VM EVENT, MEM ACCESS and MONITOR
 M:	Tamas K Lengyel <tamas@tklengyel.com>
-R:	Alexandru Isaila <aisaila@bitdefender.com>
-R:	Petre Pircalabu <ppircalabu@bitdefender.com>
 S:	Supported
 F:	tools/misc/xen-access.c
 F:	xen/arch/*/*/mem_access.c
-- 
2.52.0


