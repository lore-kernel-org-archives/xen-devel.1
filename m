Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9C3C606A321
	for <xen-devel@archiver.kernel.org>; Mon,  9 Nov 2026 15:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k3qG/lGk
Received: from list by lists.xenproject.org with outflank-mailman.1480230.1684196 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQQrq-0007ow-2x; Mon, 09 Nov 2026 15:01:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1480230.1684196; Mon, 09 Nov 2026 15:01:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQQrq-0007op-05; Mon, 09 Nov 2026 15:01:06 +0000
Received: by outflank-mailman (input) for mailman id 1480230;
 Mon, 09 Nov 2026 15:01:04 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xQQrn-0007oN-Rc
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 15:01:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQQrn-00828u-8S
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 16:01:03 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6af1e025-2eae-0a2a0a5409dd-0a2a4507c592-42
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 16:01:03 +0100
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6af1e02f-b4ea-0a2a45070019-d1558036e96e-3
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 16:01:03 +0100
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4a2167bd087so9763275e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 07:01:03 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-65-71.play-internet.pl.
 [109.243.65.71]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b90f10c701sm138316425e9.11.2026.11.09.07.01.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Nov 2026 07:01:01 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Content-Language:References:Cc:To:From:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794236462; x=1794841262; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GYMtx1+UE7FqTGOzyZm0e927UNQLYRi6PMl48Gx7L9k=;
        b=k3qG/lGkb7tPQxtGYKoQXodAzSm6oxnUVEMrP0ZT+TLFjsNweiryK0ewRtMVRRyezM
         941e6izX6CQQORPrMVxa0Tp7PSzkS4Df3I6RMdgeyIKyCNR5+s623yCyLVUqKFBuXDUK
         8tKzY1W6+/T3bH6P+bZCmVyD6XEpmOHLW06la7sFRaPJRt3krSEL2S5yXGkOIU9e79Ki
         yvkw/N6EGI+H/tbdnmEmmS/nLzt/tMS2/wMPxri/Hci3vP/saju4dQUPYVAHgoNMMSgr
         Wa3T1mluHbv+Toa0BPdBwT20al6zXIlvk0gn4b5k7uSZG+7pD33g4bZK9kJgufkvxOe9
         556g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794236462; x=1794841262;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GYMtx1+UE7FqTGOzyZm0e927UNQLYRi6PMl48Gx7L9k=;
        b=Y6PfS5Q8O1Jj6iNgNoGYPryVpfIfipKDxfpV6LnoIXxOHrgydiaZ/pH2+TK0sHljQc
         lMH4/LCgTDgNHu2Fg2/mrHcdld38sfIwonuUWhpjkzw8umjeD1iroLbQeINpu0FTex3K
         NI39ASpoElCJbubOLthewEJIa7935rY5QUNcVzGAFeRtBdAuuwT7W/bWk17rbqzRGUPb
         zXgHsV41pjfH0zwakHGLmQsy/1ED8lxSPM534cZtroOyodhxBrAvaMnSdYhJVw1H+05S
         GvSI7bfBacCQNipbnH1AbedBFhzj4evPEsROgms3e8hwdvklRNDCxV7v1whG/0cx557v
         JqXw==
X-Gm-Message-State: APuU4Z+MGP4t2cuVC3KefAfbU/Jq/JdsOEtvO5eA5y9Rl2uxlYvWi8rG
	AIbpPRHSLNMzchC9FN/MOnWb9axTjv7I/hCVhYJMdB27GFaSS028or89
