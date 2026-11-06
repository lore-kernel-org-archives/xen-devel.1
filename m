Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F2DC606A326
	for <xen-devel@archiver.kernel.org>; Fri,  6 Nov 2026 10:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jEdoaHvx
Received: from list by lists.xenproject.org with outflank-mailman.1476461.1682551 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xPHel-00005g-4G; Fri, 06 Nov 2026 10:58:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1476461.1682551; Fri, 06 Nov 2026 10:58:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xPHek-00005Z-WF; Fri, 06 Nov 2026 10:58:51 +0000
Received: by outflank-mailman (input) for mailman id 1476461;
 Fri, 06 Nov 2026 10:58:49 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xPHej-00005R-8T
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2026 10:58:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xPHei-00H7Ww-Dz
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2026 11:58:48 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aedb2e1-e002-0a2a0a5209dd-0a2a4506ed8c-14
 for <xen-devel@lists.xenproject.org>; Fri, 06 Nov 2026 11:58:48 +0100
Received: from [209.85.128.47] (helo=mail-wm1-f47.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aedb2e8-195a-0a2a45060019-d155802fd8dc-3
 for <xen-devel@lists.xenproject.org>; Fri, 06 Nov 2026 11:58:48 +0100
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-4a210470b49so3269025e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 06 Nov 2026 02:58:48 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-65-71.play-internet.pl.
 [109.243.65.71]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b57317cae5sm206696215e9.12.2026.11.06.02.58.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Nov 2026 02:58:47 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793962727; x=1794567527; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J5hMTx45auR/a6/zrWRGnKtqZsojp9FmHaMc3jISjok=;
        b=jEdoaHvxMvR38K4INAAHhbZvHqhIsGMNROqSLZ1L8Ob3I0pAsSsL8kibgYrbBkHnRB
         BnMoVXGs/0ON+1vOnesXtxI6K081Twwm6OvfMKfLGKAGjJWMqit5VqLHDExI5S+EZw1a
         UQKFbM09MX+b7/WFl/CeC/p5sKwIgHST4yuW1Teg3357TGaQW/lttYyPF2i2Hl4RFKFY
         b8tbjiZCXl68ekWnvwQ939cpCnhRDjCbwiR/H1OxXp8Z9MWjZJMsraW/CZ7F7ILyGzAC
         uE9jd8dfpVS87m0GjetzCJVivSxqWMVVmLYlqhRVErWL5ZkEUadiGyc5MRoM1tVFDpaL
         zu9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793962727; x=1794567527;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J5hMTx45auR/a6/zrWRGnKtqZsojp9FmHaMc3jISjok=;
        b=QFRjevIPGGOBsxMPG4SA/Ail2tMFBnGPCVzdQLW5MIe0M0swHHeLiJiiUR0dj3v2gn
         JXQiU2Ft/Q4qQ1iaCbCl2g+eO0R+7Q3HkDElQWi9el09DTeh3L8N4MwTn7CQeublIaTe
         +oDGO01Ip+l0GsL+Hu9a8GEiCbW3aweRRWS7VmvhPUQOalU+HrhdbGFoxVLfSIJNnYmM
         LDguiZGWGz0TKQ5iLcJXam1oTBCvZ1HH8fZ6TSqx3CQF5tS69hkoLEh4ZUmMV0AfX13m
         vooeiI9H2HZ6L206/MutU7S4Mo+h03PtcvqjaDJyKj4RxjNaWzmqg80LgjVAvHARUqdX
         cJXA==
X-Gm-Message-State: APuU4Z9gGroeKmVrqQiu4sArACCmWhhLaEgQ3TqftYDNm7TL4Q27ZFAi
	tlOMQ+rNwAbeOBiK2mTgYRaTice9L0zThU+fXNhmIoNoEriBPJJzLAba
X-Gm-Gg: AYBFou1hXZ58MBr3kOU4NHE89j2mTIVto2vtG87xWROvH1JmhapRmKEyNmVDp7sgly2
	c4BA3Sv5HY5OGga65MCFYnINtDMwGRAKoIF3UhjBnUqmarXEzDdvnR+q9LMkgoLTh3CFNMxA3c5
	ZKIS+9mrh/HyyBB6n+QQ9LMRIhiiPaCQHNdPu5v+tZCo5Z+6s30XaFxj3ZA4sUH4ro/wTu4jxVG
	rXB3nlCHAxh8JxHPhchcOz7wsUAPk6+0UYGxkPtnkMOzPMeVNoroLiebyY/BoUj0MOLsEqhksjy
	asSTcs0IEtiIQ6o4yMR2u+KkQgDDwN7aCOzoWorBtX9wK+k27v1lUq1IYpQlu3+mSLXSuS9i8AU
	coFR8L45b/lN1wsYzLhhN/FvJ3vBYOshBRkl3bKkt5F9wJZHj/6FyNftdGFgVShNvCyLHCXkcyM
	3khG1EWsLibXvAm6sT/+oHb/W9QHTocsVgiM/WZqyFNb1PxUyRuyU0db13RMEKdSgIYF78OJlj9
	501ORAguTxYZENKQGTDfl8+fC5c/9LEKJkWf2A+hqdkr5IFiyGhr2OpnGPpEHTqSUUbBRb+JKVu
	yuCNce7CqFTYG31br2OJFC4tDlJ6/AsvDsxH7yyKnDf2gKQgdWcKpNRb39PHJtyMplDH/LspW0S
	vAjmGYEzIpA8pNWDVc13uHgg=
X-Received: by 2002:a05:600c:314f:b0:4a2:a9:ed5a with SMTP id 5b1f17b1804b1-4b6dddeea72mr34741915e9.8.1793962727508;
        Fri, 06 Nov 2026 02:58:47 -0800 (PST)
Message-ID: <41f3a77d-0fda-4f43-adb8-27fc2d92b57f@gmail.com>
Date: Fri, 6 Nov 2026 11:58:44 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 35/39] xen/riscv: wake up a descheduled vCPU on a guest
 external interrupt
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
 <4e78b90482e23b049774eb00b19422d8c147970a.1790779209.git.oleksii.kurochko@gmail.com>
 <1793788661.8631fc262581453bbf619ec5b2062170.1a1a622ce02000403d@vates.tech>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <1793788661.8631fc262581453bbf619ec5b2062170.1a1a622ce02000403d@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1793962728-FE87577B-28B0C161/10/73395122804
