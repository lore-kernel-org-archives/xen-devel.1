Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 065C4107526A
	for <xen-devel@archiver.kernel.org>; Thu, 19 Mar 2026 06:58:17 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1256663.1551190 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w37KS-0004Rr-90; Thu, 19 Mar 2026 06:58:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1256663.1551190; Thu, 19 Mar 2026 06:58:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w37KS-0004Rf-5M; Thu, 19 Mar 2026 06:58:00 +0000
Received: by outflank-mailman (input) for mailman id 1256663;
 Thu, 19 Mar 2026 06:57:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F4ko=BT=huawei.com=fengchengwen@srs-se1.protection.inumbo.net>)
 id 1w37KR-0003zM-0b
 for xen-devel@lists.xenproject.org; Thu, 19 Mar 2026 06:57:59 +0000
Received: from canpmsgout06.his.huawei.com (canpmsgout06.his.huawei.com
 [113.46.200.221]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f43612db-2360-11f1-b164-2bf370ae4941;
 Thu, 19 Mar 2026 07:57:57 +0100 (CET)
Received: from mail.maildlp.com (unknown [172.19.162.197])
 by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4fbxGZ3YfYzRhVC;
 Thu, 19 Mar 2026 14:52:54 +0800 (CST)
Received: from kwepemk500009.china.huawei.com (unknown [7.202.194.94])
 by mail.maildlp.com (Postfix) with ESMTPS id BB35540363;
 Thu, 19 Mar 2026 14:57:53 +0800 (CST)
Received: from localhost.localdomain (10.50.163.32) by
 kwepemk500009.china.huawei.com (7.202.194.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 19 Mar 2026 14:57:51 +0800
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
X-Inumbo-ID: f43612db-2360-11f1-b164-2bf370ae4941
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=oewhn2IMbmtF3+gd2nTsD3HCqK7a08k6f+Tu2Cay+iU=;
	b=oFXndCwr5vh34n8gkLHTXEqaV/0hW8+wBcd4nv9xiy4HlW6wnZujLWAqw5SOSdiBqNavOPkDN
	9/+jlDZPPrN8NNsh9km26BRhYie1bdqp34HdjgLcKvnwuGrBr4N5KNZvnUcjwwYV3Sn8Jltg1CS
	eKmjnoNFW6S+6Hh8gKOwc+M=
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
Subject: [PATCH v9 5/7] ACPI: Centralize acpi_get_cpu_uid() declaration in include/linux/acpi.h
Date: Thu, 19 Mar 2026 14:57:33 +0800
Message-ID: <20260319065735.45954-6-fengchengwen@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260319065735.45954-1-fengchengwen@huawei.com>
References: <20260319065735.45954-1-fengchengwen@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.50.163.32]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemk500009.china.huawei.com (7.202.194.94)

- Add acpi_get_cpu_uid() prototype to include/linux/acpi.h (global
  scope)
- Remove arch-specific acpi_get_cpu_uid() declarations from
  arm64/loongarch/riscv/x86 asm/acpi.h

This centralizes the interface declaration for consistency, avoiding
duplicate prototypes across architectures and simplifying future
maintenance.

Cc: stable@vger.kernel.org
Signed-off-by: Chengwen Feng <fengchengwen@huawei.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
---
 arch/arm64/include/asm/acpi.h     |  1 -
 arch/loongarch/include/asm/acpi.h |  1 -
 arch/riscv/include/asm/acpi.h     |  1 -
 arch/x86/include/asm/acpi.h       |  2 --
 include/linux/acpi.h              | 11 +++++++++++
 5 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/include/asm/acpi.h b/arch/arm64/include/asm/acpi.h
index 2219a3301e72..bdb0ecf95b5c 100644
--- a/arch/arm64/include/asm/acpi.h
+++ b/arch/arm64/include/asm/acpi.h
@@ -118,7 +118,6 @@ static inline u32 get_acpi_id_for_cpu(unsigned int cpu)
 {
 	return	acpi_cpu_get_madt_gicc(cpu)->uid;
 }
-int acpi_get_cpu_uid(unsigned int cpu, u32 *uid);
 int get_cpu_for_acpi_id(u32 uid);
 
 static inline void arch_fix_phys_package_id(int num, u32 slot) { }
diff --git a/arch/loongarch/include/asm/acpi.h b/arch/loongarch/include/asm/acpi.h
index 8bb101b4557e..7376840fa9f7 100644
--- a/arch/loongarch/include/asm/acpi.h
+++ b/arch/loongarch/include/asm/acpi.h
@@ -44,7 +44,6 @@ static inline u32 get_acpi_id_for_cpu(unsigned int cpu)
 {
 	return acpi_core_pic[cpu_logical_map(cpu)].processor_id;
 }
-int acpi_get_cpu_uid(unsigned int cpu, u32 *uid);
 
 #endif /* !CONFIG_ACPI */
 
diff --git a/arch/riscv/include/asm/acpi.h b/arch/riscv/include/asm/acpi.h
index f3520cc85af3..6e13695120bc 100644
--- a/arch/riscv/include/asm/acpi.h
+++ b/arch/riscv/include/asm/acpi.h
@@ -65,7 +65,6 @@ static inline u32 get_acpi_id_for_cpu(int cpu)
 {
 	return acpi_cpu_get_madt_rintc(cpu)->uid;
 }
-int acpi_get_cpu_uid(unsigned int cpu, u32 *uid);
 
 int acpi_get_riscv_isa(struct acpi_table_header *table,
 		       unsigned int cpu, const char **isa);
diff --git a/arch/x86/include/asm/acpi.h b/arch/x86/include/asm/acpi.h
index 92b5c27c4fea..a03aa6f999d1 100644
--- a/arch/x86/include/asm/acpi.h
+++ b/arch/x86/include/asm/acpi.h
@@ -157,8 +157,6 @@ static inline bool acpi_has_cpu_in_madt(void)
 	return !!acpi_lapic;
 }
 
-int acpi_get_cpu_uid(unsigned int cpu, u32 *uid);
-
 #define ACPI_HAVE_ARCH_SET_ROOT_POINTER
 static __always_inline void acpi_arch_set_root_pointer(u64 addr)
 {
diff --git a/include/linux/acpi.h b/include/linux/acpi.h
index 4d2f0bed7a06..74a73f0e5944 100644
--- a/include/linux/acpi.h
+++ b/include/linux/acpi.h
@@ -324,6 +324,17 @@ int acpi_unmap_cpu(int cpu);
 
 acpi_handle acpi_get_processor_handle(int cpu);
 
+/**
+ * acpi_get_cpu_uid() - Get ACPI Processor UID of from MADT table
+ * @cpu: Logical CPU number (0-based)
+ * @uid: Pointer to store ACPI Processor UID
+ *
+ * Return: 0 on success (ACPI Processor ID stored in *uid);
+ *         -EINVAL if CPU number is invalid or out of range;
+ *         -ENODEV if ACPI Processor UID for the CPU is not found.
+ */
+int acpi_get_cpu_uid(unsigned int cpu, u32 *uid);
+
 #ifdef CONFIG_ACPI_HOTPLUG_IOAPIC
 int acpi_get_ioapic_id(acpi_handle handle, u32 gsi_base, u64 *phys_addr);
 #endif
-- 
2.17.1


