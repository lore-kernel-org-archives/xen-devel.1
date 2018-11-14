From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 08/18] xen/arm: Disable/enable non-boot
 physical CPUs on suspend/resume
Date: Wed, 14 Nov 2018 15:04:00 -0800 (PST)
Message-ID: <alpine.DEB.2.10.1811141448310.302@sstabellini-ThinkPad-X260>
References: <1542022244-22977-1-git-send-email-mirela.simonovic@aggios.com>
 <1542022244-22977-9-git-send-email-mirela.simonovic@aggios.com>
 <283a8957-99d6-6b17-c52d-f8b0d9a7ca83@arm.com>
 <25f52d11-9ebe-ca0d-8447-ece8f34e93c9@aggios.com>
 <e0b9d487-879e-4e5c-7db3-57a8020ccd77@arm.com>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="8323329-133339741-1542235986=:302"
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UKUJ=NZ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1gN4CZ-00051p-99
 for xen-devel@lists.xenproject.org; Wed, 14 Nov 2018 23:04:03 +0000
In-Reply-To: <e0b9d487-879e-4e5c-7db3-57a8020ccd77@arm.com>
Content-ID: <alpine.DEB.2.10.1811141455440.302@sstabellini-ThinkPad-X260>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: xen-devel@lists.xen.org, dm@aggios.com, saeed.nowshadi@xilinx.com, Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org, stefano.stabellini@xilinx.com, Mirela Simonovic <mirela.simonovic@aggios.com>
List-Id: xen-devel@lists.xenproject.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-133339741-1542235986=:302
Content-Type: TEXT/PLAIN; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.10.1811141455441.302@sstabellini-ThinkPad-X260>

On Wed, 14 Nov 2018, Julien Grall wrote:
> Hi Mirela,
> 
> On 14/11/2018 13:00, Mirela Simonovic wrote:
> > 
> > 
> > On 11/14/2018 11:52 AM, Julien Grall wrote:
> > > Hi Mirela,
> > > 
> > > On 12/11/2018 11:30, Mirela Simonovic wrote:
> > > > Non-boot CPUs have to be disabled on suspend and enabled on resume
> > > > (hotplug-based mechanism). Disabling non-boot CPUs will lead to PSCI
> > > > CPU_OFF to be called by each non-boot CPU. Depending on the underlying
> > > > platform capabilities, this may lead to the physical powering down of
> > > > CPUs. Tested on Xilinx Zynq Ultrascale+ MPSoC (including power down of
> > > > each non-boot CPU).
> > > > 
> > > > Signed-off-by: Mirela Simonovic <mirela.simonovic@aggios.com>
> > > > Signed-off-by: Saeed Nowshadi <saeed.nowshadi@xilinx.com>
> > > > ---
> > > >   xen/arch/arm/suspend.c | 15 ++++++++++++++-
> > > >   1 file changed, 14 insertions(+), 1 deletion(-)
> > > > 
> > > > diff --git a/xen/arch/arm/suspend.c b/xen/arch/arm/suspend.c
> > > > index 575afd5eb8..dae1b1f7d6 100644
> > > > --- a/xen/arch/arm/suspend.c
> > > > +++ b/xen/arch/arm/suspend.c
> > > > @@ -1,4 +1,5 @@
> > > >   #include <xen/sched.h>
> > > > +#include <xen/cpu.h>
> > > >   #include <asm/cpufeature.h>
> > > >   #include <asm/event.h>
> > > >   #include <asm/psci.h>
> > > > @@ -115,17 +116,29 @@ static void vcpu_suspend(register_t epoint,
> > > > register_t cid)
> > > >   /* Xen suspend. Note: data is not used (suspend is the suspend to RAM)
> > > > */
> > > >   static long system_suspend(void *data)
> > > >   {
> > > > +    int status;
> > > > +
> > > >       BUG_ON(system_state != SYS_STATE_active);
> > > >         system_state = SYS_STATE_suspend;
> > > >       freeze_domains();
> > > >   +    status = disable_nonboot_cpus();
> > > > +    if ( status )
> > > > +    {
> > > > +        system_state = SYS_STATE_resume;
> > > > +        goto resume_nonboot_cpus;
> > > > +    }
> > > > +
> > > >       system_state = SYS_STATE_resume;
> > > >   +resume_nonboot_cpus:
> > > > +    enable_nonboot_cpus();
> > > >       thaw_domains();
> > > >       system_state = SYS_STATE_active;
> > > > +    dsb(sy);
> > > 
> > > Why do you need a dsb(sy) here?
> > > 
> > 
> > Updated value of system_state variable needs to be visible to other CPUs
> > before we move on
> 
> We tend to write the reason on top of barrier why they are necessary. But I am
> still unsure to understand why this is important. What would happen if move on
> without it?

That is a good question. I went through the code and it seems that the
only effect could be potentially taking the wrong path in
cpupool_cpu_add, but since that's called from a .notifier_call I don't
think it can happen in practice. It is always difficult to prove that
we don't need a barrier, it is easier to prove when we need a barrier,
but in this case it does look like we do not need it after all.

 
> > > >   -    return -ENOSYS;
> > > 
> > > Why do you return -ENOSYS until this patch? Should not have it be 0?
> > > 
> > 
> > To distinguish that Xen suspend wasn't supported until we at least do
> > something useful in suspend procedure. This is not so important, we can
> > return 0 but needs to be fixed in previous patches.
> 
> If you return 0 before hand you can more easily bisect this series and know
> where it suspend/resume breaks.

Why 0 improves bisectability? 0 prevents other checks from figuring out
that there was an error. Also, the feature is not bisectable until the
full series is applied.
--8323329-133339741-1542235986=:302
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-133339741-1542235986=:302--
