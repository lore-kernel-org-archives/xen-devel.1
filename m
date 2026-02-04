Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C490E83EEF
	for <xen-devel@archiver.kernel.org>; Wed,  4 Feb 2026 08:13:46 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1220190.1528895 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnY11-00053J-GL; Wed, 04 Feb 2026 08:13:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1220190.1528895; Wed, 04 Feb 2026 08:13:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnY11-00053C-Dl; Wed, 04 Feb 2026 08:13:35 +0000
Received: by outflank-mailman (input) for mailman id 1220190;
 Wed, 04 Feb 2026 08:13:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S5Vl=AI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vnY0z-000536-Dz
 for xen-devel@lists.xenproject.org; Wed, 04 Feb 2026 08:13:33 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 64489c02-01a1-11f1-9ccf-f158ae23cfc8;
 Wed, 04 Feb 2026 09:13:31 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4806f80cac9so35893345e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 04 Feb 2026 00:13:31 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4831084dd88sm27331995e9.6.2026.02.04.00.13.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Feb 2026 00:13:30 -0800 (PST)
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
X-Inumbo-ID: 64489c02-01a1-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770192810; x=1770797610; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=b3ebmaPAjNzvoE5agTzKt+AxRR5bdLlXUsboEO/6Sfg=;
        b=PatpX11uYIM/YZzKvelml6WJ8U/rpyKZWRYRE1uvDd+LWRDXhIKYE2UECp45iXMuI2
         RlxMxhCDNLzXE3b1HBjeYxOBh8+8reaTngceIggtcGubnco/oD6Dp0Nv2hF4uBImKUz1
         XkqzEcC657Dr6iBNJoLFQ0serLdYdtGicmPD9RL0iuuHOFYmF5IXE1BteGSyssAcPPnG
         1A4dzJCpQmE1gQ5HBiZR6t2xSdiXkIWDosDyOaLlaFVnv6EUxtWexd44nOSL/cp2h4s+
         seSreWgRUf0WCGksRyH1K9u3TR6DhoGfDrolT0hubW1z59ldayqxvLG7nkJMqmRcvxrX
         DOag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770192810; x=1770797610;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b3ebmaPAjNzvoE5agTzKt+AxRR5bdLlXUsboEO/6Sfg=;
        b=ddgLkSCwfsDkA0snhJmMxqbmqK46SI+roi+La3F51+YFVpDnrdMov70q7kgQr2I7X9
         valWFw841o2WRZA7hLH7Tv/lHQdD4yCHpFXG0ws3EdfN5BmTEWcoBAAFlatRm4eZXpYr
         nPaG4UG2D4Qs0GE7tYdw9kftcdJixMvQNScmpQAjYgybFEzGrgyOaTVqjyhFFhoa5VQC
         JDzURARkYiyEl+DvBSUcU1XEZUZPUFnT6TNADyARxNM+vDOBVVGnowA6SO5Q63bsk2oX
         exPUdCfDLwjN2iV5Pjem+aRwkTy/wyKnJVvU30So8q76wQgv5vuyZ9xw5QaIYSok0vEG
         aOJw==
X-Forwarded-Encrypted: i=1; AJvYcCWFjJjwHmxCUYE0omcQP6/1EZY0pDGOoiprSld+cTkJMOjInqrov0IGVyJmN5hQqTLi7henFmnfcj0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yww0ymtIXUNMLrZ7O7ontq55AhU87qGI9yHTa6nzOVgvIPKyPR6
	XygQXhSVkrbuivuSQ/c+zyAyNGp2TMI4fBhuObUYHjgfYqfgcblSANxcAWKy37nuAw==
X-Gm-Gg: AZuq6aJg5ScIVUkQ1vaxxletCD3xH3TP/vr9K0bBP3FkpImnQnVkihRTLBjPmK6xfgC
	O3wMZnQ1lYopwIWXgqqe0qyAIhSxiOM4LvPQSrftUYM9dGV54iYFhz7dglvAM9cMdfp4meYtv+F
	gFelFh/zPUInjr/D4GNns3e1zyQ8x06kqvGffMHyl/dqiP41WoWtMwHDh7CtKeoSEgkBXNLEFQx
	0aOexbfCEM3Qlz+EVpg7ZvHKnqHyGA6o4fFZDMWVB9xOpJpKRGa2Ct0x15SU2ZSDa71HlNHdCfW
	47Vj3u+z+P0/NMg0kIfIDxSJ+VfNX4h/S1GwFrBJ1wKMHtGsFQEnpBisW7n+a9McBxK61oi+l2f
	qugRIp95k3yHStzxteOrar6zkVj1jBHhquEqqKb6GXR2UTFvVhclFW4KByFb7EQPnVUBOnPKbjQ
	eNfS2d2AktlEubnGRE3WcWbw64vZ5YyZXv8UPm4Y0YC4s0kaej5vm+ocqFVGxWekL5Q3ZMcbVLS
	ak=
X-Received: by 2002:a05:600c:34d5:b0:47a:81b7:9a20 with SMTP id 5b1f17b1804b1-4830e930f67mr25456635e9.9.1770192810550;
        Wed, 04 Feb 2026 00:13:30 -0800 (PST)
Message-ID: <b5fa18dd-d831-4f32-9b29-ac431e54b7b2@suse.com>
Date: Wed, 4 Feb 2026 09:13:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/16] xen/time: move ticks<->ns helpers to common code
From: Jan Beulich <jbeulich@suse.com>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Romain Caritey <Romain.Caritey@microchip.com>, xen-devel@lists.xenproject.org
References: <cover.1769099883.git.oleksii.kurochko@gmail.com>
 <c7afd490ad9cbeb91b2b46b59cba094c7322edfd.1769099885.git.oleksii.kurochko@gmail.com>
 <2ff79945-f972-49ae-b50a-a7bbff9d4aa9@suse.com>
Content-Language: en-US
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
In-Reply-To: <2ff79945-f972-49ae-b50a-a7bbff9d4aa9@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.01.2026 09:48, Jan Beulich wrote:
> On 22.01.2026 17:47, Oleksii Kurochko wrote:
>> ticks_to_ns() and ns_to_ticks() are not architecture-specific, so provide a
>> common implementation that is more resilient to overflow than the historical
>> Arm version. This is not a practical issue for Arm, as the latest ARM ARM
>> that timer frequency should be fixed at 1 GHz and older platforms used much
>> lower rates, which is shy of 32-bit overflow. As the helpers are declared
>> as static inline, they should not affect x86, which does not use them.
>>
>> On Arm, these helpers were historically implemented as out-of-line functions
>> because the counter frequency was originally defined as static and unavailable
>> to headers [1]. Later changes [2] removed this restriction, but the helpers
>> remained unchanged. Now they can be implemented as static inline without any
>> issues.
>>
>> Centralising the helpers avoids duplication and removes subtle differences
>> between architectures while keeping the implementation simple.
>>
>> Drop redundant <asm/time.h> includes where <xen/time.h> already pulls it in.
>>
>> No functional change is intended.
>>
>> [1] ddee56dc2994 arm: driver for the generic timer for ARMv7
>> [2] 096578b4e489 xen: move XEN_SYSCTL_physinfo, XEN_SYSCTL_numainfo and
>>                       XEN_SYSCTL_topologyinfo to common code
>>
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>> Suggested-by: Jan Beulich <jbeulich@suse.com>
> 
> Nit: Flip the two (chronological order).
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Btw, if this got the necessary Arm ack, I think it could also go in ahead of
all earlier patches in the series?

Jan

