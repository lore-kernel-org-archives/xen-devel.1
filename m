Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB9EFC88E5C
	for <xen-devel@archiver.kernel.org>; Wed, 16 Sep 2026 04:53:38 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1422305.1647757 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x6he2-0000sw-VC; Wed, 16 Sep 2026 04:53:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1422305.1647757; Wed, 16 Sep 2026 04:53:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x6he2-0000sp-S5; Wed, 16 Sep 2026 04:53:18 +0000
Received: by outflank-mailman (input) for mailman id 1422305;
 Wed, 16 Sep 2026 04:53:18 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x6he1-0000sj-UG
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2026 04:53:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x6hdz-0015HF-8H
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2026 06:53:15 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aaa20b7-2eae-0a2a0a5409dd-0a2a450cc47c-10
 for <xen-devel@lists.xenproject.org>; Wed, 16 Sep 2026 06:53:15 +0200
Received: from [74.125.225.76] (helo=mail-wr2-f12.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aaa20ba-f479-0a2a450c0019-4a7de14c971f-3
 for <xen-devel@lists.xenproject.org>; Wed, 16 Sep 2026 06:53:15 +0200
Received: by mail-wr2-f12.google.com with SMTP id
 ffacd0b85a97d-48434392b02so286294f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 15 Sep 2026 21:53:15 -0700 (PDT)
Received: from [10.250.112.129] (h-213.61.72.154.host.de.colt.net.
 [213.61.72.154]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4870bf27ce2sm4217567f8f.20.2026.09.15.21.53.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Sep 2026 21:53:14 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1789534394; x=1790139194; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TjovXOKrHdNzhMFRWFG1pucKmnnB4Yp77LWjlx5Rkbo=;
        b=e3UmjIillTlxAYDDCN2syzSJpB/rMbu8FowwvHjPetjPufByQqVtneMGFNWd9/at6V
         EUUhrdpJeiKJ4y1bJiZyikckPK40eArR/PBJpgccnJR1yUPPl5fcL3DNc1hQmo9lZx4j
         J4TyWNXRjgdY8UY640GTM58yRssy7qlK9Hb1p43k6witQAcizndPyYOPHbxOAFV/4GeR
         roLlXDvEqScgHF9z/IKzZBLIMGQA5CR31M1O3M8WnT8jYOBZ+lbh2fw+spWtNk/wZU1h
         mTkf1yQJ+MFoNNtwGLjfYMXDAILfzrCwkJZ+ee03zZgusLKM5MhY3B1BKs3InQUlcqvB
         Tt6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789534394; x=1790139194;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TjovXOKrHdNzhMFRWFG1pucKmnnB4Yp77LWjlx5Rkbo=;
        b=zw/sLSSLx0UlMRfzVtaGrWypW/xbnN085h4SFytgHwOfFQmCvTgsrCoE8gxxH8rHxp
         3LAG8/DhVypfe7nh3sI6SR4wenL+rrffidQ7lWJ3/KXgdURZuMpguoDoqloDb+CAxJ36
         a/MI42cUK1m1H7F+bjPWLbPqchMR6nspYHRyJa90Cb3sc9Te0c3v9rTTLMdWnYyWwqYr
         7Dwiw+EB3si/iw/PipHvLhuQX/l8QsQr6L6135FW7+tf/lIt3q2OuNEfV5GB0c1Btg+7
         8AyrgokLdXmeBtHoRheg66O9HudQKqHjCyABvTTXCsWCKpc7yZ6/se+TBiBdrOSwUaxV
         VEmg==
X-Forwarded-Encrypted: i=1; AKwUvBxF2GDTxamQi2tz9/QOt77hlFXlk7LpMALwxMYe9J1ISTqUHu7BFX0HBpuuyuQr7nvwmu3yLoG9U5M=@lists.xenproject.org
X-Gm-Message-State: AFuF++mMUTfMhLFlrgq0eGUsfqZBcQtc4lVnkq6U9FI9/n8LJEqppAfM
	jOz6XAzXQilLf6ShFxHQgOoowYijyGB5kPIK+ODhqK2n2v0jKUMny+69
X-Gm-Gg: AYBFou1Gqf2x6PpLokvaTs6nvUk4UjxxttDaC3dpdQB74Bscq0J9Rrb1hpdEnPtaNyV
	nuNEGnlEWwxxkkTnjCDWEqLPexhGe6mDqkgKIIQflpsrXTPO/BzlGntsCT3EoNotfDYknJZQ/Ym
	hnStxIawDOn4GzBl3hnyEzQcRsGGpmhIcxqYUZZeudIS5E1OC8ry/WOyyczwdozqLSVfQlLXGWT
	Vf0o1IjYXQ2x6ezLKRHiblgC1Tm4Q0S6/c1+ky+pH0LWWZF1taFavl3EaANbKdV2OQjGUvzZiob
	W8poApcamPd0QQ5dCrL/+to4UW/18lCFZGPdjP2Dfdgq26uuiuFR8KCi5OZ2s7lREOZ9y1sHp6I
	ICCkV287y4q9enyrKL8tOP7AWsISJwUyBN8vwhqsHNGrqhjcOnSBtFXHeQFVphx0clZzIhxWGmH
	w3m4xIGImBeN0FsyCJd4luLukTD4+8dEEOeivPWjxHfCzNVOPuOBS99uwWaSRWoOF71idIZfLAM
	AwIsglIUcCSZw6TdjMwEhVKsoge/D92cNvAw4JkwrvBODD5
X-Received: by 2002:adf:e00a:0:20b0:487:bef:31cb with SMTP id ffacd0b85a97d-4870d05afb7mr1667397f8f.22.1789534394565;
        Tue, 15 Sep 2026 21:53:14 -0700 (PDT)
Message-ID: <900ec227-8960-4033-90f1-054180ad56b3@gmail.com>
Date: Wed, 16 Sep 2026 06:53:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 26/39] xen/riscv: add guest store emulation for trapped
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
 <230c35550edff0b2b8480b6728614305951fe5cd.1787838835.git.oleksii.kurochko@gmail.com>
 <9d4600c6-258e-4990-b1f1-3c86037227b3@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <9d4600c6-258e-4990-b1f1-3c86037227b3@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1789534395-77ED2A5B-1453FC1B/10/73395122804
X-purgate-type: spam
X-purgate-size: 2986



On 9/14/26 2:01 PM, Jan Beulich wrote:
> On 27.08.2026 17:21, Oleksii Kurochko wrote:
>> --- a/xen/arch/riscv/emulate.c
>> +++ b/xen/arch/riscv/emulate.c
>> @@ -453,9 +453,28 @@ static int emulate_load(const struct guest_fault *gf)
>>       return 0;
>>   }
>>   
>> -static int emulate_store(struct guest_fault *gf)
>> +static int emulate_store(const struct guest_fault *gf)
>>   {
>> -    return -EOPNOTSUPP;
>> +    struct cpu_user_regs *regs = gf->regs;
>> +    mmio_info_t info = { .is_write = true };
>> +    struct decoded_insn di;
>> +    int rc;
>> +
>> +    if ( insn_fetch_faulted(gf, &di) )
>> +        return 0;
>> +
>> +    if ( !decode_ldst_insn(&di, guest_xlen(regs)) || !di.is_write )
>> +        return -EOPNOTSUPP;
>> +
>> +    info.data = *guest_gpr(regs, di.reg);
> 
> This came to mind only here, but applies to the earlier patch as well:
> There's no checking of di.len, not even by an assertion. The above is
> fragile as to extensions like Zilsd. Zilsd itself may still be okay as
> the overrun of the register field will hit the correct one, but the
> general concern remains (plus of course that moving across fields is
> UB).

Nothing can produce di.len > sizeof(register_t) today, as the 8-byte 
cases are all gated on xlen == 64, so I'd add the assertion at the point 
where the lengths are assigned, covering both emulate_load() (where the 
shift calculation would underflow) and emulate_store() at once:
   ASSERT(di->len <= sizeof(register_t));
right before decode_ldst_insn()'s final "return true".

Probably it makes sense to have just "if (di->len >= sizeof(register_t) 
)" with the comment and then return false in deocde_lst_insn():

+    /*
+     * An access wider than a register could not be carried through: the
+     * register operand guest_gpr() hands out is register_t-wide, as is the
+     * value an emulated access moves. None of the encodings above yields
+     * such an access, the 8-byte ones all being gated on XLEN=64, but a
+     * future extension might (Zilsd, say, whose 8-byte accesses exist 
for a
+     * 32-bit guest).
+     */
+    if ( di->len > sizeof(register_t) )
+        return false;

(i think that the same could be also true for D and Zdinx but I will 
mention only Zilsd as an example)

Also, I think it make sense to add the comment to guest_gpr() than 
di->len is checked in decode_ldst_insn(). Alternative will be to update 
the proto of guest_gpr() and pass `di` and then have extra ASSERT() in 
guest_gpr() for the case if someone will try to use guest_gpr() without 
using insn_fetch_faulted() & decode_ldst_insn() before guest_gpr().
I will apply this alternative way, it looks to me better for now and 
then will add the following ASSERT:

     /*
      * decode_ldst_insn() is what fills @di in, and it rejects an access
      * wider than a register.
      */
     ASSERT(di->len <= sizeof(register_t));

Thanks.

~ Oleksii

