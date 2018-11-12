From: Ravi Pichholiya <pichholiyaravi@gmail.com>
Subject: Re: Porting XEN hypervisor on iMX8QM
Date: Mon, 12 Nov 2018 11:32:59 +0530
Message-ID: <CAAxnE7v8scLcTMPGG+yDOA9amwACRFCqT7nNBmgn47Wq724s=w@mail.gmail.com>
References: <CAAxnE7vgDxcekeE04z_Ps7mJ9EX6W9a=U+r765GKStuZNonBMw@mail.gmail.com>
 <alpine.DEB.2.10.1811061053370.18518@sstabellini-ThinkPad-X260>
 <469ba780-e86a-6db6-e772-e31f025122f4@arm.com>
 <AM0PR04MB4481EA57FDD36F1F11E89BB688C40@AM0PR04MB4481.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2277125022524422884=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <AM0PR04MB4481EA57FDD36F1F11E89BB688C40@AM0PR04MB4481.eurprd04.prod.outlook.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: peng.fan@nxp.com
Cc: julien.grall@arm.com, sstabellini@kernel.org, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

--===============2277125022524422884==
Content-Type: multipart/alternative; boundary="000000000000af5a72057a717495"

--000000000000af5a72057a717495
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi All,

Many thanks for your response. We will go through all provided information
and try to put step forward for porting XEN.



Thanks & Regards,
Ravi Pichholiya

On Wed, Nov 7, 2018 at 6:54 AM Peng Fan <peng.fan@nxp.com> wrote:

> Hi Ravi,
>
> You could find code here
> https://source.codeaurora.org/external/imx/imx-xen/
>
> The latest public branch should be
> https://source.codeaurora.org/external/imx/imx-xen/log/?h=3Dimx_4.14.62_1=
.0.0_beta
> but this has not gone through test, you could take as reference. We have
> some new code still not public now.
>
> Regards,
> Peng.
> > -----Original Message-----
> > From: Julien Grall [mailto:julien.grall@arm.com]
> > Sent: 2018=E5=B9=B411=E6=9C=887=E6=97=A5 3:06
> > To: Stefano Stabellini <sstabellini@kernel.org>; Ravi Pichholiya
> > <pichholiyaravi@gmail.com>
> > Cc: xen-devel@lists.xen.org; Peng Fan <peng.fan@nxp.com>
> > Subject: Re: Porting XEN hypervisor on iMX8QM
> >
> > Hi,
> >
> > I am CCing Peng Fan who is working for NXP and also on Xen. Peng, do yo=
u
> have
> > any pointer to getting Xen running on iMX8QM?
> >
> > Cheers,
> >
> > On 06/11/2018 18:59, Stefano Stabellini wrote:
> > > Hi Ravi,
> > >
> > > Please have a look at our wiki as a reference:
> > > https://emea01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fw=
iki
> > > .xenproject.org%2Fwiki%2FXen_ARM_with_Virtualization_Extensions&amp;d
> > a
> > >
> > ta=3D02%7C01%7Cpeng.fan%40nxp.com%7C29f2e7554eeb4239e2be08d6441ae9
> > e7%7C6
> > >
> > 86ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C636771279731653739&am
> > p;sdata
> > >
> > =3DFLKtTp%2FaAk6B7Suv0vUttF04z%2BLo1Gw%2FmaI5p9RV%2BZE%3D&amp;re
> > served=3D0
> > >
> > > I would start from cross-compiling the Xen hypervisor (the xen/
> > > directory), no need to build the Xen userspace tools initially.
> > > Make sure to have the right early boot uart driver, see
> > > CONFIG_EARLY_PRINTK and docs/misc/arm/early-printk.txt.
> > >
> > > After you boot the Xen binary from uboot, you should be able to see
> > > some console output from the hypervisror. The step after that is
> > > booting Dom0.
> > >
> > > Cheers,
> > >
> > > Stefano
> > >
> > > On Mon, 5 Nov 2018, Ravi Pichholiya wrote:
> > >> Hi Stefano,
> > >> This is in reference to our LinkedIn discussion, in our one of the
> project we
> > need to port XEN hypervisor on iMx8QM.
> > >>
> > >> Request you to share what all visibility we should require from boot
> > >> prospective as currently we are having access to Device tree and
> U-boot
> > source code only. Is access to any other files are also required?
> > >>
> > >> Also some reference to start with the porting of XEN if available
> with you.
> > >>
> > >> Thanks & Regards,
> > >> Ravi Pichholiya
> > >>
> >
> > --
> > Julien Grall
>

--000000000000af5a72057a717495
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi All,</div><div><br></div><div>Many thanks for your=
 response. We will go through all provided information and try to put step =
forward for porting XEN.</div><div><br></div><div><br></div><div><br></div>=
<div>Thanks &amp; Regards,</div><div>Ravi Pichholiya<br></div></div><br><di=
v class=3D"gmail_quote"><div dir=3D"ltr">On Wed, Nov 7, 2018 at 6:54 AM Pen=
g Fan &lt;<a href=3D"mailto:peng.fan@nxp.com">peng.fan@nxp.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">Hi Ravi,<br>
<br>
You could find code here<br>
<a href=3D"https://source.codeaurora.org/external/imx/imx-xen/" rel=3D"nore=
ferrer" target=3D"_blank">https://source.codeaurora.org/external/imx/imx-xe=
n/</a><br>
<br>
The latest public branch should be <a href=3D"https://source.codeaurora.org=
/external/imx/imx-xen/log/?h=3Dimx_4.14.62_1.0.0_beta" rel=3D"noreferrer" t=
arget=3D"_blank">https://source.codeaurora.org/external/imx/imx-xen/log/?h=
=3Dimx_4.14.62_1.0.0_beta</a> but this has not gone through test, you could=
 take as reference. We have some new code still not public now. <br>
