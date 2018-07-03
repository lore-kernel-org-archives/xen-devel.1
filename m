From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Subject: Re: [PATCH RFC 03/15] xen/arm: extend device tree based
 multiboot protocol
Date: Tue, 3 Jul 2018 18:35:35 +0900
Message-ID: <CAJy5ezp50=UpYXActfqadGVL7m1NVk5BTwXnUTtQiY+Op59f3w@mail.gmail.com>
References: <alpine.DEB.2.10.1806131457490.14695@sstabellini-ThinkPad-X260>
 <1528928118-14960-3-git-send-email-sstabellini@kernel.org>
 <30b92df4-ae73-1803-94af-14a128c59746@arm.com>
 <alpine.DEB.2.10.1807021338290.23811@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7931161671759951305=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <alpine.DEB.2.10.1807021338290.23811@sstabellini-ThinkPad-X260>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Artem Mygaiev <artem_mygaiev@epam.com>, Stefano Stabellini <stefanos@xilinx.com>, Julien Grall <julien.grall@arm.com>, andrii_anisov@epam.com, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

--===============7931161671759951305==
Content-Type: multipart/alternative; boundary="000000000000b36b5305701502f3"

--000000000000b36b5305701502f3
Content-Type: text/plain; charset="UTF-8"

Hi, Sorry for the top post (I'm not managing todo in line reply with my
phone).

Yes, in the long run it there are some benefits if the format could be kept
similar when possible. We could reuse some of the documentation and perhaps
some of the code to parse. Allthough I'm guessing that most of the xl
parsing is not readily reusable from the hypervisor itself.

On the other hand, perhaps the xl format parser is too complex and not
something we would like be reused from within the hypervisor itself?
Considering that one of the use cases for dom0 less is certification.

So an alternative if we don't try to reuse the xl format as much as
possible could be to create a new syntax that is as easy as possible to
parse.

I'm not very convinced on what path is best at the moment.

Regarding strings vs dtb numbers with cells, don't we already have a
generic dtb function that parses numbers and considers the #cells that
could be reused?

Best regards,
Edgar

On Tue, Jul 3, 2018, 06:32 Stefano Stabellini <sstabellini@kernel.org>
wrote:

