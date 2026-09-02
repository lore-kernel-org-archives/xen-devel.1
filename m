Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77517C624D6
	for <xen-devel@archiver.kernel.org>; Wed,  2 Sep 2026 13:45:49 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1405941.1639360 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1lHQ-000172-IQ; Wed, 02 Sep 2026 13:45:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1405941.1639360; Wed, 02 Sep 2026 13:45:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1lHQ-00016u-FI; Wed, 02 Sep 2026 13:45:32 +0000
Received: by outflank-mailman (input) for mailman id 1405941;
 Wed, 02 Sep 2026 13:45:30 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x1lHO-00016o-I6
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 13:45:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x1lHN-000YRO-Ud
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 15:45:29 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a982879-2eae-0a2a0a5409dd-0a2a4507a052-0
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 15:45:29 +0200
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a982879-b4ea-0a2a45070019-d155802ac9d0-3
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 15:45:29 +0200
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-49ccfbe062eso8478365e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 06:45:29 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49ce47b9817sm52937825e9.1.2026.09.02.06.45.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Sep 2026 06:45:28 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1788356729; x=1788961529; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9V3PTU1WYvGw5DNhBIzSyKAFbZj366QeU6iOoA5sIno=;
        b=tLgexUqaNprzkiroXhRNhTv5bKpRZbDfCthTb4g4OmhvkpZha4DOEp9fiZjfl/6zbB
         Z6Jac/mllSZj+qB4iSkWPBW2y5BVa4fFX0ZnI/JUP4hn5RTvAscvx6XdVMlvGceWzrFX
         moT6wYqmK5LBYUyGVWKx2WSRzd2w4SMgwHBgz9NSfn8ibbD/vQ7ACPc8Y54/MAdLPZk/
         cqHSQ/ZwwPup8KomHqfZtzXtDCEOR6cW7iH+dGwdlGSBfmaw+EAiHe8CXAOQyHap43yA
         eFV0j2lfrFm40quK8yum1smeFk4SVifBR/c3WkIeKY5b5j6q7DHLZNB0+ImupDwOUKy/
         UMLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788356729; x=1788961529;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9V3PTU1WYvGw5DNhBIzSyKAFbZj366QeU6iOoA5sIno=;
        b=c8L0eCDoVPNnRikjDMfyaggQARH2hkrhNtQ8iJcGLwdao9yjmrMHf3rgsTSubjsavE
         Uy0+6wXTa/cTawGrA7qsKRR34vJHggwHNI5nTWlvhYEQ5ABBtRpjuWOF+r5Oru8NKTjH
         sSPQwGkPFhlt2gd1mOlIu6qLn79BTwXIykxe/k8V8NZzfOlbSxWKnF1CYcVPlja5W+16
         ZDX1qoVla4Z6N2dgiJR7qVGwJUTeCxpSQHB/unj/hNzDcmqOheQpdZ31FD41bANH68Sp
         VlxI1oB47C+8RlFbGINx5SCOFzz6MJ0+9Q5gaMKt9fNSPmwQnfIbt0Ef6E+zajM0R++t
         dJ1w==
X-Forwarded-Encrypted: i=1; AHgh+Rq8vgrs7vq41SkMELEsxa9302R+GzuKbUk72ugtc7fd9R+3r0bnMWeDvxIZxXovq37r2wSemCBTfp0=@lists.xenproject.org
X-Gm-Message-State: AFuF++n6pDxl4yFKu+nrlv/bkPHtIbxsM1l8HYaCNd9IR8vSO4o4lZkG
	O+1/fawAAqe16SgzleFB6LUy1Orxf4R9iK+NiGf0Au1NuNsxP95fJiYf
X-Gm-Gg: AR+sD13HQTm/P142YmiS4CYU6Flr/9HOOQ/uK8rQpEIOkOtMiyMidoN+NHiTFeMtN39
	I6a+OuGh3dWmSK6KBPnAdWRdL4CbHHg3YQmFzy1S7+mLHGWfncCKtZhVS7qbqsTKslSWzX74uNx
	HGg81tpznlmae1nd2NA26z7+9Z7OvMu+TlvYasQxXILUYEaxWTpyv7O6gwnOIqpwtQASNoUDXym
	fW02rE8mdNaR7Bqkw4ltFHKmbPnOd/M5jpHAJNJZ2fbo6HQh0mzpRQOpn/T4Ikt/sIN43dJhwzI
	PPi2YG0o0oszgax9BRFR8tx9WIVeG1NBZNJKco1rctr07R6hFQfMhIJc23NFzP/A95a5vEoZjBL
	tJG9q/SUBprDQ0OUejqQjfsROyCf6agsBpk2b353pcw9k9jCJiMjqELd639goqkwTCkeBoPg0Hb
	QsRfnL2EKAP4BheAVTVvIjWsHR5rapYvGrtxwJ7A129Yv6RN2ggvaQZ1TutL9646qSTko8Mecic
	Yonfn7CjlIJZ1fhRzgVFHLpeP8tXawyeSZXnMc3aQ==
