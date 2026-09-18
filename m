Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 790B9C982D8
	for <xen-devel@archiver.kernel.org>; Fri, 18 Sep 2026 12:53:14 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1425283.1649331 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x7Y5S-0003EA-Rp; Fri, 18 Sep 2026 12:53:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1425283.1649331; Fri, 18 Sep 2026 12:53:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x7Y5S-0003E1-PB; Fri, 18 Sep 2026 12:53:06 +0000
Received: by outflank-mailman (input) for mailman id 1425283;
 Fri, 18 Sep 2026 12:53:05 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x7Y5R-0003Dt-A5
 for xen-devel@lists.xenproject.org; Fri, 18 Sep 2026 12:53:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x7Y5Q-004l4O-Mk
 for xen-devel@lists.xenproject.org; Fri, 18 Sep 2026 14:53:04 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aad341e-8faa-0a2a0a5109dd-0a2a450ab8d2-18
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 14:52:59 +0200
Received: from [74.125.225.141] (helo=mail-wm2-f13.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aad342b-f2d2-0a2a450a0019-4a7de18dd2db-3
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 14:52:59 +0200
Received: by mail-wm2-f13.google.com with SMTP id
 5b1f17b1804b1-49cd5462b69so4066565e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 05:52:59 -0700 (PDT)
Received: from [172.18.138.134] ([185.104.138.149])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4871ff3ae1fsm3689424f8f.8.2026.09.18.05.52.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Sep 2026 05:52:58 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1789735979; x=1790340779; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rLfgc6+yuqe7f6diCPn3aKlcAw9KvU3+mrO5QDX8jZM=;
        b=IYgc1/AjFjstvP16V3OArTW8LMmZHwIENVujGsH8N7HWuSnhAqEDmf5/3bdUYZlbSY
         E4Ot07pXE4J18iXoBXGQxIj0mwIkUIMwN92uwTJOXStMJbL1cIqc+HuOFa/kuN3zfLiJ
         73mkuitRfyu+33Nk4ZnkUo4PFaWdofxiXIBB1I7TTFqDDUnrV4sRZ2bdBi05pOdF7y2P
         42ATGt3bIGsXSA3JYwzbWhT9JNZUykbuRaZ7ZgX0+kaJwtYZhe9hKkTgtT/+aJyvPlFM
         537ukNf8aOqi2lsLncZBFc1Jz7qx9djJR7hZEo2fufatgkYAK4WTGrrx47uYdfv7mGJG
         quHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789735979; x=1790340779;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rLfgc6+yuqe7f6diCPn3aKlcAw9KvU3+mrO5QDX8jZM=;
        b=QpOXPDDjn86jrjqQiibKYz0ZOap64Dac2QtmzkWui75k26GnAf0i7aKf2921GRXn8H
         lR9FELxYte1qfY6sc5tnDpXwdhJduaB400i1kfOpDUQ+svVw9EBY9KRvDv61dJ3flgAI
         PRO34+Cn2aeAk4PKLgGRIm9b4tEyhBWD1Ni9UnpjrPig3XMkOO87Tskxkm8vbn6IZmtE
         P4b1ryRr0Ne7FNKzLjfTcqPLfSoLu/zHmlqbuRkil/qvziLDFi3gYLg3gJSdNV+PrNLE
         vaJFzq57DOiztIlVawNvcvq3ZpPfiznxxCQyDpIDaVB5N7H+AQbh6PCLhviXYw+FSXZm
         WeRQ==
X-Forwarded-Encrypted: i=1; AKwUvBxAyq6jfbmmpT9maV7oHd/YMPasdzM39QP5QBeq49Bo/0Xmb/mpRJ4teOW8+VpU0TpYIUc4e/4wwQc=@lists.xenproject.org
X-Gm-Message-State: AFuF++l/XHy84tBQBXhLeP44Qav0Tn0WIxI1pHTrqcqmiJ0r6uuM0q12
	+l0uxPEZr5+i+47vbQqZURn43oU6LU19u+YMx84Hi+HLh25jal9blX+dDJ5wO0zfpw==
X-Gm-Gg: AYBFou3mgbAW/I6qNbVDRcYe1TIDNnrxs/nwD9evOeiyGaU4Cu7h0aqS1UtKyF137AM
	zrM6LIHKGMFZhp6z5WqeaiglITUs9t3qfgvQC1N+7oY06OIq0nhvynNDJtjhtmt4GIVUVIWk1j+
	Cj95akgZVb/yvb1cq4URqZVD4EAeogrcWSsfH2lwlWqOkJiws4lf57o3OU2VsUisqE/Zt1mp8r3
	oD+1Y6nizXouFzoVz+w3ikT8YtK1OgNgjUr/skYWwLFsMTHDALr66YqZ45Q/+LzPt1XOIPogNMy
	/DSMkd2j2Qa4B038MApYskxFSby8mUMoL4XNvfsKdrvAftmugn6kCzjUsbkqJoaqC2jvvinn1sf
	GpeKvAEniLUECxV0cYcNA7N8sZVlK2AQh5W2tepEWYUVd146LXiY4o0ksRXgML2CSLhC4xCxy/x
	93FXj3224ES2/ojkYVjukYKabtB9diQQwMYN9Ixi3d+ZzBsnXHtmyJBXCi1e1+DioPYDcVViivO
	WNpQim5FlQ=
X-Received: by 2002:a05:600c:1f95:b0:49f:bcb7:8e9 with SMTP id 5b1f17b1804b1-49fc5726c1fmr60163275e9.9.1789735979021;
        Fri, 18 Sep 2026 05:52:59 -0700 (PDT)
Message-ID: <9260a8cb-66f0-4eba-b630-666039bf2e72@suse.com>
Date: Fri, 18 Sep 2026 14:52:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 36/39] xen/riscv: wake up a descheduled vCPU on a guest
 external interrupt
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Zheng Zhang <zhangzheng@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
 <ed5a8b4d8137d9ce2f291956d19fbeaf61cce7a9.1787838835.git.oleksii.kurochko@gmail.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ed5a8b4d8137d9ce2f291956d19fbeaf61cce7a9.1787838835.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1789735979-58BC8CFC-44CBF150/0/0
