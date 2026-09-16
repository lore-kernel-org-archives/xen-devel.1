Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00AE9C88E77
	for <xen-devel@archiver.kernel.org>; Wed, 16 Sep 2026 04:16:39 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1422280.1647739 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x6h4J-0003c8-2H; Wed, 16 Sep 2026 04:16:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1422280.1647739; Wed, 16 Sep 2026 04:16:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x6h4I-0003c1-Vj; Wed, 16 Sep 2026 04:16:22 +0000
Received: by outflank-mailman (input) for mailman id 1422280;
 Wed, 16 Sep 2026 04:16:21 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x6h4H-0003bv-Cw
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2026 04:16:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x6h4F-006SFq-Ep
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2026 06:16:19 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aaa17fd-bab6-0a2a0a5309dd-0a2a450c8268-12
 for <xen-devel@lists.xenproject.org>; Wed, 16 Sep 2026 06:16:19 +0200
Received: from [74.125.225.76] (helo=mail-wr2-f12.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aaa1813-f479-0a2a450c0019-4a7de14cf443-3
 for <xen-devel@lists.xenproject.org>; Wed, 16 Sep 2026 06:16:19 +0200
Received: by mail-wr2-f12.google.com with SMTP id
 ffacd0b85a97d-482f6350faaso169103f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 15 Sep 2026 21:16:19 -0700 (PDT)
Received: from [10.250.112.129] (h-213.61.72.154.host.de.colt.net.
 [213.61.72.154]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4870bf33e01sm4529369f8f.23.2026.09.15.21.16.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Sep 2026 21:16:18 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1789532179; x=1790136979; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LJ7Q+r4Dz9iCkm1JnTTVO7noWaR6rOrHRmLAPkrbqC8=;
        b=ehqAvvAcyX7+KmvOV45QE3UQwyHqiVrLWCu2sjCVjKkfhZLtEi2c768TScaUAWFlB3
         ITWEPe9m06uyPzu57yy2dsJyE4up2hU/hGnHGGELtqbZlOxaD9kM946dNarGYGni2K8K
         8bgqHbThgFWgsvGsKR1DIofTGxnOqMui6RfniQ+dN3C4HsHvS6Or+x3ekVzXssnMC7br
         hY+CQBrFENKpiK7E+F5HvIMzjuyJovFe2nIZhoZ4dqXn6C+n4CXjh1dtAabhMHNiZ8aX
         Dqxp7CgRchOimcFIQqbORmLox7Lp+dMAvt8z40d0IkABGswnvyBbSgmbwVZrDOMYB8D1
         d9dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789532179; x=1790136979;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LJ7Q+r4Dz9iCkm1JnTTVO7noWaR6rOrHRmLAPkrbqC8=;
        b=nYwBqm0jQ7I1JuVbnrndfwOE35CXQ8CfQH233MmxTEdvSN/gHNI9TVyqKS2ONxFd+y
         hN7ASaIAs71HORbH+MXnu6XBav8tgnbFeOugJ00BFoAowo5eOMIFw0Kps4Sc4Ca5SuUj
         CdDbXZpwa+XnDh+H+RZ5DlcYXjTfEOh6KUrZ7Eo8X8+2vXblOGBwHEvapFX0lWv/MZ7C
         Tzq/MZtv1Plrio7IxKhTuR4mGF3yy5kMKxHPxzgOoyMg4D/75tGmX2VSaMLHOGGG/Nu/
         DO4wrz3KlWJ8tnvibOMuRvMvFn4VFC9c1T7UUunKyHd1fApmlYmLmZXr6kDqN7uQXNjV
         2vuA==
X-Forwarded-Encrypted: i=1; AKwUvBwHu0jU09K6FqhS70+g9ZDYGgl/zp6dN3LIlJjhk5UblHmkgHiv3N2yqkmpmklG8RkaplZgPGk222E=@lists.xenproject.org
X-Gm-Message-State: AFuF++ktJOWBBfN82rXvmFmjefaZyvkPE8XIl4CIUiPRv9WGe4BkJTj/
	XOvXWv1V3n0jTSoPZ8DOccz1YmCZ1XUztyOdJt0v4ylKqt0YBNDTw5PJ
X-Gm-Gg: AYBFou07pS3zZZW3ZNJxCtR1SFAp3P1OaoSmWyHCqJi7qfZrqhLlZGJGN9lZNqHbBq4
	hral1Y9N+7okiU252KVijuQULbkgBeEXTvP9/8CjIwAIwTZmRD5WwO7BVOu/upsfF0A6vpsn2z+
	WoB3XefS+SPgaBB//qssiqDdyxdKyqzlGJ16SeDkEQXXkJS4/vsvd+J8l0voyhyIbSSJwFutT/e
	CbQtxVhtdLHFSa1gla3lXI9qGSmiIePFYbF5oS8LbaqZ9TIliFlEap6aYl3uFm7aFKZS9XuRwY2
	nlmWJepJOBuvJIqo32NRzk8TieB3vMDRVU7UZ+57C8IAQJAkMdSARKOpFszyabgzZGd1IK8LIQb
	mhBjMjWbJeyAgONW4tqsfR43RsP/02wlQVzntdKigTC5fu1A8WbyBUC1PcdBKi8U7g8zSExOZD4
	RscNamrC8nHYSYYZNTdg5zSp+5Y0YNJq9wcQu3xBnUmH76KMAIYGvWjyJNi7+PeMspUQR54a/Uu
	aVTIgYj4gx5WdP6OXdQciQ/BPVZ6GkikKIXk7BMtZyDw/Dr
X-Received: by 2002:a05:6000:220b:b0:487:863:253d with SMTP id ffacd0b85a97d-4870d0667d8mr1082508f8f.31.1789532178702;
        Tue, 15 Sep 2026 21:16:18 -0700 (PDT)
Message-ID: <35e5b328-2139-4ed4-a725-f4671f4239d6@gmail.com>
Date: Wed, 16 Sep 2026 06:16:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 25/39] xen/riscv: add guest load emulation for trapped
 MMIO accesses
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
 <7cf3203f8f826eefa1b24bb2dedbd76c0b611dc1.1787838835.git.oleksii.kurochko@gmail.com>
 <ec4da2d4-d1d4-40f9-a008-be6ac4d2f05f@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <ec4da2d4-d1d4-40f9-a008-be6ac4d2f05f@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1789532179-5073FA5B-CF0FD179/10/73395122804
X-purgate-type: spam
X-purgate-size: 2108



On 9/14/26 1:48 PM, Jan Beulich wrote:
> On 27.08.2026 17:21, Oleksii Kurochko wrote:
>> @@ -419,7 +416,41 @@ static __maybe_unused bool decode_ldst_insn(struct decoded_insn *di,
>>   
>>   static int emulate_load(const struct guest_fault *gf)
>>   {
>> -    return -EOPNOTSUPP;
>> +    struct cpu_user_regs *regs = gf->regs;
>> +    mmio_info_t info = { .is_write = false };
>> +    struct decoded_insn di;
>> +    unsigned int shift = 0;
>> +    int rc;
>> +
>> +    /* A fault taken re-reading the instruction is redirected to the guest. */
>> +    if ( insn_fetch_faulted(gf, &di) )
>> +        return 0;
>> +
>> +    if ( !decode_ldst_insn(&di, guest_xlen(regs)) || di.is_write )
>> +        return -EOPNOTSUPP;
>> +
>> +    if ( !di.is_unsigned )
>> +        shift = BITS_PER_BYTE * (sizeof(unsigned long) - di.len);
> 
> This is one of the cases where sizeof(<type>) is not only unclear to
> read, but actively risky: Which variable(s) of that type does this
> refer to? What if those variable(s)' type(s) change? Aha, ...
> 
>> +#ifdef EMULATE_LOAD_DEBUG
>> +    gdprintk(XENLOG_DEBUG, "pc=%#lx, addr=%#"PRIpaddr", len=%u, shift=%u\n",
>> +             regs->sepc, gf->gpa, di.len, shift);
>> +#endif
>> +
>> +    rc = do_mmio(&info, gf->gpa, di.len);
>> +    if ( rc )
>> +        return rc;
>> +
>> +    /*
>> +     * A load into x0 discards its result: writing regs->zero would break the
>> +     * invariant that it reads as zero when x0 is a source operand elsewhere.
>> +     */
>> +    if ( di.reg )
>> +        *guest_gpr(regs, di.reg) = (long)(info.data << shift) >> shift;
> 
> ... you apparently mean sizeof(info.data) there.

Good point. I will try to follow such approach in future and use the 
variable name instead of a type.

> 
> The comment is (nit) also too long for my taste. Everything from the
> colon onwards is imo redundant.
Probably you are right. It is a little bit obvious just from the 
defintion of x0 that it should be always zero. I will drop that part of 
the comment after the colon.

THanks.

~ Oleksii

