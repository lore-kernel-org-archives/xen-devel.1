Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1441CC6B1A
	for <xen-devel@archiver.kernel.org>; Wed, 14 Oct 2026 14:53:28 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1449171.1665085 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xH0Lv-00008q-E6; Wed, 14 Oct 2026 14:53:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1449171.1665085; Wed, 14 Oct 2026 14:53:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xH0Lv-00008j-An; Wed, 14 Oct 2026 14:53:11 +0000
Received: by outflank-mailman (input) for mailman id 1449171;
 Wed, 14 Oct 2026 14:53:09 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xH0Lt-00008d-SC
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2026 14:53:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xH0Lt-004GjE-1K
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2026 16:53:09 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6acf9754-8faa-0a2a0a5109dd-0a2a4505ba40-2
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 16:53:09 +0200
Received: from [209.85.221.54] (helo=mail-wr1-f54.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6acf9754-4cb1-0a2a45050019-d155dd36c102-3
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 16:53:08 +0200
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-48c411d6615so3099198f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 07:53:08 -0700 (PDT)
Received: from [172.20.10.5] (public-gprs377965.centertel.pl. [37.47.107.174])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48df0f8f624sm1190534f8f.5.2026.10.14.07.53.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Oct 2026 07:53:07 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1791989588; x=1792594388; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qsXuphSkdRcAHaN/8VnmvZd3Bh6XwZaqZfIQP3tXUYs=;
        b=BbAd2tZHkVcB15F2Ax324VAWz8MXYaIdSJN6m75uICtk56txtGVQAAYHqCPuFkoymf
         ED2GFAADNK9M68zVf8TX8Zc/uz+ev26bS978ph9VPMOWT/JghbPHZhVvh+l0pUA4PVen
         EM6BpRk8KDqE1+Q+paWY++ADejucsgNxYOt7fXeuVLmkerHTFOrOO8Ga8OLFkiZ9ZK9U
         ySZxp1FHOEnBumj3nVyxmpNwt6mJvSNpQtdGfnLbec1f4Ym5AXZx6JNst1QbztEqkX+w
         nilgkIhzj76z/7MmhjbDfNbGH7sWZKkL1MAu2Kb9ic8tWAtTvXiJR3Ow3Kvke42K+bRM
         pW0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791989588; x=1792594388;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qsXuphSkdRcAHaN/8VnmvZd3Bh6XwZaqZfIQP3tXUYs=;
        b=jrG0rj+d8hOBVEiT/0W2sls6qH1kf3b54EeFj0PUPx+kA8/w8MgU+JT6PIY3+bPs3O
         OXBlovSqwJvfmsNFFoUn00s89+1c2UCaU5p89H03ETwAKSEWTwoDtTiSrFYlHP4NPlAl
         dABwohECFkdcePvS257pVXLv7Tf/Qn/UiKIafxvtrdO0aRAuH22Hd156pMz/7basC2Rj
         K30I5E7+txX/PyQVgSCq8UWkaLQiFX9qHJX7HFm5k5e8CA+AVJgSVaW+LSSHL9tB9BTq
         4vAp4zIWMDZ4v0QMBOXi2diCnodTv+F+wzomNz7mctHPU0kxjrN72SnLLdNyxNPKjAfG
         9gRQ==
X-Gm-Message-State: AFq9FYJk86bqHHHv3wutIXENBmgl1U2J53VWRE4cVVFHYrkRB4i82NIR
	kIa2pfkMNcXP5+wdeohVwfYpwwXLKERsWpepXoqWsnkkG+VkWPrzgKvX
X-Gm-Gg: AYBFou0+r4bHVmeVTI+RMou736LR60plwo1B9pWGwhyyTyvZ6a1qwnzkWFl9JLWLyt3
	5+qRUdqlR4beG0xo+SBdb5NbKQeM6HuEi6DepaSIPvG5KIXyX6wUz3bh35aC1seIcMcX956pffB
	J+zLzOtStmd5ejubzMB1pCJPVoE0uXwtALN10oojBZCCffeQeLmZTt+RPpvnnTta+fYn5IJBuIY
	FvKriaWPQs8B2kCVbXrgHyGNYoHfjh3kz5fVhxEcVm+0zaZFM1QMv9d9qHLJHhlOuIuF5REn1ab
	nmcCpDwjUPJC6v1odBzEgJbG+HBTob3y9VuC0rFSkDdg2JR5QKHn3DmCbpTYI5Xl02CzxtfEE1c
	4r87Veru+mKHWcpfjaBYsECaYBpKGwnS+DCpIZkqL6Jd7NuimkpxBCHJg49Cmo2yMzJr4JUDdn/
	BFK1hse4BeHnjJozi80PJHcXXFHVzUBISW+K16Lha1LXIoP67BSwFrBkwkJmJynsgObGx4MeKTe
	Jh4iPg5CL9pXjxcArjTBjtGVLiecvN3I9vBhOe8Kibp3DMF52c=
X-Received: by 2002:a05:6000:184e:b0:48b:174:eab1 with SMTP id ffacd0b85a97d-48dbaceb3f2mr28876540f8f.36.1791989588390;
        Wed, 14 Oct 2026 07:53:08 -0700 (PDT)
Message-ID: <0b6b4bef-11c4-486b-8b9b-e46648b2207e@gmail.com>
Date: Wed, 14 Oct 2026 16:53:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 12/39] xen/riscv: save and restore vsiselect on vCPU
 context switch
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
 <3a454373368c507a7bf9693c6651a7749d2a86b7.1790779209.git.oleksii.kurochko@gmail.com>
 <1791363264.8631fc262581453bbf619ec5b2062170.1a1159231980003f66@vates.tech>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <1791363264.8631fc262581453bbf619ec5b2062170.1a1159231980003f66@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1791989589-F60AA2A1-CE23AEA8/10/73395122804
