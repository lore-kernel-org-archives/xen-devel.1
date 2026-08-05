Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 042ACC55ABA
	for <xen-devel@archiver.kernel.org>; Wed,  5 Aug 2026 12:48:42 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1383433.1626716 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrb2q-0007ix-4G; Wed, 05 Aug 2026 12:48:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1383433.1626716; Wed, 05 Aug 2026 12:48:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrb2p-0007iq-Vs; Wed, 05 Aug 2026 12:48:27 +0000
Received: by outflank-mailman (input) for mailman id 1383433;
 Wed, 05 Aug 2026 12:48:26 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <frn1furkan10@gmail.com>) id 1wrb2o-0007ik-JB
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 12:48:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrb2n-009hgA-RT
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 14:48:25 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <frn1furkan10@gmail.com>)
 id 6a733103-5cb7-0a2a0a5109dd-0a2a450ba28a-38
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 14:48:25 +0200
Received: from [209.85.221.54] (helo=mail-wr1-f54.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <frn1furkan10@gmail.com>)
 id 6a733119-b7e8-0a2a450b0019-d155dd36d961-3
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 14:48:25 +0200
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-47f71156e1aso448147f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 05:48:25 -0700 (PDT)
Received: from [192.168.1.109] ([88.241.184.235])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47fec23e533sm8799726f8f.28.2026.08.05.05.48.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Aug 2026 05:48:24 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1785934105; x=1786538905; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4Fg5Jlc1jxaGcQAj3FbA1in17FLwTIaps3QCwd1CSKs=;
        b=CQLLvx4cRrVSugBPl3P9oSqPMh2sRVdebg6I7FuBJw9LP/NkuArW6wBqb2ziwYYtZD
         fuXsexzQMy7h9EnTHDmUtFf8jNpkbkMjKxnm8qfisWpcm9RmfMP+eIRigNi/5lCZTkhY
         QPRY3ZpVd5YaNLo09wpuufW6DCX5AR+G/pYgs/sIoQT90ZXAAnd6/QxLedcAYDAlRAcl
         yXc+75l86lEJ6cIwRH6/yqUKs5yAWU3krjgxzEl3xw/Gimil4Jc017FVhScV3zOZOQ4L
         QYS3gO3oblh+3VK5Qh+VbZxaU5v92ZGMn5sASMgrC3kbFLcDU3KmUWJpuGr0GVRGgBVT
         x0aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785934105; x=1786538905;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4Fg5Jlc1jxaGcQAj3FbA1in17FLwTIaps3QCwd1CSKs=;
        b=LnsRFjLDYz6tvk5Y5PQTZW0qpH0A3DdJl8u5KNoVwVGKh8YoO2hUoJipH+TDWmIeKo
         mrhEDRJvUZLlYSvsfNni6zJV1ZyzD3oCx0kWq9VmWK/EQ6GYnCoKBWGdqvAjM8c+a5PZ
         TLcTWxOuN5GgmiNMPnoNd1dJ2VRNljVBdf4Dvf5J37Nm7RgagRVnqmAEzheMKi9lduTk
         VCfWX6aqtGu72Xd4bkxM6a6d1nuq8Av1z4cHhCk+C9CYX4ZjsA5BPWTV08noABi1i1JE
         AOrgcOW8XT0kzofok3o/eLYkelq1mKo3e3kFk6dMqFZFImHB7mNZG4TioM19ZJv9tB6L
         nHrw==
X-Forwarded-Encrypted: i=1; AHgh+RrQb/B9zTywgz+CkwwEtxrpygjGz5Cclhh8YcxOmMVWvszYMKO8o60eleg9tf7EsaOapW2bULzyI6s=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzWYuOo4NW0cgM9T2KROYWWMQzs1NLCLPl3ysi12/5GH1BUqdH6
	YytNqHFXIyBftXRX6tAyYO280liRmcGtyoxhdfdlMNsy0z8pRGgTVHHE
X-Gm-Gg: AR+sD12pTjDJhrznwhZ0sdvk85L1zuEy27C4z82YDCWUuj/LuRPVYurqrI0WeW+JVyE
	fjXMDaupylh2EEN/jTwUNOYwh2PHbhSKKshhD4yyTQvBzRPeokLdRrt3KqiVO+Ybj4K6XEML8RB
	O1qWX4BYfdmDbS98j/Bu+mmLyYLAAk8AE+tjIB8CnTW4Sc5FjM0R4+gl9jRqDjBnwnabqYzi/Sv
	ucwhA3+qcUG4pkh27JgkyZrX+vm23Bgi1rYQTSy0+N0qSSxxkXnZ/I0yDnhkB9aseRvdQ1GnoVU
	OSwVQNsXKhrTsV6/zANaTpzhHP+5dTpCsWZ7ioVudoim8e+23DteQXJDhhYnwjfMO4UMp961QEa
	p217JFxQbIWL83Oi7yH4m1sZpGLVdSNQ+O4frzIgOM2t9F8J4hdy3Du1yUb7kXkaysKuxFCQih4
	VdEyaJB0A9XG+q9e/99geXPAycOpNF/k2EhByU9ADeEXDP8GgvzP8LTbEX5Sl0bNIfI61O
