From: Juergen Gross <jgross@suse.com>
Subject: Re: Guest soft lockups with "xen: make xen_qlock_wait()
 nestable"
Date: Thu, 8 Nov 2018 09:18:02 +0100
Message-ID: <4a3e30f5-917e-ea54-0ff9-8135ee3bd4a4@suse.com>
References: <3a55659d-4d7e-ea03-0c46-cd115ff1d8f9@eikelenboom.it>
 <c007d98d-1744-f40c-a801-8c1956605d29@suse.com>
 <9e2d3c8a-07b8-dcf8-fb52-0071b63b92d2@eikelenboom.it>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------8EDF101C66654113A4FFDE2F"
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=wlbw=nt=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1gKfVu-0001lM-TU
 for xen-devel@lists.xenproject.org; Thu, 08 Nov 2018 08:18:06 +0000
In-Reply-To: <9e2d3c8a-07b8-dcf8-fb52-0071b63b92d2@eikelenboom.it>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Sander Eikelenboom <linux@eikelenboom.it>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

This is a multi-part message in MIME format.
--------------8EDF101C66654113A4FFDE2F
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 08/11/2018 09:14, Sander Eikelenboom wrote:
> On 08/11/18 08:08, Juergen Gross wrote:
>> On 07/11/2018 10:30, Sander Eikelenboom wrote:
>>> Hi Juergen / Boris,
>>>
>>> Last week i tested Linux kernel 4.19.0 stable with the Xen "for-linus-4.20" branch pulled on top.
>>> Unfortunately i was seeing guests lockup after some time, see below for the logging from one of the guest
>>> which i was able to capture.
>>> Reverting "xen: make xen_qlock_wait() nestable" 7250f6d35681dfc44749d90598a2d51a118ce2b8,
>>> made the lockups disappear.
>>>
>>> These guests are stressed quite hard in both CPU and networking, 
>>> so they are probably more susceptible to locking issues.
>>>
>>> System is a AMD phenom x6, running Xen-unstable.
>>>
>>> Any ideas ?
>>
>> Just checked the hypervisor again: it seems a pending interrupt for a
>> HVM/PVH vcpu won't let SCHEDOP_poll return in case interrupts are
>> disabled.
>>
>> I need to rework the patch for that scenario. Until then I'll revert
>> it.
> 
> Thanks for looking into it.

Could you try the attached patch (on top of 7250f6d35681df)?


Juergen


--------------8EDF101C66654113A4FFDE2F
Content-Type: text/x-patch;
 name="0001-xen-fix-xen_qlock_wait.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-xen-fix-xen_qlock_wait.patch"

>From 4f2d04b321d4eb50dab5cdfaa025336f9360618a Mon Sep 17 00:00:00 2001
From: Juergen Gross <jgross@suse.com>
Date: Thu, 8 Nov 2018 08:35:06 +0100
Subject: [PATCH] xen: fix xen_qlock_wait()

Commit a856531951dc80 ("xen: make xen_qlock_wait() nestable")
introduced a regression for Xen guests running fully virtualized
(HVM or PVH mode). The Xen hypervisor wouldn't return from the poll
hypercall with interrupts disabled in case of an interrupt (for PV
guests it does).

So instead of disabling interrupts in xen_qlock_wait() use a nesting
counter to avoid calling xen_clear_irq_pending() in case
xen_qlock_wait() is nested.

Fixes: a856531951dc80 ("xen: make xen_qlock_wait() nestable")
Cc: stable@vger.kernel.org
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/xen/spinlock.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/arch/x86/xen/spinlock.c b/arch/x86/xen/spinlock.c
index 441c88262169..22f3baa67a25 100644
--- a/arch/x86/xen/spinlock.c
+++ b/arch/x86/xen/spinlock.c
@@ -9,6 +9,7 @@
 #include <linux/log2.h>
 #include <linux/gfp.h>
 #include <linux/slab.h>
+#include <linux/atomic.h>
 
 #include <asm/paravirt.h>
 #include <asm/qspinlock.h>
@@ -21,6 +22,7 @@
 
 static DEFINE_PER_CPU(int, lock_kicker_irq) = -1;
 static DEFINE_PER_CPU(char *, irq_name);
+static DEFINE_PER_CPU(atomic_t, xen_qlock_wait_nest);
 static bool xen_pvspin = true;
 
 static void xen_qlock_kick(int cpu)
@@ -39,25 +41,25 @@ static void xen_qlock_kick(int cpu)
  */
 static void xen_qlock_wait(u8 *byte, u8 val)
 {
-	unsigned long flags;
 	int irq = __this_cpu_read(lock_kicker_irq);
 
 	/* If kicker interrupts not initialized yet, just spin */
 	if (irq == -1 || in_nmi())
 		return;
 
-	/* Guard against reentry. */
-	local_irq_save(flags);
+	/* Detect reentry. */
+	atomic_inc(&xen_qlock_wait_nest);
 
-	/* If irq pending already clear it. */
-	if (xen_test_irq_pending(irq)) {
+	/* If irq pending already and no nested call clear it. */
+	if (atomic_read(&xen_qlock_wait_nest) == 1 &&
+	    xen_test_irq_pending(irq)) {
 		xen_clear_irq_pending(irq);
 	} else if (READ_ONCE(*byte) == val) {
 		/* Block until irq becomes pending (or a spurious wakeup) */
 		xen_poll_irq(irq);
 	}
 
-	local_irq_restore(flags);
+	atomic_dec(&xen_qlock_wait_nest);
 }
 
 static irqreturn_t dummy_handler(int irq, void *dev_id)
-- 
2.16.4


--------------8EDF101C66654113A4FFDE2F
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--------------8EDF101C66654113A4FFDE2F--
