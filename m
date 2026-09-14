Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BC6DC88E72
	for <xen-devel@archiver.kernel.org>; Mon, 14 Sep 2026 15:22:04 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1421101.1647230 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x68V6-0003ml-AO; Mon, 14 Sep 2026 15:21:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1421101.1647230; Mon, 14 Sep 2026 15:21:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x68V6-0003me-7b; Mon, 14 Sep 2026 15:21:44 +0000
Received: by outflank-mailman (input) for mailman id 1421101;
 Mon, 14 Sep 2026 15:21:42 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x68V4-0003mV-Io
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2026 15:21:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x68V3-004Cpx-VX
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2026 17:21:41 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa81102-bab6-0a2a0a5309dd-0a2a45068a3c-8
 for <xen-devel@lists.xenproject.org>; Mon, 14 Sep 2026 17:21:41 +0200
Received: from [74.125.228.76] (helo=mail-ed2-f12.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa81105-195a-0a2a45060019-4a7de44c9d02-3
 for <xen-devel@lists.xenproject.org>; Mon, 14 Sep 2026 17:21:41 +0200
Received: by mail-ed2-f12.google.com with SMTP id
 4fb4d7f45d1cf-6a98604f6b4so3021600a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 14 Sep 2026 08:21:41 -0700 (PDT)
Received: from [172.18.123.208] ([185.104.138.149])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c29ad3e033asm166766666b.47.2026.09.14.08.21.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Sep 2026 08:21:40 -0700 (PDT)
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
        d=suse.com; s=google; t=1789399301; x=1790004101; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BOTx3sWZgl50ibr0pIUML6XT/6YYqGuo6aTW43iDchk=;
        b=SNhSkVSSjjoq0/icnlWqzNTX3oyLDTH2VME8xisjdGJB9BdKdDIK/3mxLI27txoRMp
         jS3q9UKxRO3oxkH/pCwDETQsVCy3oxAMlbtDg/BUTp2AuHvmw7iVlQGsRfWPsE++351S
         W9sno4hq4hTxN2aRdfRadEbyCRz306dkjYywRJFkl81m3pX7/HRccXnBVgcF0Z/Vj+eL
         zwfYfXKFdbcygqRXBQPIDjxbcfc+S8V63uBdmWocrR620tPaoVXoimlWO1p4pUkAq8dQ
         LSw/9HeiEz/YMSvS8HGjLQ92de2He2auz3iokS1T/JpQWx3GpzKIGnE4LiHA69OoFX4e
         bT/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789399301; x=1790004101;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BOTx3sWZgl50ibr0pIUML6XT/6YYqGuo6aTW43iDchk=;
        b=oqQHjCky/KPgACwAhKSfwh8P8OPTVMETzf8iEPQoWF/bf3mOVugZjBUDZJogWFhSuG
         O/SQI40dTwbE2Zw3Gkks0ABYhGOW+Ci79zpYCom6FCyHDU849CCQzDb8znAa7GTzrZ1m
         ExiUwY9dWwbk3nXOFLZuRM4cNAQe1gtUTL7qeQjFYQnV/ZbwKlYO19FMdEH/TPdQY5Cv
         dLxujwVAgfbq7QRr/lCvGjQfDW4TMZBnVfn7+UQJL/y3gmipSW4oMKNqRViuvGB3NTXK
         KQ6rQJ/nQq3NOliHaZLnBJNxFECeijJ5dtfOoWCe6OpCwkdMDW7ABbttBTzhonLfC8zM
         xE5g==
X-Forwarded-Encrypted: i=1; AKwUvBwvl8ODN+p/xcIrginoa5h1PR2dt2C0HjIKptf/UQPTKWpjityScsAwVvoIoJvCs16GiYI6wQOQkUk=@lists.xenproject.org
X-Gm-Message-State: AFuF++l68qAd9eC5EZ7KrH8eI1Rb/DvOjzkyQcgsjH6+5DA7Tr4dDOkX
	9DSWx+PNuJrBO3zFNyKgiEeCr4Vi6o3z1bi6utVzXozn8CTARQ2LgTu8vNKqy1uK8Q==
X-Gm-Gg: AYBFou1G6/GzaHInA+MJo86Q0V1gs931l6jiCrUTHFV4hVFnMEtIucW9HC1JpfCgdZL
	JnoQ8+9D1o2cMHG4cdHOLcE/cv23g0ybUYWquC/C0BZUR9IlqbSYt5G68pfJ8eh2KvLUiJkkrgw
	vFsav1N3GObA6KvTTfF6Qs2alwyZa0KlIpsWhjacMjlueLOfhxCeNtdlnluGpodLHdq5e8+7ZTr
	DYiDS+kKmNhHFzdzHN25ELBiC3y2wRN4sy5ZsD8Txd2+hN+c88S1H+4+D9eSZ+8zRMZUxgys67t
	Pcl3tNxtlJCc+rNqS36ClrsRZn6OsPsEN46PaLajCwXT7EQyQ9aV1XUXwgzvWki6aq78aASJiMW
	0Fka/R4Ug5/3H43bRHuxl2HiyCs+F6Jfw8Alh/mBwWCPDlakBqaB05I0mdqW0OOlBfrX+81NNNS
	z7ltTX+PYf1nmKtnZ48dDJ2L9VTYbEyU8g6jP3tgP59POqq+Af50Kci3AZr+vVJmXKPoNnIG49V
	cwENK2CiDHzvO4zvhtMh8Q=
X-Received: by 2002:a17:907:845:b0:c26:19de:9ad1 with SMTP id a640c23a62f3a-c29b871d15amr212063166b.41.1789399301487;
        Mon, 14 Sep 2026 08:21:41 -0700 (PDT)
Message-ID: <8672bc80-38a5-43b5-a5d0-40a33dcb01dd@suse.com>
Date: Mon, 14 Sep 2026 17:21:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 34/39] xen/riscv: restore register state in the new
 IMSIC VS-file
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
 <c7000473af04e618a340270398fb85fffb46ca05.1787838835.git.oleksii.kurochko@gmail.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <c7000473af04e618a340270398fb85fffb46ca05.1787838835.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1789399301-FCC0777B-AB378AE7/0/0