X-purgate-type: spam
X-purgate-size: 2203



On 10/7/26 10:53 AM, Baptiste Le Duc wrote:
>> vsiselect is a per-hart CSR which a guest changes on its own: when V=1,
>> VS-mode accesses to siselect are really accesses to vsiselect.
>> Architecturally a vCPU has to find there the value it last wrote, but as
>> long as the CSR isn't part of the vCPU context it finds whatever selector
>> the vCPU which ran on the hart before it left behind. A guest which writes
>> siselect, is descheduled and then reads sireg without rewriting siselect
>> therefore reaches a register it never selected, and it can also observe
>> another guest's selector value.
> Nit: I'd suggest a more tighter version that might be more clear. Feel
> free to use it:
> 
>      ```
>      vsiselect isn't saved/restored, yet the guest writes it directly (VS-mode
>      accesses to siselect go to vsiselect). After a context switch a vCPU
>      therefore sees the selector left by the previous vCPU on that hart: a guest
>      writing siselect, getting descheduled, then accessing sireg hits a register
>      it never selected, and it can observe another guest's selector value.
>      ```
> 

that's clearer. I'll take it.

>>
>> When Smstateen is implemented, access to vsiselect and vsireg is gated by
>> hstateen0.CSRIND (bit 60, SMSTATEEN0_SVSLCT in Xen's headers), and
>> v->arch.hstateen0 holds the bits vcpu_csr_init() ended up with. A clear
>> bit there covers the two cases in which the CSR has to be skipped:
>>
>>   - Xen didn't hand the guest access to it, so the guest can't have changed
>>     the CSR and there is no state to preserve;
>>   - M-mode denied the state altogether. Smstateen makes a bit which is zero
>>     in mstateen0 read-only zero in hstateen0, and a zero bit in mstateen0
>>     traps accesses from every privilege mode less privileged than M-mode,
>>     HS-mode included, so Xen couldn't even read the CSR to save it.
>>
>> Without Smstateen no bit controls access to the CSR, so it is saved and
>> restored whenever Ssaia is available.
>>
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> 
> Reviewed-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>

Thanks!

~ Oleksii

