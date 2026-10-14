Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F30C0CC6B1D
	for <xen-devel@archiver.kernel.org>; Wed, 14 Oct 2026 15:12:42 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1449192.1665103 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xH0eb-0004eF-7C; Wed, 14 Oct 2026 15:12:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1449192.1665103; Wed, 14 Oct 2026 15:12:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xH0eb-0004e7-44; Wed, 14 Oct 2026 15:12:29 +0000
Received: by outflank-mailman (input) for mailman id 1449192;
 Wed, 14 Oct 2026 15:12:27 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xH0eZ-0004e1-JJ
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2026 15:12:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xH0eY-00Dmgc-Vu
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2026 17:12:27 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6acf9bcc-e002-0a2a0a5209dd-0a2a450abb18-22
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 17:12:26 +0200
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6acf9bd6-f2d2-0a2a450a0019-d155802de0b7-3
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 17:12:22 +0200
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4a1635f7c89so11270205e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 08:12:22 -0700 (PDT)
Received: from [172.20.10.5] (public-gprs377965.centertel.pl. [37.47.107.174])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1bcf3c382sm11443775e9.11.2026.10.14.08.12.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Oct 2026 08:12:21 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1791990742; x=1792595542; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QRkvS7RKRi+QZMNgLcUHAXcqp4Bttdc3IxZTwLpajWI=;
        b=T+ynyPMMetwkNO9vOJ7V00ETpGDiqpEcIVWWN9iDoVYWlvqMtFnQnIzWTknW7gtNce
         IylG1+pb0ne6wuGUwc7uougd0egqBnsI4EAK9GY32JBz9zRuoTSM8PSBdr0YbYW86jqz
         3/A8iC0Pi0kbYIwTHp0cVFMpkymXdPryP8LNvNh/ZmDxKcOghWp5Vhlf6n6v/UDaVJSu
         rotCBl579YjPXoEBjWFUYbd2kOCs3Wa0KqJoEf6GZjSZNV3c0ZWIdTXPhr7hQn8SF5KN
         o6S+N5cPKV6dVeiggE2F7uYxKM4htTtOrKQ7CZl8JGdyefj8c7ATjHM437IAiAq0LYnf
         95rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791990742; x=1792595542;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QRkvS7RKRi+QZMNgLcUHAXcqp4Bttdc3IxZTwLpajWI=;
        b=KXGndU0/3eDVvgGbNz+vjgIYVgKCd/Fu4DOBerVG4rsliZUo/TGIhwEl9WxtHmBh0a
         VdLf2hD6+k8egyOwTDfMwL2Al6W1GOw3TS8GvnSMeYBNNUrvtEA0klQCG188K4FvsyUH
         LFMxeYUln1KzZjlwXl9wbbuchrErqOUYtrinNwQIDbeMYZwpc16mRVKAZXsKS66yMv7l
         5+vtf9svVmWr8ptAoTzBGadcCy5P7Mf1eAM2JyI4rdWDl/4JcLOQAnnh3P24u+4ze3jW
         QSaD6Z1wP6fO2/ctEXcZrJ0nu0qGeJYpLPzDHbtOTg33NR1TJrzMv7mg8NvUbOJihtkw
         F3xA==
X-Gm-Message-State: AFq9FYJlqVoCVxp4meYOdU/tAUAvaM/tuPxp3g+dCiAA8PH5va872AIG
	TgOwQyNMtiodCv5/KoHxUjGNv6vEiVm/DNG3m0+Ms4g50ORJzg9+ob0W
X-Gm-Gg: AYBFou1DZjq+VuULvtWG9diBWjfHYV+RZr4Ruhk+0/KfAv8eNg+RPeoZIa41LqQUlZT
	yyZBdTsPPNUvtYaAu1unQNluRhyAMEXwoFAP6vVkpgtbyG9DXT8GFC3qfavKDd2FtGcJubvyX5v
	PEJ5qNFBwooiWZ3pBoO5nsyWHK9101RqyH39IMRq3tWvacL2Yz94VBQE1NGzkMr2Gvhk6XdVDeJ
	AEB9wvvtJaTZpNcTIqHDNQrFb61QhAvvQi9glFra6yc2SpJWd6N4WVDbmHNk6VNWgXbEyHNut20
	i2Ll5brgciMGhbN5Vb2tRLhhtbXOOC9ithstYOg+1kUD1Ohm/8yCHH8OSTYR2wI1FEFVQALYn3d
	8WEWYi6T5BZ9CAiMZXVnrK62yIpFhd9K26x4sPu6J++i2GdJGQpIVuUGQt90cpplNzcDDqb5qYX
	5GRP/XUKpQ7+vItRCfzukfpdOmtg+TulOgLOAHerIoomtkcvtw9db+yzBqK10rFgCEac+ZOghtx
	tiDXJ//PFk1vJEMFPLl7+p1u3ZYQILK1VdWQoJ7
