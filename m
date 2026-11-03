Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52504606D803
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2026 16:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=NSZPsg3M
Received: from list by lists.xenproject.org with outflank-mailman.1470251.1678976 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOHmO-0005Bd-8i; Tue, 03 Nov 2026 16:54:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1470251.1678976; Tue, 03 Nov 2026 16:54:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOHmO-0005BW-5u; Tue, 03 Nov 2026 16:54:36 +0000
Received: by outflank-mailman (input) for mailman id 1470251;
 Tue, 03 Nov 2026 16:54:34 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xOHmM-0005BQ-R2
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 16:54:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOHmM-00Dvsf-7l
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 17:54:34 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aea1196-2eae-0a2a0a5409dd-0a2a4502bc5c-46
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 17:54:34 +0100
Received: from [209.85.128.41] (helo=mail-wm1-f41.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aea11c4-6ca4-0a2a45020019-d1558029e9c1-3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 17:54:28 +0100
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4a2167bd087so37712035e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 08:54:28 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e71b789ecsm25250984f8f.29.2026.11.03.08.54.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Nov 2026 08:54:28 -0800 (PST)
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
        d=suse.com; s=google; t=1793724868; x=1794329668; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f0y9kAjN7r9Bj9gP05840BwCy1OA1t5Lv5sRd7GPCQQ=;
        b=NSZPsg3M5zTHqNPBSK40t4zb9pqOesE/bJxIiYA+n8++qJVvTy5Mvdzegoeow42r8c
         Usf+uNt4miepmKG8vflGeU7tiRL273U6w/pCknEQMgDObJ98NgGl6/XX6aeF4QWl+Hn9
         qvLoe2shJvkPAgwr/Wpfd/RfQwB3ivhKikDF3byMG1eTRqfyk4n1L3ZCeJuVpmFkKqVn
         m4+RV2U9LyYns4xBRo+54ejWzfOKEI54jUXw+k/Pl3GcqOHLyNqZCteB+m4fFVawOwsy
         7vHI3p94lOQ7T/M9/QH35Zn4mZRPBHHi6/d3chFbcCbshha+OJ3ON56tbUOWqUZBlh2O
         kJQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793724868; x=1794329668;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f0y9kAjN7r9Bj9gP05840BwCy1OA1t5Lv5sRd7GPCQQ=;
        b=oK98QlXXubJRTEXnbrl19wGn7cbYkrmMZH8dnKSp68Zat7lWzMHQucvjHtBC0ZO37t
         CkhaoI5zA1RL/EwZJ5+XIhAeuR5ESB6mUxe8ZzyHA3npjhLwfTcMZeNGvK0keldvhXhJ
         zXU5F9xFu0oTtY/fwZ593z9AE+9feu/a+yB1vOlSAIuGCE4uW6ikHgq5N/WlvgeVd3mJ
         I8G+BhnlBHtizXWxnr3WkM6eTPD22ullDo2qwlMuZT414CuKqdzz+wY0w0dCDTtrDUuj
         yk1hpH9YloHUSDDvGZHjfUcat7hp5q9e3ZcFvYaDLTxwV3j86KWaKUmMq9OBIilOXsnC
         i1Ag==
X-Forwarded-Encrypted: i=1; AKwUvBxcBBBVWLA8/4jU+XljlVozHEy4mwn4k+vVV0kFHJXZFclF5PbX3kIMPjSYE/PD5DXl28pxSR7zNB8=@lists.xenproject.org
X-Gm-Message-State: APuU4Z9+/WK++S8XyQpyCxqv/oyzH7jBagh1lp1giiTNfFO2BVSCLk79
	7qtqVyfYpl7soj0O3ANapPcSgTx5VUSekdy+RQdvOdjfQtnRRF0XKC1/birRmM8IBw==
X-Gm-Gg: AYBFou3nlJs1O9l8r5cI6mYjo3Ln3cPGzEtEJqhRBcKiUZPMwxvFsuSIIWELzAAhrPd
	L8HOa1H5psncPCx2B8A5E+vdZE85QSHRFYIO5T3NE3jFSw7qe3gRGtBrr+S85TeLdEapUctKI+w
	zG07BMnJTrk0RRBiZCZjEmqxXh7WoollGgV+E2W22A7Wf8oPsrzzLLBIog+ho18AUTYs5Nw/kiJ
	lVhfHgUAt5gweeM3ASz7hDBsDa8GHOTlAeE4sGnFiGP2f1vTXXlBYHYBy/QnjHbsB5vuOD7+J83
	JcDO0kO0UL2x3iHj4SJ9XejDjae9X+2EcAePmAqZHpTeDHaMkZrpM1ad+jj5tJnKhQif0FUHIWQ
	ll3K/MJmfGKOZEk1NA27u2RNPedM2xKjVPMFeIriQ219yEpKX7ognZgLTTQbu+gHVkCfsxIufAJ
	lMrBK7Cw6XdDbLsMIGvskwv6mMa72MAelfVwlmxe8k91GNk30BS6JPjXUCbuor6MUfMCIyM6ZHR
	G3NU+vCxo85WpRCx1TIXTwbuoi4ugw3FraK68b6Hpn/RjvzaVnyYpIgbeBFwD50QbvRHmpP4PBu
	pRECX/iXvkDl/U1unHScEsATaer7O13/HqLzWxsSI8juMXLeA4hdzT+p/GzboAG9PLAwEuDjsG6
	67LoWP4eeHQouqTC1qAixE+Lcl6N4GGGjeHAULA==
X-Received: by 2002:a05:600c:3b88:b0:4a1:cf60:dcc3 with SMTP id 5b1f17b1804b1-4ac187a6ffcmr332090275e9.29.1793724868445;
        Tue, 03 Nov 2026 08:54:28 -0800 (PST)
Message-ID: <3196265d-474b-425a-a87a-de54ec836516@suse.com>
Date: Tue, 3 Nov 2026 17:54:27 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] xen/gnttab: Remove explicit rcu_lock_current_domain()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Teddy Astie <teddy.astie@vates.tech>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20261103152928.2142176-1-andrew.cooper3@citrix.com>
 <20261103152928.2142176-4-andrew.cooper3@citrix.com>
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
In-Reply-To: <20261103152928.2142176-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1793724874-30DC12AC-53DAFA7A/10/78276251493
X-purgate-type: spam
X-purgate-size: 512
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 03.11.2026 16:29, Andrew Cooper wrote:
> rcu_lock_current_domain() is always a nop, while rcu_unlock_domain() is not.
> 
> GNTTAB ops swap_grant_ref and cache_flush are the only two paths in Xen which
> explicitly RCU lock themselves.  Drop this behaviour.

Arm's do_platform_op() has similar logic. From the description I infer you
consider this bad behavior. It's not becoming quite clear why, though. Plus
if it was bad behavior, why would we keep rcu_lock_current_domain() around
at all?

Jan

