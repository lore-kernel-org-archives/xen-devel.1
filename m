Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BA4B606A326
	for <xen-devel@archiver.kernel.org>; Fri, 20 Nov 2026 08:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=we9Run/T
Received: from list by lists.xenproject.org with outflank-mailman.1497845.1695894 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xUKC6-0001tm-0z; Fri, 20 Nov 2026 08:42:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1497845.1695894; Fri, 20 Nov 2026 08:42:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xUKC5-0001tf-UJ; Fri, 20 Nov 2026 08:42:05 +0000
Received: by outflank-mailman (input) for mailman id 1497845;
 Fri, 20 Nov 2026 08:42:04 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xUKC4-0001tZ-IR
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2026 08:42:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xUKC3-00EFaZ-NR
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2026 09:42:03 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6b0007c8-8faa-0a2a0a5109dd-0a2a4506b5ec-46
 for <xen-devel@lists.xenproject.org>; Fri, 20 Nov 2026 09:42:03 +0100
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6b0007db-195a-0a2a45060019-d1558035e99f-3
 for <xen-devel@lists.xenproject.org>; Fri, 20 Nov 2026 09:42:03 +0100
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4bb6ba3b244so5057525e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 20 Nov 2026 00:42:03 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-65-71.play-internet.pl.
 [109.243.65.71]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb8960068fsm17850305e9.4.2026.11.20.00.42.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Nov 2026 00:42:02 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795164123; x=1795768923; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rgDaTbTK8q+ISbwwjcwXPUxhzOvp7RHdvmzduxTFzts=;
        b=we9Run/TGe8Hr+azywFsa46vKgdjchhnRBiwNqKk0Hm/b8STjtZcQndkDOSdNixt2S
         +yO8AyDvRVGY7O/437FNIDbe25lya6Fldoz31rnQ9UGdknrMxdzW+9rx8/YibWhtPGq8
         XYuPoASAt+TUTbI1R7YFFdRxb/ahU90LDNPc/kfs5lWtTUh3IborpS0DkuICqHD/+UiO
         lGtiG6MdZgRmuGB+g6aVFP33bBsPp3zfuujCNeyvsAOKiCXISVeYmqb3Lby2QRkjO0KW
         g6YuzCjUJcAdah+faYDMKQ1SIELWxf8MRQW/gN7CWouWb5dFYCgtmn6mW4tM6aWLODsO
         T01w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795164123; x=1795768923;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rgDaTbTK8q+ISbwwjcwXPUxhzOvp7RHdvmzduxTFzts=;
        b=ivg7bSQvwFZ0fprO9hlVZbkOWz/eKyUIMOM7qhGvdxL671DgOcTqde+dyTByQyYjlt
         bg4dbLs1RCIEXc/fi6WtpeCWYGGzBjquOeWt0nGK94avwWuYtfYeFBJ2gBbB3RxnbOw+
         omgx8Ndk/1qzfNz5xhtfIe22seNI1Dei2P1GJ2srCJnsFlMvlQ7Thnv9Z3H3712RAIyO
         VanOP+utKKySCD/WkJxEDsN0R+rx6AeSiP+5meEIsAG5yIEUiIeIBoxmBEAaJrou5HyM
         J9SB5F++A0MgQW9drsvGTjApRUyt+inGrqDIE+CYPctJXLhGBb4ErVXjUcsCLPWBIy0O
         DJmg==
X-Forwarded-Encrypted: i=1; AL+hErF+7auL2V6txZ/XSfQrTD0tCTfn90XPYBCMFbCW9+/Wa0/pn3/Y5D2d2UofXO/lWtrQnbTt6u1yYAA=@lists.xenproject.org
X-Gm-Message-State: APuU4Z918anSwlUBVDTvvtxk1rLx6nv9FrDjnyx+9CVpRujPj0new0hT
	3s7G8H8ukLnhSWD6y88rVYdl1GTWlBBVKqhQ41OGSyDErIkojbYZOJZy
X-Gm-Gg: AYBFou3IqPmQobR7prUfnUvuhF68vr0gimhsyxNy7Rcadn3mqyk0Hg27MZzd0BIhGXO
	5Tcaunb/BYGzJH1Q+MUaChGBotm9akYjhe0tT1WaHKfKAIa13rBIcsjyJ7K3Aor0SgQ92u1X0hi
	LBCAMdO2qJYaZnxkruVElF/3yAvFT8ksS0J2sRc14AcgwFJiLhlxZnz7KZZgXuCjO7bbvDyCqbN
	T1XAHarVe9LVesilWCAC/P3DbQZz6A5Lv2Iw4aEaKJrhdG7KnuIXKcvpyDXzn8Ja4i55/jvHSJZ
	TrhBPevGth6CG8nhLCtHGvNjlN0m6ipanN7kS7khqCgMxF6HQpvZD9oQUAFqaOwkWZvdushzVtU
	qOfLiQNvl5XyiSmK81f1f3q5DjzKWLl6nKherlE06EsT8+1iCvsEmF29Q8rZrnXnixYeVELecHI
	y+jFDLZro6x/D30wyzOj02yEY1bkfqKQrd3h9QRx9S3IvcWJY0NCYN+oAtMlmZxG3jgceztP8Vs
	LHpbcsw17RsP2uN0RoMQf8GR2OTrZuAgIJA5vx6/w7XSiS8JlQCGJEt/coNl6Or8e1f0cXvx7Xy
	AEqLFdcbirypGlAlUGd5e0Xl4Fjs7SctAoeoMe77eGaYarOeDN7ZN/6KTZMhvQS1uttbf1rYhtV
	rGg==