> On Thu, 14 Jun 2018, Julien Grall wrote:
> > Hi Stefano,
> >
> > On 13/06/18 23:15, Stefano Stabellini wrote:
> > > Extend the existing device tree based multiboot protocol to include
> > > information regarding other domUs to boot.
> > >
> > > Signed-off-by: Stefano Stabellini <stefanos@xilinx.com>
> > > ---
> > >   docs/misc/arm/device-tree/booting.txt | 102
> > > ++++++++++++++++++++++++++++++++++
> > >   1 file changed, 102 insertions(+)
> > >
> > > diff --git a/docs/misc/arm/device-tree/booting.txt
> > > b/docs/misc/arm/device-tree/booting.txt
> > > index ce2d0dc..95255e5 100644
> > > --- a/docs/misc/arm/device-tree/booting.txt
> > > +++ b/docs/misc/arm/device-tree/booting.txt
> > > @@ -119,3 +119,105 @@ For those you would hardcode the Xen commandline
> in
> > > the DTB under
> > >   line by writing bootargs (as for native Linux).
> > >   A Xen-aware bootloader would set xen,xen-bootargs for Xen,
> > > xen,dom0-bootargs
> > >   for Dom0 and bootargs for native Linux.
> > > +
> > > +
> > > +Creating DomUs directly from Xen
> > > +================================
> > > +
> > > +It is possible to have Xen create other domains, in addition to dom0,
> > > +out of the information provided via device tree. A Kernel and initrd
> >
> > NIT: s/Kernel/kernel/
>
> OK
>
>
> > > +(optional) need to be specified for each guest.
> > > +
> > > +For each DomU to be created there needs to be one node under /chosen
> > > +with the following properties:
> >
> > I think it would be better to make this domain agnostic. I.e allow Dom0
> to be
> > created the same way but still supporting the current bindings.
> >
> > We could differentiate Dom0 from the other with a property
> > "xen,initial-domain". Note that I am not asking to add this property in
> this
> > series. This is more a forward looking of the use of this binding.
>
> It sounds like a good idea, I'll add it.
>
>
> > > +
> > > +- compatible
> > > +
> > > +    "xen,domU"
> >
> > If we follow my suggestion, this would be renamed "xen,domain".
>
> OK
>
>
> > > +
> > > +- mem (optional)
> >
> > I would prefer the full name "memory".
>
> Yes, especially given that the corresponding xl config file option is
> called "memory".
>
>
> > > +
> > > +    A string specifying the amount of RAM to allocate to the guest. If
> > > +    not specified it defaults to "64M". The format of the string is
> the
> > > same
> > > +    as the one for the mem= parameter in xl config files.
> >
> > I don't much like default values because they are pretty arbitrary. This
> also
> > does not match the default value for Dom0. Why don't you mandate the
> property?
>
> Yes, I can do that.
>
>
> > I would also prefer if the size is specified in the same way number are
> > described in Device-Tree. I.e using cells. You could impose 2 cells for
> the
> > size here.
>
> see below
>
>
> > > +
> > > +- cpus (optional)
> > > +
> > > +    A string specifying the number of vcpus to allocate to the guest.
> If
> > > +    not specified it defaults to "1".
> >
> > Same remarks as for "mem".
>
> I think it would be nicer if we kept the same format used for xl config
> files for these two options. Especially given that we already have the
> functions in the hypervisor to parse them (Xen knows how to parse
> dom0_max_vcpus and dom0_mem for instance). It is going to be easier to
> use and it doesn't come with a cost for Xen.
>
> Edgar, what do you think?
>
>
> > > +
> > > +- #address-cells and #size-cells
> > > +
> > > +    Both #address-cells and #size-cells need to be specified because
> > > +    both sub-nodes (described shortly) have reg properties.
> > > +
> > > +Under the "xen,domU" compatible node, one or more sub-nodes are
> present
> > > +for the DomU kernel and ramdisk.
> > > +
> > > +The kernel sub-node has the following properties:
> > > +
> > > +- compatible
> > > +
> > > +    "multiboot,domU-kernel"
> >
> > I don't think we need to specify a new compatible here. We could re-use
> > "multiboot,kernel" here because the parent node will contain "xen,domU".
>
> Yes you are right
>
>
> > > +
> > > +- reg
> > > +
> > > +    Specifies the physical address of the kernel in RAM and its
> > > +    length.
> > > +
> > > +- bootargs (optional)
> > > +
> > > +    Command line parameters for the guest kernel.
> > > +
> > > +The ramdisk sub-node has the following properties:
> > > +
> > > +- compatible
> > > +
> > > +    "multiboot,domU-ramdisk"
> >
> > Same here, we could re-use "multiboot,ramdisk".
>
> OK
>
>
> > > +
> > > +- reg
> > > +
> > > +    Specifies the physical address of the ramdisk in RAM and its
> > > +    length.
> >
> > We should mention somewhere that this should be described in the /chosen
> node
> > of the device-tree.
>
> OK
>
> _______________________________________________
> Xen-devel mailing list
> Xen-devel@lists.xenproject.org
> https://lists.xenproject.org/mailman/listinfo/xen-devel

--000000000000b36b5305701502f3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hi, Sorry for the top post (I&#39;m not managing tod=
o in line reply with my phone).=C2=A0</div><div dir=3D"auto"><br></div><div=
 dir=3D"auto">Yes, in the long run it there are some benefits if the format=
 could be kept similar when possible. We could reuse some of the documentat=
ion and perhaps some of the code to parse. Allthough I&#39;m guessing that =
most of the xl parsing is not readily reusable from the hypervisor itself.<=
/div><div dir=3D"auto"><br></div><div dir=3D"auto">On the other hand, perha=
ps the xl format parser is too complex and not something we would like be r=
eused from within the hypervisor itself? Considering that one of the use ca=
ses for dom0 less is certification.</div><div dir=3D"auto"><br></div><div d=
ir=3D"auto">So an alternative if we don&#39;t try to reuse the xl format as=
 much as possible could be to create a new syntax that is as easy as possib=
le to parse.</div><div dir=3D"auto"><br></div><div dir=3D"auto">I&#39;m not=
 very convinced on what path is best at the moment.</div><div dir=3D"auto">=
