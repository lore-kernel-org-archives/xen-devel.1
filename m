From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v6 11/13] xen: support the Null scheduler
Date: Tue, 3 Jul 2018 12:08:32 -0700 (PDT)
Message-ID: <alpine.DEB.2.10.1807031035120.23811@sstabellini-ThinkPad-X260>
References: <alpine.DEB.2.10.1806131409300.14695@sstabellini-ThinkPad-X260>
 <1528924492-6579-11-git-send-email-sstabellini@kernel.org>
 <5B22706A02000078001CB4C2@prv1-mh.provo.novell.com>
 <3881fbda-d34b-caf2-23d7-5f6e0a956748@citrix.com>
 <alpine.DEB.2.10.1806141318080.14695@sstabellini-ThinkPad-X260>
 <fc748ba73ec2eacc38613883d7a80ea748cf4d37.camel@suse.com>
 <20180628073654.5wl7z2s4gc4s5by4@mac.bytemobile.com>
 <alpine.DEB.2.10.1806291136500.23811@sstabellini-ThinkPad-X260>
 <3a61996d-495d-e1ca-5e3c-619f2529c868@arm.com>
 <alpine.DEB.2.10.1807020901510.23811@sstabellini-ThinkPad-X260>
 <1312098f-0d2a-d871-3ba3-5e81394870a4@arm.com>
 <alpine.DEB.2.10.1807021438430.23811@sstabellini-ThinkPad-X260>
 <a0c5a063-7f45-3278-a2fd-cbd52afcecd9@arm.com>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="8323329-20601374-1530639444=:23811"
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <a0c5a063-7f45-3278-a2fd-cbd52afcecd9@arm.com>
Content-ID: <alpine.DEB.2.10.1807031037280.23811@sstabellini-ThinkPad-X260>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Artem Mygaiev <artem_mygaiev@epam.com>, Lars Kurth <lars.kurth@citrix.com>, nd@arm.com, Stefano Stabellini <sstabellini@kernel.org>, "andrii_anisov@epam.com" <andrii_anisov@epam.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, xen-devel@lists.xen.org, Jan Beulich <JBeulich@suse.com>, Dario Faggioli <dfaggioli@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-20601374-1530639444=:23811
Content-Type: TEXT/PLAIN; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.10.1807031037281.23811@sstabellini-ThinkPad-X260>

