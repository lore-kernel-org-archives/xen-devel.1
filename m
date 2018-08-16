From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v3 25/25] xen/arm: split domain_build.c
Date: Wed, 15 Aug 2018 17:25:32 -0700 (PDT)
Message-ID: <alpine.DEB.2.10.1808151644360.15066@sstabellini-ThinkPad-X260>
References: <alpine.DEB.2.10.1807311623060.5781@sstabellini-ThinkPad-X260>
 <1533079688-9541-25-git-send-email-sstabellini@kernel.org>
 <a5331c07-7f2a-dfee-6c7d-a3b3e6e21eb2@arm.com>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="8323329-778993463-1534379133=:15066"
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <a5331c07-7f2a-dfee-6c7d-a3b3e6e21eb2@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Stefano Stabellini <stefanos@xilinx.com>, Stefano Stabellini <sstabellini@kernel.org>, andrii_anisov@epam.com, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-778993463-1534379133=:15066
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 13 Aug 2018, Julien Grall wrote:
> Hi,
> 
> On 01/08/18 00:28, Stefano Stabellini wrote:
> > domain_build.c is too large.
> > 
> > Move all the ACPI specific device tree generating functions from
> > domain_build.c to acpi/acpi_dt_build.c.
> 
> The directory is called "acpi" so there is no point to duplicate in the
> filename.
> 
> Also, looking at the code moved, the name does not seem to be correct. Indeed
> you also generate ACPI tables. A better name for this file would be
> domain_build.c

OK


> > 
> > Signed-off-by: Stefano Stabellini <stefanos@xilinx.com>
> > ---
> >   xen/arch/arm/acpi/Makefile        |   1 +
> >   xen/arch/arm/acpi/acpi_dt_build.c | 591
> > ++++++++++++++++++++++++++++++++++++++
> >   xen/arch/arm/acpi/acpi_dt_build.h |  32 +++
> >   xen/arch/arm/domain_build.c       | 585
> > +------------------------------------
> >   4 files changed, 629 insertions(+), 580 deletions(-)
> >   create mode 100644 xen/arch/arm/acpi/acpi_dt_build.c
> >   create mode 100644 xen/arch/arm/acpi/acpi_dt_build.h
> > 
> > diff --git a/xen/arch/arm/acpi/Makefile b/xen/arch/arm/acpi/Makefile
> > index 23963f8..ac0804b 100644
> > --- a/xen/arch/arm/acpi/Makefile
> > +++ b/xen/arch/arm/acpi/Makefile
> > @@ -1,2 +1,3 @@
> >   obj-y += lib.o
> > +obj-y += acpi_dt_build.o
> >   obj-y += boot.init.o
> > diff --git a/xen/arch/arm/acpi/acpi_dt_build.c
> > b/xen/arch/arm/acpi/acpi_dt_build.c
> > new file mode 100644
> > index 0000000..7e12d64
> > --- /dev/null
> > +++ b/xen/arch/arm/acpi/acpi_dt_build.c
> > @@ -0,0 +1,591 @@
> 
> Missing copyright headers here.

OK


> > +#include <xen/mm.h>
> > +#include <xen/sched.h>
> > +#include <xen/acpi.h>
> > +#include <xen/event.h>
> > +#include <xen/iocap.h>
> > +#include <xen/device_tree.h>
> > +#include <xen/libfdt/libfdt.h>
> > +#include <xen/irq.h>
> > +#include <asm/irq.h>
> 
> Do we really need xen/irq.h and asm/irq.h?

No, I'll remove


> > +#include <acpi/actables.h>
> > +#include "acpi_dt_build.h"
> > +#include "../kernel.h"
> 
> Urgh, that's a call to move kernel.h in asm-arm/.

OK


> > diff --git a/xen/arch/arm/acpi/acpi_dt_build.h
> > b/xen/arch/arm/acpi/acpi_dt_build.h
> > new file mode 100644
> > index 0000000..08e7aab
> > --- /dev/null
> > +++ b/xen/arch/arm/acpi/acpi_dt_build.h
> > @@ -0,0 +1,32 @@
> > +#ifndef __ARCH_ARM_ACPI_ACPI_DT_BUILD_H__
> > +#define __ARCH_ARM_ACPI_ACPI_DT_BUILD_H__
> > +
> > +#include <xen/sched.h>
> > +#include "../kernel.h"
> 
> See above.

OK


> > +
> > +int map_irq_to_domain(struct domain *d, unsigned int irq,
> > +                      bool need_mapping, const char *devname);
> > +int make_chosen_node(const struct kernel_info *kinfo);
> > +void evtchn_allocate(struct domain *d);
> 
> Those one should be moved in an header domain_build.h in asm-arm.

OK


> > +
> > +#ifndef CONFIG_ACPI
> > +static inline int prepare_acpi(struct domain *d, struct kernel_info *kinfo)
> > +{
> > +    /* Only booting with ACPI will hit here */
> > +    BUG();
> > +    return -EINVAL;
> > +}
> > +#else
> > +int prepare_acpi(struct domain *d, struct kernel_info *kinfo);
> > +#endif
> 
> This one should go in asm-arm/acpi.h.
> 
> So this header is not necessary anymore.

I was unable to add prepare_acpi to asm-arm/acpi.h because it causes a
#include dependency hell, I am thinking of adding it to asm-arm/domain_build.h.

In file included from /local/repos/xen-upstream/xen/include/xen/sched.h:11:0,
                 from /local/repos/xen-upstream/xen/include/asm/domain.h:5,
                 from /local/repos/xen-upstream/xen/include/asm/kernel.h:10,
                 from /local/repos/xen-upstream/xen/include/asm/acpi.h:27,
                 from /local/repos/xen-upstream/xen/include/acpi/platform/aclinux.h:58,
                 from /local/repos/xen-upstream/xen/include/acpi/platform/acenv.h:142,
                 from /local/repos/xen-upstream/xen/include/acpi/acpi.h:56,
                 from /local/repos/xen-upstream/xen/include/xen/acpi.h:33,
                 from pl011.c:307:
/local/repos/xen-upstream/xen/include/xen/domain.h:59:31: error: ‘struct xen_domctl_createdomain’ declared inside parameter list will not be visible outside of this definition or declaration [-Werror]
                        struct xen_domctl_createdomain *config);

--8323329-778993463-1534379133=:15066
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-778993463-1534379133=:15066--
