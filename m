From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] xen/arm: Park CPUs with a MIDR different
 from the boot CPU.
Date: Tue, 13 Feb 2018 12:21:35 -0800 (PST)
Message-ID: <alpine.DEB.2.10.1802131221170.17935@sstabellini-ThinkPad-X260>
References: <20180130181840.5068-1-julien.grall@arm.com>
 <alpine.DEB.2.10.1802011128460.11958@sstabellini-ThinkPad-X260>
 <CAEC2Cxq-DZ3SesM8Jibyw776ZpZUhAgX5eaw9dE1d6OKbvY3jA@mail.gmail.com>
 <alpine.DEB.2.10.1802081548550.3257@sstabellini-ThinkPad-X260>
 <99cfa618-55bf-d226-3a6c-c6c8b2daeba5@arm.com>
 <alpine.DEB.2.10.1802091101310.31919@sstabellini-ThinkPad-X260>
 <b1f5e760-6378-384b-8514-614aaa4137bf@arm.com>
 <alpine.DEB.2.10.1802091108160.31919@sstabellini-ThinkPad-X260>
 <980667e4-f7cc-a1ea-cae2-10beacbdde73@arm.com>
 <b91ce735-2832-252e-1953-24ba540b6b5d@arm.com>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="8323329-48574967-1518553296=:17935"
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <b91ce735-2832-252e-1953-24ba540b6b5d@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Andre Przywara <andre.przywara@linaro.org>, Julien Grall <julien.grall@linaro.org>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-48574967-1518553296=:17935
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Tue, 13 Feb 2018, Julien Grall wrote:
> On 02/09/2018 07:12 PM, Julien Grall wrote:
> > Hi,
> > 
> > On 02/09/2018 07:10 PM, Stefano Stabellini wrote:
> > > On Fri, 9 Feb 2018, Julien Grall wrote:
> > > > On 02/09/2018 07:02 PM, Stefano Stabellini wrote:
> > > > > On Fri, 9 Feb 2018, Julien Grall wrote:
> > > > > > Hi,
> > > > > > 
> > > > > > On 02/08/2018 11:49 PM, Stefano Stabellini wrote:
> > > > > > > On Thu, 1 Feb 2018, Julien Grall wrote:
> > > > > > > > On 1 February 2018 at 19:37, Stefano Stabellini
> > > > > > > > <sstabellini@kernel.org>
> > > > > > > > wrote:
> > > > > > > > > On Tue, 30 Jan 2018, Julien Grall wrote:
> > > > > > > > > > Xen does not properly support big.LITTLE platform. All vCPUs
> > > > > > > > > > of a
> > > > > > > > > > guest
> > > > > > > > > > will always have the MIDR of the boot CPU (see
> > > > > > > > > > arch_domain_create).
> > > > > > > > > > At best the guest may see unreliable performance (vCPU
> > > > > > > > > > switching
> > > > > > > > > > between
> > > > > > > > > > big and LITTLE), at worst the guest will become unreliable
> > > > > > > > > > or
> > > > > > > > > > insecure.
> > > > > > > > > > 
> > > > > > > > > > This is becoming more apparent with branch predictor
> > > > > > > > > > hardening in
> > > > > > > > > > Linux
> > > > > > > > > > because they target a specific kind of CPUs and may not work
> > > > > > > > > > on
> > > > > > > > > > other
> > > > > > > > > > CPUs.
> > > > > > > > > > 
> > > > > > > > > > For the time being, park any CPUs with a MDIR different from
> > > > > > > > > > the
> > > > > > > > > > boot
> > > > > > > > > > CPU. This will be revisited in the future once Xen gains
> > > > > > > > > > understanding
> > > > > > > > > > of big.LITTLE.
> > > > > > > > > > 
> > > > > > > > > > [1]
> > > > > > > > > > https://lists.xenproject.org/archives/html/xen-devel/2016-12/msg00826.html 
> > > > > > > > > > 
> > > > > > > > > > Signed-off-by: Julien Grall <julien.grall@arm.com>
> > > > > > > > > > 
> > > > > > > > > > ---
> > > > > > > > > > 
> > > > > > > > > > We probably want to backport this as part of XSA-254. Using
> > > > > > > > > > big.LITTLE
> > > > > > > > > > on Xen has never been supported but we didn't make it
> > > > > > > > > > clearly.
> > > > > > > > > > This is
> > > > > > > > > > becoming more apparent with code targeting specific CPUs.
> > > > > > > > > > ---
> > > > > > > > > >     xen/arch/arm/smpboot.c | 15 +++++++++++++++
> > > > > > > > > >     1 file changed, 15 insertions(+)
> > > > > > > > > > 
> > > > > > > > > > diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
> > > > > > > > > > index 1255185a9c..2c2815f9ee 100644
> > > > > > > > > > --- a/xen/arch/arm/smpboot.c
> > > > > > > > > > +++ b/xen/arch/arm/smpboot.c
> > > > > > > > > > @@ -292,6 +292,21 @@ void start_secondary(unsigned long
> > > > > > > > > > boot_phys_offset,
> > > > > > > > > > 
> > > > > > > > > >         init_traps();
> > > > > > > > > > 
> > > > > > > > > > +    /*
> > > > > > > > > > +     * Currently Xen assumes the platform has only one kind
> > > > > > > > > > of
> > > > > > > > > > CPUs.
> > > > > > > > > > +     * This assumption does not hold on big.LITTLE platform
> > > > > > > > > > and
> > > > > > > > > > may
> > > > > > > > > > +     * result to unstability. Better to park them for now.
> > > > > > > > > > +     *
> > > > > > > > > > +     * TODO: Add big.LITTLE support.
> > > > > > > > > > +     */
> > > > > > > > > > +    if ( current_cpu_data.midr.bits !=
> > > > > > > > > > boot_cpu_data.midr.bits )
> > > > > > > > > > +    {
> > > > > > > > > > +        printk(XENLOG_ERR "CPU%u MIDR (0x%x) does not match
> > > > > > > > > > boot
> > > > > > > > > > CPU
> > > > > > > > > > MIDR (0x%x).\n",
> > > > > > > > > > +               smp_processor_id(),
> > > > > > > > > > current_cpu_data.midr.bits,
> > > > > > > > > > +               boot_cpu_data.midr.bits);
> > > > > > > > > > +        stop_cpu();
> > > > > > > > > > +    }
> > > > > > > > > 
> > > > > > > > > I understand that this patch is the right thing to do from a
> > > > > > > > > correctness
> > > > > > > > > perspective, especially in regards to the SP2 mitigation.
> > > > > > > > > 
> > > > > > > > > At the same time I would also like to give the option for
> > > > > > > > > people
> > > > > > > > > that
> > > > > > > > > want to use big.LITTLE with cpupools / cpu pinning to do so if
> > > > > > > > > they
> > > > > > > > > really want to, but I am not sure what to suggest.
> > > > > > > > > 
> > > > > > > > > Could we introduce a command line to proceed anyway? But then
> > > > > > > > > the
> > > > > > > > > system
> > > > > > > > > would be susceptible to SP2 in the cpus different from the
> > > > > > > > > boot cpu.
> > > > > > > > > Could we make the SP2 mitigation work on big.LITTLE or is it
> > > > > > > > > too
> > > > > > > > > much
> > > > > > > > > trouble? Do you have any other ideas or thoughts about this?
> > > > > > > > 
> > > > > > > > This patch is here to prevent to spread instability/insecurity
> > > > > > > > or give
> > > > > > > > the feeling we do support big.LITTLE.
> > > > > > > > 
> > > > > > > > Even outside of SP2, there are possibility for instability
> > > > > > > > because CPU
> > > > > > > > errata
> > > > > > > > would not be applied correctly in the guest or because Xen is
> > > > > > > > not able
> > > > > > > > to
> > > > > > > > know that non CPUs may have a different cacheline size...
> > > > > > > > 
> > > > > > > > I want to end this idea that Xen may support big.LITTLE.
> > > > > > > > 
> > > > > > > > The first thing to modify is the vpdir (virtual MIDR), at the
> > > > > > > > moment
> > > > > > > > we
> > > > > > > > always
> > > > > > > > use the boot MIDR. What would you choose now? The MIDR of the
> > > > > > > > CPU
> > > > > > > > where
> > > > > > > > the hypercall happen?
> > > > > > > > 
> > > > > > > > There is no shortcut for big.LITTLE. The right thing is to
> > > > > > > > implement
> > > > > > > > what
> > > > > > > > has
> > > > > > > > been discussed in the design document written by Dario. But
> > > > > > > > that's a
> > > > > > > > new
> > > > > > > > feature and would require some work to do it properly.
> > > > > > > > 
> > > > > > > > A command line option might be a good idea, but I would be more
> > > > > > > > of the
> > > > > > > > opinion
> > > > > > > > to delay that and see who is screaming about it.
> > > > > > > > 
> > > > > > > > My hunch is not many people will scream because today they tend
> > > > > > > > to
> > > > > > > > disable
> > > > > > > > one set of CPUs in the DT directly.
> > > > > > > 
> > > > > > > As discussed, are you going to resend with a command line option
> > > > > > > such as
> > > > > > > biglittle=unsafe or something like that?
> > > > > > 
> > > > > > I would prefer to avoid term big.LITTLE in the command line option
> > > > > > because
> > > > > > it
> > > > > > might be possible to have platform with more than two kind of CPUs.
> > > > > > How
> > > > > > about
> > > > > > "smp=unsafe"?
> > > > > 
> > > > > I am fine with not using big.LITTLE but smp=unsafe is a bit confusing.
> > > > > What do you think of: "heterogeneous=unsafe" it is a bit of a mouthful
> > > > > but it should be clearer.
> > > > 
> > > > Heterogeneous does not tell you what you are trying to do. I think it
> > > > needs to
> > > > be qualified with the smp (or something similar).\
> > > > 
> > > > How about mp_unsafe_heterogeneous=yes/no.
> > > 
> > > it's getting longer and longer, but OK :-)  At least it's descriptive.
> > 
> > It will be easier to spot in the logs :). I will resend the patch next week
> > with the command line added.
> 
> After looking at the design doc from Dario, I was wondering if we should name
> the option: hmp_unsafe (or amp_unsafe). This would make the name slightly
> shorter.
> 
> The description of the command line would be:
> 
> "Say yes at your own risk if you want to enable heterogenous computing (such
> as big.LITTLE). This may result to an unstable and insecure platform. By
> default cores which are not identical to the boot CPU will be parked and not
> used by Xen.".

Good idea, Julien. hmp_unsafe is far better.
--8323329-48574967-1518553296=:17935
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-48574967-1518553296=:17935--
