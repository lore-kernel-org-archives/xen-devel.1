Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C09BCA5FAC
	for <xen-devel@archiver.kernel.org>; Wed, 30 Sep 2026 12:43:11 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1437177.1655975 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBtdy-0000RP-UH; Wed, 30 Sep 2026 12:42:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1437177.1655975; Wed, 30 Sep 2026 12:42:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBtdy-0000RI-Qp; Wed, 30 Sep 2026 12:42:42 +0000
Received: by outflank-mailman (input) for mailman id 1437177;
 Wed, 30 Sep 2026 12:42:41 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xBtdw-0000RC-Ik
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 12:42:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBtdv-0057HX-71
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 14:42:39 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0f2568c0a0003f66@swg.vates.tech>)
 id 6abd03bd-bab6-0a2a0a5309dd-0a2a4507d93c-8
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 14:42:38 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0f2568c0a0003f66@swg.vates.tech>)
 id 6abd03be-b4ea-0a2a45070019-b9ff1c12af23-3
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 14:42:38 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a0f2568c0a0003f66.006 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 30 Sep 2026 12:42:33 +0000
Received: from [192.168.1.46] (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 614DE829F4;
 Wed, 30 Sep 2026 14:42:32 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=M7CCg8ew+l6odeQzcbd+9zK0TCOGpoe/dQugA8r8ow4=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=FIwsekhjAyz6omCxRz5uWFysWY659nhwRNvfSamID+tCn2Jw4+sVzLspTuY1v/CMQmEKbOd17
 cGlThhzvqdAHKA8jr2RI9fcbIKi6WU7COy6o1jUx6yHZFbbxc3RVqUuWI7bBIiyEAEIZTP3WYU8
 4N4coGWtRSBXUWGRiggYt+r0sWa4KbI5uIwT15bseK4cxKneQi+4U26w7pO55d6IUY2+V5Nz42Q
 hT4jVt/MPyiiiyvLa6Htc8U6k+bblLKk6jabZCHp+MHuPNYeqvkYI6KnbD9leXnQEj9HdmZSWGM
 Gyodozw6ZqFe9M387LCAAXt2V09pTcvBLqcFVkW13Dvw==
X-Zone-Loop: a33fe22ad637aea6dfc40d867e2be602ab1e8843023e
x-campaign-type: default
x-transaction-id: 054457dc-469d-4da7-96c0-fe9084d3b781
x-swg-uid: 01-7c31c95b-a5ab-476d-860b-dbec51d5f82a
X-Mailer: Sweego
Message-ID:
 <1790772153.8631fc262581453bbf619ec5b2062170.1a0f2568c0a0003f66@vates.tech>
x-swg-bid: 1790772153.8631fc262581453bbf619ec5b2062170.1a0f2568c0a0003f66
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3 2/6] xen/riscv: rename PTE "permissions" to
 "pte_flags"
From: Baptiste Le Duc <baptiste.le-duc@vates.tech>
To: Jan Beulich <jbeulich@suse.com>
Cc: Baptiste Le Duc <baptiste.le-duc@vates.tech>, 
 Andrew Cooper <andrew.cooper3@citrix.com>, 
 Anthony PERARD <anthony.perard@vates.tech>, 
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, 
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, 
 Stefano Stabellini <sstabellini@kernel.org>, 
 Alistair Francis <alistair.francis@wdc.com>, 
 Connor Davis <connojdavis@gmail.com>, 
 Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
 xen-devel@lists.xenproject.org
In-Reply-To: <20e04d15-8621-4680-a2dc-8e54ee88d050@suse.com>
References: <1790699381.8631fc262581453bbf619ec5b2062170.1a0ee00218b000b504@vates.tech>
 <1790699585.8631fc262581453bbf619ec5b2062170.1a0ee033eb9000b504@vates.tech>
 <20e04d15-8621-4680-a2dc-8e54ee88d050@suse.com>
Date: Wed, 30 Sep 2026 14:42:26 +0200
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790772147; l=1367;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=+uTjyFGGZJO2dJeVUYYrHle/PX1m8JP/jJpVn0JHlow=;
 b=oZBKM1w1jryjMIKSivmx13SGySKLhOs4LXuHLBcW94iXbItFD7QpPuvorLezkdklWHAnZmbha
 q5RYW245/UDCdbV+Hx90+yQsj4SiFUONRNlpRZeGpBrp9MRiUIqUs4g
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1790772152578
X-purgate-ID: tlsNG-ef75cf/1790772158-358C1AE4-5DA56AD9/10/78276251493
X-purgate-type: spam
X-purgate-size: 1367

On 2026-09-30 14:07:34+02:00, Jan Beulich wrote:
> On 29.09.2026 18:32, Baptiste Le Duc wrote:
> 
> > paddr_to_pte()'s "permissions" parameter, the matching local in
> > 
> > setup_initial_mapping() and p2m_set_permission() don't only deal with
> > 
> > permission bits: they also handle PTE_VALID, PTE_USER, PTE_ACCESSED and
> > 
> > PTE_DIRTY.
> > 
> > 
> > 
> > Rename them to "pte_flags" and p2m_set_pte_flags() respectively.
> > 
> > 
> > 
> > No functional change.
> > 
> > 
> > 
> > Requested-by: Jan Beulich <jbeulich@suse.com>
> > 
> > Assisted-by: Claude:claude-opus-5
> > 
> > Signed-off-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
> 
> In principle
> Acked-by: Jan Beulich <jbeulich@suse.com>
> 
> I won't, however, be able to apply this patch as-is. As you can see both above
> and below, extra newlines were inserted everywhere on the way here. The list
> archive doesn't show this issue, but instead shows undue wrapped lines. It is
> also only this one patch in the series which has this issue. You will need to
> resend for me to properly consume.
> 
It's weird, it appears my original message didn't contain such `\r`. We
took a look with Anthony Perard and it seems to be an issue from Xen's server
side. I will try to resend it, just to see.
Thanks

-- 
Baptiste Le Duc <baptiste.le-duc@vates.tech>

