From: Juergen Gross <jgross@suse.com>
Subject: Re: (partial) Spectre v2 mitigation without on Skylake
 IBRS
Date: Mon, 26 Feb 2018 13:36:32 +0100
Message-ID: <033b2fcd-3b6b-2ab9-f230-51397e00e9e7@suse.com>
References: <5A93E52002000078001AB99C@prv-mh.provo.novell.com>
 <65113e59-589e-b43b-1e7a-186f989255fd@suse.com>
 <5A93F44E02000078001ABA67@suse.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------CBB0BF076D21B61AADF558FA"
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=djnd=fu=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1eqI1E-0003L1-Fz
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2018 12:36:36 +0000
In-Reply-To: <5A93F44E02000078001ABA67@suse.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

This is a multi-part message in MIME format.
--------------CBB0BF076D21B61AADF558FA
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 26/02/18 11:49, Jan Beulich wrote:
>>>> On 26.02.18 at 11:18, <jgross@suse.com> wrote:
>> On 26/02/18 10:44, Jan Beulich wrote:
>>> if running PV Linux on older Xen (4.5 and earlier) is relevant, it may be
>>> necessary to use a mechanism other than IBRS to mitigate Spectre v2
>>> on Skylake. That is because the new MSR value can't be migrated
>>> prior to migration v2. Of course one option would be to retrofit some
>>> mechanism into newer Xen versions that makes them accept whatever
>>> extension to e.g. struct hvm_hw_cpu one might want to invent for
>>> the older Xen versions. But that doesn't seem very desirable.
>>
>> Can you please elaborate a little bit more what the real problem is?
>>
>> I _think_ you are referring to the problem that a pv kernel would want
>> to use IBRS for mitigation of Spectre V2 and after a migration that
>> setting would be lost.
> 
> "Lost" is the wrong term imo: A hypervisor that's been patched for
> Spectre v2 (and that's a prereq anyway, because we want the
> kernel to use IBPB, which utilizes an MSR that doesn't need
> migrating) should at least do _something_ with the MSR (when it's
> non-zero). The most natural thing (imo) is to make those older
> hypervisors support XEN_DOMCTL_{get,set}_vcpu_msrs. That in
> turn calls for the tool stack to gain the check that Andrew had
> added to libxc in db24f7f012 ("libxc: use an explicit check for PV
> MSRs in xc_domain_save() "), causing migration to fail when the
> MSR is non-zero on any of the guest's vCPU-s.
> 
>> If this is the case I believe the easiest solution would be to let the
>> kernel set the MSR again after leaving suspended state. suspend/resume
>> require hooks in pv kernels after all.
> 
> Hmm, this could be leveraged irrespective of what I've written
> above - the kernel could then also clear the MSR during suspend,
> thus allowing the check in libxc to pass.

Something like the attached patch?


Juergen


--------------CBB0BF076D21B61AADF558FA
Content-Type: text/x-patch;
 name="0001-x86-xen-zero-MSR_IA32_SPEC_CTRL-before-suspend.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0001-x86-xen-zero-MSR_IA32_SPEC_CTRL-before-suspend.patch"

>From 5a03c1e0a21f3a5a3f2228e5df7150d3f3be6e1f Mon Sep 17 00:00:00 2001
From: Juergen Gross <jgross@suse.com>
Date: Mon, 26 Feb 2018 13:10:55 +0100
Subject: [PATCH] x86/xen: zero MSR_IA32_SPEC_CTRL before suspend

Older Xen versions (before 4.5) might have problems migrating pv guests
with MSR_IA32_SPEC_CTRL having a non-zero value. So before suspending
zero that MSR and restore it after being resumed.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/xen/suspend.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/x86/xen/suspend.c b/arch/x86/xen/suspend.c
index d9f96cc5d743..2eb3069fd413 100644
--- a/arch/x86/xen/suspend.c
+++ b/arch/x86/xen/suspend.c
@@ -15,6 +15,8 @@
 #include "mmu.h"
 #include "pmu.h"
 
+static DEFINE_PER_CPU(u64, spec_ctrl);
+
 void xen_arch_pre_suspend(void)
 {
 	xen_save_time_memory_area();
@@ -35,6 +37,9 @@ void xen_arch_post_suspend(int cancelled)
 
 static void xen_vcpu_notify_restore(void *data)
 {
+	if (xen_pv_domain())
+		wrmsrl(MSR_IA32_SPEC_CTRL, this_cpu_read(spec_ctrl));
+
 	/* Boot processor notified via generic timekeeping_resume() */
 	if (smp_processor_id() == 0)
 		return;
@@ -44,7 +49,15 @@ static void xen_vcpu_notify_restore(void *data)
 
 static void xen_vcpu_notify_suspend(void *data)
 {
+	u64 tmp;
+
 	tick_suspend_local();
+
+	if (xen_pv_domain()) {
+		rdmsrl(MSR_IA32_SPEC_CTRL, tmp);
+		this_cpu_write(spec_ctrl, tmp);
+		wrmsrl(MSR_IA32_SPEC_CTRL, 0);
+	}
 }
 
 void xen_arch_resume(void)
-- 
2.13.6


--------------CBB0BF076D21B61AADF558FA
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--------------CBB0BF076D21B61AADF558FA--
