Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1248C624DE
	for <xen-devel@archiver.kernel.org>; Fri,  4 Sep 2026 08:26:41 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1407981.1640723 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2PFi-0002Jb-7r; Fri, 04 Sep 2026 08:26:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1407981.1640723; Fri, 04 Sep 2026 08:26:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2PFi-0002JT-4c; Fri, 04 Sep 2026 08:26:26 +0000
Received: by outflank-mailman (input) for mailman id 1407981;
 Fri, 04 Sep 2026 08:26:24 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x2PFg-0002JL-Ea
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2026 08:26:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x2PFf-00CrcH-DC
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2026 10:26:23 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a06b869ff7000c4f3@swg.vates.tech>)
 id 6a9a80a5-2eae-0a2a0a5409dd-0a2a4509cdb4-48
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2026 10:26:23 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a06b869ff7000c4f3@swg.vates.tech>)
 id 6a9a80af-be1a-0a2a45090019-b9ff1c22a197-3
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2026 10:26:23 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a06b869ff7000c4f3.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 04 Sep 2026 08:26:20 +0000
Received: from [192.168.1.46] (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 485F0802F6;
 Fri,  4 Sep 2026 10:26:19 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=LkwtOW0c6kSr+rEb1RtiU4SlzBO+PyodhuqzUo+tvnc=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=dZWfsl62iM+XFfyAbIhKyl4ZGx3s8QFlljS9XjDI7Hh5En0iCKqYnoR/2OgBi2Tlzb2zyjXgk
 ZvnHpWw0fKz3DLFtcVCXsMCPN4czYHXAtXn2ay5M0LEelxnZXNw0PaWRcBy1EbT6cYHfMU4Vicu
 qOjTROXYlP3XrL2fi5j8Tk7Lg3XjOjgy5J/egZyi8fpkc30O14UtU7rglOTSz8osAz2U0rxxbeb
 mKsXVfzxCb9Lgf0eOqJWE4KC97Liv+wV4M+UNJ/EbB3PB+tn3XV53OWTPwNC4JD0k7K0MloxoR4
 40YQRpLhOJrTgmzOTFx8sCILv2FNdiSK2SbVNeLNbCHA==
X-Zone-Loop: c489e59f79928406ccfe3b0ee381818edc8715e685ad
x-campaign-type: default
x-transaction-id: 8b5ca3b0-dd43-408d-916d-616c69673c84
x-swg-uid: 01-d0ce9b2d-c48e-429b-9331-87b242d64cb4
X-Mailer: Sweego
Message-ID:
 <1788510380.8631fc262581453bbf619ec5b2062170.1a06b869ff7000c4f3@vates.tech>
x-swg-bid: 1788510380.8631fc262581453bbf619ec5b2062170.1a06b869ff7000c4f3
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 10/39] xen/riscv: build the target hart index via
 aplic_hart_field()
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
In-Reply-To: <3c7418d64a730ec5e4b2cfd0ecfbbbc6fe0bf7d8.1787838835.git.oleksii.kurochko@gmail.com>
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
 <3c7418d64a730ec5e4b2cfd0ecfbbbc6fe0bf7d8.1787838835.git.oleksii.kurochko@gmail.com>
Date: Fri, 04 Sep 2026 10:26:10 +0200
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788510379; l=612;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=VVl73hF2qvOuLJ9fA3IIcYG1Ix//l3ET1E6wYzLa6Go=;
 b=0RWtrZhJYlEJNyjtvDiGOqGhycQO+ovox/4RSI3g5lQ9K2pdEhUeOjJya8OwQxvurZAhwUjuU
 9IzuDhiRpctD8WkeVR0tLrfn4COZUvrriSOOEKyv61CyIkaLDhSiJZq
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1788510379509
X-purgate-ID: tlsNG-bad1c0/1788510383-FDC6D034-55A78C4A/10/73395122804
X-purgate-type: spam
X-purgate-size: 612

On Thu, 27 Aug 2026 17:20:54 +0200, Oleksii Kurochko <oleksii.kurochko@gmail.com> wrote:
> aplic_set_irq_affinity() open-coded the packing of the group and hart
> indices into the target register, and got two things wrong along the
> way:
> 
>  - imsic_config.msi[] is indexed by logical CPU id, but the index was
>    run through cpuid_to_hartid() first. On any platform where the two
>    spaces differ this picks another CPU's interrupt file, or reads past
>    the array;
> 
> [...]

Reviewed-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>

-- 
Baptiste Le Duc <baptiste.le-duc@vates.tech>

