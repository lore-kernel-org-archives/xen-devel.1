Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA056606A33A
	for <xen-devel@archiver.kernel.org>; Thu, 12 Nov 2026 09:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=MQJF4gjO
Received: from list by lists.xenproject.org with outflank-mailman.1485311.1688521 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRR7x-00066j-HA; Thu, 12 Nov 2026 09:29:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1485311.1688521; Thu, 12 Nov 2026 09:29:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRR7x-00066c-Dm; Thu, 12 Nov 2026 09:29:53 +0000
Received: by outflank-mailman (input) for mailman id 1485311;
 Thu, 12 Nov 2026 09:29:52 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xRR7w-00066W-2y
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2026 09:29:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRR7v-0039U4-7S
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2026 10:29:51 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af58707-e002-0a2a0a5209dd-0a2a4503835a-34
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 10:29:50 +0100
Received: from [209.85.221.45] (helo=mail-wr1-f45.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af5870e-fae8-0a2a45030019-d155dd2db109-3
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 10:29:50 +0100
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-492fcbfaa87so2646331f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 01:29:50 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4984e26f8e3sm14454283f8f.1.2026.11.12.01.29.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Nov 2026 01:29:49 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794475790; x=1795080590; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GBV8EYxrpRbZ5v1pGMJwJmOL6/IkWsocLD039XQe/to=;
        b=MQJF4gjOag0Bym9bWPEJuBJM+b2rfk5nqR1cPgJssPLs03tFJHvhJAGUfynhS17Fa8
         NqUq5DA+cUdOGTQG/nYphzewf9mphwbCuV8VNI0ZoCJRc++GgXc1GgrcGxGbuojCfiHL
         9MBA6iW2UOBr0KmKcqnVJWv8oVeT1kJFBumnWbYmIgEd0xYLbEMPy75++MQmMrUbYrPc
         vNCwPuWuswbbodZcZLq9UfF4MxOKaQUoHDmAaZDwuyfrcxLXGN+euuohWSem2HdkpRv6
         G6F+vgrAZh7vKKtniJKVpwMcdpru1/raJtTrGKNAOugkTrcEysgfFZESEXfQt8sbBo/J
         eqrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794475790; x=1795080590;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GBV8EYxrpRbZ5v1pGMJwJmOL6/IkWsocLD039XQe/to=;
        b=2kO8RJBaL8+J+zjJJ+h1PChV33A/4hEU23ZPO3C8NQ8g5uZnak46ria7ERxNK+LIhj
         4w3eZHmp0hoPISPTgcj6z8ax/pySKzyap3BYzy1hb8ABu8HPat3Djqd7OARiJd6Jj9Lt
         tpxJk7o1VKQG8gOeskgM+DktHlaK1cGAdSWHcKvP8C6lYHsqMxeDwgWqoU7NFnvuanV1
         KAeG/JrXXcwlBBiKnrtXXAGUXSxx21mVYqaO0rjHiDDY1oc2jMmOuOHRh3+qsK3mDMUE
         dwqZ/RYDi2UZNg5PCoCs9E1rGNTA4hg+mRSaThXMsGVp0aGrS/aVlunU7BBIbuVOPjZd
         Xhxw==
X-Forwarded-Encrypted: i=1; AL+hErHKsBapHcLZYF3Rrh6QM5ma8H6Q+UBOKBUBMC9sJTtm24TAO+Oywqt9Q5wVf1BlrGmPr1j09aKeS0Y=@lists.xenproject.org
X-Gm-Message-State: APuU4Z/dV6VOA9FQSMAr9wQLUunhZ66F0K7E0gkv2v8avqx7KPkAkTaA
	eNiFcFDiVhK7zQd3GNx4zmIsn9j7zXRBKTO4pwb3E1VaePuZVPIb227ozqUUb06SUw==
X-Gm-Gg: AYBFou2M2opFZDacOewgxGweVX6qN21W9L4R8mvfA/NmCf+0zuSDvTERUJYEu08N92s
	SX4sH6JwBRrz3r6HxXWfGD9ZBPSrFalBUjcRnd+eVmfikCZjbxN5nsNQIaGCDrgFGQB2N97LdnW
	Rc/uGa1Pu490uc8m4aHwR3aqjMJ3cP7/sLlEwYuJK125L4iCPSAdGM+Cn+IMv91jLUW2lhGUUd8
	pSi9Sa/GRlzwRUOoQZ+VK7cwoVM12+PwNKXeXpjo6KU7Lx41HrvV8pB4AttXiibBEKvA/7Qn3P9
	pF5an5wkU4a6nsfm/aQOkAK5dpboRHoFgh+id2hx15j178vioFOsqHTLDNcJXsl+yXF5DYV+6hU
	KlMgZuT0v571V773gqkVQ5VPIKIp/eWX1FuWr9y+c9vlUzjqiZvqIkSPJNN2c2FoasPl84CosZJ
	MPGw0XeT+xUutL7QyweQ3TYZPFZZ06ggmjNXjo74a7oooMVNDdIEW5F5c5dFYYqcy2PdCYcBXdQ
	v+3FrPkPGBq4Ifw2oCPOJxdIZQRqTJPbcpD1OEPBKqcHxzJyD+kfgGKg6VaFPEcwsgNIucfhn4Z
	4h5oV6kWiC5mkdzlXxhhAR4llx4MY4Wtffcg63WEk3fnD8ieqkJF6eFJpU7sRpZxvis656NptRt
	EDlbZRLN7cZIWqi9I
X-Received: by 2002:a05:6000:186c:b0:48f:e879:5887 with SMTP id ffacd0b85a97d-499c640643fmr9126563f8f.28.1794475790276;
        Thu, 12 Nov 2026 01:29:50 -0800 (PST)
Message-ID: <47ed6cbd-77af-4328-858c-80d0ecae50c3@suse.com>
Date: Thu, 12 Nov 2026 10:29:49 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86emul: Treat the vector of INT imm8 as unsigned
To: Stephen Cheng <stephen.cheng@citrix.com>
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <20261112072303.86955-1-stephen.cheng@citrix.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <20261112072303.86955-1-stephen.cheng@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1794475790-6F2C84E9-0B232E66/10/78276251493
X-purgate-type: spam
X-purgate-size: 1122
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 12.11.2026 08:23, Stephen Cheng wrote:
> The decoder sign-extends all 8-bit immediates (SrcImmByte). For INT
> imm8 the immediate is the vector, which is unsigned. So INT $0x80 to
> INT $0xff put a negative vector into the event (e.g. -128 for 0x80).
> 
> hvm_inject_event() then fails its "vector == event->vector" assertion,
> and a debug Xen panics. An HVM guest can trigger this with the forced
> emulation prefix (hvm_fep).
> 
> Cast the vector to uint8_t, as is already done for the port of IN/OUT
> and the operand of AAM/AAD.

I'm afraid this isn't sufficient: At least x86_insn_immediate() is also
affected, and then also for the other insns you mention above plus quite
a few more (in particular uniformly for 0F, 0F3A and XOP08). I think
this needs sorting in x86_decode_onebyte() for all of the former (some
of which I then need to mirror into the APX series for Map4), and in the
switch() below setting ctxt->opcode and s->desc (where decode_*() are
called) for the latter three.

There'll then want to be a 2nd Fixes: tag for the commit which
introduced x86_insn_immediate().

Jan

