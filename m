Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CC3B606A31B
	for <xen-devel@archiver.kernel.org>; Wed,  4 Nov 2026 15:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=RvP3uELX
Received: from list by lists.xenproject.org with outflank-mailman.1472077.1680118 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOcZk-00005r-Ch; Wed, 04 Nov 2026 15:06:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1472077.1680118; Wed, 04 Nov 2026 15:06:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOcZk-00005k-9z; Wed, 04 Nov 2026 15:06:56 +0000
Received: by outflank-mailman (input) for mailman id 1472077;
 Wed, 04 Nov 2026 15:06:55 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1a71918bf000403d@swg.vates.tech>)
 id 1xOcZj-00005d-0p
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 15:06:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOcZi-000h7D-5p
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 16:06:54 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1a71918bf000403d@swg.vates.tech>)
 id 6aeb4a0d-bab6-0a2a0a5309dd-0a2a4508bc52-4
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 16:06:54 +0100
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1a71918bf000403d@swg.vates.tech>)
 id 6aeb4a04-f659-0a2a45080019-b9ff1c23ae73-3
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 16:06:45 +0100
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a1a71918bf000403d.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 04 Nov 2026 15:06:42 +0000
Received: from [192.168.1.52] (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 596DE80048;
 Wed,  4 Nov 2026 16:06:41 +0100 (CET)
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
 q=dns/txt; s=selector1; bh=WsnGw1XKluz1wAj9pRnicBsXXdD74+XSsiqUJzURjQI=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=RvP3uELX0v4DumNmXHm3NZunnWP0Is4iNcc0m2wPclKQ3mSjsJajsaUuhMszTH3WIqSuw5Qz8
 xdwYOIEKwjP8n3a9sZaLmRjWCKfTAD+wTioCf+qa0puHjK5hpN0LdOIxRfnKDT6Jzef4vTB2cjU
 xmB0TDq7Srr+nnC+sLL4ffuhNsTLMvE5EVqhprjqZ6d48kr9yNqIThQTQ5O14R1pRNkGMqx38mw
 OpyXhCLCYlNPjUa23y/zWxB/K6NaI8QE1pJo2i0ckBAY/GFRAoTrPkmH/LCDm77FwWqvxVqNy/m
 0vXAuyxllirBqrOh7TowB0mTvIK/FWB3Y+b28cd8lO2w==
X-Zone-Loop: 8090b5cf5bc2820ba06cccdc0a9be75166143a7a3b6f
x-campaign-type: default
x-transaction-id: 490542b1-850a-4b7e-bad2-8068667503d3
x-swg-uid: 01-556a1f5a-23ec-414d-8533-97bac7fd4bc5
X-Mailer: Sweego
Message-ID:
 <1793804802.8631fc262581453bbf619ec5b2062170.1a1a71918bf000403d@vates.tech>
x-swg-bid: 1793804802.8631fc262581453bbf619ec5b2062170.1a1a71918bf000403d
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3 39/39] xen/riscv: introduce IMSIC h/w interrupt file
 attaching to vcpu
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
In-Reply-To: <fa5788d0133c98ae3feac474da325239d27ed153.1790779209.git.oleksii.kurochko@gmail.com>
References: <cover.1790779209.git.oleksii.kurochko@gmail.com>
 <fa5788d0133c98ae3feac474da325239d27ed153.1790779209.git.oleksii.kurochko@gmail.com>
Date: Wed, 04 Nov 2026 16:06:35 +0100
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793804796; l=1978;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=TG2ilno3oMAyjY/dALHWAeDd/9BilLa42Lhx3kBElYc=;
 b=75Fk8ruii/UzAjFUo6B6p6ZIoE3H2MhdLTeGG6015zuoH72eN8Dt9L6b84oncuBa+LkZgLZjG
 aAJCp2Nr+wIDZtosgy8/Yid6gUOM3ykTpo91mfizjgEF7BsAvGFxBHO
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1793804801572
X-purgate-ID: tlsNG-c1860d/1793804805-CEB4187B-79B8FC3D/0/0
X-purgate-type: clean
X-purgate-size: 1978
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> Introduce imsic_vsfile_attach() to give a vCPU a working guest
> interrupt file.
> 
> A guest (VS) interrupt file has to be backed by one of the hardware
> guest interrupt files of the pCPU the vCPU runs on, so that pCPU has to
> be known first. arch_vcpu_create() is therefore not a suitable place:
> the pCPU assigned to a vCPU can still change before the vCPU is first
> scheduled, which would mean taking another file and remapping the
> guest's IMSIC page to it. Call imsic_vsfile_attach() from
> continue_new_vcpu() instead, i.e. when the vCPU is scheduled for the
> first time; as that isn't an __init context, neither is
> imsic_vsfile_attach().
> 
> Giving a vCPU its first file shares most of the steps with moving it to
> a new one on migration, so move the body of imsic_migrate_vcpu() to
> imsic_vsfile_move() and use it for both. Its first_attach argument skips
> the part which moves the interrupt state out of the old file: the vCPU
> has never run at that point, so the freshly acquired and zeroed file is
> all the interrupt state it has, and hstatus.VGEIN can be pointed at it
> right away.
> 
> vAPLIC target registers are reconfigured on the first attach as well: a
> target the guest writes for a vCPU which has no h/w guest interrupt file
> yet only updates the stored copy, which reaches the h/w at this point.
> 
Nit: I didn't quite understand this paragraph, "only updates"
leaves out that the h/w APLIC write is skipped, because there is no file
to point the target at yet. Maybe something like:

    The guest may program a vAPLIC TARGET register for a vCPU which has
    not run yet. That vCPU has no h/w guest interrupt file yet, so
    vaplic_mmio_write() only stores the value. imsic_vsfile_move() then
    writes it to the h/w APLIC on the first attach, pointing to the newly
    acquired file.

Reviewed-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>

-- 
Baptiste Le Duc <baptiste.le-duc@vates.tech>