X-purgate-type: spam
X-purgate-size: 6994
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/4/26 11:37 AM, Baptiste Le Duc wrote:
>> While a vCPU is running, MSIs written to its h/w IMSIC guest interrupt
>> file are delivered straight to VS-mode. Once the vCPU is descheduled
>> nobody observes that file anymore, so a guest blocked on such an
>> interrupt would stay blocked until some unrelated event happens to
>> schedule it again.
>>
>> Let Xen observe the file in that window: on deschedule set the vCPU's
>> bit in HGEIE, which turns an interrupt pending in its VS-file into an
>> HS-level SGEI, and clear the bit again on schedule-in. HGEIP only
>> reports an interrupt file number, so to find the vCPU to kick, keep a
>> per-pCPU owners[] array indexed by file number and updated in
>> vgein_assign()/vgein_release() together with the VGEIN bitmap. The SGEI
>> handler clears the HGEIE bits it has seen before kicking their owners,
>> so that the interrupt doesn't keep firing until the vCPU is switched in.
> 
> Please explain why this is enough for a descheduled
> vCPU to never miss a wake-up: an interrupt pending in a VS-file always
> shows up in HGEIP, but it reaches VS-mode only if hstatus.VGEIN selects
> that file, and traps to Xen as an SGEI only if the file's HGEIE bit is
> set. While the vCPU is descheduled, HGEIE is therefore Xen's only way to
> notice it. And as HGEIP reflects the file's current state rather than
> being latched, an interrupt which arrived before the bit got set still
> raises the SGEI once it is.

Will add, thanks.

