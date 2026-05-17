Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0A94CD4F3C
	for <xen-devel@archiver.kernel.org>; Mon, 18 May 2026 04:47:28 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1311348.1581559 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wOpsp-0003yn-Oj; Mon, 18 May 2026 04:47:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1311348.1581559; Mon, 18 May 2026 04:47:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wOpsp-0003yg-Le; Mon, 18 May 2026 04:47:15 +0000
Received: by outflank-mailman (input) for mailman id 1311348;
 Sun, 17 May 2026 19:44:59 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gabi.qs.mail@gmail.com>) id 1wOhQ3-0001vx-Hn
 for xen-devel@lists.xenproject.org; Sun, 17 May 2026 19:44:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wOhQ2-00Bwks-UA
 for xen-devel@lists.xenproject.org; Sun, 17 May 2026 21:44:58 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <gabi.qs.mail@gmail.com>)
 id 6a0a1a8c-2eae-0a2a0a5409dd-0a2a450ab15e-10
 for <xen-devel@lists.xenproject.org>; Sun, 17 May 2026 21:44:58 +0200
Received: from [209.85.221.46] (helo=mail-wr1-f46.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <gabi.qs.mail@gmail.com>)
 id 6a0a1aba-56b3-0a2a450a0019-d155dd2ed925-3
 for <xen-devel@lists.xenproject.org>; Sun, 17 May 2026 21:44:58 +0200
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-43fe62837baso748767f8f.3
 for <xen-devel@lists.xenproject.org>; Sun, 17 May 2026 12:44:58 -0700 (PDT)
