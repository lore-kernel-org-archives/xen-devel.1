Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B83AC53219
	for <xen-devel@archiver.kernel.org>; Wed, 29 Jul 2026 18:39:54 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1376574.1623243 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wp9Bl-00062a-Vp; Wed, 29 Jul 2026 18:39:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1376574.1623243; Wed, 29 Jul 2026 18:39:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wp9Bl-00062T-TE; Wed, 29 Jul 2026 18:39:33 +0000
Received: by outflank-mailman (input) for mailman id 1376574;
 Wed, 29 Jul 2026 18:39:32 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wp9Bk-00062N-5i
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2026 18:39:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wp9Bj-008Smr-Ev
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2026 20:39:31 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a6a48de-5cb7-0a2a0a5109dd-0a2a450b9572-2
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 20:39:31 +0200
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a6a48e3-b7e8-0a2a450b0019-d1558031e119-3
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 20:39:31 +0200
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-49554ebb87dso11528525e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 11:39:31 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-496c4625161sm170448405e9.14.2026.07.29.11.39.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jul 2026 11:39:30 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1785350371; x=1785955171; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0o3WKA+DQNSW+4GnXInmR3MzrRl1OIx7G6UHR22Bcvc=;
        b=WG9VgvKOteurcg+SnkZQleBIjD3N+Dtk1JEmLJPtWOdCvK4wTbWYQXml7vgNgW4AKV
         fU4VIfajHY4lTsFwSYnOWxXJycAfFADKRFmKzuQVXlW8HwBTDJYibEb9xk6k7KSDgsjt
         pFGDlEcmAdVp8x5CCXmauXMvth+FT3gnQE3t3BXTnub9Fn5y815zYoK6jMzkt/sbN8dW
         uarRj842RmVQ0YMglhtMPanmNSNzLZjbdN3MiVSw1350RnLyDG4wZ2hTnlvopOJmL9RE
         BTZmnlz5yu5kJfC3+Pl24mngZOKi6JIGRJTgVZJiYpeFNnuFX0awPJU+NyMcmidVcMdJ
         bXeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785350371; x=1785955171;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0o3WKA+DQNSW+4GnXInmR3MzrRl1OIx7G6UHR22Bcvc=;
        b=OYMngo9Se0S6NSVNeuupgoIdpjaK4bst+pPPC4LjPp0DtD3wPIQWMw1F6GpfGm5kDX
         TL/ONIDsK9SqJUsW7DMeAegAQNbzmaRGTn5miENFlDOIjV0Xvob2VDrnPXxnqG8n2ooB
         55sxFJ9ihHnf3wSTc5IBmoeLfI8SU7jffrAcBLxqfh1gYUBwa6QqeEZNXBDgaYq+5Dim
         0zWzpMaboubTPuz3QV+6sJYAJFpIaQyPh6Q2Qv2LDqAqQUKSHkFEaFt35nwJXqiLO3MY
         vbXszhb6Okug0MJTw9VR83x5MM30U0ApAxi0MqR3yuCaZmI13CfWzB8UOfhO5ihhnOKM
         Ti6w==
X-Gm-Message-State: AOJu0YyGvaI+M4Yw+WihNNhvCisg3LXojOu/p6bWo2VsaJkIL3K2k3+w
	6IyrK4JpykgZVvU0x2XhoqT/kKUBk+Hb6x6gCjBZvOZQUtSY1drJKdDo
