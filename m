Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84B20E87834
	for <xen-devel@archiver.kernel.org>; Tue,  3 Feb 2026 15:47:27 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1219343.1528222 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnIcQ-0002Dw-53; Tue, 03 Feb 2026 15:47:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1219343.1528222; Tue, 03 Feb 2026 15:47:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnIcQ-0002Dp-1A; Tue, 03 Feb 2026 15:47:10 +0000
Received: by outflank-mailman (input) for mailman id 1219343;
 Tue, 03 Feb 2026 15:47:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J8X4=AH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vnIcO-0002DT-In
 for xen-devel@lists.xenproject.org; Tue, 03 Feb 2026 15:47:08 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 97ff3b54-0117-11f1-b161-2bf370ae4941;
 Tue, 03 Feb 2026 16:47:07 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4801bc32725so44750895e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 03 Feb 2026 07:47:07 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-482da8eb486sm147965185e9.2.2026.02.03.07.47.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Feb 2026 07:47:06 -0800 (PST)
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
X-Inumbo-ID: 97ff3b54-0117-11f1-b161-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770133627; x=1770738427; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vFDsgFqs2ZxoNSTm7F0bX77nilGUz/yCY+KB0l54Guc=;
        b=KEo30Zrn6UkQABqM+2sjTk+vtccn0dI/QMvZvm3kODXwZHGgzcOw4AjNnhPN/5VvSR
         K9hRObdltH4z+TRg6GrC3EYwiurqyAUxYpepd8qBwgDvMIMBDi4Ed73ZWWvYlq14hQlM
         K76uHR8gBa8lOfrkdR/2UxkJmOu6bfn8PD2vryOZ8FLjlD7SpwOkEGI77lZqhklruM5p
         6tLOiJ1TFVUBapMP5O3ta+TVmuq2YMuZS+kuvQUXcFcSczS16Mfe9mgAoggLolqlrZEh
         5ZGSlM2EUpOKPbKkvIc7t8AW94iijpc+RQTLLxKo1AlOkSJS3GBHfi+7P8jv+5Tb+1+E
         uI6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770133627; x=1770738427;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vFDsgFqs2ZxoNSTm7F0bX77nilGUz/yCY+KB0l54Guc=;
        b=Q0xCmekSwnnoCp6zrTA90669Gp3V1LXwyIcI2VAHTcUhCZ2igBeuN6J+trvrX6zby6
         rqsniZw7GrEjSgpn6YhVhrcW5T86p/0eBuSSg5S1rg82V5BAG1rLBkVmv4sQzTIqDQfw
         x1xaL95kyQtPLgW+ZZoQYcW/mbxa/3t3lWilzcEtmC5KmCDwC159gqTNF/bPjVMRNwpW
         BSTTZ4tqlX/4ly4CfLDW3FsxvEI77thMmgPKa5cqEKXLwDma2MP2A8RZra0Zr+JSHux6
         YSwpUCYpRGzlSxVS33+Rb/GdiPUZ/y+LEhfVy2uv5/LQcDEWDFgkdWBeyzWHQY7DY66Q
         oxjg==
X-Forwarded-Encrypted: i=1; AJvYcCWsCfWj8hoT18+z+pAuI6FLd9pMVlVSRiFV+T9m1G31ggXXlb1Ios5E0bJwYBlbkk+/eJtumfiklpw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwtVSaSLrIg8s6UNf9LcT44sgFJyTz6W2rLBFaAgkkXbNJC5xlX
	TzvJ6iMXLxuLbVUs8ErwInhXiDL1yTZv8ydwN+AHp+a0mKBHHjrqh+GC0NVxwGCAOQ==
X-Gm-Gg: AZuq6aJChy366igfBTSOh+SQ4afcuo1qojtBLrbWsSQxvRjjnHFRf8uG2NpfbDsX8Bb
	F0qYLDT4HFQjZBwqCvuMSpQd2eCRanBw0GKRlRFdf6OngG6G5apShFeEYpWSB2XGEWwT6155F8f
	Y4SZcTH20WpQXReJNCywEx4fH2qo1898Fr40Q2gZzFaM+4ij9S5nnYffjcH7/tc79vPMHPfXUKb
	Gzi9+9+f+86zUYn9rxPSbMKInfARO81SgwHv3eS5+1IMtuPffslxp9p2Cw5QbehFEAa+7mUp8oc
	th28bkz9eok+P+0GrI7U9xN12ejTGwy+GLDglGyCy93915Ckevb9+rAPX2CCYW/o2/xgnipfyFh
	lzd/S7QkDYQ4rpvLHfaUKFwmDus8AZkROOWIPBRTzM/KOSAc7+boTDdcuwdQB+WkXdsczd86eBO
	G5qzpV/YR/QUXLeloDRfKKRR3qAlM8x/NGByJtV8uXMpix3xI/57FNP82yBZdp06J+XUZeaumZ8
	Mg=
X-Received: by 2002:a05:600c:820a:b0:46e:4586:57e4 with SMTP id 5b1f17b1804b1-4830e987d12mr855805e9.24.1770133626752;
        Tue, 03 Feb 2026 07:47:06 -0800 (PST)
Message-ID: <ee928798-73b6-461b-9c43-b34778a4f89b@suse.com>
Date: Tue, 3 Feb 2026 16:47:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/16] xen/riscv: introduce basic vtimer infrastructure
 for guests
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Romain Caritey <Romain.Caritey@microchip.com>, xen-devel@lists.xenproject.org
References: <cover.1769099883.git.oleksii.kurochko@gmail.com>
 <381c200edaff013d999c6314c20e8cc8bdb5b041.1769099885.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <381c200edaff013d999c6314c20e8cc8bdb5b041.1769099885.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.01.2026 17:47, Oleksii Kurochko wrote:
> +void vtimer_set_timer(struct vtimer *t, const uint64_t ticks)
> +{
> +    struct arch_vcpu *avcpu = container_of(t, struct arch_vcpu, vtimer);
> +    struct vcpu *v = container_of(avcpu, struct vcpu, arch);

Why two container_of() when one will do? (Same again further down.)

Jan

