Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01B85C53219
	for <xen-devel@archiver.kernel.org>; Tue, 28 Jul 2026 15:50:57 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1374936.1622284 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wok4r-0006M1-S1; Tue, 28 Jul 2026 15:50:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1374936.1622284; Tue, 28 Jul 2026 15:50:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wok4r-0006Lu-Nt; Tue, 28 Jul 2026 15:50:45 +0000
Received: by outflank-mailman (input) for mailman id 1374936;
 Tue, 28 Jul 2026 15:50:44 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wok4q-0006JS-8j
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 15:50:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wok4p-00500f-Lm
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 17:50:43 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a68cfcc-5cb7-0a2a0a5109dd-0a2a450c9092-16
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 17:50:43 +0200
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a68cfd3-f479-0a2a450c0019-d1558031ad03-3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 17:50:43 +0200
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-49558ce01afso30199215e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 08:50:43 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4957b5ed646sm295917335e9.0.2026.07.28.08.50.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jul 2026 08:50:42 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1785253842; x=1785858642; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1WOPquzJr20MXA/g1FJOlBAksb3gsBYkrjM7FqaQIX0=;
        b=CPuN/uB4oif0EZ91SRXTMTx0xCCUxTqsnzP0arzhznBVb98A+S+lWk7O2RmZlmsByk
         KK02XMZxeUWkhVJiFOOhEeh05XjbgvldKdgmc+FL4J2nA60J0CUzkoM6IsE/arYaOeqd
         POrQo4bY5hLluYYfqRKFK1OSwhk8xhrv53Cc9ltjD0H4z2cFqXY+qri1/LsR/JGniCTy
         NIP+RZqENqaz56FzVuED6QaKGZ/yZqvwsL8Nvo8ubJ26TNPe7o3AXwICBps/RVOwwIf7
         3z9dCB9jjgfrnr3yIVknSxwY1aPWYwEoKer0SURxvQaqRlSMPWcOd3BzkiTi6mRv0S0o
         GKoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785253842; x=1785858642;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1WOPquzJr20MXA/g1FJOlBAksb3gsBYkrjM7FqaQIX0=;
        b=CIGGipjQODaxGD+f7mq9hwWFFCzAvmtn1DXwMLUg8enJjnQy3BZeFPjRg1//sRdUd+
         X7nDbEtm9M35QPk3B/Npqf7BvwAiKar+/HVLwZm3yT9jEo4FIcAZh8/HeUfBHQhyje+w
         c1aU55dXhUpxlSXEJCkYnvVw6KgADNi6KzOMPEq87VlKYDEtPaPiEXV7gnRT0xc3JeiC
         yx3jeoGWtCzGanhgl07XClWzsBaNS6+a3j5Tql9GXWEWYMz9u4y571LxzTbexF/GNdIS
         bkHSWotSjnDWrQjYcRzd8ycjppfYA5qTV1QiMMXmBZNQNZz3JvRjWX1n9sSu47Tmabs9
         obsg==
X-Forwarded-Encrypted: i=1; AHgh+RoJmoH4/aLkcAXEri3FyuJON1XN2g46ev5MIjj/PQJuFWZDHZsOtE8icChxVGbO8sb+WfLvTNPWtUg=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx0GbaVsFHYOmbQSdGkyKcuzhbxOUcd37HG18cqGS+bVIA1pmY9
	ey4EpDW+j4WyuopuIEZZIlL8R2TmdRZ1wlBXtXhDdT2EMd8VVd7OVd8s
X-Gm-Gg: AR+sD11HK/PtnX/tifALgxvY+MGBQnc3ckFy1rnawj4hzGSmuwZCeE58IxiFVyXlRyb
	SLjYPSGQb4adOrf91QGHXiH+YA+MC2D6M7sqp+1ssAARXVJKC5d1swwxGuJivrwrL+fHTg1ieM8
	x0oonxesEVRG4LMsZ5fFK1VuMmGpCv7f6gBfhOgYNrrz4/5BAR6ij0yVDwv6uKqnXSR0GxfUQrf
	huYisBeTD6PR4ry14sDucUoBeZVGo2oL7QPkdkvLfdLaA/ol5srOrcrICMNkvdyFWw0aCD0acbB
	CjbPYo8d+MaUdArY6hg2xiR+xCuuObHysxrnEUvSeqNcvHVhuczc0qadzhRCEKq9U6/AMLaXUew
	SKkNkpRLYVFPYeM6R+bwlo/io8Z/zTtuXBpKOssQdVexcRBr4dU/8+VBjo9odz7WY4ryPIldRhc
	izu8Mo+j0SiGGHGiLw+DHdrlkT2LUO3BcXa2lFL1wVtqOUUPd4A/tTG102
X-Received: by 2002:a05:600c:a46:b0:495:52dc:73a9 with SMTP id 5b1f17b1804b1-496c6421d73mr33371725e9.11.1785253842649;
        Tue, 28 Jul 2026 08:50:42 -0700 (PDT)
Message-ID: <ff751975-3e64-471c-b499-fdb35c3f17c2@gmail.com>
Date: Tue, 28 Jul 2026 17:50:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22 0/2] tools/ocaml: Fixes to
 Xenctrl.domain_getinfo{,list}()
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrii Sultanov <andriy.sultanov@vates.tech>,
 Guillaume Thouvenin <guillaume.thouvenin@vates.tech>,
 Julian Vetter <julian.vetter@vates.tech>
References: <20260728154830.67734-1-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20260728154830.67734-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1785253843-004CFA5B-D35CBC57/10/73395122804
X-purgate-type: spam
X-purgate-size: 417



On 7/28/26 5:48 PM, Andrew Cooper wrote:
> For 4.22(?). This fixes a segfault in the Ocaml runtime on ARM.
> 
> It's not a regression vs 4.21, but it is deterministic and easy to fix.
> Technically patch 1 is sufficient to fix the segfault, but producing an
> unconditional exception is almost as useless.

For both patches:

Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

~ Oleksii

