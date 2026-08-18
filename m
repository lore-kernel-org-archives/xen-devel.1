Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECF80C5DF7E
	for <xen-devel@archiver.kernel.org>; Tue, 18 Aug 2026 12:17:02 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1394085.1632898 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwIkL-00008t-Op; Tue, 18 Aug 2026 12:16:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1394085.1632898; Tue, 18 Aug 2026 12:16:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwIkL-00008l-LT; Tue, 18 Aug 2026 12:16:49 +0000
Received: by outflank-mailman (input) for mailman id 1394085;
 Tue, 18 Aug 2026 12:16:49 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <bertrand.marquis@arm.com>) id 1wwIkK-00008f-SG
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 12:16:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwIkK-008xSv-8v
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 14:16:48 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <bertrand.marquis@arm.com>)
 id 6a844d29-8faa-0a2a0a5109dd-0a2a4506a67e-12
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 14:16:48 +0200
Received: from [217.140.110.172] (helo=foss.arm.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTP (eXpurgate 4.57.1)
 (envelope-from <bertrand.marquis@arm.com>)
 id 6a844d2e-195a-0a2a45060019-d98c6eaccede-1
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 14:16:47 +0200
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A70C514BF;
 Tue, 18 Aug 2026 05:16:42 -0700 (PDT)
Received: from C3HXLD123V.arm.com (unknown [10.57.6.159])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4A67D3F85F;
 Tue, 18 Aug 2026 05:16:45 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=foss header.d=arm.com header.i="@arm.com" header.h="From:To:Cc:Subject:Date"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787055406; bh=pV+iOjma9Ty2hBZaZWqNqKptTdOktDr+yOcJUa2WTjk=;
	h=From:To:Cc:Subject:Date:From;
	b=AKL0oE3a5XUtdijQTviDTNxbjHIM4tI1g4+vppwpm8n943XdOjepR5U27zFiOACW/
	 D0IU72ilceOd0IAvN3q+pUQ9bYp+tdxjLuNn+VJ9TOdlCzWBDIjzmxFtcNKId1hDMs
	 eHgxvRM+uBk2Qz3Nws2nGiqSaJLF31+kcYLAz2AY=
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Jens Wiklander <jenswi@kernel.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH] xen/arm: ffa: Harden SEND2 against invented loads
Date: Tue, 18 Aug 2026 14:16:32 +0200
Message-ID: <1b483ce633bfa7d304cb78458ce029370691f00c.1787055320.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1787055407-1FECC77B-09D466CA/0/0
X-purgate-type: clean
X-purgate-size: 2068

Research into compiler-invented loads has flagged FFA_MSG_SEND2 as a
possible vulnerability.

ffa_handle_msg_send2() copies the message header from the guest-writable
TX buffer before validating and using its fields. A plain structure copy
does not prevent the compiler from re-deriving later field accesses from
the live TX mapping.

For VM-to-VM messages, msg_offset and msg_size are validated against the
source and destination buffers, then used to copy the payload. If a
sibling vCPU changes the header and the compiler reloads either field,
the checked and used values can differ. This can cause an out-of-bounds
read from the sender's TX buffer or an out-of-bounds write into the
receiver's RX buffer.

The cross-VM path is gated by CONFIG_FFA_VM_TO_VM, which is disabled by
default. The audit ranks the likelihood of such a reload as low, but the
C semantics do not guarantee that later accesses use the stack copy.

Add a compiler barrier immediately after copying the header so that
validation and use consume the same snapshot.

Link: https://github.com/xoreaxeaxeax/schrodingers-toctou/blob/main/observer-effect/audits/audit-xen-tee-mediator-RELEASE-4.21.1.md#tm-2--ff-a-txrx-buffers-ffa_shmc-ffa_msgc
Fixes: 98af565b1e61 ("xen/arm: ffa: Add indirect message between VM")
Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
 xen/arch/arm/tee/ffa_msg.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/xen/arch/arm/tee/ffa_msg.c b/xen/arch/arm/tee/ffa_msg.c
index 1eadc62870f2..39f561c8237f 100644
--- a/xen/arch/arm/tee/ffa_msg.c
+++ b/xen/arch/arm/tee/ffa_msg.c
@@ -257,6 +257,11 @@ int32_t ffa_handle_msg_send2(struct cpu_user_regs *regs)
 
     /* create a copy of the message header */
     memcpy(&src_msg, tx_buf, sizeof(src_msg));
+    /*
+     * Make sure that "tx_buf" which is shared with the guest isn't accessed
+     * again after this point.
+     */
+    barrier();
 
     src_id = src_msg.send_recv_id >> 16;
     dst_id = src_msg.send_recv_id & GENMASK(15,0);
-- 
2.53.0


