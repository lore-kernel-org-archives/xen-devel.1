Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75EC1CA5FF0
	for <xen-devel@archiver.kernel.org>; Mon,  5 Oct 2026 10:02:40 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1440685.1658130 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDfWi-0002hA-S9; Mon, 05 Oct 2026 10:02:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1440685.1658130; Mon, 05 Oct 2026 10:02:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDfWi-0002h3-Ol; Mon, 05 Oct 2026 10:02:32 +0000
Received: by outflank-mailman (input) for mailman id 1440685;
 Mon, 05 Oct 2026 10:02:30 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xDfWg-0002eG-Q0
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2026 10:02:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xDfWg-006qu4-6t
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2026 12:02:30 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a10b83837a0003f66@swg.vates.tech>)
 id 6ac375b0-bab6-0a2a0a5309dd-0a2a450894b0-20
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 12:02:30 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a10b83837a0003f66@swg.vates.tech>)
 id 6ac375b2-f659-0a2a45080019-b9ff1c12a5cb-4
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 12:02:30 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a10b83837a0003f66.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 05 Oct 2026 10:02:10 +0000
Received: from [192.168.1.46] (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 12C018229F;
 Mon,  5 Oct 2026 12:02:10 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=+wwEDoIAPeisaQz6R6kuZnDSc6AQthUH+5/MlpxTDOY=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=C0/iJ4AmUg4JZGVT9DjVnlymyqzr2eZtH1553Dv9RwZfErv7Y0bn0xrr1lFgvggQwY9PLL1O7
 0OppzSqxMHDuKuuJAUanYsVn5OBDMFfLGai5Uc0b25iflIP+INk8kTT7myKaznD3eM8GfbhyYTZ
 1ZWJIGJ9VTc+hw8ACh+kRF+5KB0mbbQMEb9iXmizLmZWOqb4VFf3lyA2jxFEpOzmtXkaQZPLfgK
 h4Rg0O5gg2+L3dke0OZ9aF6r8Jt4E+jzvQyRUWrEXVHA5rw7W2pdE9OKO15VCvUAAT5GgVq1qMY
 8hQOBdh6wgYmZBEMj47T32LirfPEURT+nJD/euAI7ZnA==
X-Zone-Loop: ec14c0ec98299dd303fa0c78afaaca0e4768805229fe
x-campaign-type: default
x-transaction-id: 10ca19c4-91d6-4192-927a-13c9561eba9f
x-swg-uid: 01-ef4fc4e0-8e54-40b3-8c22-21187e2b315a
X-Mailer: Sweego
Message-ID:
 <1791194530.8631fc262581453bbf619ec5b2062170.1a10b83837a0003f66@vates.tech>
x-swg-bid: 1791194530.8631fc262581453bbf619ec5b2062170.1a10b83837a0003f66
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3 04/39] xen/riscv: request a G-stage flush on vmenter
 when VMIDs are disabled
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
In-Reply-To: <7b3e9a486b348470b3c3b371b6a8d3f7afe0e53f.1790779209.git.oleksii.kurochko@gmail.com>
References: <cover.1790779209.git.oleksii.kurochko@gmail.com>
 <7b3e9a486b348470b3c3b371b6a8d3f7afe0e53f.1790779209.git.oleksii.kurochko@gmail.com>
Date: Mon, 05 Oct 2026 12:01:55 +0200
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791194522; l=655;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=j4JgF0xGEkESNg6kK43vyD+FWXZ8iz9SM5nOegSQeL8=;
 b=UG5OksGOHuNT/4R9c6hGku80T6pnhb/flDHeGb4S4Kd4O9Tehh5HyxKX5Vza1Y7jqhAi0q277
 XISBOSok25jBK8olyaVTU4dXSZwfAJXyZC5CZYmbZteYPG8b0NjgE1q
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1791194530267
X-purgate-ID: tlsNG-c1860d/1791194550-CDB4987B-BBDA8ACA/10/73395122804
X-purgate-type: spam
X-purgate-size: 655

On Wed, 30 Sep 2026 18:18:46 +0200, Oleksii Kurochko <oleksii.kurochko@gmail.com> wrote:
> vmid_handle_vmenter() reports that no flush is needed when VMIDs are
> unavailable (e.g. vmid=off, or hardware with no more than one VMID bit).
> Every domain then runs under VMID 0 with nothing flushed in between, so as
> soon as a hart runs more than one domain, a domain entered there can use
> the G-stage translations left behind by the domain which ran before it.
> 
> Report that a flush is needed on every entry instead.
> 
> [...]

Reviewed-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>

-- 
Baptiste Le Duc <baptiste.le-duc@vates.tech>