X-Received: by 2002:a05:600c:6219:b0:4bb:60b1:4409 with SMTP id 5b1f17b1804b1-4bb88816525mr47372495e9.19.1795164123025;
        Fri, 20 Nov 2026 00:42:03 -0800 (PST)
Message-ID: <cefacdef-a9fc-4e8a-ae5b-6fab925109bc@gmail.com>
Date: Fri, 20 Nov 2026 09:42:01 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/riscv: vsbi: add SBI TIME extension
To: Hiago De Franco <hfranco@baylibre.com>, xen-devel@lists.xenproject.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Connor Davis <connojdavis@gmail.com>, Ronaldo Nunez <rnunez@baylibre.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <20261119-riscv-vsbi-time-ext-v1-1-1d5813a883e6@baylibre.com>
 <7deceb1b-bf57-4e0b-9181-da1d638fda70@gmail.com>
 <bkmmgcqrbq47i7gxn3nt64xrypt2l2hrhlbip7rv7cfo7p6dqs@lssohgkujou5>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <bkmmgcqrbq47i7gxn3nt64xrypt2l2hrhlbip7rv7cfo7p6dqs@lssohgkujou5>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1795164123-1FACA77B-F388396A/10/73395122804
X-purgate-type: spam
X-purgate-size: 3133
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/19/26 10:34 PM, Hiago De Franco wrote:
> On Thu, Nov 19, 2026 at 02:52:46PM +0100, Oleksii Kurochko wrote:
>>
>>
>> On 11/19/26 12:59 PM, Hiago De Franco wrote:

[...]

>>
>>>
>>> Tested by booting dom0less Linux guest, which prints "SBI TIME
>>> extension detected". To test this, I used the fork from Oleksii [1]
>>> (branch riscv-next-upstreaming) to boot linux guest with dom0less.
>>>
>>> Since this is an isolated patch and applies to the xen master branch, I
>>
>> Please note, though, that development happens on the staging branch; master
>> lags behind it, so patches should be based on staging. This one applies to
>> staging as is.
> 
> Noted, I was basing it on master. I will fix that.
> 
>>
>>> decided to send the patch. Please let me know if this is not correct.
>>
>> Generally speaking, I can't say whether this is right or wrong. IMO, we
>> should have a policy that we all agree on. If I'm not mistaken, Bruno
>> invited you to our weekly Xen RISC-V meetings, and we have one today. It
>> would be great if you could join us so we could discuss these things.
>>
>> At this point, the patch does look independent and ready to go. However,
>> another option would be to take the patch to the riscv-next-upstreaming
>> branch, apply it there, and verify that it works. That said, this might not
>> be the best general approach.
>>
>> The patch is currently targeting upstream/staging, which cannot boot any
>> guests. Strictly speaking, it is therefore difficult to verify how the patch
>> works without fetching [1], switching to the mentioned branch, and applying
>> the patch there. In this sense, the fact that staging cannot currently boot
>> a guest creates a kind of "logical dependency".
>>
>> So, technically, we could proceed with this patch as it is. However, if you
>> could join today's meeting, it would be good to discuss how we should handle
>> similar situations with future patches and agree on a general upstreaming
>> policy.
> 
> Got it, since we had the call today I will prefer to proceed as the
> following:
> 
> I will open a MR on https://gitlab.com/xen-project/people/olkur/xen
> staging branch, we do the testing and reviews there and once we have
> more work done upstream, I will resbumit or submit a v2. That way we add
> code upstream that is really capable of being tested.

Just a small remark.

We don't push changes directly to staging, as it is a protected branch. 
Of course, force-pushing is technically possible, but that would put us 
out of sync with upstream Xen's staging branch, meaning we'd probably 
have to force-push all the time, which could lead to other issues as 
well. What isn't good.

Usually, changes are brought to downstream staging only after they have 
been merged into upstream staging. So, basically, we just need to run 
git pull upstream staging.

Therefore, if you want to proceed with an MR, it would be better to 
target riscv-next-upstream.

Feel free to suggest a better approach if you have one in mind. I'm 
pretty open to suggestions.

Thanks.

~ Oleksii


