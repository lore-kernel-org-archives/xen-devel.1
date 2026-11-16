Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2D94606A31C
	for <xen-devel@archiver.kernel.org>; Mon, 16 Nov 2026 15:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=ZTPsIfyZ
Received: from list by lists.xenproject.org with outflank-mailman.1491183.1692078 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSyw1-000872-Kr; Mon, 16 Nov 2026 15:47:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1491183.1692078; Mon, 16 Nov 2026 15:47:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSyw1-00086v-HP; Mon, 16 Nov 2026 15:47:57 +0000
Received: by outflank-mailman (input) for mailman id 1491183;
 Mon, 16 Nov 2026 15:47:56 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xSyvz-00085b-US
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 15:47:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xSyvz-008X5u-AB
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 16:47:55 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6afb257f-bab6-0a2a0a5309dd-0a2a450ae69e-36
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 16:47:55 +0100
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6afb25aa-f2d2-0a2a450a0019-d155802bad6a-3
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 16:47:55 +0100
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-4b79502c27aso29329605e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 07:47:55 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb55ae5299sm316347395e9.11.2026.11.16.07.47.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Nov 2026 07:47:54 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:From:Cc:Content-Language:References:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794844074; x=1795448874; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :cc:content-language:references:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P6qjjXbFlhk8OziYkHHPgTHcawNYgWBVea5G8hCwYgk=;
        b=ZTPsIfyZtXi94T0KWC3LuoHAgRL6hCAVKBWhxFhsIxQdYt9+TCphHoLJ9APlYPtT3N
         ch2jvu5mWPi7lDjigfxCr6kimP/wAv9g5jNkHAb558zcXQ2NXoKWVguOjbd2/eGaexCS
         63bl2e6+b/8ECivCVTuCWr+Tbifxn/IWel8gRZrSOB6FTEaJWGw+u3FIuRQyEL1jiXzl
         7EySgQugVKAF3/U1XaZnvzaKyuQyKcBL16K9b1EiyeGtcbkpVH7jnzp2JlR3yxgnDx+A
         NKix2BYHtsvRdmecMCIKNWnFJQrt83o5efN8b6+l4BnfyM3eLFq8IUeWUqWdwcmhqdHf
         s0ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794844074; x=1795448874;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :cc:content-language:references:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P6qjjXbFlhk8OziYkHHPgTHcawNYgWBVea5G8hCwYgk=;
        b=M3Y/GhG2H4xru7bfTIKcjKT2DRTKL91M0v4Tveuy3gX/ELGLL/R5porT3Bm7VDTncJ
         gDiyrh1DJXCtz1IEJ7DdB+ZXA7vKO8mf8E0Hv778H+q+QCOEPJs1Jgoh+oTYMeNWZT0x
         UXgK4NFOjVwXZUOOouA31StGUfNIP74SvvYQYPMlpquBEbU181Jd4jJtWYVJ5JtP0fst
         CEwxqPyZeRJuSQB/seWDGkRBMUAi0b0SOQiOXI0b5x0MgbudbA3uEh+34C+1joOqIYgk
         mkZ+456z+47TOaRovyplf36CC8Xfb78VtaWhdDSzcRs5yYNn4Jw6ktLAIhWHYHBAuyIx
         pAnQ==
X-Gm-Message-State: APuU4Z9dzaTE0be+iwYVEX0GlOCwiDNLShAAE/Gg29aqX09DWLoUsgQD
	KFiuFTvN5wG26k5hZ+4bWb161m6cXaKwf3OLu94qOIVMiv0aYpi9awhjEI6A8I6NlQ==
