Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D772606A328
	for <xen-devel@archiver.kernel.org>; Wed,  4 Nov 2026 11:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WnzqPhF/
Received: from list by lists.xenproject.org with outflank-mailman.1471748.1679965 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOZUa-0008BQ-4W; Wed, 04 Nov 2026 11:49:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1471748.1679965; Wed, 04 Nov 2026 11:49:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOZUa-0008BJ-1Z; Wed, 04 Nov 2026 11:49:24 +0000
Received: by outflank-mailman (input) for mailman id 1471748;
 Wed, 04 Nov 2026 11:49:23 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xOZUY-0008BC-Uq
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 11:49:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOZUY-00AVBv-BZ
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 12:49:22 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aeb1bbc-e002-0a2a0a5209dd-0a2a4507a592-14
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 12:49:22 +0100
Received: from [209.85.221.49] (helo=mail-wr1-f49.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aeb1bc2-b4ea-0a2a45070019-d155dd31c96b-3
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 12:49:22 +0100
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-48df4e9d2d4so396797f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 03:49:22 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-146-71.play-internet.pl.
 [109.243.146.71]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48fecf8ef85sm3874725f8f.27.2026.11.04.03.49.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Nov 2026 03:49:21 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793792962; x=1794397762; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PIT0qOE1RjrKqBqCTk81briilbRzQcHjDROuAN2fnMs=;
        b=WnzqPhF/CpJGBRbNfgzzJG0DsyCQBQDupXWthVMLEgwfvgKWm1gas4/AYwyXkGHPLi
         WB8oYJkjzXFaBBr2i04B8Ykn8fnv3NZGoW3blyTy3ZtFzCKSIrT+fxLBtCCajC4+BR40
         1ibHYPkmikPMJR0tjfiJFslOdubn4BEs0dlMawIcMyZjJeWIqyiFB7sqOVfc53e3aC/I
         b99vp60u5obJrzVY9iufIhfk1wPPi7n5KqItty73pqFY8hMdEDzhlp7QkWM4d/4vGcSA
         THLeGO+3+Uxm5/NF18wCP6f9tYAza9ZjmapNOShEbBWFeZiSfvz35GnlSPyU8m/JAwBL
         YUxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793792962; x=1794397762;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PIT0qOE1RjrKqBqCTk81briilbRzQcHjDROuAN2fnMs=;
        b=Hh10w9jSgHMI1QUWyBSRRFN3wkU00MLY8gvRYQQjjJudDFGtfczt7566H4HYekx30q
         yXDqPaPIgEryJHfrmezk3kwT6nH3wXXukFJbo5+g9GlNHIhbeSn5h1sU3pD8iS/97b7b
         fuxsdPJNEsP+8A3TjrYOrB78B0tpY6FSGh8/jX6xK3WOKuaAVOgzc1tl+1sP1T2SjRUN
         L6V5tWBiCycT+D/jCmlsRF+rwRNE7seaAgeu2y8XAuORnFvPgx9Cds7YASO48lGNktj9
         gN0Z1wU6HLQ+p8/OIZwMqwi96gRkHIM257kLk/RwK1hpCqwUbN+afBNssZhfIqYf4Myc
         05oQ==
X-Gm-Message-State: APuU4Z+OcUziap2/YWFlruR80OFcq5OmZUXUJpTUO21L+JKJ4gewK7gm
	U0OJc0cYRIBhHi2iK/n49h5QgPag5zo/HigB4klY5Vd7BE0nTqQvD2Ml
X-Gm-Gg: AYBFou0Y2EJbtjAPZLiSXzbHqPbj3MPFzNVwASun2c36jgnb+cxjQcLtITD5jwyHD+L
	NqeeRMAMpI0hz2REQWsmoxHV/qij1dbvghZhZDuv8beg2MHZA1TW83yQspTC4mwYAUigJ1hDk/a
	mxKEtG2pXIvp5xAy6HcCnXWynoNHCr7/Uc9VPxHkt6eFQ19gQUk4F9fj04Il80vPG/TADU137DE
	G+s1YCCxvHZMZSV5M97Kf88Zt50YnhgZRscGcHH96uKpWGQVGdzIt571AYGYPUDYE47TvPD1Ht4
	IdErGP8XCtwEd2RAcaXtpz7y64nTN4pke2M1Z5Bvk5eA8LghusLvVL+Gufp25toOJyjKhZlCVlS
	bFr0vgx4So8vf+kTXDSUa1D40vZiANbAcUyM5XNDwf/5Z2oPEa8tBYSh3l0wwU3BzMClHhMOS0+
	CmJ3+qswTJpEoDO4KKFjDm7Vy0QQTai9IOSfFcQqns0UbHJWeMEpfoZRgEV0utb5fTtIxkpGxnd
	dWLpWYNKzlzWe9U7Uwo+M3xEurXfOUmInR2ryQQVILBaAg6mjMLSQ2+HPNVUAXuTftKSiNelh6E
	UlCwsBaYW2/tKVKMYmvP7W1Lf1/tNYbKEf0euTL40RGbJLMcVpM/QJ0zd+uaqgrbA0wjfjjCGiS
	11rc=
X-Received: by 2002:a05:6000:4a13:b0:48c:72fc:363e with SMTP id ffacd0b85a97d-48e6e308acdmr32315089f8f.44.1793792961778;
        Wed, 04 Nov 2026 03:49:21 -0800 (PST)
Message-ID: <7068584f-2aed-48a4-950f-97802d321502@gmail.com>
Date: Wed, 4 Nov 2026 12:49:17 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 20/39] xen/riscv: resolve the faulting guest physical
 address
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>
Cc: xen-devel@lists.xenproject.org,
 Romain Caritey <Romain.Caritey@microchip.com>,
 Zheng Zhang <zhangzheng@iscas.ac.cn>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>
References: <cover.1790779209.git.oleksii.kurochko@gmail.com>
 <f828fe51cde79f10632094067c82a7fc6f05391f.1790779209.git.oleksii.kurochko@gmail.com>
 <1792583108.8631fc262581453bbf619ec5b2062170.1a15e4785ac000f79f@vates.tech>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <1792583108.8631fc262581453bbf619ec5b2062170.1a15e4785ac000f79f@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1793792962-378D1AE4-939441C2/10/73395122804
X-purgate-type: spam
X-purgate-size: 1132
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 10/21/26 1:45 PM, Baptiste Le Duc wrote:
>> Recover the guest physical address from htval and stval. On a guest-page
>> fault to hypervisor, htval holds the guest physical address shifted
>> right by 2, so that an address wider than HSXLEN fits, and stval holds
>> the faulting guest virtual address. The shift is done on paddr_t rather
>> than on the raw register: a guest physical address is 34 bits wide on
>> RV32 with Sv32x4, so shifting an XLEN-wide value would drop its top two
>> bits.
> Nit: "The shift" reads as the right shift just described, while what is meant
> is shifting htval back left by 2 to recover the address. Could you say so
> explicitly?

Sure, I'll update it accordingly. Thanks for clarifying!

> Something like:
> 
> ````
> Shift htval back left by 2 and take the two low bits from stval. htval
> is first converted to paddr_t, then shifted: a guest physical address is
> 34 bits wide on RV32 with Sv32x4, so shifting the XLEN-wide register
> itself would drop the top two bits.
> ```
> 
> Reviewed-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>

Thanks.

~ Oleksii

