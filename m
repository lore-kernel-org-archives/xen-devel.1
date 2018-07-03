From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH RFC 03/15] xen/arm: extend device tree based
 multiboot protocol
Date: Tue, 3 Jul 2018 15:23:35 -0700 (PDT)
Message-ID: <alpine.DEB.2.10.1807031519470.23811@sstabellini-ThinkPad-X260>
References: <alpine.DEB.2.10.1806131457490.14695@sstabellini-ThinkPad-X260>
 <1528928118-14960-3-git-send-email-sstabellini@kernel.org>
 <30b92df4-ae73-1803-94af-14a128c59746@arm.com>
 <alpine.DEB.2.10.1807021338290.23811@sstabellini-ThinkPad-X260>
 <CAJy5ezp50=UpYXActfqadGVL7m1NVk5BTwXnUTtQiY+Op59f3w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="8323329-1760581558-1530656544=:23811"
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <CAJy5ezp50=UpYXActfqadGVL7m1NVk5BTwXnUTtQiY+Op59f3w@mail.gmail.com>
Content-ID: <alpine.DEB.2.10.1807031523170.23811@sstabellini-ThinkPad-X260>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Cc: Artem Mygaiev <artem_mygaiev@epam.com>, Stefano Stabellini <stefanos@xilinx.com>, Stefano Stabellini <sstabellini@kernel.org>, andrii_anisov@epam.com, xen-devel@lists.xen.org, Julien Grall <julien.grall@arm.com>
List-Id: xen-devel@lists.xenproject.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1760581558-1530656544=:23811
Content-Type: TEXT/PLAIN; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.10.1807031523171.23811@sstabellini-ThinkPad-X260>

Hi Edgar,

Yes, we certainly don't want the xl parser in the hypervisor. We only
need a minimal subset of options. We do already have a device tree
parser that understands cells. We also have a parser for a set of
command line options, some of them similar to the VM options we need to
pass. I think we'll need introduce our own extra-simple format.

I forgot to CC you to my other reply on the subject: 

https://marc.info/?l=xen-devel&m=153065625412272