<br></div><div dir=3D"auto">Regarding strings vs dtb numbers with cells, do=
n&#39;t we already have a generic dtb function that parses numbers and cons=
iders the #cells that could be reused?</div><div dir=3D"auto"><br></div><di=
v dir=3D"auto">Best regards,=C2=A0</div><div dir=3D"auto">Edgar=C2=A0<br><b=
r><div class=3D"gmail_quote" dir=3D"auto"><div dir=3D"ltr">On Tue, Jul 3, 2=
018, 06:32 Stefano Stabellini &lt;<a href=3D"mailto:sstabellini@kernel.org"=
>sstabellini@kernel.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex">On Thu, 14 Jun 2018, Julien Grall wrote:<br>
&gt; Hi Stefano,<br>
&gt; <br>
&gt; On 13/06/18 23:15, Stefano Stabellini wrote:<br>
&gt; &gt; Extend the existing device tree based multiboot protocol to inclu=
de<br>
&gt; &gt; information regarding other domUs to boot.<br>
&gt; &gt; <br>
&gt; &gt; Signed-off-by: Stefano Stabellini &lt;<a href=3D"mailto:stefanos@=
xilinx.com" target=3D"_blank" rel=3D"noreferrer">stefanos@xilinx.com</a>&gt=
;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 =C2=A0docs/misc/arm/device-tree/booting.txt | 102<br>
&gt; &gt; ++++++++++++++++++++++++++++++++++<br>
&gt; &gt;=C2=A0 =C2=A01 file changed, 102 insertions(+)<br>
&gt; &gt; <br>
&gt; &gt; diff --git a/docs/misc/arm/device-tree/booting.txt<br>
&gt; &gt; b/docs/misc/arm/device-tree/booting.txt<br>
&gt; &gt; index ce2d0dc..95255e5 100644<br>
&gt; &gt; --- a/docs/misc/arm/device-tree/booting.txt<br>
&gt; &gt; +++ b/docs/misc/arm/device-tree/booting.txt<br>
&gt; &gt; @@ -119,3 +119,105 @@ For those you would hardcode the Xen comman=
dline in<br>
&gt; &gt; the DTB under<br>
&gt; &gt;=C2=A0 =C2=A0line by writing bootargs (as for native Linux).<br>
&gt; &gt;=C2=A0 =C2=A0A Xen-aware bootloader would set xen,xen-bootargs for=
 Xen,<br>
