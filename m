Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3D96606A31B
	for <xen-devel@archiver.kernel.org>; Mon, 26 Oct 2026 12:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=KbkXEeyK
Received: from list by lists.xenproject.org with outflank-mailman.1461203.1672165 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLJk8-0000AC-Hx; Mon, 26 Oct 2026 12:24:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1461203.1672165; Mon, 26 Oct 2026 12:24:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLJk8-0000A2-FJ; Mon, 26 Oct 2026 12:24:00 +0000
Received: by outflank-mailman (input) for mailman id 1461203;
 Mon, 26 Oct 2026 12:23:59 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xLJk7-00008p-Ox
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 12:23:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLJk6-000Gwq-VM
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 13:23:58 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6adf4653-8faa-0a2a0a5109dd-0a2a450b83d2-42
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 13:23:58 +0100
Received: from [209.85.221.53] (helo=mail-wr1-f53.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6adf465e-b7e8-0a2a450b0019-d155dd35d1b3-3
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 13:23:58 +0100
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-48e46e449e8so907787f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 05:23:58 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e3ece14a1sm16607999f8f.57.2026.10.26.05.23.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Oct 2026 05:23:58 -0700 (PDT)
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
        d=suse.com; s=google; t=1793017438; x=1793622238; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9+WOblBuGcpBDYdT4/csXL+quaz/UKWre6wr3qb2qb4=;
        b=KbkXEeyKJyUy4f3z5E6LFOtUq7U3J4EKgQAsUaQcAGr/j4Z6JTNf4p1g+/R8MbClDX
         vXNl5vjIlauCOaCXyZsURtTQ5YRRsq/BXIWSxxgsr7oLCGSYEjt7/YMY9vHSRPiG7VOl
         aLClLLttckIEE7zg1/lUmaPFh+1mD4SE6pRw5Mln67VS1I3XdxyIiRJ6XEFFoDNmKuNr
         SdVTYFe1sRS0Jw2VeLQtkRof6D9TuC7AKkp5IiKyu7S3GEx0mFYNQuc4c0jc1z17kur0
         j4WZnybDjgUWbjtyZvvNBp3Qdq1I4/M8IgNJo8aZB/AmpTf80J75FzpCA4fcuv2EI3FD
         oGyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793017438; x=1793622238;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9+WOblBuGcpBDYdT4/csXL+quaz/UKWre6wr3qb2qb4=;
        b=o4UT3TKp2CD3fb6qZErhKhVYX7pwRrPI08p2UyP/iBTBgLU3taWHK67oM2xLTutBho
         sZaBtvKT86qaBagYN0x4cQTvV8xygu2O+zCO7scGP9xu99dJJR9U4IdFTajP8eRN7aXS
         /p1Ki8NNRVXvfJ2B63f+gN0ShsO/yd/2BfDKqYmSyMbISM+qhzOfTLNg2IVGikmbHjHh
         zmIA0R/Gs8mo7xBeKnrt1+ET03n/8JxTlYarZS2T9AGwbm7rpBQIXu5VLFP+tqF4RYqc
         Cbp/GdRPfq6OxZSIrerRmQPi69Ksb3GTPD0rBbKHsVckNlzS5m7fsYng/jtTt+RETEdc
         89Mw==
X-Gm-Message-State: AFq9FYL5TLRCevUuhaty9UnBvtp/X/aGuYwdRzjaE+1cIc0E706zlw5f
	r58u+1IG1tXMkV5dfe3ICS5W2BfqRclK3wTExRY/xVthcmgoVE+w02W9NeNDRy14RA==
X-Gm-Gg: AYBFou0X97KLO4c2abvlKkBnOlN0CpnY5B8U70ILA443RnfezoYw2lCtoo6LQ2LlYUW
	BzoJy7HMGSnXbN0Xnopj654a4hP3MRuLeJ1ZMpCeYF2SKs6oxLckl5KnyPNSYs5jPwAFNVW0jDd
	N3MXH9J4WbwhVMjKeAOq3D7Sexj6FviL5jw87iQ76bDZiF/xz9YYNXfRDiF/G7eMtrVwtnihz9l
	4WMBJJ2QTQGSMdnzCKB9AOl+wTGAK4TDRtnMd9wk0Vh/TUseTazYUSCWUHLeNQtEuYK9ttkUp7a
	ghiHhTi0JI+uk8kVAet5v50X0e3p8We9pwoecePENeb/nvJ4r6n/CI7hd2zLVnMCg4fC33hqt/d
	HVK50wjrkuse373Ux+BlEteV1+ZszUhixRD8u42T8/29YrPLKr7eFliqgsDFZQNo6yEd7aNKdmP
	ZNPjIU/IH03KCY+PLgC0edvNFGPSrmdWoCYst8vcTgGwzXZ8+1JSSxPoEzQw4xSeBJ7ZJr4Si9r
	9ps5N5fWONVY+rqOE7cbAoAn2IJPCAzI/Pv/xrS/rv1k//U2lizs2NQB0VMXRq0gLht2bthNf/Q
	EiSVrGJwCFLQqHjxhpTTwkVaMeAZ/zqk8oJRJFdgX8w=
X-Received: by 2002:a05:6000:24c8:b0:48d:f831:2681 with SMTP id ffacd0b85a97d-48e3eb922a2mr12101013f8f.38.1793017438312;
        Mon, 26 Oct 2026 05:23:58 -0700 (PDT)
Message-ID: <acd376d7-6ce4-4fb6-94c5-257d765ccf10@suse.com>
Date: Mon, 26 Oct 2026 13:23:57 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/bzimage: Check that the payload lies within the image
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <stefano.stabellini@amd.com>
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
 jason.andryuk@amd.com, teddy.astie@vates.tech
References: <20261020214825.3655848-1-stefano.stabellini@amd.com>
 <atiGSMp-Yy0SXB9-@Mac.lan>
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
In-Reply-To: <atiGSMp-Yy0SXB9-@Mac.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1793017438-1B6D29EA-AA7A4643/10/78276251493
X-purgate-type: spam
X-purgate-size: 798
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 21.10.2026 11:30, Roger Pau Monné wrote:
> On Tue, Oct 20, 2026 at 02:48:25PM -0700, Stefano Stabellini wrote:
>> @@ -65,6 +67,15 @@ static __init int bzimage_check(struct setup_header *hdr, unsigned long len)
>>             hdr->version >> 8, hdr->version & 0xff);
>>          return -EINVAL;
>>      }
>> +
>> +    payload_start = (hdr->setup_sects + 1) * 512UL + hdr->payload_offset;
> 
> Do you really need the UL, doesn't it get auto-promoted to unsigned long
> already?

Without taking the type of .setup_sects into account, the suffix may appear
necessary. But yes, the field being a 8-bit one, the multiplication can't
overflow when done in 32 bits, so no suffix is needed (and generated code
may - at least in principle - be slightly better without the suffix).

Jan

