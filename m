From: "LOPEZ, FUENTES NACARINO Jairo Eduardo" <jairo@ruri.waseda.jp>
Subject: Re: RT Xen on ARM - R-Car series
Date: Thu, 17 Jan 2019 11:08:56 +0900
Message-ID: <CACrvCsba0MgPgFx7YRS0vC0XsOPwLrb95UzBbDRBdRUS6jynag@mail.gmail.com>
References: <CACrvCsaeHuwzZzUQTzNYF7fqmgQWNJUVOQZv9D0MnYrXjqzZtQ@mail.gmail.com>
 <AM6PR03MB49199366C64C259BF04157D5E6B90@AM6PR03MB4919.eurprd03.prod.outlook.com>
 <CACrvCsbxLrGXzN8Y8w0ndZ2VLQ=QEtUq+KLAVRLnLYZRpiaqhg@mail.gmail.com>
 <59df6425-f6de-fda1-a1a5-7d2774ff6796@gmail.com>
 <CACrvCsaO1ZNPWNJE9vdE7Th0uMt9BJnx32p2ozwuLvEg9Tpmmw@mail.gmail.com>
 <3aecad20-41f5-4249-46be-bfef80c88ea3@gmail.com>
 <623d0b16-8616-183c-d8d4-559ad81363ed@gmail.com>
 <CACrvCsZyZhrL0eoJ6=VTwfrRPKjqapGObqaixxmGMTXS+ua3aA@mail.gmail.com>
 <CACrvCsZH1-KCrPhfBYoji14KjXEk0hkdkRD4+1AKiXeJhTMNrA@mail.gmail.com>
 <4aaa4db8-93d5-50fe-1884-ff82db35ea6b@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4766247638336004297=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <4aaa4db8-93d5-50fe-1884-ff82db35ea6b@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrii Anisov <andrii.anisov@gmail.com>
Cc: xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

--===============4766247638336004297==
Content-Type: multipart/alternative; boundary="0000000000004a4364057f9de163"

--0000000000004a4364057f9de163
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Andrii,

2019=E5=B9=B41=E6=9C=8816=E6=97=A5(=E6=B0=B4) 16:40=E3=80=81Andrii Anisov =
=E3=81=95=E3=82=93=EF=BC=88andrii.anisov@gmail.com=EF=BC=89=E3=81=AE=E3=83=
=A1=E3=83=83=E3=82=BB=E3=83=BC=E3=82=B8:

> Hello Jairo,
>
> On 08.01.19 19:04, LOPEZ, FUENTES NACARINO Jairo Eduardo wrote:
>
> > I have noticed that the uboot date has not changed from 2015.04
> It is not a u-boot date, but upstream version. Renesas derived u-boot fro=
m
> mainline version 2015.04 and put their patches on top of it.
>
> > although the build date is from the last time I ran a bitbake command.
> So it should be ok.
>
> > Are there any other modifications that I can attempt?
> I'm pretty sure you faced the issue, which is discussed here [1].
> You should merge memory nodes in your device tree, as it is done here [2]=
.
>
> Actually the proper way to sort out the root cause is to build XEN with
> debug and earlyprintk enabled. But it is quite tricky while building XEN
> using Yocto.
> You should pass build command line options for debug build and
> earlyprintk, but in Yocto command lines are buried in recipes.
>
> BTW, I've got an idea that it would be good to make debug build option as
> well as earlyprintk configurable through .config only.
>
> [1]
> https://lists.xenproject.org/archives/html/xen-devel/2017-07/msg02479.htm=
l
> [2]
> https://github.com/xen-troops/meta-demo/blob/master/meta-rcar-gen3-xen/re=
cipes-kernel/linux/linux-renesas/r8a7795-salvator-x-xen.dts#L61
>
> --
> Sincerely,
> Andrii Anisov.
>

When I sent that mail I was using the Yocto 2.23 instructions.

Since I didn't get any new information and since I had apparently been able
to safely upgrade the firmware, I attempted to up the version of everything=
.

