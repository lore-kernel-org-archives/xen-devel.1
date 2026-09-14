Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50CA8C88E50
	for <xen-devel@archiver.kernel.org>; Mon, 14 Sep 2026 13:27:39 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1420972.1647167 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x66iS-0006Yr-31; Mon, 14 Sep 2026 13:27:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1420972.1647167; Mon, 14 Sep 2026 13:27:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x66iS-0006Yk-0D; Mon, 14 Sep 2026 13:27:24 +0000
Received: by outflank-mailman (input) for mailman id 1420972;
 Mon, 14 Sep 2026 13:27:22 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x66iQ-0006Ye-JK
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2026 13:27:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x66iP-003sIY-WA
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2026 15:27:22 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa7f629-e002-0a2a0a5209dd-0a2a4506c4ec-36
 for <xen-devel@lists.xenproject.org>; Mon, 14 Sep 2026 15:27:21 +0200
Received: from [74.125.225.76] (helo=mail-wr2-f12.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa7f639-195a-0a2a45060019-4a7de14cde82-3
 for <xen-devel@lists.xenproject.org>; Mon, 14 Sep 2026 15:27:21 +0200
Received: by mail-wr2-f12.google.com with SMTP id
 ffacd0b85a97d-484366874b0so1122809f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 14 Sep 2026 06:27:21 -0700 (PDT)
Received: from [172.18.123.208] ([185.104.138.131])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49e7d202a2bsm1961545e9.0.2026.09.14.06.27.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Sep 2026 06:27:20 -0700 (PDT)
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
        d=suse.com; s=google; t=1789392441; x=1789997241; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ir3e7UrikW5diNP5IWdtsqID8I/hj9kpLtBWACPpVPY=;
        b=J3BIUCaXULMheC6w1ZEk/3lrkoJLAhIczzN6XWS28J85bdWaMknCEd9lYUiK042Htd
         moGxzDpxdjXQlYt5N1mN+coretUCPglYeX9UCmY8jkbJrmTDDDGDmxNfmLPqe50lFJCY
         D+Y4+sXgktC/wIyesDnmBGS2+u8PynZ0Rx8lSN+UW/dx5MpAP0Mik2GfR4AzfvoKm8Gy
         5TZcMtFDq55lKmbhUwOK6v0JpGe6FaeaxtGiqQidAmGbdPn2CRwBXNgjpiVYa4OiKpKW
         KvfqXQHdnqOht6NGXGbDnxDBBKzg9xesSNfPxAoWtBQVBIqQSgYL3fYQ44N4tCUNy4L2
         X2ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789392441; x=1789997241;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ir3e7UrikW5diNP5IWdtsqID8I/hj9kpLtBWACPpVPY=;
        b=tYh6hPCZ+di9cQMI7DbMnahCk3TGhu9PwVln9c73IuTH/rqFjoTUEezWtp7olDsO2F
         OXRv/9h2hl7xljMynt1zeU+wrYK0A2eD3jXp8BMUl5OycUdByg0ctKFq/bD2gt/HB22k
         Hfy8EzszjpFkkc3/uUQPspMVKAdckJ6NGe0ROzBaXan4rQ/172iWkKE5uNE+0+HQAt35
         SPIedVbSZx9xK5cd8L5FVUqyXULi/F9uHMLN2ntHQfyZF9IkfRed8cZtxTl2rv/4dtXv
         IMxehUd917UNblKCyZ7L/P1NedT9olboPXPtTwLry1BBvR9316iuJKnlLrFlpyzJqmxY
         KCxA==
X-Forwarded-Encrypted: i=1; AKwUvByWuvGEmj7ok4SLEzZmfYefd9+mREmDtVpxPoCDIUWanmIlonozom2Hm+J7dJgBmAQ4oYrW0GRsyT0=@lists.xenproject.org
X-Gm-Message-State: AFuF++katkoVCJtz9qUQuLozlVqvgvPoo2bqSOwbw/fqqnA+x8hpPbcN
	ct9H7dsE+qX2radrP9MnUlfurke7MKzrdWDetuh+q0G4TlExF9a0CUVAUCR/ktAcew==
X-Gm-Gg: AYBFou3gNLXZ8vdG/Rn0PnjUGJWPq+WDCPH9xIuHhPjFuvWszKGZ5477i5Eva1QKkWR
	qZ5QxVS5OTpIvld2eZNEoDNT+cnoOkDCpalmlzRNBPmePjgBNAVN6sbKo2DNpv+2coV0Lw505Hz
	IKE7x5m0l2BOLH95zhnJwWrVgH/Txm+ZrAGIGaxxE4U/BcD735VQHHaxtq4S3GPdhpo6n5WwkFi
	vSB+YeIojTyBhuMiNbMGmRrGPYGDxw7COMvA7vloLYmVl4kCu12MsBA4rQUgrk7yBDmwS4Px1sa
	E8aNYTB84O2MGPycohvMrwhQOesNSyqNaiL2Wdf8xHZJWncZYjXAjqjx0DN0LYMRNnJ9SbOxlOd
	Fk7kKsgwGcYtxwm0194ACu0tiHY5dIrdoTXu7wGkqXGaFKxvT8kd2eyEBaZDLBI0qWZDUMgcgsV
	VbxpVXyxYRrvGV3O/rT4INu1LQ3iomQsDySF2VVf44y56+ncsVzzgnWcM+zjyDC/gaWFwKIfKD1
	rJ+jWFiy9Sf
X-Received: by 2002:a05:600c:8716:b0:49e:6692:27fd with SMTP id 5b1f17b1804b1-49e7a657f9dmr65862005e9.2.1789392441267;
        Mon, 14 Sep 2026 06:27:21 -0700 (PDT)
Message-ID: <45f6e417-ea0e-470c-bfae-e163a65b48d0@suse.com>
Date: Mon, 14 Sep 2026 15:27:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 31/39] xen/riscv: implement APLIC-hart sync barrier for
 vCPU migration
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
 <3d953b6e7f221f4cf4143454076466fab38b6236.1787838835.git.oleksii.kurochko@gmail.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <3d953b6e7f221f4cf4143454076466fab38b6236.1787838835.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1789392441-F74C977B-09ED7B40/0/0
