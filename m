Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4902CC982FE
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2026 15:19:19 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1429143.1652071 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x92Gz-0007Et-LM; Tue, 22 Sep 2026 15:19:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1429143.1652071; Tue, 22 Sep 2026 15:19:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x92Gz-0007Em-I6; Tue, 22 Sep 2026 15:19:09 +0000
Received: by outflank-mailman (input) for mailman id 1429143;
 Tue, 22 Sep 2026 15:19:08 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0c9b2f93d00072c4@swg.vates.tech>)
 id 1x92Gy-0007Eb-5p
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 15:19:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x92Gx-00Gxo1-3U
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 17:19:07 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0c9b2f93d00072c4@swg.vates.tech>)
 id 6ab29c62-8faa-0a2a0a5109dd-0a2a4506e6fe-34
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 17:19:07 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0c9b2f93d00072c4@swg.vates.tech>)
 id 6ab29c6a-195a-0a2a45060019-b9ff1c22b1ad-3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 17:19:06 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a0c9b2f93d00072c4.006 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 22 Sep 2026 15:19:04 +0000
Received: from [192.168.1.37] (lfbn-gre-1-371-96.w90-112.abo.wanadoo.fr
 [90.112.87.96]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id CF0DB81F18;
 Tue, 22 Sep 2026 17:19:03 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=6Er3KvlK9wQlEJbo46n4FQLJkQHGED7sapa04KUosR4=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=e6Rwsh5Tt/OCPP7IAyKzEoqrg9A1DdpJ0tK+CNMdJVILRDMeb6r5Lb4t/DO/a30GuLonLjz3F
 KmRy808pZSHWD06MtuCfj0FaJFplvvru5vFHOziehIsQ4ktY4kbC2cYmKfAitCm1GXp6BkU4GAK
 aZQJ0FwpDmPw5cTPqCXPmYTU1j8FZ/3KpyfPum58GSSQVr6yVPepmhLOJaFy33i4JeiNr8inz6e
 X1QSTKMf8FufVrnOvjMaqPpxbE3WMNtH7so4KyHu1ncHWYfz89oJ/Bstct69iwQai5tGRPHDaVp
 fEgFj9u8QJ3Agnhavtzp+x8qjYg+A80mnJhQqPGiHfNQ==
X-Zone-Loop: ebb2c348a0a70328eeb1a160d0f08838235f334ec288
x-campaign-type: default
x-transaction-id: 92b5f6b6-e93f-4cb4-ad77-9e57143bb5a6
x-swg-uid: 01-19b2e30b-c23e-482a-aa4c-436d627a2048
X-Mailer: Sweego
Message-ID:
 <1790090344.8631fc262581453bbf619ec5b2062170.1a0c9b2f93d00072c4@vates.tech>
x-swg-bid: 1790090344.8631fc262581453bbf619ec5b2062170.1a0c9b2f93d00072c4
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 1/6] xen/riscv: fix Svade/Svadu A/D bit handling
From: Baptiste Le Duc <baptiste.le-duc@vates.tech>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Baptiste Le Duc <baptiste.le-duc@vates.tech>, 
 Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org, 
 Alistair Francis <alistair.francis@wdc.com>, 
 Connor Davis <connojdavis@gmail.com>, 
 Andrew Cooper <andrew.cooper3@citrix.com>, 
 Anthony PERARD <anthony.perard@vates.tech>, 
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, 
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, 
 Stefano Stabellini <sstabellini@kernel.org>
In-Reply-To: <48253b42-1b0c-4463-ad0b-01ebed1d8282@gmail.com>
References: <1789032657.8631fc262581453bbf619ec5b2062170.1a08aa7f23b000c4f3@vates.tech>
 <1789032897.8631fc262581453bbf619ec5b2062170.1a08aab9d76000c4f3@vates.tech>
 <450d0c5e-2101-4b1c-98fd-2f438bd0ccf3@suse.com>
 <1790010225.8631fc262581453bbf619ec5b2062170.1a0c4ec74f000072c4@vates.tech>
 <e8b1257b-3b28-43d3-b692-5e79f5cae68a@suse.com>
 <1790068677.8631fc262581453bbf619ec5b2062170.1a0c868594900072c4@vates.tech>
 <48253b42-1b0c-4463-ad0b-01ebed1d8282@gmail.com>
Date: Tue, 22 Sep 2026 17:18:58 +0200
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790090338; l=756;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=7JnbEHPG3MInXHIKWLsIpbgn1y1z2oTX/IsB1PppKOw=;
 b=kQJVl9GwyB37o+Wo0UytAl4WN7LN5fpEtZlYpT2dwael3v61XwYUnGQmKB0SoO/BvjIMbuwuE
 QgWXZ1HIjYtCZWlNzPsFPpeOJjiyf+392V+jxAIP/Ijetb9LoEoVlgd
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1790090344034
X-purgate-ID: tlsNG-16d1c6/1790090347-FD00977B-2D6551B3/0/0
X-purgate-type: clean
X-purgate-size: 760

On 2026-09-22 17:14:23+02:00, Oleksii Kurochko wrote:
> On 9/22/26 11:17 AM, Baptiste Le Duc wrote:
> 
> > On 2026-09-22 08:24 +0200, Jan Beulich wrote:
> > Ok, now I understand, thanks. I'll fix it in next round.
> > We don't know but based on [1] and my commit message, if neither
> > Svade nor Svadu are present in DT then it is technically unknown whether
> > the platform uses Svade or Svade. Hypervisor may then assume Svade to be
> > present and enabled or it can discover based on mvendorid, marchid, and
> > mimpid. For this patch, I choose to have the Hypervisor assumed Svade.
> 
> Can hypervisor really access this regs?
No it can't as they are M-mode only, it's why I choose to have the Hypervisor assumed Svade.
> 
> ~ Oleksii



