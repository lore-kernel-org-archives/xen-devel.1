Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B7FDC43458
	for <xen-devel@archiver.kernel.org>; Tue, 14 Jul 2026 10:49:07 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1362178.1614086 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjah6-0008SS-5C; Tue, 14 Jul 2026 10:48:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1362178.1614086; Tue, 14 Jul 2026 10:48:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjah6-0008SL-2W; Tue, 14 Jul 2026 10:48:56 +0000
Received: by outflank-mailman (input) for mailman id 1362178;
 Tue, 14 Jul 2026 10:48:54 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wjah4-0008S5-82
 for xen-devel@lists.xenproject.org; Tue, 14 Jul 2026 10:48:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wjah3-009v8N-Jh
 for xen-devel@lists.xenproject.org; Tue, 14 Jul 2026 12:48:53 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a5613fe-bab6-0a2a0a5309dd-0a2a450ab09e-32
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jul 2026 12:48:53 +0200
Received: from [209.85.221.54] (helo=mail-wr1-f54.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a561415-f2d2-0a2a450a0019-d155dd36c86e-3
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jul 2026 12:48:53 +0200
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-475417f010dso1923947f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jul 2026 03:48:53 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f4635c86csm6897739f8f.16.2026.07.14.03.48.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jul 2026 03:48:52 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1784026133; x=1784630933; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G6eCwAGZ4bT7O7qmZlbt/xiVyQTXlJQN5N01JdQ4YrY=;
        b=V9X8r89/eaCLxJ90YXWcm3AECs2a8586G1F4IOJG4kEFYq5kQFVq1sS+pJGgCphCAu
         x1Xy+0ICT61YQc6StcHBsSJCo+52lTnlWEA9WCnaoRo777pGd1HSgCoIIR+R76elx8Yh
         o+uB5RqsYE89glK1068nv9YEq8VGEdD+pZ7sNUEfH9OEfjIZHUpoGXSAYhkAWrZl0qID
         vK0I5og+9st3+Uaoj6QBHZxz8EJkgFkU3Gph4Oe1zYD02epbIIFnV4vmbJa2mTtyk0rx
         KuvW87/9a2pw4lAKfjRZywcTcuibAloLhOJDyIad6BpHsAe+H3y3gmANVaOdK3X+RoPo
         oboA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784026133; x=1784630933;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G6eCwAGZ4bT7O7qmZlbt/xiVyQTXlJQN5N01JdQ4YrY=;
        b=Q2rlD5WArB4QI6uOQWYRXsyqb4l/WvM/P/1PhEhDT3PeDPfG84JiowCBRQBz+ZWMg2
         79A+LGLWi0rKkae2H37euYhkJsVBzg6sNKvYG2NeLbG9nRemtwU0VHx140F7c7GBetWM
         4/HhMeywEPxvwh47q5lz0G9ehGCiQ5r9ZyVuU5fDcPAwg94Kb6ooisL2vOTxjpWGW7Jh
         zZ9xnuxERKd0bGJlOiv7mWhs0Nd8xKVOsfjG90Y9Zu81EG1HP9dj2/2xPvi5rQYuJcw0
         LCla0SY2+/wUzmQDnKmIERJRl5UItsLE4zeBFjRvgt3TpoYQp8os8kdMDsoV5zm0EjE3
         fpPQ==
X-Forwarded-Encrypted: i=1; AHgh+RrMYl/0U8ZjneL+ekzWXqKxR1S3+wO5FlEPdWk5/XDEHcAcnCDgCTtwTKP4zzKGuS9TEEGGkO0EumI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxqSeBl8qK+WxIXpzLTuh53gBde2CtiIt6mCellVpHS/s98bgHh
	jrTHMKz3lyBemtgaTvfFbfkcssUczpSKvye0ZIqwzYSL1Po0LU73a4/e
X-Gm-Gg: AfdE7ck16ZvaS4iCl+WHmwdApuhue35ord9ZB2JaCA44y0HU8UL8QXZ5WIS9UGu6R7V
	LOAlsl0Gx03yCZID+zSvv0BdfD7zezbOIxYHmAbrOmQq26zTA/VKHjI53qvu87Vz7KPxhi8lbvC
	ObaA9L1JvAnN9YoOyi07gc6HB84xz5oZDR+kes4j/oOacUtLdeZb/mp237dOGejCWFq7US+LLsF
	uQNEuxtMj6TxGKQwAeIguqcUuQHMqUZ+qP/jtT7NzwYjKl7eOWfpK+JlWj+bH9y0+d6xlc5C3uC
	26HJxSba3rDSNfEk7Tg5CgYs1j9qP8p6kbzTaRpHcE/RNjvNi72bB5wUYXKKcFtKNETqZIPFqzo
	AyROYneYYZgCa0m59l/kDqOOElVImPv030uDvpPvgtudjukWFsvubwrCMVY7ArwDLlap+bi9KGX
	W18ZczwDU8xy1xwqJtEeEhl6cffSuJGUI61Ixni4QDgupo+/IdzzZCCzyAqUUxiD/KRolwy6yPf
	ZN52A==
X-Received: by 2002:a05:6000:2209:b0:47e:1d2a:3b66 with SMTP id ffacd0b85a97d-47f2dcecd79mr13821030f8f.37.1784026132836;
        Tue, 14 Jul 2026 03:48:52 -0700 (PDT)
Message-ID: <fbd14ab6-a52e-4d73-a7ce-1ec59b2e504a@gmail.com>
Date: Tue, 14 Jul 2026 12:48:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22 v1] tools/ocaml: xenbus - Fix handling of
 requests with len = 0 for socket connections
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Andrii Sultanov <andriy.sultanov@vates.tech>, xen-devel@lists.xenproject.org
Cc: Guillaume Thouvenin <guillaume.thouvenin@vates.tech>,
 Anthony PERARD <anthony.perard@vates.tech>, George Dunlap <dunlapg@umich.edu>
