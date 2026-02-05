Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7674DEA7953
	for <xen-devel@archiver.kernel.org>; Thu,  5 Feb 2026 01:36:34 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1221353.1529638 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnoI6-0002NY-Pd; Thu, 05 Feb 2026 01:36:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1221353.1529638; Thu, 05 Feb 2026 01:36:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnoI6-0002NR-Ml; Thu, 05 Feb 2026 01:36:18 +0000
Received: by outflank-mailman (input) for mailman id 1221353;
 Thu, 05 Feb 2026 01:36:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@xen.org>) id 1vnoI5-00025u-1m
 for xen-devel@lists.xenproject.org; Thu, 05 Feb 2026 01:36:17 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1vnoI5-003wQU-06;
 Thu, 05 Feb 2026 01:36:16 +0000
Received: from [140.209.201.102] (helo=localhost)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1vnoI4-00HVXH-1g;
 Thu, 05 Feb 2026 01:36:16 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From;
	bh=V01t8A+mJ7h/gTCjHOoEQ3pd7zM8Gkx0R6n2fTb3EgQ=; b=Vq17SajWMVN+UU0/U0os2P+SNq
	HODh3cO6Rpp7W/QCtNQePQiQdqqLD4Px4w0nnJMwibiTsww3OmeoQ+BF0ZauW2mHftLMYPOMGPj6J
	ecweXR72JxhTRg9FLRCSHjdvUrgnlbKbRjEkN6VgVNB+uV4mPZzwz3Byp1Gjm2ePIocs=;
From: dmukhin@xen.org
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com,
	anthony.perard@vates.tech,
	jbeulich@suse.com,
	julien@xen.org,
	michal.orzel@amd.com,
	roger.pau@citrix.com,
	sstabellini@kernel.org,
	dmukhin@ford.com
Subject: [PATCH v5 3/6] xen/console: promote conring{,_size} to __ro_after_init
Date: Wed,  4 Feb 2026 17:36:03 -0800
Message-ID: <20260205013606.3384798-4-dmukhin@ford.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260205013606.3384798-1-dmukhin@ford.com>
References: <20260205013606.3384798-1-dmukhin@ford.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Denis Mukhin <dmukhin@ford.com> 

Both conring{,_size} should be RO after initialization is completed.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes since v4:
- new patch
---
 xen/drivers/char/console.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index 522b2f489a53..ef9131439bba 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -346,8 +346,8 @@ size_param("conring_size", opt_conring_size);
 #define _CONRING_SIZE       (1U << CONFIG_CONRING_SHIFT)
 #define CONRING_IDX_MASK(i) ((i) & (conring_size - 1))
 static char __initdata _conring[_CONRING_SIZE];
-static char *__read_mostly conring = _conring;
-static uint32_t __read_mostly conring_size = _CONRING_SIZE;
+static char *__ro_after_init conring = _conring;
+static uint32_t __ro_after_init conring_size = _CONRING_SIZE;
 static uint32_t conringc, conringp;
 
 static void cf_check conring_notify(void *unused)
-- 
2.52.0


