Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FF4FC79F82
	for <xen-devel@archiver.kernel.org>; Tue,  8 Sep 2026 15:49:59 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1412248.1642790 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3y50-0006Vk-EW; Tue, 08 Sep 2026 15:49:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1412248.1642790; Tue, 08 Sep 2026 15:49:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3y50-0006Vd-Bw; Tue, 08 Sep 2026 15:49:50 +0000
Received: by outflank-mailman (input) for mailman id 1412248;
 Tue, 08 Sep 2026 15:49:49 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x3y4z-0006VT-Fm
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2026 15:49:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x3y4y-009O9S-GU
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2026 17:49:48 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a081b5fc57000c4f3@swg.vates.tech>)
 id 6aa02e73-2eae-0a2a0a5409dd-0a2a4506ec94-46
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 17:49:48 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a081b5fc57000c4f3@swg.vates.tech>)
 id 6aa02e9b-195a-0a2a45060019-b9ff1c2293dd-3
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 17:49:47 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a081b5fc57000c4f3.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 08 Sep 2026 15:49:42 +0000
Received: from [192.168.1.37] (lfbn-gre-1-371-96.w90-112.abo.wanadoo.fr
 [90.112.87.96]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id D1E2A81E3D;
 Tue,  8 Sep 2026 17:49:41 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=PjSKXYrFDqF1tvOk46fFDGwrgwt46WQi78Ek5Z9BM/c=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=TGaazBb6pbi0CVEVn2LeloQndE9qKh/IPgIumbFTFbhtUOfsBJGJZ3UbHxC5B9NBz76pmeP7s
 aujF/6nZF7HQ+dEToD6YCVviiLD0t95X8VQ894d6zD5rJkcNO55q3jjQ/HmdP8/g+xgQ2eHjBll
 dDzcp44nuomxssdhDxQECWbXYC9MITYRI0DHb/MjkSNnz/Mpeib2PgwYMbjGVibryamW0+x4Yv5
 zCeRc27kfo3+l/JzFB8Ge/jj9h1qGA3Wvyu3oK85xq55LM1a0KmrUv5AtySld2S4Tgqpovg3HEr
 uHt7fXSJtwboiALv7wmnAt+mCxH5cjDeFMdVmX3om14A==
X-Zone-Loop: b3ead5be65518e820b1ada6b7346fc55ec353665d055
x-campaign-type: default
x-transaction-id: 30865c66-a9ba-418e-8c07-36b2701edc16
x-swg-uid: 01-a0ff05e6-b74b-4197-92af-c4610b584eff
X-Mailer: Sweego
Message-ID:
 <1788882582.8631fc262581453bbf619ec5b2062170.1a081b5fc57000c4f3@vates.tech>
x-swg-bid: 1788882582.8631fc262581453bbf619ec5b2062170.1a081b5fc57000c4f3
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 20/39] xen/riscv: detect Shtvala
From: Baptiste Le Duc <baptiste.le-duc@vates.tech>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Baptiste Le Duc <baptiste.le-duc@vates.tech>, 
 xen-devel@lists.xenproject.org, 
 Romain Caritey <Romain.Caritey@microchip.com>, 
 Zheng Zhang <zhangzheng@iscas.ac.cn>, 
 Alistair Francis <alistair.francis@wdc.com>, 
 Connor Davis <connojdavis@gmail.com>, 
 Andrew Cooper <andrew.cooper3@citrix.com>, 
 Anthony PERARD <anthony.perard@vates.tech>, 
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
 Julien Grall <julien@xen.org>, 
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, 
 Stefano Stabellini <sstabellini@kernel.org>
In-Reply-To: <f8db1000-f309-4e35-8a03-80d09bea1f7f@gmail.com>
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
 <611683b3d2e3b836d08d0499f7caff782ba80a34.1787838835.git.oleksii.kurochko@gmail.com>
 <1788796635.8631fc262581453bbf619ec5b2062170.1a07c968805000c4f3@vates.tech>
 <f8db1000-f309-4e35-8a03-80d09bea1f7f@gmail.com>
Date: Tue, 08 Sep 2026 17:49:36 +0200
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788882581; l=2253;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=BClAJEILSN8n/Pp6M9gTs3jT7uCGm8KrxYpyibuUaAU=;
 b=BWUZ85tFE/nx9Jf6P9sjZc2pq0Vf/NnPgyLkLWdvR2VLzYRVXSyX6pQGn5AnBN6Ew2rgNjwgr
 qQ4g11pdYALB/86mpjnHCv+W2MEZCbH4cGAC385YXxZsWAkeYVmbLQI
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1788882582070
X-purgate-ID: tlsNG-16d1c6/1788882587-1EEC477B-631A84D6/10/73395122804
X-purgate-type: spam
X-purgate-size: 2257

On 2026-09-08 12:15 +0200, Oleksii Kurochko wrote:
> 
> 
> On 9/7/26 5:57 PM, Baptiste Le Duc wrote:
> >> Shtvala says that htval is written with the faulting guest physical address
> >> on a guest-page fault. The H extension itself allows an implementation to
> >> write htval with either that address or with zero, so where the extension is
> >> absent a zero htval cannot be told apart from a genuine fault on guest
> >> physical address 0-3.
> >>
> >> It is not offered to guests. Shtvala describes the HS-mode trap interface,
> >> which a VS-mode guest never sees, and the H extension it belongs to is
> >> already withheld from guests. Its guest-facing counterpart is a separate
> >> extension, Shvstvala.
> >>
> >> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> >>
> > I thought this commit message is not very clear. Here is a more direct
> > suggestion:
> > 
> > ```
> > The H extension allows htval, on a guest-page fault, to be written with
> > either the faulting guest physical address or zero. Shtvala extension
> > removes the ambiguity of this zero-write by guaranteeing that htval is
> > written with the faulting guest physical address in every circumstance
> > permitted by the ISA.
> > 
> > Not offered to guests: Shtvala describes htval, an HS-mode-only trap
> > register a VS-mode guest never touches and the H extension it belongs to
> > is already hidden from guests. The guest-visible equivalent is a
> > separate extension, Shvstvala, covering vstval instead.
> > ```
> 
> Sounds good to me. I will apply your suggestion.
> 
> > 
> > Btw, I saw Linux has Documentation/devicetree/bindings/riscv/extensions.yaml
> > which describes all of the extensions supported, don't you think it would
> > be useful to have the same in docs/misc/devicetree/...?
> 
> I think it could be useful.
> 
> I think also about booting.txt already exitsted in the codebase. Would 
> you be okay with that? I think I will add the section to booting.txt and 
> pointing to riscv_isa_ext[] in cpufeature.c and so we won't miss an 
> update of doc if we will add or remove support of an extension. Does it 
> sound good to you?
> 
Yes it sounds okay!
Thanks
> ~ Oleksii
> 
> 
> 
> 