X-Received: by 2002:a05:600c:870e:b0:4a1:6dca:51e3 with SMTP id 5b1f17b1804b1-4a18e4487ccmr321387325e9.3.1791990741438;
        Wed, 14 Oct 2026 08:12:21 -0700 (PDT)
Message-ID: <71144753-9c86-457e-a838-c19732c44ab6@gmail.com>
Date: Wed, 14 Oct 2026 17:12:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 14/39] xen/riscv: add IMSIC vCPU context switch
 handlers
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>
Cc: xen-devel@lists.xenproject.org,
 Romain Caritey <Romain.Caritey@microchip.com>,
 Zheng Zhang <zhangzheng@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1790779209.git.oleksii.kurochko@gmail.com>
 <fec6ee1b53887baf99b47a10125002fdb475ffd3.1790779209.git.oleksii.kurochko@gmail.com>
 <1791453289.8631fc262581453bbf619ec5b2062170.1a11aefddb50003f66@vates.tech>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <1791453289.8631fc262581453bbf619ec5b2062170.1a11aefddb50003f66@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1791990742-5A3DCCFC-0DC97B58/10/73395122804
X-purgate-type: spam
X-purgate-size: 3399



On 10/8/26 11:54 AM, Baptiste Le Duc wrote:
>> IMSIC state currently needs to track only which physical CPU owns a vCPU's
>> IMSIC guest interrupt file, as the CPU id is part of the physical address
>> the file is mapped at.
>>
>> Add imsic_ctxt_switch_from() to record that CPU when a vCPU is switched
>> out. A vCPU running on the s/w VS-file has no h/w file bound to a CPU, so
>> there is nothing to record for it. Nothing reads the recorded value yet.
>>
>> imsic_ctxt_switch_to() has nothing to do: switching a vCPU in on the CPU
>> which owns its guest interrupt file needs no IMSIC update. Only a move to
>> another CPU does (a new VGEIN and a remapped file), and that isn't part of
>> the context switch.
> Nit: I think it could make sense to mention that if a migration happen,
> it would go anyway in imsic_migrate_vcpu() before
> imsic_ctxt_switch_to().

Probably it would be nice but at this moment imsic_migrate_vcpu() 
doesn't exist and it what I tried to cover by "Only a move to another 
CPU does ...". At least, for now I think that this part would be better 
to keep as it is now.

>>
>> Install both as the ctxt_switch_{from,to} hooks of struct vintc_ops. MSI
>> delivery is the only mode Xen supports (aplic_init() panics on an APLIC
>> without an "msi-parent" property) and the only one vAPLIC emulates, so the
>> vAPLIC state to save and restore is always the IMSIC one and no
>> vAPLIC-level forwarder is needed. Being indirect call targets, both
>> handlers get cf_check.
>>
>> Co-developed-by: Romain Caritey <Romain.Caritey@microchip.com>
> Should add Signed-off-by Romain Caritey.
> Without that, everything is ok from my side

As we discussed here [1] it is fine to go without Signed-off. And it 
seems like where Xen is different with Linux (where C-o-b should follow 
by S-o-b).

[1] 
https://lore.kernel.org/xen-devel/cover.1790779209.git.oleksii.kurochko@gmail.com/T/#m5063a41f8b824f28d3f9a5a976488b8308575d93

>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>> --- a/xen/arch/riscv/vaplic.c
>> +++ b/xen/arch/riscv/vaplic.c
>> @@ -456,6 +456,12 @@ static const struct mmio_handler_ops vaplic_mmio_ops = {
>>   static const struct vintc_ops vintc_ops = {
>>       .vcpu_init = vcpu_imsic_init,
>>       .vcpu_deinit = vcpu_imsic_deinit,
>> +    /*
>> +     * MSI delivery is the only supported mode, so the vAPLIC state to save
> Nit: Do we want to always support only MSI delivery? If not, maybe adapt
> the comment.

At the moment I consider MSI delivery the only mode worth supporting:
the AIA-capable platforms I'm aware of come with both APLIC and IMSIC,
and with IMSIC guest interrupt files an interrupt reaches the guest
without trapping into Xen, which direct delivery mode can't offer.

As for the comment, I think it's fine as is, given how the members right
below it are initialized:

     .ctxt_switch_from = imsic_ctxt_switch_from,
     .ctxt_switch_to = imsic_ctxt_switch_to,

The imsic_ prefix makes it explicit that MSI delivery mode is assumed,
and supporting direct delivery mode would mean changing these
initializers anyway, so the comment wouldn't be missed then. I'd prefer
to keep it as it is for now and update it once direct delivery mode
needs to be supported.

> 
> Reviewed-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>

Thanks!

~ Oleksii

