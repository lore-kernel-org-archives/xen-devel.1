Return-Path: <SRS0=2fhb=FG=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 943AFC71155
	for <xen-devel@archiver.kernel.org>; Wed,  2 Dec 2020 09:22:24 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E1D622203
	for <xen-devel@archiver.kernel.org>; Wed,  2 Dec 2020 09:22:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0E1D622203
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.42503.76449 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkOKw-0002wz-8D; Wed, 02 Dec 2020 09:22:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 42503.76449; Wed, 02 Dec 2020 09:22:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkOKw-0002ws-3s; Wed, 02 Dec 2020 09:22:10 +0000
Received: by outflank-mailman (input) for mailman id 42503;
 Wed, 02 Dec 2020 09:22:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>) id 1kkOKu-0002vC-N5
 for xen-devel@lists.xenproject.org; Wed, 02 Dec 2020 09:22:08 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kkOKu-0004q2-Br; Wed, 02 Dec 2020 09:22:08 +0000
Received: from host86-183-162-145.range86-183.btcentralplus.com
 ([86.183.162.145] helo=u2f063a87eabd5f.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kkOKu-0006CD-31; Wed, 02 Dec 2020 09:22:08 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=wsUSjMIuCJSFEzqOPxy9cU/RRj5MGvZk3yge+ryDxEU=; b=6cgIRj9yLenRSlm1Lk0kmN45G8
	YduZiUpQZwQ0rsalsdiyU42/NGcjtjwRdiSDlegGMocN5ImisRx6T6vjwAwUhNyoHP8sfQkooaLBX
	HSLiX7HdBZcenn+KEyIVEILfDpM7aOHbneE2pnc64jNSlrzmMbg/cnzvYgkcbZDel1lU=;
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>,
	Wei Liu <wl@xen.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v4 01/11] viridian: don't blindly write to 32-bit registers is 'mode' is invalid
Date: Wed,  2 Dec 2020 09:21:57 +0000
Message-Id: <20201202092205.906-2-paul@xen.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201202092205.906-1-paul@xen.org>
References: <20201202092205.906-1-paul@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Paul Durrant <pdurrant@amazon.com>

If hvm_guest_x86_mode() returns something other than 8 or 4 then
viridian_hypercall() will return immediately but, on the way out, will write
back status as if 'mode' was 4. This patch simply makes it leave the registers
alone.

NOTE: The formatting of the 'out' label and the switch statement are also
      adjusted as per CODING_STYLE.

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
---
Cc: Wei Liu <wl@xen.org>
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: "Roger Pau Monné" <roger.pau@citrix.com>

v4:
 - Fixed another CODING_STYLE violation.

v2:
 - New in v2
---
 xen/arch/x86/hvm/viridian/viridian.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/hvm/viridian/viridian.c b/xen/arch/x86/hvm/viridian/viridian.c
index dc7183a54627..338e705bd29c 100644
--- a/xen/arch/x86/hvm/viridian/viridian.c
+++ b/xen/arch/x86/hvm/viridian/viridian.c
@@ -692,13 +692,15 @@ int viridian_hypercall(struct cpu_user_regs *regs)
         break;
     }
 
-out:
+ out:
     output.result = status;
-    switch (mode) {
+    switch (mode)
+    {
     case 8:
         regs->rax = output.raw;
         break;
-    default:
+
+    case 4:
         regs->rdx = output.raw >> 32;
         regs->rax = (uint32_t)output.raw;
         break;
-- 
2.20.1


