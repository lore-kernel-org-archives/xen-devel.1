From: Martin Cerveny <martin@c-home.cz>
Subject: Re: [BUG] unable to shutdown (page fault in
 mwait_idle()/do_dbs_timer()/__find_next_bit()) (fwd)
Date: Thu, 8 Mar 2018 11:26:08 +0100 (CET)
Message-ID: <alpine.GSO.2.00.1803081124510.4381@dmz.c-home.cz>
References: <alpine.GSO.2.00.1801071253201.12024@dmz.c-home.cz>
 <5A534F63020000780019C036@prv-mh.provo.novell.com>
 <alpine.GSO.2.00.1801081614550.20626@dmz.c-home.cz>
 <5A54FAF7020000780019CD3E@prv-mh.provo.novell.com>
 <alpine.GSO.2.00.1801092044510.10972@dmz.c-home.cz>
 <5A982A5402000078001AD6F8@prv-mh.provo.novell.com>
Reply-To: Martin Cerveny <M.Cerveny@computer.org>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="-559023410-456208845-1520504769=:4381"
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=rgco=f6=c-home.cz=martin@srs-us1.protection.inumbo.net>)
 id 1ett1x-0001jZ-MP
 for xen-devel@lists.xenproject.org; Thu, 08 Mar 2018 10:44:13 +0000
In-Reply-To: <5A982A5402000078001AD6F8@prv-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---559023410-456208845-1520504769=:4381
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed

Hello.

Console output added (7x OK, 2x FAILED).

Thanks, M.C>

On Thu, 1 Mar 2018, Jan Beulich wrote:

