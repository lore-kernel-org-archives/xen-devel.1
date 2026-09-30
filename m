Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6DCBCA5FAC
	for <xen-devel@archiver.kernel.org>; Wed, 30 Sep 2026 12:51:46 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1437202.1656031 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBtmU-0003OU-BO; Wed, 30 Sep 2026 12:51:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1437202.1656031; Wed, 30 Sep 2026 12:51:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBtmU-0003ON-8d; Wed, 30 Sep 2026 12:51:30 +0000
Received: by outflank-mailman (input) for mailman id 1437202;
 Wed, 30 Sep 2026 12:51:29 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0f25e97980003f66@swg.vates.tech>)
 id 1xBtmT-0003OE-76
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 12:51:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBtmS-00ENOp-Io
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 14:51:28 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0f25e97980003f66@swg.vates.tech>)
 id 6abd05c6-e002-0a2a0a5209dd-0a2a4504e0ac-30
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 14:51:28 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0f25e97980003f66@swg.vates.tech>)
 id 6abd05c9-b57f-0a2a45040019-b9ff1c22a121-3
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 14:51:22 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a0f25e97980003f66.006 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 30 Sep 2026 12:51:20 +0000
Received: from [192.168.1.46] (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id C279C829A2;
 Wed, 30 Sep 2026 14:51:19 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=Vznxfxt+9IziV8LHM4hKUp6lmgCZRRv38wmyA1Zs5Ek=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=bWXaEihU4W2JGCCfPT6wftX87Wv/R+BxbOS0L2Z1VBOgAJAH7q1JblPROE/pjpPmac0t5SUPL
 WqbfzeqrJhV6nExe806PUWOyFqelUVjPbqmU6hnonKVfe4wgrzTSV/TMzAb8lN47+OJS0oWj6wJ
 fBPhyoD1Rshhy/kfZxBIQ687C7bahqEDkBAkr6rO4XPKgFI7evSQZzuBZXrc2aLXoWfcIcD1cqM
 /zvn/1twT8Lw+JxEWh67t9v/rv/KYe7MpVk8RliB63fbqtdad/iYBQYEtMw4X4pdiNxErMjd7ns
 HlNT7L4F3OdMU2yb0sopj7DqpGmVRoKGoHgqj+oHnO1w==
X-Zone-Loop: 72a33482d8150388cb624c1cf568794f4fcfc84a2e7c
x-campaign-type: default
x-transaction-id: 84225f97-0bc8-429d-a3f2-329eea26e101
x-swg-uid: 01-13e28f57-6f65-46eb-896b-be38979701df
X-Mailer: Sweego
Message-ID:
 <1790772680.8631fc262581453bbf619ec5b2062170.1a0f25e97980003f66@vates.tech>
x-swg-bid: 1790772680.8631fc262581453bbf619ec5b2062170.1a0f25e97980003f66
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3.1 2/6] xen/riscv: rename PTE "permissions" to
 "pte_flags"
From: Baptiste Le Duc <baptiste.le-duc@vates.tech>
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>
Cc: xen-devel@lists.xenproject.org, 
 Andrew Cooper <andrew.cooper3@citrix.com>, 
 Anthony PERARD <anthony.perard@vates.tech>, 
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
 Julien Grall <julien@xen.org>, 
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, 
 Stefano Stabellini <sstabellini@kernel.org>, 
 Alistair Francis <alistair.francis@wdc.com>, 
 Connor Davis <connojdavis@gmail.com>, 
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <1790772369.8631fc262581453bbf619ec5b2062170.1a0f259d77b0003f66@vates.tech>
References: <20e04d15-8621-4680-a2dc-8e54ee88d050@suse.com>
 <1790772369.8631fc262581453bbf619ec5b2062170.1a0f259d77b0003f66@vates.tech>
Date: Wed, 30 Sep 2026 14:51:14 +0200
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790772674; l=284;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=hUVJxwIMsgqCSOasqscH76ik+rRDCU3uGzlV922yoW0=;
 b=mDr0Jzo86Ys9l3Ute3uwsG8NWv7VWb4utUEnsnLyisLSQkLhman+czgcLFAQaJ7Tl7X4saBfK
 EgUJyeSL6dQDAOfPC6uG/eLUe20g2wOzm+bw+e/uCxj0b/rooJY28lb
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1790772679968
X-purgate-ID: tlsNG-ebf023/1790772682-C0CDFB50-9E4100AA/0/0
X-purgate-type: clean
X-purgate-size: 284

On 2026-09-30 14:46 +0200, Baptiste Le Duc wrote:

Ok it didn't fix the problem. I said Xen's server, but it's in fact, our
company's server, sorry. We are going to change SMTP provider soon, I
hope it will fix the problem...

-- 
Baptiste Le Duc <baptiste.le-duc@vates.tech>

