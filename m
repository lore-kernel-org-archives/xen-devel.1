Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94B0F606A334
	for <xen-devel@archiver.kernel.org>; Sun,  1 Nov 2026 22:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B37CRQpc
Received: from list by lists.xenproject.org with outflank-mailman.1467475.1676620 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNdrb-0007fX-LJ; Sun, 01 Nov 2026 22:17:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1467475.1676620; Sun, 01 Nov 2026 22:17:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNdrb-0007fQ-Hc; Sun, 01 Nov 2026 22:17:19 +0000
Received: by outflank-mailman (input) for mailman id 1467475;
 Sun, 01 Nov 2026 22:17:17 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <patchwork-bot+linux-riscv@kernel.org>)
 id 1xNdrZ-0007fK-Ol
 for xen-devel@lists.xenproject.org; Sun, 01 Nov 2026 22:17:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xNdrY-007NNu-PY
 for xen-devel@lists.xenproject.org; Sun, 01 Nov 2026 23:17:16 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <patchwork-bot+linux-riscv@kernel.org>)
 id 6ae7b9f8-8faa-0a2a0a5109dd-0a2a4508dc16-44
 for <xen-devel@lists.xenproject.org>; Sun, 01 Nov 2026 23:17:16 +0100
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <patchwork-bot+linux-riscv@kernel.org>)
 id 6ae7ba6b-f659-0a2a45080019-aceafc1fcf8e-3
 for <xen-devel@lists.xenproject.org>; Sun, 01 Nov 2026 23:17:16 +0100
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 6C97643EC5;
 Sun,  1 Nov 2026 22:17:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AF4C1F0093A;
 Sun,  1 Nov 2026 22:17:14 +0000 (UTC)
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 403AC38003B8; Sun,  1 Nov 2026 22:17:14 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=k20260515 header.d=kernel.org header.i="@kernel.org" header.h="Subject:From:Date:References:In-Reply-To:To:Cc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793571434;
	bh=cjatygCmxk8XIyEbtr4pyzKJ6E60G4Tfi3euF78nVXA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=B37CRQpcdmmwCy32vZHgPCWMyUptn49raCX3hJZVcxsEUYOsqHqKCUFeSZMmdrHar
	 P973m1II/ofRE5pnWqeiZvqWMGVRqsLIUP1n1XIX0nFBkKS0IRka2D7KopquB77g6O
	 Mp/unwfBnH0l1eqg07ua7p0Vs/LC2MTS3vGGD6h6owSUEaRNT6q1AXW/x5xBnzEQnc
	 EmKj7qUuyXmc8mBTkvUCHpgFrpk8n5Uq59fpbStEBh5xRF1iBXEyBMchINku/sQN+X
	 GTmMdu6UOejRm4ya75HKvjJSDVBqFLUssCE8lSC7D/wzZYaWR0EmUh/OpuxZjzWe5k
	 ui1FC15h7AaNQ==
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH RESEND] sched: Convert paravirt_steal to new static key
 APIs
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <179357143279.2624073.7781801497885838332.git-patchwork-notify@kernel.org>
Date: Sun, 01 Nov 2026 22:17:12 +0000
References: <20260819081207.12150-1-hongyan.xia@transsion.com>
In-Reply-To: <20260819081207.12150-1-hongyan.xia@transsion.com>
To: Hongyan Xia <hongyan.xia@transsion.com>
Cc: linux-riscv@lists.infradead.org, jgross@suse.com, ajay.kaher@broadcom.com,
 alexey.makhalov@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
 catalin.marinas@arm.com, will@kernel.org, chenhuacai@kernel.org,
 kernel@xen0n.name, maddy@linux.ibm.com, mpe@ellerman.id.au,
 npiggin@gmail.com, chleroy@kernel.org, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, tglx@kernel.org, mingo@redhat.com,
 bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
 pbonzini@redhat.com, vkuznets@redhat.com, sstabellini@kernel.org,
 oleksandr_tyshchenko@epam.com, peterz@infradead.org, juri.lelli@redhat.com,
 vincent.guittot@linaro.org, dietmar.eggemann@arm.com, rostedt@goodmis.org,
 bsegall@google.com, mgorman@suse.de, vschneid@redhat.com,
 kprateek.nayak@amd.com, jiazi.li@transsion.com,
 virtualization@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org,
 xen-devel@lists.xenproject.org
X-purgate-ID: tlsNG-c1860d/1793571436-DFED287B-B0AA6101/0/0
X-purgate-type: clean
X-purgate-size: 652
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello:

This patch was applied to riscv/linux.git (fixes)
by Peter Zijlstra <peterz@infradead.org>:

On Wed, 19 Aug 2026 08:12:09 +0000 you wrote:
> From: Hongyan Xia <hongyan.xia@transsion.com>
> 
> paravirt_steal_rq_enabled and paravirt_steal_enabled use raw static_key
> APIs which are now deprecated. Use the new API instead.
> 
> No functional change.
> 
> [...]

Here is the summary with links:
  - [RESEND] sched: Convert paravirt_steal to new static key APIs
    https://git.kernel.org/riscv/c/a5576ebce920

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



