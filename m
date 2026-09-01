Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D57EC61DD6
	for <xen-devel@archiver.kernel.org>; Tue,  1 Sep 2026 08:47:29 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1404630.1638293 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1K9C-0004Bk-EE; Tue, 01 Sep 2026 08:47:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1404630.1638293; Tue, 01 Sep 2026 08:47:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1K9C-0004Bd-BR; Tue, 01 Sep 2026 08:47:14 +0000
Received: by outflank-mailman (input) for mailman id 1404630;
 Tue, 01 Sep 2026 08:47:13 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x1K9B-0004BX-Ae
 for xen-devel@lists.xenproject.org; Tue, 01 Sep 2026 08:47:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x1K9A-007UL0-N7
 for xen-devel@lists.xenproject.org; Tue, 01 Sep 2026 10:47:12 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a969110-bab6-0a2a0a5309dd-0a2a4504cc50-4
 for <xen-devel@lists.xenproject.org>; Tue, 01 Sep 2026 10:47:12 +0200
Received: from [209.85.221.45] (helo=mail-wr1-f45.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a969110-b57f-0a2a45040019-d155dd2da5bf-3
 for <xen-devel@lists.xenproject.org>; Tue, 01 Sep 2026 10:47:12 +0200
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-4843e397f74so692840f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 01 Sep 2026 01:47:12 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48442c42492sm3965429f8f.1.2026.09.01.01.47.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Sep 2026 01:47:11 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788252432; x=1788857232; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qCLTnqHsJEHNmB+nCX1lXvcUL5VDVX23XUPflETjZ1k=;
        b=FC0K3F4fY/FQfsvfgetiy5EFkkG6iqr/h0J2LA6X9LmRQMAFgg3Sxq/mXzHrsND+Go
         KoEjX/DHIOi2gZclbubgFabTJ4WrIPwBVFq6JOnHemjh1/OMSPhQapmAOw1l16poexG+
         AJR2sdBB2ycVafUHtfkO55vKotn+jrNqSY+uaY783RQYbNANHgstfbGLbJMNFXrq8gv8
         B/UVR2CsCYjdsvWA0YxpMQbvPf9MXqAA/R5UgqA9zTWFsaIngep3JS46T/5SfKXm0WbE
         /qlXvG2Ot8ZGbdrpsb6A8wmvC6iZtDqV3bsPL4Zlx3pL53+sRPiWLYptnxtqkvLY1DmW
         KJiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788252432; x=1788857232;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qCLTnqHsJEHNmB+nCX1lXvcUL5VDVX23XUPflETjZ1k=;
        b=ZREWjowJFslaH3zol55YbZ01gnboc7TtRdskFq/GROB1Ht8hg/ZrMGIbPcy9TjMZEW
         5Ik0I1EYb2V8JQacYP//NV7PwME7eM6eoKtmX9rSJ5JZFB5IyNoQcvHP0UZUEhp5eGQe
         8Ud6IHxw5lmc3n7xnNldEQL7UMr2FwWWMHVSonR98Al1A2+puQlYHq1aNz41Egu3uNid
         51QoZsXoTzQzO+iNn3vrcA3GcNWCwJ5Nt9XrmT8T6Ksn6hW3KYHbQQUgwora2vjlb/ID
         rJWkm3A1DImDAbLAlu489xiJPM8PwlcCeLZ3QeWQcd6JyhjjSa0CC6W0Rqzf0msMu+rB
         UU9Q==
X-Forwarded-Encrypted: i=1; AKwUvBxRC3qqOM9hL6+AA82NVxp4M59YH+NSALgsOEFjq7Giv+Tv0cyuGs1m7RgCXX+F1zc9qhnhDKPMGPg=@lists.xenproject.org
X-Gm-Message-State: AFuF++kLpoEUo4j3w/N3cF5CIVjRwmgq85MNukwLVMl4msoLxuS2QU+O
	DwMBerraFRH31ZywFymRCozyHNeGUlow2ub8q/CxJ0zrsw9Bs+MnEp4C
X-Gm-Gg: AYBFou0qBhdtgb+th/JkYrnBCH679Exp3aEfp1B2btIECK3RnEstTcXsmVerMdXMSWA
	fpFIbLZnwnd+r65DzxuNgsLXJc+UuCUlIMMvmf49fklcGM43J1vNcQ0AHSEao4iRc22NET2C93J
	XXGNKq7tneHFxmUeWiODgxval1ud3oc/UsDcTCddxx7HiW0lLcC2l/ZO/Ot5H5xqERPNmieWFwp
	fmXA8e2YwyiuzoFtmSk+Hd2DCYYjNo742wFc7ZTn4CJA0VfCmQsXxZEfdOuWO7fs5xuHQs0JwJx
	QQxCJjAQ0/0bW7uMQzOuvHv1cfDFbfhmwIGTqQHS15152f32HG22m9Oujd4GJMnufTeHntvmyUW
	w9xl0dSaThP6VAsOPSE+ZBvIU6u0WdCSgkihRdfU418WfTLP5uGaSxnHavyOVdaCxpgZ9430gc8
	WyhOcL3U7kNHITGi81lJ9Y/3AOF5fGykuGFrWIVPUQpgks4+eFEr+eRc1N7bgfxqC6+1kcf7bBG
	+YOtZsymkXqVOVVEvw798dtDz+XxSMNx3fxlpB3CydQbJVM+p5B
X-Received: by 2002:a05:6000:46cf:b0:484:44ec:2c3a with SMTP id ffacd0b85a97d-48444ec2e31mr3471523f8f.0.1788252431895;
        Tue, 01 Sep 2026 01:47:11 -0700 (PDT)
Message-ID: <2533f0eb-1816-459b-a3a8-365d8a72c11f@gmail.com>
Date: Tue, 1 Sep 2026 10:47:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/39] xen/riscv: use UINT64_MAX to disable the
 VS-timer
To: Jan Beulich <jbeulich@suse.com>
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
 <93829c39b080d288ea342c7375d5307f93ee9a29.1787838835.git.oleksii.kurochko@gmail.com>
 <5ed7172d-24e7-4ace-964e-dad814c2dc6a@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <5ed7172d-24e7-4ace-964e-dad814c2dc6a@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1788252432-C22D4B50-5D36220E/10/73395122804
X-purgate-type: spam
X-purgate-size: 1062



On 9/1/26 9:12 AM, Jan Beulich wrote:
> On 27.08.2026 17:20, Oleksii Kurochko wrote:
>> vstimecmp is a 64-bit CSR independently of XLEN, which is why it is
>> written with csr_write64(). On RV32 that macro splits the value into
>> the vstimecmp/vstimecmph pair, so passing ULONG_MAX (0xffffffff there)
>> writes all ones to the low half and zero to the high half, leaving the
>> CSR at 0x00000000ffffffff rather than at its maximum. A VS-timer irq
>> would then become pending as soon as (time + htimedelta) reaches 2^32,
>> which is exactly what the code is trying to avoid.
>>
>> Use UINT64_MAX, which matches the width of the CSR. On RV64 it is equal
>> to ULONG_MAX, so no functional change there.
> 
> Hmm. This again is an example where code (likely) will be silently wrong
> for RV128. Presumably the CSR would be XLEN bits wide there as well, and
> hence you'd need to write it with 128 bits of ones. Imo ~0 is what wants
> using here.
> 
Agree, it makes would be better to have ~0 here. I will apply that.

Thanks.

~ Oleksii

