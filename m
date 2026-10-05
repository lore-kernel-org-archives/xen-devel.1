Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95929CA5FCE
	for <xen-devel@archiver.kernel.org>; Mon,  5 Oct 2026 10:02:32 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1440683.1658112 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDfWZ-0002CT-FX; Mon, 05 Oct 2026 10:02:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1440683.1658112; Mon, 05 Oct 2026 10:02:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDfWZ-0002CM-BI; Mon, 05 Oct 2026 10:02:23 +0000
Received: by outflank-mailman (input) for mailman id 1440683;
 Mon, 05 Oct 2026 10:02:22 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xDfWY-0002Bk-53
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2026 10:02:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xDfWX-00AbD4-5G
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2026 12:02:21 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a10b8381180003f66@swg.vates.tech>)
 id 6ac375a6-2eae-0a2a0a5409dd-0a2a4501e08c-34
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 12:02:20 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a10b8381180003f66@swg.vates.tech>)
 id 6ac375ac-5984-0a2a45010019-b9ff1c22b5ed-3
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 12:02:20 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a10b8381180003f66.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 05 Oct 2026 10:02:10 +0000
Received: from [192.168.1.46] (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 70C2A82233;
 Mon,  5 Oct 2026 12:02:09 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=PclicpCZjscwTzXE6nCMlYTvo4ShwnwW18JN2L7uXQw=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=fSaXi0CXEeCVxV4diXERZoz3dfnuPHe/7wwx9SGdhAB8HYa6gcGEWEXQgfhmYilfg5Rb2Xz38
 WuLFR2tqX1oP0UKypx80YyBHqSL3KjkUa34g8LwgF4XbsCa2ewlqM+pq/3LFX+7RfjUFhN0lHLM
 7Bdhp+Mxt7jSymX2fuOjJum9B1Pb+ZNvCat5NQfv51eWlC071SHRhvx29Ny009L1weArZ9wEEtO
 7xyMiJzM6APWX1mMRdk1X+fxxhG7baXkL1+tH2hGCFC7WD8gd80wH/k9Q0cWoqR+6Zwwy9MP4Ab
 ECs/iZvniNkKPTjxnckrqdaz0ZddPCiNKtWZgGDmzqwg==
X-Zone-Loop: 73ade1bd51104a55599d4ce7c75989cb73dd92849334
x-campaign-type: default
x-transaction-id: 8a1bdc34-aac2-4516-92ea-614ce030dc35
x-swg-uid: 01-0ee402d8-f9d3-4af8-a25a-9ce6de92d5d9
X-Mailer: Sweego
Message-ID:
 <1791194530.8631fc262581453bbf619ec5b2062170.1a10b8381180003f66@vates.tech>
x-swg-bid: 1791194530.8631fc262581453bbf619ec5b2062170.1a10b8381180003f66
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3 02/39] xen/riscv: set the domain type for 64-bit
 kernel images
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
In-Reply-To: <bd072fd8e2406a80aa783b1b81c41d4fe8739eeb.1790779209.git.oleksii.kurochko@gmail.com>
References: <cover.1790779209.git.oleksii.kurochko@gmail.com>
 <bd072fd8e2406a80aa783b1b81c41d4fe8739eeb.1790779209.git.oleksii.kurochko@gmail.com>
Date: Mon, 05 Oct 2026 12:01:55 +0200
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791194522; l=529;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=YESupS+55RhfXssnfA68l9gJ9FU4CPCDX4/mBfXxfBc=;
 b=Ng+eFM3Wom0IRbLHF+V1c3Wd0NkqshQ+5TZNVO6TFNu3HalID2b07kMh7DiLrhCEjhMsL1A5b
 MOVD/7v9FKsAC2PgN67OLo9925QTVclIEaKbjFjD9xCw67j8jhpXR2P
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1791194529651
X-purgate-ID: tlsNG-d62444/1791194540-BF66C757-866C61F2/10/73395122804
X-purgate-type: spam
X-purgate-size: 529

On Wed, 30 Sep 2026 18:18:44 +0200, Oleksii Kurochko <oleksii.kurochko@gmail.com> wrote:
> kernel_image64_probe() never set info->type, so every domain kept the
> DOMAIN_32BIT value a zeroed KERNEL_INFO_INIT leaves behind, even though
> Xen on RISC-V is only built for RV64 and accepts nothing but a 64-bit
> Image.
> 
> Nothing consumes d->type on RISC-V yet, so there is no functional change.
> 
> [...]

Reviewed-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>

-- 
Baptiste Le Duc <baptiste.le-duc@vates.tech>

