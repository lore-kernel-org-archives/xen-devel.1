Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1CD9606A31B
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2026 16:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wTtj42pk
Received: from list by lists.xenproject.org with outflank-mailman.1475274.1682108 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xP0mU-0000XP-CP; Thu, 05 Nov 2026 16:57:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1475274.1682108; Thu, 05 Nov 2026 16:57:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xP0mU-0000XI-9f; Thu, 05 Nov 2026 16:57:42 +0000
Received: by outflank-mailman (input) for mailman id 1475274;
 Thu, 05 Nov 2026 16:57:41 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xP0mT-0000XC-Cs
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 16:57:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xP0mS-00BI4x-Lg
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 17:57:40 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aecb560-2eae-0a2a0a5409dd-0a2a4505d188-44
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 17:57:40 +0100
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aecb584-4cb1-0a2a45050019-d1558035b0ba-3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 17:57:40 +0100
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4a35ac4475dso15102025e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 08:57:40 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-65-71.play-internet.pl.
 [109.243.65.71]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b56fca22e1sm91146885e9.14.2026.11.05.08.57.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Nov 2026 08:57:39 -0800 (PST)
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
        d=gmail.com; s=20260707; t=1793897860; x=1794502660; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=POIL72m2icLWUSLNkHkT4T3FI5Huz1R7KGCFbfwl1pU=;
        b=wTtj42pk6Fp+iHJh5nt57+GmPW11AlEs2G02pZBTKfBErJdi7MHEubEmpLGFUaVvdo
         LO50xJ60vZ7RYoqc91z6JZE6gG1b4390mwsvzrF9bgCfBCgX8+R8hcAu4nCC8UMvKAQw
         s6QCjF15BTYFhx5LecA1ljW4U/8gj0p40upVsDljqMupipJEFyNCNplWBE/BQkAMfcsT
         wFs3nmPKvXQ4awH5OibYAXK1A6RycPO4KAovO3oEbc+X0M4VRbhVX2P9jCcRQf8dDNq2
         +rFsIm3FKjSqwqlv/AdlQedFwKsMXU+m1l1EbnVe+dRuHZ15YZu8FM6KI5DkYUObRVPq
         eUUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793897860; x=1794502660;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=POIL72m2icLWUSLNkHkT4T3FI5Huz1R7KGCFbfwl1pU=;
        b=c5BmgBTahe8OEt5HzEB+f851VIOwHvz9OvcJkf4xCIprDV5JzvfwbZN8pvZ3LjmjEs
         6mbmPt8ewIdWLCh+Q3OeB6fHljeNvrW0Nrb+kP3MSA2K1kEpG/ZlFuolANXM33UVbDRN
         U+98cNVLiUTiG0hIQX7SENm9jTdaHSpuBti64/4Dz3mpd7fFJ7kW2MSNzd3/FPvXfD8N
         CCeBVId/qng4ukzr1pdcqZD88rLDJauCfIvObmK40X+6xhwgYZ+Fjjeed3lCwSZQqd9K
         ac36dKGvgVEDSLjNK3WGAfSr55BDi4jpzjgSRvYFSPjMvnymqKZJJ2oTng0aTNU46mfo
         jpTw==
X-Gm-Message-State: APuU4Z8jzIvCMf4tI5qBuz6OqwVPWCb7Z4PgFn2SmFJRoQlAF6CY9fyM
	35VmuSouRvjj64GQnuVF/LVOSn5qtHAayVGAfoKiDlfdL48CvwElWpLl
X-Gm-Gg: AYBFou2pRwpIfn8MbuGkZ4zzYRkdQYOh6zRtqFZrBNcxX+cPHT8YGQkUNzdmrsNDcVX
	L3QaoWHFh7oiOHCpf8AGGdhQcFQIZlIu9esGMhkJj2h/W8tvgMKY7aKP/UkdLZAlvsVgTvE1XMx
	qJ5r5R6zye5dsPcyejpyJYqqAnU6vYqEsU7ZNAJ6yvq4y9Poloq9Q81lEeWU0grgfI+OZE9LEZZ
	fRNNaBnik1YaoFTfixVIB2xa5XlPMnSow86LU79uUeSGUEiKD12W/LAQpmiVCdUjVoUqCo/a5pl
	U2Nk1T2+Xf7E7f0HO2jQvckxlpYUoLND3Lo03Djqn3owgY1LXL8M1ODCE69AxbuO5xx1PRaWWJ1
	zE+qVbBRi9liU+U9uCR0TyEZym67qMQSHi6Iu5ClKDupM4uOTeckmnyYaDoU9ovApi0BIj92Rb7
	sZNYe0wps+Nos5i6ZNw6DKik/d96f9FlY0NAXdrCGDYSu/53myKyKusqiKbR/NTfAuKB2x1PIcu
	basDw6Xfp72vukmE7RgKsw7sIDRccTuf2Fyu1hgFkzfB7h1CVXdnyXt6kpFC1npRjLN5a3Cb5Bl
	wku1MilDyc5FCzr4lVw46ejKOBnAuODOo346lmmn5h5KUlCNGjh2uNH/hTV9nMniq11Q72FaKfD
	b
X-Received: by 2002:a05:600c:470a:b0:4a1:7e77:c382 with SMTP id 5b1f17b1804b1-4ac16acfe61mr426248865e9.5.1793897859852;
        Thu, 05 Nov 2026 08:57:39 -0800 (PST)