&gt; &gt; xen,dom0-bootargs<br>
&gt; &gt;=C2=A0 =C2=A0for Dom0 and bootargs for native Linux.<br>
&gt; &gt; +<br>
&gt; &gt; +<br>
&gt; &gt; +Creating DomUs directly from Xen<br>
&gt; &gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; &gt; +<br>
&gt; &gt; +It is possible to have Xen create other domains, in addition to =
dom0,<br>
&gt; &gt; +out of the information provided via device tree. A Kernel and in=
itrd<br>
&gt; <br>
&gt; NIT: s/Kernel/kernel/<br>
<br>
OK<br>
<br>
<br>
&gt; &gt; +(optional) need to be specified for each guest.<br>
&gt; &gt; +<br>
&gt; &gt; +For each DomU to be created there needs to be one node under /ch=
osen<br>
&gt; &gt; +with the following properties:<br>
&gt; <br>
&gt; I think it would be better to make this domain agnostic. I.e allow Dom=
0 to be<br>
&gt; created the same way but still supporting the current bindings.<br>
&gt; <br>
&gt; We could differentiate Dom0 from the other with a property<br>
&gt; &quot;xen,initial-domain&quot;. Note that I am not asking to add this =
property in this<br>
&gt; series. This is more a forward looking of the use of this binding.<br>
<br>
It sounds like a good idea, I&#39;ll add it.<br>
<br>
<br>
&gt; &gt; +<br>
&gt; &gt; +- compatible<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 &quot;xen,domU&quot;<br>
&gt; <br>
&gt; If we follow my suggestion, this would be renamed &quot;xen,domain&quo=
t;.<br>
<br>
OK<br>
<br>
<br>
&gt; &gt; +<br>
&gt; &gt; +- mem (optional)<br>
&gt; <br>
&gt; I would prefer the full name &quot;memory&quot;.<br>
<br>
Yes, especially given that the corresponding xl config file option is<br>
called &quot;memory&quot;.<br>
<br>
<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 A string specifying the amount of RAM to allocate =
to the guest. If<br>
&gt; &gt; +=C2=A0 =C2=A0 not specified it defaults to &quot;64M&quot;. The =
format of the string is the<br>
&gt; &gt; same<br>
&gt; &gt; +=C2=A0 =C2=A0 as the one for the mem=3D parameter in xl config f=
iles.<br>
&gt; <br>
&gt; I don&#39;t much like default values because they are pretty arbitrary=
. This also<br>
&gt; does not match the default value for Dom0. Why don&#39;t you mandate t=
he property?<br>
<br>
Yes, I can do that.<br>
<br>
<br>
&gt; I would also prefer if the size is specified in the same way number ar=
e<br>
&gt; described in Device-Tree. I.e using cells. You could impose 2 cells fo=
r the<br>
&gt; size here.<br>
<br>
see below<br>
<br>
<br>
&gt; &gt; +<br>
&gt; &gt; +- cpus (optional)<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 A string specifying the number of vcpus to allocat=
e to the guest. If<br>
&gt; &gt; +=C2=A0 =C2=A0 not specified it defaults to &quot;1&quot;.<br>
&gt; <br>
&gt; Same remarks as for &quot;mem&quot;.<br>
<br>
I think it would be nicer if we kept the same format used for xl config<br>
files for these two options. Especially given that we already have the<br>
functions in the hypervisor to parse them (Xen knows how to parse<br>
dom0_max_vcpus and dom0_mem for instance). It is going to be easier to<br>
use and it doesn&#39;t come with a cost for Xen.<br>
<br>
Edgar, what do you think?<br><br>
<br>
&gt; &gt; +<br>
&gt; &gt; +- #address-cells and #size-cells<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 Both #address-cells and #size-cells need to be spe=
cified because<br>
&gt; &gt; +=C2=A0 =C2=A0 both sub-nodes (described shortly) have reg proper=
ties.<br>
&gt; &gt; +<br>
&gt; &gt; +Under the &quot;xen,domU&quot; compatible node, one or more sub-=
nodes are present<br>
&gt; &gt; +for the DomU kernel and ramdisk.<br>
&gt; &gt; +<br>
&gt; &gt; +The kernel sub-node has the following properties:<br>
&gt; &gt; +<br>
&gt; &gt; +- compatible<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 &quot;multiboot,domU-kernel&quot;<br>
&gt; <br>
&gt; I don&#39;t think we need to specify a new compatible here. We could r=
e-use<br>
&gt; &quot;multiboot,kernel&quot; here because the parent node will contain=
 &quot;xen,domU&quot;.<br>
<br>
Yes you are right<br>
<br>
<br>
&gt; &gt; +<br>
&gt; &gt; +- reg<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 Specifies the physical address of the kernel in RA=
M and its<br>
&gt; &gt; +=C2=A0 =C2=A0 length.<br>
&gt; &gt; +<br>
&gt; &gt; +- bootargs (optional)<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 Command line parameters for the guest kernel.<br>
&gt; &gt; +<br>
&gt; &gt; +The ramdisk sub-node has the following properties:<br>
&gt; &gt; +<br>
&gt; &gt; +- compatible<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 &quot;multiboot,domU-ramdisk&quot;<br>
&gt; <br>
&gt; Same here, we could re-use &quot;multiboot,ramdisk&quot;.<br>
<br>
OK<br>
<br>
<br>
&gt; &gt; +<br>
&gt; &gt; +- reg<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 Specifies the physical address of the ramdisk in R=
AM and its<br>
&gt; &gt; +=C2=A0 =C2=A0 length.<br>
&gt; <br>
&gt; We should mention somewhere that this should be described in the /chos=
en node<br>
&gt; of the device-tree.<br>
<br>
OK<br>
<br>
_______________________________________________<br>
Xen-devel mailing list<br>
<a href=3D"mailto:Xen-devel@lists.xenproject.org" target=3D"_blank" rel=3D"=
noreferrer">Xen-devel@lists.xenproject.org</a><br>
<a href=3D"https://lists.xenproject.org/mailman/listinfo/xen-devel" rel=3D"=
noreferrer noreferrer" target=3D"_blank">https://lists.xenproject.org/mailm=
an/listinfo/xen-devel</a></blockquote></div></div></div>

--000000000000b36b5305701502f3--


--===============7931161671759951305==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7931161671759951305==--