References: <1783598431.8631fc262581453bbf619ec5b2062170.19f46c03b15000edb5@vates.tech>
 <8c265153-6774-4904-9791-9386c7018e11@citrix.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <8c265153-6774-4904-9791-9386c7018e11@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1784026133-5A9D9CFC-E3CC1476/10/73395122804
X-purgate-type: spam
X-purgate-size: 1884



On 7/14/26 12:26 PM, Andrew Cooper wrote:
> On 09/07/2026 1:00 pm, Andrii Sultanov wrote:
>> Following the report at https://lore.kernel.org/xen-devel/CAFLBxZaeTMcF4tcV45MJdCVx4A6qbzQdjKei_Quh_iLrtARVFA@mail.gmail.com/
>>
>> Without this fix, the backend would be stuck waiting on the zero-sized
>> body until the next request comes in.
>>
>> Instead return the request immediately after reading the header, there's
>> no need to wait for another call to .has_more_input and .input
>>
>> Reported-by: George Dunlap <dunlapg@umich.edu>
>> Signed-off-by: Andrii Sultanov <andriy.sultanov@vates.tech>
> 
> Oleksii: I'm requesting a release ack on this patch.  It has been
> reviewed
> (1783604323.8631fc262581453bbf619ec5b2062170.19f471a22b0000edb5@vates.tech
> but on a disconnected thread).
> 
> There have been two bug reports so far; George (on list), and Benny (on
> Matrix).
> 
> It is logically a regression vs 4.21.  A new feature in 4.22 causes `xl
> list -l`, `xl migrate`, etc to hang when using the oxenstored rather
> than (C)xenstored.
> 
> There was no reply at first because the security team were investigating
> a potential security angle, but we've concluded that there isn't one.
> 
> Technically a form of this bug exists in 4.21 also, but it's not used
> automatically on any path.  It's triggerable by `xl list -x` and nothing
> else we're aware of.
> 
> Anyway, oxenstored is the default xenstored if you have Ocaml tools in
> the build, so this is a critical bug in 4.22.

I think this could reasonably be considered a critical bug. It affects a 
default Xen configuration (when OCaml tools are enabled and oxenstored 
is used) and causes core `xl` operations such as `xl list -l` and `xl 
migrate` to hang indefinitely. So:

Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

