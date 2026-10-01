Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 025EFCA5FC5
	for <xen-devel@archiver.kernel.org>; Thu,  1 Oct 2026 07:41:21 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1437993.1656878 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCBPg-0003xl-A2; Thu, 01 Oct 2026 07:41:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1437993.1656878; Thu, 01 Oct 2026 07:41:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCBPg-0003xe-6X; Thu, 01 Oct 2026 07:41:08 +0000
Received: by outflank-mailman (input) for mailman id 1437993;
 Thu, 01 Oct 2026 07:41:06 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xCBPe-0003xY-DA
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2026 07:41:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xCBPd-00DRPc-JQ
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2026 09:41:05 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6abe0e87-e002-0a2a0a5209dd-0a2a4504be6c-16
 for <xen-devel@lists.xenproject.org>; Thu, 01 Oct 2026 09:41:05 +0200
Received: from [74.125.225.106] (helo=mail-wr2-f42.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6abe0e91-b57f-0a2a45040019-4a7de16a8144-3
 for <xen-devel@lists.xenproject.org>; Thu, 01 Oct 2026 09:41:05 +0200
Received: by mail-wr2-f42.google.com with SMTP id
 ffacd0b85a97d-48b0622cc90so388183f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 01 Oct 2026 00:41:05 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a01ff0cd17sm42938975e9.9.2026.10.01.00.41.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Oct 2026 00:41:04 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1790840465; x=1791445265; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lITFgfzjfsByQ6k+Lmt1KlvLk2Xf1eVIo0/bN64sKHQ=;
        b=Qg2oJdCRSee0ZOXmb/GDkPfUGmQT55mF9UCZCkYjW+FDMd8az4ZyknxNnw7vGLkQna
         N4p189ScVW1hI3alxf7+HqiNm/qYmv71lhz1s8VTiHcc1VwV81tjcmy3cCkfggsV4Pye
         Ph40TMhhVjL0v+BnTtVB0d1+vSRigupKwhu2U07HMSdljCYR9S0oHKARPhehA9Y+k4cO
         Umv8WA/AdfQcYD1jOJsoY9TvNCfyJ45LgiVEnEYrC7dqpmssz5kdS69pBzSIz4gMtdFK
         oT8DjHd+8pS288LNJSY7L3agB3zgXYoQnBn5zJzCQSBlQX/lod6vxm7xAE2mT/DIqAHL
         0Jsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790840465; x=1791445265;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lITFgfzjfsByQ6k+Lmt1KlvLk2Xf1eVIo0/bN64sKHQ=;
        b=CvkIzO3K2RdF4yBrrmSDP8sbZcPt4z9t5j2zQfksL6oTc6stsZTVPmFWedNjr5ePUx
         52UJr9a7v6ThA/NTe16ptpA5k/z2zIWH0q3zhjFp+TdzDyKqJw+0cBx2xpPNbusg/nVF
         93IBob4S8DXkj3ZbccV5OGsq5BU1PYHXnZb4jDrdnpNpuxPavyDIfMyjxKhuK/3jWOhg
         LLl7rPMPB9vZppANx3WiuTh4yZcVM5OfHp86O1aNzNslSFdjVreIITO1DBchdgi9hp3A
         3kIJeRFnZl1EYfxxx18uVDIvSNZbAic8WLp2WBYjvZtyRCqsVoAAFsa1E9LLcpUHcpdI
         aQag==
X-Forwarded-Encrypted: i=1; AKwUvBwR54uyxy1ZIAajxw+zT4TpSyeCslCJyYfd7k7G9hSy+Hi4xTc/st0OCnjsSlgNDFW3RVPWcyfAK2Y=@lists.xenproject.org
X-Gm-Message-State: AFuF++luz3W4dYRF4N1i63K/9A50LdVGNkRqDttFj9igZBlEtTTfWd7E
	YUSU0VjfJkgjhZ3UzOw7GcfHm+sIhnBcuvLI2jfb5yUUmZGMvPBkKazDXONtbeLjWQ==
X-Gm-Gg: AYBFou2/ldeWlVHpLcXDIeKx6FFExWy8VoTEPuHD6rYnOXZHd2VonEejYMrDaZ8bkUH
	VA65OkdgFzjtERxJrnqF8MmSnZ77oJnl5ou/RyPPCZPaXU8CVDSXB3TjPyz865LGXJvWJ8y89Da
	aMvI5F/9xyPt5izgndrooTLyuR9jzAecsusV7Jlir7R1GGEa0A/Eeyt1IBp+C8AIhQ5g4mtXmEt
	Qs8L44gXp8x5AIe50M4bYmAH+8Hdgi/K8dMUVKxFUuOsvS9oO0FRSqZQZCNk/ZJ7Yp5HhtMTY9U
	Plh0cmVZ+mSLTAxXXHoL2QsNG0k9zF2FfzTKwM0nG8q1BvdKOQwGrgFVUAAxq7oA7YA+d+0YsX4
	2bxF2RQLjZp3MhafqSEeXozN3iFDY9hoANx+cnmRb6/oSoiY+qGq78ca+0jCVzZmU03vjoh0lv7
	7aedhJoqlFCzSCbykexSEh8TJwlW1zk+cKBvAr+yLqXZHNMAsaa0vXvduwLgO85vhdLwJSmtz8t
	mUQOPHmWC1sAMHe+ItGpdHxLdTg/aKVSIRs+mQMuZ5J0RcSeuuwJXriunGU4tY=
X-Received: by 2002:a05:600c:6815:b0:49f:cbf3:551c with SMTP id 5b1f17b1804b1-4a01b004e5bmr65470095e9.12.1790840464704;
        Thu, 01 Oct 2026 00:41:04 -0700 (PDT)
Message-ID: <48532706-23bc-4204-8ad4-8e67c53a2ba5@suse.com>
Date: Thu, 1 Oct 2026 09:41:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/6] xen/riscv: rename PTE "permissions" to "pte_flags"
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <1790699381.8631fc262581453bbf619ec5b2062170.1a0ee00218b000b504@vates.tech>
 <1790699585.8631fc262581453bbf619ec5b2062170.1a0ee033eb9000b504@vates.tech>
 <9f94af4b-f122-46e0-bbc4-7fecd51d4348@gmail.com>
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
In-Reply-To: <9f94af4b-f122-46e0-bbc4-7fecd51d4348@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1790840465-C36C2B50-A35A8D52/10/78276251493
X-purgate-type: spam
X-purgate-size: 647

On 30.09.2026 15:42, Oleksii Kurochko wrote:
> On 9/29/26 6:32 PM, Baptiste Le Duc wrote:
>> @@ -149,13 +149,13 @@ static void __init setup_initial_mapping(struct mmu_desc *mmu_desc,
>>   
>>                   if ( is_kernel_text(addr) ||
>>                        is_kernel_inittext(addr) )
>> -                        permissions =
>> +                        pte_flags =
>>                               PTE_EXECUTABLE | PTE_READABLE | PTE_VALID;
> 
> Nit: it could be one line now.

I'll do not just that, but also correct indentation at the same time.
With correct indentation it could have been one line already before.

Jan