>> [ ... 49 lines skipped ... ]
> 
>> --- a/xen/arch/riscv/aia.c
>> +++ b/xen/arch/riscv/aia.c
>> @@ -18,6 +18,13 @@ struct vgein_ctrl {
>>       /* The least-significant bits are implemented first, apart from bit 0 */
>>       unsigned long bmp;
>>       spinlock_t lock;
>> +    /*
>> +     * Guest interrupt file IDs run from 1 to geilen inclusive (0 means that
>> +     * no guest external interrupt source is selected), and geilen can never
>> +     * exceed BITS_PER_LONG - 1, so indexing this array by the ID directly
>> +     * always fits.
>> +     */
>> +    struct vcpu *owners[BITS_PER_LONG];
> 
> It looks like owners[] already carries the information bmp provides.
> Couldn't we drop bmp and use owners[] alone, with owners[i] == NULL
> meaning that file i is free? That would avoid having to keep the two in
> sync, and vgein_release() could then check ASSERT(owners[id] == v)
> rather than just that the bit was set. A linear scan over 1..geilen in
> vgein_assign() should be fine given geilen < BITS_PER_LONG.
> 
> If you agree, it would probably be cleaner to introduce owners[] in
> place of bmp in the earlier "add basic VGEIN management" patch, rather
> than adding bmp there and replacing it here.

It would work, but I'd rather keep bmp: it's updated together with
owners[], under the same lock, in vgein_assign() and vgein_release()
only, so there isn't much to keep in sync. It also keeps the state of
all the files in a single word, so a free VGEIN ID is found with a
single find_next_zero_bit() rather than by iterating over owners[] (but 
I could agree that likely not a big win), and the debug output can print 
it as is.

The stronger check in vgein_release() is a good idea regardless, so I'll
add ASSERT(vgein->owners[vgein_id] == v) here.

>> [ ... 26 lines skipped ... ]
>> +
>> +void hgei_interrupt(void)
>> +{
>> +    unsigned long hgei_mask, flags;
>> +    struct vgein_ctrl *vgein = &this_cpu(vgein);
>> +
>> +    hgei_mask = csr_read(CSR_HGEIP);
>> +    hgei_mask &= csr_read(CSR_HGEIE);
>> +
>> +    csr_clear(CSR_HGEIE, hgei_mask);
>> +
>> +    spin_lock_irqsave(&vgein->lock, flags);
>> +
>> +    /*
>> +     * Bit 0 of HGEIP/HGEIE is read-only zero: guest interrupt file ID 0
>> +     * means that no guest external interrupt source is selected.
>> +     */
>> +    ASSERT(!(hgei_mask & 1));
> 
> Is this ASSERT() really needed? Bit 0 of HGEIP/HGEIE is read-only zero
> per the spec, and vgein_init() already relies on that when computing
> geilen. Even if it were ever reported, owners[0] is never assigned, so
> the loop below would simply skip it.

Agreed, lets drop it.

>> [ ... 35 lines skipped ... ]
>> --- a/xen/arch/riscv/imsic.c
>> +++ b/xen/arch/riscv/imsic.c
>> @@ -555,12 +555,37 @@ void cf_check imsic_ctxt_switch_from(struct vcpu *p)
>>   
>>       write_lock_irqsave(&imsic_state->vsfile_lock, flags);
>>       imsic_state->vsfile_cpu = p->processor;
>> +    /*
>> +     * Start to observe the VS-file from HS-mode: while the vCPU isn't
>> +     * running an interrupt pending in its VS-file is reported through HGEIP
>> +     * instead of being delivered to VS-mode, which lets Xen wake the vCPU up.
> 
> "instead of" reads as if HGEIP only reports it while the vCPU isn't
> running. It always does; what changes is that VGEIN no longer selects
> the file and the HGEIE bit set below turns it into an SGEI.
> 

Right, I'll reword it accordingly.

>> [ ... 29 lines skipped ... ]
>>   int imsic_map_guest_file(struct vcpu *v, unsigned int vsfile_id)
>> @@ -695,6 +720,12 @@ static void cf_check imsic_vsfile_local_read_clear(void *data)
>>       struct imsic_mrif *mrif = idata->mrif;
>>       unsigned long new_hstatus, old_hstatus, old_vsiselect;
>>   
>> +    /*
>> +     * The HGEIE bit imsic_ctxt_switch_from() armed belongs to the old owner
>> +     * only.
>> +     */
> "Old owner" is ambiguous: it reads like another vCPU, but it's the same
> vCPU on the file it is leaving. To mirror imsic_local_hgeie_set(), I'd
> rather have an imsic_local_hgeie_clear() called from here, documenting
> the pairing the same way, e.g.:
> 
> /*
>   * Stop observing an interrupt file which a vCPU leaves when it moves to
>   * another pCPU by clearing the bit imsic_ctxt_switch_from() set.
>   *
>   * Counterpart of imsic_local_hgeie_set() for the new file.
>   */
> 
> In that case ...
>> +    csr_clear(CSR_HGEIE, BIT(idata->hgei, UL));
>> +
>>       /*
>>        * The file is reached by retargeting hstatus.VGEIN, and
>>        * imsic_vs_csr_swap() alters vsiselect. Both belong to the vCPU running
>> @@ -1044,6 +1075,21 @@ int __init vimsic_make_domu_dt_node(struct kernel_info *kinfo,
>>       return fdt_end_node(fdt);
>>   }
>>   
>> +/*
>> + * Start to observe the interrupt file from HS-mode, the same way
>> + * imsic_ctxt_switch_from() does it for a vCPU which is switched out.
>> + *
>> + * The counterpart, clearing the bit of the interrupt file which is left
>> + * behind, is done by imsic_vsfile_local_read_clear(), which already runs on
>> + * the pCPU owning that file.
>   ... this wouldn't be needed at all.
> 

Agreed, I'll introduce imsic_local_hgeie_clear() next to
imsic_local_hgeie_set(), with your comment. It'll take the file number
rather than void *, though, as it's called directly from
imsic_vsfile_local_read_clear() and not through imsic_call_on_cpu().

~ Oleksii

