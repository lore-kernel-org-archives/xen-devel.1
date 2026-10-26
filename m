Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA3C9606A31F
	for <xen-devel@archiver.kernel.org>; Mon, 26 Oct 2026 11:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=YUCzyx3I
Received: from list by lists.xenproject.org with outflank-mailman.1461160.1672121 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLJ8m-00078a-Ob; Mon, 26 Oct 2026 11:45:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1461160.1672121; Mon, 26 Oct 2026 11:45:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLJ8m-00078T-Ks; Mon, 26 Oct 2026 11:45:24 +0000
Received: by outflank-mailman (input) for mailman id 1461160;
 Mon, 26 Oct 2026 11:45:23 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xLJ8l-00078N-8d
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 11:45:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLJ8k-002yeP-LU
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 12:45:22 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6adf3d4a-e002-0a2a0a5209dd-0a2a45068d2a-16
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 12:45:22 +0100
Received: from [209.85.221.54] (helo=mail-wr1-f54.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6adf3d4f-195a-0a2a45060019-d155dd36e958-3
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 12:45:19 +0100
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-48bbb06e746so1461297f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 04:45:19 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e3ece5e4asm15746738f8f.59.2026.10.26.04.45.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Oct 2026 04:45:18 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:From:Cc:Content-Language:References:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793015119; x=1793619919; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :cc:content-language:references:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=32CklU4osfQOyiDdLtBdvFTw2mbtForZG4idG0fPPjk=;
        b=YUCzyx3IzsOxnx0/g15k8Ag1u7K/Qcp7Y/NjJn/WfCNlJWvMEXNkt0ATQVkeDHcILx
         boCduWoPOPKRaqvGMeAsVxNoAvfdwts3EH4uBPat/ZXfowT92Vx88xO4dMimgDEyRxGh
         Ic7camErTOq8V6qGJxHh+YTgn2uU8n9EU0f6yHIgqWpNXPg6OzAlMBwGJnKktD4aGrnL
         2SINDaS3sdNv5kN6jr2WKdwRVtJFx+BV/PYwlT0vCLKFAh22XeDej3bl9dgieBf4uofO
         LCzudjbM3beUDpUcFD7nHDeo8fXLJdWQULnsjS3R7b+lLARAFA96albsOsDeeIFxeuTl
         xYBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793015119; x=1793619919;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :cc:content-language:references:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=32CklU4osfQOyiDdLtBdvFTw2mbtForZG4idG0fPPjk=;
        b=JuGCxJIMtA501UvKMosnrgwpuBSMmank6LpTidQueClA/JI/zJmJ9tuA5A0ygZz2Rk
         4LVuadgCq1/G/uIHACopJ3D26HFJbfyqF+xw2dhsykMz1bBCCWf5/fXcRc/SmMRxKig4
         b1Z6ivCiOo44a0AsZBbb5DyGnENLRIzpo8gcl9jMAQ8msGXe6ggVLlZB04IbaUYAToCU
         P/tfu3CHNCeaqnhxkuNeJkm4MzJhWqDRexZLyl+h85N3GVA2yz28GZ77Bmucpm+M6pwu
         lf4nPOCk6257e4g44Ey3IG/vA/gkZpul9ANwQyyKhvGgvuJnh/yWuLKV4jieAo6VzT4B
         Sq6Q==
X-Forwarded-Encrypted: i=1; AKwUvBwwl/V1nIFD+Klyl8fh1Xy+RgYFO2bu0cJPmsgcrZOa5/eEgmfxZeAOQTpWrESCXX3Ux5xRFuOnK2E=@lists.xenproject.org
X-Gm-Message-State: AFq9FYKTEaaDAkzhAD6+fy/Be/Fb4v6NOaPjAlus3vhzYjx4hknUnso+
	W6LMZG0idswqxpzU7cvN/9qraT9jqvKQaHc6l2XM2tgr8OwSUFyxNy8tlArPUe9fpCFB2UUJn+D
	IyBb4xA==
X-Gm-Gg: AYBFou15tLS3AhORi58c4fR55rwHAt+78N7egkenNws7xaA+zth6RjeLnhOmis65Lfc
	GA79bZ8YpHBtBH+VrpiLOFZF2crg/K2/RWI2Aj8gMx74nq8QeUK23U63mwlz3FRtgsevs8SF0IN
	dKeHZ4Ka3oRB7awBzj/hOOKDEG/Zzta9CYG52lnvTzsVqd0mz9OWkePROyDKtTpLbL/wObZwMP4
	1ka45TgxbYlxZzavFcYPUnnqJ6hHISHx0pjcaHc9Xz4FU+J1MVCNPURTRTJDF1V4lWVXfGE0LL/
	UZusVAZQyDBgpmmnJB9+6xr1PESnyPZ+Al4p28tWg654fKJGK7OEoJEFvposiREIhE0hQ+eJpsQ
	l6mLYENxlnJhyd8V8SWAMrSTrhKZ0xL7T7/8W5hnudd/1wdpuVNDRMWHAuMQWn3rK2kIvUx1i6c
	w4AGD0F0TJCMNminRyP17BzkicuRI6qyw3DNOMiL83bnI4s5Bcf2KSBX9VBMq3v2+dMgy2j5Z39
	87qrqLeJl7jKb30YGVB3B+V29L7xAsugl9rUawJHoJlwnf73ROOaFl/ME23nfylhjVKPJr21LHW
	zxxyTzMUO7Byyc0+Tvt+sACYRioTvIrYUMjLuEpiCECt
X-Received: by 2002:a05:6000:4809:b0:48b:11df:c496 with SMTP id ffacd0b85a97d-48e3eb8ecb2mr12085181f8f.28.1793015119054;
        Mon, 26 Oct 2026 04:45:19 -0700 (PDT)
Message-ID: <c64bc3bb-962d-447e-af38-9c897e7675e3@suse.com>
Date: Mon, 26 Oct 2026 12:45:17 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/altp2m: pause the vCPU before taking the altp2m list
 lock
To: lluisbessasanz <lluisbessasanz@proton.me>
References: <20261020072806.465449-1-lluisbessasanz@proton.me>
Content-Language: en-US
Cc: evilbootloader@proton.me, xen-devel@lists.xenproject.org,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Tamas K Lengyel <tamas@tklengyel.com>
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
In-Reply-To: <20261020072806.465449-1-lluisbessasanz@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1793015119-FEC7777B-224265F8/10/78276251493
X-purgate-type: spam
X-purgate-size: 3536
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 20.10.2026 09:28, lluisbessasanz wrote:
> From: Lluís Bessa <evilbootloader@proton.me>
> 
> p2m_switch_vcpu_altp2m_by_id() takes the altp2m list lock and then
> updates the vCPU's EPTP. For a vCPU other than current,
> vmx_vcpu_update_eptp() -> vmx_vmcs_enter() pauses it and waits in
> vcpu_sleep_sync() until it is off its pCPU, with the lock still held.
> 
> A vCPU on its way off its pCPU may need the p2m lock: context_switch()
> updates its runstate area, which for an area registered by guest virtual
> address (VCPUOP_register_runstate_memory_area, as Linux does) is a copy
> to guest memory and needs a p2m lookup. A vCPU handling a log-dirty
> write fault holds the host p2m lock in p2m_change_type_one() and waits
> for the altp2m list lock in p2m_altp2m_propagate_change(). That closes
> a cycle:
> 
>   dom0 vCPU, vm_event_resume() -> p2m_altp2m_check():
>     holds the altp2m list lock, waits for vCPU X to be descheduled
>   vCPU X, context_switch() -> update_runstate_area():
>     waits for the host p2m lock
>   vCPU Y, hvm_hap_nested_page_fault() -> p2m_change_type_one():
>     holds the host p2m lock, waits for the altp2m list lock
> 
> A vm_event consumer switching views in its responses
> (VM_EVENT_FLAG_ALTERNATE_P2M) hits it with a Linux HVM guest while QEMU
> tracks dirty VRAM for a VNC client. The dom0 vCPUs involved spin in Xen
> and stop handling interrupts, and dom0 hangs.
> 
> Pause the vCPU before taking the lock, like
> p2m_switch_domain_altp2m_by_id() does with domain_pause_except_self().
> The pause in vmx_vmcs_enter() then finds the vCPU already descheduled.
> Only vm_event_resume() switches another vCPU's view, the other callers
> switch current and are unaffected.
> 
> Signed-off-by: Lluís Bessa <evilbootloader@proton.me>
> Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>

The code change itself looks good to me, but as to the tags: The latter
one wants to be Assisted-by: and move ahead of your S-o-b (tags want to
be chronologically ordered). And then there's the issue of sender and
(last) S-o-b not agreeing. Yes, the "real" names are pretty similar, yet
even if they were identical that still wouldn't mean it's one and the
same person. Is there a reason you can't use an S-o-b matching the email
address you send from?

You also would have wanted to Cc maintainers plus perhaps Tamas. Added
now, and hence retaining full patch contents below.

Jan

> --- a/xen/arch/x86/mm/altp2m.c
> +++ b/xen/arch/x86/mm/altp2m.c
> @@ -220,6 +220,17 @@ bool p2m_switch_vcpu_altp2m_by_id(struct vcpu *v, unsigned int idx)
>      if ( idx >= d->nr_altp2m )
>          return rc;
>  
> +    /*
> +     * Updating another vCPU's EPTP (vmx_vmcs_enter()) waits until that vCPU
> +     * is off its pCPU. Wait for it before taking the altp2m list lock: the
> +     * vCPU may need the p2m lock to get off its pCPU (to update its runstate
> +     * area in guest memory), while a vCPU handling a log-dirty fault holds the
> +     * p2m lock and waits for the altp2m list lock in
> +     * p2m_altp2m_propagate_change().
> +     */
> +    if ( v != current )
> +        vcpu_pause(v);
> +
>      altp2m_list_lock(d);
>  
>      if ( d->arch.altp2m_eptp[idx] != mfn_x(INVALID_MFN) )
> @@ -230,6 +241,10 @@ bool p2m_switch_vcpu_altp2m_by_id(struct vcpu *v, unsigned int idx)
>      }
>  
>      altp2m_list_unlock(d);
> +
> +    if ( v != current )
> +        vcpu_unpause(v);
> +
>      return rc;
>  }
>  


