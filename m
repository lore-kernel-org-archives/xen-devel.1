Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59155606A31A
	for <xen-devel@archiver.kernel.org>; Mon, 26 Oct 2026 12:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=A7J41baK
Received: from list by lists.xenproject.org with outflank-mailman.1461272.1672256 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLK6B-0000U1-2l; Mon, 26 Oct 2026 12:46:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1461272.1672256; Mon, 26 Oct 2026 12:46:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLK6A-0000Tu-Vy; Mon, 26 Oct 2026 12:46:46 +0000
Received: by outflank-mailman (input) for mailman id 1461272;
 Mon, 26 Oct 2026 12:46:45 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xLK69-0000Tk-Qm
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 12:46:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLK68-00Gl6b-Ql
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 13:46:44 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6adf4bb0-e002-0a2a0a5209dd-0a2a450ce702-20
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 13:46:44 +0100
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6adf4bb4-f479-0a2a450c0019-d155802bbcc2-3
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 13:46:44 +0100
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-4a5087a5348so11073585e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 05:46:44 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a35a574088sm179134745e9.9.2026.10.26.05.46.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Oct 2026 05:46:43 -0700 (PDT)
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
        d=suse.com; s=google; t=1793018804; x=1793623604; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4DqwgDtm0VrpC9d2Gf/RO9010Vq2WzDmFecRqT+51tE=;
        b=A7J41baKyqrlgWQxbbVluDVZvYrUTpIpe/PfuOCnHnaf2xuRoVAn24FcC6jsb1ZWOR
         tnSHUKgfygEehZNIFKEAlZPRWqwECG1vbJ4iLB9ps3takb9y4xgF14ZaOat7nKDh21TE
         6tnb7XMi6T/bj2XWmYcnEFBFOjL73+Az3Cs1mPj7UNAbMqwZVn8ssJCJjb/L7loHmvB3
         1Uye8peUHZNEWcHhe/rtL2M40SnaZ8J7n8QzIOxWv8UKvolvRNh9OsDK9jtQbbL4QXMJ
         darFaPV2x19mAAyNBbF21ZsMbnEke6O6E1UHONGnkRWLEYgPFaIBS9BmxCrLzdLMpk8o
         N9Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793018804; x=1793623604;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4DqwgDtm0VrpC9d2Gf/RO9010Vq2WzDmFecRqT+51tE=;
        b=bj7KAMYYA57Muyimycix3UCJnw7IaDw7ie68JREEysqgTZnyQIv3ew8na+ipFwwdtg
         a8FCFRA6GGzLBoiDz9nyPCn8q54NmsmeiRMYxZtZHmJfoVSxa1yrCee6UTrIugxXz8Ky
         pX/RpxlrrR33H872YugnurzcKBnRytlMDDxiObCItegI0c07KCTxqBqRlbXeCRpTcdw5
         xtF/nrlIQlrZ3g2gLJRf4xVTxKGKWDKILlknDIBhdBWmQPpb+O4jaeoZm0HjJRQnEQAA
         5IPx/teJji0jiPGm1dKoMzQ9SrGsUBhQ4QLKcb+ZN+tW+pen99EhOSmPbtRR4iYbiDlV
         aIsQ==
X-Forwarded-Encrypted: i=1; AKwUvByu8zKZmqe2X5asOuK+qB8N7UlrBLz4o9PBCTvNPpkuSIy9P3FTufFcMvpbgZSji6+vvLwnoJUjCBE=@lists.xenproject.org
X-Gm-Message-State: AFq9FYIKPHTJoxMNx/H+sKpHMsxexDfmmLULZnKBGIJ3DnIFK1bO4Wlx
	b0X1XsGpTzllAHQLf5jWt4sOkdWFTh/wzIrYYa5qeoSPx5M8iNIJh2IGOtQu3ht9OQ==
