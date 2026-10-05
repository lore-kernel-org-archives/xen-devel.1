Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 527A1CA5FCE
	for <xen-devel@archiver.kernel.org>; Mon,  5 Oct 2026 10:02:40 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1440684.1658122 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDfWf-0002Rg-ML; Mon, 05 Oct 2026 10:02:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1440684.1658122; Mon, 05 Oct 2026 10:02:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDfWf-0002RZ-I6; Mon, 05 Oct 2026 10:02:29 +0000
Received: by outflank-mailman (input) for mailman id 1440684;
 Mon, 05 Oct 2026 10:02:28 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a10b8382510003f66@swg.vates.tech>)
 id 1xDfWe-0002Qd-4T
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2026 10:02:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xDfWc-006qrC-VR
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2026 12:02:26 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a10b8382510003f66@swg.vates.tech>)
 id 6ac375b0-bab6-0a2a0a5309dd-0a2a450894b0-8
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 12:02:26 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a10b8382510003f66@swg.vates.tech>)
 id 6ac375b2-f659-0a2a45080019-b9ff1c12a5cb-3
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 12:02:26 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a10b8382510003f66.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 05 Oct 2026 10:02:10 +0000
Received: from [192.168.1.46] (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id BB6AA8231E;
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
 q=dns/txt; s=selector1; bh=5b+J475whSHXFa//6QTRvxLMmn5pluxKNzz5AOcA4eg=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=Whp4UsOn5mhPiKf0dO3/JJjc6jbOxEdaCfyo+v0Y2ioYgZJChFoDuS4DFENk98yeQI6Z+VZVY
 Cv+ja7gasipBqQVRNuIBG14wIoM79ru9LKpPUQF02MDoGBhfBW5rtA9njg1ezPO9ppt/kZcbLCE
 i8+f4Yz1nu8A9z2w93VvFqbqZHtCcKoTs0NBA/kJLM30NP0iUK9wA7LzqT339DW4YyT9iHgfhHj
 O/Z96uy1dhCm0UjxyM86PjKay1qlSDeq2fPTh/H/B8g3VNVdCntV970RmhcPZUsvsXaDzZ18VFz
 BO+dkTKI/DB69h7nAcAu3AJfmYKjnA9USA2xwzFltnBw==
X-Zone-Loop: f417f44e4cdc619123655405721afc9163423f9bce13
x-campaign-type: default
x-transaction-id: eb21f8eb-b7d6-4c76-8d71-65755a816dd0
x-swg-uid: 01-8331f927-06b6-4e65-b66f-044e7c6c35ce
X-Mailer: Sweego
Message-ID:
 <1791194530.8631fc262581453bbf619ec5b2062170.1a10b8382510003f66@vates.tech>
x-swg-bid: 1791194530.8631fc262581453bbf619ec5b2062170.1a10b8382510003f66
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3 03/39] xen/riscv: introduce csr_volatile_read64()
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
In-Reply-To: <af8a07a676749b83cad27332e88bf433f98f22e1.1790779209.git.oleksii.kurochko@gmail.com>
References: <cover.1790779209.git.oleksii.kurochko@gmail.com>
 <af8a07a676749b83cad27332e88bf433f98f22e1.1790779209.git.oleksii.kurochko@gmail.com>
Date: Mon, 05 Oct 2026 12:01:55 +0200
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791194522; l=348;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=Xe+CSjx8UvYIPgtjrP4jHaCG1P9iAS3wBJUHnAhiUQ8=;
 b=5/g43PJN55eR6y+DkvtMlf2VhaFIqhxQan2LyRWTCFV/+nz0xbQgE2Jyf0iyH/zXnR1HifetU
 WQNfqnfS3NvBvSPR7gPO/jkqDn70+GuHxwI59bm33GJ+zHEbMKG/BZQ
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1791194529963
X-purgate-ID: tlsNG-c1860d/1791194546-CE34587B-9A264490/0/0
X-purgate-type: clean
X-purgate-size: 348

> On RV32 a 64-bit CSR is accessed as two halves, <csr> and <csr>H. Reading
As far as I can tell RV32 can't currently be selected (RISCV_64 is def_bool y,
no RISCV_32 in Kconfig), so this path can't even be build-tested. Is the retry
loop really needed now, or a least in this patch series?

-- 
Baptiste Le Duc <baptiste.le-duc@vates.tech>

