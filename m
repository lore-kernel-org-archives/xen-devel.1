Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13F71C982FA
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2026 14:26:52 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1428984.1651909 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x91SE-0006nR-Ja; Tue, 22 Sep 2026 14:26:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1428984.1651909; Tue, 22 Sep 2026 14:26:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x91SE-0006nK-FA; Tue, 22 Sep 2026 14:26:42 +0000
Received: by outflank-mailman (input) for mailman id 1428984;
 Tue, 22 Sep 2026 14:26:41 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x91SD-0006n8-0h
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 14:26:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x91SC-003Exz-Dp
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 16:26:40 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ab29012-bab6-0a2a0a5309dd-0a2a4505bf42-38
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 16:26:40 +0200
Received: from [74.125.225.76] (helo=mail-wr2-f12.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ab29020-4cb1-0a2a45050019-4a7de14ca6bb-3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 16:26:40 +0200
Received: by mail-wr2-f12.google.com with SMTP id
 ffacd0b85a97d-482f63546c3so3344282f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 07:26:40 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-71-234.play-internet.pl.
 [109.243.71.234]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-488627314d2sm5572350f8f.2.2026.09.22.07.26.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Sep 2026 07:26:39 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1790087200; x=1790692000; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A7Sq8j8QIedgbYpG7RY4msDcbFCXXkohdyLjyVH/YZQ=;
        b=Mai0xYeOsNBuvd4xiygRb8442MdSj5nS6eJb6M7ile+pbXh+S8jbIAAfUVHUq8fcL5
         dz26q71FDv6c4Az+/vDNtYBld0xXO3uD2UG8SUbwwlUloXyHX0ww+rPCWbGh7pEe8o3G
         1NfHGk6QU6bWHG3CxIjynnYI/Ej8hxmMmE6mjfURnfEv/uHNb2twn+Sx41Eg620F+Uoh
         gUzBiFsUnginIVIKvVhxD+xc1UkQO/pN8pJr5RZg6AIdFuGVD7ULYpdEdGv0ujd3a/1o
         iCN9weTLBtsFHq4Ak0YPw7Otp+4NpuwhB5iGLVxBRYxjgXkjE+ZZZP8zY98REZRpFGPz
         xZlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790087200; x=1790692000;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A7Sq8j8QIedgbYpG7RY4msDcbFCXXkohdyLjyVH/YZQ=;
        b=wY6gYpHe+tCRADMnYIoaWrg3HITcwMqvgzTjIvrHbc0RRqyMvRH7dthxUp1MsvI0AJ
         c+nkSz69vaxwaBMqr02ktYlNRE6W77ol9Vh1u4yyjNuhUhImxlI+TXrQMHO54+Xk5Wt6
         J7eoVSC/PCJLEHkuTAvaJets2ePu2PPNdCmkgax0N1F/MJZD0WryCEVBGyGnSuOnnfvJ
         yNMU3FI+VxHjSact2iTNx11cYHRd/TLnjAndHbNRVgw5T79JZp9L3OkYrXowzaJ5M6E+
         MJt/8djVZA1dfkuciEyEibQslncpmgDulCCc1mG1qzk2GTHlKEfwjTkKS/tJIU+4pdC2
         UnEQ==
X-Gm-Message-State: AFuF++mY1WVYq1rO1++HlX03LY80AiN5cU6b+RAVyGVOliEPhdeX298t
	WiFS3t0ZGzF1EWrGZt4F+VwYtJHDVf2VDC7gqSPST2LhgpIc8H0UnYRV
X-Gm-Gg: AYBFou2xrShicVLO2kMp4NLcwmNFR5ttYqTRTFyPdNhrcKt3Sf3Lz0tSAI/VhzaL/2X
	hIJrWvcUFc2L+CMCJOY1guYYV9+7jG1wLfDDB7ckmLUMRU6zhm+oQZkCzEgvvTmnet3M2Fgy2RB
	bCJo5mtywoAPXRWrIzCfxjXEea+2MLR3J5SJ+dZD55X3pdQTcC/xJHsw+ZH32PLpI2iRhEPTAMV
	1Y/UH2E0YBqbDVKapJhmVuggVJjWo+663QwxuAfbPcKIZCO+GJzIughwgiB/AOmRKLq/JCGwQiN
	hy9rqYsUQAb4SeBpN5TGymEMR43lO2fz1gMW9HgsmGQQrtQR6TTRRI5mhEZz5BryNw07ZWuLIJ8
	zWlEO7cPhmLQ1enwGjpNrg4w0Rfg8LgIkq32gxQO3UEJhxaM8mVaLPPYahyg9PZ4stEonCApwv8
	03QIljAZq5tCewe7HoqWf9H/spGlg/WrS1IdgAseVOGpRPHB5werM7KlNrP2hxB64Gw9vQMjZ5t
	vt2zvxzqdci4fZ2zBotD2cXEjFfkV8pf3C3Q4Rzt/e7kGnaaQ==
X-Received: by 2002:adf:e18c:0:b0:487:b00:3853 with SMTP id ffacd0b85a97d-4871e269d9cmr18711365f8f.27.1790087199779;
        Tue, 22 Sep 2026 07:26:39 -0700 (PDT)
Message-ID: <66104177-def7-419e-b6c6-55c3cbc04ddc@gmail.com>
Date: Tue, 22 Sep 2026 16:26:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] xen/riscv: make Zihintpause no longer a required
 extension
