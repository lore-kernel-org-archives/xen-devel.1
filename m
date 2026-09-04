Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17CEDC61DD6
	for <xen-devel@archiver.kernel.org>; Fri,  4 Sep 2026 10:58:54 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1408194.1640840 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2Rcx-0000Kb-DS; Fri, 04 Sep 2026 10:58:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1408194.1640840; Fri, 04 Sep 2026 10:58:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2Rcx-0000KU-Af; Fri, 04 Sep 2026 10:58:35 +0000
Received: by outflank-mailman (input) for mailman id 1408194;
 Fri, 04 Sep 2026 10:58:34 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x2Rcw-0000KN-9T
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2026 10:58:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x2Rcv-009KnI-Ig
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2026 12:58:33 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a9aa447-e002-0a2a0a5209dd-0a2a4506d45c-48
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2026 12:58:33 +0200
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a9aa459-195a-0a2a45060019-d1558036bd48-3
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2026 12:58:33 +0200
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-49556f97a9dso7521675e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2026 03:58:33 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-71-234.play-internet.pl.
 [109.243.71.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49cf5135353sm75680345e9.2.2026.09.04.03.58.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Sep 2026 03:58:32 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Content-Language:References:Cc:To:From:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788519513; x=1789124313; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=i57gQ4hHTz9nn2etSSfO8Ur/ahMB8XJeGd2KMq8acjY=;
        b=ZqQWVTT4MJLFApEm5Ct6moLihM/xwJ82DWWoNozSe6WBGdcomko4CZfjOIOJK/Exsa
         8YU8KGegQWihpjv0vo0ctRU9yQyXdo7oxznX/f0jRKI8ciHdfE5bgKp8BYABEJDzkFcY
         vnZ+61XXp3i961NaWgRjPyjbPJ670RBOhA71Et8Loq0GeAWg82N3ouRrJLX98F9b/Uy4
         7y1qachccMsGXQoIdQAsDM6k4Gg8j+DQ1Nvsc6ZB8v918rL+sPFrZXm4fV/Cg/HWtKQu
         J62mA7jxIHaUwMRWd4pMMIgCdmk0+fFBOoSpMl+OMkDsidCv5eSozpPhyhxtBuC5GzuQ
         wwUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788519513; x=1789124313;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i57gQ4hHTz9nn2etSSfO8Ur/ahMB8XJeGd2KMq8acjY=;
        b=aTByl+cDWQqL5zzizYbetFY0LI2bzTWxLB7eXFmNVyM3MizBl8S+4M9OC2AI5FCQ5Z
         nUCcdPwwyvo2ijEvZrrkyFqBMzZAU3DIi2wPZveprro5KkZimqT+0S8YHI7XmD+q4UaI
         yawHaE3XwJNKWYQoa63HamPh74L5FhYz72Bh2jAXHCPYWU9tpUnYzJuyqBAEvHl7NUyp
         l8tLMvGK+73nF/hmSilY5P+Tu4o7PWbtB6Pe2ESn3T/123cDntdITULIlERTHVDtcLmI
         qg9f2Yic9GV8kCRGwg66un/JFAACRVr9+H+fjaM6tQHa8iFKN3j9nrSP3IttAOY8a5a2
         0fyg==
X-Forwarded-Encrypted: i=1; AKwUvBxmT3iJcBJvZBrn7U+xAG77a4sYI8I8b3PMtO7iSHM4oPUsrSVuNceIhmiiJGL7EgVeT2Zk6yzmxTY=@lists.xenproject.org
X-Gm-Message-State: AFuF++lKrmXgQaazipAYhloU2pXfq57iFKiCOaXQ2c9xES/jJ4eqS0za
	6pZFshdWLbZ6W4bRUxZfQA7zdCn636fKYEIiPQ2p6sDAJhm3M0f4QbKe
X-Gm-Gg: AYBFou1G6Sqoo9HWg8icWcF8fZubp1GghudSKpZ1aNuK30kvDhHzwmX29fhh1hS8t+l
	3fDniXQd8F7ai/ALcTcMhkHa5W2KaqVlFibVflwsfAM8MMch5381V/znG/Mg6xk4pJC5YWA7EvR
	vlzVXG5qnM2NgTl/HaGNXO2dwe5mXyhc3dfwoj76f4v24lnRK+OzMqFd1igFLR4p5hrqJd2rBZB
	Mnfv1cFQDRULLMwthD8DmERxOuMh2GY26TcUaLAU5zxJ7b2pxTCSRNyZffp9QdWRItoa3ZXhdx1
	6Q469mWIlJ56ZsK7El1kCJdojh7PSgVWUPpfsdk4h9ZYk2qhAHZNIjagpJSUlzm8tWpGZIuz540
	6D6DMdZcjQep3qDG76aC6zcFF6SYnCPFgS4XrKdF4Ta3YhlJ1eZaHXpmR0RNu6xuL4Jk5+Uj4vu
	Elk+X7ZG9NfNl+EvLzg1TD7UsRF8eB0KWjlBa9VVXY1x9bM1S/4JvchqBzThijUujUL05Q001P7
	wwSlnCQWIFfkdBMpArYxgWlLEcd1PEeQJis1pA=
X-Received: by 2002:a05:600c:a4b:b0:499:4e47:eaf2 with SMTP id 5b1f17b1804b1-49cf824020amr45273535e9.6.1788519512736;
        Fri, 04 Sep 2026 03:58:32 -0700 (PDT)
Message-ID: <6e807532-4cd5-410f-b073-99b58a40733e@gmail.com>
Date: Fri, 4 Sep 2026 12:58:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 16/20] xen/riscv: implement IRQ routing for device
 passthrough
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
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
 Stefano Stabellini <sstabellini@kernel.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <cover.1787836900.git.oleksii.kurochko@gmail.com>
 <d5ac0f45de409ab0a63b2b17e4fd3cdd47dbffa0.1787836900.git.oleksii.kurochko@gmail.com>
 <0cf2c9f6-5fba-4d1e-a9cd-e2a409730efa@suse.com>
 <ffa2c0cb-52ed-421b-8c4e-9b61edd43f6f@gmail.com>
