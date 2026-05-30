Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61757CD6E49
	for <xen-devel@archiver.kernel.org>; Sat, 30 May 2026 18:19:52 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1323049.1589054 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wTOHD-00006H-S6; Sat, 30 May 2026 18:19:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1323049.1589054; Sat, 30 May 2026 18:19:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wTOHD-000069-Mu; Sat, 30 May 2026 18:19:15 +0000
Received: by outflank-mailman (input) for mailman id 1323049;
 Sat, 30 May 2026 16:47:58 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ludloff@gmail.com>) id 1wTMqs-0003gl-4D
 for xen-devel@lists.xenproject.org; Sat, 30 May 2026 16:47:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wTMqr-00GoxY-1o
 for xen-devel@lists.xenproject.org; Sat, 30 May 2026 18:47:57 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ludloff@gmail.com>)
 id 6a1b14b6-e002-0a2a0a5209dd-0a2a4509ecfe-2
 for <xen-devel@lists.xenproject.org>; Sat, 30 May 2026 18:47:56 +0200
Received: from [209.85.218.44] (helo=mail-ej1-f44.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <ludloff@gmail.com>)
 id 6a1b14bc-2497-0a2a45090019-d155da2cc99b-3
 for <xen-devel@lists.xenproject.org>; Sat, 30 May 2026 18:47:56 +0200
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-bdbac72ac1fso1782475366b.3
 for <xen-devel@lists.xenproject.org>; Sat, 30 May 2026 09:47:56 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Cc:To:Subject:Message-ID:Date:From:Reply-To:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1780159676; cv=none;
        d=google.com; s=arc-20240605;
        b=ZxPZ0cDgSCkzMVF0ftm3KBiK4Z7VXILbOU2q4QH2Yx1i0ajb8oAwpYi8xJsXEzE3Up
         32lyFqXVVOyP8HyP6SLvt05oVh9s0YYvpOcHqj/vVlQD1X5YurcOjP+PLcdPLgiyoJ71
         tNV8Xch1tXJq7SwIt0rLYow68MeLHElVcxzxjarLmtcL3s05PoXKMknPQ0VGkUPNM91j
         xDBR3ij2tboGq/v/0Cx4PokCZV4FnN58mHUTU7zCm6LMXxrQZGLkP1akdRQMwD/po8oE
         MPWrqwokXggbZgmTox30xyKu6a4LFELQSpmX+AgZUeVlmleqxq3MikZBnVO+nMObkibK
         2+Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:reply-to:mime-version
         :dkim-signature;
        bh=uDjMWTL59bSew6EuBBjyiKQsK4J1StRuWvcVY3hIZ9s=;
        fh=nQ0n5IRvn5oDuL13sJT0ECbnSOSXNW/e0yo4t0+LRNg=;
        b=csS7lH2nuHhpaUyL3cIzrKddk1MzXA3fPvmRBG6IYJDHKhCXan+Jl4CbVs9i5zaTVq
         SxyLOG7ylJfMBH6g/e0TB+IFAGS4RUO/E5PsvXILZH8/bzU8GQAUvvEKCFVX2raFj6i3
         UYrOB3gz0YbaAIZwDsTnBXmIAsQCyE9Z/glQGvaijLev+ufBHgH7K9NfmNbS8o/GlJ36
         kT76hVVhWIK+lyZpn1VGCZ7YfmUCL7JpYTSzk8+CSvojKRnrDWOnLtR/4IS0Rth4imFs
         9G7oOQy+DZqvOnaIaSvjgIUwU9M0owVfhWyiGCnFHOBC3Wpftu/QTVOPehDN4cshmTHk
         a4Xg==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780159676; x=1780764476; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uDjMWTL59bSew6EuBBjyiKQsK4J1StRuWvcVY3hIZ9s=;
        b=KgO/mPdl6CyR+rn+YiB9BLdcgHbniv91JJz2syR+dF5Pi/CC+NeFEBhFn7xqbNDSYR
         nEcVcV+i8oPjMpw/TNTRmG6IO79SB0ilYVWbEQRT+sfiyEZXCWAGuvGEjCzK6RPhqI0M
         +GkGLCnyU8SgPQClRvjkHN8EV97soA5Qg/d/8uBH8jEcfeyF/6/rEaT/rgBx2NBp/ktm
         /aFoaZljpIHDrQ4K9/3+qcqn1VskkELkiBpyU3SvdjZQESas3Yyxhvge4dToAc/pkqwA
         6x1/4aRYpjxk0YXZcwBnQg+dL0PU6RUOQff98Ucty7vpGhMoF/dhgfdTOiUHHKwYQAZP
         21WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780159676; x=1780764476;
        h=cc:to:subject:message-id:date:from:reply-to:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uDjMWTL59bSew6EuBBjyiKQsK4J1StRuWvcVY3hIZ9s=;
        b=JkRimZM9vZIZBLIH9phU6deUHd19AK16h/I1F0F0Rk7ghjNDvGYtaeJoZWO38xmwBK
         etEuKVW+46+S+78+2f4Mp+gwUwKRQT1CojFBJqJNESUVwRU4e9acjsKq2U0Nw2boWDnL
         AfKAmvjTRrEQsJesNwp9cNW0RN1jIXQuQG6Y3IzZxqLMDCc/lYk9/326Z5dOr+tXd0SL
         wXp9OTACr9z21IC5eP0w4Aih/HEd/ZvcxEcAfEVOYXdc2VHzT6w+i7ODZ83kY5Q9FjzA
         Z/oCLED+hzKrlo3bwRBU5Nx38g4XsMeTl/Q9T+prCjTrS8edoTeRcO4Zb2wsV7AxOCS/
         JwVg==
