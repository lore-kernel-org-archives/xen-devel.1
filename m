From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v4 07/10] arm: add a tiny kconfig
 configuration
Date: Fri, 1 Jun 2018 13:51:41 -0700 (PDT)
Message-ID: <alpine.DEB.2.10.1806010853340.23991@sstabellini-ThinkPad-X260>
References: <alpine.DEB.2.10.1805311447570.23991@sstabellini-ThinkPad-X260>
 <1527803317-31750-7-git-send-email-sstabellini@kernel.org>
 <CAF3u54D0uj8_UJw+oBP4QvxXEJXnQzSA1oKowquKDEOem5B+=Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="8323329-1708382984-1527868555=:23991"
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <CAF3u54D0uj8_UJw+oBP4QvxXEJXnQzSA1oKowquKDEOem5B+=Q@mail.gmail.com>
Content-ID: <alpine.DEB.2.10.1806010936210.23991@sstabellini-ThinkPad-X260>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@gmail.com>
Cc: artem_mygaiev@epam.com, lars.kurth@citrix.com, Stefano Stabellini <sstabellini@kernel.org>, andrii_anisov@epam.com, dfaggioli@suse.com, julien.grall@arm.com, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1708382984-1527868555=:23991
Content-Type: TEXT/PLAIN; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.10.1806010936211.23991@sstabellini-ThinkPad-X260>

On Fri, 1 Jun 2018, Julien Grall wrote:
> Hi,
> Sorry for the formatting.
> 
> On Thu, 31 May 2018, 22:50 Stefano Stabellini, <sstabellini@kernel.org> wrote:
>       Add a tiny kconfig configuration. Enabled NULL and Credit schedulers.
>       Support only 8 cpus. It only carries non-default options (use make
>       olddefconfig to produce a complete .config file).
> 
>       Signed-off-by: Stefano Stabellini <sstabellini@kernel.org>
> 
>       ---
>       Note that this approach has a limitation: it is not possible to "select
>       a range". In other words, using tiny.config NR_CPUS is set to 4. It is
>       not possible to increase it to 8 from config RCAR3.
> 
> 
> Is that still true? I thought we discussed a solution to do it yesterday.

No, it is not true anymore. See the longer explanation I sent in reply
to the other emails. I'll remove this paragraph next time.


> By that, I mean the platform would be selected at olddefconfig.
> 
>       ---
>        xen/arch/arm/configs/tiny.conf | 43 ++++++++++++++++++++++++++++++++++++++++++
>        1 file changed, 43 insertions(+)
>        create mode 100644 xen/arch/arm/configs/tiny.conf
> 
>       diff --git a/xen/arch/arm/configs/tiny.conf b/xen/arch/arm/configs/tiny.conf
>       new file mode 100644
>       index 0000000..e9a5e65
>       --- /dev/null
>       +++ b/xen/arch/arm/configs/tiny.conf
>       @@ -0,0 +1,43 @@
>       +CONFIG_ARM_64=y
>       +CONFIG_ARM=y
>       +
>       +#
>       +# Architecture Features
>       +#
>       +# CONFIG_GICV3 is not set
>       +# CONFIG_MEM_ACCESS is not set
>       +# CONFIG_SBSA_VUART_CONSOLE is not set
>       +
>       +#
>       +# Common Features
>       +#
>       +# CONFIG_TMEM is not set
>       +
>       +#
>       +# Schedulers
>       +#
>       +# CONFIG_SCHED_CREDIT2 is not set
>       +# CONFIG_SCHED_RTDS is not set
>       +# CONFIG_SCHED_ARINC653 is not set
>       +CONFIG_SCHED_NULL=y
>       +CONFIG_SCHED_NULL_DEFAULT=y
>       +CONFIG_SCHED_DEFAULT="null"
>       +# CONFIG_SUPPRESS_DUPLICATE_SYMBOL_WARNINGS is not set
>       +
>       +#
>       +# Device Drivers
>       +#
>       +# CONFIG_HAS_NS16550 is not set
>       +# CONFIG_HAS_CADENCE_UART is not set
>       +# CONFIG_HAS_MVEBU is not set
>       +# CONFIG_HAS_PL011 is not set
>       +# CONFIG_HAS_SCIF is not set
>       +# CONFIG_ARM_SMMU is not set
>       +
>       +#
>       +# Debugging Options
>       +#
>       +# CONFIG_DEBUG is not set
>       +# CONFIG_FRAME_POINTER is not set
>       +# CONFIG_VERBOSE_DEBUG is not set
>       +# CONFIG_SCRUB_DEBUG is not set
>       --
>       1.9.1
> 
> 
>       _______________________________________________
>       Xen-devel mailing list
>       Xen-devel@lists.xenproject.org
>       https://lists.xenproject.org/mailman/listinfo/xen-devel
> 
> 
> 
--8323329-1708382984-1527868555=:23991
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-1708382984-1527868555=:23991--