Content-Language: en-US
In-Reply-To: <ffa2c0cb-52ed-421b-8c4e-9b61edd43f6f@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1788519513-FD80D77B-1F1578F9/10/73395122804
X-purgate-type: spam
X-purgate-size: 3512



On 9/3/26 4:39 PM, Oleksii Kurochko wrote:
>>> +    do { smp_rmb(); } while ( test_bit(_IRQ_INPROGRESS, &desc- 
>>> >status) );
> 
> I am thinking if a barrier is in correct place or needed at all.
> 
> Considering that desc->status is updated under spinlock() which uses 
> full barrier the result here should be already observable without 
> smp_rmb() inside do {} while ().
> 
> Probably we want to have load->load between test_bit() and a read of 
> action->free_on_release in if () below but I don't see what could go 
> wrong if this read will happen before do {} while ().
> 
> xvfree() (stores inside it) can't be executed ealier because of control 
> dependency [Rule 11: b (xfree) is a (action->free_on_release) store, and 
> b has a syntactic control dependency on a] so again it looks like a 
> barrier isn't needed here.
> 
> So considering what kind of barrier is used inside spinlock + Rule 11 we 
> can just move smp_rmb() after the cycle (just in case) and it looks like 
> smp_rmb() is only here just to force compiler not to order the things 
> considering how action->free_on_release is used:
> 
> static void irq_release_action(const struct irq_desc *desc,
>                                 struct irqaction *action)
> {
>      /*
>       * Wait to make sure it's not being used on another CPU.
>       *
>       * desc->status is cleared in do_IRQ() under desc->lock, whose
>       * acquire/release barriers are a full smp_mb() on this arch, so the
>       * handler's writes are already ordered before the clear is visible.
>       * On this side, xvfree() is control-dependent on the final test_bit()
>       * load, so Rule 11 (RVWMO) already orders it after the wait with no
>       * barrier. smp_rmb() below adds real read->read ordering, but nothing
>       * after the loop depends on it (action->free_on_release isn't racy);
>       * it's kept as a guard against the compiler breaking the control
>       * dependency the ordering actually relies on.
>       */
>      while ( test_bit(_IRQ_INPROGRESS, &desc->status) )
>          cpu_relax();
>      smp_rmb();
> 
>      if ( action->free_on_release )
>          xvfree(action);
> 
> Am I missing something?

It could be option just to skip smp_rmb() here at all:

     /*
      * Wait for a handler still running on another CPU to complete: 
do_IRQ()
      * clears IRQ_INPROGRESS only after the handler has returned.
      *
      * No barrier is needed here: nothing below reads data written by the
      * handler (action->free_on_release is set up once, before the 
action is
      * ever registered), and the stores done by xvfree() are ordered after
      * the loop's load of desc->status by the control dependency alone
      * (RVWMO ppo rule 11).
      */
     while ( test_bit(_IRQ_INPROGRESS, &desc->status) )
         cpu_relax();

     if ( action->free_on_release )
         xvfree(action);

But probably just to be sure that if ->free_on_release will one day 
somewhere else set except the mentioned case it makes sense to have 
smp_rmb() or even smp_mb() (depsite of the fact smp_rmb() looks more 
then enough).

Does it make sense?

> 
>>
>> Please split this across three lines, to conform to style. (Also same nit
>> as above.)
>>
>>> +    if ( action->free_on_release )
>>> +        xvfree(action); 


