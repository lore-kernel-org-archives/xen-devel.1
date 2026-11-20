Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62C3C606A320
	for <xen-devel@archiver.kernel.org>; Fri, 20 Nov 2026 10:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=Nf2c6CR8
Received: from list by lists.xenproject.org with outflank-mailman.1498022.1696047 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xULxO-0003Ii-Bd; Fri, 20 Nov 2026 10:35:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1498022.1696047; Fri, 20 Nov 2026 10:35:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xULxO-0003Ia-7U; Fri, 20 Nov 2026 10:35:02 +0000
Received: by outflank-mailman (input) for mailman id 1498022;
 Fri, 20 Nov 2026 10:35:01 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1f886103b000183d@swg.vates.tech>)
 id 1xULxN-0003I0-4B
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2026 10:35:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xULxM-00EdCm-Gc
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2026 11:35:00 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1f886103b000183d@swg.vates.tech>)
 id 6b002249-e002-0a2a0a5209dd-0a2a4507ee2c-6
 for <xen-devel@lists.xenproject.org>; Fri, 20 Nov 2026 11:35:00 +0100
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1f886103b000183d@swg.vates.tech>)
 id 6b002254-b4ea-0a2a45070019-b9ff1c2387a5-3
 for <xen-devel@lists.xenproject.org>; Fri, 20 Nov 2026 11:35:00 +0100
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a1f886103b000183d.008 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 20 Nov 2026 10:34:57 +0000
Received: from [192.168.1.37] (lfbn-gre-1-56-253.w92-157.abo.wanadoo.fr
 [92.157.33.253]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 3BD2D832FB;
 Fri, 20 Nov 2026 11:34:57 +0100 (CET)
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
 q=dns/txt; s=selector1; bh=hYp1OFP1RgCjIUacJgar38M8NVKkijPc31gKGaOPV5U=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=Nf2c6CR8vJb1tsuK6hwikwtYZFAvj8I6z9IfxeOlrd5+XnOE8GLyyfaitRsb3XFBM8yIeUVNP
 MirhlXbdJwIUbcxVgOVtjireHzdIl5NS3GKWR5CCGE4m1MA2GcRhWOTwNfaon4T04+6dFGY9ibh
 RGl/nL5LEhgLNltcL+n3qizP5M+++tEp4kg1rAbNE3LMyJVZdZ1R7Ph3LPEE5VMoKGaJur0kNLh
 8WuSmy9HR2d6i9roVEZ/suhCw4Vd+XslgNRmDfk3fGkr9GVEjljHPDinkG6NALVHwb0hZV1PLPL
 58ccbNq7L4FBO8nGjNraz8ik0z6sTqESJNYUoapGFS/w==
X-Zone-Loop: e94de073d660d59c383072b4a4a8f9fe4fdca29be7db
x-campaign-type: default
x-transaction-id: a03783fe-3aa7-4207-8336-0d3d8d961b6c
x-swg-uid: 01-d7e4290a-c139-41e7-b878-f1ce78a3af20
X-Mailer: Sweego
Message-ID:
 <1795170898.8631fc262581453bbf619ec5b2062170.1a1f886103b000183d@vates.tech>
x-swg-bid: 1795170898.8631fc262581453bbf619ec5b2062170.1a1f886103b000183d
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] xen/riscv: add support for riscv,isa-extensions
 devicetree property
From: Baptiste Le Duc <baptiste.le-duc@vates.tech>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: cristian.andrei1423@gmail.com, xen-devel@lists.xenproject.org, 
 alistair.francis@wdc.com, connojdavis@gmail.com, baptiste.le-duc@vates.tech, 
 community.manager@xenproject.org, andrew.cooper3@citrix.com, 
 anthony.perard@vates.tech, michal.orzel@amd.com, jbeulich@suse.com, 
 julien@xen.org, roger@xenproject.org, sstabellini@kernel.org, 
 dmukhin@ford.com
In-Reply-To: <7bece561-1e8f-47d3-bf19-27fa5428c3ed@gmail.com>
References: <20261119154807.80195-1-cristian.andrei1423@gmail.com>
 <av8uF5DrTmmDDFuP@kraken> <7bece561-1e8f-47d3-bf19-27fa5428c3ed@gmail.com>
Date: Fri, 20 Nov 2026 11:34:51 +0100
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795170891; l=1038;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=fcC6FLYHRP70JJuDSC9ApcuczgIAYQSdy4aCN991gdU=;
 b=TTvKCD3AtW2EZCzas781og96U5SDTGytjyeGGVWXJLEVh8WHFnnQKfuC2btsFDXLI8Pwegxq9
 IZb+rJB9XKqA4XsdDR95SWs6i+YK245E5iFk2fhuV/BCRbOv28ArsBj
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1795170897461
X-purgate-ID: tlsNG-ef75cf/1795170900-A4AC8AE4-CA0F12EF/0/0
X-purgate-type: clean
X-purgate-size: 1038
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 2026-11-19 20:33:51+01:00, Oleksii Kurochko wrote:
> [ ... 11 lines skipped ... ]
> This reads as if skipping were the new behaviour. Maybe something like:
> 
>    "Currently, a CPU with neither property is skipped with a message.
>     Make this an error instead, as a skipped CPU is left out of the
>     intersection and Xen could then use extensions that CPU lacks."
> 
> Also, the same argument applies to CPU nodes for which
> dt_get_cpuid_from_node() fails: they are still silently skipped. Either
> handle them the same way or explain why that case is different.
If it is handled in the same way, then it could worth to do it in a
dedicated patch in this patch series.
> [ ... 60 lines skipped ... ]
> Mixing the return code check with reading the riscv,isa property in one
> condition makes the last "else" ("-ENOENT and no riscv,isa") not obvious.
> I think a switch ( ret ), or handling -EINVAL first and then -ENOENT
I agree the switch would be better

-- 
Baptiste Le Duc <baptiste.le-duc@vates.tech>

