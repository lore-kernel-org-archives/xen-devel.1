Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B63606D81E
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2026 15:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=DgpCJKVW
Received: from list by lists.xenproject.org with outflank-mailman.1474957.1681804 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOzRp-00076N-Bt; Thu, 05 Nov 2026 15:32:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1474957.1681804; Thu, 05 Nov 2026 15:32:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOzRp-00076C-8F; Thu, 05 Nov 2026 15:32:17 +0000
Received: by outflank-mailman (input) for mailman id 1474957;
 Thu, 05 Nov 2026 15:32:16 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1ac56c714000403d@swg.vates.tech>)
 id 1xOzRo-000766-69
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 15:32:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOzRn-00ACEC-Ir
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 16:32:15 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1ac56c714000403d@swg.vates.tech>)
 id 6aeca17a-8faa-0a2a0a5109dd-0a2a4504e3c8-14
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 16:32:15 +0100
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1ac56c714000403d@swg.vates.tech>)
 id 6aeca17f-b57f-0a2a45040019-b9ff1c22a169-3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 16:32:15 +0100
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a1ac56c714000403d.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 05 Nov 2026 15:32:10 +0000
Received: from [192.168.1.52] (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id C4F3781B70;
 Thu,  5 Nov 2026 16:32:09 +0100 (CET)
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
 q=dns/txt; s=selector1; bh=67IJ2VlkQk8CWLRCmfYjQ8FZ+IjQ53SgA/8l9TtJeDA=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=DgpCJKVWIF/vJFklcAHfAVL14Io6uEZFdSKIu80j5EoX9q+jM7hcsl6JWYtVC92+uajQmAMlf
 9l3+yA/N45dxQuIPBheP6Mj4qEYdJ1nT421Rv2TLAF55r8XuwQXVUkLb5Lnt8K4PKwiSc0027GG
 yvWNcSHj5rU4zlmWbDYq3QwWXeGXc8Mfq1qNwe7l0oHaUAp2gPBMgm5wJppnr6FESAh2j6nt3EK
 pd8wzuFP6arFKXJZdeRzg/EjOVzi+YPwq9aD6I2siwwMVS0/6kZ6X3DuIIp/pj0X25a5b5g+9+W
 Dgjs1O8XaE9h2lY1fBQWjFqGJ8jS0eY/HmZ1ulYAfLyw==
X-Zone-Loop: 72a1a22e8b9728abd988cca73efcc5cf3c8f7190a366
x-campaign-type: default
x-transaction-id: df7246e1-b429-4078-883a-64b99563e646
x-swg-uid: 01-32ad53e0-f6b3-40da-bbbe-9105eccea577
X-Mailer: Sweego
Message-ID:
 <1793892730.8631fc262581453bbf619ec5b2062170.1a1ac56c714000403d@vates.tech>
x-swg-bid: 1793892730.8631fc262581453bbf619ec5b2062170.1a1ac56c714000403d
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3 30/39] xen/riscv: implement APLIC-IMSIC-hart sync
 barrier for vCPU migration
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
In-Reply-To: <cf206b92-88df-4f51-b10b-960e0c141d9e@gmail.com>
References: <cover.1790779209.git.oleksii.kurochko@gmail.com>
 <2075cb10e5f6df787b29f2f087632c82b787a007.1790779209.git.oleksii.kurochko@gmail.com>
 <c77101fe-2505-4cdb-8520-52f92a1c668d@gmail.com>
 <1792763490.8631fc262581453bbf619ec5b2062170.1a16907f005000f79f@vates.tech>
 <cf206b92-88df-4f51-b10b-960e0c141d9e@gmail.com>
Date: Thu, 05 Nov 2026 16:32:03 +0100
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793892724; l=446;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=rbHjhBRJ74ax8FvfD/Slk34KbzKzPkVzevsTvpuAz1A=;
 b=7kBKG5hyOFCYiJlobCvzpUwKAeWb5opkica6jYUZDZI7UCro8hiKHXeoj1aSjbjBXGwFpdkz2
 h6UD5b/nlOLARwMeE3KU2zplvMNMVA5LrUySfHXA3PnpJlv1futqFtn
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1793892730034
X-purgate-ID: tlsNG-ebf023/1793892735-510DDB50-975678DE/0/0
X-purgate-type: clean
X-purgate-size: 446
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 2026-11-05 15:21 +0100, Oleksii Kurochko wrote:
> [ ... 348 lines skipped ... ]
> > LGTM, but I wonder why, as I said in the original patch, sync_id is
> > really needed.
> > 
> 
> I think that I am not understand your response. Could you please 
> re-phrase it?
I'm questionning the need of the sync_id field as it will always be
equal to imsic_cfg.nr_ids, couldn't we drop it? 

-- 
Baptiste Le Duc <baptiste.le-duc@vates.tech>

