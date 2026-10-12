Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5037ECA9ED1
	for <xen-devel@archiver.kernel.org>; Mon, 12 Oct 2026 14:28:17 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1446415.1662544 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGH0O-0003YZ-V0; Mon, 12 Oct 2026 14:27:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1446415.1662544; Mon, 12 Oct 2026 14:27:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGH0O-0003YS-Rp; Mon, 12 Oct 2026 14:27:56 +0000
Received: by outflank-mailman (input) for mailman id 1446415;
 Mon, 12 Oct 2026 14:27:54 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xGH0M-0003YI-Qr
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 14:27:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGH0L-00GXKA-Ns
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 16:27:53 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6accee4d-2eae-0a2a0a5409dd-0a2a450bb0fe-42
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 16:27:53 +0200
Received: from [209.85.221.41] (helo=mail-wr1-f41.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6accee69-b7e8-0a2a450b0019-d155dd29e12a-3
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 16:27:53 +0200
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-48b9d8055dfso1501533f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 07:27:53 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-71-234.play-internet.pl.
 [109.243.71.234]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48db94e3519sm21523365f8f.16.2026.10.12.07.27.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Oct 2026 07:27:51 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1791815273; x=1792420073; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=98iMOZmL2SX1z8LyBHw+Q8ZxOjErsHJ74vlNo2magzs=;
        b=YaCs6EXAqpYwPXyZ+L9jq8t25gMyzrQ2DAGmpXnCF6KLDcVj59t2gvE/47uMBX3bHp
         2ZvS3YNPaqUcKXslPpg6XWIhmu+QLrUUc7Cd2AyoxWNvKLh/wU01VTXblHZrFDNC+mRs
         OHofpPJYWuLCC5ZLJmHlnHSzuMBkwBOsKgJWUk8p/pBzPqXxaFbmTMj+/ITak8PtGbUD
         3zfokiCybc+xcK9X+8I+Uh1VQKtJmOeDj08eH4DXi9jpVItmWRYxRqkapwuonO7QwPmY
         hYC1lUnlMhuNKKJbKF6F3z5+EdvPP5jgee2xlIGBBTSHxGkuoEmBoAFzqkrc8zFUjSZs
         669Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791815273; x=1792420073;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=98iMOZmL2SX1z8LyBHw+Q8ZxOjErsHJ74vlNo2magzs=;
        b=JfepOf/uXeNYUiGpdLUXJyLgDXBP9NYiJJnUckAbrdz0b57sz//q4uueLrEdKBzfGw
         S8rmUc5snty67QAEC5/CLkfljDVbZqo7okTwX9pQgWAhyMvwa0xKBmwzrNODTPIhjgJX
         CZzU3bike8BFgFzOGwz9IL3AvRc7SKPhRotYuYYQVb5TdyowBu6OJKHVhRn37BUAElsY
         6d0aQd79VoMVKTJxhbPIDI9PIr0PiBDkR8fGNaL/Moy9By3NAifsMa8tQC38wJyEhO/8
         RA9sor6JKrygxz3bbeWUOJl2b6Ch4ZXG9UK4LmzrreAww5syNlBFaeu+PQ2v/eGVBep3
         wUvQ==
X-Gm-Message-State: AFq9FYJuRlFLm4rceVYm0jxRpPB9/7dpSBOGWM5qmH9vKobjp9pSAg9N
	BlLoyiYn/wZynNyeppZB8Zpp8AoZi0SMPWu5SBDEWgwuYBfBpirX4K5H
X-Gm-Gg: AYBFou32SLD18eRhO3j4S4cXiwDnLBgC5TUmlYmY5jYXrTXDlhspoUicfB/u4/YL1WR
	ndS/yVDbz+jY0huooEmXH2KlqOLOvpNt8zupjct+kUlKJw2zWxvikZPpAs7Vz78b5E1C/tgB0vg
	u1p1J9kRodl/6VnsDIucfYbVcg8LalVJQi5a3aQeNc07U+DLpQhoOC9RDB37HOxM/KB4S15Vybr
	96zF3tWHJxKp7Tz+0NunBD6+Hvr3Ms7N7zHE6An15uygGYMSrCkeqL4CgBzp5ah6xUgbqBUbEtG
	ZWwSVPEmL9Si10VlYJbEe8+i5nlILg8t20h6lBEYs1I2sLyA9QYXkJK51Gehc6jZs3Cv+zb4rhS
	oV4yLIXm70nAmqzaw3r5VAHgHTRB8M8jXbl9v6CjGWmfCRDe64+ErL7f+DGuO5Zk5Qx9U6fCtiQ
	iFJfWwNJKaeMgkRA9azB0RJbz2Sq1wInttdvjf1sHhx2HWmaJgVwL/1n3yQCPmPrNhJNti+YN7H
	V0qKH8YA0VFXi/Go1k8G+rCA1zb6RkWY+9FmIF/mT/AWcZbVQ==
X-Received: by 2002:a05:6000:298e:10b0:487:2387:7c9 with SMTP id ffacd0b85a97d-48dbaadb47emr13300160f8f.14.1791815272278;
        Mon, 12 Oct 2026 07:27:52 -0700 (PDT)
Message-ID: <54046054-0352-44a8-aedb-8221ac1a9dac@gmail.com>
Date: Mon, 12 Oct 2026 16:27:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/39] xen/riscv: introduce CPU_NONE
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
 <d35b280c0bf075a2a730f9cb69ced407e346ebd5.1790779209.git.oleksii.kurochko@gmail.com>
 <1791212017.8631fc262581453bbf619ec5b2062170.1a10c8e56370003f66@vates.tech>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <1791212017.8631fc262581453bbf619ec5b2062170.1a10c8e56370003f66@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1791815273-AA4DB9EA-25D18613/10/73395122804
X-purgate-type: spam
X-purgate-size: 1521



On 10/5/26 4:53 PM, Baptiste Le Duc wrote:
>> Introduce CPU_NONE, a CPU number which doesn't identify any physical
>> CPU, to be used wherever a pCPU has to be recorded but there may be
>> none.
>>
>> Its first user is vsfile_cpu in struct vimsic_state, which records the
>> pCPU whose h/w guest interrupt file backs the vCPU's IMSIC VS-file.
>> NR_CPUS has been used there as the value meaning that there is no such
>> pCPU, i.e. that the s/w VS-file is in use. NR_CPUS is however an upper
> Nit: It's hard to understand when reading the message why s/w is mentioning.
> I'd reword it to:
>      ```
>      NR_CPUS has been used there to mean that no h/w guest interrupt file is
>      attached (i.e. the vCPU uses the s/w VS-file), so there is no pCPU to
>      record.
>      ```
>> bound rather than a "no CPU" marker, and it already carries other
>> meanings: hartid_to_cpuid() returns it for a hart Xen doesn't know, and
>> pcpu_info[] uses it for an entry whose processor_id isn't valid yet.
>> Use CPU_NONE for vsfile_cpu instead, so that the s/w VS-file case can't
>> be mistaken for any of those.
> Nit: Same as above, I'd prefer something like:
>      ```
>      Use CPU_NONE for vsfile_cpu instead, so that "no h/w guest interrupt
>      file attached" can't be mistaken for an unknown hart or a not-yet-valid
>      pcpu_info[] entry.
>      ```

I will apply your suggestions.

> 
> Reviewed-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
> 

Thanks!

~ Oleksii


