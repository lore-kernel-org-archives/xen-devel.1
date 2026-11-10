Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B6C1606B177
	for <xen-devel@archiver.kernel.org>; Tue, 10 Nov 2026 09:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DsqIsoR7
Received: from list by lists.xenproject.org with outflank-mailman.1481337.1685193 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQi94-0000Zm-W0; Tue, 10 Nov 2026 09:28:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1481337.1685193; Tue, 10 Nov 2026 09:28:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQi94-0000Zf-Sx; Tue, 10 Nov 2026 09:28:02 +0000
Received: by outflank-mailman (input) for mailman id 1481337;
 Tue, 10 Nov 2026 09:28:02 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xQi94-0000YC-4N
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 09:28:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQi93-00A1p8-HS
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 10:28:01 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6af2e39d-e002-0a2a0a5209dd-0a2a4504c7f0-30
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 10:28:01 +0100
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6af2e3a1-b57f-0a2a45040019-d1558035e42c-3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 10:28:01 +0100
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4a35a60499eso13516905e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 01:28:01 -0800 (PST)
Received: from fedora (user-109-243-65-71.play-internet.pl. [109.243.65.71])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-498363dffa1sm3882707f8f.39.2026.11.10.01.27.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2026 01:28:00 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794302881; x=1794907681; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4zkZAoXuaBBe6Etqq8DDltKmfT5pWjnKH2p29QeZ5Os=;
        b=DsqIsoR7kdH5luE1t5YgGOuUA0MB7Df4gI30V7aKIWoaM4T0VR+JOq8KVvueo8x4mA
         Hkq1YcACGNEstqB/UQyBUezZqyLC5SJWh2hyznWRyT/eCMKdlFoylmvpuBX9KAG9u4GY
         yE2snPIRxegwQIcD3byGcUh6TzGTy98XxiHN7WtuWZn23fIvMM4bjibkS4fk56TK/iEP
         BnUq/s8h5KGBB6g5yUFzCzOTzW3lcMeWibz/LgmXJFzDnlXwpIuQ4JEPBtxbw0p19Fm/
         NWj0Fx2dxWJYJGFIa0VXma/HwgFHc/QMquliQHPTqN/Dbm7ebdcQZ64+7uEP+PeJ8q6k
         r/Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794302881; x=1794907681;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4zkZAoXuaBBe6Etqq8DDltKmfT5pWjnKH2p29QeZ5Os=;
        b=WECO7g8J+DR4w4JtpeynpnrJpcF7Z7ViHRT9QLBw8uTLD1tNeAZSLIhT5Udt5SiEoW
         3NvpLz6BN0S1ZwQ8DtzRBibesznjfXMxIrH/YiOOHZ18gcDzpej5Gx1cfq+ElwkKFJ/9
         Xm1C1uE56xoaeUyVBGiQLYiNmrr3R3IGFkofFLR7chfdAoy/6ExsxI/9f41g8Nb30eIR
         Xgy77v1fbpqaIkvVAT1Wm+L9VHi7dMaKpV8864AIz+X2WJ+FJHSBItP2SF3yV402J5+B
         Q07xMXv7qBHzWioRH9boESFvt/7bA/Vpjit0qJ/hn8rDhPB3oYClL7GqGBzJPPUWZ+JF
         Bx+g==
X-Gm-Message-State: APuU4Z8nYFj1auTYfiHtPi6d+rlD7Jc4ilcJ/MJtZQ6cFf1XQ3UEUTg2
	EQ5qM5e9Cg9uNs+96/e0LgnDdJlo6AP/5R1rem1sqSFwENuV65btMDUlEHyQZA==
