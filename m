Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64BE1C982D2
	for <xen-devel@archiver.kernel.org>; Fri, 18 Sep 2026 06:02:54 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1424687.1648943 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x7Rfx-0004gQ-UO; Fri, 18 Sep 2026 06:02:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1424687.1648943; Fri, 18 Sep 2026 06:02:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x7Rfx-0004g4-PD; Fri, 18 Sep 2026 06:02:21 +0000
Received: by outflank-mailman (input) for mailman id 1424687;
 Fri, 18 Sep 2026 06:02:21 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x7Rfw-0004fy-Sd
 for xen-devel@lists.xenproject.org; Fri, 18 Sep 2026 06:02:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x7Rfv-00FdmJ-HO
 for xen-devel@lists.xenproject.org; Fri, 18 Sep 2026 08:02:19 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aacd3e1-bab6-0a2a0a5309dd-0a2a450cd050-30
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 08:02:19 +0200
Received: from [74.125.225.141] (helo=mail-wm2-f13.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aacd3eb-f479-0a2a450c0019-4a7de18dc943-3
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 08:02:19 +0200
Received: by mail-wm2-f13.google.com with SMTP id
 5b1f17b1804b1-49e620fa473so1971975e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 17 Sep 2026 23:02:19 -0700 (PDT)
Received: from [10.59.3.202] ([146.0.124.57]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fbd204c1asm126959335e9.4.2026.09.17.23.02.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Sep 2026 23:02:18 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1789711338; x=1790316138; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RSeT5yd8NdFFrVtsy5vtjDBjbSJvUp8pS8fV0GkpzDs=;
        b=ezIZyG12NqOZl6nkPeWcBUCJ96F485z2YjrgUmqGKDGQwcSV2dC3CrkbCbLxCQlLAC
         mVCB50Xa9v34m6tHuB0CLT3Dsl8IQgnqxbGz8FvCpb1ArrtA91URPkWj4qVcXnrW/HA4
         s4Nm4IDe2oyfOLM6ZQRBs8xRDow4k33/hCmbwFBIJAKXy+AouefSNBSyrXFEpw5CohdM
         g+xVaaAaRkbQqBssvxkxyYXDoLE8Ksa/YEmtyuTQWvKe+eAC1r+T/OAhxyaKvqdeF6tb
         H1ODay0zJESK+nXN4Bc6Om44VPzH3lQqA0VbsPiHuLdaVMf44OZanfdF+PbA95ih+w4S
         fSSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789711338; x=1790316138;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RSeT5yd8NdFFrVtsy5vtjDBjbSJvUp8pS8fV0GkpzDs=;
        b=u0H7+0pHTuMlb1fhdKO1W7lYgtKPpcBEQuB6XIK/BgOCxvzay47Ub22ApZUtbOaaE3
         wn2YsxMS2Zl3Q7RkRys18MTSje6QurefQ7SZfC8A5czxQ4ovCFNe+k64cPCFjvHax+fc
         Z8Obc+UcTEjTVjo/zRPygP0/BDw4lEhEaCJ/5yFRliFF7niCmHJ/O/cM9LYB3oh3LSuQ
         gi9WoNtXyNHyde/sF52WRy2FYUA92NMc46v9+ULDl0UQkoJ2BFK+sVSaM3qLFBL70Lv+
         K3WhAty7l5hsNf6SDX6gspHftyLnyr7GP7uo/T45U9k8TuY/ZHoimiNBVzR8DKigl6ry
         oS2w==
X-Forwarded-Encrypted: i=1; AKwUvByMbiw9l81qnbdw8NPGRP3kj7mjfNqKL21OUe/+R8C+lNwE8C5FhaL8OWX1vBsurHvtEcBL42JjNjI=@lists.xenproject.org
X-Gm-Message-State: AFuF++kKpMUfOAGaFIBlzO16STbsSBXnuB8bOATBFzjufr2DSU6ZPVuL
	BAegk1gGXFP4czxsItV6IJ+GMGCGmTMXIDJUW28buUMJa3Q5m/1YkrhPP6UWIHeWXg==
X-Gm-Gg: AYBFou0u1VxBeB/p0Smnmxq5dAB0QRrDw9ong2zvCIsBo+/V92gXi/1O/pWQ+LMq9xR
	ohqZElMdhAZsmFRtEaZ77iVtuBSOodFP1hJFoghFr32rCFMX7hru/0PHkHW9TXr5YpCdyZ3JKwl
	cPuppPHn8LfnW2m/JIwRbGhf5Hhdi1bzsLNAAbebciX4WlSX7euvwzitVFAv8xBqogzgVrPdcOn
	3MY6aTHN57W0OWMu7pwd1+7vyZ4YKn99o3Nl17pLgRLi5KpmY2m7C9kRZxG1Xo/iqgg2rrdL1EJ
	UWPK+HEp2Fu+kSQr3YqnIgsAMBNYRu5CicFa/NJ5J+VWlMiUP9Nb2qsIcrq7W7Cl3HybOOVHNZU
	r9fWgArTi3a0n/8g+48Jz4/LvobJY1X7fO9Vg7x30Vct/+ftIFqght1xGdI5kiIZ9hBkpBb6S9S
	OHS/BzKbbjBlNGvMUChJ2M4nw/pZtkfmvouy7xFXdrJ3DITiaHvhprHbfGCp/yTY2nyhR3N+r5k
	Ko=
X-Received: by 2002:a05:600c:46c7:b0:49d:7fc:5dc5 with SMTP id 5b1f17b1804b1-49fc56dba6emr13377775e9.1.1789711338574;
        Thu, 17 Sep 2026 23:02:18 -0700 (PDT)
Message-ID: <d6caefc0-1cd6-48ac-a7d8-76c209f17e0c@suse.com>
Date: Fri, 18 Sep 2026 08:02:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 30/39] xen/riscv: prepare new IMSIC VS-file
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
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
 <440bc07dfb72d09da72b49ded6f78dc1f54a3ad5.1787838835.git.oleksii.kurochko@gmail.com>
 <2ea26d3b-6413-410f-9cb1-59645cf594e2@suse.com>
 <8c0855ca-7e32-4b6e-91ed-dc2e72d9693b@gmail.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <8c0855ca-7e32-4b6e-91ed-dc2e72d9693b@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1789711339-028DDA5B-2D08BFCD/0/0
X-purgate-type: clean
X-purgate-size: 7196

On 17.09.2026 16:50, Oleksii Kurochko wrote:
> On 9/14/26 3:13 PM, Jan Beulich wrote:
>> On 27.08.2026 17:21, Oleksii Kurochko wrote:
>>> +#define imsic_switchcase_break(ireg, op, v) \
>>> +    case ireg:                              \
>>> +        op(ireg, v);                        \
>>> +        break;
>>> +
>>> +#define imsic_switchcase_ret(ireg, op, ...) \
>>> +    case ireg:                              \
>>> +        return op(ireg, ##__VA_ARGS__);
>>> +
>>> +#define imsic_switchcase_2(F, ireg, ...)    \
>>> +    F(ireg + 0, ##__VA_ARGS__)              \
>>> +    F(ireg + 1, ##__VA_ARGS__)
>>
>> Ah, there is an F here.
>>
>> This (recurring below) shows another problem: The two F invocations
>> look syntacticlly incorrect, due to the missing semicolon. Semicolon
>> use wants redoing everywhere here.
> 
> I will drop then ';' from imsic_switchcase_{break,ret}.

Provided that works, i.e. you have no cae where __VA_ARGS__ expands to
nothing.

>>> +static void cf_check imsic_vsfile_local_clear(void *data)
>>> +{
>>> +    unsigned int i;
>>> +    const struct imsic_vsfile_data *idata = data;
>>> +    unsigned long new_hstatus, old_hstatus, old_vsiselect;
>>> +
>>> +    /* We can only zero-out if we have a IMSIC VS-file */
>>> +    if ( !idata->hgei )
>>> +        return;
>>
>> Wouldn't it make sense to avoid the call here altogether then?
> 
> I think it is better to have this if () here instead of the caller side 
> as this function one day could be just directly (w/ imsic_call_on_cpu) 
> and even the way how it is called now and in the case of 
> imsic_call_on_cpu() is executed on local cpu then it will be basically 
> just direct call of imsic_vsfile_local_clear(). So in the case I am not 
> missing something I prefer to have a check here.
> 
>>
>>> +    old_vsiselect = csr_read(CSR_VSISELECT);
>>
>> Likely obvious to you, but I can't spot why vsiselect would need saving
>> here. If you want me to ack such code, please add at least brief comments.
> 
> I think then it will be better to put the comment once above struct 
> imsic_vsfile_data and then just point here to that comment as basically 
> it will be needed for all imsic_vsfile_local_* helpers.
> 
> So basically I am suggesting:
> 
> --- a/xen/arch/riscv/imsic.c
> +++ b/xen/arch/riscv/imsic.c
> @@ ... @@
>   /*
>    * Arguments of the imsic_vsfile_local_*() helpers, which are executed 
> by the
>    * pCPU owning the interrupt file, thereby through imsic_call_on_cpu().
> + *
> + * The helpers interrupt whatever vCPU context is loaded on that pCPU, 
> which
> + * generally isn't the vCPU the interrupt file belongs to. To reach the 
> file
> + * they retarget hstatus.VGEIN and select the file's registers through
> + * vsiselect. Both CSRs are live state of the interrupted vCPU 
> (vsiselect is
> + * saved to struct arch_vcpu only on context switch, but the 
> interrupted vCPU
> + * may resume guest execution without one), hence the helpers have to 
> restore
> + * them before returning.
>    */
>   struct imsic_vsfile_data {
>       unsigned int hgei;
>       unsigned int nr_eix;
>       struct imsic_mrif *mrif;
>   };
> @@ ... @@ static void cf_check imsic_vsfile_local_clear(void *data)
>       /* We can only zero-out if we have a IMSIC VS-file */
>       if ( !idata->hgei )
>           return;
> 
> +    /* See the comment ahead of struct imsic_vsfile_data. */
>       old_vsiselect = csr_read(CSR_VSISELECT);
>       old_hstatus = csr_read(CSR_HSTATUS);
> @@ ... @@ static void cf_check imsic_vsfile_local_read_clear(void *data)
>       csr_clear(CSR_HGEIE, BIT(idata->hgei, UL));
> 
> +    /* See the comment ahead of struct imsic_vsfile_data. */
>       old_vsiselect = csr_read(CSR_VSISELECT);
>       old_hstatus = csr_read(CSR_HSTATUS);
> @@ ... @@ static void cf_check imsic_vsfile_local_update(void *data)
>        * stack.
>        */
> 
> +    /* See the comment ahead of struct imsic_vsfile_data. */
>       old_vsiselect = csr_read(CSR_VSISELECT);
>       old_hstatus = csr_read(CSR_HSTATUS);
> 
> 
> Does it look clear now?

Not really, I'm afraid. A much shorter comment mentioning that
imsic_..._write() alter vsiselect (if I got things right) would imo
be both more direct, more clear, and could easily live at all three
sites individually.

>>> +    old_hstatus = csr_read(CSR_HSTATUS);
>>> +    new_hstatus = old_hstatus & ~HSTATUS_VGEIN;
>>> +    new_hstatus |= MASK_INSR(idata->hgei, HSTATUS_VGEIN);
>>> +    csr_write(CSR_HSTATUS, new_hstatus);
>>> +
>>> +    imsic_vs_csr_write(IMSIC_EIDELIVERY, 0);
>>> +    imsic_vs_csr_write(IMSIC_EITHRESHOLD, 0);
>>> +
>>> +    for ( i = 0; i < idata->nr_eix; i++ )
>>> +    {
>>> +        imsic_eix_write(IMSIC_EIP0 + i * 2, 0);
>>> +        imsic_eix_write(IMSIC_EIE0 + i * 2, 0);
>>> +#ifdef CONFIG_RISCV_32
>>> +        imsic_eix_write(IMSIC_EIP0 + i * 2 + 1, 0);
>>> +        imsic_eix_write(IMSIC_EIE0 + i * 2 + 1, 0);
>>> +#endif
>>
>> In asm/imsic.h I see
>>
>> #define IMSIC_EIPx_BITS         32
>>
>> Why is the number of CSR writes different here for RV32 vs RV64? 
> 
> IMSIC_EIPx_BITS is the unit the AIA spec numbers the eip<k>/eie<k> 
> registers by. On RV32 all of eip0..eip63 exist and are 32 bits wide. On 
> RV64 only the even-numbered ones exist, each being 64 bits wide and 
> covering what eip<k> and eip<k+1> cover on RV32; accessing an 
> odd-numbered one is an illegal instruction. Hence one 64-bit group of 
> interrupt identities takes one register on RV64, but two on RV32.
> 
> I will add some small comments:
> 
>      for ( i = 0; i < idata->nr_eix; i++ )
>      {
>          /* On RV64 a 64-bit EIx group is the even-numbered register 
> alone. */
>          imsic_eix_write(IMSIC_EIP0 + i * 2, 0);
>          imsic_eix_write(IMSIC_EIE0 + i * 2, 0);
> #ifdef CONFIG_RISCV_32
>          /*
>           * On RV32 it is split into the even-numbered (low half) and the
>           * following odd-numbered (high half) register.
>           */
>          imsic_eix_write(IMSIC_EIP0 + i * 2 + 1, 0);
>          imsic_eix_write(IMSIC_EIE0 + i * 2 + 1, 0);
> #endif
>      }
> 
>> And
>> if so, why would you not use the 64-bit write function, allowing the
>> #ifdef to be omitted?
> 
> I can introduce something like:
> 
> /*
>   * On RV64 a 64-bit EIx group is the even-numbered register alone, whereas
>   * on RV32 it is split into the even-numbered (low half) and the following
>   * odd-numbered (high half) register.
>   */
> static void imsic_eix_write64(unsigned int ireg, uint64_t val)
> {
>      imsic_eix_write(ireg, val);
>      if ( IS_ENABLED(CONFIG_RISCV_32) )
>          imsic_eix_write(ireg + 1, val >> 32);
> }
> 
> And then:
> 
>      for ( i = 0; i < idata->nr_eix; i++ )
>      {
>          imsic_eix_write64(IMSIC_EIP0 + i * 2, 0);
>          imsic_eix_write64(IMSIC_EIE0 + i * 2, 0);
>      }
> 
> Would it be better?

Imo yes. That said, when making the original comment, I was (apparently
wrongly, as per the stuff further up) assuming these are direct CSR
writes.

Jan

