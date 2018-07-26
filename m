From: Christopher Clark <christopher.w.clark@gmail.com>
Subject: Re: [PATCH v2] firmware/shim : filter output files
 during Xen tree setup
Date: Thu, 26 Jul 2018 14:10:00 -0700
Message-ID: <CACMJ4GbtbVGfRmqiT448vG6aXgWTZyFrwgT+mEXrQdH9tz05Jg@mail.gmail.com>
References: <CACMJ4GYhRyZkESCw+OWrW5WbM+LAf6ZCyrbtTrK_12wdMPDyWw@mail.gmail.com>
 <1532478539-11746-1-git-send-email-christopher.w.clark@gmail.com>
 <5B57C29F0200000804C77BEC@prv1-mh.provo.novell.com>
 <5B57C462020000E403D61C84@prv1-mh.provo.novell.com>
 <5B58308B02000078001D784A@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============9170996560765798239=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=sxpe=kk=gmail.com=christopher.w.clark@srs-us1.protection.inumbo.net>)
 id 1finWP-0001ef-MZ
 for xen-devel@lists.xenproject.org; Thu, 26 Jul 2018 21:10:05 +0000
Received: by mail-lj1-x22d.google.com with SMTP id v9-v6so2678719ljk.4
 for <xen-devel@lists.xenproject.org>; Thu, 26 Jul 2018 14:10:03 -0700 (PDT)
In-Reply-To: <5B58308B02000078001D784A@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Ian Jackson <Ian.Jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

--===============9170996560765798239==
Content-Type: multipart/alternative; boundary="0000000000001e51a30571ed6bf2"

--0000000000001e51a30571ed6bf2
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 25, 2018 at 1:10 AM, Jan Beulich <JBeulich@suse.com> wrote:

> >>> On 25.07.18 at 02:28, <christopher.w.clark@gmail.com> wrote:
> > --- a/tools/firmware/xen-dir/Makefile
> > +++ b/tools/firmware/xen-dir/Makefile
> > @@ -11,6 +11,10 @@ D=xen-root
> >  LINK_DIRS=config xen
> >  LINK_FILES=Config.mk
> >
> > +# Files to exclude from the link farm
> > +EXCLUDE_FILES=xen xen.gz xen-syms xen-syms.map xen.efi xen.efi.map \
> > +              efi.lds xen.lds mkelf32 mkreloc
>
>
> So what about the auxiliary ones created there, like ..xen-syms.* or
> ..xen.efi.*

Thanks for this feedback. After rebuilding binutils to include an
EFI-capable linker, and then all tools dependent on that, and then building
the Xen tree, these files have become evident.

I added handling for these to the exclusion list, and tested with each of
Xen 4.10.1(*), 4.11.0 and staging: Each build passes "make", "make install"
in fresh trees without rebuilding the shim during the install step.

The 4.10.1 test was with this additional commit applied:
  commit 8717e7417cebeae162fd61ea4cbdcdd422748f08
  Author: Juergen Gross <jgross@suse.com>
    shim: don't let build modify shim.config

I'll post a v3 patch with the updated exclusion list as per above.


To amend my earlier reply to v1, here's a diff between the initial
> linkfarm.stamp
> and one resulting after a first incremental re-build:


> --- .../tools/firmware/xen-dir/linkfarm.stamp
> +++ .../tools/firmware/xen-dir/linkfarm.stamp
>
>

> I think all additions here should be considered as exclusion candidates.
>

The unfortunate thing about that list is that it is quite a bit longer and
will be more vulnerable to change. It includes header files which makes me
wary of it. You could shorten it with some wildcard matching, and you'll be
approaching something similar to the gitignore file content, as Roger had
pointed towards, but my preference is to leave it alone.

None of the options here that are short of a rewrite are great, but the
short exclusion list improves the behaviour for non-incremental builds,
which is a benefit for downstream and production builds where incremental
builds are not a requirement.

Christopher

