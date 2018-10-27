From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v5 05/25] xen/arm: check for multiboot nodes
 only under /chosen
Date: Fri, 26 Oct 2018 17:42:24 -0700 (PDT)
Message-ID: <alpine.DEB.2.10.1810261735070.32521@sstabellini-ThinkPad-X260>
References: <alpine.DEB.2.10.1810221859480.31582@sstabellini-ThinkPad-X260>
 <1540260184-11294-5-git-send-email-sstabellini@kernel.org>
 <e0434a3a-17aa-6835-d4b5-f841eacc32b8@arm.com>
 <alpine.DEB.2.10.1810261357430.32521@sstabellini-ThinkPad-X260>
 <a63ed658-8f3f-f66f-cfc1-2f1b78ecd8d5@arm.com>
 <655aea94-13a9-def2-6dcc-6d644f74813f@arm.com>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="8323329-582480120-1540600944=:32521"
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <655aea94-13a9-def2-6dcc-6d644f74813f@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Stefano Stabellini <stefanos@xilinx.com>, Achin.Gupta@arm.com, Stefano Stabellini <sstabellini@kernel.org>, andrii_anisov@epam.com, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-582480120-1540600944=:32521
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Fri, 26 Oct 2018, Julien Grall wrote:
> On 10/26/18 10:27 PM, Julien Grall wrote:
> > Hi,
> > 
> > On 10/26/18 10:12 PM, Stefano Stabellini wrote:
> > > On Fri, 26 Oct 2018, Julien Grall wrote:
> > > > Hi Stefano,
> > > > 
> > > > On 10/23/18 3:02 AM, Stefano Stabellini wrote:
> > > > > Make sure to only look for multiboot compatible nodes only under
> > > > > /chosen, not under any other paths (depth <= 3).
> > > > > 
> > > > > Signed-off-by: Stefano Stabellini <stefanos@xilinx.com>
> > > > > 
> > > > > ---
> > > > > 
> > > > > Changes in v5:
> > > > > - add patch
> > > > > - add check on return value of fdt_get_path
> > > > > ---
> > > > >    xen/arch/arm/bootfdt.c | 13 ++++++++++---
> > > > >    1 file changed, 10 insertions(+), 3 deletions(-)
> > > > > 
> > > > > diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
> > > > > index 8eba42c..a314aca 100644
> > > > > --- a/xen/arch/arm/bootfdt.c
> > > > > +++ b/xen/arch/arm/bootfdt.c
> > > > > @@ -173,7 +173,14 @@ static void __init process_multiboot_node(const
> > > > > void
> > > > > *fdt, int node,
> > > > >        bootmodule_kind kind;
> > > > >        paddr_t start, size;
> > > > >        const char *cmdline;
> > > > > -    int len;
> > > > > +    int len = sizeof("/chosen");
> > > > 
> > > > NIT, I am not convince you win anything with that trick. strlen could be
> > > > optimized by the compiler (we use __builtin_strlen on Arm64).
> > > 
> > > I could use strlen if you prefer, but given that the string is known at
> > > compile time, it should hopefully be resolved to "8" at compile time
> > > using sizeof. What's wrong with it?
> > 
> > __builtin_strlen should get optimized at compile-time. Although, I don't
> > seem to be the case when I tried. Not sure why.
> > 
> > Never mind then.
> 
> Actually I just tried to use __builtin_stlren rather than strlen. And
> GCC is computing the size at compiler time.
> 
> Somehow, I thought arm64 was using __builtin_strlen but it seems to implement
> there own. Most likely we would want to use __builtin_strlen wor constant
> string. But that's another story.
> 
> In that case, I would prefer if you use __builtin_strlen. This is easier to
> understand over sizeof.

sizeof should be easier than __builtin_strlen for most: sizeof is part
of the C language, and it is taught in C classes. I expect everybody
should know what it is. While __builtin_strlen is a compiler construct,
which is certainly not for beginners. I think it is strange you find it
easier, probably a side of effect of years of Xen/kernel programming :-)

I would rather keep it as is.
--8323329-582480120-1540600944=:32521
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-582480120-1540600944=:32521--