Received: from fedora ([212.231.230.22]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45da0a17a22sm32610761f8f.22.2026.05.17.12.44.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 May 2026 12:44:57 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779047098; x=1779651898; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OF+u0pee6OdXPZyMSBKxZwEOVfRLtT3PPpeO+Uq+LEs=;
        b=Fs5Wc6k6DLkLQqLurciFXHf4d1lQQJPry1b9HPqunK0FE0ajTIJRgI8mBzpK/hmQdN
         KXeQvPDLTN++8DKG7baag9jH5nhKblmyEmqmKn6U/fiBx+jy1NfuadA9QuFMsT4t12ij
         DqS/kiifet4+wGfdABVvRSfYW89eJT3Gf77e+Vl3uKW7wndSUqt+EO3qpmHvpX2ZX+td
         br75u2fo6CRierlD33nEAZ7HTErlQYwACr9XK9l+gi+TX8o9BA4v6JQVUZM9ZjaAkuN8
         fAEKbhsQPioC2PW1VL5jiaY8Ycj1odluXC79TDyc9eTJapsz9Wb7uaGUbyYC/0E2zxlZ
         5pRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779047098; x=1779651898;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OF+u0pee6OdXPZyMSBKxZwEOVfRLtT3PPpeO+Uq+LEs=;
        b=SLMoJIa9HEl4rJkUW7ROLmFyev9RZYcZkpXG0TeRoAIbhOMQMlGAXYuYnEJjWJ5PaZ
         rXOATWRhhdmpM/7BWZhEMXjzy+u6JLVQL6fT50wdHjXyokC6fOZL8AsFR7ggJnoo89dQ
         Ef8i7+s7Ygm9flrkcxFZ0784Vpspc7mH5HljNmfEINPAw8qNwSJRzlS0t3ZpogHZHEpg
         3ulximRfsfm3F6Dwq6fEGKfWDjaiurXlAezo++9fmfUl9Lb4lgwO4Lngs/JZCzBkDBoX
         RsvA81ryWyuy6aB758DjhbnHb/Di1/dQLm/qfoirbEOLm9yv6HTbJZE3vtuIZi6irUMe
         v0HA==
X-Gm-Message-State: AOJu0Yw0qhMOecLqF+ClgTkkIxMCHSOO3Sv2mCBSe7uB76FPSJPoKaGn
	L1t+ZcsTTDm05o4x6RtB2dbNi1t21lReV6dp1+7XqNgFdRUZYo2IwmG+Hh/jpLbHNBk=
X-Gm-Gg: Acq92OFO7dKJr3GPXkgu5QtwW2A+6ZWvndyPNQczGKCO/UGi2Grj4GwCVp3GfQ5mKqW
	0yAZoQhxjuE8X2L1VrU30kEwiXQ4VvlqjhoXZmk2K+5J/iaEe029Ll3OlxmZWEyW6dhMRFQmW2F
	RxoZ6Ig1bT3acLm1YVXToZTLdydwukxHuqdyUb0jhQGs+2kf0r+6Fb206MLH+G01OY4/QXALlZ4
	RYQQpgJC4/LxMEMLQEFfZUtWEj397YJt4YB/8acUhzDkIJINm12nFr62dwE9oW2DccvGbVrgiL2
	2Mq7shez/tq39f6MgF29OgoOdPidsVwM3N2oFzX7jirTRbTNG98xEhivVkkThsK6y5lAmjYfZZD
	FSYpOIHIpAu8twzzYTWtD6UZOV0cXgZPjXDGRwPskYPS8gpXRjU4BPnmpEDxGRY8EaX4NNTxM5+
	pyZEuqj2lgkPbayBGlituCdWnSK7G7P9s=
X-Received: by 2002:a5d:584c:0:b0:45d:4020:8b59 with SMTP id ffacd0b85a97d-45e5c5877admr18849791f8f.24.1779047098207;
        Sun, 17 May 2026 12:44:58 -0700 (PDT)
From: =?UTF-8?q?Gabriel=20Quint=C3=A1ns=20Souto?= <gabi.qs.mail@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	julien@xen.org,
	bertrand.marquis@arm.com,
	michal.orzel@amd.com,
	=?UTF-8?q?Gabriel=20Quint=C3=A1ns=20Souto?= <gabi.qs.mail@gmail.com>
Subject: [PATCH] arm64/mmu: Fix PT_PT table descriptor value and comment
Date: Sun, 17 May 2026 21:44:43 +0200
Message-ID: <20260517194443.59134-1-gabi.qs.mail@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1779047098-7C8788B7-2F081F06/0/0
X-purgate-type: clean
X-purgate-size: 1746

PT_PT is used to create table descriptors in create_table_entry_from_paddr.
The previous value (0xf7f) and comment incorrectly included attribute fields
(nG, SH, AP, NS, ATTR) that only exist in block/page descriptors, not in
table descriptors.

Per the ARMv8-A Architecture Reference Manual (DDI0487, Section D8.3.1),
table descriptors only define:
  - Bits [63:12]: Next-level table address
  - Bit [11]: Ignored
  - Bit [10]: AF (Access Flag, ARMv8.1+)
  - Bits [9:2]: Ignored or reserved for extensions
  - Bit [1]: Descriptor type (1 = Table)
  - Bit [0]: Valid bit (1 = Valid)

Update to 0x743 with only the relevant bits set:
  - Bit [10]: AF (Access Flag, ARMv8.1+)
  - Bits [9:8]: Reserved/extension bits
  - Bit [6]: SKL (ARMv9)
  - Bits [5:2]: Cleared (ignored by hardware)
  - Bit [1]: Table descriptor type
  - Bit [0]: Valid

Compile-tested and boot-tested in QEMU ARM64 (virt machine, cortex-a57).

Signed-off-by: Gabriel Quintáns Souto <gabi.qs.mail@gmail.com>
---
 xen/arch/arm/arm64/mmu/head.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/arm/arm64/mmu/head.S b/xen/arch/arm/arm64/mmu/head.S
index d14780ad19..c3cb262e88 100644
--- a/xen/arch/arm/arm64/mmu/head.S
+++ b/xen/arch/arm/arm64/mmu/head.S
@@ -8,7 +8,7 @@
 #include <asm/page.h>
 #include <asm/early_printk.h>
 
-#define PT_PT     0xf7f /* nG=1 AF=1 SH=11 AP=01 NS=1 ATTR=111 T=1 P=1 */
+#define PT_PT     0x743 /* AF=1 RES=11 SKL=1 IGN=0000 T=1 P=1 */
 #define PT_MEM    0xf7d /* nG=1 AF=1 SH=11 AP=01 NS=1 ATTR=111 T=0 P=1 */
 #define PT_MEM_L3 0xf7f /* nG=1 AF=1 SH=11 AP=01 NS=1 ATTR=111 T=1 P=1 */
 #define PT_DEV    0xe71 /* nG=1 AF=1 SH=10 AP=01 NS=1 ATTR=100 T=0 P=1 */
-- 
2.53.0


