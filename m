From: Christopher Clark <christopher.w.clark@gmail.com>
Subject: Re: [PATCH] firmware/shim : filter output files during
 Xen tree setup
Date: Tue, 24 Jul 2018 17:21:40 -0700
Message-ID: <CACMJ4GYhRyZkESCw+OWrW5WbM+LAf6ZCyrbtTrK_12wdMPDyWw@mail.gmail.com>
References: <1532121305-5253-1-git-send-email-christopher.w.clark@gmail.com>
 <5B56F4D802000078001D7155@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0577563002002121997=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=qdwz=kj=gmail.com=christopher.w.clark@srs-us1.protection.inumbo.net>)
 id 1fi7Yn-0007zQ-Bj
 for xen-devel@lists.xenproject.org; Wed, 25 Jul 2018 00:21:45 +0000
Received: by mail-lf1-x143.google.com with SMTP id u202-v6so4190680lff.9
 for <xen-devel@lists.xenproject.org>; Tue, 24 Jul 2018 17:21:42 -0700 (PDT)
In-Reply-To: <5B56F4D802000078001D7155@prv1-mh.provo.novell.com>
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

--===============0577563002002121997==
Content-Type: multipart/alternative; boundary="000000000000d6cb060571c7dcce"

--000000000000d6cb060571c7dcce
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 24, 2018 at 2:43 AM, Jan Beulich <JBeulich@suse.com> wrote:

> >>> On 20.07.18 at 23:15, <christopher.w.clark@gmail.com> wrote:
> > Exclude named output files from the Xen tree setup.
> >
> > The linkfarm.stamp content will differ between top level "make"
> > and "make install" invocations, due to the introduction of these
> > output files that are produced during the "make" build.
> >
> > Filter these out to prevent an unnecessary rebuild of the shim during
> > "make install".
> >
> > Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
> > ---
> >  tools/firmware/xen-dir/Makefile | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/tools/firmware/xen-dir/Makefile
> > b/tools/firmware/xen-dir/Makefile
> > index 84648c3..e490dca 100644
> > --- a/tools/firmware/xen-dir/Makefile
> > +++ b/tools/firmware/xen-dir/Makefile
> > @@ -11,6 +11,9 @@ D=xen-root
> >  LINK_DIRS=config xen
> >  LINK_FILES=Config.mk
> >
> > +# Files to exclude from the link farm
> > +EXCLUDE_FILES=xen xen.gz xen-syms xen-syms.map efi.lds xen.lds mkelf32
> mkreloc
>
> What about xen.efi and all of its auxiliary files?


Fair point - this list was from a non-EFI build, and EFI does add two more
files to it: xen.efi and xen.efi.map


> What about other generated files?
>

I don't see any others being added to the stamp file -- with the possible
exception of the "disabled" file in xen/arch/x86/efi which can capture
build errors. I don't think that file will be present in production builds.

Did you have any others in mind? I'll post an updated patch with the
EFI-updated list in the meantime.

Christopher

--000000000000d6cb060571c7dcce
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Tue, Jul 24, 2018 at 2:43 AM, Jan Beulich <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:JBeulich@suse.com" target=3D"_blank">JBeulich@suse.com</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><span =
class=3D"gmail-">&gt;&gt;&gt; On 20.07.18 at 23:15, &lt;<a href=3D"mailto:c=
hristopher.w.clark@gmail.com">christopher.w.clark@gmail.com</a><wbr>&gt; wr=
ote:<br>
&gt; Exclude named output files from the Xen tree setup.<br>
&gt; <br>
&gt; The linkfarm.stamp content will differ between top level &quot;make&qu=
ot;<br>
&gt; and &quot;make install&quot; invocations, due to the introduction of t=
hese<br>
&gt; output files that are produced during the &quot;make&quot; build.<br>
&gt; <br>
&gt; Filter these out to prevent an unnecessary rebuild of the shim during<=
br>
&gt; &quot;make install&quot;.<br>
&gt; <br>
&gt; Signed-off-by: Christopher Clark &lt;<a href=3D"mailto:christopher.cla=
rk6@baesystems.com">christopher.clark6@<wbr>baesystems.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 tools/firmware/xen-dir/<wbr>Makefile | 6 +++++-<br>
&gt;=C2=A0 1 file changed, 5 insertions(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/tools/firmware/xen-dir/<wbr>Makefile <br>
&gt; b/tools/firmware/xen-dir/<wbr>Makefile<br>
&gt; index 84648c3..e490dca 100644<br>
&gt; --- a/tools/firmware/xen-dir/<wbr>Makefile<br>
&gt; +++ b/tools/firmware/xen-dir/<wbr>Makefile<br>
&gt; @@ -11,6 +11,9 @@ D=3Dxen-root<br>
&gt;=C2=A0 LINK_DIRS=3Dconfig xen<br>
&gt;=C2=A0 LINK_FILES=3DConfig.mk<br>
&gt;=C2=A0 <br>
&gt; +# Files to exclude from the link farm<br>
&gt; +EXCLUDE_FILES=3Dxen xen.gz xen-syms xen-syms.map efi.lds xen.lds mkel=
f32 mkreloc<br>
<br>
</span>What about xen.efi and all of its auxiliary files?</blockquote><div>=
<br></div><div>Fair point - this list was from a non-EFI build, and EFI doe=
s add two more files to it: xen.efi and xen.efi.map</div><div>=C2=A0</div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">What about other generated=
 files?<br></blockquote><div><br></div><div>I don&#39;t see any others bein=
g added to the stamp file -- with the possible exception of the &quot;disab=
led&quot; file in xen/arch/x86/efi which can capture build errors. I don&#3=
9;t think that file will be present in production builds.</div><div><br></d=
iv><div>Did you have any others in mind? I&#39;ll post an updated patch wit=
h the EFI-updated list in the meantime.</div><div><br></div><div>Christophe=
r</div><div><br></div><div><br></div></div></div></div>

--000000000000d6cb060571c7dcce--


--===============0577563002002121997==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0577563002002121997==--
