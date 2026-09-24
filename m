Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D9E3C98318
	for <xen-devel@archiver.kernel.org>; Thu, 24 Sep 2026 15:38:04 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1432561.1653773 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9lW8-0006z3-Ly; Thu, 24 Sep 2026 15:37:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1432561.1653773; Thu, 24 Sep 2026 15:37:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9lW8-0006yw-JB; Thu, 24 Sep 2026 15:37:48 +0000
Received: by outflank-mailman (input) for mailman id 1432561;
 Thu, 24 Sep 2026 15:37:47 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x9lW7-0006yp-2y
 for xen-devel@lists.xenproject.org; Thu, 24 Sep 2026 15:37:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x9lW6-00Gw6m-G5
 for xen-devel@lists.xenproject.org; Thu, 24 Sep 2026 17:37:46 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ab543c2-e002-0a2a0a5209dd-0a2a45079e7c-38
 for <xen-devel@lists.xenproject.org>; Thu, 24 Sep 2026 17:37:46 +0200
Received: from [74.125.225.141] (helo=mail-wm2-f13.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ab543ca-b4ea-0a2a45070019-4a7de18dc9b3-3
 for <xen-devel@lists.xenproject.org>; Thu, 24 Sep 2026 17:37:46 +0200
Received: by mail-wm2-f13.google.com with SMTP id
 5b1f17b1804b1-49e620fa473so13744585e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 24 Sep 2026 08:37:46 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fe5e07bdcsm69481525e9.15.2026.09.24.08.37.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Sep 2026 08:37:44 -0700 (PDT)
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
        d=suse.com; s=google; t=1790264266; x=1790869066; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=21Sx5Z8bEuao/hLpUOAyuGmrfY+uSBEqP2/z7y7vJxU=;
        b=WfBOFxnvSbeyEk5iR2eRdLuLlGoewLrSjF12rOmzsEdpj8iiF9/x7iWo6Z3ZBfjrov
         yIYOmFau67YT3ApfUHX7RWYU9sHt9nrPLM9XLR1jjawwvzqk9iecFTOfoqiQrDTIWVjq
         dovvvrqywQ7VAQdGzEFYZHGkXOQsqOte1Lr2vLqRgCXaDtCFk/yeufiAxAhq+LulolxP
         wnwmDATswAAs7ctqg+qv7tLcVmDrxiES+lbxI0MG7sWC9cMOHen334+6wbm0DoRw9Cpj
         gMv+u2VvFiqJ1ogYZl59WWq4BDe6yiCDjnueV4YSYqoYEWvSc4fHvbr3uX28siY5dQYA
         X8+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790264266; x=1790869066;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=21Sx5Z8bEuao/hLpUOAyuGmrfY+uSBEqP2/z7y7vJxU=;
        b=i8FxAiG8fkcGR1HQhwUCSBTavlUpewshM3mLTvbXrdO6MGC2I2l4JfJEZkmyUn/TIs
         19YgeAFaZfoOvcLbKfgJ3MVoxPqMvrH5RaMpkAoav2iAtS5AzOR38ttrRAhteiZjw3Og
         QUjHeZQyp7X0silkP5aUq+j1u/NBz8xbbdIAN9p8AwM+z5j+Tn3rilJ9z/cUNP9ogvXa
         M8E5vbctDFS1S9vuBA0CbnAZzaewlQ4QTMeypJcu1RX9FAZTw/kd64g2FeeDm8pLVi8P
         Cxfn4FPqgJbLs/ReHfxgASwchs4TfG21etWuqpjICQDDvo//Cqw/dK+x1O93eyQfnkzX
         7LEw==
X-Forwarded-Encrypted: i=1; AKwUvBw04kxF9lyw1ax3hPTQxm0oPysHCS14IA6zSGY/CoW8pgvaYSZkg4o5+Q42edO113uJcBQdrZJwhM8=@lists.xenproject.org
X-Gm-Message-State: AFuF++keqp6Vm/M32PRf5eEw3TmPSmdPsfEt56Fu/7slUaTZwROhT4Ht
	n7IiPkj4jxudppW/YUwu/yrd/+iONhtuulCUzf9goo/L2ioXy9b8znj5vUok75G8GQ==
X-Gm-Gg: AYBFou28Z3aYhwItn5TiWmSCACjo25Af7EUYlvXfRjL57Xyd3VXW8bYcrkACml39ZdQ
	JDMJVisScUK0u4qeZwlEEP01dvRi7arfr+NyR4h0r9HpihxIVaj7jHCYtSUm9yUcL38PlFmi5df
	VuzBrxPmppdermHugOrsjAo6DkC8Tilp/5DxIvMcZb2TuBlV66aHUTqWS5XK16pvaU+xSK8TRDM
	1uw8ilR19F8HhHsaf7PplfDlNa5eBVNX5e52gpXUgjmnHIYLDtZNR5JIUUbFZlm7tdqhSEKmYZL
	07z4KpweMqmCL91FWgoifPn85gAVlcLp3aWQnTy9tqOATd7eqYVsxYLqJGs31GL8kz7jHz++OIa
	kxipSKHgdnPefavb1Jo0ANQ1ADLzG7XyrJ2iPV0j07X0D6zQZC0lM9MN8NFlo3mVWf4XwMS8EPe
	gFL7rU/CRMUwuM7t3xGkUZ56lWXTl1HfTr1/inyXx3GdnIY8R5rkxb/mMBc4iWJcyESD4zkvuT+
	yeJ1+zjW+5Uhym6ivng148DtB4Hw7WRiQ7rNzjXX9Q247a9UuuvZP9gdMUts3s=
X-Received: by 2002:a05:600c:4fcc:b0:49f:df99:ff1a with SMTP id 5b1f17b1804b1-49fe66f344dmr53716345e9.17.1790264265707;
        Thu, 24 Sep 2026 08:37:45 -0700 (PDT)
Message-ID: <c3d3eda0-d761-483a-8869-5973a940d8a3@suse.com>
Date: Thu, 24 Sep 2026 17:37:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] vvmx: Handle INVVPID_SINGLE_CONTEXT_RETAINING_GLOBAL
 properly
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <1790088652.8631fc262581453bbf619ec5b2062170.1a0c99927a900072c4@vates.tech>
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
In-Reply-To: <1790088652.8631fc262581453bbf619ec5b2062170.1a0c99927a900072c4@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1790264266-37AD0AE4-377F9044/0/0
X-purgate-type: clean
X-purgate-size: 513

On 22.09.2026 16:50, Teddy Astie wrote:
> The feature is already advertised in NVPID_CAP_BITS, yet the handling
> in nvmx_handle_invvpid() was missing.
> 
> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

> Fixes: 9ccf55307868 ("nVMX: virutalize VPID capability to nested VMM")

I think it's its immediate successor, aa1b9dfdff9c ("nEPT: Expose EPT & VPID
capablities to L1 VMM"). Without NVPID_CAP_BITS defined / used, there's no
bug there.

Jan

