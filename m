Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BBD5C55ABA
	for <xen-devel@archiver.kernel.org>; Wed,  5 Aug 2026 11:21:23 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1383297.1626552 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrZg7-000627-D6; Wed, 05 Aug 2026 11:20:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1383297.1626552; Wed, 05 Aug 2026 11:20:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrZg7-00061z-9m; Wed, 05 Aug 2026 11:20:55 +0000
Received: by outflank-mailman (input) for mailman id 1383297;
 Wed, 05 Aug 2026 11:20:54 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wrZg6-00061t-HH
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 11:20:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrZg5-004Kzs-EH
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 13:20:53 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a731c8b-bab6-0a2a0a5309dd-0a2a4507d992-38
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 13:20:53 +0200
Received: from [209.85.221.42] (helo=mail-wr1-f42.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a731c95-b4ea-0a2a45070019-d155dd2ac0b0-3
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 13:20:53 +0200
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-47f64ca1c2dso263173f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 04:20:53 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47febfe5b1bsm7185664f8f.12.2026.08.05.04.20.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Aug 2026 04:20:52 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1785928853; x=1786533653; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TDLOIIhSUY69RWK+VPCe0WXj5DQ3s8AJzrsRVAB1iYw=;
        b=IboKLv8M/CM1IgP9QcnSxbl9l6wYB9qszsncKZ8mFrlvCBhISjJL8RI7KxlZe2Wy9/
         S4ZNXi3RifWvzVsG2a5BEUGyGPp5h5U/C7+XNFB+cu2VqBtmwH34OV1aYjZkNmJfRUuR
         BitR53h2jw9krAMJCloElKUMUlVQw0DMC33CZB021eo566UgZ5v/VSNLfl9JNidf9/F6
         LwEtZZpaPz2USxsh8qGnwjTS0dQeiCUINiHhTOOaBlmGyELp7AGC7NOSkWWrUO0geC1a
         ABx0vCWytam5qQVPwBOn0ESoezDZ0sATZVsg04wmc6Fwmsh5AwNItIRg3x+ClX9fN5rR
         DRgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785928853; x=1786533653;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TDLOIIhSUY69RWK+VPCe0WXj5DQ3s8AJzrsRVAB1iYw=;
        b=iyUCDs2PKcewM8YcRRufuqA8Q8sOwVrFMVVg5EIQagPR7zLe1Jj0B8Wy0nM1btUNcm
         GUI9Hh6cmMX8WyX77D57aEIluQvRkQcp7Yca7u24l2yZ0WmpaTxMGD4aAOtCotgWVjLe
         TNbWloB7tA/9Q5f3u0688EF5Z4xBevotuy0K7k14r9B+oEjkyMnpGntn5vl1i0nBbihD
         07QY+7r1fUK8xhDIIsVL+FuOhpbLmj/DuxkAk7GPRINl9HVk7Ax3LqpsgvTlT6w+CtK4
         MFWQhbCypHzUfUnSwwz6+zdtxIYIDlgbF4dhNvYsZkvF/Q7IhRA/4+B/t81yJhFRhNNb
         yWpQ==
X-Forwarded-Encrypted: i=1; AHgh+RqeXwgsQ2TXw7CC0HkzP8eXk0e7YFlFfiR4zq8aHQNvB2WhGVd7GxmeKTsXV04VM4YSBfdnrnNpnZM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxb0Osp9Z4mR/JIz3PITZNQ5sLrv5bkRen4E4+XoA/HuU4Ufhk1
	+C0EGd0xQTbis5dASdQ952zyKjuZrcDVAWUxeUj3PlyJepsHrN50rYbH
X-Gm-Gg: AR+sD101AwSFAMh0rJXbW0iK+c53eV2NFc4R/sQuzLdNS8ZS1tHmw5+77C8hCUQu7Jc
	jm1hP+4jrGV/774ELc2LQkxu1yWkR+eT4XcpAwyKGwiOT+/O3MSpMV8Fq+tlrN621jvrM3TwGgU
	DVuMadNuqk1xCDR/ywm/zvL9IMQBcEOAVnBYcUKrHY02FNgNCxMtVxm2imuOPmZfgvwvZ8+2PYl
	nrI18psWMJHDbm+Ypd5RYQ1e5amAQ/Y/bXGfY/7Wr3yeKMg7zX2n3Ru9X1FlxFB/BHduXqxG4K4
	Voa0lawvDFxt/WX97ptobsMSj7uOr38wWMeIXkh1Krb9tesFV3yitYKYaGePXKIkMPXAuahKYqA
	cvC4Mm4ZFCZDcUi/g8XtU7s8J2o4211rEYH7XydXuHzNtDm55hXwLI/lRqFmaV5wZhsa/qHNHjq
	In8PNjHxcGxagHRwZKCEN4fazQFmGlU3EkcDXtZQIgE6Cl2qmOhylLmc7PbQULPZDBRUziv30yZ
	2yfT0hBcAEnyQ3C2ieZP8rnjL7aE6J3F0kwFuHny9yzB5yqNBuQAA==
X-Received: by 2002:a05:6000:4608:b0:47f:9ac6:ca60 with SMTP id ffacd0b85a97d-47fec484655mr10521923f8f.0.1785928852613;
        Wed, 05 Aug 2026 04:20:52 -0700 (PDT)
Message-ID: <aeb81a44-3857-4d75-9b6b-e1143f357dd7@gmail.com>
Date: Wed, 5 Aug 2026 13:20:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/livepatch: Move init_or_livepatch_* into xen/init.h
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Ross Lagerwall <ross.lagerwall@citrix.com>
References: <20260803150925.408857-1-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20260803150925.408857-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1785928853-A74D3AE4-45DEA9BF/10/73395122804
X-purgate-type: spam
X-purgate-size: 1184



On 8/3/26 5:09 PM, Andrew Cooper wrote:
> xen/livepatch.h is a fairly heavyweight header pulling in public/sysctl.h, and
> a reasonable number of users care only for the init_or_livepatch_* tags only.
> 
> They're arguably more init than livepatch anyway, and by moving them to
> init.h, we can remove a number of includes.
> 
> The include in vsprintf was leftover from early versions of the work.  In the
> version committed, d5ccf4482e4f ("x86, xsplice: Print payload's symbol name
> and payload name in backtraces"), symbol_lookup() had been adjusted to handle
> the livepatch symbol names properly.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Anthony PERARD <anthony.perard@vates.tech>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Jan Beulich <jbeulich@suse.com>
> CC: Julien Grall <julien@xen.org>
> CC: Roger Pau Monné <roger@xenproject.org>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> CC: Ross Lagerwall <ross.lagerwall@citrix.com>
> ---

Reviewed-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii


