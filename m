Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 965D7C79F9E
	for <xen-devel@archiver.kernel.org>; Mon,  7 Sep 2026 12:25:10 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1410828.1641649 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3YP9-0005Up-2t; Mon, 07 Sep 2026 12:24:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1410828.1641649; Mon, 07 Sep 2026 12:24:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3YP8-0005Ui-W5; Mon, 07 Sep 2026 12:24:54 +0000
Received: by outflank-mailman (input) for mailman id 1410828;
 Mon, 07 Sep 2026 12:24:54 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x3YP8-0005Uc-1i
 for xen-devel@lists.xenproject.org; Mon, 07 Sep 2026 12:24:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x3YP7-00FbWY-3f
 for xen-devel@lists.xenproject.org; Mon, 07 Sep 2026 14:24:53 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a9ead09-8faa-0a2a0a5109dd-0a2a4509b37a-40
 for <xen-devel@lists.xenproject.org>; Mon, 07 Sep 2026 14:24:52 +0200
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a9ead14-be1a-0a2a45090019-d155802ccd4f-3
 for <xen-devel@lists.xenproject.org>; Mon, 07 Sep 2026 14:24:52 +0200
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-498028b3d5eso33191175e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 07 Sep 2026 05:24:52 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4858d312ca0sm28162430f8f.4.2026.09.07.05.24.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Sep 2026 05:24:51 -0700 (PDT)
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
        d=suse.com; s=google; t=1788783892; x=1789388692; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bl/qQ2SfhfVrk4NuGod2kJzGCRtkuRD03XNrSIn0gi4=;
        b=BbQHTPXQT0Ba4pa30qPl2HmqMUS7GfIHMZdVEoLo4lbV6QTmcO3qZGysSHUHgAXKTs
         QGlRMo/47mZlmQz1iyhD4o0oupZdRUVCCrgEJlGacXSbV9fdntpF2sKRuZ6UlJjj+KZ4
         AuDnD8f6sNFl/MaKPtmE7UNKEL6qIoNJFNFoWME+DmqH0CeqsY/ji9qvojHzbA7JF4v1
         xtBTRMOTfoLOHxqSWHjks6As1ZsAhMd9jcjZ+krrdNRahpQDVICVGLtpOI22oABr2m3w
         Dh+j2JQSrA83V0JJFQlKAo4YmgEu1eIb0GnK14C9pH9wGgtdNrjppcuplIfFD/BqMcUq
         e0LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788783892; x=1789388692;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bl/qQ2SfhfVrk4NuGod2kJzGCRtkuRD03XNrSIn0gi4=;
        b=M+dEFbQLnpi5PmJks0gy272zHxztGzOEuBXNxRA71jaRNXQGJWPISeS2dBzDRo6zNh
         M54qF4SN8Fe9o5zkUIF1qUoGRujtMm9okAwOTRnNjhRyacLpBB1Pn6y35sJ222SlhrpZ
         lppvMy3OmE8GdY2QJ6OOhOfwxdZlaN1oa/ljtubtz5ZMUVdfFlWqVkgl5JUu5VtWTO1G
         vvWjEhnFdbfuaIhlkrQ1mRUXD/rowEB2H2fnBCp3bU10yRPcJoNuoYbBlux01918oH+W
         NAVqBP2Tpi1EinrQuHqjHPSTDA69cmJc/ax6O+U5EOvgNODm57RSv1d00hDiBrN6mjhK
         CqcQ==
X-Forwarded-Encrypted: i=1; AKwUvBxrazheefJ9uhfhIsOcKbUUm1BsrWUx2Tq9kPUnIUox/0QTVkZRLohHA5RqifXKCREXhYzC7Hu1M0c=@lists.xenproject.org
X-Gm-Message-State: AFuF++k/a4vRss+JX9AebEWSN5OXCqwKppP/bokGyYzMCeZ74htLeAe4
	85JrWvAstxknuUfyaErCo4xaf11UFSbiqFC1TgXcKhA6Xa3lbR4IPqTizMc2YRIcZA==
X-Gm-Gg: AYBFou2F+WfGXt2I7gGQpEPCASrFipfi03axMMBeqUC81bWR9NN+q6dOZKk7nnm5spm
	kZFCaYE5PJD2xcX4Q/80SBW7dAKadMd0+ieQLWIop7lJpoT1hTpC/6i9GbO4GZX4Hk6w4SB6A9R
	KaUar6rjfUn97lqVGL+zdgZjMImoGPR6dJPkaR0ZTdvp+VUFdnO2CxHRhFgeXx5kQr/bj7+z9io
	suj7gKlqhjAgLAnAjpkFV8Wosm67KV4zgo2QjTwF9IIbTyLtlT1bwZLlvTtxr9sdfxyaWKD0qqH
	epmkfyHrmoKWogZWSxfILiIr3bJT/ir3tRBZ/tYBuluqRpkKh23jOu353VeVZ8lXwGoqBV6qXHO
	KX2SlxXDl7WvA6pn2xpVxKY4Qd59aqFXjY2teHKlIOfx4osc8VLAkWDPDBWTRkKiwlN4/oVQUHW
	Q9uy+xSOpAJSQfQ8YNqcyH31Z2YXfXMEnNdvcPuHuaUwEhUCAzydSpL9YRRz6K3uGN6qltriLEq
	AKeupIIfT4tR6uMHsgTq4qypHY6kXVT3PluwlmOKK9+xWAn75LU
