Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 562EFC44524
	for <xen-devel@archiver.kernel.org>; Mon, 20 Jul 2026 09:19:47 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1366354.1616239 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlk9i-0005bv-1W; Mon, 20 Jul 2026 09:19:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1366354.1616239; Mon, 20 Jul 2026 09:19:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlk9h-0005bo-T9; Mon, 20 Jul 2026 09:19:21 +0000
Received: by outflank-mailman (input) for mailman id 1366354;
 Mon, 20 Jul 2026 09:19:20 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wlk9g-0005be-87
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 09:19:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wlk9f-006dMz-DU
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 11:19:19 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a5de814-2eae-0a2a0a5409dd-0a2a4508b13c-16
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 11:19:19 +0200
Received: from [209.85.221.45] (helo=mail-wr1-f45.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a5de817-f659-0a2a45080019-d155dd2dbcbd-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 11:19:19 +0200
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-47f365afc5aso4655936f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 02:19:19 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4954a2e8529sm256032015e9.11.2026.07.20.02.19.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jul 2026 02:19:18 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1784539159; x=1785143959; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ahej6WuypYSzluxqOX3Irij++n39XtHnsh3l7+duD7g=;
        b=GIEnKf7ovk5dYIBXxf+TC74sYvgnc3wyK+BPdyq7+RJ0y5mXSzBngotO9/WgxisQs9
         fkRoXX0HtEFJLlGjNNCA0SJro7IJcOwsXC5oZnsaGrWjLW1wAY+c7gamxhI8aNa66Eqa
         hrZrFAKS1G3v/557JwDssIXe6zrx3SR8StIgKcyVuWLxa/Ap0Z0WwCoxkTQhyTsa4FrF
         M7imrK8FTG4/6bZOw/wR64i4zNXjvGef5UKRgApBojjwHTmRDL/Fe/ggBZ0aEaTZNppd
         XavSCcNAv8oE2T8et9jw2psjNrAGipIYPP4Evlc42lDO1nPvW8q/HEU1TpxZyUoTIOr+
         irYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784539159; x=1785143959;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ahej6WuypYSzluxqOX3Irij++n39XtHnsh3l7+duD7g=;
        b=rb5YRX9WgmPYpBS799DYQdWEQigSTPMSiqkcnb4cnnFXEub6r6KcPtM/r5Lm3BKu0R
         KbA8fWjg2ihaXK0oQSNrB9WE7EevcFOp79EMNHefHYzzVnUvKvJk9njvntr/dhmwfzfe
         TKu5/1KyruoIMGcF0WfYARknDDGsY1umDCuLPo7mxINZvWcSul/YbMx5/s+q52MTH7a9
         WRh2e6+EKWZOoJ6WUitXP+91DjKGbEyVpZEd4SFifXxIgbVIrBt+jLjHhDA+tCKNZaBo
         qicfeo7VjfHfDAPCfgypVpWl1VwxKzwaYqk4onPcMVXCLGaC4qwFQ4Jmsp2XWHIl3ZG9
         gL4w==
X-Forwarded-Encrypted: i=1; AHgh+Rqluuc3swk+JfYIesWUIYCJY+SjA9vhOxVkS/erZT9r6H8LvW9/mN4LUIQuoLE1V1zKlTkR0irimdI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwAesRWT3q0LYuuxn/AwwqFvwI1ofDxKPa0UrjAEjWzI/fJXJxF
	7FPYZlvMKuSjwgTOloOlIyctu5kcLR/dDgYjYRjauG4xGEC7sfYrUSWE
X-Gm-Gg: AfdE7cmu97RUgMK2EtLSqS7V1Cayg/eqnfmSOlFH2BPHlEh7zoY197ob8+7AGOBmmEf
	pU4+6DuAMvqIOHgQ4zvGMXzkw04XVyH+rIRAwoyvpIkS3r8jbSzE6cYlqM5fD5udQ0HWIz6okLR
	RqMvOI3hp7irG9720UnSsFohjRRr23krv6WOnBUISkEFSDaQ0oMCp5YejCWkQxkOXkOvoLOi55W
	ZSLkiG5KMTBikRqTUJm2dEunNK9bAyVxDpkkPIi5gS4PaDF71pkNSz2aX9/TjMPJgz7GzvThLR+
	NPAkeB+VmJfQz/nw3M9HENI3cf82kDTnYcThyIFBe5sKZCvKZh4tS0q0w1h+PYnaFJ6GMR6eJWD
	PNX/X+t9AbYuu8xLUwmCMYTaDgs3XIv0dYwqU6egLJEE27VZuBdNjx6d+ZVzqneoizw7BB62zLl
	2v5dWNoMCK8SGG9Oq57vWJ6HB7p1oXrdf+zsntIugnxGaCmLcooMpmcZav
X-Received: by 2002:a05:600c:1d18:b0:495:515a:dad9 with SMTP id 5b1f17b1804b1-495515adc7fmr99342145e9.37.1784539158871;
        Mon, 20 Jul 2026 02:19:18 -0700 (PDT)
Message-ID: <0dc3f7cc-3886-42c7-b48f-c1c5d9ea17b0@gmail.com>
Date: Mon, 20 Jul 2026 11:19:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [4.22] Re: [PATCH] x86/domctl: restore all registers in
 arch_{get,set}_info_guest()
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Andrew Cooper <andrew.cooper3@citrix.com>
References: <20260720001223.2876628-1-marmarek@invisiblethingslab.com>
 <83ac6e9b-3aaf-402d-9877-2ed63d365367@suse.com>
 <9d04dfe8-97ae-4153-aa54-1bdbd31a7637@gmail.com>
 <876a3cff-7c8b-4dd7-a158-a3f531074250@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <876a3cff-7c8b-4dd7-a158-a3f531074250@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1784539159-CF55C87B-8B645FF0/10/73395122804
X-purgate-type: spam
X-purgate-size: 396



On 7/20/26 11:11 AM, Jan Beulich wrote:
> On 20.07.2026 10:48, Oleksii Kurochko wrote:
>> Considering that it leads to crash of Linux I agree that we want to have
>> this in 4.22:
>>    Reviewed-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> 
> Btw, I'm transcribing this to Release-acked-by: while preparing to commit.

Thanks. I missed to add Release-acked-by:

~ Oleksii


