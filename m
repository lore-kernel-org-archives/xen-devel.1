Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B438CC6B1D
	for <xen-devel@archiver.kernel.org>; Wed, 14 Oct 2026 11:45:43 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1448845.1664870 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGxQD-000569-Oq; Wed, 14 Oct 2026 11:45:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1448845.1664870; Wed, 14 Oct 2026 11:45:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGxQD-000562-LP; Wed, 14 Oct 2026 11:45:25 +0000
Received: by outflank-mailman (input) for mailman id 1448845;
 Wed, 14 Oct 2026 11:45:23 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xGxQB-00055w-QA
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2026 11:45:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGxQA-001BsC-Pj
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2026 13:45:22 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6acf6b45-2eae-0a2a0a5409dd-0a2a45099850-44
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 13:45:22 +0200
Received: from [209.85.221.52] (helo=mail-wr1-f52.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6acf6b50-be1a-0a2a45090019-d155dd34c587-3
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 13:45:20 +0200
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-48b042c0728so933410f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 04:45:20 -0700 (PDT)
Received: from [172.20.10.5] (public-gprs376522.centertel.pl. [37.47.102.11])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48de0ac35dfsm11655349f8f.33.2026.10.14.04.45.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Oct 2026 04:45:19 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1791978320; x=1792583120; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KRNKjH5pVqXD1rzVhV2/qbL5QXfAVoAd2SGKZnnMh3k=;
        b=joymwXt+clKREMBdZpzVkjopM4qF9H30DRmfcCZA+M+/95kJQaE744xdrfew5Lou3o
         F3Bax+Ldu1mQv+Oyft4TOrL9Xnm8YEXmKL3cRQX6tCA/wEu9SgbfJbDsmExijlFX9t4C
         iJmB0MOl2HLOBdc54kkDtT+3o79puNEKi4YJiow391+b72xgpCaGigaJym+0UIgrZGFr
         PODmGNuMukXtxww88++qXYQtAe24HgKw/hgWisstVApcfE7JZq0Qv82EXLObUO9pedKP
         6t6NDBxqdWzSypgFulJz2xi1EFusGhc5ZkCloSDjtf2tbYdZccAu/RUpxBaINmYyrSDz
         Ky/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791978320; x=1792583120;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KRNKjH5pVqXD1rzVhV2/qbL5QXfAVoAd2SGKZnnMh3k=;
        b=HJFFaDCXgD++tJsErNp794vKWYGCtk4jkSE7KoCfrtKrMwix8sJPgAGxX1xRZYW4i0
         xvv8L9ir2VOijVUt9sKUt/XK66OJDhARheNhdx+AYkx7CbTk1npQET42kMbrEI4LoyzR
         Mw4RR8k1UwNWSB9G8zXd+88QCmyenqPCqLvkgKoRxHTI+hP1f5JxvF3MnZGaee7/jvqV
         vtRfj4fRGE3wuLxE9qbmpoyIhc+a+wkEPdBFt0McgXFO9lD+WfRQ/0/sifCUZL6DOJuU
         qp4X6IwzSoZCTaUo5X/+s3p8eCFO0YfwWGht8N1oqN3QitlRez2Csb3kvi6xt51xIQw4
         jO5Q==
X-Gm-Message-State: AFq9FYL5217WNwbR/4EritmsFfqBC/rnmc1wLjyDVnv3amUiVPHQO6YC
	/sK/4wnZAOBbZiG82cV6YNjTgRS9QUl3GRKf93N5p8fbRITpgLcC27UZ
X-Gm-Gg: AYBFou0x7hbW+lqR9A/yFhZ5J8h4mys682FS7zd77dEKfAOJrE4kKF5XKHYOSP3TwSw
	Jr7pnVH+6ugamai2O49HBXkgkp4kF1MYi76GNEFEbT19rXEt8g+XKIx4dj/SOxVuS3LLX9Dazt1
	VqpycA6/AEAP0mmZHYq4ZlfUORelo1U7JLxU7nQM/2Imi2vXUb6tNWQabhqDhxjB3FnscV9JyRa
	rmvGEQ37ydBweTX2gAF/UdUJn8BeuwzCl0r9b2D4zxaEJXerd5+CYsvXsZwW79VnsKkICsWDp+9
	7VBSvCkOgXX/iKlDA0GkjWGSVuaRdUpp2dylcaMEPxCE9rCjjsM6GteMt1952p4EzSUYrBSveAj
	Um9fgs3BYRwgZG0085fnT1f8BAl3xWYjpjM1Pw7HHU9krl//U66gPKO2kPT/Bl7e10Ej8AfZw+3
	eTPjFZAKauWiADiO9ob/5XNb7wuawOrGCa/OEhYqMeZlVz5yUYRG6yTlLMCiHjFdwTBH6hsE8+e
	BYgZHkh/VrqUvp7ThnvpVNHw+DvQILjXkovMMA=
X-Received: by 2002:a05:6000:24c3:b0:48a:fb55:416c with SMTP id ffacd0b85a97d-48dbaae89d3mr26907436f8f.21.1791978319957;
        Wed, 14 Oct 2026 04:45:19 -0700 (PDT)
Message-ID: <10748eac-05e2-454f-9baa-35f015d70135@gmail.com>
Date: Wed, 14 Oct 2026 13:45:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/39] xen/riscv: implement virtual APLIC MMIO
 emulation
