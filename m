Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C585606A31C
	for <xen-devel@archiver.kernel.org>; Thu, 29 Oct 2026 17:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=pvBPsT/l
Received: from list by lists.xenproject.org with outflank-mailman.1465005.1675896 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMTfk-0005i4-Fn; Thu, 29 Oct 2026 17:12:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1465005.1675896; Thu, 29 Oct 2026 17:12:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMTfk-0005hx-DD; Thu, 29 Oct 2026 17:12:16 +0000
Received: by outflank-mailman (input) for mailman id 1465005;
 Thu, 29 Oct 2026 17:12:15 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a188a5ce83000f79f@swg.vates.tech>)
 id 1xMTfj-0005hr-Tt
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2026 17:12:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xMTfj-006SKz-9X
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2026 18:12:15 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a188a5ce83000f79f@swg.vates.tech>)
 id 6ae37e69-8faa-0a2a0a5109dd-0a2a4505d20c-16
 for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2026 18:12:15 +0100
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a188a5ce83000f79f@swg.vates.tech>)
 id 6ae37e6e-4cb1-0a2a45050019-b9ff1c23a37f-3
 for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2026 18:12:15 +0100
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a188a5ce83000f79f.004 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 29 Oct 2026 17:12:10 +0000
Received: from [192.168.1.52] (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 2C3D8815DF;
 Thu, 29 Oct 2026 18:12:09 +0100 (CET)
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
 q=dns/txt; s=selector1; bh=Sljo7EO7U4Td57JTslIaWxULNl2tb4d3Q6wtetYpRNc=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=pvBPsT/lpVeSOL21znjDSCOeQbWzYBmAS3JXgMlaLU8yLFjqNihUq+5hkGpN+HxFpeKjnbrtL
 +T60/RLNSXjd6D/XPKxP7Sd3OY7LAX1ZNBG3JXSlwzxyeDGy6+Lfte7TYvjLcTCdft1VmonehIs
 0YUXWvpKbkt+zPR7xwmFkyF42lQEp4RM2wOWh8iWMqv+69fs+FRhBilPV3EkuJCy3de7e3USvLc
 jrJBPYUYhGkUc5OKXK9oFL/kWEd3/j4VCgvMAhaTcc0b8DKMxSuPVxDpzxJf50thBB9yttxt2b0
 CJpsxuluGomy3b3NOfNhnptrfOXoCTckrdvBvkmSFsgw==
X-Zone-Loop: 224b4a59e52f239eb2d9ac0dc957d8296dc1b055ce2c
x-campaign-type: default
x-transaction-id: 5b780938-fb98-4d01-9d73-dfa87e2066ba
x-swg-uid: 01-7c56cb72-7d9b-4d72-8950-8aa733fb2aaa
X-Mailer: Sweego
Message-ID:
 <1793293930.8631fc262581453bbf619ec5b2062170.1a188a5ce83000f79f@vates.tech>
x-swg-bid: 1793293930.8631fc262581453bbf619ec5b2062170.1a188a5ce83000f79f
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 5/6] automation/qtb: add QTB framework README
From: Baptiste Le Duc <baptiste.le-duc@vates.tech>
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
 xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
 Stefano Stabellini <sstabellini@kernel.org>
In-Reply-To: <1793290059.8631fc262581453bbf619ec5b2062170.1a1886abd5a000f79f@vates.tech>
References: <1787823334.8631fc262581453bbf619ec5b2062170.1a04293255c000c4f3@vates.tech>
 <1787823789.8631fc262581453bbf619ec5b2062170.1a0429a1484000c4f3@vates.tech>
 <1fcacfcb-2775-4a4f-ac38-d7ed9a143e99@gmail.com>
 <1793290059.8631fc262581453bbf619ec5b2062170.1a1886abd5a000f79f@vates.tech>
Date: Thu, 29 Oct 2026 18:12:03 +0100
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793293923; l=639;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=vmESxvABw5DuWxRu2hAqWvXiUbAyjkmIDf8bgA9uF2M=;
 b=CahX+Im0hszWnUZSJFeBr93lQsh3oywftPDxhugFjg6oJjs7vsxoELQyGSh9kHGgif6t7lgDk
 JA05usH8cVLBmncENFw4kVIkttqFzAgjJQ2zHlBBRM9DlmQzbzRoHey
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1793293929272
X-purgate-ID: tlsNG-c201ff/1793293935-726B52A1-BAAE5232/0/0
X-purgate-type: clean
X-purgate-size: 639
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 2026-10-29 17:07 +0100, Baptiste Le Duc wrote:
> [ ... 72 lines skipped ... ]
> > See my reply to patch 2: Xen doesn't use this.
> 
> Right, Xen only reads mmu-type from dom0less guest nodes. I dropped it
> for host in MachineConfig and in dts in v3.
> 

Finally, I've just seen that dropping mmu-type from dts breaks boot:
OpenSBI's fdt_cpu_fixup() marks any hart node without it as status =
"disabled", so Xen then finds no usable CPU ("CPU with hartid=0 is not
available"). I'd keep it hard-coded to "riscv,sv57" in the dts to match
what QEMU's virt machine reports.

-- 
Baptiste Le Duc <baptiste.le-duc@vates.tech>

