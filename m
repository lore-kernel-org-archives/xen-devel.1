Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BF971075262
	for <xen-devel@archiver.kernel.org>; Thu, 19 Mar 2026 06:58:21 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1256660.1551164 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w37KM-0003mL-FW; Thu, 19 Mar 2026 06:57:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1256660.1551164; Thu, 19 Mar 2026 06:57:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w37KM-0003mE-BK; Thu, 19 Mar 2026 06:57:54 +0000
Received: by outflank-mailman (input) for mailman id 1256660;
 Thu, 19 Mar 2026 06:57:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F4ko=BT=huawei.com=fengchengwen@srs-se1.protection.inumbo.net>)
 id 1w37KK-0003m8-V8
 for xen-devel@lists.xenproject.org; Thu, 19 Mar 2026 06:57:53 +0000
Received: from canpmsgout09.his.huawei.com (canpmsgout09.his.huawei.com
 [113.46.200.224]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ef0ac02a-2360-11f1-9ccf-f158ae23cfc8;
 Thu, 19 Mar 2026 07:57:49 +0100 (CET)
Received: from mail.maildlp.com (unknown [172.19.163.200])
 by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4fbxGM2bnGz1cyq5;
 Thu, 19 Mar 2026 14:52:43 +0800 (CST)
Received: from kwepemk500009.china.huawei.com (unknown [7.202.194.94])
 by mail.maildlp.com (Postfix) with ESMTPS id 34AD840563;
 Thu, 19 Mar 2026 14:57:43 +0800 (CST)
Received: from localhost.localdomain (10.50.163.32) by
 kwepemk500009.china.huawei.com (7.202.194.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 19 Mar 2026 14:57:40 +0800
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
X-Inumbo-ID: ef0ac02a-2360-11f1-9ccf-f158ae23cfc8
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=d2oQnHa+M701t1+AFct3mw+oRojrQxSf815aZIrcRXk=;
	b=PxLkfRfHbXPXHwaXz1Lf4WNBr5zpx65AfQJbRpiGgGp7dlUjDv37AxRS6TOPrAMO6e98o3bVY
	wROoFooN3Zk1pKb9aF8gGAVO20HhUuWlJFJrZPOJfTsBFYy9VO6CILxOhZ4mU3amRq6OgxLwfRE
	3fr94QlCnXjIwJfLE0IabAM=
From: Chengwen Feng <fengchengwen@huawei.com>
To: Bjorn Helgaas <bhelgaas@google.com>, Catalin Marinas
	<catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, "Rafael J .
 Wysocki" <rafael@kernel.org>
CC: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, Paul
 Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Thomas Gleixner
	<tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
	<bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, <x86@kernel.org>,
	"H . Peter Anvin" <hpa@zytor.com>, Juergen Gross <jgross@suse.com>, Boris
 Ostrovsky <boris.ostrovsky@oracle.com>, Len Brown <lenb@kernel.org>, Sunil V
 L <sunilvl@ventanamicro.com>, Mark Rutland <mark.rutland@arm.com>, Jonathan
 Cameron <jonathan.cameron@huawei.com>, Kees Cook <kees@kernel.org>, Yanteng
 Si <si.yanteng@linux.dev>, Sean Christopherson <seanjc@google.com>, Kai Huang
	<kai.huang@intel.com>, Tom Lendacky <thomas.lendacky@amd.com>, Thomas Huth
	<thuth@redhat.com>, Thorsten Blum <thorsten.blum@linux.dev>, Kevin Loughlin
	<kevinloughlin@google.com>, Zheyun Shen <szy0127@sjtu.edu.cn>, Peter Zijlstra
	<peterz@infradead.org>, Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Xin
 Li <xin@zytor.com>, "Ahmed S . Darwish" <darwi@linutronix.de>, Sohil Mehta
	<sohil.mehta@intel.com>, Ilkka Koskinen <ilkka@os.amperecomputing.com>, Robin
 Murphy <robin.murphy@arm.com>, James Clark <james.clark@linaro.org>, Besar
 Wicaksono <bwicaksono@nvidia.com>, Ma Ke <make24@iscas.ac.cn>, Wei Huang
	<wei.huang2@amd.com>, Andy Gospodarek <andrew.gospodarek@broadcom.com>,
	Somnath Kotur <somnath.kotur@broadcom.com>, <punit.agrawal@oss.qualcomm.com>,
	<guohanjun@huawei.com>, <suzuki.poulose@arm.com>, <ryan.roberts@arm.com>,
	<chenl311@chinatelecom.cn>, <masahiroy@kernel.org>,
	<wangyuquan1236@phytium.com.cn>, <anshuman.khandual@arm.com>,
	<heinrich.schuchardt@canonical.com>, <Eric.VanTassell@amd.com>,
	<wangzhou1@hisilicon.com>, <wanghuiqiang@huawei.com>,
	<liuyonglong@huawei.com>, <fengchengwen@huawei.com>,
	<linux-pci@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<loongarch@lists.linux.dev>, <linux-riscv@lists.infradead.org>,
	<xen-devel@lists.xenproject.org>, <linux-acpi@vger.kernel.org>,
	<linux-perf-users@vger.kernel.org>, <stable@vger.kernel.org>
Subject: [PATCH v9 0/7] ACPI: Unify CPU UID interface and fix ARM64 TPH steer-tag issue
Date: Thu, 19 Mar 2026 14:57:28 +0800
Message-ID: <20260319065735.45954-1-fengchengwen@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.50.163.32]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemk500009.china.huawei.com (7.202.194.94)

This patchset unifies ACPI Processor UID retrieval across
arm64/loongarch/riscv/x86 via acpi_get_cpu_uid() (with input validation)
and fixes ARM64 CPU steer-tag retrieval failure in PCI/TPH:

1-4: Add acpi_get_cpu_uid() for arm64/loongarch/riscv/x86 (update
     respective users)
5: Centralize acpi_get_cpu_uid() declaration in include/linux/acpi.h
6: Clean up ACPI/PPTT and remove unused get_acpi_id_for_cpu()
7: Fix ARM64 platform CPU steer-tag retrieval failure

The interface refactor ensures consistent CPU UID retrieval across
architectures (no functional changes for valid inputs) and provides the
unified interface required for the ARM64 TPH fix.

---
Changes in v9:
- Address Bjorn's review: split commits to each platform so that make
  them easy to review

Changes in v8:
- Moving arm64's get_cpu_for_acpi_id() to kernel/acpi.c which address
  Jeremy's review

Changes in v7:
- Refine first commit which address Jonathan's reviews
- Fix x86 implement bug (not consider INVALID-ID) which address Peter's
  review
- Fix CI error of x86 implement by moving function to acpi/boot.c

Changes in v6:
- Rename existing get_acpi_id_for_cpu() to acpi_get_cpu_uid()
- Split x86's modify as one commit

Chengwen Feng (7):
  arm64/acpi: Add acpi_get_cpu_uid() and switch arm_cspmu to use it
  loongarch/acpi: Add acpi_get_cpu_uid() declaration and implementation
  riscv/acpi: Add acpi_get_cpu_uid() implementation and update users
  x86/acpi: Add acpi_get_cpu_uid() implementation and update Xen users
  ACPI: Centralize acpi_get_cpu_uid() declaration in
    include/linux/acpi.h
  ACPI: PPTT: Use acpi_get_cpu_uid() and remove get_acpi_id_for_cpu()
  PCI/TPH: Fix get cpu steer-tag fail on ARM64 platform

 Documentation/PCI/tph.rst          |  4 +--
 arch/arm64/include/asm/acpi.h      | 17 +---------
 arch/arm64/kernel/acpi.c           | 30 ++++++++++++++++++
 arch/loongarch/include/asm/acpi.h  |  5 ---
 arch/loongarch/kernel/acpi.c       |  9 ++++++
 arch/riscv/include/asm/acpi.h      |  4 ---
 arch/riscv/kernel/acpi.c           | 16 ++++++++++
 arch/riscv/kernel/acpi_numa.c      |  9 ++++--
 arch/x86/include/asm/cpu.h         |  1 -
 arch/x86/include/asm/smp.h         |  1 -
 arch/x86/kernel/acpi/boot.c        | 20 ++++++++++++
 arch/x86/xen/enlighten_hvm.c       |  5 +--
 drivers/acpi/pptt.c                | 50 ++++++++++++++++++++++--------
 drivers/acpi/riscv/rhct.c          |  7 ++++-
 drivers/pci/tph.c                  | 16 +++++++---
 drivers/perf/arm_cspmu/arm_cspmu.c |  6 ++--
 include/linux/acpi.h               | 11 +++++++
 include/linux/pci-tph.h            |  4 +--
 18 files changed, 158 insertions(+), 57 deletions(-)

-- 
2.17.1