X-Gm-Gg: AYBFou0/LQ2yg7yr8jADWsyzV5Qdvt5I4e7qPNBIP/qo8SICpydAwZH7prTB3RL5yYc
	paznk/R8dpIZsAtf4P8Ix+/0t09EUB3D1CSll6Uf7QzfC/6AB3GitlOIMvO5lpQ4nNKLA5bw7ru
	VZJfj+7/4g+6/f57rKWN9bq1cXw65uRJ9sI8kkd31nFzUEAxodqP+tHOhZpvebjpachEPQplN13
	vIk97f3O6LJw89kkYOXiTSyQTAfX6EgrTTuo5IAeJFI/reKFd2dpPww2OzPvXZ8eXlKKPUMsk3b
	zB5xFxNtkJ/I2BWhP6xuII+bf7MYZjvfjxuFUYoqPqqhIVuzi2occmr2wL81uro5RZyy8SYLdIR
	5KQZHR357ARnZrE2nw5t7vbbB6U6QzvmdAS9TINqV5hxnphAbk6LZFlk4ljePdKZpDcgm8iaGM1
	FAqmBK9aF4YQlK0t0GYD3BV5R2zGq5GeGuMDfd2gR+7XGU1eJOJFNP7YxPA8yFLTF6Klt9Q9B1f
	SVd0OvdoH+Mp2KBuRLUc5DdeYSVX9LQFB+SSSNXR++8HAScDpm5trU54LagwbVH+rQ8lM1STACC
	XQD0PkCyCalXnn6SL/FLlob7WQJ4HKsCsRXwia+0YrmSEPdjFxTO8Ucq+d2ri7XBTus4
X-Received: by 2002:a05:600c:3b85:b0:4a1:fb23:68f0 with SMTP id 5b1f17b1804b1-4ba0230c856mr40266115e9.3.1794302880750;
        Tue, 10 Nov 2026 01:28:00 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Baptiste Le Duc <baptiste.le-duc@vates.tech>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 1/2] xen/riscv: skip disabled CPU nodes when probing ISA extensions
Date: Tue, 10 Nov 2026 10:27:56 +0100
Message-ID: <20261110092757.25213-1-oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1794302881-514D3B50-3C3A4BB1/10/73395122804
X-purgate-type: spam
X-purgate-size: 1964
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

riscv_fill_hwcap_from_isa_string() intersects the riscv,isa of every CPU
node under /cpus, including the ones with status = "disabled". Such a
hart is never used by Xen, yet it can still remove extensions from the
host ISA: e.g. a disabled hart without the H extension makes Xen panic
with "Xen requires extension: h", even though every hart Xen runs on
implements it.

Skip CPU nodes which aren't available, both there and in
has_isa_extensions_property(), so that the two agree on which harts are
taken into account.

Fixes: f74ebf58b518 ("xen/riscv: identify specific ISA supported by cpu")
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v2:
 - Skip the disabled CPU nodes in has_isa_extensions_property() as well.
 - Remove the comment, as the explanation in the commit description is
   sufficient and avoids duplicating the same comment in
   has_isa_extensions_property().
 - Update the last paragraph of the commit message: add info about
   has_isa_extensions_property().
---
---
 xen/arch/riscv/cpufeature.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/xen/arch/riscv/cpufeature.c b/xen/arch/riscv/cpufeature.c
index dff590f68a30..9767ba0b5824 100644
--- a/xen/arch/riscv/cpufeature.c
+++ b/xen/arch/riscv/cpufeature.c
@@ -477,6 +477,9 @@ static void __init riscv_fill_hwcap_from_isa_string(void)
         if ( !dt_device_type_is_equal(cpu, "cpu") )
             continue;
 
+        if ( !dt_device_is_available(cpu) )
+            continue;
+
         if ( dt_get_cpuid_from_node(cpu, &cpuid) < 0 )
             continue;
 
@@ -519,6 +522,9 @@ static bool __init has_isa_extensions_property(void)
         if ( !dt_device_type_is_equal(cpu, "cpu") )
             continue;
 
+        if ( !dt_device_is_available(cpu) )
+            continue;
+
         if ( dt_property_read_string(cpu, "riscv,isa-extensions", &isa) )
             continue;
 
-- 
2.56.0


