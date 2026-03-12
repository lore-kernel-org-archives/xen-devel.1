Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5C27105A57C
	for <xen-devel@archiver.kernel.org>; Thu, 12 Mar 2026 11:03:05 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1251991.1548777 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0doW-0008RK-0U; Thu, 12 Mar 2026 11:02:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1251991.1548777; Thu, 12 Mar 2026 11:02:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0doV-0008RD-TE; Thu, 12 Mar 2026 11:02:47 +0000
Received: by outflank-mailman (input) for mailman id 1251991;
 Thu, 12 Mar 2026 11:02:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Avp9=BM=infradead.org=peterz@srs-se1.protection.inumbo.net>)
 id 1w0doT-0008Qy-CQ
 for xen-devel@lists.xenproject.org; Thu, 12 Mar 2026 11:02:46 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fdcd0d14-1e02-11f1-b164-2bf370ae4941;
 Thu, 12 Mar 2026 12:02:43 +0100 (CET)
Received: from
 2001-1c00-8d85-5700-266e-96ff-fe07-7dcc.cable.dynamic.v6.ziggo.nl
 ([2001:1c00:8d85:5700:266e:96ff:fe07:7dcc]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1w0dnq-0000000BDV5-3GNL; Thu, 12 Mar 2026 11:02:06 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
 id AC3B5300462; Thu, 12 Mar 2026 12:02:05 +0100 (CET)
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
X-Inumbo-ID: fdcd0d14-1e02-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=TKIEX/tTmZZzj6V6Q9LOzPYb6+bhVRh9N9evN1bqSfc=; b=an8qvmMRT6e0/uIgvv6SvD7SLo
	4m+UvPB5+18GpbDiaL9IxO3UA1h4nyJ0FZtTMBA4+J8t9buo20vz5+l2obe0Hhuhm03AWzFimVp4D
	YtHlF5LCr5cNGTsUr/nANJN0G/ar8NTW96doAb79xogVjlFtfvWv3tS4G8vgrwid1zRyuKnnoOtRg
	cRE6fVkUPmEULPsE/mtiFGjwxhTv0E57tOdjLrOaPqcviA5Hx/nImdKNCvkkIHyFLP9mr/wm0JSMb
	0Thh4CDgCwqZ4HpWOjjPbbgfQIiKl0MIq4avo+r94PhokRILHHajLVnNT16BcpXuKO/m4C7RcJSQ1
	afukQ/VQ==;
Date: Thu, 12 Mar 2026 12:02:05 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Chengwen Feng <fengchengwen@huawei.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>, Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Len Brown <lenb@kernel.org>, Sunil V L <sunilvl@ventanamicro.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Kees Cook <kees@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
	Sean Christopherson <seanjc@google.com>,
	Kai Huang <kai.huang@intel.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Thomas Huth <thuth@redhat.com>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Kevin Loughlin <kevinloughlin@google.com>,
	Zheyun Shen <szy0127@sjtu.edu.cn>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	Xin Li <xin@zytor.com>, "Ahmed S . Darwish" <darwi@linutronix.de>,
	Sohil Mehta <sohil.mehta@intel.com>,
	Ilkka Koskinen <ilkka@os.amperecomputing.com>,
	Robin Murphy <robin.murphy@arm.com>,
	James Clark <james.clark@linaro.org>,
	Besar Wicaksono <bwicaksono@nvidia.com>, Ma Ke <make24@iscas.ac.cn>,
	Wei Huang <wei.huang2@amd.com>,
	Andy Gospodarek <andrew.gospodarek@broadcom.com>,
	Somnath Kotur <somnath.kotur@broadcom.com>,
	punit.agrawal@oss.qualcomm.com, guohanjun@huawei.com,
	suzuki.poulose@arm.com, ryan.roberts@arm.com,
	chenl311@chinatelecom.cn, masahiroy@kernel.org,
	wangyuquan1236@phytium.com.cn, anshuman.khandual@arm.com,
	heinrich.schuchardt@canonical.com, Eric.VanTassell@amd.com,
	wangzhou1@hisilicon.com, wanghuiqiang@huawei.com,
	liuyonglong@huawei.com, linux-pci@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org, xen-devel@lists.xenproject.org,
	linux-acpi@vger.kernel.org, linux-perf-users@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v6 2/3] x86: Implement acpi_get_cpu_uid()
Message-ID: <20260312110205.GG606826@noisy.programming.kicks-ass.net>
References: <20260312072316.4806-1-fengchengwen@huawei.com>
 <20260312072316.4806-3-fengchengwen@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260312072316.4806-3-fengchengwen@huawei.com>

