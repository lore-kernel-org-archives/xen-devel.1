Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10463606A329
	for <xen-devel@archiver.kernel.org>; Fri,  6 Nov 2026 13:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=BKJI3ysW
Received: from list by lists.xenproject.org with outflank-mailman.1476601.1682621 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xPK2n-0006GH-4f; Fri, 06 Nov 2026 13:31:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1476601.1682621; Fri, 06 Nov 2026 13:31:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xPK2n-0006GA-24; Fri, 06 Nov 2026 13:31:49 +0000
Received: by outflank-mailman (input) for mailman id 1476601;
 Fri, 06 Nov 2026 13:31:48 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1b10edd37000403d@swg.vates.tech>)
 id 1xPK2m-0006G4-Cv
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2026 13:31:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xPK2l-00D3BR-PY
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2026 14:31:47 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1b10edd37000403d@swg.vates.tech>)
 id 6aedd6b1-bab6-0a2a0a5309dd-0a2a45078b6e-26
 for <xen-devel@lists.xenproject.org>; Fri, 06 Nov 2026 14:31:47 +0100
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1b10edd37000403d@swg.vates.tech>)
 id 6aedd6c3-b4ea-0a2a45070019-b9ff1c2381bf-3
 for <xen-devel@lists.xenproject.org>; Fri, 06 Nov 2026 14:31:47 +0100
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a1b10edd37000403d.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 06 Nov 2026 13:31:43 +0000
Received: from [100.68.94.6] (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 0FB0381169;
 Fri,  6 Nov 2026 14:31:43 +0100 (CET)
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
 q=dns/txt; s=selector1; bh=u8mm/KHvTwp0R3EYoIGhIknm360bF8HWMXGQ5Pgekjg=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=BKJI3ysWe4PAsPir+txe2pjX2Gui0vgYezTHBEMJ7SpzsJJyz2lTa5u71uCOb4//F4cVVu/s4
 XxjiQ0/ozabWPF6FjOnrsFqfN1LkmMqjqDhCXBKtr8v67PI7m5tveLpWlryJzYm5JxCNWfRJlES
 6VBoMqHsqn+xF7smHxBTGaflRL/l8taGbxz/Ya67+xd5cAylWues4ZDHTPa1PbBYEcI2VH3QGQ7
 TSw4boY3ESIRscBJDQW1L+PzjJ6XSTClyrERfte4h4/DdURuE0UWB80CujAWuYPOYcXcfxTuQQv
 dw121nwoliKzgTVwEQ7AxfJtkvCX1wUMio0I29MUf7AQ==
X-Zone-Loop: e5d0cccfd4e5059aec3db6d354f4dd2e5e1dcd6bcd59
x-campaign-type: default
x-transaction-id: 9bec9bf5-8fe5-4549-983d-22cd8e352259
x-swg-uid: 01-743ec78e-7e92-4c66-90c4-dfd4e7f0bb1d
X-Mailer: Sweego
Message-ID:
 <1793971903.8631fc262581453bbf619ec5b2062170.1a1b10edd37000403d@vates.tech>
x-swg-bid: 1793971903.8631fc262581453bbf619ec5b2062170.1a1b10edd37000403d
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3 32/39] xen/riscv: save and clear the old IMSIC
 VS-file on vCPU migration
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
In-Reply-To: <83bd8ba2-9053-44ac-a15e-fa6ea52429e2@gmail.com>
References: <cover.1790779209.git.oleksii.kurochko@gmail.com>
 <e2cf140c63b1f1cff8e63988f82fff7e2b063c84.1790779209.git.oleksii.kurochko@gmail.com>
 <1793721767.8631fc262581453bbf619ec5b2062170.1a1a22617dd000403d@vates.tech>
 <83bd8ba2-9053-44ac-a15e-fa6ea52429e2@gmail.com>
Date: Fri, 06 Nov 2026 14:31:37 +0100
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793971897; l=1808;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=zi3EUhfwD0gPRC0bg6MU/NxnUzBSDu/tgMxeWG3QGn8=;
 b=kNwC1/1CoCRCq6McEiFcjLOncghtYSET7i+q15GDI8mvcsXYQ9b4i9I6Wxx2scFRqcNG9PQDK
 XqpXlODiOwOB98JRdSSw90CCSBvA+K+Ssk77e/u+LjJ7JA6ztUgiu9k
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1793971903274
X-purgate-ID: tlsNG-ef75cf/1793971907-A58C1AE4-9D093456/0/0
X-purgate-type: clean
X-purgate-size: 1808
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 2026-11-06 10:52 +0100, Oleksii Kurochko wrote:
> [ ... 25 lines skipped ... ]
> > I think it's worth mentioning that this MRIF structure could be reused
> > for software interrupt files later.
> 
> I'm fine with making that explicit. I tried to cover it with "... a vCPU
> which doesn't own a guest interrupt file ...", and adding "hardware"
> should make it clearer: "... a vCPU which doesn't own a hardware guest
> interrupt file ...". I think that covers your suggestion as well, so
> I'll add it.
> 
> To be honest, I'm a bit unsure how much to say about software interrupt 
> files at this point: some earlier commit messages mentioned them, and I 
> was asked to drop that, as they are neither introduced nor used yet.
> That's why I'd rather keep the wording implicit as above, but if you
> still prefer them to be named explicitly, I can add a sentence.

Agreed, keep it implicit.

> 
> At this point, I'm honestly getting a bit confused about how commit 
> messages are supposed to be written.

Sorry for the confusion. I'm generally not a fan of mentioning things
which don't exist yet, but here the commit message explains why the MRIF
layout is used, and the spec ties MRIFs closely to s/w interrupt files,
so I wondered whether a short hint would help. The implicit wording is
fine too.

I should have marked it as a nit. As I said before, your commit messages
are great, and this was just my subjective opinion, possibly partly
because I'm not a native English speaker. Feel free to discard such
remarks whenever you don't find them accurate ;)
> [ ... 49 lines skipped ... ]
> > Nit: is this blank line really needed?
> > 
> 
> No real need. Lets drop it.
> 
> Thanks for review!
You're wecome!

-- 
Baptiste Le Duc <baptiste.le-duc@vates.tech>