To: Jan Beulich <jbeulich@suse.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>
Cc: xen-devel@lists.xenproject.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <1789032657.8631fc262581453bbf619ec5b2062170.1a08aa7f23b000c4f3@vates.tech>
 <1789032898.8631fc262581453bbf619ec5b2062170.1a08aaba10f000c4f3@vates.tech>
 <20c2003f-910b-4e9b-92f4-5298f11f58df@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20c2003f-910b-4e9b-92f4-5298f11f58df@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1790087200-F5CA82A1-6D5B9AA2/10/73395122804
X-purgate-type: spam
X-purgate-size: 2149



On 9/22/26 2:27 PM, Jan Beulich wrote:
> On 10.09.2026 11:34, Baptiste Le Duc wrote:
>> required_extensions[] panics at boot if Zihintpause is missing, but Xen
>> never actually depends on it: cpu_relax() only emits the "pause" hint when
>> the extension is implemented, otherwise it emits `0x0100000F`, a legally
>> valid FENCE instruction (`FENCE W, 0`) rather than a native NOP.
> 
> Just that PAUSE's encoding is 0x0100000F. I.e. what is emitted is always
> the same, and hence discussing the encoding aspect here doesn't help
> justify the change. NOP or not also doesn't really matter here. The
> specific hint encoding looks to fall into what prior to Zihintpause would
> have been covered by "Designated for future standard use", and hence ...
> 
>> FENCE is
>> guaranteed by the RISC-V base ISA, so it never raises an illegal
>> instruction fault. With an empty successor set, it enforces no
>> memory-ordering constraints and thus architecturally behaves as a NOP.
> 
> ... there indeed should be no concern for any platform playing by the
> rules.
> 
>> Drop it from required_extensions so hardware without Zihintpause
>> still boots.
>>
>> Assisted-by: Claude:claude-opus-5
>> Signed-off-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
>> ---
>> Changes since v1:
>> - rewrite commit message.
> 
> I fear another round of re-writing is going to be necessary, sorry.

Would it be better:

required_extensions[] panics at boot if Zihintpause is missing, but Xen 
does not strictly require hardware support for it.

The PAUSE hint (Zihintpause extension) is encoded as FENCE W, 0 
(0x0100000F). In accordance with the RISC-V Unprivileged ISA, HINTs are 
encoded in the space of valid standard instructions. On platforms 
without Zihintpause support, executing 0x0100000F is treated as a 
standard FENCE with an empty successor set, which acts as a NOP and 
never generates an illegal instruction trap.

Therefore, Zihintpause is purely an optimization hint. Drop it from 
required_extensions[] so systems without explicit Zihintpause support 
can boot Xen successfully.

?

~ Oleksii