X-Received: by 2002:a05:6000:41f7:b0:47f:4ac9:98bc with SMTP id ffacd0b85a97d-47fec63f8dbmr11018768f8f.24.1785934105000;
        Wed, 05 Aug 2026 05:48:25 -0700 (PDT)
Message-ID: <3de6fbd2-0e2c-46ac-b858-d3987833d796@gmail.com>
Date: Wed, 5 Aug 2026 15:48:16 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] xen/sched: rename scheduler registration symbols
To: Jan Beulich <jbeulich@suse.com>
Cc: andrew.cooper3@citrix.com, jgross@suse.com, gwd@xenproject.org,
 dfaggioli@suse.com, stewart.hildebrand@amd.com,
 nathan.studer@dornerworks.com, roger@xenproject.org,
 anthony.perard@vates.tech, julien@xen.org, sstabellini@kernel.org,
 michal.orzel@amd.com, bertrand.marquis@arm.com, Volodymyr_Babchuk@epam.com,
 teddy.astie@vates.tech, tpearson@raptorengineering.com,
 alistair.francis@wdc.com, connojdavis@gmail.com,
 xen-devel@lists.xenproject.org
References: <20260804055327.22119-1-frn1furkan10@gmail.com>
 <20260804055327.22119-3-frn1furkan10@gmail.com>
 <14dd261f-8d78-4c24-b927-f7f2c01dbdf8@suse.com>
Content-Language: en-US
From: =?UTF-8?B?RnVya2FuIMOHYWzEscWfa2Fu?= <frn1furkan10@gmail.com>
In-Reply-To: <14dd261f-8d78-4c24-b927-f7f2c01dbdf8@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1785934105-192CC9EA-EC8BA660/0/0
X-purgate-type: clean
X-purgate-size: 2059

Hi Jan,

On 8/5/26 14:43, Jan Beulich wrote:
> On 04.08.2026 07:53, Furkan Caliskan wrote:
>> REGISTER_SCHEDULER(), schedulers[], NUM_SCHEDULERS, and the
>> per-arch SCHEDULER_ARRAY linker macro now register and hold
>> struct sched_ops instances rather than struct scheduler ones,
>> but still carry names describing the old type.
>>
>> Rename them to match the current behaviour.
>> No functional change.
>>
>> Signed-off-by: Furkan Caliskan <frn1furkan10@gmail.com>
>> ---
>>  xen/arch/arm/xen.lds.S      |  2 +-
>>  xen/arch/ppc/xen.lds.S      |  2 +-
>>  xen/arch/riscv/xen.lds.S    |  2 +-
>>  xen/arch/x86/xen.lds.S      |  2 +-
>>  xen/common/sched/arinc653.c |  2 +-
>>  xen/common/sched/core.c     | 33 +++++++++++++++++----------------
>>  xen/common/sched/credit.c   |  2 +-
>>  xen/common/sched/credit2.c  |  2 +-
>>  xen/common/sched/null.c     |  2 +-
>>  xen/common/sched/private.h  |  4 ++--
>>  xen/common/sched/rt.c       |  2 +-
>>  xen/include/xen/xen.lds.h   | 10 +++++-----
>>  12 files changed, 33 insertions(+), 32 deletions(-)
> 
> I'm not quite sure if all of this is really useful. In many (all?) places
> I think "scheduler" as a term is still quite applicable.
> 
> One (general) nit though: if already you touch malformed lines (overlong
> ones is which prompted this comment), please adjust them to be style-
> conformant.
> 
> Jan

The main reason I renamed those symbols was type consistency - since 
'struct scheduler' is now just the runtime per-cpupool object, keeping 
'schedulers[]' and 'REGISTER_SCHEDULER()' around to hold 'struct 
sched_ops' pointers felt like it might confuse someone reading the code 
later. 

That said, I get your point. At a higher level, those macros and linker 
arrays are still just registering scheduler implementations, so keeping 
the names is okay too. If the maintainers prefer keeping the existing 
naming, patch 1 can simply be taken on its own without the second patch. 

Juergen, what do you think here?

Thanks,
Furkan Caliskan


