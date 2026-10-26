Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7AB0606A31A
	for <xen-devel@archiver.kernel.org>; Mon, 26 Oct 2026 16:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=c2ln4F2J
Received: from list by lists.xenproject.org with outflank-mailman.1461629.1672684 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLO2c-0006hU-Sy; Mon, 26 Oct 2026 16:59:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1461629.1672684; Mon, 26 Oct 2026 16:59:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLO2c-0006hN-Pg; Mon, 26 Oct 2026 16:59:22 +0000
Received: by outflank-mailman (input) for mailman id 1461629;
 Mon, 26 Oct 2026 16:59:21 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xLO2b-0006hH-Mg
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 16:59:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLO2a-005AQQ-IO
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 17:59:20 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6adf86d5-e002-0a2a0a5209dd-0a2a4505a7a4-40
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 17:59:15 +0100
Received: from [209.85.221.51] (helo=mail-wr1-f51.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6adf86e3-4cb1-0a2a45050019-d155dd33f1ce-3
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 17:59:15 +0100
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-48c4649b35bso3329665f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 09:59:15 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e3ebc39b3sm18064083f8f.10.2026.10.26.09.59.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Oct 2026 09:59:14 -0700 (PDT)
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
        d=suse.com; s=google; t=1793033955; x=1793638755; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GMQ+7WlzWIwRlrJ4BmOSjoJg3SFkTQUxLpOzCWcGRxo=;
        b=c2ln4F2J6YpDBdoOcgcX4Y5wgD9qzdQKdUTbVz1MMBnMfaBjdeGo7js05QXakmhRAn
         YXffTbed5VhC3mTpcw7/AV1qXkl7Y8jJPZQ86St4CJtLsytNQG/BcslmUaB/BX7kxbF3
         JqB/lbbzDGflm/5PMrRnDw5InRiZ3sn6oWc7M4dWrts+xmkuzbWniaq9eqd7MzF862er
         ER4ouamqXB5hgE+ANxx0OSVvQ1kTevpdlYyhmYzAMUzaLJO+w3K4IMEPBMTzUT791145
         svPi5qDvfKPEQVViSFLUqRAiA3pa12uq2tZUyuDKbDstJKhGGJQKmaxemEsZjXzEt3Kx
         8shA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793033955; x=1793638755;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GMQ+7WlzWIwRlrJ4BmOSjoJg3SFkTQUxLpOzCWcGRxo=;
        b=zRUtocncY+9NF/dWYFIcAsiPuz0Pm0RcUQ5quaJKkLgYJOW9WPv3RqsHKpd0eW6i5L
         lebldazJ9Oly7Rm/C/kO41YPgeNUm2P98FnTEdWua3zfYlHG/S7QnLqAnGMdNS0XneCo
         YOUhZ7v/oz0mYorszdTiDj2H5iUykynPS5iatvCsUHNHLtXaBBisPbF31HqLsxNwkEdO
         V81UUWq/Bbzg53puWhL6X/tfFX6a3IisbQhzbZUn58ykeSYHptPoZpl6YMbs/Avmnh+f
         TwWDF93g92CtxiDgnZb7Beu6Q2gs2HnauS3eGpvLywePJb0h8TH6e/3VIGRWSW9LgAc5
         FiNw==
X-Forwarded-Encrypted: i=1; AKwUvBw7Ug0eaEPa3TgYF95JBbQEDLZ2k29lf265tmkem0vA844PcWoOxvNoAYiWj3cdEGoyhwH7Q9aTpF0=@lists.xenproject.org
X-Gm-Message-State: AFq9FYKnmet3O7VTx0tYTNj8oRXGlrexekXnfQpIP7Na06/5+LCr8b9E
	nz5322usvmpLycgH5B00SWwimWyLjBcH8LVGzKShPy1Tv84XznWMcfggZ8KSZKMVHQ==
X-Gm-Gg: AYBFou3I9EDJoU3NTwP4ynx3ExTiGI6F3/uG13KmCKqGf5b51CU7jyJlN0dSBuqdnLd
	Yqkwi80vMZqpTEacT5jYDG9eiRCr1ErE5lL8Ep7D7Pl0wcpAUaluEpka6teGaP+XAenkNqTPqoh
	Ryc6TfuDtAfB59Y2NrTvs6XMbSl8hHX8fE6FACi7jooe+zW2V26/iaBB3ASl8mpvIq/PHXDkOzL
	t+sR707GyEo0BpO51MGARJx0DMQbx8I6huM92lIiQ7khOFB3Y5Zid7vc/e1WA7PBY/64nsxxs9P
	4BmhUCXN/t7YerSg85hhM6qJdHxRLm4pAaxf+fmZtEzOAclIxib79u0rTdVxvk8wjqDlD7Oftf5
	cs1khLHnoxIZ+waJa/oyLJs9+KBMw93mHEd4svWpBprluaz8w/JvNHsXEOW9yt1cCyiodog5MDO
	tB44PFAZ86ApMdJVQhR2Ukdo2DIMTx9TTtlK3GZHHJ1jNC2c7c/aMHCsIxvmXEUpbRfVSKl8voE
	1yHqd2u4+Yhq4f8nuykwvhD98+QMFaTxYNWQz6FSCPBIMqoKnKzn6oem99zq3eLenOnQdXgq7WS
	B9FFNRHA+Fydqn3WJBjzQbz/A2jtHSjQsgwR1Ftox4o=
X-Received: by 2002:adf:e193:0:b0:48e:3ebc:d242 with SMTP id ffacd0b85a97d-48e3ebcd6c3mr13437490f8f.37.1793033954814;
        Mon, 26 Oct 2026 09:59:14 -0700 (PDT)
Message-ID: <462a149d-9a4a-49c7-8db4-96e99463a47b@suse.com>
Date: Mon, 26 Oct 2026 17:59:13 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 4/5] xen/riscv: probe the A/D update scheme if the DT
 advertises neither
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, Zheng Zhang <zhangzheng@iscas.ac.cn>,
 xen-devel@lists.xenproject.org
References: <1793027589.8631fc262581453bbf619ec5b2062170.1a178c5c430000f79f@vates.tech>
 <1793027685.8631fc262581453bbf619ec5b2062170.1a178c73a5d000f79f@vates.tech>
 <9986e03e-bf09-46b6-9d2a-82a1864a59b5@gmail.com>
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
In-Reply-To: <9986e03e-bf09-46b6-9d2a-82a1864a59b5@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1793033955-71CA82A1-83F4F3D1/10/78276251493
X-purgate-type: spam
X-purgate-size: 1109
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 26.10.2026 16:35, Oleksii Kurochko wrote:
> On 10/26/26 4:14 PM, Baptiste Le Duc wrote:
>> +/*
>> + * Probe whether hardware updates the PTE A/D bits by writing to a local
>> + * variable through an alias mapping whose A and D bits are clear.
>> + *
>> + * Check the D bit rather than the A bit, as the A bit may be set
>> + * speculatively while the D bit can't.

Following Andrew's clarification, I don't think this is relevant anymore
(but I also don't mind it to stay the way it is): If we observed the A
bit set (and no fault), we can still deduce Svadu, no matter whether the
update was due to an architectural or a speculative access. Svade would
implicitly disallow speculative updates of A, as exceptions may only be
raised for architectural accesses (unless there are provisions in the
spec that I'm unaware of).

Both of you: Please clarify whether you want this change to go in as-is,
or whether this wants updating again.

> Generally, looks good to me:
> 
> Reviewed-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

