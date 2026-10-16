Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D16D6CC6B38
	for <xen-devel@archiver.kernel.org>; Fri, 16 Oct 2026 08:00:19 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1451339.1666416 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHcqz-00084V-GA; Fri, 16 Oct 2026 07:59:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1451339.1666416; Fri, 16 Oct 2026 07:59:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHcqz-00084N-Av; Fri, 16 Oct 2026 07:59:49 +0000
Received: by outflank-mailman (input) for mailman id 1451339;
 Fri, 16 Oct 2026 07:59:48 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xHcqy-00084H-Is
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2026 07:59:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xHcqx-00HXJH-Vl
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2026 09:59:47 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ad1d96d-e002-0a2a0a5209dd-0a2a4504dba4-38
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 09:59:47 +0200
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ad1d973-b57f-0a2a45040019-d1558031cdac-3
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 09:59:47 +0200
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4a022fee0caso57475155e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 00:59:47 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1bd91c55bsm117316475e9.0.2026.10.16.00.59.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Oct 2026 00:59:45 -0700 (PDT)
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
        d=suse.com; s=google; t=1792137587; x=1792742387; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o8NVuArUAmv/9SGRoMnrbfhwmjuGlvAAFC/hUp2XQk4=;
        b=ZI/l8vlH9z3O+Ll5HQhOZeb+rhkPq9GsA/OwAriNClBo+TK9/umGd85wza7aj34xjh
         RP4BPvefJiIIBu04MMNg5s4BmOWodWX6NhWFi6pgzQ4VQxSn746C0oBQbVpHP9QHY/SW
         0UdDQE0ZW1h7U4OQGYPr/BZA3+hL1y7Czr9XK0danO8FjKBGZ1Y8mfFyYX1WMLYZ054B
         3+sDlnMylesgGL5gV8oZf9gh43gVnsVc5I2fdonF6i05VKhc6NerGGQ9NpCF7IjZBJIf
         pTtSQ48gJB4gzHf4S2w49oPpPXKklSwuLAfQTpZI2vU+VL0SeKhrDB6nq2lNaBdVOwrd
         FrGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792137587; x=1792742387;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o8NVuArUAmv/9SGRoMnrbfhwmjuGlvAAFC/hUp2XQk4=;
        b=a5h+S47KahzHOKCrb8ajwkr4Haiuu2TMKcaf1lCYQXeJWU5e+UXrqAcDpAGZbMWmFK
         7lQl5LQWNkCHuLsiST19DVUNwaRuaEYCaO/z8ufZ1cDbX5PUl7n0bqHNGornwub/p0Uf
         hn3kVzi0CZwdUq0dQ75Qv3Qe2trlZROhp13NpEPRAF/yS3x1Z4eU4lCDhevzvXl9UVdC
         XBgNTv9oLUM0lOKCYk/o0xWfZKD4XKRs58Nz75LO0e91l320Zd9a7GTvdE821WabpzrT
         3S0iLCc28UwjEhBCf1p4+i1lxADEh0h0BIPz5fQUaAfPmB+FlYLQ5p9BocFGMfBdn3ya
         V4ZQ==
X-Forwarded-Encrypted: i=1; AKwUvByYj0AHujgEqevJHSYv5esmhu9wlthmWOqNYjGchKhaPmkuNon8Po95kPLmu+9CJewTmf9uhEiBazc=@lists.xenproject.org
X-Gm-Message-State: AFq9FYLLOak/0DWG3O+RQCw0BqXa1YU3QbSXwkTxzLeXKiSQaIzExGMg
	eFu21gM9SL65Rx/4lCcHoozW7JFB7kPpMcB4cyb8pe2oRY4LXv5Aj57YEzXpT9BRaw==
X-Gm-Gg: AYBFou2VWhQn2Yk88VX/BzD4HhoJ82xn8m0cK6nLCoGZnbyo1xFqZKi9YxoMKX4vvER
	it4HwMtEqDZTD+JvzRDo0ujzbs1aXz5YHRJhQWHUlRI1fF2o9ewkFL8d8d9MDU2J0dN00SRc1iY
	ALp9lmjWn+lVHnVzE/LsKob8q+UP2f2PmS5mr6YZMGKYDbO7Dgwtttzy/A1dqIvb4s8ocCt+IhA
	27jYyvEy8oZIJsaLkbSJ4noBrSfuJ+O2JLlggiC75awBSjTLosWoWT6m8IKfLktd+Sis668hBYj
	lLf1CBDiYDAS/pP2UUNsjoiBmBxhGLz/3OqF7WYXkgcIgTFeTYhrVmKdJhne0qXc75vP9maBDll
	KLiGIEb+0vmn2sVDdCBkdlQUEhyH9Dm+WyqAxmCfD/LI5BuJKPOl2KJe+vJNuSq7ZNlbG6dpz/S
	AvJHYdacnfCObOO6N4cBuGFmsNAFzghq3qVVEQwgaG9WtvxKntJRg1GHWAATl5AIY65intEn6fj
	dXVQodP2NkGPQqc5y7rQz7NQuvPbdlqbug948lxviNdth8VSFNMy1EvUhSvFA==
X-Received: by 2002:a05:600c:350b:b0:4a1:ad01:f8dc with SMTP id 5b1f17b1804b1-4a1ad01f924mr224521365e9.21.1792137586948;
        Fri, 16 Oct 2026 00:59:46 -0700 (PDT)
Message-ID: <d2b8778a-7f16-4938-83c2-429f4ce96501@suse.com>
Date: Fri, 16 Oct 2026 09:59:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/nestedsvm: write back V_NMI and V_NMI_MASK on
 nested #VMEXIT
To: chunjie.zhu@citrix.com
Cc: jason.andryuk@amd.com, roger@xenproject.org, teddy.astie@vates.tech,
 andrew.cooper3@citrix.com, xen-devel@lists.xenproject.org
References: <bdc00337-6197-40e8-8515-6e4c0024c0a1@citrix.com>
 <20261016070611.255322-1-chunjie.zhu@citrix.com>
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
In-Reply-To: <20261016070611.255322-1-chunjie.zhu@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1792137587-528C9B50-AF6B05C6/10/78276251493
X-purgate-type: spam
X-purgate-size: 958

On 16.10.2026 09:06, chunjie.zhu@citrix.com wrote:
> From: Chunjie Zhu <chunjie.zhu@citrix.com>
> 
> When V_NMI_ENABLE is set, the processor manages V_NMI and V_NMI_MASK
> automatically (including on IRET), and writes both back to the VMCB on
> VMEXIT (APM vol.2 rev 3.44, "NMI Virtualization").
> 
> nsvm_vmcb_prepare4vmexit() only propagated V_TPR, V_IRQ and (conditionally)
> V_GIF from the L2 shadow VMCB into vmcb12. V_NMI and V_NMI_MASK were never
> copied back, so L1 kept seeing whatever it had last written, regardless of
> what happened in L2.
> 
> Copy both back when L1 has enabled vNMI for its guest.
> 
> Fixes: 86a203ab8d38 ("x86/svm: Support vNMI on capable hardware")
> Signed-off-by: Chunjie Zhu <chunjie.zhu@citrix.com>
> ---
> v2:
>  * Reword commit message: the processor manages V_NMI/V_NMI_MASK itself.
>  * Add Fixes: tag.
>  * Cite APM by revision and section title.

Is there a reason my A-b was lost?

Jan

