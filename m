From: Juergen Gross <jgross@suse.com>
Subject: Re: xen crash with 4.17 kernel on Fedora
Date: Mon, 2 Jul 2018 10:07:00 +0200
Message-ID: <d8f7f688-cbaa-a72b-8a73-2a6f95e45aee@suse.com>
References: <alpine.LFD.2.21.1807011742590.4081@austen3.home>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------661F81853FA166E9F89AC43F"
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=37lk=js=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1fZtrU-0002wJ-DU
 for xen-devel@lists.xenproject.org; Mon, 02 Jul 2018 08:07:04 +0000
In-Reply-To: <alpine.LFD.2.21.1807011742590.4081@austen3.home>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Michael Young <m.a.young@durham.ac.uk>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

This is a multi-part message in MIME format.
--------------661F81853FA166E9F89AC43F
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 01/07/18 18:43, Michael Young wrote:
> I am seeing crash on boot and DomU (pv) on Fedora with the 4.17 kernel
> (eg. kernel-4.17.2-200.fc28.x86_64 and kernel-4.17.3-200.fc28.x86_64) which
> didn't occur with 4.16 kernel (eg. kernel-4.16.16-300.fc28.x86_64)

Could you please try the attached patches? They apply to either 4.17
or 4.18-rc.

The first one should let the kernel survive the WARN_ONCE(), while
the second will avoid hitting the WARN_ONCE().


Juergen

--------------661F81853FA166E9F89AC43F
Content-Type: text/x-patch;
 name="0001-xen-setup-pv-irq-ops-vector-earlier.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-xen-setup-pv-irq-ops-vector-earlier.patch"

>From baa8db1bd97958cccc67f8e894847104c51c27ef Mon Sep 17 00:00:00 2001
From: Juergen Gross <jgross@suse.com>
Date: Mon, 2 Jul 2018 09:09:18 +0200
Subject: [PATCH] xen: setup pv irq ops vector earlier

Setting pv_irq_ops for Xen PV domains should be done as early as
possible in order to support e.g. very early printk() usage.

Remove the no longer necessary conditional in xen_init_irq_ops()
from PVH V1 times to make clear this is a PV only function.

Cc: <stable@vger.kernel.org> # 4.14
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/xen/enlighten_pv.c | 3 +--
 arch/x86/xen/irq.c          | 4 +---
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/arch/x86/xen/enlighten_pv.c b/arch/x86/xen/enlighten_pv.c
index 8d4e2e1ae60b..0f4cd9e5bed4 100644
--- a/arch/x86/xen/enlighten_pv.c
+++ b/arch/x86/xen/enlighten_pv.c
@@ -1213,6 +1213,7 @@ asmlinkage __visible void __init xen_start_kernel(void)
 	pv_info = xen_info;
 	pv_init_ops.patch = paravirt_patch_default;
 	pv_cpu_ops = xen_cpu_ops;
+	xen_init_irq_ops();
 
 	x86_platform.get_nmi_reason = xen_get_nmi_reason;
 
@@ -1249,8 +1250,6 @@ asmlinkage __visible void __init xen_start_kernel(void)
 	get_cpu_cap(&boot_cpu_data);
 	x86_configure_nx();
 
-	xen_init_irq_ops();
-
 	/* Let's presume PV guests always boot on vCPU with id 0. */
 	per_cpu(xen_vcpu_id, 0) = 0;
 
diff --git a/arch/x86/xen/irq.c b/arch/x86/xen/irq.c
index 74179852e46c..7515a19fd324 100644
--- a/arch/x86/xen/irq.c
+++ b/arch/x86/xen/irq.c
@@ -128,8 +128,6 @@ static const struct pv_irq_ops xen_irq_ops __initconst = {
 
 void __init xen_init_irq_ops(void)
 {
-	/* For PVH we use default pv_irq_ops settings. */
-	if (!xen_feature(XENFEAT_hvm_callback_vector))
-		pv_irq_ops = xen_irq_ops;
+	pv_irq_ops = xen_irq_ops;
 	x86_init.irqs.intr_init = xen_init_IRQ;
 }
-- 
2.13.7


--------------661F81853FA166E9F89AC43F
Content-Type: text/x-patch;
 name="0002-xen-remove-global-bit-from-__default_kernel_pte_mask.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0002-xen-remove-global-bit-from-__default_kernel_pte_mask.pa";
 filename*1="tch"

>From 2ab1412c43762f27e65bd18d8c1ffde9133a56b1 Mon Sep 17 00:00:00 2001
From: Juergen Gross <jgross@suse.com>
Date: Mon, 2 Jul 2018 09:31:36 +0200
Subject: [PATCH] xen: remove global bit from __default_kernel_pte_mask for
 pv guests

When removing the global bit from __supported_pte_mask do the same for
__default_kernel_pte_mask in order to avoid the WARN_ONCE() in
check_pgprot() when setting a kernel pte before having called
init_mem_mapping().

Cc: <stable@vger.kernel.org> # 4.17
Reported-by: Michael Young <m.a.young@durham.ac.uk>
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/xen/enlighten_pv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/x86/xen/enlighten_pv.c b/arch/x86/xen/enlighten_pv.c
index 0f4cd9e5bed4..cf7b13d3e911 100644
--- a/arch/x86/xen/enlighten_pv.c
+++ b/arch/x86/xen/enlighten_pv.c
@@ -1230,6 +1230,7 @@ asmlinkage __visible void __init xen_start_kernel(void)
 
 	/* Prevent unwanted bits from being set in PTEs. */
 	__supported_pte_mask &= ~_PAGE_GLOBAL;
+	__default_kernel_pte_mask &= ~_PAGE_GLOBAL;
 
 	/*
 	 * Prevent page tables from being allocated in highmem, even
-- 
2.13.7


--------------661F81853FA166E9F89AC43F
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--------------661F81853FA166E9F89AC43F--
