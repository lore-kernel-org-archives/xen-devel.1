Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9877A606A319
	for <xen-devel@archiver.kernel.org>; Wed, 21 Oct 2026 21:35:49 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1457629.1670257 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJdxx-0003ml-Me; Wed, 21 Oct 2026 21:35:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1457629.1670257; Wed, 21 Oct 2026 21:35:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJdxx-0003md-IG; Wed, 21 Oct 2026 21:35:21 +0000
Received: by outflank-mailman (input) for mailman id 1457629;
 Wed, 21 Oct 2026 21:35:20 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien.grall.oss@gmail.com>) id 1xJdxw-0003mX-86
 for xen-devel@lists.xenproject.org; Wed, 21 Oct 2026 21:35:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xJdxv-000RC6-LD
 for xen-devel@lists.xenproject.org; Wed, 21 Oct 2026 23:35:19 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <julien.grall.oss@gmail.com>)
 id 6ad93017-e002-0a2a0a5209dd-0a2a45098168-0
 for <xen-devel@lists.xenproject.org>; Wed, 21 Oct 2026 23:35:19 +0200
Received: from [209.85.221.47] (helo=mail-wr1-f47.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <julien.grall.oss@gmail.com>)
 id 6ad93017-be1a-0a2a45090019-d155dd2fe1ec-3
 for <xen-devel@lists.xenproject.org>; Wed, 21 Oct 2026 23:35:19 +0200
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-48dee593f18so954499f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 21 Oct 2026 14:35:19 -0700 (PDT)
Received: from ?IPV6:2a02:8012:3a1:0:e0eb:d807:1db9:ec95?
 ([2a02:8012:3a1:0:e0eb:d807:1db9:ec95])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e254f093asm8390996f8f.4.2026.10.21.14.35.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Oct 2026 14:35:18 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792618519; x=1793223319;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vuf4gu+cZK0zwE9Bo0/B6FEPxPMzK24nZpHR8b9+Svo=;
        b=Av51VF8Hsx17/+T7ufGM4CYiOkPtDxN3wSeYuuJFU5Gq2VvRMc8WxjDdevEp/5xuxW
         li9UcyqJMyLzYtqc6g0i+K53+piC7OHaYdWEn3SP8QX6Hb7mbNCP6YkfOstFyenYgmTU
         WN3n8v0iOvGeTXV0810sDJgh8/GZwHC7OmGqofeYxpyB1neDZSu8spkFb8YJYP0wUwd4
         5eaFnVruZgJXKqU88bazALzr1lalqRjuVtp70ng6ahvUml+dXnk0Nn4Nn3LT2D6DrANy
         kKD3aKlSVw/Zb/BLmmdXTiOHlhHvDg+Vywp9TprzTkfcDYPc0DdIjEbTWUNS3DOiQSVk
         0tvg==
X-Forwarded-Encrypted: i=1; AKwUvByHICuBNpI2iMo51/LFnz3xI1Bnex+SHzZgqvnHJAziV7rxYraQrTGERvIVnhiIAaNLKe1YZNnONes=@lists.xenproject.org
X-Gm-Message-State: AFq9FYLpxXcQui7YSN3kxquxkIoTiCFq9RKyhl4eh5oYcuuimtXvjtsF
	bfrTgB42jhk7gpqXLN354pKbBr7uNeHD4kvwun4c500oE1KRE55nA+rD1yOl3w==