On Thu, Mar 12, 2026 at 03:23:15PM +0800, Chengwen Feng wrote:
> Add acpi_get_cpu_uid() implementation for x86, replacing the existing
> cpu_acpi_id() function. This completes the unified ACPI Processor UID
> retrieval interface across all ACPI-enabled architectures.
> 
> Cc: stable@vger.kernel.org
> Signed-off-by: Chengwen Feng <fengchengwen@huawei.com>
> ---
>  arch/x86/include/asm/cpu.h   |  1 -
>  arch/x86/include/asm/smp.h   |  1 -
>  arch/x86/kernel/cpu/common.c | 15 +++++++++++++++
>  arch/x86/xen/enlighten_hvm.c |  5 +++--
>  include/linux/acpi.h         |  2 --
>  5 files changed, 18 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/x86/include/asm/cpu.h b/arch/x86/include/asm/cpu.h
> index ad235dda1ded..57a0786dfd75 100644
> --- a/arch/x86/include/asm/cpu.h
> +++ b/arch/x86/include/asm/cpu.h
> @@ -11,7 +11,6 @@
>  
>  #ifndef CONFIG_SMP
>  #define cpu_physical_id(cpu)			boot_cpu_physical_apicid
> -#define cpu_acpi_id(cpu)			0
>  #endif /* CONFIG_SMP */
>  
>  #ifdef CONFIG_HOTPLUG_CPU
> diff --git a/arch/x86/include/asm/smp.h b/arch/x86/include/asm/smp.h
> index 84951572ab81..05d1d479b4cf 100644
> --- a/arch/x86/include/asm/smp.h
> +++ b/arch/x86/include/asm/smp.h
> @@ -130,7 +130,6 @@ __visible void smp_call_function_interrupt(struct pt_regs *regs);
>  __visible void smp_call_function_single_interrupt(struct pt_regs *r);
>  
>  #define cpu_physical_id(cpu)	per_cpu(x86_cpu_to_apicid, cpu)
> -#define cpu_acpi_id(cpu)	per_cpu(x86_cpu_to_acpiid, cpu)
>  
>  /*
>   * This function is needed by all SMP systems. It must _always_ be valid
> diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
> index 1c3261cae40c..3081557542c7 100644
> --- a/arch/x86/kernel/cpu/common.c
> +++ b/arch/x86/kernel/cpu/common.c
> @@ -28,6 +28,7 @@
>  #include <linux/stackprotector.h>
>  #include <linux/utsname.h>
>  #include <linux/efi.h>
> +#include <linux/acpi.h>
>  
>  #include <asm/alternative.h>
>  #include <asm/cmdline.h>
> @@ -57,6 +58,7 @@
>  #include <asm/asm.h>
>  #include <asm/bugs.h>
>  #include <asm/cpu.h>
> +#include <asm/smp.h>
>  #include <asm/mce.h>
>  #include <asm/msr.h>
>  #include <asm/cacheinfo.h>
> @@ -2643,3 +2645,16 @@ void __init arch_cpu_finalize_init(void)
>  	 */
>  	mem_encrypt_init();
>  }
> +
> +int acpi_get_cpu_uid(unsigned int cpu, u32 *uid)
> +{
> +	if (cpu >= nr_cpu_ids)
> +		return -EINVAL;
> +#ifndef CONFIG_SMP
> +	*uid = 0;
> +#else
> +	*uid = per_cpu(x86_cpu_to_acpiid, cpu);
> +#endif
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(acpi_get_cpu_uid);
> diff --git a/arch/x86/xen/enlighten_hvm.c b/arch/x86/xen/enlighten_hvm.c
> index fe57ff85d004..2f9fa27e5a3c 100644
> --- a/arch/x86/xen/enlighten_hvm.c
> +++ b/arch/x86/xen/enlighten_hvm.c
> @@ -151,6 +151,7 @@ static void xen_hvm_crash_shutdown(struct pt_regs *regs)
>  
>  static int xen_cpu_up_prepare_hvm(unsigned int cpu)
>  {
> +	u32 cpu_uid;
>  	int rc = 0;
>  
>  	/*
> @@ -161,8 +162,8 @@ static int xen_cpu_up_prepare_hvm(unsigned int cpu)
>  	 */
>  	xen_uninit_lock_cpu(cpu);
>  
> -	if (cpu_acpi_id(cpu) != CPU_ACPIID_INVALID)
> -		per_cpu(xen_vcpu_id, cpu) = cpu_acpi_id(cpu);
> +	if (acpi_get_cpu_uid(cpu, &cpu_uid) == 0)
> +		per_cpu(xen_vcpu_id, cpu) = cpu_uid;
>  	else
>  		per_cpu(xen_vcpu_id, cpu) = cpu;
>  	xen_vcpu_setup(cpu);

This doesn't look right, it will now set CPU_ACPIID_INVALID, while
previously it would not.


