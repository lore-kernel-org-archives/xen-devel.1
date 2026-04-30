Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0E4DFF886F
	for <xen-devel@archiver.kernel.org>; Thu, 30 Apr 2026 05:44:44 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1297903.1573596 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wIKC6-0008T5-EY; Thu, 30 Apr 2026 05:44:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1297903.1573596; Thu, 30 Apr 2026 05:44:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wIKC6-0008Sx-As; Thu, 30 Apr 2026 05:44:14 +0000
Received: by outflank-mailman (input) for mailman id 1297903;
 Thu, 30 Apr 2026 03:26:06 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <patchwork-bot+linux-riscv@kernel.org>)
 id 1wII2Q-0005Vc-9T
 for xen-devel@lists.xenproject.org; Thu, 30 Apr 2026 03:26:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wII2O-005uGt-FF
 for xen-devel@lists.xenproject.org; Thu, 30 Apr 2026 05:26:04 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <patchwork-bot+linux-riscv@kernel.org>)
 id 69f2cb6f-bab6-0a2a0a5309dd-0a2a4501e788-42
 for <xen-devel@lists.xenproject.org>; Thu, 30 Apr 2026 05:26:04 +0200
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <patchwork-bot+linux-riscv@kernel.org>)
 id 69f2cbca-c1f2-0a2a45010019-aceafc1f8c02-3
 for <xen-devel@lists.xenproject.org>; Thu, 30 Apr 2026 05:26:03 +0200
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id D2DC240317;
 Thu, 30 Apr 2026 03:26:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA274C2BCC6;
 Thu, 30 Apr 2026 03:26:01 +0000 (UTC)
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 02F1A3809A07; Thu, 30 Apr 2026 03:25:18 +0000 (UTC)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=k20201202 header.d=kernel.org header.i="@kernel.org" header.h="Subject:From:Date:References:In-Reply-To:To:Cc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777519561;
	bh=S8ESDWn2FV212MQ0O36a6N64V74CpKEgoDR0Cwb1eYo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=RtcaGla8SJMvzp565cZWG4JA/pd6x2rokqKWLW76DsXVVSBMWfvO7M+j3tfPr4WiS
	 iYIi3LmvsvftG5YY+oM7g4PvJ9jMSl95DFA2LT7Ri+Y57wvJYObh7grdN4/wFxy9Bp
	 3dNPBrE0VUHIF5qHqtQDM1L3bZLqpe75efGu9RIosM9YKInDL4ti/opEBCchGSV7Ed
	 NJ0t/2yQEWiWU4UX0J1SMMnzWayyrY3pGrDTZxRSaZcqhSakDi4GgjEzwKf7uPPJCg
	 fYiHoJFVnaikAgVqNlokz3BThqsRnYRJYWEnZONwh0eeFUJrF4d3CMi6aMhGsxyQjO
	 srXFfj2h9HOug==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH RESEND v10 0/8] ACPI: Unify CPU UID interface and fix
 ARM64
 TPH steer-tag issue
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <177751951654.2274119.17258357457134506240.git-patchwork-notify@kernel.org>
Date: Thu, 30 Apr 2026 03:25:16 +0000
References: <20260401081640.26875-1-fengchengwen@huawei.com>
In-Reply-To: <20260401081640.26875-1-fengchengwen@huawei.com>
To: Chengwen Feng <fengchengwen@huawei.com>
Cc: linux-riscv@lists.infradead.org, bhelgaas@google.com,
 catalin.marinas@arm.com, will@kernel.org, rafael@kernel.org,
 mark.rutland@arm.com, x86@kernel.org, liuyonglong@huawei.com,
 anshuman.khandual@arm.com, linux-doc@vger.kernel.org, kees@kernel.org,
 linux-pci@vger.kernel.org, dave.hansen@linux.intel.com,
 Eric.VanTassell@amd.com, somnath.kotur@broadcom.com, kai.huang@intel.com,
 kevinloughlin@google.com, punit.agrawal@oss.qualcomm.com, hpa@zytor.com,
 ilkka@os.amperecomputing.com, kernel@xen0n.name, thorsten.blum@linux.dev,
 linux-acpi@vger.kernel.org, corbet@lwn.net, masahiroy@kernel.org,
 si.yanteng@linux.dev, peterz@infradead.org,
 pawan.kumar.gupta@linux.intel.com, linux-arm-kernel@lists.infradead.org,
 xen-devel@lists.xenproject.org, szy0127@sjtu.edu.cn, lenb@kernel.org,
 thomas.lendacky@amd.com, thuth@redhat.com, ryan.roberts@arm.com,
 darwi@linutronix.de, make24@iscas.ac.cn, suzuki.poulose@arm.com,
 james.clark@linaro.org, wei.huang2@amd.com, bwicaksono@nvidia.com,
 loongarch@lists.linux.dev, jonathan.cameron@huawei.com,
 sohil.mehta@intel.com, boris.ostrovsky@oracle.com, xin@zytor.com,
 andrew.gospodarek@broadcom.com, wanghuiqiang@huawei.com, jgross@suse.com,
 wangyuquan1236@phytium.com.cn, seanjc@google.com, guohanjun@huawei.com,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux-perf-users@vger.kernel.org, wangzhou1@hisilicon.com, tglx@kernel.org,
 heinrich.schuchardt@canonical.com, chenl311@chinatelecom.cn,
 robin.murphy@arm.com