X-Gm-Gg: AYBFou3Gf6JVnTtGx7tIBZGNj9ceYwn44OfNcIvMqOQaVTACEclXF6TLtiVrQvJgV8a
	YaLDR2Gh4rvq0GXXuVgRyllJHjsh1hhQrtiHCZu5jsE3yQfJ1/JdYyAVqoi7ae/sl/hTNysfmir
	BFp7BVzkGOf1OKSpSJkq3Vjr1yUXepkXHeaa/CZfNCsdhHP+KuE4z0CplCOvt66YWbNOYgv9ZZi
	u5z4yyAVscVKAizhbySez5lG/rWYgbAY03cHczHlR+iQ/dmwUdzmqZc3fB2sXvMsk4H/HHZDV82
	v6ouAql8KJM5RpPYaDbBad2/Kxt6Lb5S/hIpI9jDX3UwcckYYlQdcqT//fFgrT/Yo0bowkHFOjD
	PwogHMSSL3QPiXMPwRUvKSbbKN+xFaaSfuoy5ymwtgwSOdToYVBJCgKiRRWCD77b/lulwBuTBav
	T3ZvGMAD3ziTaL++5nts0qWjecgQkYGEyJc8Be+vYZTzCGZeXSj4TlDj4aI5hew07I7CZG8y6w7
	7b11B99oy/mYE6t55i8b9QnZyWW9z4Wh4T+AyGAxg4CrWovPrdErvL4b21MXSCZEBF8HstSUHjj
	FnEiCJart+5ENwcHlemyZ0tyxcsu/7/8LLI=
X-Received: by 2002:a5d:6f04:0:b0:48d:f3a4:610b with SMTP id ffacd0b85a97d-48e264bba16mr7462500f8f.25.1792618518953;
        Wed, 21 Oct 2026 14:35:18 -0700 (PDT)
Message-ID: <e887cad0-b637-4d22-8612-64498c2e27f8@xen.org>
Date: Wed, 21 Oct 2026 22:35:17 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: Fix under-mapping in map_range_to_domain()
To: "Orzel, Michal" <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20261007135848.220047-1-michal.orzel@amd.com>
 <055dc887-0cfd-4274-a5f6-e5afdd576746@xen.org>
 <9a4f56d4-4c2e-4d5a-8489-9300170729a3@amd.com>
 <71defbe4-44a1-4b76-8d0a-bcc6ab40515f@xen.org>
 <9d970022-6b08-421c-aca0-589a0b5c2c27@amd.com>
Content-Language: en-GB
From: "Grall, Julien" <julien@xen.org>
In-Reply-To: <9d970022-6b08-421c-aca0-589a0b5c2c27@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1792618519-3BCD7034-94E79509/0/0
X-purgate-type: clean
X-purgate-size: 2217
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Michal,

Sorry for the late reply.

On 12/10/2026 08:32, Orzel, Michal wrote:
>>>
>>> I don't think we can reject unaligned regions in map_range_to_domain()
>>> though, as the host DT is not under our control and hwdom would fail to
>>> boot on platforms with sub-page devices. I asked AI to look at the Linux boards
>>> for Arm and Arm64 (140 boards in total with unaligned regions) and even the
>>> boards we claim to support have nodes that would fail:
>>> - RPI4: hdmi@7ef00700, <0x7ef01f00 0x400>
>>> - IMX8QXP: clock-controller@5b290004, <0x5b290004 0x10000>
>>
>> I am not suggesting to reject unaligned regions when mapped into the
>> hardware domain. I am suggesting to reject it when we want to
>> passthrough to another domain. So we don't end up in a situation two
>> different devices on the same page are passthrough to two different
>> domains (or between Xen and a domain).
>>
>> Codewise, it would mean map_range_to_domain() would enforce the
>> alignment and the caller will be left to decide what to do. We could
>> also decide about the alignment base don whether this is the HW domain
>> or not within the function.
> For passthrough this is already the case. map_range_to_domain() does
> not map anything for nodes with xen,passthrough and the domU mapping is done by
> handle_passthrough_prop(), which rejects mstart, gstart and size that are not
> page aligned.
> 
> The remaining case is the overlay which can be attached to any 1:1 domain and
> this goes through handle_device() -> map_range_to_domain() without any alignment
> check. All the other callers operate on hwdom, so I think we could reject a
> region that is not page aligned if d is not the hardware domain, before granting
> the iomem permission in map_range_to_domain().
> 
> Shouldn't we accept this patch as is so that we can backport (overlay is not
> supported) it as a fix and then add a second one with a rejection mentioned
> above that will help the overlay (and any future) case?

Thanks for the input. I didn't realise we would want to backport this 
patch. If so, I agree the split make sense.

Acked-by: Julien Grall <julien@xen.org>

Cheers,

-- 
Julien Grall


