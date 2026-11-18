Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4814C606A32C
	for <xen-devel@archiver.kernel.org>; Wed, 18 Nov 2026 07:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=dfqc/FOw
Received: from list by lists.xenproject.org with outflank-mailman.1493879.1693592 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTaIo-0007pv-Ob; Wed, 18 Nov 2026 07:41:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1493879.1693592; Wed, 18 Nov 2026 07:41:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTaIo-0007po-M1; Wed, 18 Nov 2026 07:41:58 +0000
Received: by outflank-mailman (input) for mailman id 1493879;
 Wed, 18 Nov 2026 07:41:57 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xTaIn-0007pi-Go
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 07:41:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTaIm-007Xg8-Eb
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 08:41:56 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6afd56bf-8faa-0a2a0a5109dd-0a2a450bddb4-16
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 08:41:56 +0100
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6afd56c4-b7e8-0a2a450b0019-d1558030bd82-3
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 08:41:56 +0100
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4bb702a7548so5378925e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 23:41:56 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb78420edasm184510775e9.9.2026.11.17.23.41.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Nov 2026 23:41:55 -0800 (PST)
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
        d=suse.com; s=google; t=1794987716; x=1795592516; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mgwBONhU4Y7ym/dmjDRFxkbaJz+HLE1/smGpGs1r2mM=;
        b=dfqc/FOwLrXzHRBRkBTmmoXLI6ceZgsjGk/7IZhOvkitCqI9NhljLxIUUfaWFl52gq
         bxTCq7NUocGw6f4R07daRmf3Y3+khQbZmbEwTWVu8JwBfY5iaIAhVvd7uuHzZsfHNxWI
         ZlhYE80IKycDkRLPfHcm0w0ZCvWzdeYF5x/eGT6RLGyqfdu0iOhynIGgvNRS5/LdXFmV
         o2e44swpY8HXjJrX5Ddio15UeBGlh89Ld5qigCKOp3x8m97Mh3AHL2SJ6AO45ug32KdH
         2SL3fJYSv4ATjb0vy/fq4Tqi65U60vRAHAEPpaKlRedM0bC4YI8GAIv5MXZJFyI0RQ3M
         dGLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794987716; x=1795592516;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mgwBONhU4Y7ym/dmjDRFxkbaJz+HLE1/smGpGs1r2mM=;
        b=kAeIkuqj8zEWhERTY/Nhot2tmkmqv46WyUPRuFnjdIZJtQx2vXdDWsXmewxZY6Vwkz
         zdZ9QDWKqXA6FEwXOcf/PVAhodf7vsrYAtIFMFsm/t2vdqvg/U5A/i5m/VFKac3xlXdA
         /AVEW7991/5llPzRxrCjOU6IYSPhiZM/snm6N6uGqFeRFErl9jx+R6kIvDHrZ01djK0B
         +86TgV+ZKfB73VdRcQEoaSfNFOogbXkcCO2MyvGPWPsCPSMfqj/ePdfxmWsRDU4OAnCr
         ID0XMx6WRGBItOhPO9O9dXSs6BIVYKwsV+JVG3FB4TiDDOwdwxSRFtSKF0TDc++P2Z8G
         Dfpg==
X-Forwarded-Encrypted: i=1; AL+hErFsIcDpwWk9lNMpxglLXPMEDVc9+Knw/814V+kWmk+VVxqeiQDqAyWu64+/y9JSmmy6GPHK19z3uws=@lists.xenproject.org
X-Gm-Message-State: APuU4Z9HDS3hFcmSQaQPPg82AljKfuI1stO/Hg00vYkNXsw7g6IC5q82
	+hoH9kpGSpcOE8jwfPjrJ2NH6YcnLlZmh3ksIMedJe2E1fDlZJ7niEb1s/eWV9ydCg==
X-Gm-Gg: AYBFou3rM8aba9a/DqmGvz27gCUjknGYUrBP6OkLXjun8CWNwb98W8qLCCtsejOtphN
	bFMdLisyrexaP4qN6XjReOzxxAuKLvhMK9CT+ZuvU4BZGlqxtTqJH4HlarPW2ZjH2YVatEtqd19
	lOoV3Rezt0ORU5oHJebYlYtQtXn9psfH14j4qPnYWI/ktYFWMgT4ZVXW1hrgSENrvobWYLYtk/2
	Qz3KEr4VAUclcr24egiMeRaOtTKOXOelVdble9LBxcQt9IERkpV1zj8lVuNiiGJaIsJ38a7QSZe
	yTHvrc6+NJfnkI208kHpV6xdd7sPcA8uRw/8AEVdM2Yx8k7ikDvE6woWX6Wj9htJQcAP4xwrZuk
	FlX/tLgT94ijzdL5+XXI57ZRfl98iH7j0llPavDL8HpkD/tIiNzioWkuR91zH8n4tE1Innleg2s
	iiia6DpE5Ri9B/NEbVngF6dC0BdhlEOqlZtGUrZvxOUkt4Tz7DOLJ1DoKgB0Y4d1j+zUtFFfCVY
	G0X6xJElJGjoq2NohkjV1cgPq8M6T8etk2ghm5EaOAnYSvuGrFlqk1s5LJyUv+5EuCViK4KxO73
	NeR4bPwn1daITNh/NcG6cJoPrfq9nAz420wNRcLpTAGrBPmqtOrNJogon79LF6O9g2+DFw3HIXH
	kHewa92Yks2KLrJkNYXk=
X-Received: by 2002:a05:600c:c165:b0:4a3:59c9:a743 with SMTP id 5b1f17b1804b1-4bb7da3948amr27403075e9.27.1794987715879;
        Tue, 17 Nov 2026 23:41:55 -0800 (PST)
Message-ID: <3d675e31-a31d-4c93-952f-72280dd2f7db@suse.com>
Date: Wed, 18 Nov 2026 08:41:54 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: deviate MISRA R11.8 for capability enable
 callbacks
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <74ce8a8150674591c2b0daa672f8e2e00b2a1201.1794950154.git.dmytro_prokopchuk1@epam.com>
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
In-Reply-To: <74ce8a8150674591c2b0daa672f8e2e00b2a1201.1794950154.git.dmytro_prokopchuk1@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1794987716-192CC9EA-F1CB3F66/10/78276251493
X-purgate-type: spam
X-purgate-size: 820
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 17.11.2026 22:31, Dmytro Prokopchuk1 wrote:
> --- a/docs/misra/safe.json
> +++ b/docs/misra/safe.json
> @@ -124,6 +124,14 @@
>          },
>          {
>              "id": "SAF-15-safe",
> +            "analyser": {
> +                "eclair": "MC3A2.R11.8"
> +            },
> +            "name": "Rule 11.8: cast const capabilities to void * for enable callback",
> +            "text": "The Arm CPU capability enable callback takes void * to match the generic callback convention. The cast removes const only to pass a const struct arm_cpu_capabilities * into that signature. Existing enable implementations treat the pointer as const and do not modify the object."
> +        },

Do we really want to restrict this to Arm CPU cap handling? The same pattern
could easily arise elsewhere.

Jan

