Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E834606A31B
	for <xen-devel@archiver.kernel.org>; Mon, 26 Oct 2026 15:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=c+YBReD0
Received: from list by lists.xenproject.org with outflank-mailman.1461525.1672548 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLMaX-0001Ib-9b; Mon, 26 Oct 2026 15:26:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1461525.1672548; Mon, 26 Oct 2026 15:26:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLMaX-0001IU-6g; Mon, 26 Oct 2026 15:26:17 +0000
Received: by outflank-mailman (input) for mailman id 1461525;
 Mon, 26 Oct 2026 15:26:15 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xLMaV-0001IO-CD
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 15:26:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLMaU-006BTv-Ku
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 16:26:14 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6adf7115-e002-0a2a0a5209dd-0a2a450ce056-4
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 16:26:14 +0100
Received: from [209.85.221.42] (helo=mail-wr1-f42.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6adf7116-f479-0a2a450c0019-d155dd2ad08a-3
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 16:26:14 +0100
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-48e20ed3b9dso2845453f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 08:26:14 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-67-71.play-internet.pl.
 [109.243.67.71]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e3eb8f387sm16698010f8f.4.2026.10.26.08.26.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Oct 2026 08:26:13 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793028374; x=1793633174; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tdQM2eFSNPWefP4bSj4yFfMadKxs4191VpFssPoFQ8M=;
        b=c+YBReD0HWSNHe36yC+2L4wlNXREQX0+X7EIKkgMDGXX6Sn+HObWYrrcBsQ9Y+yyMN
         2+Mr9jr38swjMrFxjpYmWzRTQeDnaGuFpo4qWxEFtYIA2CTXvuq1kdK2A8fkrhdVB8eE
         HyEaeW5GmXawNbhh/TXKCRyfCgDMLFSFc2ls7M0b505jRZQCijuQNBPl2NmbwHM5rp3q
         SmM3Iq1B5YzVLZuTQsUh+5qbfo7F78ya4L9cgHjiVzITSxbnd3zJ3Q5r5PLjTIvzT/kL
         5w242VjmYyTSQf4dpOB6vzkrX0YhUQTHBlGNjZHCZmk2dJiVmCycq6NibxtRGVBIPnxo
         AebQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793028374; x=1793633174;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tdQM2eFSNPWefP4bSj4yFfMadKxs4191VpFssPoFQ8M=;
        b=g+R803z3i5sDvIMIAErhm71oay+cLhFxDPX9hDvWXGHy4/lrj4IjNSekFzccpuJKgO
         qo2kn3XOj+H/fSx5EO0FUSoRw/ivAHoNazP2N+xKyvLbGFc0OKNQlZiKmlKszXYg9+ag
         uVXnu/HEH4qEDzYxipa0fuKD0JZAQNiCjPbHB+h6hF0ZgF1tzYLgfS5rkqxy03sf/fca
         vvVLUFPDkexbLR7oAY19k43ku90HFowILN0pCCEEaQ4D0pOGaqB9ylAzyPfwTgyIvWTy
         XaWK12J6XoWqjpseuRdXw/U7iTh1KdxH3Hs1w/cFCBnSEM/Y61ARdzJ/PGJ2sg0Yvqr1
         /Wmg==
X-Forwarded-Encrypted: i=1; AKwUvBzjKINtZR3bLV/NLAx38LSteSXn1q/W6Peo5eGqGCoUt1kooOc3Yb5oN2e8tCSxPVNVbey4hNMuJ7s=@lists.xenproject.org
X-Gm-Message-State: AFq9FYIeyhU/kvuOVTOrLlKeumE8pVfKnXYPq2UMHNKhnjFpttu3hADY
	Ge1SHSN3SoA+WAKVLCtSF+hc56nYmLu/+8VwZmvjJt3e3CokWHzczq0s
X-Gm-Gg: AYBFou2ed30wQUUTxMbEAS2p+3WwntViNi3NbncuUh1ZO7qr/D9ue3IGpUy29N9qRoL
	LD7f45yHVV3b4qw2U65CN26VdUY8flaNmpypxQcrtbJQ2NyFCL1/Ud6wuvOR7uEwAdSxICilyIg
	USZ+4wIflA87PB+3mt0FIiqGJ7GG5spLtNr+Vkyj7oB1llP6CQl/akpORBLcvAsnLamj+t4PD/0
	aFCrA9YowLMbvj4CSgpWzLGoTfOpuG/JcZKwb8Hf3rXoHcRC5dKcl7aS8m7+XVsdk3U0V+Vbg6M
	dpQEPKNIoq8Fx5wefdhXDuCRDYxV9tm0xZQnY/LAz0/UllEhHVS4HLJtL5bDQaMST4vRhOUfq8n
	aRLKLOpcYFiDyAOZ3BBrEFJ6eud8JJeTq25zfutllI1wZrW02iynH1N2CFo4TvtmaTYre0HAqf2
	z8Pt1utMVeHHBr7JJznxHmZb5/tKeKRpmf5+mDDRYZYXGJlNjdy4MsCO1Y7alpx9JrPwoh/jckz
	IEnxR7/DoUkJvgB0Spd4JpxEiB2lNRFT7RA/kWqQAwjRwyw+2M1O0rEoYdGFkKbO1dJ8vVstU3y
	+Z2q6ctR4vZnyZburoi6792j72Ho
X-Received: by 2002:a05:6000:2709:b0:48c:7ee3:e07d with SMTP id ffacd0b85a97d-48e3eb9c260mr8439500f8f.52.1793028373965;
        Mon, 26 Oct 2026 08:26:13 -0700 (PDT)
Message-ID: <1cd34b77-95a4-4ed2-a200-6b6e914fe9d5@gmail.com>
Date: Mon, 26 Oct 2026 16:26:12 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 3/5] xen/riscv: look up the exception table for any
 trap taken in Xen context
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, Zheng Zhang <zhangzheng@iscas.ac.cn>
References: <1793027589.8631fc262581453bbf619ec5b2062170.1a178c5c430000f79f@vates.tech>
 <1793027684.8631fc262581453bbf619ec5b2062170.1a178c73927000f79f@vates.tech>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <1793027684.8631fc262581453bbf619ec5b2062170.1a178c73927000f79f@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1793028374-020C1A5B-F74F022A/10/73395122804
