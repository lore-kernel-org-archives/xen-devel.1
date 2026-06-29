Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36CADC44500
	for <xen-devel@archiver.kernel.org>; Mon, 29 Jun 2026 15:04:46 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1347701.1605528 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weDX4-0006l8-WE; Mon, 29 Jun 2026 15:04:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1347701.1605528; Mon, 29 Jun 2026 15:04:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weDX4-0006l1-T0; Mon, 29 Jun 2026 15:04:22 +0000
Received: by outflank-mailman (input) for mailman id 1347701;
 Mon, 29 Jun 2026 15:04:21 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1weDX3-0006ko-G6
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 15:04:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1weDX2-0042pq-T2
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 17:04:20 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a428971-bab6-0a2a0a5309dd-0a2a4503866a-18
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 17:04:20 +0200
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a428974-ec1a-0a2a45030019-d1558033d5cb-3
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 17:04:20 +0200
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-490cf322ed0so24555805e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 08:04:20 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493b76e03b9sm11694495e9.3.2026.06.29.08.04.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jun 2026 08:04:19 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1782745460; x=1783350260; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9g7LQpgIXdIaGmZo+TJzdQjILrnJK0hnOopqh012Zhs=;
        b=Ix1kf8510KO4dYw8ZABgO0ydqoOn0f7IK9dWS8o0tK0oST7hP0L7FcWk4ZfoFxIpZm
         d6LQXQ4hSphBVxigVyq2/RX46lNRO3FzmRUAjPR1S9U+q/u+HX3rHMlXGci0ceJ8Jytb
         yXdgtflMS8kl52AVDFxx7ziwm6sMnv+fHOrDtaBRyfS0FL+8yVTGYxjDwx4l+ubl6qSq
         VHehK/9/tlQcx9f8RGLO2g+FQ1bKFw2+DZWmVBzehI5eZqApr1nSOeSaMe4nxq6OCGTu
         TngReAAP+6/u0Adat4jZyF8D199qnSgf6jXv+ObwrGh3p1ukzhY83OrFtCoDRIOmDS0R
         ZAFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782745460; x=1783350260;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9g7LQpgIXdIaGmZo+TJzdQjILrnJK0hnOopqh012Zhs=;
        b=Fk6KC1OBEInjdewvt/CuD5NHelYGhgsqa4rBI4lnjL8zhReAoHZsbTVk3zcP4NJyLf
         xQkQO6gW60rD71zTtCIiqTFPKyNgFuTeYauediri5hRWBUCEmOKyF8OzhHQiydwcU3Ns
         dIaKAD+oVT1oqGPDmjrE23Z/JhUxZ0AxC5iUYWsXh1qzF/wnrkQmtv9DhHcVzaqz0EBk
         G6pAanRYWd7Hgny51KQJS3iWVGKGevNH1r6mzpC0hIJiMtTLFdORTTyETzZM5kZ+SFuD
         Xg91KgN0UNb9xouCPtwemhPSgv7wXMjRvPtOyagzwTAzBot+5RtIRxSjgPzZ/bK6z+kf
         U9Ng==
X-Forwarded-Encrypted: i=1; AFNElJ/RkcpRQW8pWjVc474xyQ2H82yy2J0nE5kMdFw4157YK2zBLsTpIeeBL7izAKPyjxjvqTDNk2AVoRY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxm5FZVA4WWQ1S4xy6fDFm9cDbYBkddX3MbML8BMW10ZdNc41iu
	1m8uhNfkJNzVAweeTmIT9lc8Umsxuf4LH87+7CNyCthCo8YwSbswiL/Bq/0/mZCf4A==
X-Gm-Gg: AfdE7cmZ8GRSXGAOLMEc4utmSbqE3fL2bg/5wb+VRcGp++n7CQ1r9CzF8JPE/VUKqKX
	zT0Qlp120drx/hAY5cIxUxqzSiOohFy7SkNptX3Wakq02Qx4udg7+939S+5o5P7xXR2YLeKP1Sl
	YZf7xhG+F/miCZLgRU2JGx5D22MGvozbbtcPGsE5goD2LTuhYhWm6rCtcQlW6+qZDcpvGVvLAPB
	HV7AuTRdk3Obeb8Bt6xsOfO54f6qWIrKk5guX4GHjG0fSGjzLVt1HXJJQrlQSEN5GkSJfolZwSS
	jv68zgCqKLv/CI/uIRliWVA7hoLLIvjH7Ebef/LtQCO8/Uut+OBGzFzRSe2W98/Nbv81jnCT8UG
	5P5WMZt5v3it4W4aVkPPiOlMXhqowl2y2bi/l8zskIqe8e3sLleI6JNX5dnPPd+hHyDdUZnKjuP
	FxFgdwotnxdNEd60Lm35o3vQFGdAeCHR4d8HiVjKF7ra/9SBdpQE/8FkUO5vVBBwVPlWFrZy0t+
	aci
X-Received: by 2002:a05:600c:8b28:b0:492:6a51:86c9 with SMTP id 5b1f17b1804b1-493b827f586mr1298305e9.3.1782745460146;
        Mon, 29 Jun 2026 08:04:20 -0700 (PDT)
Message-ID: <8ccc2b52-ede8-4eb4-9056-49f1aad5e08e@suse.com>
Date: Mon, 29 Jun 2026 17:04:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 17/25] xen/riscv: rename enum intc_version to
 intc_variant
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1782487661.git.oleksii.kurochko@gmail.com>
 <542b22adf7bfb2a60baba201ef89df260d9bfd1c.1782487661.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <542b22adf7bfb2a60baba201ef89df260d9bfd1c.1782487661.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1782745460-06B2C5D1-1118B53F/10/73395122804
X-purgate-type: spam
X-purgate-size: 524

On 26.06.2026 17:46, Oleksii Kurochko wrote:
> Rename the enum to intc_variant and the structure member from hw_version
> to hw_variant to better reflect that these values select between
> different controller variants, not versions of the same one.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>
(perhaps also Requested.by: or Suggested-by:)

It looks as if this might be independent of earlier patches, and could go
in soon after branching?

Jan

