From: Julien Grall <julien.grall@gmail.com>
Subject: Re: Xen optimization
Date: Mon, 10 Dec 2018 12:54:49 +0100
Message-ID: <CAF3u54BcT=-wnGKaDY1c3AvaDrV7eiiiedjaqbsavsQ4YaDWug@mail.gmail.com>
References: <CADJ6SV1__ZWDhGWoW7u=W54zG1STSnchkg0enyQoPyEB9YGXPg@mail.gmail.com>
 <CADJ6SV2891kOd_Ga8jjXdtKdjPAoWtADhizuS+kjSZNNOPMK+w@mail.gmail.com>
 <alpine.DEB.2.10.1810221037270.31582@sstabellini-ThinkPad-X260>
 <CADJ6SV0gUvRv_4Kp=Vz5n4WSQ3kgQrC=+gPz1QjrBzdFOoJwPA@mail.gmail.com>
 <alpine.DEB.2.10.1810231005040.31582@sstabellini-ThinkPad-X260>
 <d5769cb9-9d87-3db4-e23d-414242692a89@arm.com>
 <alpine.DEB.2.10.1810250915030.25937@sstabellini-ThinkPad-X260>
 <94c08d07-b028-8eb1-7e94-21a416cd8007@arm.com>
 <alpine.DEB.2.10.1810261340530.32521@sstabellini-ThinkPad-X260>
 <CADJ6SV174NdceJ4kWCWYJ-UaNp1AAisb28V5tgKz14N+-pBVEg@mail.gmail.com>
 <67f6ece7-0a26-e29c-b20b-acf83a01f6eb@arm.com>
 <CADJ6SV22eAxR0s0ocpGNRRefo+FmsMz9KsEeXw+cME1sSM-ssg@mail.gmail.com>
 <a5eab71a-f301-67ae-cc22-8cf10715fdcd@arm.com>
 <alpine.DEB.2.10.1811011320050.7220@sstabellini-ThinkPad-X260>
 <35b44b61-9d2d-60d0-97ee-5b8c00e8be6d@gmail.com>
 <alpine.DEB.2.10.1811271320170.4577@sstabellini-ThinkPad-X260>
 <bb88ca15-381c-014c-2f6c-e5de33b4b15a@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6914374047596334542=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Y+im=OT=gmail.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1gWK9R-0000pg-Bz
 for xen-devel@lists.xenproject.org; Mon, 10 Dec 2018 11:55:05 +0000
Received: by mail-vs1-xe31.google.com with SMTP id x1so6414805vsc.10
 for <xen-devel@lists.xenproject.org>; Mon, 10 Dec 2018 03:55:04 -0800 (PST)
In-Reply-To: <bb88ca15-381c-014c-2f6c-e5de33b4b15a@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrii Anisov <andrii.anisov@gmail.com>
Cc: nd@arm.com, Stefano Stabellini <sstabellini@kernel.org>, andrii_anisov@epam.com, Milan Boberic <milanboberic94@gmail.com>, Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>, Meng Xu <xumengpanda@gmail.com>, xen-devel@lists.xenproject.org, Stefano Stabellini <stefano.stabellini@xilinx.com>
List-Id: xen-devel@lists.xenproject.org

--===============6914374047596334542==
Content-Type: multipart/alternative; boundary="000000000000a6eaf1057ca9a272"

--000000000000a6eaf1057ca9a272
Content-Type: text/plain; charset="UTF-8"

(sorry for the formatting)

On Mon, 10 Dec 2018, 12:00 Andrii Anisov, <andrii.anisov@gmail.com> wrote:

