Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DF51C982D2
	for <xen-devel@archiver.kernel.org>; Fri, 18 Sep 2026 08:45:35 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1424960.1649139 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x7UDT-0002Od-5o; Fri, 18 Sep 2026 08:45:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1424960.1649139; Fri, 18 Sep 2026 08:45:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x7UDT-0002OW-2x; Fri, 18 Sep 2026 08:45:07 +0000
Received: by outflank-mailman (input) for mailman id 1424960;
 Fri, 18 Sep 2026 08:45:05 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0b3b0c18000072c4@swg.vates.tech>)
 id 1x7UDQ-0002OQ-Pq
 for xen-devel@lists.xenproject.org; Fri, 18 Sep 2026 08:45:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x7UDP-00GBNl-Ub
 for xen-devel@lists.xenproject.org; Fri, 18 Sep 2026 10:45:03 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0b3b0c18000072c4@swg.vates.tech>)
 id 6aacf9fc-8faa-0a2a0a5109dd-0a2a4506cdca-46
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 10:45:03 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0b3b0c18000072c4@swg.vates.tech>)
 id 6aacfa0e-195a-0a2a45060019-b9ff1c22b4d3-3
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 10:45:02 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a0b3b0c18000072c4.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 18 Sep 2026 08:45:00 +0000
Received: from [192.168.1.46] (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id E4D56820E1;
 Fri, 18 Sep 2026 10:44:59 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=7jy0xTNRqgNKUDYhh+aSRoS48Toxky/Fb6QdDUlvdnQ=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=SLMgt/voJQ0o0PtRorkn+Y+vVA1ooN02MX8vbllvUJBGuakdKWuV+Y266TwwTjcl80xjgEoss
 A51F1WGbdD1hhcFoYEJ9XOu/KJ8mKE93vRtRp6T5qn9/rrRyJwXiPIBGLhr23/1oGgzUA00V2qj
 VHOnhl+8EtsYHf37FqbP8JhmfGXMXS+yE3DgcVLJM0WPgQwWFCeA2X3jBMdEw0UiBPW1ggKnhe/
 wHB56EmEwKE+gnqvaofYiSeDomdZ1wO0Cz2cuLYZO/rgpkTAKLtYBcs9X9vx4l9tLriSQqTqJe8
 D+6vjgOsWxKdL489cHF5Sw9VhCr3ZZVqQhhoxjHE63vA==
X-Zone-Loop: 633e9b565c2e6551920da11f2a04d160ec16b36d772f
x-campaign-type: default
x-transaction-id: 726e4d17-f28c-41b8-b75d-51213537b2bb
x-swg-uid: 01-af0af1b7-0fb3-4353-b42d-336e642ea682
X-Mailer: Sweego
Message-ID:
 <1789721100.8631fc262581453bbf619ec5b2062170.1a0b3b0c18000072c4@vates.tech>
x-swg-bid: 1789721100.8631fc262581453bbf619ec5b2062170.1a0b3b0c18000072c4
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 23/39] xen/riscv: look up the exception table for
 any trap taken in Xen context
From: Baptiste Le Duc <baptiste.le-duc@vates.tech>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: xen-devel@lists.xenproject.org, 
 Romain Caritey <Romain.Caritey@microchip.com>, 
 Baptiste Le Duc <baptiste.le-duc@vates.tech>, 
 Zheng Zhang <zhangzheng@iscas.ac.cn>, 
 Alistair Francis <alistair.francis@wdc.com>, 
 Connor Davis <connojdavis@gmail.com>, 
 Andrew Cooper <andrew.cooper3@citrix.com>, 
 Anthony PERARD <anthony.perard@vates.tech>, 
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
 Julien Grall <julien@xen.org>, 
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, 
 Stefano Stabellini <sstabellini@kernel.org>
In-Reply-To: <c8c767e5932057e1fe3ca7756246ded691adad4f.1787838835.git.oleksii.kurochko@gmail.com>
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
 <c8c767e5932057e1fe3ca7756246ded691adad4f.1787838835.git.oleksii.kurochko@gmail.com>
Date: Fri, 18 Sep 2026 10:44:52 +0200
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789721094; l=1765;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=RmMnfB4XxmKrTffUuXoweGsD8YT7e++sjPW9+OJLNZs=;
 b=B73cUk7TwHYnJasxV3VuafpIFlFdakB1rJFrJawelQKHF79FYtISqq5u202sDBbKwYm4QT9UM
 OKcrRYeHMUeDFV6U8RHt1H/cJR7Sp3fENZlj2V2oDsEJn9JyfV5ABIn
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1789721100156
X-purgate-ID: tlsNG-16d1c6/1789721103-F7ACA77B-0BBC81A5/0/0
X-purgate-type: clean
X-purgate-size: 1765

> do_trap() consulted the exception table only for CAUSE_ILLEGAL_INSTRUCTION,
> which covers csr_read_safe() but not the hlv/hlvx sequences reading guest
> memory: those fault with load/store (guest) page fault causes and would
> reach do_unexpected_trap() instead of their fixup.
> 
> Move the lookup ahead of the cause switch, and gate it on the trap having
> been taken in Xen context and not being an interrupt:
> 
> - sepc of a trap taken from the guest is a guest VA/PA, which the
>   guest can point at an address listed in the exception table; Xen would
>   then act on that entry and, for EX_TYPE_TRAP_INFO, write through a
>   pointer fully under guest control. Entries are matched by exact address,
>   so this needs no more than a numerical collision.
> 
> - an interrupt taken at an address listed in the table would otherwise be
>   "fixed up" as if the access itself had faulted, silently skipping it and
>   handing the caller the interrupt's scause as a fault cause.
> 
> Returning early skips check_for_pcpu_work(), which is correct: that only
> runs for traps taken from the guest.
> 
> With that in place a G-stage fault reaching the switch can no longer have
> been caused by an hlv/hlvx covered by an entry, so anything left must have
> come from the guest; assert as much.
What means `assert as much` here? As you referencing any assert in the code,
because in this patch, I couldn't find any.
> 
> Cache the "trap came from the guest" test in a local, it is now used four
> times.
Nit: By reading this sentence, I would expect to have the introduction
of `from_guest` local here instead of in patch cc2d3b97e8
xen/riscv: add guest page fault handling stub

-- 
Baptiste Le Duc <baptiste.le-duc@vates.tech>

