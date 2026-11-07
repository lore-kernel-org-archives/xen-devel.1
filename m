Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48B6C606D814
	for <xen-devel@archiver.kernel.org>; Sat,  7 Nov 2026 14:50:12 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1478153.1683083 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xPhjx-0007Od-CO; Sat, 07 Nov 2026 14:49:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1478153.1683083; Sat, 07 Nov 2026 14:49:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xPhjx-0007OW-9U; Sat, 07 Nov 2026 14:49:57 +0000
Received: by outflank-mailman (input) for mailman id 1478153;
 Sat, 07 Nov 2026 14:49:55 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien.grall.oss@gmail.com>) id 1xPhjv-0007OQ-OF
 for xen-devel@lists.xenproject.org; Sat, 07 Nov 2026 14:49:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xPhjq-002eS7-58
 for xen-devel@lists.xenproject.org; Sat, 07 Nov 2026 15:49:50 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <julien.grall.oss@gmail.com>)
 id 6aef3a8e-e002-0a2a0a5209dd-0a2a4505d2b0-0
 for <xen-devel@lists.xenproject.org>; Sat, 07 Nov 2026 15:49:50 +0100
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <julien.grall.oss@gmail.com>)
 id 6aef3a8d-4cb1-0a2a45050019-d1558036c1e0-3
 for <xen-devel@lists.xenproject.org>; Sat, 07 Nov 2026 15:49:50 +0100
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4a5036bbac7so9623525e9.3
 for <xen-devel@lists.xenproject.org>; Sat, 07 Nov 2026 06:49:50 -0800 (PST)
Received: from [10.0.0.150] (gw1.octic.net. [88.97.20.152])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b7efb1b64esm77066915e9.13.2026.11.07.06.49.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 Nov 2026 06:49:48 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794062989; x=1794667789;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ObZ3+Uzw3BQkWZUe0Pb8IiImCpslGGfRhFh87oNd7Po=;
        b=cC4CqhkuGnSuUWXdPynJ2bfyHATtRtF4ZiTWZwQc5bTDAjNFqKsEPm7ko9SeZJQ29H
         DLARsyEddBbuGQZKZwMcpPdXm1O96RB3TjCTCmG1Pp2cfV0DAp+8BsvsO9AsnxNtSI2E
         IuHiYyVqPB8+OF4uhh+R4tX+MWzWBo2ZjWm1HqSEvovYENtxE4XsvNJ05vmeD2uYK+uW
         hciXrquI/VlCwT4Gh5f4HnQphJ24jG7em/P9SXeAHXJTNsijorgHxX0MgT9tIXndQE27
         fUd0Qgt3ndvOXJej0rQs9Rj+u5VJ1//ORaR0ZhJM4aJZeExUjwVdUQA+6jeycEyNjJXy
         oyaw==
X-Forwarded-Encrypted: i=1; AKwUvBwY/ocMOEz82COeMHAMn42xhJ2vMq40Cu9R1Li0J0zyO5HmwycreXwLUiXd1u7twicZQ8SnUf0wW6c=@lists.xenproject.org
X-Gm-Message-State: APuU4Z/G8dyEiYdl9NCgFyvQPZ5fpQH5aOoQyuL61iLuNQ1Cog23HPPr
	H3b/H44Z78SuR8UXF/S4AqHsnjvpirjTuEFr2ZYJJESTANa5GnavPdAh
