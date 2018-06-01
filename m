From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v4 10/10] xen: add per-platform defaults for
 NR_CPUS
Date: Fri, 1 Jun 2018 13:53:38 -0700 (PDT)
Message-ID: <alpine.DEB.2.10.1806010855590.23991@sstabellini-ThinkPad-X260>
References: <alpine.DEB.2.10.1805311447570.23991@sstabellini-ThinkPad-X260>
 <1527803317-31750-10-git-send-email-sstabellini@kernel.org>
 <CAF3u54CKgHtX9g+R6wYA4+VL4RHCjWvSKEjxTnnwSiN3P8CuSA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="8323329-125409024-1527868819=:23991"
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <CAF3u54CKgHtX9g+R6wYA4+VL4RHCjWvSKEjxTnnwSiN3P8CuSA@mail.gmail.com>
Content-ID: <alpine.DEB.2.10.1806010936390.23991@sstabellini-ThinkPad-X260>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@gmail.com>
Cc: artem_mygaiev@epam.com, lars.kurth@citrix.com, Stefano Stabellini <sstabellini@kernel.org>, andrii_anisov@epam.com, andrew.cooper3@citrix.com, dfaggioli@suse.com, julien.grall@arm.com, JBeulich@suse.com, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-125409024-1527868819=:23991
Content-Type: TEXT/PLAIN; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.10.1806010936391.23991@sstabellini-ThinkPad-X260>

On Fri, 1 Jun 2018, Julien Grall wrote:
> Hi,
> Sorry for the formatting. I am pretty sure you need to CC "THE REST" here.
> 
> On Thu, 31 May 2018, 22:50 Stefano Stabellini, <sstabellini@kernel.org> wrote:
>       Add specific per-platform defaults for NR_CPUS. Note that the order of
>       the defaults matter: they need to go first, otherwise the generic
>       defaults will be applied.
> 
>       This is done so that Xen builds customized for a specific hardware
>       platform can have the right NR_CPUS number.
> 
>       Signed-off-by: Stefano Stabellini <sstabellini@kernel.org>
>       CC: JBeulich@suse.com
>       CC: andrew.cooper3@citrix.com
>       ---
>        xen/arch/Kconfig | 3 +++
>        1 file changed, 3 insertions(+)
> 
>       diff --git a/xen/arch/Kconfig b/xen/arch/Kconfig
>       index cf0acb7..d451eb8 100644
>       --- a/xen/arch/Kconfig
>       +++ b/xen/arch/Kconfig
>       @@ -2,6 +2,9 @@
>        config NR_CPUS
>               int "Maximum number of physical CPUs"
>               range 1 4095
>       +       default "8" if ARM && RCAR3
>       +       default "4" if ARM && QEMU
>       +       default "4" if ARM && MPSOC
>               default "256" if X86
>               default "128" if ARM
>               ---help---
> 
> 
> But I am not sure how this will work as with this series you can select multiple platforms in on Kconfig. What will be the end
> result?

The end result is the first default that applies. In this case, if
RCAR3, QEMU and MPSOC are all selected, then NR_CPUS would be set to
8, which is actually what one would want if she is trying to build Xen
for these three platforms, but it is not what one would want if she was
trying to build a generic Xen config for distros.

This is not great.

The option list you suggested could help solve the NR_CPUS issue, see
below.


> Anyway, as I mention the way to go is a option list with only one possible choice.

I am OK with an option list, the issue that we cannot have an ALL option
in the list that selects the other options as I wrote previously. For
instance, the following is NOT allowed:

config ALL
	bool "All Platforms"
	select MPSOC

However, having CONFIG_ALL would solve the NR_CPUS problem because we
could do:

config NR_CPUS
    default "128" if ARM && ALL
	default "8" if ARM && RCAR3
	default "4" if ARM && QEMU
	default "4" if ARM && MPSOC
	default "128" if ARM

Which would give us exactly the default we want for NR_CPUS.

So I agree that we should turn platform support into an option list and
we should also add an ALL option to solve the NR_CPUS problem.

If we do that, the remaining problem is how to implement ALL. I found a
workaround for the kconfig issue described above. The following works
correctly:

choice
	prompt "Platform Support"
	default ALL
	---help---
	Choose Xen support for different hardware platforms.

    config ALL
    	bool "All Platforms"
    	select MPSOC_PLATFORM
    	select QEMU_PLATFORM
    	select RCAR3_PLATFORM
    	---help---
    	Enable support for all platforms.
    
    config QEMU
    	bool "QEMU aarch virt machine support"
    	depends on ARM_64
    	select QEMU_PLATFORM
    	---help---
    	Enable all the required drivers for QEMU aarch64 virt emulated
    	machine.
    
    config RCAR3
    	bool "Renesas RCar3 support"
    	depends on ARM_64
    	select RCAR3_PLATFORM
    	---help---
    	Enable all the required drivers for Renesas RCar3
    
    config MPSOC
    	bool "Xilinx Ultrascale+ MPSoC support"
    	depends on ARM_64
    	select MPSOC_PLATFORM
    	---help---
    	Enable all the required drivers for Xilinx Ultrascale+ MPSoC
endchoice

config QEMU_PLATFORM
	bool
	select GICV3
	select HAS_PL011

config RCAR3_PLATFORM
	bool
	select HAS_SCIF

config MPSOC_PLATFORM
	bool
	select HAS_CADENCE_UART
	select ARM_SMMU


This looks like the best way forward and would solve all issues.
--8323329-125409024-1527868819=:23991
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-125409024-1527868819=:23991--
