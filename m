Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0318BC77B7F
	for <xen-devel@archiver.kernel.org>; Mon,  8 May 2023 19:44:05 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.531759.827638 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pw6m1-0000OM-IN; Mon, 08 May 2023 19:43:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 531759.827638; Mon, 08 May 2023 19:43:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pw6m1-0000K1-0u; Mon, 08 May 2023 19:43:53 +0000
Received: by outflank-mailman (input) for mailman id 531759;
 Mon, 08 May 2023 19:43:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=49Re=A5=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1pw6lz-0004Y5-H2
 for xen-devel@lists.xenproject.org; Mon, 08 May 2023 19:43:51 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a79d0dee-edd8-11ed-8611-37d641c3527e;
 Mon, 08 May 2023 21:43:50 +0200 (CEST)
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
X-Inumbo-ID: a79d0dee-edd8-11ed-8611-37d641c3527e
Message-ID: <20230508185218.013044883@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1683575029;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=BOT3gWwQF7O/1lZ9KsTIy5NWCf87k83rCpCfGL29bzE=;
	b=Vtkw853T/g2LgebBW2u5NvRyk/o8vkE9DVNbCjOgfsv8NQAdQ+PiRmVE3YRjVR9zyaPDpW
	A0CpqtisqwiF90SMSTT3dgMD9wfCYwYlyM9zgdWNPZBK6ove/DWKBEfTIBavRYG3mLpwGW
	gj5/U4hTXI1gfU5gMpT9O+3nSrnlgwHXON5jO7YTMsIZWUpGn1lUA7aXp/3y1CXCUYBa6o
	4saDTE36mpdN94ZK/rdI32a5+qd4XpBBQ9/jSvxCD81AEctXSXlca21oVxip2aNe/i6362
	k8ifgTHs2omVUbliI/3cpRSjuph/X6qOreGlkue5SVagGH6iBXC3i5IxD3kMEg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1683575029;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=BOT3gWwQF7O/1lZ9KsTIy5NWCf87k83rCpCfGL29bzE=;
	b=z0rzXlV5+Y57E7wE/hgSxsOIOaBBLImivYo4M54wyRCUx4IHVjFSQS7chfIs3CglORkucG
	Op/Ji4IG3mTcrvAw==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: x86@kernel.org,
 David Woodhouse <dwmw2@infradead.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Brian Gerst <brgerst@gmail.com>,
 Arjan van de Veen <arjan@linux.intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Paul McKenney <paulmck@kernel.org>,
 Tom Lendacky <thomas.lendacky@amd.com>,
 Sean Christopherson <seanjc@google.com>,
 Oleksandr Natalenko <oleksandr@natalenko.name>,
 Paul Menzel <pmenzel@molgen.mpg.de>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 Piotr Gorski <lucjan.lucjanov@gmail.com>,
 Usama Arif <usama.arif@bytedance.com>,
 Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 xen-devel@lists.xenproject.org,
 Russell King <linux@armlinux.org.uk>,
 Arnd Bergmann <arnd@arndb.de>,
 linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>,
 Guo Ren <guoren@kernel.org>,
 linux-csky@vger.kernel.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 linux-mips@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>,
 linux-parisc@vger.kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org,
 Mark Rutland <mark.rutland@arm.com>,
 Sabin Rapan <sabrapan@amazon.com>,
 "Michael Kelley (LINUX)" <mikelley@microsoft.com>
Subject: [patch v3 14/36] [patch V2 14/38] cpu/hotplug: Rework sparse_irq
 locking in bringup_cpu()
References: <20230508181633.089804905@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Mon,  8 May 2023 21:43:49 +0200 (CEST)

From: Thomas Gleixner <tglx@linutronix.de>

There is no harm to hold sparse_irq lock until the upcoming CPU completes
in cpuhp_online_idle(). This allows to remove cpu_online() synchronization
from architecture code.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Tested-by: Michael Kelley <mikelley@microsoft.com>


---
 kernel/cpu.c |   28 +++++++++++++++++++---------
 1 file changed, 19 insertions(+), 9 deletions(-)
---

--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -558,7 +558,7 @@ static int cpuhp_kick_ap(int cpu, struct
 	return ret;
 }
 
-static int bringup_wait_for_ap(unsigned int cpu)
+static int bringup_wait_for_ap_online(unsigned int cpu)
 {
 	struct cpuhp_cpu_state *st = per_cpu_ptr(&cpuhp_state, cpu);
 
@@ -579,15 +579,12 @@ static int bringup_wait_for_ap(unsigned
 	 */
 	if (!cpu_smt_allowed(cpu))
 		return -ECANCELED;
-
-	if (st->target <= CPUHP_AP_ONLINE_IDLE)
-		return 0;
-
-	return cpuhp_kick_ap(cpu, st, st->target);
+	return 0;
 }
 
 static int bringup_cpu(unsigned int cpu)
 {
+	struct cpuhp_cpu_state *st = per_cpu_ptr(&cpuhp_state, cpu);
 	struct task_struct *idle = idle_thread_get(cpu);
 	int ret;
 
@@ -606,10 +603,23 @@ static int bringup_cpu(unsigned int cpu)
 
 	/* Arch-specific enabling code. */
 	ret = __cpu_up(cpu, idle);
-	irq_unlock_sparse();
 	if (ret)
-		return ret;
-	return bringup_wait_for_ap(cpu);
+		goto out_unlock;
+
+	ret = bringup_wait_for_ap_online(cpu);
+	if (ret)
+		goto out_unlock;
+
+	irq_unlock_sparse();
+
+	if (st->target <= CPUHP_AP_ONLINE_IDLE)
+		return 0;
+
+	return cpuhp_kick_ap(cpu, st, st->target);
+
+out_unlock:
+	irq_unlock_sparse();
+	return ret;
 }
 
 static int finish_cpu(unsigned int cpu)



