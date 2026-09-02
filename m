Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAD21C61DD6
	for <xen-devel@archiver.kernel.org>; Wed,  2 Sep 2026 11:42:49 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1405688.1639135 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1jML-0005gP-Hy; Wed, 02 Sep 2026 11:42:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1405688.1639135; Wed, 02 Sep 2026 11:42:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1jML-0005gI-FH; Wed, 02 Sep 2026 11:42:29 +0000
Received: by outflank-mailman (input) for mailman id 1405688;
 Wed, 02 Sep 2026 11:42:27 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x1jMJ-0005gC-IY
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 11:42:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x1jMI-00GQke-Fb
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 13:42:26 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a980b98-2eae-0a2a0a5409dd-0a2a450bcaa0-40
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 13:42:26 +0200
Received: from [209.85.221.48] (helo=mail-wr1-f48.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a980ba2-b7e8-0a2a450b0019-d155dd30b8c1-3
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 13:42:26 +0200
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-482dbe4d247so404826f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 04:42:26 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48448e80798sm5596742f8f.13.2026.09.02.04.42.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Sep 2026 04:42:24 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1788349346; x=1788954146; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0WowKxW3bbcijsWVk1Eln6Ny83EI/o2GQF6xiAhpT1s=;
        b=Gz05Y2LDu9x5+J/CmLL8jnpNvIck4MsMCDjqPGgZdYec9hIVYdGfDGdPyk662w1/MJ
         g57MRY1G/vkP9W4tSf1w2sU3oeWh6ZkPOvQDn2MtJEINBSQDFQp4tYt8KUg1GI9Xcb9T
         1Vg+tkKCpZdU/aUzyQu7gFISyb9JpgQ0adwzm+rWZcZUZ+rhp9Mu50ZKI2Oo46D6g9Du
         k9suSogPW4CIVtjioB91CVDfOuDaBcKJTfcwHmuVdELUck343ipz6IGQKONS48BuQ/2l
         2WBhCKdUN0KD4p605RupEhFC5gbTVsukA7KJJoimYTs4r3oPLkXM0NE0U/Ldq7Apyois
         vKZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788349346; x=1788954146;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0WowKxW3bbcijsWVk1Eln6Ny83EI/o2GQF6xiAhpT1s=;
        b=gC0bW5AKn/E02/jmCgVzU2kODIXINDFwZkeL2gihRutZB8B/hd8mHLq9q/glvdr8hC
         i2cvHV0Z3Bg1FerJEnXQejhenMeojR2BuHnIUxOzVfoWfCuUOptSS1sAeiVpk6NtKlLP
         hdBFyVaGL0Rl5E7V1w+8Jjf616+yJmtbnn8KNR28YHxlhK7GLA+0DbUKf6g+Hi4SP6mO
         yVsMUPiE+6mIZF5DF/gUJBvaKc/IY0JPOgBAz4iW/dsDAqAGXaU5Qyx6alFa8kzcuSC5
         +H6fZnDMeixkAyajbCTtbmaLWmlDtBj7oeDW7YtSSpUYu86Fs9ul/ApxC0HumBCvwaiR
         tGAQ==
X-Forwarded-Encrypted: i=1; AKwUvByiM25oSjSfslUj9LNvaPRcXlK19UdBHNlDkJDB+IYvBlF8+NiFM/7A68QEh+HyBsVTyDTbOKqr3Bo=@lists.xenproject.org
X-Gm-Message-State: AFuF++miUCVklQzW7QheoXc+cSPeg1N5XueWqANlPegdJH0yeomQeshF
	YxkRvSEljRbp0YnOLBXtyxtsY3wMMrOdmapJRHbIzS9sSGVQRp+Ni5Ge
X-Gm-Gg: AYBFou31mGANGSgnRWxYkbNIC952cj1+/qvJfU7M63U97ZE3FSJq0GTRcz45C/bMj92
	khmFfcT3USUObTZHKENxMPqZV2UWszwNasYFjK9rdv10X/+gRkmY6BsYAXJZASEvB4AyIysauCL
	LN13eJNP3o3RcdWmnqHfOhyNETHYJbO4D398AS4GApsxA9oDN6w0XyCOnQqv0ppjapZI+gl08cb
	ht4EWAKX20fwaOdfOxEimQdINYARf/0Z9BYq+AguTZNwlk/XoDFaRNY1kSg+0PaA704mzYnrHsM
	aOzj7Kk6SatM1DuiRHLDMq+t+Uk/ymKUurI3xcqQoAjTNh29ihng3YhA8Ik9mzjZLAzW099v2PY
	01eR6u/GjNz+9EwPBnH99iN+hWY3T/zXJrPwOKB5wrXkuW90ZrXapENBflvbMaYmBpeRQuVQ+F4
	zoZ89gUwNzdofd0uFK7ZbD+eY/StLTsnUk/URElCHLBrRGclYM5zhWaz3LZMJnNtY4grNy36Szk
	2adREIQm1P4+HCAZywVmZV0CdNdyjrLOhkVJlyVSQ==
X-Received: by 2002:a05:6000:250c:b0:484:3310:c4fc with SMTP id ffacd0b85a97d-48488f24193mr7778463f8f.23.1788349345634;
        Wed, 02 Sep 2026 04:42:25 -0700 (PDT)
Message-ID: <127e8aea-4d65-492e-8bda-bffc75f02481@gmail.com>
Date: Wed, 2 Sep 2026 13:42:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/39] xen/riscv: set the guest's XLEN explicitly in
 hstatus.VSXL
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
 <a3ae79823e24f2e18cef2fac8ffffe7caa608f32.1787838835.git.oleksii.kurochko@gmail.com>
 <825ea854-5778-4cb6-a9a9-0ff97fa7bee5@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <825ea854-5778-4cb6-a9a9-0ff97fa7bee5@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1788349346-184CB9EA-4F42F88B/10/73395122804