X-Gm-Gg: AYBFou218OYUpb9M+GGCtaGHs6Y6788jpaRuoQq7v95R9BrRNdW5YUXQeu7o/TJ4LSo
	8Lxq9UokJA1Ytu/13lfIWCqJQQH75ZeSeI7yyWKUzuBEcLVXVUzFaDaENuFedOu7dv/1eSGIe2D
	m5OHjp+nFdQUuF+ndA8VbDIYErkdabW+bbcgVIInnM9AUqdJmHpwsmxYrZaHAnIPTQ8+zHMd+Ns
	/D0MHQezMbptUyBx4RMUMjioeCOz0NrnDFedq4P7gKNsndKLp8E2uQcEZb8NWYQb8BAHkLNJz5V
	TOQrK0dmhHG4tbTAySC84Zv+ggbP0TZshkSFLvPCgvzjuMnqgYSWsjmWS9fvjTb569+Zv0EnRrd
	31LHCjU++NxvBROnTN77b4GaJVWPCRnPACPi/a8NFOTqRsGS39r1MF/KkixcXx69/PqPSBqwC2i
	ooI1jlVhwlvl/mmUbTJFrMCccIHrVyriek4pYR8Zvfj2Xp0YyobLuRV5dMrMzEuSqYfe/gmkil1
	bIHhB6ghH/dBnU6GtF8z6pjzygVsZih6umgc6nx7HdBcPobabTou+1ehCJlhWcoZPPzKHlgvR+U
	+f5MGHcaold1XXxTvBhNFNaMnd5t7ZIhD+QYHpAV2/fCH8vHIPxI6nyD9GfggO/hmQOima1MzkY
	v
X-Received: by 2002:a05:600c:83c8:b0:4a3:18ca:806 with SMTP id 5b1f17b1804b1-4b963c6bc6amr73973005e9.20.1794236462241;
        Mon, 09 Nov 2026 07:01:02 -0800 (PST)
Message-ID: <17fe3d2b-8d48-4926-ae4c-14fedf74ea8a@gmail.com>
Date: Mon, 9 Nov 2026 16:01:00 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 31/39] xen/riscv: remap interrupts to new IMSIC VS-file
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>
Cc: xen-devel@lists.xenproject.org,
 Romain Caritey <Romain.Caritey@microchip.com>,
 Zheng Zhang <zhangzheng@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1790779209.git.oleksii.kurochko@gmail.com>
 <45011daea86267b8f4b707bc7de6357b0712fb08.1790779209.git.oleksii.kurochko@gmail.com>
 <1793023599.8631fc262581453bbf619ec5b2062170.1a17888e252000f79f@vates.tech>
 <d272b357-b5cc-42e6-9a84-753f361ad278@gmail.com>
 <1793971568.8631fc262581453bbf619ec5b2062170.1a1b109bd79000403d@vates.tech>
 <294b2a3f-ba42-4e04-afa1-ee56ffe7133b@gmail.com>