>>>> On 09.01.18 at 23:51, <martin@c-home.cz> wrote:
>> Hello.
>
> I'm sorry for taking so long to get back to this.
>
>> On Tue, 9 Jan 2018, Jan Beulich wrote:
>>>>>> On 08.01.18 at 17:07, <martin@c-home.cz> wrote:
>>>> On Mon, 8 Jan 2018, Jan Beulich wrote:
>>>>>>>> On 07.01.18 at 13:34, <martin@c-home.cz> wrote:
>>>>>> (XEN) ----[ Xen-4.10.0-vgpu  x86_64  debug=n   Not tainted ]----
>>>>>
>>>>> The -vgpu tag makes me wonder whether you have any patches in
>>>>> your tree on top of plain 4.10.0 (or 4.10-staging). Also the debug=n
>>>>> above ...
>>>>
>>>> 4.10.0 + 11 patches to make nvidia/vgpu work
>>>> (https://github.com/xenserver/xen-4.7.pg).
>>>> debug=n because xen's modified debug build process.
>>>>
>>>>>> (XEN)    [<ffff82d08026ae60>] __find_next_bit+0x10/0x80
>>>>>> (XEN)    [<ffff82d080253180>] cpufreq_ondemand.c#do_dbs_timer+0x160/0x220
>>>>>> (XEN)    [<ffff82d0802c7c0e>] mwait-idle.c#mwait_idle+0x23e/0x340
>>>>>> (XEN)    [<ffff82d08026fa56>] domain.c#idle_loop+0x86/0xc0
>>>>>
>>>>> ... makes this call trace unreliable. But even with a reliable call
>>>>> trace, analysis of the crash would be helped if you made
>>>>> available the xen-syms (or xen.efi, depending on how you boot)
>>>>> somewhere.
>>>>
>>>> xen-syms - http://www.uschovna.cz/en/zasilka/UDP5LVE2679CGBIS-4YV/
>>>
>>> Thanks. Looks to be a race between a timer in the governor and
>>> the CPUs being brought down. In general the governor is supposed
>>> to be disabled in the course of CPUs being brought down, so first
>>> of all I wonder whether you're having some daemon in use which
>>> sends management requests to the CPUfreq driver in Xen. Such a
>>> daemon should of course be disabled by the system shutdown
>>> scripts. Otherwise please try the attached debugging patch -
>>> maybe we can see something from its output.
>>
>> I suppose there should no be running anything because Dom0 kernel already
>> ended (see last two messages from dom0 kernel). Or how to check it ?
>>
>> Patch added.
>> - no "dbs:" in output (grep "dbs:" ...)
>
> Okay, this sufficiently proves that nothing tries to re-enable a
> governor after they were brought down for the CPUs.
>
>> - exaples of shutdown output (1* OK + 2* fail):
>>
>> -----------------------------------------------------
>>
>> [  632.439402] ACPI: Preparing to enter system sleep state S5
>> [  632.486728] reboot: Power down
>> (XEN) Preparing system for ACPI S5 state.
>> (XEN) Disabling non-boot CPUs ...
>> (XEN) cpufreq: del CPU1 (1,ffaaab,1,2)
>> (XEN) Broke affinity for irq 140
>> (XEN) cpufreq: del CPU2 (1,4,1,4)
>> (XEN) Broke affinity for irq 139
>> (XEN) cpufreq: del CPU3 (1,ffaaa9,1,8)
>> (XEN) Broke affinity for irq 83
>> (XEN) cpufreq: del CPU4 (1,10,1,10)
>> (XEN) Broke affinity for irq 137
>> (XEN) cpufreq: del CPU5 (1,ffaaa1,1,20)
>> (XEN) cpufreq: del CPU6 (1,40,1,40)
>> (XEN) Broke affinity for irq 141
>> (XEN) cpufreq: del CPU7 (1,ffaa81,1,80)
>> (XEN) cpufreq: del CPU8 (1,100,1,100)
>> (XEN) cpufreq: del CPU9 (1,ffaa01,1,200)
>> (XEN) cpufreq: del CPU10 (1,400,1,400)
>> (XEN) cpufreq: del CPU11 (1,ffa801,1,800)
>> (XEN) cpufreq: del CPU12 (1,1000,1,1000)
>> (XEN) cpufreq: del CPU13 (1,ffa001,1,2000)
>> (XEN) cpufreq: del CPU14 (1,4000,1,4000)
>> (XEN) cpufreq: del CPU15 (1,ff8001,1,8000)
>> (XEN) cpufreq: del CPU16 (1,ff0001,1,10000)
>> (XEN) cpufreq: del CPU17 (1,fe0001,1,20000)
>> (XEN) cpufreq: del CPU18 (1,fc0001,1,40000)
>> (XEN) cpufreq: del CPU19 (1,f80001,1,80000)
>> (XEN) cpufreq: del CPU20 (1,f00001,1,100000)
>> (XEN) cpufreq: del CPU21 (1,e00001,1,200000)
>> (XEN) cpufreq: del CPU22 (1,c00001,1,400000)
>> (XEN) cpufreq: del CPU23 (1,800001,1,800000)
>> (XEN) Broke affinity for irq 72
>> (XEN) cpufreq: del CPU0 (1,1,1,1)
>> (XEN) Entering ACPI S5 state.
>
> So this, despite being the working example, already shows a very
> odd arrangement: All odd numbered CPUs _and_ all even numbered
> ones from 16 up share a domain. The typical case would be for all
> sibling threads and/or cores to share a domain, iirc.
>
>> (XEN) cpufreq: del CPU23 (1,800001,1,800000)
>> (XEN) ----[ Xen-4.10.0-vgpu  x86_64  debug=n   Not tainted ]----
>> (XEN) CPU:    23
>
> So at the time the debug message gets printed, policy->cpus is
> still valid. With hw_all set, next thing is the call
> __cpufreq_governor(policy, CPUFREQ_GOV_STOP), which
> ought to lead to cpufreq_governor_dbs()'s
> "case CPUFREQ_GOV_STOP", which in turn calls dbs_timer_exit().
> That function kills the timer that causes the crash. kill_timer(), in
> turn, makes sure the timer being killed does not currently have
> its handler executed on any CPU. IOW I can't spot any race, yet
> there quite obviously is one in your case. All I can do at the
> moment is hand you an extended debugging patch.
>
> Jan
>
> --- unstable.orig/xen/drivers/cpufreq/cpufreq.c	2017-09-12 12:39:58.310556379 +0200
> +++ unstable/xen/drivers/cpufreq/cpufreq.c	2018-03-01 16:26:55.071367162 +0100
> @@ -190,6 +190,7 @@ int cpufreq_add_cpu(unsigned int cpu)
>             break;
>         }
>     }
> +printk("CPU%u: dom%u (%u,%u)\n", cpu, dom, domexist, hw_all);//temp
>
>     if (!domexist) {
>         cpufreq_dom = xzalloc(struct cpufreq_dom);
> @@ -352,6 +353,8 @@ int cpufreq_del_cpu(unsigned int cpu)
>
>     /* for HW_ALL, stop gov for each core of the _PSD domain */
>     /* for SW_ALL & SW_ANY, stop gov for the 1st core of the _PSD domain */
> +printk("cpufreq: del CPU%u (%u,%lx,%lu,%lx)\n", cpu,//temp
> +       hw_all, cpufreq_dom->map->bits[0], perf->domain_info.num_processors, policy->cpus->bits[0]);//temp
>     if (hw_all || (cpumask_weight(cpufreq_dom->map) ==
>                    perf->domain_info.num_processors))
>         __cpufreq_governor(policy, CPUFREQ_GOV_STOP);
> --- unstable.orig/xen/drivers/cpufreq/cpufreq_ondemand.c	2017-09-12 12:39:58.310556379 +0200
> +++ unstable/xen/drivers/cpufreq/cpufreq_ondemand.c	2018-03-01 16:21:41.829296179 +0100
> @@ -179,6 +179,9 @@ static void do_dbs_timer(void *dbs)
>     if (!dbs_info->enable)
>         return;
>
> +if(system_state > SYS_STATE_active) {//temp
> + printk("dbs: check CPU%u\n", dbs_info->cpu);
> +}
>     dbs_check_cpu(dbs_info);
>
>     set_timer(&per_cpu(dbs_timer, dbs_info->cpu),
> @@ -218,6 +221,9 @@ int cpufreq_governor_dbs(struct cpufreq_
>
>     switch (event) {
>     case CPUFREQ_GOV_START:
> +if(system_state > SYS_STATE_active) {//temp
> + printk("dbs: start CPU%u [%pS]\n", cpu, __builtin_return_address(0));
> +}
>         if ((!cpu_online(cpu)) || (!policy->cur))
>             return -EINVAL;
>
> @@ -273,12 +279,18 @@ int cpufreq_governor_dbs(struct cpufreq_
>         break;
>
>     case CPUFREQ_GOV_STOP:
> +if(system_state > SYS_STATE_active) {//temp
> + printk("dbs: stop CPU%u (%u,%d)\n", cpu, this_dbs_info->cpu, this_dbs_info->enable);
> +}
>         if ( !this_dbs_info->enable )
>             /* Already not enabled */
>             break;
>
>         dbs_timer_exit(this_dbs_info);
>         dbs_enable--;
> +if(system_state > SYS_STATE_active) {//temp
> + printk("dbs: stopped CPU%u (%d,%u)\n", cpu, per_cpu(dbs_timer, cpu).status, per_cpu(dbs_timer, cpu).cpu);
> +}
>
>         break;
>
>
>
---559023410-456208845-1520504769=:4381
Content-Type: APPLICATION/ZIP; name=debug_output_20180308.zip
Content-Transfer-Encoding: BASE64
Content-ID: <alpine.GSO.2.00.1803081126080.4381@dmz.c-home.cz>
Content-Description: 
Content-Disposition: attachment; filename=debug_output_20180308.zip

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

---559023410-456208845-1520504769=:4381
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

---559023410-456208845-1520504769=:4381--