On Tue, 3 Jul 2018, Julien Grall wrote:
> Hi Stefano,
> 
> On 02/07/18 23:08, Stefano Stabellini wrote:
> > On Mon, 2 Jul 2018, Julien Grall wrote:
> > > Hi,
> > > 
> > > On 02/07/2018 19:24, Stefano Stabellini wrote:
> > > > On Mon, 2 Jul 2018, Julien Grall wrote:
> > > > > Hi Stefano,
> > > > > 
> > > > > On 06/29/2018 07:38 PM, Stefano Stabellini wrote:
> > > > > > On Thu, 28 Jun 2018, Roger Pau Monné wrote:
> > > > > > > On Thu, Jun 28, 2018 at 09:27:08AM +0200, Dario Faggioli wrote:
> > > > > > > > On Thu, 2018-06-14 at 13:20 -0700, Stefano Stabellini wrote:
> > > > > > > > > On Thu, 14 Jun 2018, Andrew Cooper wrote:
> > > > > > > > > > On 14/06/18 14:40, Jan Beulich wrote:
> > > > > > > > > > I don't think its reasonable to alter the support status
> > > > > > > > > > with
> > > > > > > > > > this
> > > > > > > > > issue
> > > > > > > > > > outstanding.
> > > > > > > > > 
> > > > > > > > > I completely missed this report, probably because I haven't
> > > > > > > > > paid
> > > > > > > > > attention to PV-shim. Do you have any more information about
> > > > > > > > > this?
> > > > > > > > > The
> > > > > > > > > report is a bit vague. If I can't repro it, I can't fix it.
> > > > > > > > > 
> > > > > > > > > Couldn't it be that is normal because after a while you ran
> > > > > > > > > out of
> > > > > > > > > pcpus?
> > > > > > > > > 
> > > > > > > > > Dario, do you have any opinion on this?
> > > > > > > > > 
> > > > > > > > The issue that I know of is that the null scheduler does not
> > > > > > > > properly
> > > > > > > > support CPU hotplug/hotunplug.
> > > > > > > > 
> > > > > > > > This is an issue on, let's say, baremetal, if you use null, and
> > > > > > > > try
> > > > > > > > to
> > > > > > > > do CPU hotplug/hotunplug. When trying to use null as the
> > > > > > > > scheduler
> > > > > > > > of
> > > > > > > > the shim, we run into that same issue, even if not specifically
> > > > > > > > doing
> > > > > > > > CPU hotplug/hotunplug (because the shim use the same path for
> > > > > > > > CPU
> > > > > > > > bringup, IIRC).
> > > > > > > 
> > > > > > > The shim uses CPU hotplug/unplug when the guest brings up/down a
> > > > > > > vCPU using the VCPUOP_{up/down} hypercall.
> > > > > > > 
> > > > > > > The best description of the issue I could find is:
> > > > > > > 
> > > > > > > https://lists.xenproject.org/archives/html/xen-devel/2018-01/msg01085.html
> > > > > > 
> > > > > > OK, thanks for the explanation. We don't support CPU hotplug on ARM,
> > > > > > so
> > > > > > we could mark the NULL scheduler as supported on the ARM
> > > > > > architecture
> > > > > > today? Once you implement CPU hotplug support in NULL, we could mark
> > > > > > it
> > > > > > as supported on x86 too.
> > > > > Well, Mirela paved the way to support CPU hotplug (should be merged
> > > > > soon).
> > > > > She
> > > > > is looking at suspend/resume which is IHMO an extension of hotplug
> > > > > case.
> > > > > So
> > > > > are you sure this could never happen on Arm?
> > > > 
> > > > I thought that suspend/resume didn't actually require the same kind of
> > > > scheduler support that CPU hotplug needs. If suspend/resume ends up
> > > > not working with scheduler NULL, then that is a problem.
> > > 
> > > The suspend/resume code will offline the CPU one by one using cpu_down.
> > > This
> > > is the same path as hotplug. So you will end up with more vCPUs than
> > > online
> > > pCPUs, although the domain will be frozen. How this is going to fit in the
> > > NULL scheduler?
> > 
> > [...]
> > 
> > > Virtually every platform support CPU hotplug. It is not just about
> > > "physically
> > > pluggable CPUs" but any CPU that can be offline at any time.
> > 
> > CPU hotplug in Xen clearly doesn't work as I expected: I assumed that
> > CPU hotplug would make a CPU "present" or "absent", while cpu_up/down
> > would make the CPU "online" and "offline". This is how things used to
> > work in the Linux kernel at least: a CPU can be turned down but still be
> > present on the socket. To do that, CPU hotplug is not involved. CPU
> > hotplug would get involved when the user yanks the physical CPU out of
> > the socket.
> 
> Are you sure? Looking at Linux they are using the CPU hotplug subsystem to
> online/offline CPUs. This is even used to bring up secondary CPUs during boot.
> This is not very different from how Xen is behaving.

arch_register/unregister_cpu in Linux make a cpu "present" and "absent"
respectively. They require CONFIG_HOTPLUG_CPU. cpu_up and cpu_down are
different operations to turn it "on" and "off" and are triggered via
sysfs. arch_register/unregister_cpu are triggered by ACPI events on
x86.

arch_register/unregister_cpu are hotplug operations, and cpu_up is not,
as expected. But it gets confusing because cpu_down depends on
CONFIG_HOTPLUG_CPU. So bringing up CPUs is not hotplug, but turning them
off at runtime is hotplug? Even though turning them off has nothing to
do with any physical or virtual "plugging". I find it very confusing. I
hope that in Xen will manage to do something clearer than this.


> >  From what you describe, it is not the case in Xen, and it really looks
> > like we need support for CPU hotplug in NULL even to support for the
> > most basic CPU offlining/onlining functionalities.
> 
> I think we at least want to have the bug reported by Andrew & Roger fixed. I
> am not entirely whether there would be other bug in the scheduler.

Sure. For the kconfig series I'll use credit instead until the issue is
fixed.
--8323329-20601374-1530639444=:23811
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-20601374-1530639444=:23811--
