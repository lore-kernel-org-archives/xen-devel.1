Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C35D9C79F9F
	for <xen-devel@archiver.kernel.org>; Thu, 10 Sep 2026 09:35:22 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1414230.1644027 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4bBZ-0003t8-Lk; Thu, 10 Sep 2026 09:35:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1414230.1644027; Thu, 10 Sep 2026 09:35:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4bBZ-0003sx-It; Thu, 10 Sep 2026 09:35:13 +0000
Received: by outflank-mailman (input) for mailman id 1414230;
 Thu, 10 Sep 2026 09:35:13 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a08aaba10f000c4f3@swg.vates.tech>)
 id 1x4bBZ-0003s3-1L
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2026 09:35:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4bBY-00G7oY-E1
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2026 11:35:12 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a08aaba10f000c4f3@swg.vates.tech>)
 id 6aa279cb-8faa-0a2a0a5109dd-0a2a45038d98-12
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 11:35:12 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a08aaba10f000c4f3@swg.vates.tech>)
 id 6aa279d0-fae8-0a2a45030019-b9ff1c128343-3
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 11:35:12 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a08aaba10f000c4f3.006 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 10 Sep 2026 09:34:58 +0000
Received: from leducb.home (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 3643E81DDF;
 Thu, 10 Sep 2026 11:34:58 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=zCcQNFh0g12JPMddG2Ca8xIh45osQOHtYcniGIWjeXE=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=oUaTveciXV3djdoStuZbp035Tod9lxjUIJV5N/uaryGMr0u0EWDkupTdEyCka8cUCDABlHVxR
 6bYEFm0Jc4St/rXDddtPLscXRGQffHfCSFCYQKOhD9gc3Jzhow+r6MbLzu/s8v5hM/p5FRfVj4z
 cw8JgaWV82/jKblqraJN+HAOVcfwtAsgUDLE89Rjk0XuSEkZ1f5Rk0JnJODTBH3xjxCYP/SGaup
 1J4lDAyvVewy8Ke1xHa1aVTGp+hqB4fLzbNgUND/jiy6rHzN0BtVNimYKxVQue2at15ZMf7pX2G
 6dO457/neia5ihLW4XUPohpKH1tgDEhMuZ7XexIXa+dQ==
X-Zone-Loop: d73f9eca2dae5907b35fb4a46eb39ffdffe62ccb1db2
x-campaign-type: default
x-transaction-id: aaae94c8-24f6-4a94-b203-c19ea85e5935
x-swg-uid: 01-4d4eba5c-662a-4f18-af2f-bc0a62b6dd06
X-Mailer: Sweego
Message-ID:
 <1789032898.8631fc262581453bbf619ec5b2062170.1a08aaba10f000c4f3@vates.tech>
x-swg-bid: 1789032898.8631fc262581453bbf619ec5b2062170.1a08aaba10f000c4f3
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
From: Baptiste Le Duc <baptiste.le-duc@vates.tech>
To: Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Cc: Baptiste Le Duc <baptiste.le-duc@vates.tech>,
	xen-devel@lists.xenproject.org
Subject: [PATCH v2 4/6] xen/riscv: make Zihintpause no longer a required extension
Date: Thu, 10 Sep 2026 11:34:52 +0200
In-Reply-To: <1789032657.8631fc262581453bbf619ec5b2062170.1a08aa7f23b000c4f3@vates.tech>
References: <1789032657.8631fc262581453bbf619ec5b2062170.1a08aa7f23b000c4f3@vates.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789032264; l=1274; i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id; bh=oiDBllyOiotIYkSmw8xo419f4GoaBYdPMeKZi/GUUr4=; b=9p1WqN6dVAil6viKUhFyTXxVDTkqE3OiwnQioTXdPTkSSt3+/xfZwZKRD1xv7ZqSd45Vygn+V 7dEtBVmMbXRB2cYqvxOpB2IydCWjl2NTnkfBqDPOyrIW6qfWnoNn0j/
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519; pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
Content-Transfer-Encoding: 8bit
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1789032898419
X-purgate-ID: tlsNG-33051d/1789032912-6FAC44E9-23DC6F3F/0/0
X-purgate-type: clean
X-purgate-size: 1276

required_extensions[] panics at boot if Zihintpause is missing, but Xen
never actually depends on it: cpu_relax() only emits the "pause" hint when
the extension is implemented, otherwise it emits `0x0100000F`, a legally
valid FENCE instruction (`FENCE W, 0`) rather than a native NOP. FENCE is
guaranteed by the RISC-V base ISA, so it never raises an illegal
instruction fault. With an empty successor set, it enforces no
memory-ordering constraints and thus architecturally behaves as a NOP.

Drop it from required_extensions so hardware without Zihintpause
still boots.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
---
Changes since v1:
- rewrite commit message.
---
 xen/arch/riscv/cpufeature.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/xen/arch/riscv/cpufeature.c b/xen/arch/riscv/cpufeature.c
index 986a6dec78..41bb1d2e80 100644
--- a/xen/arch/riscv/cpufeature.c
+++ b/xen/arch/riscv/cpufeature.c
@@ -156,7 +156,6 @@ static const struct riscv_isa_ext_data __initconst required_extensions[] = {
     RISCV_ISA_EXT_DATA(h),
     RISCV_ISA_EXT_DATA(zicsr),
     RISCV_ISA_EXT_DATA(zifencei),
-    RISCV_ISA_EXT_DATA(zihintpause),
     RISCV_ISA_EXT_DATA(zbb),
 };
 

-- 
2.55.0


