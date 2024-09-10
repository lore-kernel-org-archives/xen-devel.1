Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F16EEDE999
	for <xen-devel@archiver.kernel.org>; Tue, 10 Sep 2024 10:09:27 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.795233.1204462 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snxoC-00070U-Sm; Tue, 10 Sep 2024 10:09:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 795233.1204462; Tue, 10 Sep 2024 10:09:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snxoC-0006ze-ON; Tue, 10 Sep 2024 10:09:16 +0000
Received: by outflank-mailman (input) for mailman id 795233;
 Tue, 10 Sep 2024 10:09:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hUAX=QI=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1snxoB-0006in-HC
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2024 10:09:15 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id baf27d84-6f5c-11ef-99a1-01e77a169b0f;
 Tue, 10 Sep 2024 12:09:13 +0200 (CEST)
Received: from truciolo.homenet.telecomitalia.it
 (host-79-37-206-90.retail.telecomitalia.it [79.37.206.90])
 by support.bugseng.com (Postfix) with ESMTPSA id 35B174EE07BE;
 Tue, 10 Sep 2024 12:09:13 +0200 (CEST)
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
X-Inumbo-ID: baf27d84-6f5c-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1725962953; bh=5YQfn+v1XgD0I/Amiqo2ive8DffF9F/8haS4J9ZTkAs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BTOsRaZzKlNsTReQquG8z3lo4Wj+BWd7TWUGzbi60pIBVRjDffaT6XVqhBKq4c+OH
	 fH08OB5OmOcoIv7Wwhc0tZN8pmm4PV5I7sxz66SqKudTKnMgNhb4fequY18u9XAy3x
	 iDeZtYWX0D96zzm/4RJlVttLRewJDg8WozyzoSboni6ogUDoB2Xdl/j3O1pGzvXdHk
	 E7lOTmzerPuQc3wVVmTUPNjhV+jfi0/VjaQQGk9r7QiGVXnSkJKqPFWYdcSC6sP2mj
	 XJoIJ30+n8TRqwwoysPjJKv00LnUurlrMkVGde0Gwg4aceoF09Gdd9siVlDhqbTEg2
	 FclhX2rYmdTQQ==
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [XEN PATCH 02/12] x86/time: address violations of MISRA C Rule 16.3
Date: Tue, 10 Sep 2024 12:08:54 +0200
Message-Id: <cf6d83d970a99f21b90073e3583c26418c8b3b9f.1725958416.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1725958416.git.federico.serafini@bugseng.com>
References: <cover.1725958416.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Address violations of MISRA C:2012 Rule 16.3:
"An unconditional `break' statement shall terminate every
switch-clause".

No functional change.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/arch/x86/time.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/arch/x86/time.c b/xen/arch/x86/time.c
index f37300946e..d79b0a6ab9 100644
--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -1477,6 +1477,7 @@ unsigned int rtc_guest_read(unsigned int port)
 
     default:
         ASSERT_UNREACHABLE();
+        break;
     }
 
     return data;
@@ -1529,6 +1530,7 @@ void rtc_guest_write(unsigned int port, unsigned int data)
 
     default:
         ASSERT_UNREACHABLE();
+        break;
     }
 }
 
-- 
2.34.1


