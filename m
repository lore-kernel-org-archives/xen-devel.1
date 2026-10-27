Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20AA1606A321
	for <xen-devel@archiver.kernel.org>; Tue, 27 Oct 2026 08:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=VtnERbqT
Received: from list by lists.xenproject.org with outflank-mailman.1461908.1672913 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLc6R-0001hc-SV; Tue, 27 Oct 2026 08:00:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1461908.1672913; Tue, 27 Oct 2026 08:00:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLc6R-0001hU-PM; Tue, 27 Oct 2026 08:00:15 +0000
Received: by outflank-mailman (input) for mailman id 1461908;
 Tue, 27 Oct 2026 08:00:14 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xLc6Q-0001hN-6m
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 08:00:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLc6P-00GLX6-8n
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 09:00:13 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae05a09-bab6-0a2a0a5309dd-0a2a4506be84-34
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 09:00:13 +0100
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae05a0b-195a-0a2a45060019-d1558036bc39-3
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 09:00:12 +0100
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4a5087a5348so19795415e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 01:00:12 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a35a58a0e2sm309555845e9.13.2026.10.27.01.00.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Oct 2026 01:00:10 -0700 (PDT)
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
        d=suse.com; s=google; t=1793088011; x=1793692811; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7mqbVy1lo+ZEPVHpu4o7s6EKWxL+/qNkX9Qsfvi5qIM=;
        b=VtnERbqTQFJBV5Ya1AND1+O4x1ha+Hq/fbhBKTDswhdxywEwo2RO823bxz3Wga2s8x
         MQzqXmHhAcMSFcnjfciioG9CgseX4VddKz8dryG6Z7rMlgtbb4MhAOIYfpIl2mFgJtFF
         MDo97btxFAwXZ3QtRJafm87WJ4uLYzdpSvll22h1eTjcI7qvfL+0LDwPJU5IOjDMdblT
         7l7DFdFhJdRQuPohr28vdbpJ+RTA3MUfw0LN20iYmQvIXdG+NP5dwa40K8ikU9txl/UZ
         s+1mtsn5aN2UosyHPozkKJrS4OTD4hQyE3PML5x0InVaBOrq3UEAIjMb1u/A9wgncA6c
         B9Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793088011; x=1793692811;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7mqbVy1lo+ZEPVHpu4o7s6EKWxL+/qNkX9Qsfvi5qIM=;
        b=2M3oJclVM53fGEnCX+2ICAv/9z/U6CeSoJNLyCTqNw7Knvgxw7+96jhxOt3PdwwwJW
         P35S45UdyFaumlhJM4M5M2G3e+tTPwdfZNGRTK7pqx1B1yK02JcA5dWFitWFLirL2IkW
         /BhQA4oyu3/Vzv4XyKtHnO5a0mrmu8WJUPy5hMrnKNttL5+tUW/QFVu/FmUXeC2i118/
         LQUV92Xe7tNDLlgX1nhJ67uvmGGVFPOqxi9RKK2CWn5rFQN1NvoBORY691707eidmObw
         GEKuVT5SfuYNxN6jIO6Czo0KeLvIhI7KjV+q8+QN48eQA7YbwnLQ/BCV53LtdB0NWhKE
         sQfA==
X-Forwarded-Encrypted: i=1; AKwUvBz5yoPsIvXnAQD9kCw7YhQhcWBCrBlxVmxUacHQ18LzOXPrugHnNicBMSH8mf3+C4hRpBd4xaPMf0c=@lists.xenproject.org
X-Gm-Message-State: AFq9FYJFRsJubUYbLpoh0iJoMBOb7w2KK56aHuKTlK97FpHRkDtHkGPX
	7AsOkDKztl2ztFvU7Xf9ihgK4myDOP7efIlK9bkCh9x3VN27JMnzUJra98CS9Jy0nQ==
