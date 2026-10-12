Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26B17CA9EC5
	for <xen-devel@archiver.kernel.org>; Mon, 12 Oct 2026 12:52:19 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1446286.1662382 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGFVg-0005QJ-Ad; Mon, 12 Oct 2026 12:52:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1446286.1662382; Mon, 12 Oct 2026 12:52:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGFVg-0005QC-7n; Mon, 12 Oct 2026 12:52:08 +0000
Received: by outflank-mailman (input) for mailman id 1446286;
 Mon, 12 Oct 2026 12:52:07 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xGFVf-0005Q6-AD
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 12:52:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGFVe-005YOF-N3
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 14:52:06 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6accd7e1-bab6-0a2a0a5309dd-0a2a4503a4f6-42
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 14:52:06 +0200
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6accd7f6-fae8-0a2a45030019-d1558032e010-3
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 14:52:06 +0200
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4a1635f7c89so18894795e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 05:52:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18d12fe04sm179315715e9.4.2026.10.12.05.52.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Oct 2026 05:52:05 -0700 (PDT)
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
        d=suse.com; s=google; t=1791809525; x=1792414325; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LtbRu2v2JZKLzoH50KkQK8EsMZeCKz00sehx3l4FGug=;
        b=e5JV9bmj+0wYz4/z2Kzx7Vi+yR1j5mT1vefJRS7DkKFNBvpUbuGhufVm9IISMeNiDh
         z+pAOucuvPr/Wu/QbS6Xr+6wf4NujeI+SsHcjoRDPLgojTLsLSWzJwzdBwMWZZUleOil
         YSGKCCJqZSDZxBF1j3tNLBCKeHY0r5rKKwkJs6nhnjaI3m18vyn62Exj1aStAo2GcLlR
         RGEqk0nLpuPNtSQB6aWaeQNEjSnPuhKA7f9namibLIUYrW6pGYQLvGcQ6oyVNj5zC8n/
         58fICTlJPux2WWMl8qVQU7VWkv7NgYQr7/FxQwfI29s/l2M+TYRNYmaknAVR7qSytbFo
         77pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791809525; x=1792414325;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LtbRu2v2JZKLzoH50KkQK8EsMZeCKz00sehx3l4FGug=;
        b=o4ZWyyDZ7yMC3VIDGugErD/2NPxAZHfFzgl2s6EAGTPTKNf5FBDYa8xiqI1ofl7aPB
         PJ6rLCZPJCei78K6K6hmvyw06gvM/GjtQ2v5AQIn8sB1zJQaFUoMZ3iDv1qws64RxkF0
         nzs4vTNrxasLxcdwZ4TpErNRJujD/TbTK/FSSvGXe2o9W22P9AV3lpo7o2dR4xFKb1Yc
         J8+huQoVDZtlcIcJQ5DmDHQMmzvNOyRCD8j7eWVPBI6lKlbJycEw3RngvDBiatLAIcTV
         Q8CuFZFPFGE1jWBvqcxpKCneqH3U9uk+6D5A6NsSZ5c//eX13Pw+4nhp/afoEvwy8SNS
         gDkw==
X-Forwarded-Encrypted: i=1; AKwUvBysAyvGCfc1QBHyz2qfU63uUGj2qql7PjXs71PchU+yd2l9e2MXU1zLqCNQZzPUmEZar/Fdm7BQzY0=@lists.xenproject.org
X-Gm-Message-State: AFq9FYIr0LrHkCTnO+VaRKhETgJy4/nleaoArHxABi0sVq9c8sgf6LhF
	lPd8okM7fZV7gv2EFQIOIMoCxan5v6lRpXCBOELVzc851G2AoPuEU5eIGNiG4VFBM6RUjKzSwFP
	f4IhAkg==
X-Gm-Gg: AYBFou3JtQhznYq0IiwhBvn/WG5Kf/tUel7L86iSq5HA8vu61lWVqo6M8jPW1q/oIWV
	gB8UCQZlOBgWwCFVyjw12hA/M3AM1aI8Q7/AtolFeugeviOtUo/eAhH9mgcafnfW2PedommOuLP
	1maghTbE1wrH4TF0LCWydJ5ic22F/Q8HkD3wS1cdriXUiT9JkEy2W18ubVpXWfc2JZwrjsETu4K
	yVxkd+4meWoJBctYicQUbUe6i6RUP6NuHJq34EQAQtgTwR9FETYZ20w9rslofL+XZnwwndtBAd9
	WPXZM4kxpFT0M6bIF3v6+NKY/4Lv4rDGDwhNWOj8YhwoRTXQseDJ/jgISMsE0DCyyIt4QH4UO+Y
	iURqv7tr2AXrX+Wdddjc3homu2qKidYod4vPe0PChmkiM1usQgzOjJ6E3ktkLnFRrxoCdoDGiWm
	PcFKRo8VquGFRiziXD4YdiHx/huozcIQMO09wzAbxVDwphUrX8aU+xOP4aDNJlWjchNGrOWo//J
	ah4E/hTfyVETTPaU+P4tMIR+9WmzCcjYZdDkTLykjH8EM38R9Uo48z7rpBqknE=
X-Received: by 2002:a05:600c:3544:b0:4a1:813f:2a57 with SMTP id 5b1f17b1804b1-4a18e4ad8fcmr163103565e9.13.1791809525498;
        Mon, 12 Oct 2026 05:52:05 -0700 (PDT)
Message-ID: <5bc2e923-4265-484f-9236-25a56560e2c3@suse.com>
Date: Mon, 12 Oct 2026 14:52:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] xen/ns16550: detect and preserve UART_IER_UUE
To: Zhang Zheng <zhangzheng@iscas.ac.cn>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20261010031406.2057735-1-zhangzheng@iscas.ac.cn>
 <20261010031406.2057735-2-zhangzheng@iscas.ac.cn>
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
In-Reply-To: <20261010031406.2057735-2-zhangzheng@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1791809526-74A894E9-4E41DD28/10/78276251493
X-purgate-type: spam
X-purgate-size: 949

On 10.10.2026 05:14, Zhang Zheng wrote:
> --- a/xen/drivers/char/ns16550.c
> +++ b/xen/drivers/char/ns16550.c
> @@ -64,6 +64,7 @@ static struct ns16550 {
>      bool intr_works;
>      bool force_polling;
>      bool dw_usr_bsy;
> +    bool xscale;
>  #ifdef NS16550_PCI
>      /* PCI card parameters. */
>      bool pb_bdf_enable;     /* if =1, pb-bdf effective, port behind bridge */
> @@ -352,6 +353,14 @@ static void ns16550_setup_preirq(struct ns16550 *uart)
>      /* No interrupts. */
>      ns_write_reg(uart, UART_IER, 0);
>  
> +    uart->xscale = false;
> +    if ( !(ns_read_reg(uart, UART_IER) & UART_IER_UUE) )
> +    {
> +        ns_write_reg(uart, UART_IER, UART_IER_UUE);
> +        if ( ns_read_reg(uart, UART_IER) & UART_IER_UUE )
> +            uart->xscale = true;
> +    }

Linux'es detection is a little more involved, plus: It doesn't clobber the
value originally present in the other 7 bits.

Jan