X-Received: by 2002:a05:600c:8708:b0:49c:fa21:1c7c with SMTP id 5b1f17b1804b1-49cfa211d48mr194996565e9.17.1788783892277;
        Mon, 07 Sep 2026 05:24:52 -0700 (PDT)
Message-ID: <c7c19c6e-e9d9-4941-868c-ad74815f1e6e@suse.com>
Date: Mon, 7 Sep 2026 14:24:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/svm: Intercept CR0 writes selectively
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Jason Andryuk <jason.andryuk@amd.com>, Teddy Astie <teddy.astie@vates.tech>,
 xen-devel@lists.xenproject.org
References: <20260904122330.306936-1-ross.lagerwall@citrix.com>
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
In-Reply-To: <20260904122330.306936-1-ross.lagerwall@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1788783892-FC212034-6DA51CC8/0/0
X-purgate-type: clean
X-purgate-size: 3202

On 04.09.2026 14:23, Ross Lagerwall wrote:
> Since 3356d685dbda ("x86/svm: Remove lazy FPU support"), Xen does not
> need to track when the TS or MP bits change so opt to intercept CR0
> writes selectively. Aside from potentially reducing a few VMEXITs, this
> fixes a nested virt bug where L1 intercepts CR0_SEL_WRITE and L0
> intercepts CR0_WRITE. The hardware prioritizes CR0_WRITE and so L1 never
> sees any CR0 writes.
> 
> Since CR0 may now change behind Xen's back, sync it on VMEXIT so that
> the emulator sees the correct value.
> 
> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with two remarks (which I may take the liberty of carrying out while
committing):

> --- a/xen/arch/x86/hvm/svm/vmcb.c
> +++ b/xen/arch/x86/hvm/svm/vmcb.c
> @@ -50,13 +50,13 @@ static int construct_vmcb(struct vcpu *v)
>      struct vmcb_struct *vmcb = svm->vmcb;
>  
>      vmcb->_general1_intercepts =
> -        GENERAL1_INTERCEPT_INTR        | GENERAL1_INTERCEPT_NMI         |
> -        GENERAL1_INTERCEPT_SMI         | GENERAL1_INTERCEPT_INIT        |
> -        GENERAL1_INTERCEPT_CPUID       | GENERAL1_INTERCEPT_INVD        |
> -        GENERAL1_INTERCEPT_HLT         | GENERAL1_INTERCEPT_INVLPG      |
> -        GENERAL1_INTERCEPT_INVLPGA     | GENERAL1_INTERCEPT_IOIO_PROT   |
> -        GENERAL1_INTERCEPT_MSR_PROT    | GENERAL1_INTERCEPT_SHUTDOWN_EVT|
> -        GENERAL1_INTERCEPT_TASK_SWITCH;
> +        GENERAL1_INTERCEPT_INTR          | GENERAL1_INTERCEPT_NMI           |
> +        GENERAL1_INTERCEPT_SMI           | GENERAL1_INTERCEPT_INIT          |
> +        GENERAL1_INTERCEPT_CR0_SEL_WRITE | GENERAL1_INTERCEPT_CPUID         |
> +        GENERAL1_INTERCEPT_INVD          | GENERAL1_INTERCEPT_HLT           |
> +        GENERAL1_INTERCEPT_INVLPG        | GENERAL1_INTERCEPT_INVLPGA       |
> +        GENERAL1_INTERCEPT_IOIO_PROT     | GENERAL1_INTERCEPT_MSR_PROT      |
> +        GENERAL1_INTERCEPT_TASK_SWITCH   | GENERAL1_INTERCEPT_SHUTDOWN_EVT;

I think it would be nice to avoid moving the |-s out, to keep ...

>      vmcb->_general2_intercepts =
>          GENERAL2_INTERCEPT_VMRUN       | GENERAL2_INTERCEPT_VMMCALL     |
>          GENERAL2_INTERCEPT_VMLOAD      | GENERAL2_INTERCEPT_VMSAVE      |

... aligning with the ones here.

> @@ -76,8 +76,12 @@ static int construct_vmcb(struct vcpu *v)
>      /* Intercept all debug-register writes. */
>      vmcb->_dr_intercepts = ~0u;
>  
> -    /* Intercept all control-register accesses except for CR2 and CR8. */
> -    vmcb->_cr_intercepts = ~(CR_INTERCEPT_CR2_READ |
> +    /*
> +     * Intercept all control-register accesses except for CR0 writes (use
> +     * selective write instead), and CR2 and CR8 reads/writes.
> +     */

Imo slightly more precise as "... (using selective write intercept instead) ..."

Jan

> +    vmcb->_cr_intercepts = ~(CR_INTERCEPT_CR0_WRITE |
> +                             CR_INTERCEPT_CR2_READ |
>                               CR_INTERCEPT_CR2_WRITE |
>                               CR_INTERCEPT_CR8_READ |
>                               CR_INTERCEPT_CR8_WRITE);