X-purgate-type: clean
X-purgate-size: 4385

On 27.08.2026 17:21, Oleksii Kurochko wrote:
> @@ -62,23 +69,25 @@ static int cf_check cpu_callback(struct notifier_block *nfb,
>                                   unsigned long action, void *hcpu)
>  {
>      unsigned int cpu = (unsigned long)hcpu;
> -    int rc = 0;
>  
>      switch ( action )
>      {
>      case CPU_STARTING:
> -        rc = vgein_init();
> +    {
> +        int rc = vgein_init();
> +
>          if ( rc )
>              printk(XENLOG_ERR "AIA: failed to init vgein for CPU%u: %d\n",
>                     cpu, rc);
>          break;
> +    }
>  
>      case CPU_DYING:
>          vgein_deinit();
>          break;
>      }
>  
> -    return notifier_from_errno(rc);
> +    return NOTIFY_DONE;
>  }

What is this hunk doing in this patch? Was this meant to be merged into the
prior one? But then - why?

> @@ -168,3 +181,36 @@ void vgein_release(struct vcpu *v, unsigned int vgein_id, unsigned int cpu)
>              __func__, v, vgein_id, cpu, vgein->bmp);
>  #endif
>  }
> +
> +void hgei_interrupt(void)
> +{
> +    unsigned long hgei_mask, flags;
> +    struct vgein_ctrl *vgein = &this_cpu(vgein);
> +
> +    hgei_mask = csr_read(CSR_HGEIP) & csr_read(CSR_HGEIE);

Misra, aiui, isn't going to like this. You may want to split it up.

> +    csr_clear(CSR_HGEIE, hgei_mask);
> +
> +    spin_lock_irqsave(&vgein->lock, flags);
> +
> +    for_each_set_bit ( guest_file_id, hgei_mask )
> +    {
> +        /*
> +         * guest_file_id shouldn't be zero, as it will indicate that no
> +         * guest external interrupt source is selected for VS-level external
> +         * interrupts.
> +         */
> +        ASSERT(guest_file_id);

While it only affects debug builds, this check still needlessly is
done on every loop iteration, when doing it once ahead of the loop
would suffice.

> +        if ( vgein->owners[guest_file_id] )
> +        {
> +#ifdef VGEIN_DEBUG
> +            gprintk(XENLOG_DEBUG, "%s: kick ->%pv, hgei_mask(%#lx)\n",
> +                    __func__, vgein->owners[guest_file_id], hgei_mask);
> +#endif

This can ocur very frequently (when VGEIN_DEBUG is defined). A
trace record may be a better alternative.

> --- a/xen/arch/riscv/domain.c
> +++ b/xen/arch/riscv/domain.c
> @@ -136,6 +136,8 @@ static void vcpu_csr_init(struct vcpu *v)
>          v->arch.hstateen0 = (hstateen0 & csr_masks.hstateen0) |
>                              csr_masks.ro_one.hstateen0;
>      }
> +
> +    v->arch.hie = MIP_SGEIP;

Neither part of the rhs identifier has anything to do with the CSR
having its default value set here. That's perhaps again a piece of
RISC-V I'm missing, but I can't make sense of this.

> --- a/xen/arch/riscv/imsic.c
> +++ b/xen/arch/riscv/imsic.c
> @@ -510,12 +510,31 @@ void cf_check imsic_ctxt_switch_from(struct vcpu *v)
>  
>      write_lock_irqsave(&imsic_state->vsfile_lock, flags);
>      imsic_state->vsfile_cpu = v->processor;
> +    /*
> +     * Start to observe the VS-file from HS-mode: while the vCPU isn't
> +     * running an interrupt pending in its VS-file is reported through HGEIP
> +     * instead of being delivered to VS-mode, which lets Xen wake the vCPU up.
> +     */
> +    csr_set(CSR_HGEIE, BIT(imsic_state->guest_file_id, UL));
>      write_unlock_irqrestore(&imsic_state->vsfile_lock, flags);
>  }

It is suspicious for the HGEIE write to be the last step. How's this free
of a window where an interrupt is lost. (Sorry, likely another blind spot
of mine wrt RISC-V.)

>  void cf_check imsic_ctxt_switch_to(struct vcpu *v)
>  {
> -    /* Nothing to do */
> +    struct vimsic_state *imsic_state = v->arch.vimsic_state;
> +    unsigned long flags;
> +
> +    /* A s/w VS-file is never observed through HGEIP. */
> +    if ( !vcpu_guest_file_id(v) )
> +        return;
> +
> +    /*
> +     * The vCPU is about to run, so hstatus.VGEIN delivers the VS-file's
> +     * interrupts to it directly and there is nothing left for Xen to observe.
> +     */
> +    read_lock_irqsave(&imsic_state->vsfile_lock, flags);
> +    csr_clear(CSR_HGEIE, BIT(imsic_state->guest_file_id, UL));
> +    read_unlock_irqrestore(&imsic_state->vsfile_lock, flags);
>  }

How can this be a read-lock when you write a CSR? Or else - why is locking
here necessary in the firt place?

Jan

