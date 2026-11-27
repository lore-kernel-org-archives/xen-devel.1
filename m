Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 925C3606A31E
	for <xen-devel@archiver.kernel.org>; Fri, 27 Nov 2026 16:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=HP8mM/dT
Received: from list by lists.xenproject.org with outflank-mailman.1505327.1700157 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWyUp-0004Xk-Ng; Fri, 27 Nov 2026 16:08:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1505327.1700157; Fri, 27 Nov 2026 16:08:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWyUp-0004Xd-Ks; Fri, 27 Nov 2026 16:08:23 +0000
Received: by outflank-mailman (input) for mailman id 1505327;
 Fri, 27 Nov 2026 16:08:22 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xWyUo-0004XX-4f
 for xen-devel@lists.xenproject.org; Fri, 27 Nov 2026 16:08:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xWyUn-00AaEb-H2
 for xen-devel@lists.xenproject.org; Fri, 27 Nov 2026 17:08:21 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a21dc3c11d0004767@swg.vates.tech>)
 id 6b09aae9-bab6-0a2a0a5309dd-0a2a450ccee2-24
 for <xen-devel@lists.xenproject.org>; Fri, 27 Nov 2026 17:08:21 +0100
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a21dc3c11d0004767@swg.vates.tech>)
 id 6b09aaf5-f479-0a2a450c0019-b9ff1c228d19-3
 for <xen-devel@lists.xenproject.org>; Fri, 27 Nov 2026 17:08:21 +0100
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a21dc3c11d0004767.006 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 27 Nov 2026 16:08:17 +0000
Received: from [192.168.1.72] (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 05CB881A5D;
 Fri, 27 Nov 2026 17:08:17 +0100 (CET)
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
 q=dns/txt; s=selector1; bh=YEIWJ0xfHSVptzab6DUlZAuBHSG24BBHeJv5ceBppEo=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=HP8mM/dTnBB5+dDD1dE267MBJrcS4iXDKw+f7SV9frq/J6Psuk6EksmrKp6CbyH5DPnsQZgsA
 NhXCBES5hfHPDre0VggX2QEh9nXKv2Y6Nf30s2xX3Ost+chYye94ZUDp10i/G3159fmR7YXHi7F
 PHegRYaLUqyFeRlbi3CJgqm+6iy5EjFdEbL8pGdUfmf+PzqhcJwoXSC24wc3m93Tv4TqVbqvjwb
 I3WoXulUeW6CW2xIK3DKZJ0w0dO9Upl3jG/10EuYy6CKiyMr2PGysm2b1XYe/ZSpz5LR2JhJT45
 r+13i61dLrEQ6mcQaUbhB9yAkhHxYvER8y1x28pD5ONw==
X-Zone-Loop: 1a9ecbf34e80b50b93d7809ca984b0462b47d61dad39
x-campaign-type: default
x-transaction-id: 8b1fcddc-aea4-43ad-a263-0f7fdecd40ee
x-swg-uid: 01-f64cbcf7-3b31-4830-8aa4-7218e6bac00b
X-Mailer: Sweego
Message-ID:
 <1795795698.8631fc262581453bbf619ec5b2062170.1a21dc3c11d0004767@vates.tech>
x-swg-bid: 1795795698.8631fc262581453bbf619ec5b2062170.1a21dc3c11d0004767
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v4 06/42] xen/riscv: introduce CPU_NONE
From: Baptiste Le Duc <baptiste.le-duc@vates.tech>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: xen-devel@lists.xenproject.org, 
 Romain Caritey <Romain.Caritey@microchip.com>, 
 Alistair Francis <alistair.francis@wdc.com>, 
 Baptiste Le Duc <baptiste.le-duc@vates.tech>, 
 Connor Davis <connojdavis@gmail.com>, 
 Andrew Cooper <andrew.cooper3@citrix.com>, 
 Anthony PERARD <anthony.perard@vates.tech>, 
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
 Julien Grall <julien@xen.org>, 
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, 
 Stefano Stabellini <sstabellini@kernel.org>
In-Reply-To: <a51aa4f8b8dc9b4b3d70440b546ee802510dda00.1794562488.git.oleksii.kurochko@gmail.com>
References: <cover.1794562488.git.oleksii.kurochko@gmail.com>
 <a51aa4f8b8dc9b4b3d70440b546ee802510dda00.1794562488.git.oleksii.kurochko@gmail.com>
Date: Fri, 27 Nov 2026 17:08:10 +0100
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795795691; l=994;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=O4cJ50ku1r8gM3+95XRvMSDeMCkoC4WyB/3RPs0P7/4=;
 b=0bddWfYnVk5rrh/fjJKDNWcCVKPxRxGvld2MDhm5Booa3wjbsNBUQxdiet0k3zTuo6DvbP42n
 sYlhlQsxAwZCxETMZfbSbxapHUynhK03YasIFj9FWdKP+wSOjLZpJMb
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1795795697222
X-purgate-ID: tlsNG-d25034/1795795701-51339A5B-6805F96F/10/73395122804
X-purgate-type: spam
X-purgate-size: 994
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, 13 Nov 2026 16:48:27 +0100, Oleksii Kurochko <oleksii.kurochko@gmail.com> wrote:
> Introduce CPU_NONE, a CPU number which doesn't identify any physical
> CPU, to be used wherever a pCPU has to be recorded but there may be
> none.
> 
> NR_CPUS has been used for that so far: hartid_to_cpuid() returns it for
> a hart Xen doesn't know, pcpu_info[] uses it for an entry whose
> processor_id isn't valid yet, and vsfile_cpu in struct vimsic_state,
> which records the pCPU whose h/w guest interrupt file backs the vCPU's
> IMSIC VS-file, uses it to mean that no h/w guest interrupt file is
> attached. NR_CPUS is however the number of possible CPUs, i.e. an upper
> bound, and a comparison against it reads like a range check rather than
> like a test for "no pCPU". Use CPU_NONE in all these places instead,
> which states that meaning explicitly.
> 
> [...]

Reviewed-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>

-- 
Baptiste Le Duc <baptiste.le-duc@vates.tech>