Message-ID: <d272b357-b5cc-42e6-9a84-753f361ad278@gmail.com>
Date: Thu, 5 Nov 2026 17:57:36 +0100
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
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <1793023599.8631fc262581453bbf619ec5b2062170.1a17888e252000f79f@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1793897860-73ABF2A1-ABEA7180/10/73395122804
X-purgate-type: spam
X-purgate-size: 5057
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 10/26/26 3:06 PM, Baptiste Le Duc wrote:
>> Once the new IMSIC VS-file has been zeroed out, it has to be mapped into
>> the guest's G-stage in place of the old one. Also, if any interrupts at an
>> APLIC are forwarded by MSIs to the old interrupt file, reconfigure the
>> APLIC to send them to the new interrupt file.
>>
>> Taking a h/w guest interrupt file (assigning it, zeroing it out, mapping
>> it into G-stage and recording it in the vCPU's IMSIC state) is factored
>> out into imsic_vsfile_acquire().
>>
>> The relevant translation tables at all IOMMUs would also have to be
>> updated so that MSIs for this virtual interrupt file are sent to the new
>> physical interrupt file, but that is skipped for now as there is no IOMMU
>> support for RISC-V.
>>
>> Synchronize with the APLIC to ensure that no straggler MSIs will arrive at
>> the old interrupt file by running imsic_aplic_sync() on the pCPU which owns
>> that file.
>>
>> If the new file can't be mapped into the guest, release the guest
>> external interrupt number imsic_vsfile_acquire() took for it instead of
>> leaking it. vgein_release() takes the pCPU explicitly instead of relying
>> on v->processor, as on migration v->processor already refers to the new
>> pCPU while the number to be released may belong to the old one.
>>
>> Keep BUG_ON("unimplemented") placeholder in imsic_migrate_vcpu() to guard
>> against silent incorrect behaviour or unexpected panics in guest VMs until
>> the function is fully implemented.
>>
>> Implement imsic_update_state(), which records the vCPU's guest
>> interrupt file id together with the pCPU owning the file. The two are
>> read as a pair, e.g. by imsic_migrate_vcpu() and the IMSIC context
>> switch hooks, so they are updated under vsfile_lock as a single unit.
>>
>> imsic_map_guest_file() and vgein_release() are stubs for now.
> 
> I have the feeling this patch does more than its subject says: besides
> retargeting the APLIC and adding the sync, it introduces
> imsic_vsfile_acquire() (assign + clear + G-stage map + state update),
> imsic_update_state() and the error path, which relies on two stubs,
> imsic_map_guest_file() and vgein_release().

These are the steps the AIA spec lists for moving the interrupt 
producers to the new file: map the new file into G-stage in place of the 
old one, retarget the APLIC and synchronize with it. 
imsic_vsfile_acquire() and imsic_update_state() are just how the "take 
and map a new file" part is split out, so I'd still say they belong to 
this patch. Your point below, that none of this can run yet, is the real 
issue though.


> At this point vgein_assign()
> is still BUG_ON("unimplemented") too, so none of the new code can
> actually run, and the error path can't be reviewed against the real
> vgein_release().
> 
> Also, until "introduce IMSIC h/w interrupt file attaching to vcpu", no
> vCPU ever owns a h/w file, so imsic_migrate_vcpu() can only hit the
> CPU_NONE check.
> 
> Wouldn't it be simpler to move the two already-acked patches and the
> attach first, so that no stubs are needed and each migration step is
> written against its real callees when it lands:
> - Add basic VGEIN management for AIA guests (real vgein_assign() and
>    vgein_release(); the reason for the explicit cpu argument of
>    vgein_release() would then have to go into this commit message)
> - Map IMSIC interrupt file for vCPUs (real imsic_map_guest_file())

I think I have such order before and it was changed becuase for locks in 
the first patch it wasn't enough context to understand if they are 
needed or not.

> - Implement continue_new_vcpu() and set hstatus.VSXL
> - Attach a h/w interrupt file to a vCPU on its first run, introducing
>    imsic_vsfile_acquire() and imsic_update_state() with their first user
>    (acquire, vaplic_reconfigure_target(), set hstatus.VGEIN)
> - Prepare new IMSIC VS-file (on top of imsic_vsfile_acquire())
> - Implement APLIC-IMSIC-hart sync barrier for vCPU migration
> - Remap interrupts to the new IMSIC VS-file (APLIC retarget + sync)
> - Save/clear old VS-file, restore, SGEI wake-up as today
> 
> A side benefit: attach no longer has to be squeezed into the finished
> migration code, so imsic_vsfile_move() with its first_attach argument
> and the goto set_vgein go away. Attach stays a plain sequence, and
> imsic_migrate_vcpu() simply reuses imsic_vsfile_acquire().

I'm fine with that order. It does mean that "add basic VGEIN management"
and "map IMSIC interrupt file for vCPUs" introduce functions whose first
user only comes with the attach patch a few patches later. If that's
acceptable, I'll add a post-commit note to each of them saying where the
functions get used (as IIUC, they will first introduced and then used in 
later patches).

> 
> Migrating a vCPU which has already run would still hit the trailing
> BUG_ON("unimplemented") until the restore patch, but that is no worse
> than the panic() it hits today.
> 

~ Oleksii

