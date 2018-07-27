From: Julien Grall <julien.grall@gmail.com>
Subject: Re: [PATCH v7 08/12] arm: add ALL, QEMU,
 Rcar3 and MPSoC configs
Date: Fri, 27 Jul 2018 23:09:18 +0100
Message-ID: <CAF3u54Dov+QzhJKz9qkM3=0CTRXSzcNq=sVdL+ExuWbvfJd75w@mail.gmail.com>
References: <alpine.DEB.2.10.1807061537300.13502@sstabellini-ThinkPad-X260>
 <1530918843-14318-8-git-send-email-sstabellini@kernel.org>
 <9070dccb-e699-7189-d6b3-38cb5f0773f3@epam.com>
 <alpine.DEB.2.10.1807261543150.20701@sstabellini-ThinkPad-X260>
 <5b253972-a880-0ded-dc51-db2f9f8abbdc@epam.com>
 <alpine.DEB.2.10.1807271006090.20701@sstabellini-ThinkPad-X260>
 <5fcc3513-ef81-b08b-cbab-4cbb18aebcac@epam.com>
 <alpine.DEB.2.10.1807271431010.20701@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2434684896020572280=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <alpine.DEB.2.10.1807271431010.20701@sstabellini-ThinkPad-X260>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: artem_mygaiev@epam.com, Andrii Anisov <andrii_anisov@epam.com>, andrew.cooper3@citrix.com, George.Dunlap@citrix.com, dfaggioli@suse.com, julien.grall@arm.com, xen-devel@lists.xen.org, volodymyr_babchuk@epam.com
List-Id: xen-devel@lists.xenproject.org

--===============2434684896020572280==
Content-Type: multipart/alternative; boundary="000000000000b259790572025d8d"

--000000000000b259790572025d8d
Content-Type: text/plain; charset="UTF-8"

Hi Stefano,

Sorry for the top posting.

I think Andrii made a good point. With your new code MPSOC will get built
on Arm 32 bit as well.

This was not the case before this patch.

So I would like at least that to be fixed before any commit.

Cheers,

On Fri, 27 Jul 2018, 22:38 Stefano Stabellini, <sstabellini@kernel.org>
wrote:

> On Fri, 27 Jul 2018, Andrii Anisov wrote:
> > Hello Stefano,
> >
> > On 27.07.18 20:11, Stefano Stabellini wrote:
> > > Yes, it does.
> > >
> > > Let's say that you chose ALL at the menu choice. MPSOC_PLATFORM gets
> > > selected, that trigger the build of the MPSOC platform file.
> > >
> > > If you do "make menuconfig" again and select RCAR3 instead,
> > > MPSOC_PLATFORM is removed from the .config. Next time you type "make"
> > > the MPSOC platform files will not be built.
> > But vexpress, sunxi, other listed in arch/arm/platforms/Makefile and
> dependent
> > on ARM32 or ARM64 will be built anyway.
>
> Ah, yes, I understand what you mean now.
>
> That is not a problem with this patch or with the approach taken here.
> It is just a matter of adding more options like RCAR3 and MPSOC. It is
> just that I haven't done it yet. Given that this patch series has been
> out for a while now and has all the required acks, I would prefer to
> commit it as is (with the small change requested by Julien) and make
> changes for vexpress, sunxi, and others in follow-up patches.
>
> _______________________________________________
> Xen-devel mailing list
> Xen-devel@lists.xenproject.org
> https://lists.xenproject.org/mailman/listinfo/xen-devel

--000000000000b259790572025d8d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<span>Hi Stefano,</span><div><br></div><div>Sorry for the top posting.</div=
><div><br></div><div><div dir=3D"auto"><div dir=3D"auto">I think Andrii mad=
e a good point. With your new code MPSOC will get built on Arm 32 bit as we=
ll.</div><div dir=3D"auto"><br></div><div dir=3D"auto">This was not the cas=
e before this patch.</div><div dir=3D"auto"><br></div><div dir=3D"auto">So =
I would like at least that to be fixed before any commit.</div><div dir=3D"=
auto"><br></div><div dir=3D"auto">Cheers,</div><div dir=3D"auto"><br><div c=
lass=3D"gmail_quote"><div dir=3D"ltr">On Fri, 27 Jul 2018, 22:38 Stefano St=
abellini, &lt;<a href=3D"mailto:sstabellini@kernel.org">sstabellini@kernel.=
org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Fri, 27 Jul 2=
018, Andrii Anisov wrote:<br>
&gt; Hello Stefano,<br>
&gt; <br>
&gt; On 27.07.18 20:11, Stefano Stabellini wrote:<br>
&gt; &gt; Yes, it does.<br>
&gt; &gt; <br>
&gt; &gt; Let&#39;s say that you chose ALL at the menu choice. MPSOC_PLATFO=
RM gets<br>
&gt; &gt; selected, that trigger the build of the MPSOC platform file.<br>
&gt; &gt; <br>
&gt; &gt; If you do &quot;make menuconfig&quot; again and select RCAR3 inst=
ead,<br>
&gt; &gt; MPSOC_PLATFORM is removed from the .config. Next time you type &q=
uot;make&quot;<br>
&gt; &gt; the MPSOC platform files will not be built.<br>
&gt; But vexpress, sunxi, other listed in arch/arm/platforms/Makefile and d=
ependent<br>
&gt; on ARM32 or ARM64 will be built anyway.<br>
<br>
Ah, yes, I understand what you mean now.<br>
<br>
That is not a problem with this patch or with the approach taken here.<br>
It is just a matter of adding more options like RCAR3 and MPSOC. It is<br>
just that I haven&#39;t done it yet. Given that this patch series has been<=
br>
out for a while now and has all the required acks, I would prefer to<br>
commit it as is (with the small change requested by Julien) and make<br>
changes for vexpress, sunxi, and others in follow-up patches.<br>
<br>
_______________________________________________<br>
Xen-devel mailing list<br>
<a href=3D"mailto:Xen-devel@lists.xenproject.org" target=3D"_blank">Xen-dev=
el@lists.xenproject.org</a><br>
<a href=3D"https://lists.xenproject.org/mailman/listinfo/xen-devel" rel=3D"=
noreferrer" target=3D"_blank">https://lists.xenproject.org/mailman/listinfo=
/xen-devel</a></blockquote></div></div></div></div>

--000000000000b259790572025d8d--


--===============2434684896020572280==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2434684896020572280==--