X-Gm-Gg: AR+sD13NIC9QbNly4lU9o3RpxV5ecM0cZgbuy9Pf8tXAnoIS4v/EgCTD0Ci7QskpjKu
	t9j3iJczPLGyPO1IPup8X0843mN8PytTVS28/jS/7djd9jnX1Wkkzr4IxhHAzupEmgGEz96vn/S
	zEKiMW+C3oicIssFgDilU3m9i/HrDjQ+ynyZpbvN59fJCxJWJaT201x+yCFxBd/gxps/JahnL/I
	0HgLy4OhDrUJT6yYr4rvAEZHerjSh0tJmIhdTtlmMk66/h7Csj2EbxMmk1aIvkBT+7ZzvPZfV5B
	+iHrc/gM3xHsH9Bif7jh7PSA/H3TlSQljQ3cIq7W+MYDUYESuwwsmBGKBgJVnHPjs6L5quWOzHv
	sNgU0oWoWlwzJ2zrGHLL3SN5hcU6RXvE+9Hb86tbu0IQE/rDeafUjYOYmi0q1iXFS62uspFV+wY
	pstVkxfNGpvgkUuUiAYj5IddVqM4wKL6G4kUlVF+D1iCh08p/kMAJIzMD8SUvxXCAzrkx5Xn6q+
	FTzCxrIr5b9vWCEQwzDm4WVRSrdDFEwx3Gc4qHEIb0=
X-Received: by 2002:a05:600c:4686:b0:495:4d00:2fc0 with SMTP id 5b1f17b1804b1-496c65458bamr87308155e9.12.1785350370648;
        Wed, 29 Jul 2026 11:39:30 -0700 (PDT)
Message-ID: <9ad68791-2e77-4bd4-a7d1-3ce10a70e0eb@gmail.com>
Date: Wed, 29 Jul 2026 20:39:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] SUPPOT: Define support lifetime
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Cody Zuschlag <cody.zuschlag@gmail.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <20260729161529.164017-1-andrew.cooper3@citrix.com>
 <20260729161529.164017-3-andrew.cooper3@citrix.com>
 <amopYL9OuFaMODDR@macbook.local>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <amopYL9OuFaMODDR@macbook.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1785350371-184CB9EA-E7CD242F/10/73395122804
X-purgate-type: spam
X-purgate-size: 2015



On 7/29/26 6:25 PM, Roger Pau Monné wrote:
> On Wed, Jul 29, 2026 at 05:15:29PM +0100, Andrew Cooper wrote:
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Anthony PERARD <anthony.perard@vates.tech>
>> CC: Michal Orzel <michal.orzel@amd.com>
>> CC: Jan Beulich <jbeulich@suse.com>
>> CC: Julien Grall <julien@xen.org>
>> CC: Roger Pau Monné <roger@xenproject.org>
>> CC: Stefano Stabellini <sstabellini@kernel.org>
>> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>
>> For 4.22 only.
>> ---
>>   SUPPORT.md | 10 +++++-----
>>   1 file changed, 5 insertions(+), 5 deletions(-)
>>
>> diff --git a/SUPPORT.md b/SUPPORT.md
>> index 7c42de4c1602..b945fc83afde 100644
>> --- a/SUPPORT.md
>> +++ b/SUPPORT.md
>> @@ -9,13 +9,13 @@ for the definitions of the support status levels etc.
>>   
>>   # Release Support
>>   
>> -    Xen-Version: 4.22-rc
>> -    Initial-Release: n/a
>> -    Supported-Until: TBD
>> -    Security-Support-Until: Unreleased - not yet security-supported
>> +    Xen-Version: 4.22
>> +    Initial-Release: 2026-07-30
>> +    Supported-Until: 2029-07-30
>> +    Security-Support-Until: 2031-07-30
>>   
>>   Release Notes
>> -: <a href="https://wiki.xenproject.org/wiki/Xen_Project_X.YY_Release_Notes">RN</a>
>> +: <a href="https://wiki.xenproject.org/wiki/Xen_Project_4.22_Release_Notes">RN</a>
> 
> Will this wiki page get created?

I planed to create for this one release the page tomorrow morning.

   It's still not there, and given we
> are moving out of wiki usage, we might want to put the release notes
> somewhere else?

If it was such decision then lets do it for the last time and decide 
where to put release notes for the next release separately.

> 
> This is likely for Cody/oleksii to decide, since I assume they are the
> ones that create the wiki page.

I created this page before as it was metnioned here in SUPPORT.md so I 
thought that it should be created.

Thanks.

~ Oleksii