--0000000000001e51a30571ed6bf2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Wed, Jul 25, 2018 at 1:10 AM, Jan Beulich <span dir=3D"ltr">&lt;<a href=
=3D"mailto:JBeulich@suse.com" target=3D"_blank">JBeulich@suse.com</a>&gt;</=
span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><span cla=
ss=3D"gmail-">&gt;&gt;&gt; On 25.07.18 at 02:28, &lt;<a href=3D"mailto:chri=
stopher.w.clark@gmail.com">christopher.w.clark@gmail.com</a><wbr>&gt; wrote=
:<br>
&gt; --- a/tools/firmware/xen-dir/<wbr>Makefile<br>
&gt; +++ b/tools/firmware/xen-dir/<wbr>Makefile<br>
&gt; @@ -11,6 +11,10 @@ D=3Dxen-root<br>
&gt;=C2=A0 LINK_DIRS=3Dconfig xen<br>
&gt;=C2=A0 LINK_FILES=3DConfig.mk<br>
&gt;=C2=A0 <br>
&gt; +# Files to exclude from the link farm<br>
&gt; +EXCLUDE_FILES=3Dxen xen.gz xen-syms xen-syms.map xen.efi xen.efi.map =
\<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 efi.lds xen.lds mkel=
f32 mkreloc<br>
<br></span></blockquote><div><br></div><div><span style=3D"font-size:small;=
background-color:rgb(255,255,255);text-decoration-style:initial;text-decora=
tion-color:initial;float:none;display:inline">&gt; So what about the auxili=
ary ones created there, like ..xen-syms.* or</span><br style=3D"font-size:s=
mall;background-color:rgb(255,255,255);text-decoration-style:initial;text-d=
ecoration-color:initial"><span style=3D"font-size:small;background-color:rg=
b(255,255,255);text-decoration-style:initial;text-decoration-color:initial;=
float:none;display:inline">&gt; ..xen.efi.*</span><br></div><div><br></div>=
<div>Thanks for this feedback. After rebuilding binutils to include an EFI-=
capable linker, and then all tools dependent on that, and then building the=
 Xen tree, these files have become evident.</div><div><br></div><div>I adde=
d handling for these to the exclusion list, and tested with each of Xen 4.1=
0.1(*), 4.11.0 and staging: Each build passes &quot;make&quot;, &quot;make =
install&quot; in fresh trees without rebuilding the shim during the install=
 step.</div><div><br></div><div>The 4.10.1 test was with this additional co=
mmit applied:<br><div>=C2=A0 commit 8717e7417cebeae162fd61ea4cbdcdd422748f0=
8</div><div>=C2=A0 Author: Juergen Gross &lt;<a href=3D"mailto:jgross@suse.=
com">jgross@suse.com</a>&gt;</div></div><div><div>=C2=A0 =C2=A0 shim: don&#=
39;t let build modify shim.config</div></div><div><br></div><div>I&#39;ll p=
ost a v3 patch with the updated exclusion list as per above.</div><div><br>=
</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><spa=
n class=3D"gmail-">
</span>To amend my earlier reply to v1, here&#39;s a diff between the initi=
al linkfarm.stamp<br>
and one resulting after a first incremental re-build:=C2=A0</blockquote><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">
<br>
--- .../tools/firmware/xen-dir/<wbr>linkfarm.stamp<br>
+++ .../tools/firmware/xen-dir/<wbr>linkfarm.stamp<br><br></blockquote><div=
>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
I think all additions here should be considered as exclusion candidates.<br=
></blockquote><div><br></div><div>The unfortunate thing about that list is =
that it is quite a bit longer and will be more vulnerable to change. It inc=
ludes header files which makes me wary of it. You could shorten it with som=
e wildcard matching, and you&#39;ll be approaching something similar to the=
 gitignore file content, as Roger had pointed towards, but my preference is=
 to leave it alone.</div><div><br></div><div>None of the options here that =
are short of a rewrite are great, but the short exclusion list improves the=
 behaviour for non-incremental builds, which is a benefit for downstream an=
d production builds where incremental builds are not a requirement.</div><d=
iv><br></div><div>Christopher</div><div><br></div><div><br></div><div><br><=
/div><div><br></div></div></div></div>

--0000000000001e51a30571ed6bf2--


--===============9170996560765798239==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============9170996560765798239==--
