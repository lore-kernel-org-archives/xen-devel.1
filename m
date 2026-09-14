Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D9D8C88E50
	for <xen-devel@archiver.kernel.org>; Mon, 14 Sep 2026 12:02:17 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1420853.1647065 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x65No-0005nJ-64; Mon, 14 Sep 2026 12:02:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1420853.1647065; Mon, 14 Sep 2026 12:02:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x65No-0005nC-3U; Mon, 14 Sep 2026 12:02:00 +0000
Received: by outflank-mailman (input) for mailman id 1420853;
 Mon, 14 Sep 2026 12:01:59 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x65Nn-0005n6-5B
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2026 12:01:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x65Nm-00DDDc-3i
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2026 14:01:58 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa7e22c-e002-0a2a0a5209dd-0a2a4505cfb6-10
 for <xen-devel@lists.xenproject.org>; Mon, 14 Sep 2026 14:01:54 +0200
Received: from [74.125.228.76] (helo=mail-ed2-f12.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa7e231-4cb1-0a2a45050019-4a7de44c982a-3
 for <xen-devel@lists.xenproject.org>; Mon, 14 Sep 2026 14:01:53 +0200
Received: by mail-ed2-f12.google.com with SMTP id
 4fb4d7f45d1cf-6a67fa7a64eso3480497a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 14 Sep 2026 05:01:53 -0700 (PDT)
Received: from [172.18.123.208] ([185.104.138.131])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6a9b592470asm4090703a12.17.2026.09.14.05.01.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Sep 2026 05:01:52 -0700 (PDT)
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
        d=suse.com; s=google; t=1789387313; x=1789992113; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cN8ZWLGPIppK8G01ukyR0GIEK59bBmRpRoiq2Sd2cTU=;
        b=JeyZXgSBKjvsuMmyPCyydbOqjMyyOkuOAQO4Be1Vu7m4g1AxGgCmz+wZ0PSJrbt1do
         P0z95jQpPmrQRKiDJjSto+w6ELzPqSi6wz8IWfKjBYLjSupMiY8zPkWOQTnp7WMaQmHH
         16KJvcRZqjMLzn1Z1AMolSL+niK0BJsZ3W3YA1Dy7G9w1/r/4DTEc1g44mkD9Hz6+3Fg
         rKimVzvbM+K6VB8jZOAoQXRmSwtWyQ/YZt681QSel3lw/ed+AUpPjfPih/hYQwRJyUz4
         1hvcRSGQ2Vx/q91Xpl3cooLWXBCv8KmmfExh3fZgJAYRDXHOf2n9bpwN1K8nVvkgkCWC
         GwpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789387313; x=1789992113;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cN8ZWLGPIppK8G01ukyR0GIEK59bBmRpRoiq2Sd2cTU=;
        b=k6a2LkYkJFrNdjn4Yh7kKe96L51L0Mxv0iYPW/8lzaotqU9dr73ysG3xNfXyzpNUtO
         vH7TFbqCtGPSN6L5uZsedTyngOoWb4TPqK8WJCGjYFPDLNOaHwwZ+jgmjLTBNVqJHDKG
         HbmlAkz50nvPSnjM0gFQSn4NZjDudHCQR74qrn86D+K5V8XOP7GX3vdXVsSKRHLW76w5
         Fj9ErmzwNV1LSE3+3DQ6S/Y9iO/jC3X5Aptnuu1aQQL56yNc6CcBZL5eWgbZ0XpIz+Lv
         NVrtqSj9kBWkx3PBvscLstU/sGS/6rM9evIQauZLJiFfzDU/pR1aZvOW45t+gV5LXHKM
         6Udg==
X-Forwarded-Encrypted: i=1; AKwUvBz+7wqOm1Jr6qAafN8zM8tdFag9tNjjbYGU6rmzPdkvpmOMiC5eM60iWdUORq5G0bj3qSzFm9ChlqM=@lists.xenproject.org
X-Gm-Message-State: AFuF++l+I1UoGAcHolyK4/lpD685Wo66AmxvtA+psJ8IPYbfC9kJUs+g
	CO4be0jtvsrSd2moGvcQ/F6xhNrr8t1P03SB1vH+I5BvcEy2eNuOReYs1anNuxGeQw==
X-Gm-Gg: AYBFou02l8Xn02R3BwxxckzxDLD3YlQQJRBgoqzqU6m3rdJduixrrwYhbgeRCJxUkDf
	GQTuuHBAAOsHAVB9fg5EenxR+VOOdyeDjnyqlmiWOzMB4VxguAXnnYLm7REE5tjSe+/YAiNnw/G
	OATjkZKyp0xoGaHSBOD3u05waV2/icME+CCRh78SGPPe20FOnEM/kfAyMwMdX1mm58RwZ7uSYhA
	ynSNkhISZ/pt8AdPF3IIMn9dectsmwQ9oME1TFtjFmO3d1bEI7BWUL1EBv1fcChO9lNd2BuK7oT
	tq/g3JlA2b7TySXAo8m016BI6/e5ldscVS/5bGQK7uVF4IktMhYo6FX9sPFFBBjlQsAGRqq8WP5
	fX6HUusWVYfl8w3P7P8CtDJC5NN1o2awidmBnwA+5z4UfsRnKR29IOaiqFx9tOdOb4iRhsVgotW
	2bk80oFCknBV/uDEu0Xke/G1LPo37uX7tSXMz13ynuT3/cq1BaDxR1puu7/aU1L00aDRzJpQ==
X-Received: by 2002:a05:6402:46cc:b0:6a9:b3b0:6cf3 with SMTP id 4fb4d7f45d1cf-6a9f63dfcffmr1233556a12.34.1789387313182;
        Mon, 14 Sep 2026 05:01:53 -0700 (PDT)
Message-ID: <9d4600c6-258e-4990-b1f1-3c86037227b3@suse.com>
Date: Mon, 14 Sep 2026 14:01:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 26/39] xen/riscv: add guest store emulation for trapped
 MMIO accesses
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
 <230c35550edff0b2b8480b6728614305951fe5cd.1787838835.git.oleksii.kurochko@gmail.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <230c35550edff0b2b8480b6728614305951fe5cd.1787838835.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1789387314-734BC2A1-7512F94A/0/0
X-purgate-type: clean
X-purgate-size: 1110

On 27.08.2026 17:21, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/emulate.c
> +++ b/xen/arch/riscv/emulate.c
> @@ -453,9 +453,28 @@ static int emulate_load(const struct guest_fault *gf)
>      return 0;
>  }
>  
> -static int emulate_store(struct guest_fault *gf)
> +static int emulate_store(const struct guest_fault *gf)
>  {
> -    return -EOPNOTSUPP;
> +    struct cpu_user_regs *regs = gf->regs;
> +    mmio_info_t info = { .is_write = true };
> +    struct decoded_insn di;
> +    int rc;
> +
> +    if ( insn_fetch_faulted(gf, &di) )
> +        return 0;
> +
> +    if ( !decode_ldst_insn(&di, guest_xlen(regs)) || !di.is_write )
> +        return -EOPNOTSUPP;
> +
> +    info.data = *guest_gpr(regs, di.reg);

This came to mind only here, but applies to the earlier patch as well:
There's no checking of di.len, not even by an assertion. The above is
fragile as to extensions like Zilsd. Zilsd itself may still be okay as
the overrun of the register field will hit the correct one, but the
general concern remains (plus of course that moving across fields is
UB).

Jan

