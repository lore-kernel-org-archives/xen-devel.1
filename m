Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ECD9CD5BB1
	for <xen-devel@archiver.kernel.org>; Fri, 22 May 2026 07:46:39 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1316405.1585778 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQKaJ-0002Xk-GS; Fri, 22 May 2026 07:46:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1316405.1585778; Fri, 22 May 2026 07:46:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQKaJ-0002Xd-D0; Fri, 22 May 2026 07:46:19 +0000
Received: by outflank-mailman (input) for mailman id 1316405;
 Fri, 22 May 2026 07:46:18 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wQKaI-0002XX-7i
 for xen-devel@lists.xenproject.org; Fri, 22 May 2026 07:46:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQKaH-0065lg-6p
 for xen-devel@lists.xenproject.org; Fri, 22 May 2026 09:46:17 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a1009c8-5cb7-0a2a0a5109dd-0a2a450c9818-2
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 09:46:17 +0200
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a1009c8-62f1-0a2a450c0019-d1558035c49a-3
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 09:46:17 +0200
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-48a563e4ef7so54676585e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 00:46:17 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490454ac6a6sm24566515e9.12.2026.05.22.00.46.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 May 2026 00:46:15 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779435976; x=1780040776; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6uHiWn8a0pZizAm+RvQgLjDjdxAKEERcsrkVfsyJD4o=;
        b=ZD/F4+hDTS7A/kpjkbcMe+KUQBAZqQ6mfZ7Ar/PTMTRlsCoYsT0WES44g2Oi2mFPJu
         7NKS7tWUqe8l8jY7VN9S58QZR2FyFzmFxVK5hS+rBJ9tjqfXrxp1jqmpFqmSoa9YaR0n
         aWw5eTTNYbuCHuAa5g/0tr9Eik+iH38mPgKYRN9ocmsQoq+A4LMxJTGATO3aDPrwyJyO
         rhBrXJPpSy7KCvR2UKGkM83XbIOEm+OeTebTj2YNCpWf15iUz9fQsyxvuqD9jfzCBH1s
         NmlVWd0y8Z0BlgQj3Z19m1QxTZCKLvxQewxfqTqXB59OhUZ4BXAoLCV4/jBg11gm2UWW
         j59Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779435976; x=1780040776;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6uHiWn8a0pZizAm+RvQgLjDjdxAKEERcsrkVfsyJD4o=;
        b=K697eYI3E9gpba8hlftjQnDGl7zPLeLMIBOI+h0uK1RPaGuu2Mh2H87c/ALtX/nALE
         OwKhXp90ycBSXJsgni7GF4UU8blvUA0K6m+4g1yEo9/HcGBj8UnJJdODdClBJw0eD8oT
         Ei6qX0PsyXYTJsuNb1ys8L3EjEkREZHit0DnNEUpYIhY8X9Os5CgQiGyxWvJk7HkVpHV
         O3mF5wilirVLotnJEHWo0p9PHfkoPUJaZImNKbdc3EXvdYaBpykfeYtC2pJNwD5/H2rL
         VPwb3J04f9NzuP4Mayck2fjHHsvx2zbHbw1YXI+eFmo7f8D5r8xzVildcucay8a070Su
         NAMw==
X-Forwarded-Encrypted: i=1; AFNElJ+19gnXbQlgTQM5JFMuNZzhGBzbNtvyYKVqCs3laBPN9A9MsRWkkhlhChAfY9NROuKu5g00eV+AGac=@lists.xenproject.org
X-Gm-Message-State: AOJu0YweNLa2yNB3V7jBA7zTS9g8zYPTW1162P6WsZWcSUkq6pHG96FA
	Dx9uZvnGo9SnOtuTI5Jot897v1xoaIJeFRLCwf8srxxqtZCjOTDnb3Ps