Content-Language: en-US
In-Reply-To: <294b2a3f-ba42-4e04-afa1-ee56ffe7133b@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1794236463-37AD0AE4-0B5A0DB8/10/73395122804
X-purgate-type: spam
X-purgate-size: 5179
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/9/26 11:19 AM, Oleksii Kurochko wrote:
> 
> 
> On 11/6/26 2:26 PM, Baptiste Le Duc wrote:
>> On 2026-11-05 17:57 +0100, Oleksii Kurochko wrote:
>>> [ ... 52 lines skipped ... ]
>>>
>>>> At this point vgein_assign()
>>>> is still BUG_ON("unimplemented") too, so none of the new code can
>>>> actually run, and the error path can't be reviewed against the real
>>>> vgein_release().
>>>>
>>>> Also, until "introduce IMSIC h/w interrupt file attaching to vcpu", no
>>>> vCPU ever owns a h/w file, so imsic_migrate_vcpu() can only hit the
>>>> CPU_NONE check.
>>>>
>>>> Wouldn't it be simpler to move the two already-acked patches and the
>>>> attach first, so that no stubs are needed and each migration step is
>>>> written against its real callees when it lands:
>>>> - Add basic VGEIN management for AIA guests (real vgein_assign() and
>>>>     vgein_release(); the reason for the explicit cpu argument of
>>>>     vgein_release() would then have to go into this commit message)
>>>> - Map IMSIC interrupt file for vCPUs (real imsic_map_guest_file())
>>>
>>> I think I have such order before and it was changed becuase for locks in
>>> the first patch it wasn't enough context to understand if they are
>>> needed or not.
>>>
>>>> - Implement continue_new_vcpu() and set hstatus.VSXL
>>>> - Attach a h/w interrupt file to a vCPU on its first run, introducing
>>>>     imsic_vsfile_acquire() and imsic_update_state() with their first 
>>>> user
>>>>     (acquire, vaplic_reconfigure_target(), set hstatus.VGEIN)
>>>> - Prepare new IMSIC VS-file (on top of imsic_vsfile_acquire())
>>>> - Implement APLIC-IMSIC-hart sync barrier for vCPU migration
>>>> - Remap interrupts to the new IMSIC VS-file (APLIC retarget + sync)
>>>> - Save/clear old VS-file, restore, SGEI wake-up as today
>>>>
>>>> A side benefit: attach no longer has to be squeezed into the finished
>>>> migration code, so imsic_vsfile_move() with its first_attach argument
>>>> and the goto set_vgein go away. Attach stays a plain sequence, and
>>>> imsic_migrate_vcpu() simply reuses imsic_vsfile_acquire().
>>>
>>> I'm fine with that order. It does mean that "add basic VGEIN management"
>>> and "map IMSIC interrupt file for vCPUs" introduce functions whose first
>>> user only comes with the attach patch a few patches later. If that's
>>> acceptable, I'll add a post-commit note to each of them saying where the
>>> functions get used (as IIUC, they will first introduced and then used in
>>> later patches).
>>>
>> Yes, the post-commit notes are fine with me. IMO it's better to introduce
>> the real functions before their first caller, even if that caller only
>> lands a few patches later, than to write callers against stubs. That way
>> each migration step is written against its real callees, and the order
>> follows how IMSIC actually works: a vCPU gets a file on its first run,
>> and only then can that file be migrated.
>>
>> The locks in the VGEIN patch would then get a real user a few patches
>> later (the attach patch), and that patch's commit message can explain
>> why they are needed.
>>
>> What do you think of something like this, after "introduce
>> vaplic_reconfigure_target()"?
>>
>> - Set the guest's XLEN explicitly in hstatus.VSXL (moved before
>>    continue_new_vcpu(), with the vcpu_set_vsxl() call added to its stub,
>>    so that no commit enters a guest with an undefined VSXL)
>> - Implement continue_new_vcpu()
>> - Add basic VGEIN management for AIA guests (acked; the commit message
>>    would have to explain the explicit cpu argument of vgein_release())

Would you be okay with such explanation:

vgein_release() takes the pCPU the VGEIN belongs to explicitly rather
than relying on v->processor, as the two may differ: a vCPU moved to
another pCPU has to release the VGEIN of the pCPU it leaves, while
v->processor already names the new one. As the bitmap of a pCPU may thus
be changed from another pCPU, it is protected by a lock.

I tried to write in the way as it is requirement to API rather than a 
description of the code which will be introduced later somewhere in "=== 
migration"

~ Oleksii

>> - Map IMSIC interrupt file for vCPUs (acked)
>> - Attach a h/w interrupt file to a vCPU on its first run, introducing
>>    imsic_vsfile_acquire() and imsic_update_state() with their first user
>> === migration
>> - Implement APLIC-IMSIC-hart sync barrier for vCPU migration
>> - Remap interrupts to the new IMSIC VS-file ("Prepare new IMSIC VS-file"
>>    folded in, as with imsic_vsfile_acquire() already there it is reduced
>>    to a single call)
>> - Save and clear the old IMSIC VS-file on vCPU migration
>> - Restore register state in the new IMSIC VS-file
>> - Wake up a descheduled vCPU on a guest external interrupt (last, as it
>>    arms HGEIE in imsic_migrate_vcpu() and clears it in
>>    imsic_vsfile_local_read_clear())
>>
>> But I'm not an expert in patch series management, so I may be wrong.
> 
> Let's see how it works. I'll try to reshuffle the patches as suggested.
> 
> Thanks for the suggestion!



