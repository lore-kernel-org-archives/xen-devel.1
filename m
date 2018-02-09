From: Artem Mygaiev <Artem_Mygaiev@epam.com>
Subject: Re: Xen ARM community call Tuesday 13th February 5PM UTC
Date: Fri, 9 Feb 2018 18:01:05 +0000
Message-ID: <AM4PR03MB1729BB70DCB5F96F35FCF9BDF4F20@AM4PR03MB1729.eurprd03.prod.outlook.com>
References: <1cd12995-d888-9de8-e273-5adaf562156f@arm.com>
 <CY1PR02MB20424899229057B0DCFF38D0ABFD0@CY1PR02MB2042.namprd02.prod.outlook.com>,
 <CAKPH-Nht4CUCVVkkoCdC1GFVZr6f++gkmHOyQt4kqxL2xqmpTw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6716108074149346169=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=+64v=fd=epam.com=artem_mygaiev@srs-us1.protection.inumbo.net>)
 id 1ekCz4-0002PX-U4
 for xen-devel@lists.xenproject.org; Fri, 09 Feb 2018 18:01:15 +0000
In-Reply-To: <CAKPH-Nht4CUCVVkkoCdC1GFVZr6f++gkmHOyQt4kqxL2xqmpTw@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Edgar Iglesias <edgari@xilinx.com>, Mirela Simonovic <mirela.simonovic@aggios.com>
Cc: "davorin.mista@aggios.com" <davorin.mista@aggios.com>, Lars Kurth <lars.kurth@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, "anastassios.nanos@onapp.com" <anastassios.nanos@onapp.com>, Julien Grall <julien.grall@arm.com>, "robin.randhawa@arm.com" <robin.randhawa@arm.com>, Stewart Hildebrand <stewart.hildebrand@dornerworks.com>, xen-devel <xen-devel@lists.xenproject.org>, "vfachin@de.adit-jv.com" <vfachin@de.adit-jv.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Jarvis Roach <jarvis.roach@dornerworks.com>
List-Id: xen-devel@lists.xenproject.org

--===============6716108074149346169==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_AM4PR03MB1729BB70DCB5F96F35FCF9BDF4F20AM4PR03MB1729eurp_"

--_000_AM4PR03MB1729BB70DCB5F96F35FCF9BDF4F20AM4PR03MB1729eurp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Juilen

Time works for us.
Do you think it is worth to discuss certification & AGL stuff?

Best regards,
-- Artem Mygaiev

________________________________
From: Mirela Simonovic <mirela.simonovic@aggios.com>
Sent: Friday, February 9, 2018 7:53:28 PM
To: Edgar Iglesias
Cc: Julien Grall; Stefano Stabellini; xen-devel; Lars Kurth; Stewart Hildeb=
rand; anastassios.nanos@onapp.com; vfachin@de.adit-jv.com; Jarvis Roach; Vo=
lodymyr Babchuk; Artem Mygaiev; davorin.mista@aggios.com; robin.randhawa@ar=
m.com
Subject: Re: Xen ARM community call Tuesday 13th February 5PM UTC

Hi,

The proposed time works for me too. We would like to show you a demo, i. e.=
 Xen suspend/resume in action on Xilinx's Zynq US+ MPSoC. I would need ~10 =
minutes for that.
However, I need to screen share, so would it be possible to setup a call wi=
th the screen-sharing capability?

Thanks,
Mirela

On Tue, Feb 6, 2018 at 7:14 PM, Edgar Iglesias <edgari@xilinx.com<mailto:ed=
gari@xilinx.com>> wrote:
Hi, this time works for me.

If there's time I'd like to discuss the timing of re-submitting the Xilinx =
EEMI power-management mediator.
Also, there were some questions in the previous review. Some are straight f=
orward but some were around the configuration-less approach so I thought I =
could explain our approach and get feedback, perhaps someone has better ide=
as. I'll probably need 10 - 15min for that.

Thanks,
Edgar