X-Gm-Gg: AYBFou391ZLcIuUk/7ALIgoMRS0okXguVUy4PcIVoj2p6ciPCn81io4TM/r5AmWeBkY
	0zf8/rdoY/00/LNb9w+RCac+g+5Hjjg+/4dO1mXqHgZvDsO+Oh8nZk5QbqbTKJzfN4xUsQP0hvj
	kS3N9w55YIKac33NfkVvSMgaQ1b164BkmlkXb1QSSOTDfm8CvBOS7Huvm8iYq6IOzpPieZ38V06
	/XcBbp6JM7SwiOJNK+pP90J2zw+XFsjXNKmMVXrFSHPgUBvZreGir1vtHWbwkfNAtO4w8e5Xq6/
	/tBr6CcoEC2hp34PndtOryDL9XIf0NbjP6RZbdOMTw5BTsTVEkXLn7zKur9A08+M/PSGNX6kYxN
	4W5Yj8Yb58CxhWjFDj6Eyl333yBJrhtCJVwpnFuCpjJzSjE5MZWKDo4aeIfdU0CYuhOQkgLishK
	nLtiFOC3vxmqJTccieNS+Y3YdoMcllcONzKwPNBHIbJ8bMFSy59YNgmLfpz/GvOPir5z7NdRYVm
	aWGjymppbcFlfVfpZQsEjJMWdQ8Ge6BWz1QJg/bjipc3TUAc42o1QSV4P02ylXmFzx+SuTizau4
	5Ih3ogQRPCBSqIgxaDbG36yuYODMqJz8Qo2jyeByb8GyrvIYpm+EC7oIVcezRUOGQbLr1KEaI/r
	1u/YnMsYZW/0eAwiN2g==
X-Received: by 2002:a05:600c:8b4c:b0:4b7:6b96:e431 with SMTP id 5b1f17b1804b1-4bb55ab56ffmr242967165e9.28.1794844074520;
        Mon, 16 Nov 2026 07:47:54 -0800 (PST)
Message-ID: <866f84bf-4cfc-4f93-8e88-02d8a7311321@suse.com>
Date: Mon, 16 Nov 2026 16:47:53 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/riscv: bound each IMSIC MMIO regset by the
 per-group hart slots
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>
References: <1794842995.8631fc262581453bbf619ec5b2062170.1a1e4faaa300006d3f@vates.tech>
 <d37e0e49-3822-4088-9016-31178facac0c@suse.com>
 <1794843902.8631fc262581453bbf619ec5b2062170.1a1e50881df0006d3f@vates.tech>
Content-Language: en-US
Cc: xen-devel@lists.xenproject.org
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
In-Reply-To: <1794843902.8631fc262581453bbf619ec5b2062170.1a1e50881df0006d3f@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1794844075-591C5CFC-F22566DC/10/78276251493
X-purgate-type: spam
X-purgate-size: 1595
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 16.11.2026 16:45, Baptiste Le Duc wrote:
>>> +    /*
>>> +     * Parent irq i is given hart slot i, counting slots across the register
>>> +     * sets in order. A slot with no hart behind it therefore shifts every
>>> +     * later irq one slot early, onto the previous hart's interrupt file.
>>> +     * Counting can't tell that from harmless unused slots at the end, hence
>>> +     * only a warning.
>>> +     */
>>> +    if ( nr_slots > nr_parent_irqs )
>>> +        printk(XENLOG_WARNING
>>> +               "%s: %lu hart slots in IMSIC MMIO regsets for %u parent irqs, unused slots must only be at the end of the last regset\n",
>>
>> I'll leave full review to Oleksii, just a remark here: This wants shortening some.
>> Not only for source line length (we allow going past 80 cols, but please not this
>> much), but also for what actually ends up on a serial console. For example, I
>> wonder whether what follows after the comma really needs to go to the log. If the
>> message appears, context info can be obtained by consulting the source.
>>
> I kept the literal on one line so it can be grepped, as CODING_STYLE
> asks, but I see the point is rather to keep the message itself short.
> I'll drop the part after the comma, the comment above already explains
> it:
> 
>      printk(XENLOG_WARNING "%s: %lu hart slots for %u parent irqs\n",
>             node->name, nr_slots, nr_parent_irqs);

And just to clarify - no need to send a v3 just for this. If no other
change is needed before this can go in, the change can be made while
committing.

Jan