X-Gm-Gg: Acq92OHkBYs0uY1NKzJ9zVi3362x8CinxqJoQaq1F8v99yP4LCM6Pt4Se/22iIoG8tY
	UP6Zep302Dwiw4ptGH8aLIpyqqrzKXz2G+Grey3bfdk9AH8LpT1fQnBHTUkrnpAR4IF3kdxO7hF
	cmLTY86h7Rs/4/SiUuzs6D8y8HkiIZWEI3zUD0fVMLq8wdQxrOGn6U/L7iv1NnM98eCPOgeSRsu
	9CQw8dWiJuW/CsHsUNO8HRfhuPhQmfcoP1uFKmMnfmF2DgjAdDooT8FPqArURZS0HG1lfPtmpCl
	1vwaOX/ZOqza2H447f7JwcdxVABKZ4y9vruwDrr61kJkDUCnsSJVlNKZ7gc4b101pnp7HbEQaxa
	6rQGczaMuyj4E4qmObyZG3GlxfMzQijdOOntk6T4Gvb6WJb83854b86HBrGYpwnW8xE7U+7jw7m
	8kT+Axe31mw8jrddUj6VSGLHShvEqzphGOC9+8VoYIm7hzt8NpXmlsz2cg0xlFZdLEpelSncNT+
	wY=
X-Received: by 2002:a05:600c:4513:b0:490:44eb:c1e2 with SMTP id 5b1f17b1804b1-49044ebc3cdmr20232975e9.21.1779435976448;
        Fri, 22 May 2026 00:46:16 -0700 (PDT)
Message-ID: <fd31b3e1-1995-4cfd-840d-0d7c26765318@gmail.com>
Date: Fri, 22 May 2026 09:46:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v3 1/3] time: add "NOW() good" indicator
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Teddy Astie <teddy.astie@vates.tech>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>
References: <a3e034a4-621a-45ad-9b96-9a85cbe5eafd@suse.com>
 <38b28709-eddc-4dc7-9e8e-92db67d20ea7@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <38b28709-eddc-4dc7-9e8e-92db67d20ea7@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1779435977-F407FCF5-7EC06113/10/73395122804
X-purgate-type: spam
X-purgate-size: 2007



On 5/20/26 4:45 PM, Jan Beulich wrote:
> printk_start_of_line() checks for a value of 0 right now. In order to be
> able to have NOW() return at least monotonically increasing values, that
> needs replacing by an explicit indicator.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Arm and RISC-V may want to consider whether their initial get_cycles()
> can't be moved yet earlier, such that the indicator also can be set
> yet earlier.
> ---

At least, for RISC-V ...

> v3: New.
> 
> --- a/xen/arch/arm/time.c
> +++ b/xen/arch/arm/time.c
> @@ -145,6 +145,7 @@ void __init preinit_xen_time(void)
>           panic("Timer: Cannot initialize platform timer\n");
>   
>       boot_count = get_cycles();
> +    NOW_good = true;
>   }
>   
>   static void __init init_dt_xen_time(void)
> --- a/xen/arch/riscv/time.c
> +++ b/xen/arch/riscv/time.c
> @@ -87,6 +87,7 @@ void __init preinit_xen_time(void)
>           panic("%s: ACPI isn't supported\n", __func__);
>   
>       boot_clock_cycles = get_cycles();
> +    NOW_good = true;

...  preinit_xen_time() call could be moved a little bit above just 
after riscv_fill_hwcap() as it is using riscv_isa_extension_available() 
inside.

preinit_xen_time() could be splited so it can be moved just above 
tasklet_subsys_init() after device tree is initialized but I don't think
there is to much sense for that.

>   
>       /* set_xen_timer must have been set by sbi_init() already */
>       ASSERT(set_xen_timer);

The ASSERT is harmless, but NOW_good could technically go after it.

boot_clock_cycles and cpu_khz must be visible to any reader of NOW_good 
== true. There's no explicit ordering between those stores and the 
NOW_good = true store. In practice this is fine because SMP isn't active 
at this point, but a WRITE_ONCE(NOW_good, true) or a compiler barrier 
would make the intent explicit and protect against future reordering by 
an optimizing compiler.

Thanks.

~ Oleksii