> -----Original Message-----
> From: Julien Grall [mailto:julien.grall@arm.com<mailto:julien.grall@arm.c=
om>]
> Sent: 06 February 2018 2:12
> To: Stefano Stabellini <sstabellini@kernel.org<mailto:sstabellini@kernel.=
org>>; xen-devel <xen-
> devel@lists.xenproject.org<mailto:devel@lists.xenproject.org>>; Lars Kurt=
h <lars.kurth@citrix.com<mailto:lars.kurth@citrix.com>>; Edgar
> Iglesias <edgari@xilinx.com<mailto:edgari@xilinx.com>>; Stewart Hildebran=
d
> <Stewart.Hildebrand@dornerworks.com<mailto:Stewart.Hildebrand@dornerworks=
.com>>; anastassios.nanos@onapp.com<mailto:anastassios.nanos@onapp.com>;
> vfachin@de.adit-jv.com<mailto:vfachin@de.adit-jv.com>; Jarvis Roach <Jarv=
is.Roach@dornerworks.com<mailto:Jarvis.Roach@dornerworks.com>>;
> Volodymyr Babchuk <volodymyr_babchuk@epam.com<mailto:volodymyr_babchuk@ep=
am.com>>; Artem Mygaiev
> <Artem_Mygaiev@epam.com<mailto:Artem_Mygaiev@epam.com>>; mirela.simonovic=
@aggios.com<mailto:mirela.simonovic@aggios.com>;
> davorin.mista@aggios.com<mailto:davorin.mista@aggios.com>; robin.randhawa=
@arm.com<mailto:robin.randhawa@arm.com>
> Subject: Xen ARM community call Tuesday 13th February 5PM UTC
>
> Hi all,
>
> I would suggest to have the next community call on Tuesday 13th February
> 5pm GMT. Does it sound good?
>
> Do you have any specific topic you would like to discuss?
>
> Cheers,
>
> --
> Julien Grall


--_000_AM4PR03MB1729BB70DCB5F96F35FCF9BDF4F20AM4PR03MB1729eurp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta content=3D"text/html; charset=3Dutf-8">
</head>
<body>
<div dir=3D"auto" style=3D"direction:ltr; margin:0; padding:0; font-family:=
sans-serif; font-size:11pt; color:black">
Hi Juilen<br>
<br>
</div>
<div dir=3D"auto" style=3D"direction:ltr; margin:0; padding:0; font-family:=
sans-serif; font-size:11pt; color:black">
Time works for us.<br>
</div>
<div dir=3D"auto" style=3D"direction:ltr; margin:0; padding:0; font-family:=
sans-serif; font-size:11pt; color:black">
Do you think it is worth to discuss certification &amp; AGL stuff?<br>
<br>
</div>
<div dir=3D"auto" style=3D"direction:ltr; margin:0; padding:0; font-family:=
sans-serif; font-size:11pt; color:black">
<div dir=3D"auto" style=3D"direction:ltr; margin:0; padding:0; font-family:=
sans-serif; font-size:11pt; color:black">
Best regards,<br>
</div>
<div dir=3D"auto" style=3D"direction:ltr; margin:0; padding:0; font-family:=
sans-serif; font-size:11pt; color:black">
-- Artem Mygaiev</div>
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" co=
lor=3D"#000000" style=3D"font-size:11pt"><b>From:</b> Mirela Simonovic &lt;=
mirela.simonovic@aggios.com&gt;<br>
<b>Sent:</b> Friday, February 9, 2018 7:53:28 PM<br>
<b>To:</b> Edgar Iglesias<br>
<b>Cc:</b> Julien Grall; Stefano Stabellini; xen-devel; Lars Kurth; Stewart=
 Hildebrand; anastassios.nanos@onapp.com; vfachin@de.adit-jv.com; Jarvis Ro=