X-Gm-Gg: AYBFou0bJxuR3sn4cntIcHkj3iyF+9weWZ3tCf66hvHI1FIQXgaDppPSpkxs0qy4C5m
	RABhU6KSASAjdFc3akQs5jIGdo+filBTqP/AvuZSscP6HZXf94ewuDkf1x7QcrGVuLq7g1F3azi
	cI7GDCFPABYOykU+3MU5eh3X3KSBO0RJmrW52dJyhuqi/z8nvTmDQPDnlQhq5b7IQn6CObWshks
	gmC9eNccAy32Y2dZzJxPCivOI2sBX0Yr0t1bpyIq0k7lH6688aFcxcFXl+3Rywo+T5xkCc+Hw16
	0fEMhZvNZ6LMoMhGU/2OO0NZ/BUE6ujBZDMc/5IgXp97bU8iakmmu5+GIO6XkgAVMo9MOXTec85
	naBw+CXl/bVh9bC/Bx+rybBpNlwRpAgmT5Ixe2dQ8osAIlqtKArszmQs16DlTOHVn1wLYFOFO+c
	xLOAObAVSj/EZhr76K+6CBmC6wOIom3ZJVA4R3LD0stQ8RDOQUO4eoroO7Ti80GwkgOIuZD9fWZ
	nlPGgrLPseRIi2DP1zd5e8pSVIpgUxOz98Xal0NdHAOpzY6MsfMb7pHIVI0+3CY/H3kolIVqF98
	21axbJBjTNN4fTZohusH1jJBGGeM1QATvaxDjlveNb8=
X-Received: by 2002:a05:600c:c173:b0:4a2:883:4adb with SMTP id 5b1f17b1804b1-4a35ac9ea4amr114004315e9.22.1793018804087;
        Mon, 26 Oct 2026 05:46:44 -0700 (PDT)
Message-ID: <23ca037f-d7cd-4140-a991-ef51bc095d60@suse.com>
Date: Mon, 26 Oct 2026 13:46:42 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/sched: Fix the sorted insertion in
 sched_domain_insert_unit()
To: Stefano Stabellini <stefano.stabellini@amd.com>
Cc: dfaggioli@suse.com, jgross@suse.com, gwd@xenproject.org,
 xen-devel@lists.xenproject.org
References: <20261020223534.3703199-1-stefano.stabellini@amd.com>
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
In-Reply-To: <20261020223534.3703199-1-stefano.stabellini@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1793018804-76CDBA5B-E8D32FCB/10/78276251493
X-purgate-type: spam
X-purgate-size: 1329
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 21.10.2026 00:35, Stefano Stabellini wrote:
> The loop links the new unit in front of the unit whose successor has a
> higher unit_id, rather than after it: inserting 1 into {0, 2} gives
> {1, 0, 2}. Stop at the first unit with a higher unit_id instead.
> 
> I think it usually works because guest vCPUs are typically inserted in
> order.

Plus I can't seem to be able to spot anything which depends on any
particular ordering (except for sched_domain_insert_unit() itself).

> --- a/xen/common/sched/core.c
> +++ b/xen/common/sched/core.c
> @@ -489,8 +489,7 @@ static void sched_domain_insert_unit(struct sched_unit *unit, struct domain *d)
>  
>      for ( prev_unit = &d->sched_unit_list; *prev_unit;
>            prev_unit = &(*prev_unit)->next_in_list )
> -        if ( (*prev_unit)->next_in_list &&
> -             (*prev_unit)->next_in_list->unit_id > unit->unit_id )
> +        if ( (*prev_unit)->unit_id > unit->unit_id )
>              break;
>  
>      unit->next_in_list = *prev_unit;

Part of the problem may also be that "prev_unit" doesn't look to
properly describe the purpose of the variable: We insert before
prev_unit, when the name (to me at least) suggests we mean to
insert after it. IOW I think a rename (together with the correction
of the condition) may help here.

Jan