To: Jan Beulich <jbeulich@suse.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>
Cc: xen-devel@lists.xenproject.org,
 Romain Caritey <Romain.Caritey@microchip.com>,
 Zheng Zhang <zhangzheng@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1790779209.git.oleksii.kurochko@gmail.com>
 <bd546cae116c93c88706b49e7c24a125b4e5237c.1790779209.git.oleksii.kurochko@gmail.com>
 <1791212017.8631fc262581453bbf619ec5b2062170.1a10c8e58370003f66@vates.tech>
 <c645f0b5-62f7-465c-9518-226cbd124bac@gmail.com>
 <6428c5da-0289-41ee-835c-ae5def434c52@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <6428c5da-0289-41ee-835c-ae5def434c52@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1791978320-BEEDE034-794914EA/10/73395122804
X-purgate-type: spam
X-purgate-size: 2356



On 10/14/26 8:16 AM, Jan Beulich wrote:
> On 13.10.2026 18:06, Oleksii Kurochko wrote:
>> On 10/5/26 4:53 PM, Baptiste Le Duc wrote:
>>>> Guests running under Xen program interrupt routing by writing to APLIC
>>>> MMIO registers. Xen must intercept these accesses to enforce interrupt
>>>> isolation between domains and to translate guest routing intent into the
>>>> underlying physical MSI topology.
>>>>
>>>> Register the vAPLIC range with the MMIO dispatch and emulate the accesses:
>>>>    - reads and writes are masked with the domain's authorised interrupt
>>>>      bitmap, so that a guest can neither observe nor affect interrupts it
>>>>      does not own;
>>>>    - target registers are shadowed per source, so that a guest reads back
>>>>      what it wrote. The h/w register instead gets the hart index and guest
>>>>      interrupt file of the pCPU the target vCPU's interrupt file lives on,
>>>>      as the APLIC uses these fields directly to compute the MSI address. As
>>>>      long as the target vCPU has no h/w guest interrupt file, only the
>>>>      shadow copy is updated;
>>>>    - only MSI delivery mode is emulated: target writes made while the
>>>>      guest's domaincfg.DM is clear are ignored.
>>>>
>>>> Delegation (APLIC_SOURCECFG_D) is not yet supported.
>>>>
>>>> Co-developed-by: Romain Caritey <Romain.Caritey@microchip.com>
>>>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>> Co-developed-by: needs a matching Signed-off-by: from Romain right after
>>> it.
>>
>> I will contact Romain and ask for his Signed-off-by.
> 
> Just to mention: Co-developed-by: can mean many things. We haven't been
> insisting on matching S-o-b before. Plus if there was an S-o-b, why
> would there want/need to be Co-developed-by: as well?

I haven't checked if it is true for Xen (my fault). I know that such 
rule is in Linux 
(https://docs.kernel.org/process/submitting-patches.html#when-to-use-acked-by-cc-and-co-developed-by):
   ...
   Since Co-developed-by: denotes authorship, every Co-developed-by: 
must   be immediately followed by a Signed-off-by:
   ...

I've never thought in that way about S-o-b and I think I can agree with 
that there is no point to have Co-developed-by if there is correspondent 
S-o-b, i.e. S-o-b by default includes C-o-b.

~ Oleksii