X-purgate-type: spam
X-purgate-size: 3269



On 9/1/26 5:20 PM, Jan Beulich wrote:
> On 27.08.2026 17:20, Oleksii Kurochko wrote:
>> --- a/xen/arch/riscv/domain.c
>> +++ b/xen/arch/riscv/domain.c
>> @@ -88,7 +88,13 @@ static void vcpu_csr_init(struct vcpu *v)
>>   {
>>       v->arch.hedeleg = HEDELEG_DEFAULT & csr_masks.hedeleg;
>>   
>> -    vcpu_guest_cpu_user_regs(v)->hstatus = HSTATUS_SPV | HSTATUS_SPVP;
>> +    /*
>> +     * Xen supports 64-bit guests only, so set the guest's XLEN explicitly
>> +     * rather than leaving it to the WARL behaviour of hstatus.VSXL, which the
>> +     * decoding of a trapped instruction depends on.
>> +     */
>> +    vcpu_guest_cpu_user_regs(v)->hstatus =
>> +        HSTATUS_SPV | HSTATUS_SPVP | MASK_INSR(HSTATUS_VSXL_64, HSTATUS_VSXL);
> 
> The comment is correct right now, but the situation better would change
> at some point. Can't you arrange for things to be correct here also for
> a future where 32- and 128-bit guests would also be supported?

I am not sure about 128-bit guests as H extension is dependent on RV32 
or RV64 but probably it will be changed:
```
The hypervisor extension depends on an "I" base integer ISA with 32 x 
registers (RV32I or RV64I), not RV32E or RV64E, which have only 16 x 
registers.
```

I will introduce the following (also it will be needed also to check if 
we could VSXL set at all as implmentation can make that field read-only 
and do VSXLLEN=HSXLEN):

/*
  * Return the hstatus.VSXL value encoding the guest's XLEN. The switch()
  * deliberately has no default case, so that adding a new domain_type (a
  * 128-bit one, in particular) fails to build until this mapping is 
updated.
  */
static unsigned int domain_vsxl(const struct domain *d)
{
     switch ( d->type )
     {
     case DOMAIN_32BIT:
         return HSTATUS_VSXL_32;

     case DOMAIN_64BIT:
         return HSTATUS_VSXL_64;
     }

     ASSERT_UNREACHABLE();

     return HSTATUS_VSXL_64;
}

It will also affect then common code as vcpu_csr_init() could be then 
called before domain type is set:

+++ b/xen/common/device-tree/dom0less-build.c
@@ -812,17 +812,18 @@ static int __init construct_domU(struct 
kernel_info *kinfo,
      else if ( rc == 0 && !strcmp(dom0less_enhanced, "no-xenstore") )
          kinfo->dom0less_feature = DOM0LESS_ENHANCED_NO_XS;

-    if ( vcpu_create(d, 0) == NULL )
-        return -ENOMEM;
-
      d->max_pages = ((paddr_t)mem * SZ_1K) >> PAGE_SHIFT;

      rc = kernel_probe(kinfo, node);
      if ( rc < 0 )
          return rc;

+    /* The domain type needs to be known before the first vCPU is 
created. */
      set_domain_type(d, kinfo);

+    if ( vcpu_create(d, 0) == NULL )
+        return -ENOMEM;


> 
>> --- a/xen/arch/riscv/include/asm/riscv_encoding.h
>> +++ b/xen/arch/riscv/include/asm/riscv_encoding.h
>> @@ -68,6 +68,8 @@
>>   #if __riscv_xlen == 64
>>   #define HSTATUS_VSXL			_UL(0x300000000)
>>   #define HSTATUS_VSXL_SHIFT		32
>> +#define HSTATUS_VSXL_64			_UL(2)
>> +#define HSTATUS_VSXL_32			_UL(1)
>>   #endif
> 
> While adding the two #define-s, would you mind considering to remove the
> unused (and supposed to remain so) HSTATUS_VSXL_SHIFT?

Sure, I will drop that.

Thanks.

~ Oleksii