X-purgate-type: clean
X-purgate-size: 1492

On 27.08.2026 17:21, Oleksii Kurochko wrote:
> During migration of a virtual hart to a different guest interrupt file,
> straggler MSIs from the APLIC could arrive at the old interrupt file
> after the switch.
> 
> genmsi is used despite not supporting guest interrupt files because the
> AIA spec guarantees that all MSIs previously sent from the APLIC to the
> same hart are visible at the hart's IMSIC before the extempore MSI from
> genmsi becomes visible.

Hmm. As indicated, I'm learning RISC-V as I'm reviewing patches. This
paragraph, if left as is, would make sure I simply can't ack the patch.
I just don't understand what is being talked about. I can guess parts,
but for example I don't know what "genmsi" is.

> @@ -205,6 +207,30 @@ void aplic_hw_write_reg(unsigned int offset, uint32_t value)
>      spin_unlock_irqrestore(&aplic.lock, flags);
>  }
>  
> +/*
> + * As needed, synchronize with all IOMMUs and APLICs to ensure that no
> + * straggler MSIs will arrive at the old interrupt file after this step.
> + */
> +void aplic_genmsi_barrier(void)
> +{
> +    const struct imsic_config *imsic = imsic_get_config();
> +    unsigned int cpu = smp_processor_id();
> +    unsigned long flags;
> +    uint32_t val;
> +
> +    val = MASK_INSR(aplic_hart_field(cpu), APLIC_TARGET_HART_IDX) |
> +          (imsic->sync_id & APLIC_TARGET_EIID);

Along the lines of a question on an earlier patch: What if this ANDing
actually chops off bits?

Jan