<br>
Regards,<br>
Peng.<br>
&gt; -----Original Message-----<br>
&gt; From: Julien Grall [mailto:<a href=3D"mailto:julien.grall@arm.com" tar=
get=3D"_blank">julien.grall@arm.com</a>]<br>
&gt; Sent: 2018=E5=B9=B411=E6=9C=887=E6=97=A5 3:06<br>
&gt; To: Stefano Stabellini &lt;<a href=3D"mailto:sstabellini@kernel.org" t=
arget=3D"_blank">sstabellini@kernel.org</a>&gt;; Ravi Pichholiya<br>
&gt; &lt;<a href=3D"mailto:pichholiyaravi@gmail.com" target=3D"_blank">pich=
holiyaravi@gmail.com</a>&gt;<br>
&gt; Cc: <a href=3D"mailto:xen-devel@lists.xen.org" target=3D"_blank">xen-d=
evel@lists.xen.org</a>; Peng Fan &lt;<a href=3D"mailto:peng.fan@nxp.com" ta=
rget=3D"_blank">peng.fan@nxp.com</a>&gt;<br>
&gt; Subject: Re: Porting XEN hypervisor on iMX8QM<br>
&gt; <br>
&gt; Hi,<br>
&gt; <br>
&gt; I am CCing Peng Fan who is working for NXP and also on Xen. Peng, do y=
ou have<br>
&gt; any pointer to getting Xen running on iMX8QM?<br>
&gt; <br>
&gt; Cheers,<br>
&gt; <br>
&gt; On 06/11/2018 18:59, Stefano Stabellini wrote:<br>
&gt; &gt; Hi Ravi,<br>
&gt; &gt;<br>
&gt; &gt; Please have a look at our wiki as a reference:<br>
&gt; &gt; <a href=3D"https://emea01.safelinks.protection.outlook.com/?url=
=3Dhttp%3A%2F%2Fwiki" rel=3D"noreferrer" target=3D"_blank">https://emea01.s=
afelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fwiki</a><br>
&gt; &gt; .<a href=3D"http://xenproject.org" rel=3D"noreferrer" target=3D"_=
blank">xenproject.org</a>%2Fwiki%2FXen_ARM_with_Virtualization_Extensions&a=
mp;amp;d<br>
&gt; a<br>
&gt; &gt;<br>
&gt; ta=3D02%7C01%7Cpeng.fan%<a href=3D"http://40nxp.com" rel=3D"noreferrer=
" target=3D"_blank">40nxp.com</a>%7C29f2e7554eeb4239e2be08d6441ae9<br>
&gt; e7%7C6<br>
&gt; &gt;<br>
&gt; 86ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C636771279731653739&amp;am<br=
>
&gt; p;sdata<br>
&gt; &gt;<br>
&gt; =3DFLKtTp%2FaAk6B7Suv0vUttF04z%2BLo1Gw%2FmaI5p9RV%2BZE%3D&amp;amp;re<b=
r>
&gt; served=3D0<br>
&gt; &gt;<br>
&gt; &gt; I would start from cross-compiling the Xen hypervisor (the xen/<b=
r>
&gt; &gt; directory), no need to build the Xen userspace tools initially.<b=
r>
&gt; &gt; Make sure to have the right early boot uart driver, see<br>
&gt; &gt; CONFIG_EARLY_PRINTK and docs/misc/arm/early-printk.txt.<br>
&gt; &gt;<br>
&gt; &gt; After you boot the Xen binary from uboot, you should be able to s=
ee<br>
&gt; &gt; some console output from the hypervisror. The step after that is<=
br>
&gt; &gt; booting Dom0.<br>
&gt; &gt;<br>
&gt; &gt; Cheers,<br>
&gt; &gt;<br>
&gt; &gt; Stefano<br>
&gt; &gt;<br>
&gt; &gt; On Mon, 5 Nov 2018, Ravi Pichholiya wrote:<br>
&gt; &gt;&gt; Hi Stefano,<br>
&gt; &gt;&gt; This is in reference to our LinkedIn discussion, in our one o=
f the project we<br>
&gt; need to port XEN hypervisor on iMx8QM.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Request you to share what all visibility we should require fr=
om boot<br>
&gt; &gt;&gt; prospective as currently we are having access to Device tree =
and U-boot<br>
&gt; source code only. Is access to any other files are also required?<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Also some reference to start with the porting of XEN if avail=
able with you.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Thanks &amp;=C2=A0Regards,<br>
&gt; &gt;&gt; Ravi Pichholiya<br>
&gt; &gt;&gt;<br>
&gt; <br>
&gt; --<br>
&gt; Julien Grall<br>
</blockquote></div>

--000000000000af5a72057a717495--


--===============2277125022524422884==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2277125022524422884==--
