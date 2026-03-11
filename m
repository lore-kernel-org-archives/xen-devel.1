Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E97F2FD88E1
	for <xen-devel@archiver.kernel.org>; Wed, 11 Mar 2026 02:58:29 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1250772.1548146 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w09ls-0007XH-18; Wed, 11 Mar 2026 02:58:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1250772.1548146; Wed, 11 Mar 2026 02:58:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w09lr-0007X9-TT; Wed, 11 Mar 2026 02:58:03 +0000
Received: by outflank-mailman (input) for mailman id 1250772;
 Wed, 11 Mar 2026 02:58:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bFBt=BL=huawei.com=fengchengwen@srs-se1.protection.inumbo.net>)
 id 1w09lp-0007X3-Ax
 for xen-devel@lists.xenproject.org; Wed, 11 Mar 2026 02:58:02 +0000
Received: from canpmsgout05.his.huawei.com (canpmsgout05.his.huawei.com
 [113.46.200.220]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1a08db0c-1cf6-11f1-9ccf-f158ae23cfc8;
 Wed, 11 Mar 2026 03:57:57 +0100 (CET)
Received: from mail.maildlp.com (unknown [172.19.162.140])
 by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4fVwJc46ySz12LFG;
 Wed, 11 Mar 2026 10:52:16 +0800 (CST)
Received: from kwepemk500009.china.huawei.com (unknown [7.202.194.94])
 by mail.maildlp.com (Postfix) with ESMTPS id 2B67A2012A;
 Wed, 11 Mar 2026 10:57:52 +0800 (CST)
Received: from [10.67.121.161] (10.67.121.161) by
 kwepemk500009.china.huawei.com (7.202.194.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 11 Mar 2026 10:57:50 +0800
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
X-Inumbo-ID: 1a08db0c-1cf6-11f1-9ccf-f158ae23cfc8
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=b36C7PXQWMtROHC3akP80A02jao7I70/cN0HO+5yrzc=;
	b=OIFuDbC2xS7Rgm+I36JhjfBBuNlrExfOc4b/6nZu5Eci5l3+fQS/kU6c0nfyQEGA12kX/Y7Hm
	Q4fnrBYIxytCYBOb9gfPVNmdxJt8Tvf2GHBr2Fdo4Eecx+kEiQ1JtKfbeg5YZs6XhpMHGRf3AdS
	dsh0tpvrdex5MaKPf2KuYUQ=
Message-ID: <f2bf1055-ae5f-44bb-9bd4-8888099933fb@huawei.com>
Date: Wed, 11 Mar 2026 10:57:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] ACPI: Rename get_acpi_id_for_cpu() to
 acpi_get_cpu_acpi_id() on non-x86
To: Bjorn Helgaas <helgaas@kernel.org>
CC: Bjorn Helgaas <bhelgaas@google.com>, Catalin Marinas
	<catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, "Rafael J .
 Wysocki" <rafael@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan
	<skhan@linuxfoundation.org>, Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui
	<kernel@xen0n.name>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti
	<alex@ghiti.fr>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar
	<mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
	<dave.hansen@linux.intel.com>, <x86@kernel.org>, "H . Peter Anvin"
	<hpa@zytor.com>, Juergen Gross <jgross@suse.com>, Boris Ostrovsky
	<boris.ostrovsky@oracle.com>, Len Brown <lenb@kernel.org>, Sunil V L
	<sunilvl@ventanamicro.com>, Mark Rutland <mark.rutland@arm.com>, Jonathan
 Cameron <jonathan.cameron@huawei.com>, Kees Cook <kees@kernel.org>, Yanteng
 Si <si.yanteng@linux.dev>, Sean Christopherson <seanjc@google.com>, Kai Huang
	<kai.huang@intel.com>, Tom Lendacky <thomas.lendacky@amd.com>, Thomas Huth
	<thuth@redhat.com>, Thorsten Blum <thorsten.blum@linux.dev>, Kevin Loughlin
	<kevinloughlin@google.com>, Zheyun Shen <szy0127@sjtu.edu.cn>, Peter Zijlstra
	<peterz@infradead.org>, Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Xin
 Li <xin@zytor.com>, "Ahmed S . Darwish" <darwi@linutronix.de>, Sohil Mehta
	<sohil.mehta@intel.com>, Ilkka Koskinen <ilkka@os.amperecomputing.com>, Robin
 Murphy <robin.murphy@arm.com>, James Clark <james.clark@linaro.org>, Besar
 Wicaksono <bwicaksono@nvidia.com>, Ma Ke <make24@iscas.ac.cn>, Ajit Khaparde
	<ajit.khaparde@broadcom.com>, Wei Huang <wei.huang2@amd.com>, Andy Gospodarek
	<andrew.gospodarek@broadcom.com>, Somnath Kotur <somnath.kotur@broadcom.com>,
	<wangzhou1@hisilicon.com>, <wanghuiqiang@huawei.com>,
	<liuyonglong@huawei.com>, <linux-pci@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <loongarch@lists.linux.dev>,
	<linux-riscv@lists.infradead.org>, <xen-devel@lists.xenproject.org>,
	<linux-acpi@vger.kernel.org>, <linux-perf-users@vger.kernel.org>,
	<stable@vger.kernel.org>
References: <20260310175305.GA730372@bhelgaas>
Content-Language: en-US
From: fengchengwen <fengchengwen@huawei.com>
In-Reply-To: <20260310175305.GA730372@bhelgaas>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.121.161]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemk500009.china.huawei.com (7.202.194.94)

On 3/11/2026 1:53 AM, Bjorn Helgaas wrote:
> On Tue, Mar 10, 2026 at 11:20:48AM +0800, Chengwen Feng wrote:
>> To unify the CPU ACPI ID retrieval interface across architectures,
>> rename the existing get_acpi_id_for_cpu() function to
>> acpi_get_cpu_acpi_id() on arm64/riscv/loongarch platforms.
>>
>> This is a pure rename with no functional change, preparing for a
>> consistent ACPI Processor UID retrieval interface across all ACPI-enabled
>> platforms.
> 
> Really a question for the ACPI folks, but my preferences would be:
> 
>   - Simpler name for the interface, e.g., "acpi_get_cpu_id()"

OK, and how about add u-, like: acpi_get_cpu_uid()

> 
>   - Single prototype in generic header, e.g., include/linux/acpi.h

OK

> 
>   - Split the x86 part to a separate patch and maybe (a tangent, but
>     looks dubious to me) figure out whether/why xen needs xen_vcpu_id
>     to be ACPI CPU IDs

OK for a separate patch for x86.

Btw: the x86 implementation in 2/2 commit may has problem, please see the reply in 2/2 for detail.

> 
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Chengwen Feng <fengchengwen@huawei.com>
>> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
>> ---
>>  arch/arm64/include/asm/acpi.h      |  4 ++--
>>  arch/loongarch/include/asm/acpi.h  |  2 +-
>>  arch/riscv/include/asm/acpi.h      |  2 +-
>>  arch/riscv/kernel/acpi_numa.c      |  2 +-
>>  drivers/acpi/pptt.c                | 16 ++++++++--------
>>  drivers/acpi/riscv/rhct.c          |  2 +-
>>  drivers/perf/arm_cspmu/arm_cspmu.c |  2 +-
>>  7 files changed, 15 insertions(+), 15 deletions(-)
> 


