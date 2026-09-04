Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7B11C624D3
	for <xen-devel@archiver.kernel.org>; Fri,  4 Sep 2026 11:25:36 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1408294.1640931 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2S2q-0002Bt-2N; Fri, 04 Sep 2026 11:25:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1408294.1640931; Fri, 04 Sep 2026 11:25:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2S2p-0002Bm-VE; Fri, 04 Sep 2026 11:25:19 +0000
Received: by outflank-mailman (input) for mailman id 1408294;
 Fri, 04 Sep 2026 11:25:18 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a06c2a6d8f000c4f3@swg.vates.tech>)
 id 1x2S2o-0002Ba-EW
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2026 11:25:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x2S2n-009Sh8-Qo
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2026 13:25:17 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a06c2a6d8f000c4f3@swg.vates.tech>)
 id 6a9aaa86-8faa-0a2a0a5109dd-0a2a4505e84e-36
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2026 13:25:17 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a06c2a6d8f000c4f3@swg.vates.tech>)
 id 6a9aaa9d-4cb1-0a2a45050019-b9ff1c22a131-3
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2026 13:25:17 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a06c2a6d8f000c4f3.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 04 Sep 2026 11:25:15 +0000
Received: from [192.168.1.46] (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 605EF81C9E;
 Fri,  4 Sep 2026 13:25:14 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=aZ5tMyDuKyvQOmdQm90h6A495RKd0PTPyeo/OaaEC4w=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=mHlyRraUohNdzpcWSPwjxfIq18hPCX+IXom65A//duTKdr6EsOtuYTYTK0G2AHyo6czsdZAgS
 X/mge+PC3EKB7Gt41uu7DzWhqkb3KNfc1bNyp/Cq0SXmx1GFwn4IW7hHS515MrsW7zYGMvba4bp
 39m0nKT82x/R2wl3oUn2AdNf/pCSFPdPzgoTfmQiGEpJ2nWwz0cq3eooIoZf2S9BVk9U5kaZLTI
 CqUAcJiOXoYwXNsCuK2o4wEoUNKlzDfX+IkqRg2gQ1Lsfy9m42d6kfn1sapwbcuoXmbnfnYlCX+
 0sozMKSKQ9IgwfOhv28qFBqucrNUKh6WobaAJxvk4vqQ==
X-Zone-Loop: 972f0256f832ead3680236e38d977a5665b872abc86c
x-campaign-type: default
x-transaction-id: 0433590e-9dd6-4a5f-8683-e8391a126cec
x-swg-uid: 01-7e0903f7-d3e7-4bbe-8b93-3244d29af3e8
X-Mailer: Sweego
Message-ID:
 <1788521115.8631fc262581453bbf619ec5b2062170.1a06c2a6d8f000c4f3@vates.tech>
x-swg-bid: 1788521115.8631fc262581453bbf619ec5b2062170.1a06c2a6d8f000c4f3
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 14/39] xen/riscv: introduce
 vintc_ctxt_switch_{from,to}()
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
In-Reply-To: <678236568970b18a1924a76588c4c50f9bf0c659.1787838835.git.oleksii.kurochko@gmail.com>
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
 <678236568970b18a1924a76588c4c50f9bf0c659.1787838835.git.oleksii.kurochko@gmail.com>
Date: Fri, 04 Sep 2026 13:25:07 +0200
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788521114; l=915;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=+PSoSQsMfJf1UsZgvzap2TWt7h1iD76VWcmF0+vMSBY=;
 b=tWQW40yZpiCTdeZGOGsMpR8USsIyXyevHl6r3DY+dRTW6Y4TkdueBrI+k9X7wYjsw1y0KjVc1
 TO61tOpNWElDSJt9KCGn3EUcLKjCg8LjkXqF7dx/Gfa7/9UzkSqEovP
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1788521114591
X-purgate-ID: tlsNG-c201ff/1788521117-F44A42A1-531B777C/0/0
X-purgate-type: clean
X-purgate-size: 915

> Virtual interrupt controller state must be preserved across vCPU context
> switches.
> 
> Introduce vintc_ctxt_switch_{from,to}() wrappers around new
> ctxt_switch_{from,to}() hooks in struct vintc_ops, and call them from the
> context switch path, so that this state can be saved/restored without
> knowing which vINTC variant a domain uses.
> 
> No vINTC variant implements the hooks yet: the vAPLIC implementation is
> added separately.
So this patch couldn't be applied alone as, at the time of this commit, you only set in vaplic.c:
    static const struct vintc_ops vintc_ops = {
        .vcpu_init = vcpu_imsic_init,
        .vcpu_deinit = vcpu_imsic_deinit,
    };

So ops->ctxt_switch_from(v) or ops->ctxt_switch_to(v) will try to
deference NULL pointer causing segfault. I don't know if it's matter but
worth to mention somewhere.

-- 
Baptiste Le Duc <baptiste.le-duc@vates.tech>

