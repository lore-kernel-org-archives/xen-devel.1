Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 821E1CD5BB4
	for <xen-devel@archiver.kernel.org>; Tue, 26 May 2026 06:27:03 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1319609.1587094 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRlFa-0006Pw-9W; Tue, 26 May 2026 06:26:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1319609.1587094; Tue, 26 May 2026 06:26:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRlFa-0006Pp-6x; Tue, 26 May 2026 06:26:50 +0000
Received: by outflank-mailman (input) for mailman id 1319609;
 Tue, 26 May 2026 06:26:48 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <frn1furkan10@gmail.com>) id 1wRlFY-0006Pj-HE
 for xen-devel@lists.xenproject.org; Tue, 26 May 2026 06:26:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wRlFX-00GtEX-Qm
 for xen-devel@lists.xenproject.org; Tue, 26 May 2026 08:26:47 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <frn1furkan10@gmail.com>)
 id 6a153d18-2eae-0a2a0a5409dd-0a2a45099146-40
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2026 08:26:47 +0200
Received: from [209.85.218.43] (helo=mail-ej1-f43.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <frn1furkan10@gmail.com>)
 id 6a153d27-2497-0a2a45090019-d155da2bc11d-3
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2026 08:26:47 +0200
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-bd4d7f4fa02so1717615666b.3
 for <xen-devel@lists.xenproject.org>; Mon, 25 May 2026 23:26:47 -0700 (PDT)
Received: from [192.168.1.109] ([88.230.42.151])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bddc314c8absm462106666b.22.2026.05.25.23.26.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 May 2026 23:26:46 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1779776807; x=1780381607; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HlsrOlMlyZiLwjwy1IVB+Xt4WWrBf3Zith9THEI1emU=;
        b=Qf4ME3+pmnI+Y1IS0OtAU7heVM3lO6ho0DEEtW5/dffoOdhTF3JOkYshKQg+Ld9neG
         McVR5gM++33nA5W+maW2CNlNX242jHWY5KW+QeJUJLyg6ATnMIm4iLeTMjnEVsfExrpd
         AK3uhiV1uU0CaI6cgFue71JvgOB8idHjs5pUZ/fDfgTtS3znZYpJYEcN67ltfy15WerZ
         NpFF91fVdfPlTRuLgg8bVWbt7h4fm6JAqDbhL9bD4ZVSTloC2OgithGGccePJ/X7oDA4
         tcyGbgJ1LzkfizKe1GD/1rDUpUx8XZ759GW9c4CCIKcmg+fMHj/kUz7yNuwtrlk+F+Ar
         7f2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779776807; x=1780381607;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HlsrOlMlyZiLwjwy1IVB+Xt4WWrBf3Zith9THEI1emU=;
        b=qefFbqo37FHHq+D4XqL0UopwIt5we6UU9jwJlPDCCU/QHQtvrMK10iwLObUqGQSp7y
         byrCeo0qAdYdCIP6t5C9xEoxeLUneCBRVgUvuLQUxw3Kjm157E4+rFtUOKSVXI95tmT2
         zufI56lUtfy9ZNu4Cmydrn131x1gPPr4AobumjX8Yj+G511b0lpzP8ZNDutrDwlZrR3C
         JuVaNrDXzljYXw1v0+44HORA0YnnXdTOUnWCChvCUIEem0fZaRi3moiOGwo21qWo3Yol
         dsUR82BaC1XaSxHT9M4SgVvpCedRNap/gXkcfsm1QooV3y5hoCPg3jMVBj3bjFqk0gu7
         bAAg==
X-Gm-Message-State: AOJu0YyYJ2CeB0Eq92sPtfxf4g/kUYMcO/3JgUp3LtFMKUWCEHp3aH7y
	RComA2eWVNR2d4BzX4kCnBYTduMS+9uNVug0aOxMkws3LzQOfXKI1mvh
X-Gm-Gg: Acq92OEqGyAZdrn0xbBfaJt5b3P5uOUkSmQ9jza/9cfd3SMgg8d8TJty6XPkxkN02UD
	JnDRKCc5fqpfU7c2SC++SOybrmWXM7aB0aop3CUBNhsY7Ix0ZJvdNuX+jySnVrZvHzoIZsiPJV0
	DSHot+qHpb0JYclq/y2TgfkH2FOKwuYmS/NsC4uyB0z34wd+BQDdWRxk+xZtwHn5bmz+VJD3KGB
	JZ0gPWUg13IUY7KikOBxX+Em2loRS8RxX1KSFmhEMwOEAiwov5PNzU8E0AmtFzt6kgTkVNu7Q+J
	qC/kCopEGZ1ssLZECw4oL33PUen98sI8S8dHLsN9KxGW0zrz0BPLfQrGQSknaJqnLlVmkBbAinD
	+nLWvzigmjUzQN9ICSOlzFHi9ydADqYVjfA7QjgEnR/nisvZw3OzommbMpWrQUdJ4Dl6NU5Ix49
	x3oiyLe1JWiweNWST2r701kACkITR1Vg==
X-Received: by 2002:a17:907:c06:b0:bd4:6da5:d5b2 with SMTP id a640c23a62f3a-bdd23cfc4d1mr944315466b.1.1779776807233;
        Mon, 25 May 2026 23:26:47 -0700 (PDT)
Message-ID: <ee6892c3-db90-46f2-b245-b0b377ee8de6@gmail.com>
Date: Tue, 26 May 2026 09:26:41 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/sched: fix stale file path comments in common/sched
 directory
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, dfaggioli@suse.com, gwd@xenproject.org,
 stewart.hildebrand@amd.com, jbeulich@suse.com
References: <20260525102539.27050-1-frn1furkan10@gmail.com>
 <ahQrQnWMiWTE1joR@macbook.local>
 <1ba4ffba-e9e0-4858-b3b9-d45c950894c3@suse.com>
Content-Language: en-US
From: =?UTF-8?B?RnVya2FuIMOHYWzEscWfa2Fu?= <frn1furkan10@gmail.com>
In-Reply-To: <1ba4ffba-e9e0-4858-b3b9-d45c950894c3@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1779776807-4236CA53-54663E49/0/0
X-purgate-type: clean
X-purgate-size: 826

On 5/26/26 09:18, Jürgen Groß wrote:
> On 25.05.26 12:58, Roger Pau Monné wrote:
>> On Mon, May 25, 2026 at 01:25:38PM +0300, Furkan Caliskan wrote:
>>> Commit 6cb4b01c03 ("xen/sched: move schedulers and cpupool coding to
>>> dedicated directory") moved the scheduler files from xen/common/ to
>>> xen/common/sched and renamed some of them, but did not update the
>>> in-file path comments at the top of each file.
>>>
>>> Update the comments to reflect the current file locations.
>>
>> FWIW, if we have to modify those lines I would just delete them, I
>> don't think they add anything meaningful to the file.
> 
> Wanted to write the same. So yes, please drop the lines instead of
> modifying them.
> 
> 
> Juergen

Thanks for the feedback. I'll send a v2 with the lines dropped. 

Furkan Caliskan

