Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7745CC5DF70
	for <xen-devel@archiver.kernel.org>; Tue, 18 Aug 2026 08:17:59 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1393639.1632449 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwF13-0000GZ-TE; Tue, 18 Aug 2026 08:17:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1393639.1632449; Tue, 18 Aug 2026 08:17:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwF13-0000GR-QI; Tue, 18 Aug 2026 08:17:49 +0000
Received: by outflank-mailman (input) for mailman id 1393639;
 Tue, 18 Aug 2026 08:17:49 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wwF13-0000GJ-I5
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 08:17:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwF12-001tUU-V9
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 10:17:48 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a841525-bab6-0a2a0a5309dd-0a2a450bbf98-26
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 10:17:48 +0200
Received: from [209.85.128.47] (helo=mail-wm1-f47.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a84152c-b7e8-0a2a450b0019-d155802fe541-3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 10:17:48 +0200
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-4957eefd361so33143865e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 01:17:48 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482a5a31572sm10324689f8f.5.2026.08.18.01.17.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Aug 2026 01:17:47 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1787041068; x=1787645868; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d8T0Y6BfA3DZkgPSKVxlgvLHJXkmbTof8jMJmn/Ja58=;
        b=BuDEnAzwXqKE1/BFsKYDxkg7L97gTUf89XOynV594GJGsGgMYCcrMe1ClSv9xn+om9
         RyTlgg0xajzl24A+GSvN5f+wTyPAaMzsPylVmld+4gyWXQtbGziiKByn/mmVh8c/H18/
         huMqwL584yZUMhsgvr88rEXoz8cZaQpD1tw7FtcCBPR31ioasVPcV/4LJ2ALgBHHk7Uh
         WfAwjWngfMJk3BD2NKo2aghPqaE2bxG49n3/iagF0BmOvcIOtLYSCWaZM/GmzihMekFv
         xxL4ZUUp2kzniJBk8q61h4PnRhZhzIlq4Fb6aFlXGXHZa/gH7Ygfy/qgYGFAyoufknM7
         oPJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787041068; x=1787645868;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d8T0Y6BfA3DZkgPSKVxlgvLHJXkmbTof8jMJmn/Ja58=;
        b=rxbqYjgCcBcxzv/jFVASXH65fHFqIbSR5fxASIfbYpTazpDaozX6NVw7NrrfHzDw0S
         MfzqvKNwl+M6ku1xo4j1sCaNjRuKVvdy7C+FIwRrqHDiHOuyVw+PNuC/J8JU0AhPj7AT
         DasX95th7xkyfKbjAg6eF+rJd/BwbozzBaHx1rFnfxgDW21XKdqDXTZQBkE/M3YJjANm
         /YBckiE58oiKhrMbsbw6OpBSt0IxCHT14oqGgtolXhGCtbbts7cnRR1qS2hVsWM2ptuG
         X9baYgvpJTLfbJLjUphRjtG7hRy1IFCt0TLuKY0lRoxSQLvIWw9rw+KozwHHabodL3Xy
         4zHg==
X-Forwarded-Encrypted: i=1; AHgh+Romjjqwi21Vdb7BAHPPmzG0qsPhMPTPJDgKtc4jJYZPoDgIyGytfa3z0NuGUAXwuGSJlBQjS1NeKNQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzvLQM7tKMV5DO0iV250xgEugiAoxa0Q/NOLsomQBAI/oC/spJW
	Z8fwZie2/MjS2x9cRwuo0DpZibo4LfgjHJkBCQJgaXk83vM7U7Ih669E
X-Gm-Gg: AR+sD11T5kzW+mXEsqgP6Bdp26WELb2lhXzgCGHIbNdpMwRtduWUDexGiV6agXav3km
	FGDOMxqEAFhDjX19s2DWec31s52T3besu+9IXJM1SZNJTpuYTPzGlWFHCWY1Xeb59vByRpCc2zz
	2q8RX1IfPC2JgoKu3AkGcKSpvkKd/srtBWzQ5sa/1meEX7RzKOaW8IFll8sABwyt5S5UIxAarzl
	iHckycMuQxcDo7NArSQMVOVFxd8vLn7irYiaVcCkcSRV+I9ZiFpPEWeXkL0wob612ZLu/Ug6BcN
	so3wskOhXr/nvL5sUxqec/xDe1RY7/1pEE2IxXQsx4kSbPn1onKf9fsKjx5u6ig9DW3fdhucFR5
	CkFRt9x3l+ejkofhzaGXUJlytdDo5TqsQSsU7FejLR0pzB4YCeRrf4ddLixcqGwaWupTOfyZNQh
	E6HECmK+MCCp9tBZe0gCzEvGgiv+JvAF0fkagHdDo7ePaFvoeQKY/HURZOiDaD0F0xPDBRr6Y7s
	hnzWS1/xVXX+RwVfy/956R9GRaoz0rSNYmb8r+tLxA=
X-Received: by 2002:a05:600c:4fcb:b0:499:5a50:b022 with SMTP id 5b1f17b1804b1-49987928d0cmr524314855e9.3.1787041068221;
        Tue, 18 Aug 2026 01:17:48 -0700 (PDT)
Message-ID: <12b04ab7-6d0c-4d01-8c73-16cd46f1b311@gmail.com>
Date: Tue, 18 Aug 2026 10:17:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 12/17] xen/riscv: extend exception tables with type and
 data fields
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1784560663.git.oleksii.kurochko@gmail.com>
 <1eb9050ff6632f91682151471440990bd718ed90.1784560663.git.oleksii.kurochko@gmail.com>
 <be932384-6661-4c92-9137-8f6a9cd54057@suse.com>
 <3c9ef195-a8d4-489c-8daf-5635d3b53063@gmail.com>
 <87339fc0-fbf7-44eb-8b08-cc95ac7d1cb6@gmail.com>
 <eeedd10c-0c14-438e-a48f-05383ba49ec8@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <eeedd10c-0c14-438e-a48f-05383ba49ec8@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1787041068-1A8D99EA-4957A184/10/73395122804
X-purgate-type: spam
X-purgate-size: 1051



On 8/18/26 9:58 AM, Jan Beulich wrote:
> On 17.08.2026 13:39, Oleksii Kurochko wrote:
>> On 8/17/26 1:33 PM, Oleksii Kurochko wrote:
>>>>
>>>>> +    BUG_ON(!trap_info);
>>>>> +
>>>>> +    trap_info->sepc = csr_read(CSR_SEPC);
>>>>> +    trap_info->scause = csr_read(CSR_SCAUSE);
>>>>> +    trap_info->stval = csr_read(CSR_STVAL);
>>>>
>>>> Do you really need to re-read all three registers here? Didn't you
>>>> read at least
>>>> scause already, in order to make it here in the first place?
>>>
>>> Agree, ->scause and ->sepc are already read.
>>
>> scause should be re-reaad as we don't save it inside cpu_user_regs
>> structure.
> 
> It could be propagated as a function argument. Question really is how
> expensive these CSR reads are.

Considering that each RISC-V hart normally observes its own CSR 
accesses, including its implicit CSR accesses, as performed in program 
order what affects out of order execution maybe it will be really better 
to propagate scause as a function argument.

~ Oleksii

