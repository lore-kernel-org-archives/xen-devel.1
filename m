Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38C9A606A320
	for <xen-devel@archiver.kernel.org>; Wed, 18 Nov 2026 09:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=VkpozaZB
Received: from list by lists.xenproject.org with outflank-mailman.1494155.1693795 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTcJ3-0005tB-MV; Wed, 18 Nov 2026 09:50:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1494155.1693795; Wed, 18 Nov 2026 09:50:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTcJ3-0005t4-JK; Wed, 18 Nov 2026 09:50:21 +0000
Received: by outflank-mailman (input) for mailman id 1494155;
 Wed, 18 Nov 2026 09:50:20 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xTcJ2-0005ss-Cl
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 09:50:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTcJ1-000dHV-BH
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 10:50:19 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1ee10747d0006d3f@swg.vates.tech>)
 id 6afd74cc-8faa-0a2a0a5109dd-0a2a4504e196-30
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 10:50:19 +0100
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1ee10747d0006d3f@swg.vates.tech>)
 id 6afd74da-b57f-0a2a45040019-b9ff1c2288ef-3
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 10:50:19 +0100
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a1ee10747d0006d3f.006 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 18 Nov 2026 09:50:18 +0000
Received: from [100.68.94.6] (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 48191812D6;
 Wed, 18 Nov 2026 10:50:17 +0100 (CET)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=yt5Whvh77+kXqV/o1c3i80lqqFDkQ3jnPyeUSswR004=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=VkpozaZBhWmzygkygFZDNOXALqGARGqbbg5RnEoPTrmi3O7AV/uqSHsfVHRZIQ0Dr8JTQretr
 lAC8M/j8U/4XGIN0f4PhTCBWH5bE4oyxVAS7zzjZjQl1n9yphN6EwA0eavL4GhLNNkKFLzGGJOT
 ylR/ZVaGCk3NSV8ftsqzodLmRxzZi/tKECHuLKhBpmYCK+eYnAiOhe3lrYGDeI6DYkRb8GPLKLm
 BGsxw26KV+X7xtR0a6uZ3BdLOr42T443xli1bU+4cyzuxCrkoMcSLimuSaw4EI6bVHAjh+j7xtu
 XjrcglzbBuKD/fUZH80KXoGs4yUGxNPaIkbmNFydLU+w==
X-Zone-Loop: af29ccb911e898dcc9aa2a70b986197ed3058662a6da
x-campaign-type: default
x-transaction-id: 9c49b189-3ccb-47c8-9523-8816153f78d9
x-swg-uid: 01-e8535864-e801-4fbf-9cb6-fcbaa9033c9d
X-Mailer: Sweego
Message-ID:
 <1794995418.8631fc262581453bbf619ec5b2062170.1a1ee10747d0006d3f@vates.tech>
x-swg-bid: 1794995418.8631fc262581453bbf619ec5b2062170.1a1ee10747d0006d3f
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v4 02/42] xen/riscv: address violation of MISRA C Rule
 20.12 in csr_write64()
From: Baptiste Le Duc <baptiste.le-duc@vates.tech>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: xen-devel@lists.xenproject.org, 
 Romain Caritey <Romain.Caritey@microchip.com>, 
 Alistair Francis <alistair.francis@wdc.com>, 
 Baptiste Le Duc <baptiste.le-duc@vates.tech>, 
 Connor Davis <connojdavis@gmail.com>, 
 Andrew Cooper <andrew.cooper3@citrix.com>, 
 Anthony PERARD <anthony.perard@vates.tech>, 
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
 Julien Grall <julien@xen.org>, 
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, 
 Stefano Stabellini <sstabellini@kernel.org>
In-Reply-To: <b70baf080cda9faa9c825e5bb7cb538b5b9264bc.1794562488.git.oleksii.kurochko@gmail.com>
References: <cover.1794562488.git.oleksii.kurochko@gmail.com>
 <b70baf080cda9faa9c825e5bb7cb538b5b9264bc.1794562488.git.oleksii.kurochko@gmail.com>
Date: Wed, 18 Nov 2026 10:50:08 +0100
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794995410; l=630;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=0AkLlY7uAqWDFw+5t4hyYLU2+3gG+8EiU9GmcZEpTYo=;
 b=X25BQNOj8M5rLtr31rT8LMrMAZK13cSJheUg/pY2wpI0EX3LoIY2yrsmJbUzyr+e4g5VtZd9b
 pfUEt7FDZ2GAnGjZxyugsaO+ZW+pB4WAWtUpEghuVlbNMabcRqI9TUI
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1794995417507
X-purgate-ID: tlsNG-ebf023/1794995419-514D3B50-68802254/10/73395122804
X-purgate-type: spam
X-purgate-size: 630
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, 13 Nov 2026 16:48:23 +0100, Oleksii Kurochko <oleksii.kurochko@gmail.com> wrote:
> csr_write64() uses its csr parameter both as an operand of ## (to form the
> name of the CSR holding the upper half on RV32) and in ordinary,
> macro-expanded context. As the CSR_* constants are macros themselves, this
> violates MISRA C Rule 20.12.
> 
> Make csr_write64() take the CSR name without the CSR_ prefix and paste the
> prefix as well, so that the parameter is used as an operand of ## only.
> 
> [...]

Reviewed-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>

-- 
Baptiste Le Duc <baptiste.le-duc@vates.tech>

