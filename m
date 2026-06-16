Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7CA1CD98DA
	for <xen-devel@archiver.kernel.org>; Tue, 16 Jun 2026 07:33:34 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1338759.1599810 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZOIX-0007TP-TX; Tue, 16 Jun 2026 07:33:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1338759.1599810; Tue, 16 Jun 2026 07:33:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZOIX-0007TI-QQ; Tue, 16 Jun 2026 07:33:25 +0000
Received: by outflank-mailman (input) for mailman id 1338759;
 Tue, 16 Jun 2026 07:33:25 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wZOIX-0007TC-4K
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 07:33:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZOIW-004Xhi-Gu
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 09:33:24 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a30fc44-5cb7-0a2a0a5109dd-0a2a450abd92-0
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 09:33:24 +0200
Received: from [209.85.221.53] (helo=mail-wr1-f53.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a30fc44-56b3-0a2a450a0019-d155dd35e90c-3
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 09:33:24 +0200
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-45eec22fab7so1818806f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 00:33:24 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4606f26434dsm42333445f8f.1.2026.06.16.00.33.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Jun 2026 00:33:23 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:In-Reply-To:From:Content-Language:References:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781595204; x=1782200004; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xLzbH1EO0RjlWW65gsY+VbF3zJHfV+KfASUqTVuyoWo=;
        b=k9dJzMt/su/kbXCMDKoBw6u/OV2/MGLIal7tIN5GxhEU8O+BWltG39XVRwAPgMkDrw
         DDMVJFPi+3F9FJVBmb8yvr+RtZYzvWFvJNh2naaPeKH4RiRH6L+E2VYnP/f9/l36gGft
         x0wpoH8HRSimEYklniNlyGfbDUVBgZLGXAi3JJASktXzbUyAvOn/+hZIDfxO3rPPSa49
         4GyCU0XgoDxxxVFbKXGawAQFRBpX0KkpZHXI81x0oepnLAjqIDwzVzylKT9h9NmgG+UC
         aXlfvKV8lBGEbhOrHE5YBNuj2AWrnMZkoYaJoA/liCFyQdvIOiyLz2uZWoDw/P/IPXg+
         0BHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781595204; x=1782200004;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xLzbH1EO0RjlWW65gsY+VbF3zJHfV+KfASUqTVuyoWo=;
        b=mTEUnQnc3zgQ9mVuCE0P3TCCsSZi7wRyO3X21X+fVTbiverLbGPTHmxQ7/hg9Oegkl
         DxqRmlMTGjavNDWPFSoEww2OY38Nvr3vqIm4O7+T3dnZPLivM1ijec4xPvyU2AV91cZy
         YgT/v6teYR9e7LQOVl8D0hcy6UWRLa/PS03bEqNzkAB6s+8KPtTbpLvFY0opsVRmltZZ
         Uic7gVkJhycVzIiHckns5j6UQEtjEAiRIHVGHecsm32iWu7HPfdUpANIpc2Ldr+sF4w0
         uqWJEGwD7bqufyTAhVUjo3q4HUohCCrbtXpJIJkVPXyqkO3cO7X+RudbSDESwdXrG+UC
         M7pA==
X-Forwarded-Encrypted: i=1; AFNElJ/VULlUhp9GeRqz/o56S26zAwC+nrwHQWAlLkFqr3ykU0n0Chifo0gWeMGawInhVOSCBK0llCDmlvI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwQMBqSLXvfKi6lq+L76XNLfGlrWP4YBJpWIMRZHKKtztNAek5v
	47Sw8fz7BT0oZnwI//vvvKxAOlwq1d+HZQolv6StlzSLfyKHBvHkTkfmW9lgoQ==
X-Gm-Gg: Acq92OEP5DbPsmuDoldLBjBSEkPeRzmOFCvsb2019aJM366A4T11/W2qqDqIBjaUNWB
	HtZrYM/gwJ3hLizG3wEQ2utjUpMrVq72GkkDqxkMNkFyo5qnfaN6VqkwSf35tYFrlj9Fi9axigy
	3x9PeQPLVK1Xgk7odeiXGGmLn+hIBS4jLkbKrt+hsmWBopjpuhGa24CPYuUWA5kfSNmi0JTiulF
	b/XBBtivp1Cy1oV2meLTfBE9j0mA4W1qhuDdJENIi8Po7kZfwsd2zYEGuv5UB3mmbh7kN7ZCf6Y
	Tc88E/GDa90POl886CWEy1UKrP5uZ8CUjFyOKIMQcYXyXBDjbCK/PsVA6pRBcuw1bmS5W1wEDDE
	9RILUwV/bqLUd1YtOV/PR3uTVN8rrowzUijK3N04zcwGG1Mh6r2bTUZc8/gJWCXqvOBI4543Nqt
	EiwH65D0LStL73l2kIIU4RRHF3RMiOpD95sjFdQ2nNk47EBscgnwHctJw9qgc/4h3fYfTjZ1vOU
	AqMpw==
X-Received: by 2002:a5d:4e44:0:b0:45f:f142:d569 with SMTP id ffacd0b85a97d-4619f387c53mr2818562f8f.15.1781595203790;
        Tue, 16 Jun 2026 00:33:23 -0700 (PDT)
Message-ID: <d2203f8a-baf8-40b0-b34a-c1ef5822e2a4@gmail.com>
Date: Tue, 16 Jun 2026 09:33:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/efi: Skip FPU save/restore for idle vCPU in EFI,
 runtime path
To: Bernhard Kaindl <bernhardkaindl7@gmail.com>,
 xen-devel@lists.xenproject.org, Anthony PERARD <anthony.perard@vates.tech>,
 Jan Beulich <jbeulich@suse.com>
References: <1781272430.8631fc262581453bbf619ec5b2062170.19ebc1c488b000701b@vates.tech>
 <957a0fea-4099-4470-9b40-3f8b294c44dc@suse.com>
 <8b51a40e-028a-42aa-a7e4-55a731ebe10e@gmail.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <8b51a40e-028a-42aa-a7e4-55a731ebe10e@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1781595204-7FD788B7-5D008F89/10/73395122804
X-purgate-type: spam
X-purgate-size: 2254



On 6/12/26 5:41 PM, Bernhard Kaindl wrote:
> Hi Anthony, could you test this patch which exactly applies the changes 
> Jan suggested? Summary:
> Guard both EFI runtime FPU calls with !is_idle_vcpu() to skip save/restore
> for idle vCPUs, which don't have an FPU context to save/restore,
> much like the calls are guarded in __context_switch(),
> where save/restore is done only for non-idle vCPUs.
> As these simple guards should preferably go into Xen 4.22: Please test 
> if there are any further regressions with the 'cmos-rtc-probe' 
> workaround you just added removed to check if guarding the assertions as 
> Jan suggested is enough to fix the issues triggered on your machine. 
> Thanks, Bernhard The patch to test follows: [PATCH] x86/efi: Skip FPU 
> save/restore for idle vCPU in EFI, runtime path
> Anthony reported a boot-time crash in init_xen_time() via efi_get_time()
> on a Broadwell-D system:
>    Assertion '!is_idle_vcpu(v)' failed at arch/x86/i387.c:195
> The failing path is an EFI runtime call reached early during boot,
> where current may still be the idle vCPU.
> This became fragile after the lazy-FPU removal cleanup series.
> In 1792bb9a99d2 ("x86: Cleanup cr0.TS flag handling"),
> efi_rs_enter() was changed from save_fpu_enable() to vcpu_save_fpu(curr),
> which unconditionally asserts !is_idle_vcpu(v)
> so an EFI runtime call in idle context now asserts.
> Likewise, in dba44e051209 ("x86: Remove fully_eager_fpu"),
> efi_rs_leave() was changed to call vcpu_restore_fpu(curr),
> which has the same assertion and can fail for the same reason.
> Guard both EFI runtime FPU calls with !is_idle_vcpu() to skip save/restore
> for idle vCPUs, which don't have an FPU context to save/restore,
> much like the calls are guarded in __context_switch(),
> where save/restore is done only for non-idle vCPUs.
> Fixes: 1792bb9a99d2 ("x86: Cleanup cr0.TS flag handling")
> Fixes: dba44e051209 ("x86: Remove fully_eager_fpu")
> Reported-by: Anthony PERARD <anthony.perard@vates.tech>
> Suggested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Bernhard Kaindl <bernhard.kaindl@citrix.com>
> ---


Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