X-purgate-ID: tlsNG-d62444/1777519564-BDE6BFF4-FB18EA95/0/0
X-purgate-type: clean
X-purgate-size: 1965

Hello:

This series was applied to riscv/linux.git (fixes)
by Rafael J. Wysocki <rafael.j.wysocki@intel.com>:

On Wed, 1 Apr 2026 16:16:32 +0800 you wrote:
> This patchset unifies ACPI Processor UID retrieval across
> arm64/loongarch/riscv/x86 via acpi_get_cpu_uid() (with input validation)
> and fixes ARM64 CPU steer-tag retrieval failure in PCI/TPH:
> 
> 1-4: Add acpi_get_cpu_uid() for arm64/loongarch/riscv/x86 (update
>      respective users)
> 5: Centralize acpi_get_cpu_uid() declaration in include/linux/acpi.h
> 6: Clean up perf/arm_cspmu
> 7: Clean up ACPI/PPTT and remove unused get_acpi_id_for_cpu()
> 8: Pass ACPI Processor UID to Cache Locality _DSM
> 
> [...]

Here is the summary with links:
  - [RESEND,v10,1/8] arm64: acpi: Add acpi_get_cpu_uid() for unified ACPI CPU UID retrieval
    https://git.kernel.org/riscv/c/7cd5f5659ac8
  - [RESEND,v10,2/8] LoongArch: Add acpi_get_cpu_uid() for unified ACPI CPU UID retrieval
    https://git.kernel.org/riscv/c/d78ef9d2e1f2
  - [RESEND,v10,3/8] RISC-V: ACPI: Add acpi_get_cpu_uid() for unified ACPI CPU UID retrieval
    https://git.kernel.org/riscv/c/0c8231994e43
  - [RESEND,v10,4/8] x86/acpi: Add acpi_get_cpu_uid() for unified ACPI CPU UID retrieval
    https://git.kernel.org/riscv/c/3cfe889f8965
  - [RESEND,v10,5/8] ACPI: Centralize acpi_get_cpu_uid() declaration in include/linux/acpi.h
    https://git.kernel.org/riscv/c/f652d0a4e13c
  - [RESEND,v10,6/8] perf: arm_cspmu: Switch to acpi_get_cpu_uid() from get_acpi_id_for_cpu()
    https://git.kernel.org/riscv/c/1ab03189793f
  - [RESEND,v10,7/8] ACPI: PPTT: Use acpi_get_cpu_uid() and remove get_acpi_id_for_cpu()
    https://git.kernel.org/riscv/c/a7034e9e4491
  - [RESEND,v10,8/8] PCI/TPH: Pass ACPI Processor UID to Cache Locality _DSM
    https://git.kernel.org/riscv/c/abdd2a86535b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



