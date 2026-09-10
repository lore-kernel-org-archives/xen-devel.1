Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DA38C79FB9
	for <xen-devel@archiver.kernel.org>; Thu, 10 Sep 2026 09:56:26 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1414316.1644111 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4bVx-0002mf-6Q; Thu, 10 Sep 2026 09:56:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1414316.1644111; Thu, 10 Sep 2026 09:56:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4bVx-0002mY-2n; Thu, 10 Sep 2026 09:56:17 +0000
Received: by outflank-mailman (input) for mailman id 1414316;
 Thu, 10 Sep 2026 09:56:15 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x4bVv-0002mO-OV
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2026 09:56:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4bVv-0008gj-4G
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2026 11:56:15 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a08abf05da000c4f3@swg.vates.tech>)
 id 6aa27eb2-2eae-0a2a0a5409dd-0a2a4505dec6-40
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 11:56:15 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a08abf05da000c4f3@swg.vates.tech>)
 id 6aa27ebe-4cb1-0a2a45050019-b9ff1c23abcb-3
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 11:56:15 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a08abf05da000c4f3.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 10 Sep 2026 09:56:09 +0000
Received: from [192.168.1.46] (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 8F3B2815B7;
 Thu, 10 Sep 2026 11:56:08 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=lBEogv02IQ/RjcN//vVO5A/mS9eBVXtNGDN/7rY8ezQ=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=KJ+uthc36pPK3xmvvubFvbrIi/NfzBKTwu8fb308ZGRE8AQaRJL4ZMm1A3/ejx0oDxykUkKdU
 byaEjrfcWEM9EUmUlDdB1YccvOvCn3UVAWDnHa1sNEU4L2tV5egnBiMOz68u03XppDQ7dCH0FPg
 RHfhRsRHvzUylARAjY8l7Sf5tvWpRCIWskJx2zkZNBzvgJPWmO+7EmGMOcVMoSsRSGqIilSKyU3
 6Dvuzs4tZVafnC7CPLWRR/XcAz0hf6xB+KRqNYE8PeYC+6oW5eQH6OvtlwE/2LoV3tko5x4UqY5
 r78z/0LAWP0kPgYNAIuWbJHfYrLkOvU2cFI7HqvJQf2A==
X-Zone-Loop: 5e4246ad2319e4cdf9745d930b2b32f5a05e25efc3e6
x-campaign-type: default
x-transaction-id: e0aac2ce-5db8-4456-a809-042823fa4981
x-swg-uid: 01-a848026c-4e75-4616-b468-d6f545542ba2
X-Mailer: Sweego
Message-ID:
 <1789034169.8631fc262581453bbf619ec5b2062170.1a08abf05da000c4f3@vates.tech>
x-swg-bid: 1789034169.8631fc262581453bbf619ec5b2062170.1a08abf05da000c4f3
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 0/6] xen/riscv: fix boot on missing extensions and
 MMU setup bugs
From: Baptiste Le Duc <baptiste.le-duc@vates.tech>
To: Jan Beulich <jbeulich@suse.com>
Cc: Baptiste Le Duc <baptiste.le-duc@vates.tech>, 
 xen-devel@lists.xenproject.org, Zheng Zhang <zhangzheng@iscas.ac.cn>, 
 Alistair Francis <alistair.francis@wdc.com>, 
 Connor Davis <connojdavis@gmail.com>, 
 Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
 Andrew Cooper <andrew.cooper3@citrix.com>, 
 Anthony PERARD <anthony.perard@vates.tech>, 
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, 
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, 
 Stefano Stabellini <sstabellini@kernel.org>
In-Reply-To: <a857c595-53ca-4848-ba1a-e0cc5da572c0@suse.com>
References: <1789032657.8631fc262581453bbf619ec5b2062170.1a08aa7f23b000c4f3@vates.tech>
 <a857c595-53ca-4848-ba1a-e0cc5da572c0@suse.com>
Date: Thu, 10 Sep 2026 11:56:03 +0200
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789034168; l=2230;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=r2qWR2lokpGc90Yxnlr9AvFDQNPvU2bqxZYSTc5oCbU=;
 b=Ytz6+f8rhXm/2JYntkAuYvAHJJaK/MwnurGSSEuvp/l1ZIKQyoqbVbdc6xRfO5t87OFWyZ6lu
 gZHw7sTBvskANukekYrmlJWpd6Xp5SHEHimCmhXx+VqnHh8pUgp2XEw
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1789034169122
X-purgate-ID: tlsNG-c201ff/1789034175-F4EA12A1-ABA62935/10/73395122804
X-purgate-type: spam
X-purgate-size: 2234

On 2026-09-10 11:47 +0200, Jan Beulich wrote:
> On 10.09.2026 11:30, Baptiste Le Duc wrote:
> > This series introduces bugs fixes that were found while bringing up CI
> > support for the HiFive Premier P550 board with a basic smoke test. The
> > board-support series itself will follow separately as it depends on
> > PLIC/vPLIC and dom0less support that have not been upstreamed yet. This
> > series carries only the independent fixes found along the way, none of them
> > need the board-support series to apply.
> > 
> > This series:
> >     1: Fix Svade/Svadu A/D bit handling
> >     2: Set A/D bits in Xen's own page-table mappings under Svade
> >     3: Make Svpbmt no longer a required extension
> >     4: Make Zihintpause no longer a required extension
> >     5: Flush speculatively cached Bare-mode TLB entries in turn_on_mmu()
> >     6: Fix level_map_mask truncation on load_start
> > 
> > CI pipeline:
> > https://gitlab.com/xen-project/people/baptleduc/xen/-/pipelines/2836284276
> > 
> > ---
> > Changes since v1:
> > - address ML comments
> > - rename some patchs
> > - add new patch-fix: 242dd1f890e4 ("xen/riscv: fix level_map_mask
> >   truncation on load_start") discovered when working on Spacemit K3 support
> > 
> > To: Zheng Zhang <Zheng Zhang <zhangzheng@iscas.ac.cn>
> > To: Alistair Francis <alistair.francis@wdc.com>
> > To: Connor Davis <connojdavis@gmail.com>
> > To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > To: Andrew Cooper <andrew.cooper3@citrix.com>
> > To: Anthony PERARD <anthony.perard@vates.tech>
> > To: Michal Orzel <michal.orzel@amd.com>
> > To: Jan Beulich <jbeulich@suse.com>
> > To: Julien Grall <julien@xen.org>
> > To: Roger Pau Monné <roger@xenproject.org>
> > To: Stefano Stabellini <sstabellini@kernel.org>
> > Cc: xen-devel@lists.xenproject.org
> 
> Please can you adhere to patch submission rules? Patches are to be sent To:
> the list, with relevant people Cc:-ed.
> 
Sorry, first time I used b4 tool which automatically added the To: and I
missed that during the dry-run... I'd like to do a .b4-config with the
submission rules that could be added in the repo, do you think it could
be a good idea?
> Jan
> 
> 
> 



