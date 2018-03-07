From: "Volo M." <vm@vovs.net>
Subject: Re: Xen Virtio Drivers
Date: Wed, 7 Mar 2018 17:32:35 +0200
Message-ID: <CAFU1X6xt5Q3d+BJS75O6b5SS8YWBT5yrPJJK1t=5KpbMh74JcA@mail.gmail.com>
References: <CAFU1X6ww54Ohq4L837sQzNz=Q9w=RBx3Ma4R6rjin=8YRgTdDQ@mail.gmail.com>
 <20180307150803.GE19405@char.us.oracle.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4475848553870342100=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=+etp=f5=vovs.net=vm@srs-us1.protection.inumbo.net>)
 id 1etb3W-00073d-5p
 for xen-devel@lists.xenproject.org; Wed, 07 Mar 2018 15:32:38 +0000
Received: by mail-oi0-x230.google.com with SMTP id e9so1961322oii.0
 for <xen-devel@lists.xenproject.org>; Wed, 07 Mar 2018 07:32:36 -0800 (PST)
In-Reply-To: <20180307150803.GE19405@char.us.oracle.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

--===============4475848553870342100==
Content-Type: multipart/alternative; boundary="f4f5e808bf98bdade50566d444dd"

--f4f5e808bf98bdade50566d444dd
Content-Type: text/plain; charset="UTF-8"

Thanks,

Cool, I'll have to check how to tweak xen build.

Will I have to change below disk lines of XL toolkit VM config somehow to
enable using Virtio drives emulation
 or custom xen build just enable it by those kvm-enabled tweak for all HVM
guests within hypervisor?

