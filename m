Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0F44CA5FFC
	for <xen-devel@archiver.kernel.org>; Mon,  5 Oct 2026 14:53:57 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1440925.1658453 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDk4T-0004ks-SA; Mon, 05 Oct 2026 14:53:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1440925.1658453; Mon, 05 Oct 2026 14:53:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDk4T-0004kl-P7; Mon, 05 Oct 2026 14:53:41 +0000
Received: by outflank-mailman (input) for mailman id 1440925;
 Mon, 05 Oct 2026 14:53:41 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a10c8e56370003f66@swg.vates.tech>)
 id 1xDk4T-0004kf-4u
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2026 14:53:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xDk4S-003Alk-Hk
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2026 16:53:40 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a10c8e56370003f66@swg.vates.tech>)
 id 6ac3b9d8-bab6-0a2a0a5309dd-0a2a450a8776-30
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 16:53:40 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a10c8e56370003f66@swg.vates.tech>)
 id 6ac3b9f3-f2d2-0a2a450a0019-b9ff1c22a9f9-3
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 16:53:40 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a10c8e56370003f66.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 05 Oct 2026 14:53:37 +0000
Received: from [192.168.1.46] (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 7A57D822C6;
 Mon,  5 Oct 2026 16:53:36 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=ZwjpMuD3dD57MrlsOKy3LAP82RZWtZIixknLFQvmnO4=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=Wqt3emVQGB3UCaKt0xR8NzSmyCP8EmcpqfiBvnVOUHOU9cqMoLE6x4w5Avr1AIg567uONPIIV
 3UPPkr9IzCDE6LsaiYyxWp078JhoP/qj4YDD5nFTh8cO4xTGDid9PBf5FPAC9psNwrK6AoWxLKr
 bhEfNa7kzxYc9CunW258p+8k1PHu31XfoMANZHIpQn7ygJwIrN8bwWmnxrfjNZKL6b7AapxF2e6
 Ku3fOliwvnZAodk0d0bvctGdQLpUSFhe4jmhMKVyhyRvb4M988u24oaZ72d6AQ78z5UmDY8q/7x
 4vvp/aCi174GTzcLjhFfg2ThJ5/dD4f3mdq2pfeZPheA==
X-Zone-Loop: 8ec3ef9587124b76650f64ab85364d5103f65fda136d
x-campaign-type: default
x-transaction-id: ed6863e1-72bb-48e2-8aac-b25f129ca312
x-swg-uid: 01-d6ec714d-384c-44c4-9271-3a2a9bda3ebf
X-Mailer: Sweego
Message-ID:
 <1791212017.8631fc262581453bbf619ec5b2062170.1a10c8e56370003f66@vates.tech>
x-swg-bid: 1791212017.8631fc262581453bbf619ec5b2062170.1a10c8e56370003f66
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3 07/39] xen/riscv: introduce CPU_NONE
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
In-Reply-To: <d35b280c0bf075a2a730f9cb69ced407e346ebd5.1790779209.git.oleksii.kurochko@gmail.com>
References: <cover.1790779209.git.oleksii.kurochko@gmail.com>
 <d35b280c0bf075a2a730f9cb69ced407e346ebd5.1790779209.git.oleksii.kurochko@gmail.com>
Date: Mon, 05 Oct 2026 16:53:30 +0200
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791212011; l=1408;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=DVpF4XmuD3vIbw0CPe5ayj74ZGG/78GS69wrRuKHW4k=;
 b=P/ifraCcbY4/ZNMZkC0mTIGFfw3ULzOsZ4HRISpQMkaAreWiOYGvQ/Kx4xxufSQcXPko2n4/M
 hNevP9cDIxQCFBnXibg/y34aOymsKKDBgtVq6miPYbDDLU1EbQauz6o
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1791212016707
X-purgate-ID: tlsNG-4011c0/1791212020-599C1CFC-DC7C58C2/0/0
X-purgate-type: clean
X-purgate-size: 1408

> Introduce CPU_NONE, a CPU number which doesn't identify any physical
> CPU, to be used wherever a pCPU has to be recorded but there may be
> none.
> 
> Its first user is vsfile_cpu in struct vimsic_state, which records the
> pCPU whose h/w guest interrupt file backs the vCPU's IMSIC VS-file.
> NR_CPUS has been used there as the value meaning that there is no such
> pCPU, i.e. that the s/w VS-file is in use. NR_CPUS is however an upper
Nit: It's hard to understand when reading the message why s/w is mentioning.
I'd reword it to:
    ```
    NR_CPUS has been used there to mean that no h/w guest interrupt file is
    attached (i.e. the vCPU uses the s/w VS-file), so there is no pCPU to
    record.
    ```
> bound rather than a "no CPU" marker, and it already carries other
> meanings: hartid_to_cpuid() returns it for a hart Xen doesn't know, and
> pcpu_info[] uses it for an entry whose processor_id isn't valid yet.
> Use CPU_NONE for vsfile_cpu instead, so that the s/w VS-file case can't
> be mistaken for any of those.
Nit: Same as above, I'd prefer something like:
    ```
    Use CPU_NONE for vsfile_cpu instead, so that "no h/w guest interrupt
    file attached" can't be mistaken for an unknown hart or a not-yet-valid
    pcpu_info[] entry.
    ```

Reviewed-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>

-- 
Baptiste Le Duc <baptiste.le-duc@vates.tech>

