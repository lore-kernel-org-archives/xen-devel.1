From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2 0/6] xen: simplify suspend/resume handling
Date: Thu, 28 Mar 2019 14:21:02 +0100
Message-ID: <eed5e27e-0539-c375-4242-a8eb6bc68c9f@suse.com>
References: <20190328120658.11083-1-jgross@suse.com>
 <CAOcqxo2Jq7GVGPs=tg17_4pHy_W6+SrvGdP5y0AHARUNe7X+fQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------4C5F0BAC9DF5A03BCAECD675"
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=zgNs=R7=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1h9Uxu-0007QF-BA
 for xen-devel@lists.xenproject.org; Thu, 28 Mar 2019 13:21:06 +0000
In-Reply-To: <CAOcqxo2Jq7GVGPs=tg17_4pHy_W6+SrvGdP5y0AHARUNe7X+fQ@mail.gmail.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Volodymyr Babchuk <vlad.babchuk@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson <ian.jackson@eu.citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

This is a multi-part message in MIME format.
--------------4C5F0BAC9DF5A03BCAECD675
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 28/03/2019 14:01, Volodymyr Babchuk wrote:
> Hello Juergen,
> 
> On Thu, 28 Mar 2019 at 14:09, Juergen Gross <jgross@suse.com> wrote:
>>
>> Especially in the scheduler area (schedule.c, cpupool.c) there is a
>> rather complex handling involved when doing suspend and resume.
>>
>> This can be simplified a lot by not performing a complete cpu down and
>> up cycle for the non-boot cpus, but keeping the pure software related
>> state and freeing it only in case a cpu didn't come up again during
>> resume.
>>
>> In summary not only the complexity can be reduced, but the failure
>> tolerance will be even better with this series: With a dedicated hook
>> for failing cpus when resuming it is now possible to survive e.g. a
>> cpupool being left without any cpu after resume by moving its domains
>> to cpupool0.
>>
>> Juergen Gross (6):
>>   xen/sched: call cpu_disable_scheduler() via cpu notifier
>>   xen: add helper for calling notifier_call_chain() to common/cpu.c
>>   xen: add new cpu notifier action CPU_RESUME_FAILED
>>   xen: don't free percpu areas during suspend
>>   xen/cpupool: simplify suspend/resume handling
>>   xen/sched: don't disable scheduler on cpus during suspend
>>
>>  xen/arch/arm/smpboot.c     |   4 -
>>  xen/arch/x86/percpu.c      |   3 +-
>>  xen/arch/x86/smpboot.c     |   3 -
>>  xen/common/cpu.c           |  61 +++++++-------
>>  xen/common/cpupool.c       | 131 ++++++++++++-----------------
>>  xen/common/schedule.c      | 203 +++++++++++++++++++--------------------------
>>  xen/include/xen/cpu.h      |  29 ++++---
>>  xen/include/xen/sched-if.h |   1 -
>>  8 files changed, 190 insertions(+), 245 deletions(-)
>>
> 
> I tested your patch series on ARM64 platform. We had issue with hard
> affinity - there was assertion failure in sched_credit2 code during
> suspension if one of the vCPUs is pinned to non-0 pCPU.
> 
> Seems, your patch series fixes the issue during suspend. But now I'm
> seeing crash during resume:

Oh, I wasn't aware the suspend/resume is possible on ARM, too.

I need to modify arch/arm/percpu.c like on x86.

Could you test the attached patch if it is working?


Juergen

--------------4C5F0BAC9DF5A03BCAECD675
Content-Type: text/x-patch;
 name="arm.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="arm.patch"

diff --git a/xen/arch/arm/percpu.c b/xen/arch/arm/percpu.c
index 25442c48fe..597027c6c9 100644
--- a/xen/arch/arm/percpu.c
+++ b/xen/arch/arm/percpu.c
@@ -58,11 +58,14 @@ static int cpu_percpu_callback(
     switch ( action )
     {
     case CPU_UP_PREPARE:
-        rc = init_percpu_area(cpu);
+        if ( system_state != SYS_STATE_resume )
+            rc = init_percpu_area(cpu);
         break;
     case CPU_UP_CANCELED:
     case CPU_DEAD:
-        free_percpu_area(cpu);
+    case CPU_RESUME_FAILED:
+        if ( system_state != SYS_STATE_suspend )
+            free_percpu_area(cpu);
         break;
     default:
         break;

--------------4C5F0BAC9DF5A03BCAECD675
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--------------4C5F0BAC9DF5A03BCAECD675--