X-Gm-Gg: AYBFou3H9Nwz3Yt87SR/OgPsj8Ud7XUGFhUnddqHnjnSjuXzD2H3Pp7BJefCeqKzMZ2
	DJxUma01o6Q/DEu6dnCTpR9nac5OMWI7Gdm5sswlOoQfvOWtSCvWQGf47id26u4XtIpJCPh7vbz
	7ew4fxhyEZr6G/WLfnyIOm9DBxzyL7amFWjAJhq5mEx115Jf3QMfe2SI6DsUuu35wdkE8GpnAMZ
	OoTaU1eOeLfZB/bk2dW+PhoroEepZLrUzvTk+AypcznnNsqByzKCG7PEHOmfuaoeB3aetfZt6bL
	p+XtHfNHu1IHlwz9LGAEKQEfY5eZD9kS3slbhWSI4snEi9wnqbH0O5IX1dJDIiamjw9eHPdmfx4
	mcvfvpIQ1lej6YgfIPt6wXpgZz79muoVIHZOjefaKTwy7K8ekMowGqCDqIcfIT2cn+XatNoWMgT
	j+n1Crx/EqXZdR4FVVtQxyHzf+HKDJgQ1Dkw6Mh2RvIMVpRgveyxpXlRLM9cDg/X4nRM2hjOcMQ
	WUJ9n+64fTTBrZBIbAszFwdTn6T0eF2PoG5qWf46NeFfzLwGPmoDVvW7e9daJLFu/TTQSZm190C
	G+5Bmv8nCBC0h+t+y+7xFj3Mwc8ExCMENEcChEX3bwM=
X-Received: by 2002:a05:600c:4583:b0:4a2:1197:1de0 with SMTP id 5b1f17b1804b1-4a35ac963edmr187957485e9.19.1793088011015;
        Tue, 27 Oct 2026 01:00:11 -0700 (PDT)
Message-ID: <876cbf88-4212-465e-86eb-fb26bd9cb591@suse.com>
Date: Tue, 27 Oct 2026 09:00:08 +0100
X-Archived-By: <archiver.kernel.org>
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
X-purgate-ID: tlsNG-16d1c6/1793088012-F76C877B-B0DE7D8C/10/78276251493
X-purgate-type: spam
X-purgate-size: 2138
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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

I was meaning to apply this, but ...

> --- a/xen/arch/x86/hvm/svm/nestedsvm.c
> +++ b/xen/arch/x86/hvm/svm/nestedsvm.c
> @@ -1027,12 +1027,19 @@ nsvm_vmcb_prepare4vmexit(struct vcpu *v, struct cpu_user_regs *regs)
>      /*
>       * Virtual Interrupts.  #VMEXIT writes back V_TPR and V_IRQ (APM vol.2
>       * 15.6); the remaining fields do not change.  Copy vGIF back only if
> -     * enabled in L1.
> +     * enabled in L1.  With vNMI enabled, the processor manages V_NMI and
> +     * V_NMI_MASK itself and writes both back on #VMEXIT (APM vol.2 rev 3.44,
> +     * "NMI Virtualization").
>       */
>      ns_vmcb->_vintr.fields.tpr = n2vmcb->_vintr.fields.tpr;
>      ns_vmcb->_vintr.fields.irq = n2vmcb->_vintr.fields.irq;
>      if ( ns_vmcb->_vintr.fields.vgif_enable )
>          ns_vmcb->_vintr.fields.vgif = n2vmcb->_vintr.fields.vgif;
> +    if ( ns_vmcb->_vintr.fields.vnmi_enable )
> +    {
> +        ns_vmcb->_vintr.fields.vnmi_pending = n2vmcb->_vintr.fields.vnmi_pending;
> +        ns_vmcb->_vintr.fields.vnmi_blocking = n2vmcb->_vintr.fields.vnmi_blocking;
> +    }
>  
>      /* Interrupt state */
>      ns_vmcb->int_stat = n2vmcb->int_stat;

... except for the bottom patch context, the code being altered doesn't
exist in staging at all. It also didn't change recently, so I wonder
what code base you took this from.

Jan

