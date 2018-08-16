From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v3 25/25] xen/arm: split domain_build.c
Date: Thu, 16 Aug 2018 11:12:26 -0700 (PDT)
Message-ID: <alpine.DEB.2.10.1808161106110.16354@sstabellini-ThinkPad-X260>
References: <alpine.DEB.2.10.1807311623060.5781@sstabellini-ThinkPad-X260>
 <1533079688-9541-25-git-send-email-sstabellini@kernel.org>
 <a5331c07-7f2a-dfee-6c7d-a3b3e6e21eb2@arm.com>
 <alpine.DEB.2.10.1808151644360.15066@sstabellini-ThinkPad-X260>
 <dbf9b7d3-b82c-47db-45d5-c0eabee4f232@arm.com>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="8323329-1766184295-1534443147=:16354"
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <dbf9b7d3-b82c-47db-45d5-c0eabee4f232@arm.com>
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

--8323329-1766184295-1534443147=:16354
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 16 Aug 2018, Julien Grall wrote:
> Hi Stefano,
> 
> On 08/16/2018 01:25 AM, Stefano Stabellini wrote:
> > On Mon, 13 Aug 2018, Julien Grall wrote:
> > > > +
> > > > +#ifndef CONFIG_ACPI
> > > > +static inline int prepare_acpi(struct domain *d, struct kernel_info
> > > > *kinfo)
> > > > +{
> > > > +    /* Only booting with ACPI will hit here */
> > > > +    BUG();
> > > > +    return -EINVAL;
> > > > +}
> > > > +#else
> > > > +int prepare_acpi(struct domain *d, struct kernel_info *kinfo);
> > > > +#endif
> > > 
> > > This one should go in asm-arm/acpi.h.
> > > 
> > > So this header is not necessary anymore.
> > 
> > I was unable to add prepare_acpi to asm-arm/acpi.h because it causes a
> > #include dependency hell, I am thinking of adding it to
> > asm-arm/domain_build.h.
> > 
> > In file included from
> > /local/repos/xen-upstream/xen/include/xen/sched.h:11:0,
> >                   from /local/repos/xen-upstream/xen/include/asm/domain.h:5,
> >                   from
> > /local/repos/xen-upstream/xen/include/asm/kernel.h:10,
> >                   from /local/repos/xen-upstream/xen/include/asm/acpi.h:27,
> >                   from
> > /local/repos/xen-upstream/xen/include/acpi/platform/aclinux.h:58,
> >                   from
> > /local/repos/xen-upstream/xen/include/acpi/platform/acenv.h:142,
> >                   from /local/repos/xen-upstream/xen/include/acpi/acpi.h:56,
> >                   from /local/repos/xen-upstream/xen/include/xen/acpi.h:33,
> >                   from pl011.c:307:
> > /local/repos/xen-upstream/xen/include/xen/domain.h:59:31: error: ‘struct
> > xen_domctl_createdomain’ declared inside parameter list will not be visible
> > outside of this definition or declaration [-Werror]
> >                          struct xen_domctl_createdomain *config);
> 
> Xen Arm headers are a bit a mess. :/
> 
> It looks like create_dom0 lives in setup.h, would it be possible to move the
> prototypes there?

It doesn't work either :-/

The problem is that the prototype of prepare_acpi needs the definition
of struct kernel_info, which triggers the include mess. Leaving the
prototypes in asm-arm/domain_build.h work though.
--8323329-1766184295-1534443147=:16354
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-1766184295-1534443147=:16354--