X-Received: by 2002:a05:600c:530f:b0:499:bdf1:7578 with SMTP id 5b1f17b1804b1-49ce55ecdf2mr99415825e9.3.1788356728981;
        Wed, 02 Sep 2026 06:45:28 -0700 (PDT)
Message-ID: <21e80092-5abf-427d-87d8-cdbe58874a10@gmail.com>
Date: Wed, 2 Sep 2026 15:45:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/39] xen/riscv: drop bug.h's duplicate instruction
 length helpers
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
 <9908a5b8a5e0d00403af8073a6b7452c19795fc3.1787838835.git.oleksii.kurochko@gmail.com>
 <fba838ed-b6a0-4cef-8dcc-8b5d1f8a8aab@suse.com>
 <5d8888f1-d6f6-4f73-812b-8a79edceed95@gmail.com>
 <3b07e1c6-eee0-4b54-8bd5-fce8db4ef726@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <3b07e1c6-eee0-4b54-8bd5-fce8db4ef726@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1788356729-A58C1AE4-3004F6C0/10/73395122804
X-purgate-type: spam
X-purgate-size: 3263



On 9/2/26 3:02 PM, Jan Beulich wrote:
> On 02.09.2026 12:48, Oleksii Kurochko wrote:
>> On 9/1/26 9:01 AM, Jan Beulich wrote:
>>> And then
>>>
>>> #define INSN_16BIT_MASK			0x3
>>> #define INSN_32BIT_MASK			0x1c
>>>
>>> are really named backwards, seeing e.g. their use in
>>
>> It was derived from OpenSBI project and I haven't paid enough attention
>> for these defines.
>>
>> Now looking at them again I fully agree that names here not really
>> correct. It should be according to the spec:
>>      #define INSN_32BIT_MASK          0x3
>>      #define INSN_48BIT_MASK          0x1c
> 
> Especially the latter would then still be misnamed, as the mask merely
> identifies insns >= 48 bits. Even for the former I'd still question the
> name to some degree ("mask" doesn't mean all of the bits need to be set).
> 
> In how many places are you going to need these constants? If, by suitably
> using helpers, it's just one - maybe better to get away without any named
> constants in this case (i.e. when suitable names are apparently difficult
> to come up with)?

INSN_16BIT_MASK - will be used only once (except INSN_IS_32BIT() and 
INSN_IS_16BIT()) in insn_fetch_faulted() introduced later in this patch 
series:
         di->insn = htinst | INSN_16BIT_MASK;

INSN_32BIT_MASK - is used only inside INSN_IS_32BIT().

And INSN_IS_32BIT() and INSN_IS_16BIT() are using in several places.

I am okay to drop these masks and then just have a comment:

/*
  * Instruction length encoding helpers (see RISC-V Unprivileged ISA,
  * Section "Base Instruction-Length Encoding").
  *
  * - Instructions with bits [1:0] != 11 are 16-bit (compressed).
  * - Instructions with bits [1:0] == 11 and bits [4:2] != 111 are 32-bit.
  */
#define INSN_IS_16BIT(insn)      (((insn) & 0x3) != 0x3)
#define INSN_IS_32BIT(insn)      (((insn) & 0x3) == 0x3 && ((insn) & 
0x1c) != 0x1c)

As an option we could come up with the following names:

/* Bitmasks for instruction length encoding fields */
#define INSN_LEN_1_0_MASK        0x3   /* Bits [1:0] for 16-bit vs 
 >=32-bit */
#define INSN_LEN_4_2_MASK        0x1c  /* Bits [4:2] for 32-bit vs 
 >=48-bit */

#define INSN_IS_16BIT(insn)      (((insn) & INSN_LEN_1_0_MASK) != 
INSN_LEN_1_0_MASK)
#define INSN_IS_32BIT(insn)      \
     (((insn) & INSN_LEN_1_0_MASK) == INSN_LEN_1_0_MASK && \
      ((insn) & INSN_LEN_4_2_MASK) != INSN_LEN_4_2_MASK)

But it seems the first option still looks better.

Would you also prefer Option 1?

> 
>> I think that for now it is enough to go without common implmenntation of
>> INSN_LEN and just return 0 as suggested above.
> 
> Suitably commented upon that would certainly be okay with me.

The the following comment looks good enough for me:

/*
  * Length in bytes of the instruction whose first parcel is @insn: 2 or 
4, or
  * 0 when the encoding is 48 bits or wider.  No ratified extension 
defines an
  * instruction of such a length, so rather than open-coding a decoder for
  * encodings which cannot legitimately occur, leave it to the caller to 
treat
  * the 0 as an illegal instruction.
  */
#define INSN_LEN(insn) \
     (INSN_IS_16BIT(insn) ? 2 : (INSN_IS_32BIT(insn) ? 4 : 0))

~ Oleksii