> Hello All,
>
> On 27.11.18 23:27, Stefano Stabellini wrote:
> > See the following:
> >
> > https://marc.info/?l=xen-devel&m=148668817704668
> So I did port that stuff to the current staging [1].
> Also, the correspondent tbm, itself is here [2].
> Having 4 big cores on my SoC I run XEN with the following command line:
>
>      dom0_mem=3G console=dtuart dtuart=serial0 dom0_max_vcpus=2
> bootscrub=0 loglvl=all cpufreq=none tbuf_size=8192 loglvl=all/none
> guest_loglvl=all/none
>
> The TBM's domain configuration file is as following:
>
>      seclabel='system_u:system_r:domU_t'
>      name = "DomP"
>      kernel = "/home/root/ctest-bare.bin"
>      extra = "console=hvc0 rw"
>      memory = 128
>      vcpus = 1
>      cpus = "3"
>
> This gives me setup where Domain-0 runs on cores 0 and 1 solely and TBM
> runs exclusively on core 3. So that we can rely that it shows us a pure IRQ
> latency of hypervisor.
> My board is Renesas Salvator-X with H3 ES3.0 SoC and 8GB RAM. Generic
> timer runs at 8.333 MHz freq, what gives my 120ns resolution for
> measurements.
> XEN hypervisor is build without debug and TBM does wfi in the idle loop
> for all experiments.
> With that setup IRQ latency numbers are (in ns):
>

What are the numbers without Xen? Which version of Xen are you using?



> Old vgic:
>                          AVG     MIN     MAX     WARM MAX
> credit, vwfi=trap       7706    7560    9480    8400
> credit, vwfi=native     2908    2880    3120    4800
> credit2, vwfi=trap      7221    7200    9240    7440
> credit2, vwfi=native    2906    2880    3120    5040
>
> New vgic:
>                          AVG     MIN     MAX     WARM MAX
> credit, vwfi=trap       8481    8040    10200   8880
> credit, vwfi=native     4115    3960    4800    4200
> credit2, vwfi=trap      8425    8400    9600    9000
> credit2, vwfi=native    4227    3960    5040    4680
>
> Here we can see that the new vgic underperforms the old one in a trivial
> use-case modeled with TBM.
>

The vwfi=trap does not look so bad (10%) but indeed the vwfi=native adds a
bigger overhead.
This also tells you that in the trap case the vGIC is not the bigger
overhead.

I am pretty sure that this can be optimized because we mostly focused on
reliability and specification compliance for the first draft.

So yes the old vGIC performs better but at the price of unreliability and
non-compliance.


> Old vgic with optimizations [3] (without [4], because it breaks the setup):
>                          AVG     MIN     MAX     WARM MAX
> credit, vwfi=trap       7309    7080    8760    7680
> credit, vwfi=native     3007    3000    4320    3120
> credit2, vwfi=trap      6877    6720    8880    7200
> credit2, vwfi=native    2680    2640    4440    2880
>

This is with all your series applied but [4], correct? Did you try to see
the perfomance improvement patch by patch?

Cheers



>
>
> [1] https://github.com/aanisov/xen/tree/4tbm
> [2] https://github.com/aanisov/tbm/commits/4xen
> [3]
> https://lists.xenproject.org/archives/html/xen-devel/2018-11/msg03328.html
> [4]
> https://lists.xenproject.org/archives/html/xen-devel/2018-11/msg03288.html
>
> --
> Sincerely,
> Andrii Anisov.
>
> _______________________________________________
> Xen-devel mailing list
> Xen-devel@lists.xenproject.org
> https://lists.xenproject.org/mailman/listinfo/xen-devel

