From: Ajay Garg <ajaygargnsit@gmail.com>
Subject: Re: [cubieboard2] Bringing up dom0
Date: Mon, 30 Apr 2018 12:11:53 +0530
Message-ID: <CAHP4M8WY7v25RVxOc4gRgYErHF0dRhMWsCUhXBNgsZucNOyg4Q@mail.gmail.com>
References: <CAHP4M8XeGY0S-HyLprND0R26hQsNd9k4-upM7MFDrodx0vomqA@mail.gmail.com>
 <7c64b5a9-d11e-414b-52df-4db92d992526@citrix.com>
 <CAHP4M8WzCwcmr8rL459B0LjkdC0Eb2C+hQM8nzKF=A7PEpx=ZQ@mail.gmail.com>
 <23a0e88b-95c6-9d55-32e1-0c7834999f98@citrix.com>
 <CAHP4M8UUEwyG9NgmAiT6WXBbD_gmbJXQP03n3pH58eoGrwPAuQ@mail.gmail.com>
 <CAHP4M8XdrzZceZB2EPJgUY1pn7XwWGyiEEeHt2Y_F2OS7LyziQ@mail.gmail.com>
 <CABHD4K_4bhyF09UumFyDTX-jFXh=Jtaqvx38b4KEEJqL_yQ7-Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8192049670539771016=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=9iis=ht=gmail.com=ajaygargnsit@srs-us1.protection.inumbo.net>)
 id 1fD2VY-0004jk-QD
 for xen-devel@lists.xenproject.org; Mon, 30 Apr 2018 06:41:56 +0000
In-Reply-To: <CABHD4K_4bhyF09UumFyDTX-jFXh=Jtaqvx38b4KEEJqL_yQ7-Q@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Amit Tomer <amittomer25@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-users@lists.xenproject.org, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

--===============8192049670539771016==
Content-Type: multipart/alternative; boundary="0000000000003ef6a4056b0b26e6"

--0000000000003ef6a4056b0b26e6
Content-Type: text/plain; charset="UTF-8"

Thanks a ton Amit .. that worked !!
"sudo xl list" now shows Domain-0 :)

On Mon, Apr 30, 2018 at 12:10 PM, Amit Tomer <amittomer25@gmail.com> wrote:

> Hello
> >
> > debian@debian-armhf:~$ sudo xl list
> > Name                                        ID   Mem VCPUs    State
> > Time(s)
> >
> >
> > Now what am I missing?
>
> You may need to run following
>
> # /etc/init.d/xencommons start
>
> Thanks
> -Amit
>



Thanks and Regards,
Ajay

--0000000000003ef6a4056b0b26e6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thanks a ton Amit .. that worked !!<br></div>&quot;su=
do xl list&quot; now shows Domain-0 :)<br><div class=3D"gmail_extra"><br><d=
iv class=3D"gmail_quote">On Mon, Apr 30, 2018 at 12:10 PM, Amit Tomer <span=
 dir=3D"ltr">&lt;<a href=3D"mailto:amittomer25@gmail.com" target=3D"_blank"=
>amittomer25@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex">Hello<br>
<span class=3D"">&gt;<br>
&gt; debian@debian-armhf:~$ sudo xl list<br>
&gt; Name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 I=
D=C2=A0 =C2=A0Mem VCPUs=C2=A0 =C2=A0 State<br>
&gt; Time(s)<br>
&gt;<br>
&gt;<br>
&gt; Now what am I missing?<br>
<br>
</span>You may need to run following<br>
<br>
# /etc/init.d/xencommons start<br>
<br>
Thanks<br>
<span class=3D"HOEnZb"><font color=3D"#888888">-Amit<br>
</font></span></blockquote></div><br><br clear=3D"all"><br><div class=3D"gm=
ail_signature" data-smartmail=3D"gmail_signature">Thanks and Regards,<br>Aj=
ay<br></div>
</div></div>

--0000000000003ef6a4056b0b26e6--


--===============8192049670539771016==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8192049670539771016==--