X-Gm-Gg: AYBFou2BaHqNNxM5gLM+96NBWzldcmthNOH2+9a13hmnc8ql0g/OYzKCDxnzZE3YuTQ
	De37gJ1z1ijGLlmwNt6DVBgYv3XGu7R9eipGsJy1DEeMjcB2qXU/CWfdrIDAG1T3MOOybquoIMV
	6f4uu6erUY2hAeW4jNPHJ98+cIdMjSW+a95B9i2YTCph0OdVWLgR5OlsOQdOfZY2Zu4S0wHPq1T
	mvnI07buctGhAlsSbyt+uwJGywz48AGhKTXSAre7ReFuSQGbjjNu7MQyZnx8DORkBVx+y82fP/P
	pdDnwP74TQe4VfkcqR6pEltcC2qbOhjworpHlErRlxLOg+1qz2waQC3Z/Nj/mwRdjH2ZiMShczd
	uffKuoOSlv3oAgV+r5TJaMz/kNcAWFSGLnTS69DpGn8YoCK+HEwKoXs4diZWa/7CBYzhpbApTp1
	+6zfI1WYes9E8OwAa1oT+TNtTnsXCroCKqMUdXbOlSMsKx1B6+FDGhNr2ADke7nn/Jys3JuBLHG
	bmHGOaaF8m39WzidO7bnXxaHtLEZa4PS3qBB4GuWiijgnxf2x/vXJibY5Mfesd8mTg2SUCr/2bc
	xRDh+dP9n/ad5MSk++RyvNFuugIX/uBaR+Xdx9daxzyazNZVNS/w1TKz75RM9Yw0cg==
X-Received: by 2002:a05:600c:8b23:b0:4a7:7f3f:6f8e with SMTP id 5b1f17b1804b1-4b6d8591107mr103909295e9.0.1794062989469;
        Sat, 07 Nov 2026 06:49:49 -0800 (PST)
Message-ID: <52856dac-7f48-4ecb-be5a-5479260f6d03@xen.org>
Date: Sat, 7 Nov 2026 14:48:33 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] xen/arm: guest_walk: refuse an address outside both
 halves of the range
To: Stefano Stabellini <stefano.stabellini@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20261107021442.253612-1-stefano.stabellini@amd.com>
 <20261107021442.253612-2-stefano.stabellini@amd.com>
Content-Language: en-GB
From: "Grall, Julien" <julien@xen.org>
In-Reply-To: <20261107021442.253612-2-stefano.stabellini@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1794062990-F48A62A1-817E3677/0/0
X-purgate-type: clean
X-purgate-size: 2116
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Stefano,

On 07/11/2026 02:14, Stefano Stabellini wrote:
> The bits of an input address from its top bit (bit 63, or bit 55 with
> the top byte ignored) down to the input address size must be all 0 for
> TTBR0 and all 1 for TTBR1, else the walk faults (ARM DDI 0487A.k
> J1.1.5). guest_walk_ld() chose the base from the top bit alone and

Similar to your first patch, the specification is quite old. Please 
quote a more recent one (e.g. M.d).

> translated such an address. Refuse it before reading any table.
> 
> Fixes: 7d623b358a45 ("arm/mem_access: Add long-descriptor based gpt")
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> Cc: Julien Grall <julien@xen.org>
> Cc: Bertrand Marquis <bertrand.marquis@arm.com>
> Cc: Michal Orzel <michal.orzel@amd.com>
> Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> ---
>   xen/arch/arm/guest_walk.c | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/xen/arch/arm/guest_walk.c b/xen/arch/arm/guest_walk.c
> index e23457869b..a8f8530683 100644
> --- a/xen/arch/arm/guest_walk.c
> +++ b/xen/arch/arm/guest_walk.c
> @@ -407,6 +407,15 @@ static bool guest_walk_ld(const struct vcpu *v,
>           if ( (input_size > TCR_EL1_IPS_48_BIT_VAL) ||
>                (input_size < TCR_EL1_IPS_MIN_VAL) )
>               return false;
> +
> +        /*
> +         * The bits of the GVA from the top bit down to the input size must
> +         * all be 0 for TTBR0 and all 1 for TTBR1, or the translation faults
> +         * (ARM DDI 0487A.k AArch64.TranslationTableWalk(), J1.1.5).
> +         */

Regardless what I wrote above, I checked the algorithm in A.k and I 
can't find the logic suggesting for a fault. Instead it seems to be:


if inputaddr<top> == '0' then
   inputsize = 64 - UInt(TCR_EL1.T0SZ);
   [...]
else
   inputsize = 64 - UInt(TCR_EL1.T1SZ);
   [...]

And this seems right to me because the be used for tagging. So they are 
not guarantee to be all 1s or all 0s. Can you point me to the part of 
the algorithm that says otherwise?

Cheers,

-- 
Julien Grall


