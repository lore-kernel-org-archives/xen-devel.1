Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DC40C531D0
	for <xen-devel@archiver.kernel.org>; Mon, 27 Jul 2026 15:19:44 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1371763.1619235 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woN6q-0007dM-Gp; Mon, 27 Jul 2026 15:19:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1371763.1619235; Mon, 27 Jul 2026 15:19:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woN6q-0007dF-Dm; Mon, 27 Jul 2026 15:19:16 +0000
Received: by outflank-mailman (input) for mailman id 1371763;
 Mon, 27 Jul 2026 15:19:15 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1woN6p-0007d9-FD
 for xen-devel@lists.xenproject.org; Mon, 27 Jul 2026 15:19:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1woN6o-001k0v-7z
 for xen-devel@lists.xenproject.org; Mon, 27 Jul 2026 17:19:14 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a6776e1-5cb7-0a2a0a5109dd-0a2a4503b71e-24
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jul 2026 17:19:14 +0200
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a6776f1-fae8-0a2a45030019-d155802aa9ed-3
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jul 2026 17:19:14 +0200
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4954a9e8490so19889045e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jul 2026 08:19:14 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4957e334f63sm195479555e9.1.2026.07.27.08.19.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jul 2026 08:19:12 -0700 (PDT)
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
        d=suse.com; s=google; t=1785165553; x=1785770353; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=buzS5elld4WXgqvh6aKSEm5gegztoi/eCUi3U+AJwQA=;
        b=Kgypshuk8q31fnpIYmyirstTaZYxNtKXbs+vDDVnZ86jjFswWDi0Xh3BWE6BTBGE8O
         4AFxS971SISKSi59mWYUjlopvZsQ7NnI0XQOnUcGPa3VfSZ+gx70VG7tX1KxHWvidPys
         weYSWmLSQXaVIodB84aQiyfNy62Q1CAa1TYP8escKaZ7Dky4TiNBuAFrwx9GwpUXphPN
         oFZ7MsgT8WL8J87f5nI6GpZRRH+65uNvupTvRYYS/f9szDUTqhDUBNZwU/HFByAaa2vS
         cP8hV77gOQSt/h0R4RM8gn3N1cYu8YIjKBxjOR2Llnjqq+1k+98fKEFlrpPpIi/+X3ml
         retg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785165553; x=1785770353;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=buzS5elld4WXgqvh6aKSEm5gegztoi/eCUi3U+AJwQA=;
        b=dNBSGS9Yv4qZrNpoan0oPoBD2CNpHhQ/We7jyctdnOKGKAcBup2HSsEOA4Q6yEyS1m
         qEMgHtm+o9F843CdsjiJSlnUL4bQ32/JZFCGrf8Xy0VFIH4+/CG3RNkGC6m5s/7kPEmG
         HPFt6sqiAtaMAm8CAUiBf2XG3OhNAOLy1xUk/Efa8E3dfU0gaVUnd0u076Uc7zwR/DgY
         73eUPP00H3pFa/2bn2pqQyUpojTHxNiT+iE3asxP5pNEA3ih36IjJA0xfcv6uCMHunWZ
         IfSjmrxvocl98aMmoV5ozZC2Gbd/MWB/FCv8WNnTJSji/AUkegHEAnFsYJF9imVpZjI1
         HwxA==
X-Forwarded-Encrypted: i=1; AHgh+RqUMsm7zX5cEQdM9GaUFYyVV6WtqDZMOdMlQbJp1itHUXOD+fi62tTyICcCBii0qMG/hXxCV9ysKcE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwmP85FxkSvYRo/pg0185M0svW2jtMBubjaAe/j6aBpMUWdSyI6
	AW7zEQx2zNpsrcRWdssLmH9tb4vlLx8kx4WyiXuOvNOyyRRwt0sp1bya+PWgX8ASnQ==
X-Gm-Gg: AR+sD12YgBQcBipO+bymViMPPRKPShVgQjs5XsATG6hHWd9LUrqurwqXTL/5etNvJsE
	qlsA2CNDLWIfqDynnYUrYzR1U5Nqxui98kaTTA0t60cATetqQEQ/2VC+wBdIg8g5w+1nyje0I2B
	7fFG7HbLnpVK6TlN7Jr91bBgZQ6YdKKeD+XahMC42LcJw4d+mXhv7gSqloDXJ8undLFJQGZo0U/
	xyTQEwLdCgXBBhJ94RLOnNwVvrb2CAhiZq/BYChbB12lHZqs6R4LuaJeJV2P92CUhDFDgC+quqr
	+/sgCyyCAk93SNmcevsXKAl73qg+/y41gSE++GyI38mQo2dBLMFN/nWIWhoCaf+lJWnoNaLKWUn
	TZrZYvvBI0tNCBBGQ/oToKURbYJxzvQUo6TWZiGnbR3USnDiqtx4CRTaNsFTXp25FkkpQwuseXm
	lFodXHt/kDw1MxeXIowhV42Hgj+W1NHNDtn9lCdX+vdyw/kbhLXoA=
X-Received: by 2002:a05:600c:8b4c:b0:493:f783:c46a with SMTP id 5b1f17b1804b1-496b5b474e2mr110090835e9.6.1785165553650;
        Mon, 27 Jul 2026 08:19:13 -0700 (PDT)
Message-ID: <e630574d-320c-47e7-af59-2a6855603939@suse.com>
Date: Mon, 27 Jul 2026 17:19:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 01/17] xen/riscv: manage IRQ_DISABLED flag in APLIC irq
 enable/disable callbacks
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1784560663.git.oleksii.kurochko@gmail.com>
 <a6d85647d0d726ffb25708829813510421ed5234.1784560663.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <a6d85647d0d726ffb25708829813510421ed5234.1784560663.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1785165554-772F54E9-FA4E8D3B/10/73395122804
X-purgate-type: spam
X-purgate-size: 800

On 20.07.2026 18:01, Oleksii Kurochko wrote:
> desc->status is only set once during setup_irq(), but interrupts can be
> enabled/disabled at runtime, so update it in the corresponding callbacks.
> 
> For the purposes of the FENCE instruction, CSR read accesses are
> classified as device input (I) and CSR write accesses as device output
> (O), while the barriers used by spin locks (fence rw,rw) only order
> normal memory accesses. An explicit wmb() (fence ow,ow) is therefore
> added in aplic_irq_{enable,disable}() to order the desc->status update
> with respect to the IMSIC CSR write.
> 
> Fixes: d4676a1398bc5 ("xen/riscv: implementation of aplic and imsic operations")
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