ach; Volodymyr Babchuk; Artem Mygaiev; davorin.mista@aggios.com; robin.rand=
hawa@arm.com<br>
<b>Subject:</b> Re: Xen ARM community call Tuesday 13th February 5PM UTC</f=
ont>
<div>&nbsp;</div>
</div>
<div>
<div dir=3D"ltr">Hi,
<div><br>
</div>
<div>The proposed time works for me too. We would like to show you a demo, =
i. e. Xen suspend/resume in action on Xilinx's Zynq US&#43; MPSoC. I would =
need ~10 minutes for that.</div>
<div>However, I need to screen share, so would it be possible to setup a ca=
ll with the screen-sharing capability?</div>
<div><br>
</div>
<div>Thanks,</div>
<div>Mirela</div>
</div>
<div class=3D"gmail_extra"><br>
<div class=3D"gmail_quote">On Tue, Feb 6, 2018 at 7:14 PM, Edgar Iglesias <=
span dir=3D"ltr">
&lt;<a href=3D"mailto:edgari@xilinx.com" target=3D"_blank">edgari@xilinx.co=
m</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex; border-left:1=
px #ccc solid; padding-left:1ex">
Hi, this time works for me.<br>
<br>
If there's time I'd like to discuss the timing of re-submitting the Xilinx =
EEMI power-management mediator.<br>
Also, there were some questions in the previous review. Some are straight f=
orward but some were around the configuration-less approach so I thought I =
could explain our approach and get feedback, perhaps someone has better ide=
as. I'll probably need 10 - 15min
 for that.<br>
<br>
Thanks,<br>
Edgar<br>
<br>
&gt; -----Original Message-----<br>
&gt; From: Julien Grall [mailto:<a href=3D"mailto:julien.grall@arm.com">jul=
ien.grall@arm.com</a>]<br>
&gt; Sent: 06 February 2018 2:12<br>
&gt; To: Stefano Stabellini &lt;<a href=3D"mailto:sstabellini@kernel.org">s=
stabellini@kernel.org</a>&gt;; xen-devel &lt;xen-<br>
&gt; <a href=3D"mailto:devel@lists.xenproject.org">devel@lists.xenproject.o=
rg</a>&gt;; Lars Kurth &lt;<a href=3D"mailto:lars.kurth@citrix.com">lars.ku=
rth@citrix.com</a>&gt;; Edgar<br>
&gt; Iglesias &lt;<a href=3D"mailto:edgari@xilinx.com">edgari@xilinx.com</a=
>&gt;; Stewart Hildebrand<br>
&gt; &lt;<a href=3D"mailto:Stewart.Hildebrand@dornerworks.com">Stewart.Hild=
ebrand@<wbr>dornerworks.com</a>&gt;;
<a href=3D"mailto:anastassios.nanos@onapp.com">anastassios.nanos@onapp.com<=
/a>;<br>
&gt; <a href=3D"mailto:vfachin@de.adit-jv.com">vfachin@de.adit-jv.com</a>; =
Jarvis Roach &lt;<a href=3D"mailto:Jarvis.Roach@dornerworks.com">Jarvis.Roa=
ch@dornerworks.com</a>&gt;<wbr>;<br>
&gt; Volodymyr Babchuk &lt;<a href=3D"mailto:volodymyr_babchuk@epam.com">vo=
lodymyr_babchuk@epam.com</a>&gt;; Artem Mygaiev<br>
&gt; &lt;<a href=3D"mailto:Artem_Mygaiev@epam.com">Artem_Mygaiev@epam.com</=
a>&gt;; <a href=3D"mailto:mirela.simonovic@aggios.com">
mirela.simonovic@aggios.com</a>;<br>
&gt; <a href=3D"mailto:davorin.mista@aggios.com">davorin.mista@aggios.com</=
a>; <a href=3D"mailto:robin.randhawa@arm.com">
robin.randhawa@arm.com</a><br>
&gt; Subject: Xen ARM community call Tuesday 13th February 5PM UTC<br>
<div class=3D"HOEnZb">
<div class=3D"h5">&gt;<br>
&gt; Hi all,<br>
&gt;<br>
&gt; I would suggest to have the next community call on Tuesday 13th Februa=
ry<br>
&gt; 5pm GMT. Does it sound good?<br>
&gt;<br>
&gt; Do you have any specific topic you would like to discuss?<br>
&gt;<br>
&gt; Cheers,<br>
&gt;<br>
&gt; --<br>
&gt; Julien Grall<br>
</div>
</div>
</blockquote>
</div>
<br>
</div>
</div>
</body>
</html>

--_000_AM4PR03MB1729BB70DCB5F96F35FCF9BDF4F20AM4PR03MB1729eurp_--


--===============6716108074149346169==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6716108074149346169==--
