Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C326606A31C
	for <xen-devel@archiver.kernel.org>; Mon,  9 Nov 2026 10:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z0TcmJIS
Received: from list by lists.xenproject.org with outflank-mailman.1479788.1683692 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQMTN-0002IB-8g; Mon, 09 Nov 2026 10:19:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1479788.1683692; Mon, 09 Nov 2026 10:19:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQMTN-0002I2-4q; Mon, 09 Nov 2026 10:19:33 +0000
Received: by outflank-mailman (input) for mailman id 1479788;
 Mon, 09 Nov 2026 10:19:32 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xQMTM-0002Hn-FJ
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 10:19:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQMTL-00AJ3E-SK
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 11:19:31 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6af19e2e-2eae-0a2a0a5409dd-0a2a450baac8-36
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 11:19:31 +0100
Received: from [209.85.221.49] (helo=mail-wr1-f49.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6af19e33-b7e8-0a2a450b0019-d155dd31e164-3
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 11:19:31 +0100
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-48dee593f18so376808f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 02:19:31 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-65-71.play-internet.pl.
 [109.243.65.71]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49597748acbsm9003085f8f.44.2026.11.09.02.19.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Nov 2026 02:19:30 -0800 (PST)
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
        d=gmail.com; s=20260707; t=1794219571; x=1794824371; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GRrrDTvUaBKsTIfCV752eLshkQpUDjLWqiZyrQou2Ck=;
        b=z0TcmJISrJT5Sit3U2K82oeeeGL7xxsnl1tBoGMjT4xpTuNRQ1phl9rQwJPpbBbTKZ
         K68hEa2qyH4Iu2U8GrtoAUqm9ggGZOgEry6L+Vby5KNrWy+KvNl2ZyaZ9qdoVm5rYxfq
         LpF6QgK3vvrxoDX6NGFv3zZ/tsZnNVUbCaM7m/M0RpMaJUMeh3F0+DfsJk1EuMVL+cgs
         OOH2dBAuVbEh/OU5DTzvMts+JU84igzP9JCBZCP4+C/KxwIoqomL3e56VwBWxGIe/WzQ
         YuGWn+bYFYQXtJFHu1LangJSR00z32LiBjo+hSP6VGaIW8gdRW5ujGGAVrR6gqXKSSA4
         gZzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794219571; x=1794824371;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GRrrDTvUaBKsTIfCV752eLshkQpUDjLWqiZyrQou2Ck=;
        b=KCMVaa8JgcZ6OQK6f3Im1pxnLsJfUFGPdZGI3XOxRpA754/92e5HYgt6QLgKMdb2DD
         MPUklwjtwJ+YU8TUDtzzNiZCVvFKts1HHN93Sxq1d7cpgLXpqTsn/YpstAzckGzJ+Cuv
         YWPvUfC8JtFouM0IzXGWNb5X/4AAxwhtdGWtchfZKAzHLV5PSuJ4Vx+FWWsZeMeDCXzn
         +ObBHUG4YBfjTYW8qkyiHoT3/PjSeratnidPx1PCtDA/cYyvbl4k2T3wG/UWaCi6SY9k
         cAkojE4dXVf6TCY5qXn/2bFEpx75g6zJ/WI8Y3tChUXj+O5RPJWbEpEfBnsPLMEjJLNO
         TRwg==
X-Gm-Message-State: APuU4Z92TKkFTduqHWNkVSrn78wqT45c/kiCcnX/CrJai0gHF/+R3xE3
	YLmsE444dz5x1970Qoe5Bb68YW50qbsuRv7H29cuBO2SngdB6wJfcItz
X-Gm-Gg: AYBFou0kFVqcg7ITGG9S8bDRnKn1ZFjZQ5TuBQs/OV/uQ3wID6L9HZn5YIYok/MGE+E
	iUgGkE9B07ZG+JuMgU6lA1uUICv3IxdualiPcKUfTzSD5A1W9aYxRjubQcpSZFfPYzEQngrAOjR
	tLW9UA0aSozi0AgPnQcZ5iD6cS9IslRXuozUnuPaqPZszq2G5nXMqNN3gSiiX5OcQ6b0uxcy4Om
	E67NVl+E5iS2RiJM60DwX1TSNWVrq6nVXM9SvbhenHH5zDOpZXPRWIpI5/lrxyQjZSsJT7InoaL
	TZnNjtL6K3I+XGMZ4x6pw7b6yLlurNtrN467PhCy9N+982W0huYiMhj+JEsIsjEpkQ7JAlzVz71
	ifg2iM2NTB1S+RMU3aYnwXmBly2Ky4l1yHViNca9g8Q55JJOe+xSYjWLS42ZYmFkTe2LgydwRLf
	t/MwIIKt+hBRUUkBzmhUccpZ5rvjsJfhTxiw+xPAMkzLTJLjSlP0UL67F2mULYpIn1PjePdYSIZ
	M+IycMDHaEEbDg/su0x2W39QqjqtAaFACcLEA6of96sTfSSlp7AomJMGtiaeEJZJveLYUcSkpBE
	JN9S9pWHpXhGlu2dmAF5+xOdSjY/iyQ7CdaRPJP+nhePYeFuiWa3VmfgPYXgDLDvFhBzA3yrOSZ
	A
X-Received: by 2002:a05:6000:22c4:b0:48e:69ff:ba36 with SMTP id ffacd0b85a97d-4958ab9e6ecmr8173894f8f.28.1794219571093;
        Mon, 09 Nov 2026 02:19:31 -0800 (PST)
Message-ID: <294b2a3f-ba42-4e04-afa1-ee56ffe7133b@gmail.com>
Date: Mon, 9 Nov 2026 11:19:29 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 31/39] xen/riscv: remap interrupts to new IMSIC VS-file
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
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <1793971568.8631fc262581453bbf619ec5b2062170.1a1b109bd79000403d@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1794219571-ABCD79EA-87852335/10/73395122804
X-purgate-type: spam
X-purgate-size: 4450
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/6/26 2:26 PM, Baptiste Le Duc wrote:
> On 2026-11-05 17:57 +0100, Oleksii Kurochko wrote:
>> [ ... 52 lines skipped ... ]
>>
>>> At this point vgein_assign()
>>> is still BUG_ON("unimplemented") too, so none of the new code can
>>> actually run, and the error path can't be reviewed against the real
>>> vgein_release().
>>>
>>> Also, until "introduce IMSIC h/w interrupt file attaching to vcpu", no
>>> vCPU ever owns a h/w file, so imsic_migrate_vcpu() can only hit the
>>> CPU_NONE check.
>>>
>>> Wouldn't it be simpler to move the two already-acked patches and the
>>> attach first, so that no stubs are needed and each migration step is
>>> written against its real callees when it lands:
>>> - Add basic VGEIN management for AIA guests (real vgein_assign() and
>>>     vgein_release(); the reason for the explicit cpu argument of
>>>     vgein_release() would then have to go into this commit message)
>>> - Map IMSIC interrupt file for vCPUs (real imsic_map_guest_file())
>>
>> I think I have such order before and it was changed becuase for locks in
>> the first patch it wasn't enough context to understand if they are
>> needed or not.
>>
>>> - Implement continue_new_vcpu() and set hstatus.VSXL
>>> - Attach a h/w interrupt file to a vCPU on its first run, introducing
>>>     imsic_vsfile_acquire() and imsic_update_state() with their first user
>>>     (acquire, vaplic_reconfigure_target(), set hstatus.VGEIN)
>>> - Prepare new IMSIC VS-file (on top of imsic_vsfile_acquire())
>>> - Implement APLIC-IMSIC-hart sync barrier for vCPU migration
>>> - Remap interrupts to the new IMSIC VS-file (APLIC retarget + sync)
>>> - Save/clear old VS-file, restore, SGEI wake-up as today
>>>
>>> A side benefit: attach no longer has to be squeezed into the finished
>>> migration code, so imsic_vsfile_move() with its first_attach argument
>>> and the goto set_vgein go away. Attach stays a plain sequence, and
>>> imsic_migrate_vcpu() simply reuses imsic_vsfile_acquire().
>>
>> I'm fine with that order. It does mean that "add basic VGEIN management"
>> and "map IMSIC interrupt file for vCPUs" introduce functions whose first
>> user only comes with the attach patch a few patches later. If that's
>> acceptable, I'll add a post-commit note to each of them saying where the
>> functions get used (as IIUC, they will first introduced and then used in
>> later patches).
>>
> Yes, the post-commit notes are fine with me. IMO it's better to introduce
> the real functions before their first caller, even if that caller only
> lands a few patches later, than to write callers against stubs. That way
> each migration step is written against its real callees, and the order
> follows how IMSIC actually works: a vCPU gets a file on its first run,
> and only then can that file be migrated.
> 
> The locks in the VGEIN patch would then get a real user a few patches
> later (the attach patch), and that patch's commit message can explain
> why they are needed.
> 
> What do you think of something like this, after "introduce
> vaplic_reconfigure_target()"?
> 
> - Set the guest's XLEN explicitly in hstatus.VSXL (moved before
>    continue_new_vcpu(), with the vcpu_set_vsxl() call added to its stub,
>    so that no commit enters a guest with an undefined VSXL)
> - Implement continue_new_vcpu()
> - Add basic VGEIN management for AIA guests (acked; the commit message
>    would have to explain the explicit cpu argument of vgein_release())
> - Map IMSIC interrupt file for vCPUs (acked)
> - Attach a h/w interrupt file to a vCPU on its first run, introducing
>    imsic_vsfile_acquire() and imsic_update_state() with their first user
> === migration
> - Implement APLIC-IMSIC-hart sync barrier for vCPU migration
> - Remap interrupts to the new IMSIC VS-file ("Prepare new IMSIC VS-file"
>    folded in, as with imsic_vsfile_acquire() already there it is reduced
>    to a single call)
> - Save and clear the old IMSIC VS-file on vCPU migration
> - Restore register state in the new IMSIC VS-file
> - Wake up a descheduled vCPU on a guest external interrupt (last, as it
>    arms HGEIE in imsic_migrate_vcpu() and clears it in
>    imsic_vsfile_local_read_clear())
> 
> But I'm not an expert in patch series management, so I may be wrong.

Let's see how it works. I'll try to reshuffle the patches as suggested.

Thanks for the suggestion!

~ Oleksii