X-Forwarded-Encrypted: i=1; AFNElJ+Pw/4C4hlSi4XAbJD7JoQklTTg9KZCJiB/82bmgwQ+8aeK8c5XTJKdToMSrjLCyX/X/mIQLx1IlQo=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxts8+46BVoUTKdBtenOE63Jz16yI+OuXH8VSpfcwfaH3hnB0ZC
	1/Ke9+9CUAzIAbKNmhiTlq67ULy30b3L6A7i5vjKdXB42lFhIa0IEbssBf8icDaWUmnpRCpp/NZ
	mtzzyCwSwQZ4gvX+0SjjnB38yRKo6hhE=
X-Gm-Gg: Acq92OE920v1GFvHfkvMRkqvozPEU142TcMBE+LSgtijV075FQji28Src0Eu7F58s9S
	4bKuBKtV12wf1IZ0SnDQozt+oTvcZ2sDcIXL/Pudy48ebb5/Tueu6FPm72qIAASNOrAx+jSakZh
	Ga/Rm6HqDGp1YEkFBUdROgkYh8fLZNu9tWAvP6buEevTwvYeBMIkHI3RqD7dXNPsdsLDr9DbiXH
	0+Cx5PkByfnahvVCHTNS7fsOr/LS+HlVl/g651C48M1BiuZ8YwEnuOMgW0wqdEb5DJJIXhIQufe
	VaAtKQH0A54+AzTGl3NnAOnIh7aySMWx3AyfEoxxlbAxVzsLMw==
X-Received: by 2002:a17:907:80a:b0:bae:d29c:4e28 with SMTP id
 a640c23a62f3a-beab3850c0emr227580166b.12.1780159676193; Sat, 30 May 2026
 09:47:56 -0700 (PDT)
MIME-Version: 1.0
Reply-To: ludloff@gmail.com
From: Christian Ludloff <ludloff@gmail.com>
Date: Sat, 30 May 2026 09:47:44 -0700
X-Gm-Features: AVHnY4LzRI4mtM2MVMA9vVPgTReaIAtSfV8wr74SnOQ4vnVCBcmxdNjiRFE8TOw
Message-ID: <CAKSQd8XBoaUf7MyvPJCv_DHeuEd-DtRYb5GnAofkbJTP89LLMw@mail.gmail.com>
Subject: Re: [PATCH v4 15/47] KVM: x86: Officially define CPUID 0x40000010 as
 PV Timing Info (TSC and Bus)
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Kiryl Shutsemau <kas@kernel.org>, "K. Y. Srinivasan" <kys@microsoft.com>, 
	Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>, 
	Ajay Kaher <ajay.kaher@broadcom.com>, Alexey Makhalov <alexey.makhalov@broadcom.com>, 
	Jan Kiszka <jan.kiszka@siemens.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Juergen Gross <jgross@suse.com>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, John Stultz <jstultz@google.com>, 
	"H. Peter Anvin" <hpa@zytor.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Stephen Boyd <sboyd@kernel.org>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-coco@lists.linux.dev, linux-hyperv@vger.kernel.org, 
	virtualization@lists.linux.dev, xen-devel@lists.xenproject.org, 
	David Woodhouse <dwmw@amazon.co.uk>, Tom Lendacky <thomas.lendacky@amd.com>, 
	Nikunj A Dadhania <nikunj@amd.com>, David Woodhouse <dwmw2@infradead.org>, 
	Michael Kelley <mhklinux@outlook.com>, Thomas Gleixner <tglx@linutronix.de>, 
	bcm-kernel-feedback-list@broadcom.com
Content-Type: text/plain; charset="UTF-8"
X-purgate-ID: tlsNG-bad1c0/1780159676-8A38AA53-A06BA55E/0/0
X-purgate-type: clean
X-purgate-size: 323

> + *  # EAX: (Virtual) TSC frequency in kHz.
> + *  # EBX: (Virtual) Bus (local APIC timer) frequency in kHz.
> + *  # ECX, EDX: Reserved (must be zero).

Can someone from Broadcom please speak up as to
what a non-ECX value signifies for their HV? (Asking
because I see a value of 2, not a must-be-zero.)

--
C.

