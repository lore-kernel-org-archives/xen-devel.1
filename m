From: Juergen Gross <jgross@suse.com>
Subject: Re: Dom0 Failing to Boot with Recent Linux Kernels
 (Spectre Mitigations)
Date: Wed, 20 Jun 2018 08:34:13 +0200
Message-ID: <5c9bd39f-822b-ef73-1613-ffc38a49a5a8@suse.com>
References: <20180619213038.GA29918@amd.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------E6F915A2C81188AF82D26100"
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180619213038.GA29918@amd.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Brian Woods <brian.woods@amd.com>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

This is a multi-part message in MIME format.
--------------E6F915A2C81188AF82D26100
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 19/06/18 23:30, Brian Woods wrote:
> I'm currently seeing an issue where when booting from a recent Linux
> kernel without nospec_store_bypass_disable.  There's a NULL pointer
> having to do with a lock.  I put some printks in and it seems that in
> arch/x86/kernel/process.c
> that speculative_store_bypass_ht_init isn't getting called which
> initializes the spin lock.

Brian, would you please give the attached patch a try?


Juergen

--------------E6F915A2C81188AF82D26100
Content-Type: text/x-patch;
 name="0001-x86-xen-add-call-of-speculative_store_bypass_ht_init.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0001-x86-xen-add-call-of-speculative_store_bypass_ht_init.pa";
 filename*1="tch"

>From 90a49beee17fe77075a7fdf433c74c5672cfe0d2 Mon Sep 17 00:00:00 2001
From: Juergen Gross <jgross@suse.com>
Date: Wed, 20 Jun 2018 08:21:33 +0200
Subject: [PATCH] x86/xen: add call of speculative_store_bypass_ht_init() to pv
 paths

Commit 1f50ddb4f4189243c05926b842dc1a0332195f31 ("x86/speculation:
Handle HT correctly on AMD") added speculative_store_bypass_ht_init()
to the per-cpu initialization sequence.

speculative_store_bypass_ht_init() needs to be called on each cpu for
pv guests, too.

Reported-by: Brian Woods <brian.woods@amd.com>
Fixes: 1f50ddb4f4189243c05926b842dc1a0332195f31 ("x86/speculation: Handle HT correctly on AMD")
Cc: <stable@vger.kernel.org>
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/xen/smp_pv.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/x86/xen/smp_pv.c b/arch/x86/xen/smp_pv.c
index 2e20ae2fa2d6..e3b18ad49889 100644
--- a/arch/x86/xen/smp_pv.c
+++ b/arch/x86/xen/smp_pv.c
@@ -32,6 +32,7 @@
 #include <xen/interface/vcpu.h>
 #include <xen/interface/xenpmu.h>
 
+#include <asm/spec-ctrl.h>
 #include <asm/xen/interface.h>
 #include <asm/xen/hypercall.h>
 
@@ -70,6 +71,8 @@ static void cpu_bringup(void)
 	cpu_data(cpu).x86_max_cores = 1;
 	set_cpu_sibling_map(cpu);
 
+	speculative_store_bypass_ht_init();
+
 	xen_setup_cpu_clockevents();
 
 	notify_cpu_starting(cpu);
@@ -250,6 +253,8 @@ static void __init xen_pv_smp_prepare_cpus(unsigned int max_cpus)
 	}
 	set_cpu_sibling_map(0);
 
+	speculative_store_bypass_ht_init();
+
 	xen_pmu_init(0);
 
 	if (xen_smp_intr_init(0) || xen_smp_intr_init_pv(0))
-- 
2.13.7


--------------E6F915A2C81188AF82D26100
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--------------E6F915A2C81188AF82D26100--