vif = [ "model=virtio-net, mac=00:16:3e:11:77:f0, bridge=officevswitch1,
ip=10.91.0.224, vifname=cxqastfflivgrl" ]
disk = [
"format=raw,vdev=hda,access=rw,backendtype=phy,target=/dev/iscsistore02/disk1237"
]
disk = [ "phy:/dev/iscsistore02/disk1238,ioemu:hda,w" ]


On Wed, Mar 7, 2018 at 5:08 PM, Konrad Rzeszutek Wilk <
konrad.wilk@oracle.com> wrote:

> On Wed, Mar 07, 2018 at 04:13:47PM +0200, Volo M. wrote:
> > Hi Devs,
> >
> > Could you please help me to identify right way to start using Virtio
> > drivers for Xen guests
> > as described here https://wiki.xen.org/wiki/QEMU_Upstream .
> > I've managed to start my Windows 2008 VM with Virtio network drivers by
> > using 'model='virtio-net'' option as described above and it works fine
> (but
> > only for network interfaces).
> >
> > The problem is I still can't identify how to make Xen using virtio-blk or
> > virtio-scsi backend for 'qemu-xen' qemu-model as mentioned here
> > https://en.wikibooks.org/wiki/QEMU/Devices/Virtio which should be
> > compatible with 'qemu-xen' qemu upstream model.
> >
> > I can't see any mention about virtio disk types in docs:
> > https://xenbits.xen.org/docs/4.8-testing/misc/xl-disk-configuration.txt
>  .
> > Also I've done very common check through Xen source code
> ('*/tools/libxl/*'
> > area) while looking how to apply virtio disk drivers for our Xen guests.
> >
> > Can you please clarify if it's been ever implemented. Do you have any ETA
> > when it's going to be implemented...etc? Or probably you could give me
> any
> > advice how to make it working?
>
> IT all works with HVM guests. You do have to tweak the Xen build of qemu
> to build with KVM enabled (oddly enough the Virtio drivers depend on that
> right now).
>
> >
> > Thanks a lot in advance.
>
> > _______________________________________________
> > Xen-devel mailing list
> > Xen-devel@lists.xenproject.org
> > https://lists.xenproject.org/mailman/listinfo/xen-devel
>
>

--f4f5e808bf98bdade50566d444dd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks,<div><br></div><div>Cool, I&#39;ll have to check ho=
w to tweak xen build.</div><div><br></div><div>Will I have to change below =
disk lines of XL toolkit VM config somehow to enable using Virtio drives em=
ulation</div><div>=C2=A0or custom xen build just enable it by those kvm-ena=
bled tweak for all HVM guests within hypervisor?</div><div><br></div><div><=
span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:sm=
all;font-style:normal;font-variant-ligatures:normal;font-variant-caps:norma=
l;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;te=
xt-transform:none;white-space:normal;word-spacing:0px;background-color:rgb(=
255,255,255);text-decoration-style:initial;text-decoration-color:initial;fl=
oat:none;display:inline">vif =3D [ &quot;model=3Dvirtio-net, mac=3D00:16:3e=
:11:77:f0, bridge=3Dofficevswitch1, ip=3D10.91.0.224, vifname=3Dcxqastffliv=
grl&quot; ]</span><br></div><div>disk =3D [ &quot;format=3Draw,vdev=3Dhda,a=
ccess=3Drw,backendtype=3Dphy,target=3D/dev/iscsistore02/disk1237&quot; ]</d=
iv><div><div>disk =3D [ &quot;phy:/dev/iscsistore02/disk1238,ioemu:hda,w&qu=
ot; ]</div></div><div><br></div></div><div class=3D"gmail_extra"><br><div c=
lass=3D"gmail_quote">On Wed, Mar 7, 2018 at 5:08 PM, Konrad Rzeszutek Wilk =
<span dir=3D"ltr">&lt;<a href=3D"mailto:konrad.wilk@oracle.com" target=3D"_=
blank">konrad.wilk@oracle.com</a>&gt;</span> wrote:<br><blockquote class=3D=
"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding=
-left:1ex"><span class=3D"">On Wed, Mar 07, 2018 at 04:13:47PM +0200, Volo =
M. wrote:<br>
&gt; Hi Devs,<br>
&gt;<br>
&gt; Could you please help me to identify right way to start using Virtio<b=
r>
&gt; drivers for Xen guests<br>
&gt; as described here <a href=3D"https://wiki.xen.org/wiki/QEMU_Upstream" =
rel=3D"noreferrer" target=3D"_blank">https://wiki.xen.org/wiki/<wbr>QEMU_Up=
stream</a> .<br>
&gt; I&#39;ve managed to start my Windows 2008 VM with Virtio network drive=
rs by<br>
&gt; using &#39;model=3D&#39;virtio-net&#39;&#39; option as described above=
 and it works fine (but<br>
&gt; only for network interfaces).<br>
&gt;<br>
&gt; The problem is I still can&#39;t identify how to make Xen using virtio=
-blk or<br>
&gt; virtio-scsi backend for &#39;qemu-xen&#39; qemu-model as mentioned her=
e<br>
&gt; <a href=3D"https://en.wikibooks.org/wiki/QEMU/Devices/Virtio" rel=3D"n=
oreferrer" target=3D"_blank">https://en.wikibooks.org/wiki/<wbr>QEMU/Device=
s/Virtio</a> which should be<br>
&gt; compatible with &#39;qemu-xen&#39; qemu upstream model.<br>
&gt;<br>
&gt; I can&#39;t see any mention about virtio disk types in docs:<br>
&gt; <a href=3D"https://xenbits.xen.org/docs/4.8-testing/misc/xl-disk-confi=
guration.txt" rel=3D"noreferrer" target=3D"_blank">https://xenbits.xen.org/=
docs/<wbr>4.8-testing/misc/xl-disk-<wbr>configuration.txt</a>=C2=A0 =C2=A0.=
<br>
&gt; Also I&#39;ve done very common check through Xen source code (&#39;*/t=
ools/libxl/*&#39;<br>
&gt; area) while looking how to apply virtio disk drivers for our Xen guest=
s.<br>
&gt;<br>
&gt; Can you please clarify if it&#39;s been ever implemented. Do you have =
any ETA<br>
&gt; when it&#39;s going to be implemented...etc? Or probably you could giv=
e me any<br>
&gt; advice how to make it working?<br>
<br>
</span>IT all works with HVM guests. You do have to tweak the Xen build of =
qemu<br>
to build with KVM enabled (oddly enough the Virtio drivers depend on that<b=
r>
right now).<br>
<span class=3D""><br>
&gt;<br>
&gt; Thanks a lot in advance.<br>
<br>
</span>&gt; ______________________________<wbr>_________________<br>
&gt; Xen-devel mailing list<br>
&gt; <a href=3D"mailto:Xen-devel@lists.xenproject.org">Xen-devel@lists.xenp=
roject.org</a><br>
&gt; <a href=3D"https://lists.xenproject.org/mailman/listinfo/xen-devel" re=
l=3D"noreferrer" target=3D"_blank">https://lists.xenproject.org/<wbr>mailma=
n/listinfo/xen-devel</a><br>
<br>
</blockquote></div><br></div>

--f4f5e808bf98bdade50566d444dd--


--===============4475848553870342100==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4475848553870342100==--
