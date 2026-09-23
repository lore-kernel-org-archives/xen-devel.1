Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FD31C9830B
	for <xen-devel@archiver.kernel.org>; Wed, 23 Sep 2026 16:09:09 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1431005.1653404 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9PWi-0004B5-9K; Wed, 23 Sep 2026 16:08:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1431005.1653404; Wed, 23 Sep 2026 16:08:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9PWi-0004Ay-6X; Wed, 23 Sep 2026 16:08:56 +0000
Received: by outflank-mailman (input) for mailman id 1431005;
 Wed, 23 Sep 2026 16:08:55 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x9PWh-0004Ap-AH
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 16:08:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x9PWg-003bvo-NQ
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 18:08:54 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ab3f97b-8faa-0a2a0a5109dd-0a2a450c8026-28
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 18:08:54 +0200
Received: from [74.125.225.140] (helo=mail-wm2-f12.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ab3f996-f479-0a2a450c0019-4a7de18cfc9d-3
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 18:08:54 +0200
Received: by mail-wm2-f12.google.com with SMTP id
 5b1f17b1804b1-49b912d37b5so6781305e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 09:08:54 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-71-234.play-internet.pl.
 [109.243.71.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fe1432362sm39142135e9.1.2026.09.23.09.08.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Sep 2026 09:08:53 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1790179734; x=1790784534; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZQiZ1ZDIfeSLUCok3ByEnxinfDfMblBOQQ17P/nhpH8=;
        b=N2M80tAEYT8KZpKJUV1EZQcq6ZPBGg804H+4Lb1MHzW2+n/28TeYCvPLkFERP+VOKv
         q9AqZn5huz0nY6UujWj2p/RXYGjhfbHbgUlBE46zuTR38Lri7hWYkoUxAtAsTFqgwcsZ
         wBKMop7dheZHeoPgK25zcGDxyMIgV/ejsm52sTqY0F7NHR0ZeKlLkEhet6rFc/we4Ju7
         sshug0wU4NA+tfFt0yISMQYJfWXXcztqLb4h5/jk9ELiFUNyqrmXwxvC7g36ZfH+yE9a
         43Ty+DDYNpK7eDZu5ecl+AYZ9AxmWBN+uLGhLjVfJUP4+qnPevvlkhqHvk+slzRgNZT6
         gX2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790179734; x=1790784534;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZQiZ1ZDIfeSLUCok3ByEnxinfDfMblBOQQ17P/nhpH8=;
        b=qaisQSEkr2WSoVSD52YDkG02CktZE/9rbAlrd7KohVBbJ1B222gAp4fs/B6rHdRMdo
         XIVlvQr7zhrhVsatS6lGNPnVbjWugLmUYqI9SWk3+gc2a/bqVYdhY+J81FUWTqq0wAE5
         nnYU65ccTx01PyDYHw/G5hTMxqPchZ59eP43N1c0kap9/dsuaJyCbPXsl1b1pLWFXUPt
         4wsI4gZBDZChpT5dyp12JD67o8P/pKUU7QGNHyAwyVdEiuaLdQGxvy+jdzN4RuoEl+GC
         Z1tMvA8q195gxHi8uxGw6qJGVzxlRKmjj1lljDMjYZE9i3+7uUZJ2CWgTCYXR5ZsaJl4
         79Tg==
X-Gm-Message-State: AFuF++ml9Bvidpq8lkCy/B/Duc2MnwkDN0QS9vD7lKegsLfhGvyGLfpW
	nooXHxtmBJEQD0eJLIdIBbACoQrhWepkGKubkfhHOrEbK2cVNJlZxS6Y
X-Gm-Gg: AYBFou3EZUdXVmDTlijzDaUGerKPYtezBjv+yNDc3i/fFexa+ITBoEPGZWvrzOQtDa1
	ATdIE5ZNsjClwJVeX8hOpuzbw0F000XbW43ws6Y/dwj3CPvpWW/zwu73wnPxqoYzqYJqBUFRlLt
	5yLGRVkeeI8qylP2g1m59QWiEcDrsx8TFgg5IxYtavcIY4xr+ER8+bHaO8GWWLiSWm5A3qScZCS
	t/d6OqIyzKCgfD2NP5hE2urFqIaC51glVNxcVoR5ZecyisYH/xxZPGomRL5lNblvfHKtqsqIF8s
	JO4cFxoiDxFESP0yYdITjGc93WQ8Gg6XocGNNZv7s+8Wcyo9srZu8ERfm9lClTmjZi164YLa4CR
	Xoflr6TF/OF1MuS3mNfkY4ZB8ZSNWISlDkehqOjnClrzTRcb+3VUyKcnn78ng2Yq6qlCl7pUWMX
	QCUvVtAGa4uI9uUbQ+J8iYRanGd+k/Acm3N/uPEJ+yqomKa8MmN3FjoWtRmBOrY1Q0qn3F/IKkf
	iQ01y7UZm+F90R0Rn/TwT6q8ye//HOPczDVGzHXCX79QWQI0tG8RY6rigNH
X-Received: by 2002:a05:600c:3b84:b0:49c:ff8d:b548 with SMTP id 5b1f17b1804b1-49fdecd5957mr54289585e9.11.1790179734061;
        Wed, 23 Sep 2026 09:08:54 -0700 (PDT)
Message-ID: <5798db51-1f8a-4ac2-b2e1-57ca07361479@gmail.com>
Date: Wed, 23 Sep 2026 18:08:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 34/39] xen/riscv: restore register state in the new
 IMSIC VS-file
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
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
 <c7000473af04e618a340270398fb85fffb46ca05.1787838835.git.oleksii.kurochko@gmail.com>
 <1790178185.8631fc262581453bbf619ec5b2062170.1a0ceef50f800072c4@vates.tech>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <1790178185.8631fc262581453bbf619ec5b2062170.1a0ceef50f800072c4@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1790179734-76ADCA5B-7E192520/10/73395122804
X-purgate-type: spam
X-purgate-size: 4341



On 9/23/26 5:42 PM, Baptiste Le Duc wrote:
>> At this point, all interrupt producers have been moved to the new
>> IMSIC VS-file so we move register state from the old IMSIC VS/SW-file
>> to the new IMSIC VS-file.
>>
>> As new IMSIC VS-file is ready to be used update vCPU's hstatus with
>> new VGEIN.
>>
>> As the whole migration procedure is finished add some extra explanatory
>> comments.
>>
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>
>> diff --git a/xen/arch/riscv/imsic.c b/xen/arch/riscv/imsic.c
>> index 3cba58e0c1..d7b137a1f5 100644
>> --- a/xen/arch/riscv/imsic.c
>> +++ b/xen/arch/riscv/imsic.c
>> @@ -112,6 +112,12 @@ do {                            \
>>       r_;                             \
>>   })
>>   
>> +#define imsic_vs_csr_set(c, v)      \
>> +do {                                \
>> +    csr_write(CSR_VSISELECT, (c));  \
>> +    csr_set(CSR_VSIREG, (v));       \
>> +} while ( 0 )
>> +
>>   #define imsic_vs_csr_write(c, v)    \
>>   do {                                \
>>       csr_write(CSR_VSISELECT, (c));  \
>> @@ -185,6 +191,19 @@ static void imsic_eix_write(unsigned int ireg, unsigned long val)
>>       }
>>   }
>>   
>> +static void imsic_eix_set(unsigned int ireg, unsigned long val)
>> +{
>> +    switch ( ireg )
>> +    {
>> +    imsic_switchcase_64(imsic_switchcase_break, IMSIC_EIP0,
>> +                        imsic_vs_csr_set, val)
>> +    imsic_switchcase_64(imsic_switchcase_break, IMSIC_EIE0,
>> +                        imsic_vs_csr_set, val)
>> +    default:
>> +        ASSERT_UNREACHABLE();
>> +    }
>> +}
>> +
>>   unsigned int vcpu_guest_file_id(const struct vcpu *v)
>>   {
>>       return ACCESS_ONCE(v->arch.vimsic_state->guest_file_id);
>> @@ -630,13 +649,13 @@ static void cf_check imsic_vsfile_local_read_clear(void *data)
>>       old_vsiselect = csr_read(CSR_VSISELECT);
>>       old_hstatus = csr_read(CSR_HSTATUS);
>>       new_hstatus = old_hstatus & ~HSTATUS_VGEIN;
>> -    new_hstatus |= ((unsigned long)idata->hgei) << HSTATUS_VGEIN_SHIFT;
>> +    new_hstatus |= MASK_INSR(idata->hgei, HSTATUS_VGEIN);
> 
> 
>>       csr_write(CSR_HSTATUS, new_hstatus);
>>   
>>       /*
>> -     * There is no need to use atomic functions version to store
>> -     * values in MRIF because imsic_vsfile_read_clear() is always called
>> -     * with pointer to temporary MRIF on stack.
>> +     * No atomic accessors are needed to store the values into the MRIF here,
>> +     * as imsic_vsfile_read_clear() is always called with a pointer to a
>> +     * temporary MRIF on the stack.
>>        */
> 
> 
>>   
>>       mrif->eidelivery = imsic_vs_csr_swap(IMSIC_EIDELIVERY, 0);
>> @@ -972,6 +991,49 @@ int __init vimsic_make_domu_dt_node(struct kernel_info *kinfo,
>>       return fdt_end_node(fdt);
>>   }
>>   
>> +static void cf_check imsic_vsfile_local_update(void *data)
>> +{
>> +    unsigned int i;
>> +    struct imsic_mrif_eix *eix;
>> +    const struct imsic_vsfile_data *idata = data;
>> +    struct imsic_mrif *mrif = idata->mrif;
>> +    unsigned long new_hstatus, old_hstatus, old_vsiselect;
>> +
>> +    /* We can only update if we have a HW IMSIC context */
>> +    if ( !idata->hgei )
>> +        return;
>> +
>> +    /*
>> +     * No atomic accessors are needed to read the values out of the MRIF here,
>> +     * as this is always called with a pointer to a temporary MRIF on the
>> +     * stack.
>> +     */
> idata->mrif may point anywhere, so what the comment really states is a
> requirement on callers. It also only makes full sense next to KVM, where
> a shared SW-file MRIF is accessed atomically; Xen has neither of those
> (yet). Either explicitely explain that callers must declare mrif on
> their stack or move the comment directly in call sites.

It is mentioned in the comment "is always called with a pointer to a 
temporary MRIF on the stack.".

With SW-file MRIF I expect that atomic operations should be used so this 
functions shouldn't just use for them and I assume KVM has something 
different function to work with SW-file MRIF. Anyway just mentioning KVM 
code isn't always useful as it forces me to go and investigate what is 
going on there what I am not fully convinced that it is okay...

~ Oleksii