--000000000000a6eaf1057ca9a272
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<span>(sorry for the formatting)</span><br><br><div class=3D"gmail_quote"><=
div dir=3D"ltr">On Mon, 10 Dec 2018, 12:00 Andrii Anisov, &lt;<a href=3D"ma=
ilto:andrii.anisov@gmail.com">andrii.anisov@gmail.com</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex">Hello All,<br>
<br>
On 27.11.18 23:27, Stefano Stabellini wrote:<br>
&gt; See the following:<br>
&gt; <br>
&gt; <a href=3D"https://marc.info/?l=3Dxen-devel&amp;m=3D148668817704668" r=
el=3D"noreferrer" target=3D"_blank">https://marc.info/?l=3Dxen-devel&amp;m=
=3D148668817704668</a><br>
So I did port that stuff to the current staging [1].<br>
Also, the correspondent tbm, itself is here [2].<br>
Having 4 big cores on my SoC I run XEN with the following command line:<br>
<br>
=C2=A0 =C2=A0 =C2=A0dom0_mem=3D3G console=3Ddtuart dtuart=3Dserial0 dom0_ma=
x_vcpus=3D2 bootscrub=3D0 loglvl=3Dall cpufreq=3Dnone tbuf_size=3D8192 logl=
vl=3Dall/none guest_loglvl=3Dall/none<br>
<br>
The TBM&#39;s domain configuration file is as following:<br>
<br>
=C2=A0 =C2=A0 =C2=A0seclabel=3D&#39;system_u:system_r:domU_t&#39;<br>
=C2=A0 =C2=A0 =C2=A0name =3D &quot;DomP&quot;<br>
=C2=A0 =C2=A0 =C2=A0kernel =3D &quot;/home/root/ctest-bare.bin&quot;<br>
=C2=A0 =C2=A0 =C2=A0extra =3D &quot;console=3Dhvc0 rw&quot;<br>
=C2=A0 =C2=A0 =C2=A0memory =3D 128<br>
=C2=A0 =C2=A0 =C2=A0vcpus =3D 1<br>
=C2=A0 =C2=A0 =C2=A0cpus =3D &quot;3&quot;<br>
<br>
This gives me setup where Domain-0 runs on cores 0 and 1 solely and TBM run=
s exclusively on core 3. So that we can rely that it shows us a pure IRQ la=
tency of hypervisor.<br>
My board is Renesas Salvator-X with H3 ES3.0 SoC and 8GB RAM. Generic timer=
 runs at 8.333 MHz freq, what gives my 120ns resolution for measurements.<b=
r>
XEN hypervisor is build without debug and TBM does wfi in the idle loop for=
 all experiments.<br>
