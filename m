Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F86CC624DE
	for <xen-devel@archiver.kernel.org>; Fri,  4 Sep 2026 16:54:29 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1408869.1641146 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2XB7-0007G6-WD; Fri, 04 Sep 2026 16:54:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1408869.1641146; Fri, 04 Sep 2026 16:54:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2XB7-0007Fz-T0; Fri, 04 Sep 2026 16:54:13 +0000
Received: by outflank-mailman (input) for mailman id 1408869;
 Fri, 04 Sep 2026 16:54:12 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x2XB6-0007Ft-CL
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2026 16:54:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x2XB5-00C1lZ-P5
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2026 18:54:11 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a9af7b3-2eae-0a2a0a5409dd-0a2a450ce614-0
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2026 18:54:11 +0200
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a9af7b3-f479-0a2a450c0019-d155802ab0c2-3
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2026 18:54:11 +0200
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-49b0dbfbf7bso9524725e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2026 09:54:11 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-71-234.play-internet.pl.
 [109.243.71.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49ce58da3acsm426952495e9.0.2026.09.04.09.54.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Sep 2026 09:54:10 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1788540851; x=1789145651; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aQvMTCI/O6mBW8lrtMSenSHB02btM6NqWxYBSr0VoLs=;
        b=fA15PTSRmt9tbmacXwzmYBBJAyh/e/t7LO4YV/vtWJdH6kPQnryhbD0rhWOPul/sSp
         nUlcN4V+QDsiHDWXJ4mW9i78s2gAqYQ4aWMy803IaK14ufZ8YxobxJnXoAHjcgcBoLEW
         wwnMrYuza2HGN+nj9YDPHMhTjw4htwBlXMu8UX/YnXNm82fAP/YKcZna7Sf/GPj5Iopr
         +88i/SvoYrRqVTQUSOmIwiokrfjbzZlPCSfjqEVMBW9nmTejwVNRTfGeYKlWsxwWoyBu
         r4bB0EkjjsVww3EH/yjTcPVMzjG12XCh2NNalISmyXoxWjRNHkPe9PS5sbm7RMUPI8M3
         5QSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788540851; x=1789145651;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aQvMTCI/O6mBW8lrtMSenSHB02btM6NqWxYBSr0VoLs=;
        b=bz3OvbPqu5RaB3n8UqCdvf4BW+SPw/a33xc2a2uD2wJ3mQONWDV0ZzdGOPsXW0J0X1
         ad+o47T5SdYur5No9pOI/+R/cTlFC+YZuY1qwU/wMTKhYw3oTpYNul2hg3sxADXl9IRq
         GuJtAUUo7yjhX+CF/zXPOzC62vGYtapgaV1RpiQjoDF4h8RlepMgmjZBCZPbWJU9NFjp
         JtKMEft41aRlfL/guenfGfUSpLIDPJzefNzZ03lgnv2osH1rvKKi5PBJVTvucO72NDkW
         +D6zVCoENhqk98cdwEJyRrpDeslshnK4upTd6x9J+yOYRkwcJefhjA8CNMtW5sk3Nw6Q
         Np8w==
X-Gm-Message-State: AFuF++miip3vLHwwbdYB6bQxKczHkqAwgsC94O151yV/zc7GRWKNqw5J
	OxVRDQsshxZyWcP7gtjS2+FnR9LUSddqkFyiuRHMCZdPEK6+5BWvjWPZ
X-Gm-Gg: AYBFou1ldPKlb9uZxlANvlpSH/p40iagmGxO00IQu2o2OwQRYyjjHTg2z/f3C3CXXST
	oaSfa6U3TuEj1hOxZkfCU2ogMoODRtiYoy07ke1KjUNqGBEvYC56S8Cux2TANfRaiPvdiK8EFWh
	lVpmTu8WW4crMLmJQij8wa+hb3MW+SdtPkV9rsqmji96vJHPwmmYCzUodwU7fe/zhXtcllXuNMi
	vnahA5hiI+9x0myJAff6uEaAFkePMnYG/buJRbB3X8IL2F7bAhqx6bnUpGLUxdb0aD1ZJPbHPn8
	wxjGW2ncLMr4Nnv43+2VbOdj2ArjmUzvadrEj84probhUbCN7C8oE0n8wwYqn0K0Ynj68edwGAL
	GYmQ97GPkdaaDWelS6A+QzV63Q/NcLa1X+jvXIHh/B+a/HpjTNS7vAyLzLCODNAYMDhtcr9awzV
	gNhNffOsuBpDFD8+uVoFnGhqGgVYf1xSdpF3s3UeNK5XSeuln5LAWIkKInZeBtJd58iOM+r00m1
	qEL/JHP8boHz4T1+VTeZkiFMK3YNPK3bJu/Xws=
X-Received: by 2002:a05:600c:a405:b0:49c:feb6:d46 with SMTP id 5b1f17b1804b1-49cfeb60de9mr61790335e9.12.1788540850884;
        Fri, 04 Sep 2026 09:54:10 -0700 (PDT)
Message-ID: <67c9edde-4f97-49e3-8d5a-e6309559075e@gmail.com>
Date: Fri, 4 Sep 2026 18:54:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/39] xen/riscv: introduce
 vintc_ctxt_switch_{from,to}()
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
 <678236568970b18a1924a76588c4c50f9bf0c659.1787838835.git.oleksii.kurochko@gmail.com>
 <1788521115.8631fc262581453bbf619ec5b2062170.1a06c2a6d8f000c4f3@vates.tech>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <1788521115.8631fc262581453bbf619ec5b2062170.1a06c2a6d8f000c4f3@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1788540851-766DEA5B-74D655F6/10/73395122804
X-purgate-type: spam
X-purgate-size: 1055



On 9/4/26 1:25 PM, Baptiste Le Duc wrote:
>> Virtual interrupt controller state must be preserved across vCPU context
>> switches.
>>
>> Introduce vintc_ctxt_switch_{from,to}() wrappers around new
>> ctxt_switch_{from,to}() hooks in struct vintc_ops, and call them from the
>> context switch path, so that this state can be saved/restored without
>> knowing which vINTC variant a domain uses.
>>
>> No vINTC variant implements the hooks yet: the vAPLIC implementation is
>> added separately.
> So this patch couldn't be applied alone as, at the time of this commit, you only set in vaplic.c:
>      static const struct vintc_ops vintc_ops = {
>          .vcpu_init = vcpu_imsic_init,
>          .vcpu_deinit = vcpu_imsic_deinit,
>      };
> 
> So ops->ctxt_switch_from(v) or ops->ctxt_switch_to(v) will try to
> deference NULL pointer causing segfault. I don't know if it's matter but
> worth to mention somewhere.
> 

Just abstraction is introduced here and context switch isn't happen for 
now so we are safe.

~ Oleksii