I understand that the current yocto environment might be unfriendly to
enable debugging information but I am willing to help in implementing it if
you have an idea. There is nothing more frustrating than being met with a
completely blank output.

When using the Yocto 2.23 instructions I did not come across the issues you
pointed out, so I will take those into consideration should I need to
downgrade the versions again.

Thanks for all the help.

Best regards,

Jairo

>

--0000000000004a4364057f9de163
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Andrii,<br><br><div class=3D"gmail_quote"><div dir=
=3D"ltr">2019=E5=B9=B41=E6=9C=8816=E6=97=A5(=E6=B0=B4) 16:40=E3=80=81Andrii=
 Anisov =E3=81=95=E3=82=93=EF=BC=88<a href=3D"mailto:andrii.anisov@gmail.co=
m">andrii.anisov@gmail.com</a>=EF=BC=89=E3=81=AE=E3=83=A1=E3=83=83=E3=82=BB=
=E3=83=BC=E3=82=B8:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hello Jairo,<br=
>
<br>
On 08.01.19 19:04, LOPEZ, FUENTES NACARINO Jairo Eduardo wrote:<br>
<br>
&gt; I have noticed that the uboot date has not changed from 2015.04<br>
It is not a u-boot date, but upstream version. Renesas derived u-boot from =
mainline version 2015.04 and put their patches on top of it.<br>
<br>
&gt; although the build date is from the last time I ran a bitbake command.=
<br>
So it should be ok.<br>
<br>
&gt; Are there any other modifications that I can attempt?<br>
I&#39;m pretty sure you faced the issue, which is discussed here [1].<br>
You should merge memory nodes in your device tree, as it is done here [2].<=
br>
<br>
Actually the proper way to sort out the root cause is to build XEN with deb=
ug and earlyprintk enabled. But it is quite tricky while building XEN using=
 Yocto.<br>
You should pass build command line options for debug build and earlyprintk,=
 but in Yocto command lines are buried in recipes.<br>
<br>
BTW, I&#39;ve got an idea that it would be good to make debug build option =
as well as earlyprintk configurable through .config only.<br>
<br>
[1] <a href=3D"https://lists.xenproject.org/archives/html/xen-devel/2017-07=
/msg02479.html" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lis=
ts.xenproject.org/archives/html/xen-devel/2017-07/msg02479.html</a><br>
[2] <a href=3D"https://github.com/xen-troops/meta-demo/blob/master/meta-rca=
r-gen3-xen/recipes-kernel/linux/linux-renesas/r8a7795-salvator-x-xen.dts#L6=
1" rel=3D"noreferrer noreferrer" target=3D"_blank">https://github.com/xen-t=
roops/meta-demo/blob/master/meta-rcar-gen3-xen/recipes-kernel/linux/linux-r=
enesas/r8a7795-salvator-x-xen.dts#L61</a><br>
<br>
-- <br>
Sincerely,<br>
Andrii Anisov.<br></blockquote></div></div><div dir=3D"auto"><br></div><div=
 dir=3D"auto">When I sent that mail I was using the Yocto 2.23 instructions=
.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Since I didn&#39;t get=
 any new information and since I had apparently been able to safely upgrade=
 the firmware, I attempted to up the version of everything.</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">I understand that the current yocto e=
nvironment might be unfriendly to enable debugging information but I am wil=
ling to help in implementing it if you have an idea. There is nothing more =
frustrating than being met with a completely blank output.</div><div dir=3D=
"auto"><br></div><div dir=3D"auto">When using the Yocto 2.23 instructions I=
 did not come across the issues you pointed out, so I will take those into =
consideration should I need to downgrade the versions again.</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">Thanks for all the help.</div><div di=
r=3D"auto"><br></div><div dir=3D"auto">Best regards,</div><div dir=3D"auto"=
><br></div><div dir=3D"auto">Jairo</div><div dir=3D"auto"><div class=3D"gma=
il_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex">
</blockquote></div></div></div>

--0000000000004a4364057f9de163--


--===============4766247638336004297==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4766247638336004297==--