X-purgate-type: spam
X-purgate-size: 2462
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 10/26/26 4:14 PM, Baptiste Le Duc wrote:
> From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> 
> do_trap() consulted the exception table only for CAUSE_ILLEGAL_INSTRUCTION,
> which covers csr_read_safe() but not a probing access faulting with a page
> fault cause: it would reach do_unexpected_trap() instead of its fixup.
> There is no such access yet, the A/D update scheme probe will be the first.
> 
> Move the lookup ahead of the cause switch, and only do it for exceptions
> taken in Xen context. Both other cases must skip it:
> 
> - Traps taken from the guest: sepc is then a guest address, which the
>    guest can point at an address listed in the exception table, making Xen
>    act on an entry fully under guest control. Entries are matched by exact
>    address, so this needs no more than a numerical collision.

Nit: Identations here and ..

> 
> - Interrupts: an interrupt taken at an address listed in the table would
>    otherwise be "fixed up" as if the access itself had faulted, silently
>    skipping it.

... looks incorrect a little bit. An extra space should be dropped.

> 
> Returning early skips check_for_pcpu_work(), which is correct: that only
> runs for traps taken from the guest.
> 
> Cache the "trap came from the guest" test in a local as it is now used
> three times.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> [Baptiste: drop the parts depending on the vAPLIC/vIMSIC series, adapt
>   the commit message]
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
> ---
> Changes since v7:
> - new patch, needed by the A/D update scheme probe of the next patch,
>    whose store page fault would otherwise not be fixed up. Taken from:
>    https://patch.msgid.link/4e2b4e7a99f4d2133ff92559303d19382749de7a.1790779209.git.oleksii.kurochko@gmail.com
> - commit message adapted to this subset: drop the hlv/hlvx and
>    EX_TYPE_TRAP_INFO parts and the paragraph on the guest page fault
>    BUG_ON(), whose code isn't taken; mention the from_guest local, which
>    this subset introduces.
> - apply my v3 review suggestion to the commit message: state up front
>    that the lookup is only done for exceptions taken in Xen context and
>    list traps taken from the guest and interrupts as the skipped cases.
> ---
LGTM:

Reviewed-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

~ Oleksii