X-purgate-type: clean
X-purgate-size: 1756

On 27.08.2026 17:21, Oleksii Kurochko wrote:
> @@ -630,13 +649,13 @@ static void cf_check imsic_vsfile_local_read_clear(void *data)
>      old_vsiselect = csr_read(CSR_VSISELECT);
>      old_hstatus = csr_read(CSR_HSTATUS);
>      new_hstatus = old_hstatus & ~HSTATUS_VGEIN;
> -    new_hstatus |= ((unsigned long)idata->hgei) << HSTATUS_VGEIN_SHIFT;
> +    new_hstatus |= MASK_INSR(idata->hgei, HSTATUS_VGEIN);

Please put into final shape upon introduction.

>      csr_write(CSR_HSTATUS, new_hstatus);
>  
>      /*
> -     * There is no need to use atomic functions version to store
> -     * values in MRIF because imsic_vsfile_read_clear() is always called
> -     * with pointer to temporary MRIF on stack.
> +     * No atomic accessors are needed to store the values into the MRIF here,
> +     * as imsic_vsfile_read_clear() is always called with a pointer to a
> +     * temporary MRIF on the stack.
>       */

Same for this comment perhaps.

> @@ -1077,5 +1140,12 @@ void imsic_migrate_vcpu(struct vcpu *v)
>      /* Free-up old IMSIC VS-file */
>      vgein_release(v, old_vsfile_id, old_vsfile_cpu);
>  
> -    BUG_ON("unimplemented");
> +    /* Restore register state in the new IMSIC VS-file */
> +    vsfile_data.mrif = &tmrif;

Ah, here &tmrif is used a 2nd time.

> +    imsic_call_on_cpu(new_vsfile_cpu, imsic_vsfile_local_update, &vsfile_data);
> +
> +    /* Set VCPU HSTATUS.VGEIN to new IMSIC VS-file */
> +    vcpu_guest_cpu_user_regs(v)->hstatus &= ~HSTATUS_VGEIN;
> +    vcpu_guest_cpu_user_regs(v)->hstatus |=
> +            MASK_INSR(new_vsfile_hgei, HSTATUS_VGEIN);

Nit: Indentation.

Other comments on earlier patches apply here (and possibly elsewhere) as
well. Just ftaod.

Jan