On Tue, 3 Jul 2018, Edgar E. Iglesias wrote:
> Hi, Sorry for the top post (I'm not managing todo in line reply with my phone). 
> 
> Yes, in the long run it there are some benefits if the format could be kept similar when possible. We could reuse some of the
> documentation and perhaps some of the code to parse. Allthough I'm guessing that most of the xl parsing is not readily reusable
> from the hypervisor itself.
> 
> On the other hand, perhaps the xl format parser is too complex and not something we would like be reused from within the
> hypervisor itself? Considering that one of the use cases for dom0 less is certification.
> 
> So an alternative if we don't try to reuse the xl format as much as possible could be to create a new syntax that is as easy as
> possible to parse.
> 
> I'm not very convinced on what path is best at the moment.
> 
> Regarding strings vs dtb numbers with cells, don't we already have a generic dtb function that parses numbers and considers the
> #cells that could be reused?
> 
> Best regards, 
> Edgar 
> 
> On Tue, Jul 3, 2018, 06:32 Stefano Stabellini <sstabellini@kernel.org> wrote:
>       On Thu, 14 Jun 2018, Julien Grall wrote:
>       > Hi Stefano,
>       >
>       > On 13/06/18 23:15, Stefano Stabellini wrote:
>       > > Extend the existing device tree based multiboot protocol to include
>       > > information regarding other domUs to boot.
>       > >
>       > > Signed-off-by: Stefano Stabellini <stefanos@xilinx.com>
>       > > ---
>       > >   docs/misc/arm/device-tree/booting.txt | 102
>       > > ++++++++++++++++++++++++++++++++++
>       > >   1 file changed, 102 insertions(+)
>       > >
>       > > diff --git a/docs/misc/arm/device-tree/booting.txt
>       > > b/docs/misc/arm/device-tree/booting.txt
>       > > index ce2d0dc..95255e5 100644
>       > > --- a/docs/misc/arm/device-tree/booting.txt
>       > > +++ b/docs/misc/arm/device-tree/booting.txt
>       > > @@ -119,3 +119,105 @@ For those you would hardcode the Xen commandline in
>       > > the DTB under
>       > >   line by writing bootargs (as for native Linux).
>       > >   A Xen-aware bootloader would set xen,xen-bootargs for Xen,
>       > > xen,dom0-bootargs
>       > >   for Dom0 and bootargs for native Linux.
>       > > +
>       > > +
>       > > +Creating DomUs directly from Xen
>       > > +================================
>       > > +
>       > > +It is possible to have Xen create other domains, in addition to dom0,
>       > > +out of the information provided via device tree. A Kernel and initrd
>       >
>       > NIT: s/Kernel/kernel/
> 
>       OK
> 
> 
>       > > +(optional) need to be specified for each guest.
>       > > +
>       > > +For each DomU to be created there needs to be one node under /chosen
>       > > +with the following properties:
>       >
>       > I think it would be better to make this domain agnostic. I.e allow Dom0 to be
>       > created the same way but still supporting the current bindings.
>       >
>       > We could differentiate Dom0 from the other with a property
>       > "xen,initial-domain". Note that I am not asking to add this property in this
>       > series. This is more a forward looking of the use of this binding.
> 
>       It sounds like a good idea, I'll add it.
> 
> 
>       > > +
>       > > +- compatible
>       > > +
>       > > +    "xen,domU"
>       >
>       > If we follow my suggestion, this would be renamed "xen,domain".
> 
>       OK
> 
> 
>       > > +
>       > > +- mem (optional)
>       >
>       > I would prefer the full name "memory".
> 
>       Yes, especially given that the corresponding xl config file option is
>       called "memory".
> 
> 
>       > > +
>       > > +    A string specifying the amount of RAM to allocate to the guest. If
>       > > +    not specified it defaults to "64M". The format of the string is the
>       > > same
>       > > +    as the one for the mem= parameter in xl config files.
>       >
>       > I don't much like default values because they are pretty arbitrary. This also
>       > does not match the default value for Dom0. Why don't you mandate the property?
> 
>       Yes, I can do that.
> 
> 
>       > I would also prefer if the size is specified in the same way number are
>       > described in Device-Tree. I.e using cells. You could impose 2 cells for the
>       > size here.
> 
>       see below
> 
> 
>       > > +
>       > > +- cpus (optional)
>       > > +
>       > > +    A string specifying the number of vcpus to allocate to the guest. If
>       > > +    not specified it defaults to "1".
>       >
>       > Same remarks as for "mem".
> 
>       I think it would be nicer if we kept the same format used for xl config
>       files for these two options. Especially given that we already have the
>       functions in the hypervisor to parse them (Xen knows how to parse
>       dom0_max_vcpus and dom0_mem for instance). It is going to be easier to
>       use and it doesn't come with a cost for Xen.
> 
>       Edgar, what do you think?
> 
> 
>       > > +
>       > > +- #address-cells and #size-cells
>       > > +
>       > > +    Both #address-cells and #size-cells need to be specified because
>       > > +    both sub-nodes (described shortly) have reg properties.
>       > > +
>       > > +Under the "xen,domU" compatible node, one or more sub-nodes are present
>       > > +for the DomU kernel and ramdisk.
>       > > +
>       > > +The kernel sub-node has the following properties:
>       > > +
>       > > +- compatible
>       > > +
>       > > +    "multiboot,domU-kernel"
>       >
>       > I don't think we need to specify a new compatible here. We could re-use
>       > "multiboot,kernel" here because the parent node will contain "xen,domU".
> 
>       Yes you are right
> 
> 
>       > > +
>       > > +- reg
>       > > +
>       > > +    Specifies the physical address of the kernel in RAM and its
>       > > +    length.
>       > > +
>       > > +- bootargs (optional)
>       > > +
>       > > +    Command line parameters for the guest kernel.
>       > > +
>       > > +The ramdisk sub-node has the following properties:
>       > > +
>       > > +- compatible
>       > > +
>       > > +    "multiboot,domU-ramdisk"
>       >
>       > Same here, we could re-use "multiboot,ramdisk".
> 
>       OK
> 
> 
>       > > +
>       > > +- reg
>       > > +
>       > > +    Specifies the physical address of the ramdisk in RAM and its
>       > > +    length.
>       >
>       > We should mention somewhere that this should be described in the /chosen node
>       > of the device-tree.
> 
>       OK
> 
>       _______________________________________________
>       Xen-devel mailing list
>       Xen-devel@lists.xenproject.org
>       https://lists.xenproject.org/mailman/listinfo/xen-devel
> 
> 
> 
--8323329-1760581558-1530656544=:23811
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-1760581558-1530656544=:23811--
