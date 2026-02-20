Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB3FBC54F5D
	for <xen-devel@archiver.kernel.org>; Fri, 20 Feb 2026 06:17:18 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1236815.1539323 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vtJor-0004At-R1; Fri, 20 Feb 2026 06:16:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1236815.1539323; Fri, 20 Feb 2026 06:16:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vtJor-0004Ak-M8; Fri, 20 Feb 2026 06:16:53 +0000
Received: by outflank-mailman (input) for mailman id 1236815;
 Fri, 20 Feb 2026 04:10:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Neyl=AY=kernel.org=patchwork-bot+linux-riscv@srs-se1.protection.inumbo.net>)
 id 1vtHqm-0006EH-QB
 for xen-devel@lists.xenproject.org; Fri, 20 Feb 2026 04:10:44 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1f3f3719-0e12-11f1-b164-2bf370ae4941;
 Fri, 20 Feb 2026 05:10:42 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 5787661881;
 Fri, 20 Feb 2026 04:10:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D73AC19421;
 Fri, 20 Feb 2026 04:10:41 +0000 (UTC)
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 BA0853809A88; Fri, 20 Feb 2026 04:10:50 +0000 (UTC)
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
X-Inumbo-ID: 1f3f3719-0e12-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771560641;
	bh=fHDGQg8Y8I31uG+H3itYMHO1lNQuNdbaHv3s+w2VA9E=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=oMaFyqG2bTps/8USOYgV6sHoWWaZWkyD8fr7yLmY5l7usrVYWzQZzpzEhFrj5oIso
	 JsHHbdcmGWZfgObZBMrrGYnYu32BPlMnnVgwwSDA1ys0qiJ1qOLadxN3JSuLSdLeIV
	 tnZk2pdJNKsAWT931GvGXNP4fol0h+61TmknQ8GSGiCMQCV6UL7UDupsNR66mU84jY
	 Uf0+Fkd9Pj07dGm9AzWla0qfC5/ONLfwGajcUnLXdYT+BVuNcuJZmO6sBygjchoA7g
	 hhSIJI8pnZDmIXMjKC9Jz5/fJyymINQf46MMxuBF/t5nZ792GREhqQxlQeEORgXYm7
	 E3Z2SpOIzWr4w==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v5 00/21] paravirt: cleanup and reorg
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <177156064929.189817.13253801870624912064.git-patchwork-notify@kernel.org>
Date: Fri, 20 Feb 2026 04:10:49 +0000
References: <20260105110520.21356-1-jgross@suse.com>
In-Reply-To: <20260105110520.21356-1-jgross@suse.com>
To: =?utf-8?b?SsO8cmdlbiBHcm/DnyA8amdyb3NzQHN1c2UuY29tPg==?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 x86@kernel.org, linux-hyperv@vger.kernel.org, virtualization@lists.linux.dev,
 loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
 kvm@vger.kernel.org, luto@kernel.org, tglx@linutronix.de, mingo@redhat.com,
 bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com, kys@microsoft.com,
 haiyangz@microsoft.com, wei.liu@kernel.org, decui@microsoft.com,
 longli@microsoft.com, peterz@infradead.org, will@kernel.org,
 boqun.feng@gmail.com, longman@redhat.com, jikos@kernel.org,
 jpoimboe@kernel.org, pawan.kumar.gupta@linux.intel.com,
 boris.ostrovsky@oracle.com, xen-devel@lists.xenproject.org,
 ajay.kaher@broadcom.com, alexey.makhalov@broadcom.com,
 bcm-kernel-feedback-list@broadcom.com, linux@armlinux.org.uk,
 catalin.marinas@arm.com, chenhuacai@kernel.org, kernel@xen0n.name,
 maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
 chleroy@kernel.org, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, juri.lelli@redhat.com,
 vincent.guittot@linaro.org, dietmar.eggemann@arm.com, rostedt@goodmis.org,
 bsegall@google.com, mgorman@suse.de, vschneid@redhat.com,
 linux-arm-kernel@lists.infradead.org, pbonzini@redhat.com,
 vkuznets@redhat.com, sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
 daniel.lezcano@linaro.org, oleg@redhat.com

Hello:

This series was applied to riscv/linux.git (fixes)
by Borislav Petkov (AMD) <bp@alien8.de>:

On Mon,  5 Jan 2026 12:04:59 +0100 you wrote:
> Some cleanups and reorg of paravirt code and headers:
> 
> - The first 2 patches should be not controversial at all, as they
>   remove just some no longer needed #include and struct forward
>   declarations.
> 
> - The 3rd patch is removing CONFIG_PARAVIRT_DEBUG, which IMO has
>   no real value, as it just changes a crash to a BUG() (the stack
>   trace will basically be the same). As the maintainer of the main
>   paravirt user (Xen) I have never seen this crash/BUG() to happen.
> 
> [...]

Here is the summary with links:
  - [v5,05/21] paravirt: Remove asm/paravirt_api_clock.h
    https://git.kernel.org/riscv/c/68b10fd40d49
  - [v5,06/21] sched: Move clock related paravirt code to kernel/sched
    https://git.kernel.org/riscv/c/e6b2aa6d4004
  - [v5,10/21] riscv/paravirt: Use common code for paravirt_steal_clock()
    https://git.kernel.org/riscv/c/ee9ffcf99f07

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