With that setup IRQ latency numbers are (in ns):<br></blockquote></div><div=
><br></div><div>What are the numbers without Xen? Which version of Xen are =
you using?</div><div><br></div><div><br></div><div class=3D"gmail_quote"><b=
lockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px =
#ccc solid;padding-left:1ex">
<br>
Old vgic:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0AVG=C2=A0 =C2=A0 =C2=A0MIN=C2=A0 =C2=A0 =C2=A0MAX=C2=A0 =
=C2=A0 =C2=A0WARM MAX<br>
credit, vwfi=3Dtrap=C2=A0 =C2=A0 =C2=A0 =C2=A07706=C2=A0 =C2=A0 7560=C2=A0 =
=C2=A0 9480=C2=A0 =C2=A0 8400<br>
credit, vwfi=3Dnative=C2=A0 =C2=A0 =C2=A02908=C2=A0 =C2=A0 2880=C2=A0 =C2=
=A0 3120=C2=A0 =C2=A0 4800<br>
credit2, vwfi=3Dtrap=C2=A0 =C2=A0 =C2=A0 7221=C2=A0 =C2=A0 7200=C2=A0 =C2=
=A0 9240=C2=A0 =C2=A0 7440<br>
credit2, vwfi=3Dnative=C2=A0 =C2=A0 2906=C2=A0 =C2=A0 2880=C2=A0 =C2=A0 312=
0=C2=A0 =C2=A0 5040<br>
<br>
New vgic:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0AVG=C2=A0 =C2=A0 =C2=A0MIN=C2=A0 =C2=A0 =C2=A0MAX=C2=A0 =
=C2=A0 =C2=A0WARM MAX<br>
credit, vwfi=3Dtrap=C2=A0 =C2=A0 =C2=A0 =C2=A08481=C2=A0 =C2=A0 8040=C2=A0 =
=C2=A0 10200=C2=A0 =C2=A08880<br>
credit, vwfi=3Dnative=C2=A0 =C2=A0 =C2=A04115=C2=A0 =C2=A0 3960=C2=A0 =C2=
=A0 4800=C2=A0 =C2=A0 4200<br>
credit2, vwfi=3Dtrap=C2=A0 =C2=A0 =C2=A0 8425=C2=A0 =C2=A0 8400=C2=A0 =C2=
=A0 9600=C2=A0 =C2=A0 9000<br>
credit2, vwfi=3Dnative=C2=A0 =C2=A0 4227=C2=A0 =C2=A0 3960=C2=A0 =C2=A0 504=
0=C2=A0 =C2=A0 4680<br>
<br>
Here we can see that the new vgic underperforms the old one in a trivial us=
e-case modeled with TBM.<br></blockquote></div><div><br></div><div>The vwfi=
=3Dtrap does not look so bad (10%) but indeed the vwfi=3Dnative adds a bigg=
er overhead.</div><div>This also tells you that in the trap case the vGIC i=
s not the bigger overhead.</div><div><br></div><div>I am pretty sure that t=
his can be optimized because we mostly focused on reliability and specifica=
tion compliance for the first draft.</div><div><br></div><div>So yes the ol=
d vGIC performs better but at the price of unreliability and non-compliance=
.</div><div><br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex"><br>
Old vgic with optimizations [3] (without [4], because it breaks the setup):=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0AVG=C2=A0 =C2=A0 =C2=A0MIN=C2=A0 =C2=A0 =C2=A0MAX=C2=A0 =
=C2=A0 =C2=A0WARM MAX<br>
credit, vwfi=3Dtrap=C2=A0 =C2=A0 =C2=A0 =C2=A07309=C2=A0 =C2=A0 7080=C2=A0 =
=C2=A0 8760=C2=A0 =C2=A0 7680<br>
credit, vwfi=3Dnative=C2=A0 =C2=A0 =C2=A03007=C2=A0 =C2=A0 3000=C2=A0 =C2=
=A0 4320=C2=A0 =C2=A0 3120<br>
credit2, vwfi=3Dtrap=C2=A0 =C2=A0 =C2=A0 6877=C2=A0 =C2=A0 6720=C2=A0 =C2=
=A0 8880=C2=A0 =C2=A0 7200<br>
credit2, vwfi=3Dnative=C2=A0 =C2=A0 2680=C2=A0 =C2=A0 2640=C2=A0 =C2=A0 444=
0=C2=A0 =C2=A0 2880<br></blockquote></div><div><br></div><div>This is with =
all your series applied but [4], correct? Did you try to see the perfomance=
 improvement patch by patch?</div><div><br></div><div>Cheers</div><div><br>=
</div><div><br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex">
<br>
<br>
<br>
[1] <a href=3D"https://github.com/aanisov/xen/tree/4tbm" rel=3D"noreferrer"=
 target=3D"_blank">https://github.com/aanisov/xen/tree/4tbm</a><br>
[2] <a href=3D"https://github.com/aanisov/tbm/commits/4xen" rel=3D"noreferr=
er" target=3D"_blank">https://github.com/aanisov/tbm/commits/4xen</a><br>
[3] <a href=3D"https://lists.xenproject.org/archives/html/xen-devel/2018-11=
/msg03328.html" rel=3D"noreferrer" target=3D"_blank">https://lists.xenproje=
ct.org/archives/html/xen-devel/2018-11/msg03328.html</a><br>
[4] <a href=3D"https://lists.xenproject.org/archives/html/xen-devel/2018-11=
/msg03288.html" rel=3D"noreferrer" target=3D"_blank">https://lists.xenproje=
ct.org/archives/html/xen-devel/2018-11/msg03288.html</a><br>
<br>
-- <br>
Sincerely,<br>
Andrii Anisov.<br>
<br>
_______________________________________________<br>
Xen-devel mailing list<br>
<a href=3D"mailto:Xen-devel@lists.xenproject.org" target=3D"_blank">Xen-dev=
el@lists.xenproject.org</a><br>
<a href=3D"https://lists.xenproject.org/mailman/listinfo/xen-devel" rel=3D"=
noreferrer" target=3D"_blank">https://lists.xenproject.org/mailman/listinfo=
/xen-devel</a></blockquote></div>

--000000000000a6eaf1057ca9a272--


--===============6914374047596334542==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6914374047596334542==--
