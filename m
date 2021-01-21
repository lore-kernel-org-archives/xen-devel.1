Return-Path: <SRS0=QJUc=GY=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C475CC433DB
	for <xen-devel@archiver.kernel.org>; Thu, 21 Jan 2021 09:31:20 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C1892395A
	for <xen-devel@archiver.kernel.org>; Thu, 21 Jan 2021 09:31:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4C1892395A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.71942.129216 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2WJ5-0000Zv-Ez; Thu, 21 Jan 2021 09:31:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 71942.129216; Thu, 21 Jan 2021 09:31:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2WJ5-0000Zo-Bp; Thu, 21 Jan 2021 09:31:11 +0000
Received: by outflank-mailman (input) for mailman id 71942;
 Thu, 21 Jan 2021 09:31:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T/JE=GY=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1l2WJ4-0000Za-AX
 for xen-devel@lists.xenproject.org; Thu, 21 Jan 2021 09:31:10 +0000
Received: from mail-lf1-x12f.google.com (unknown [2a00:1450:4864:20::12f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7d20e8fa-c9b8-4928-b5dd-f7cd0cebfe77;
 Thu, 21 Jan 2021 09:31:09 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id o13so1601823lfr.3
 for <xen-devel@lists.xenproject.org>; Thu, 21 Jan 2021 01:31:09 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id j1sm468782lfe.161.2021.01.21.01.31.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Jan 2021 01:31:06 -0800 (PST)
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
X-Inumbo-ID: 7d20e8fa-c9b8-4928-b5dd-f7cd0cebfe77
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=/SEtgesn0XJ2X25v1BwpzCBGgE3GmmShoTK1qef4aMY=;
        b=lt7WfXYnB6n+Nk7daw/T5ZXCILmmgSaBwxEta23g2R4ylBH6u1eXwjCWbkpW8GWwt8
         L8b8iMudCJ+qF6D/Xo8wXar0dT3du8cuG0UdEMyPeW1CKVfL6bg5FXIgFqWjsgj6MDNw
         dIYglT3LuhuFzn+c9Bov7hSBgeEX6ChNxLM7TPYCohzWAl6H64UCaLEy/F0JCvfUeZtp
         /xRf74SDqLgo/15ykGpkYi9F+1tkcGQPuPlH8zKWYygb10zqm/95lsq1MiHnGGyZ/PpY
         Im8VBrMiXV6UJfvN9v13aT6i25y7COzVyMxFgOW8eW5vAgemIApxN97vtJNX4bTwh3sH
         t55Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=/SEtgesn0XJ2X25v1BwpzCBGgE3GmmShoTK1qef4aMY=;
        b=ccQda5ZfI0vp1lictiwZNlusVD+uAtYMOldtNuSP5Dr5R0bKcPCfvfVR7cnSBBau4a
         akEMXUscHy8HE3YQFImoihDfW3EsCUdVD5LyfACRgrtnSzWHuil3S+/H0yb+SfOnLWWh
         yKRymbYeB1/68+4B1heRbUMtZxPTTNsKTlfecPWMk156bUqRQfBJcDXtkT4nHlz7sgpb
         ld0puJy51Z5NoNw/ehnxRtw1OAa+baP1f3QJElP8YhvQzmuQ9sxoZXSYEyf0UJwSWbyn
         dBcf7ZuJa5fUJgPslty4NPRyRbPW5obzsAPO3g/8FXgaimAYuavmQ0wx3NFXKJ1aZk1o
         yvag==
X-Gm-Message-State: AOAM530XXIc1U8hP4z0HDPO257m0MnmFNV4bTXszyfvSfq3zcUjn2knh
	z0ngLZSzexVB3HAWIYDMYuE=
X-Google-Smtp-Source: ABdhPJw4Fkz9KJA4t/xPgTwA98aeS3NBWa7ppOqeMTMRE2sLDhB4M1hiKTpGzwTUAIlan1ohr1fYFA==
X-Received: by 2002:a05:6512:2287:: with SMTP id f7mr5788592lfu.40.1611221467948;
        Thu, 21 Jan 2021 01:31:07 -0800 (PST)
Subject: Re: [PATCH V4 14/24] arm/ioreq: Introduce arch specific bits for
 IOREQ/DM features
To: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien.grall@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
References: <1610488352-18494-1-git-send-email-olekstysh@gmail.com>
 <1610488352-18494-15-git-send-email-olekstysh@gmail.com>
 <355e613a-3c9d-7978-62cd-a35df057e5cd@xen.org>
 <d54a9ef4-b707-1887-a7f7-b33c6f0f97d9@gmail.com>
 <06704224-bb57-c55e-a2ee-23032095e8ea@xen.org>
 <e2dcc876-291f-1244-933c-179f97a84e07@gmail.com>
 <b79b07eb-02db-16bb-2d8b-a55b0c355dbb@xen.org>
 <a7b26b16-cdec-3734-284e-a907e3cc356c@gmail.com>
 <alpine.DEB.2.21.2101191626560.14528@sstabellini-ThinkPad-T480s>
 <9c12c1a7-81e3-20e9-7419-a625f23e4c27@xen.org>
 <alpine.DEB.2.21.2101201147100.14528@sstabellini-ThinkPad-T480s>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <4c682b4c-2deb-6d3a-fee1-588e36c89a93@gmail.com>
Date: Thu, 21 Jan 2021 11:31:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2101201147100.14528@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 20.01.21 21:47, Stefano Stabellini wrote:

Hi Julien, Stefano


> On Wed, 20 Jan 2021, Julien Grall wrote:
>> Hi Stefano,
>>
>> On 20/01/2021 00:50, Stefano Stabellini wrote:
>>> On Tue, 19 Jan 2021, Oleksandr wrote:
>>>> diff --git a/xen/arch/arm/ioreq.c b/xen/arch/arm/ioreq.c
>>>> index 40b9e59..0508bd8 100644
>>>> --- a/xen/arch/arm/ioreq.c
>>>> +++ b/xen/arch/arm/ioreq.c
>>>> @@ -101,12 +101,10 @@ enum io_state try_fwd_ioserv(struct cpu_user_regs
>>>> *regs,
>>>>
>>>>    bool arch_ioreq_complete_mmio(void)
>>>>    {
>>>> -    struct vcpu *v = current;
>>>>        struct cpu_user_regs *regs = guest_cpu_user_regs();
>>>>        const union hsr hsr = { .bits = regs->hsr };
>>>> -    paddr_t addr = v->io.req.addr;
>>>>
>>>> -    if ( try_handle_mmio(regs, hsr, addr) == IO_HANDLED )
>>>> +    if ( handle_ioserv(regs, current) == IO_HANDLED )
>>>>        {
>>>>            advance_pc(regs, hsr);
>>>>            return true;
>>> Yes, but I think we want to keep the check
>>>
>>>       vio->req.state == STATE_IORESP_READY
>>>
>>> So maybe (uncompiled, untested):
>>>
>>>       if ( v->io.req.state != STATE_IORESP_READY )
>>>           return false;
>> Is it possible to reach this function with v->io.req.state !=
>> STATE_IORESP_READY? If not, then I would suggest to add an
>> ASSERT_UNREACHABLE() before the return.
> If I am reading the state machine right it should *not* be possible to
> get here with v->io.req.state != STATE_IORESP_READY, so yes,
> ASSERT_UNREACHABLE() would work.
Agree here. If the assumption is not correct (unlikely), I think I will 
catch this during testing.
In addition, we can probably drop case STATE_IORESP_READY in 
try_fwd_ioserv().


[not tested]


diff --git a/xen/arch/arm/ioreq.c b/xen/arch/arm/ioreq.c
index 40b9e59..c7ee1a7 100644
--- a/xen/arch/arm/ioreq.c
+++ b/xen/arch/arm/ioreq.c
@@ -71,9 +71,6 @@ enum io_state try_fwd_ioserv(struct cpu_user_regs *regs,
      case STATE_IOREQ_NONE:
          break;

-    case STATE_IORESP_READY:
-        return IO_HANDLED;
-
      default:
          gdprintk(XENLOG_ERR, "wrong state %u\n", vio->req.state);
          return IO_ABORT;
@@ -104,9 +101,14 @@ bool arch_ioreq_complete_mmio(void)
      struct vcpu *v = current;
      struct cpu_user_regs *regs = guest_cpu_user_regs();
      const union hsr hsr = { .bits = regs->hsr };
-    paddr_t addr = v->io.req.addr;

-    if ( try_handle_mmio(regs, hsr, addr) == IO_HANDLED )
+    if ( v->io.req.state != STATE_IORESP_READY )
+    {
+        ASSERT_UNREACHABLE();
+        return false;
+    }
+
+    if ( handle_ioserv(regs, v) == IO_HANDLED )
      {
          advance_pc(regs, hsr);
          return true;


-- 
Regards,

Oleksandr Tyshchenko


