From: Christopher Clark <christopher.w.clark@gmail.com>
Subject: Re: [PATCH] firmware/shim : filter output files during
 Xen tree setup
Date: Mon, 23 Jul 2018 16:00:35 -0700
Message-ID: <CACMJ4GZ+otBvc0=-08JUTuhYD3+66EnTu=P6-y0=aVSuCKZ-Bg@mail.gmail.com>
References: <1532121305-5253-1-git-send-email-christopher.w.clark@gmail.com>
 <20180723090940.jf6bysl5vtt7ehqx@mac.bytemobile.com>
 <398ca3b0-6d16-0434-449d-c9bae7b0c4ea@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1189239265237106865=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ivbl=kh=gmail.com=christopher.w.clark@srs-us1.protection.inumbo.net>)
 id 1fhjol-00025j-CY
 for xen-devel@lists.xenproject.org; Mon, 23 Jul 2018 23:00:39 +0000
Received: by mail-lj1-x241.google.com with SMTP id y17-v6so1923639ljy.8
 for <xen-devel@lists.xenproject.org>; Mon, 23 Jul 2018 16:00:37 -0700 (PDT)
In-Reply-To: <398ca3b0-6d16-0434-449d-c9bae7b0c4ea@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

--===============1189239265237106865==
Content-Type: multipart/alternative; boundary="0000000000000d89a90571b29dad"

--0000000000000d89a90571b29dad
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 23, 2018 at 2:26 AM, Andrew Cooper <andrew.cooper3@citrix.com>
wrote:

> On 23/07/18 10:09, Roger Pau Monn=C3=A9 wrote:
> > On Fri, Jul 20, 2018 at 02:15:05PM -0700, Christopher Clark wrote:
> >> Exclude named output files from the Xen tree setup.
> >>
> >> The linkfarm.stamp content will differ between top level "make"
> >> and "make install" invocations, due to the introduction of these
> >> output files that are produced during the "make" build.
> >>
> >> Filter these out to prevent an unnecessary rebuild of the shim during
> >> "make install".
> >>
> >> Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
> >> ---
> >>  tools/firmware/xen-dir/Makefile | 6 +++++-
> >>  1 file changed, 5 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/tools/firmware/xen-dir/Makefile b/tools/firmware/xen-dir/
> Makefile
> >> index 84648c3..e490dca 100644
> >> --- a/tools/firmware/xen-dir/Makefile
> >> +++ b/tools/firmware/xen-dir/Makefile
> >> @@ -11,6 +11,9 @@ D=3Dxen-root
> >>  LINK_DIRS=3Dconfig xen
> >>  LINK_FILES=3DConfig.mk
> >>
> >> +# Files to exclude from the link farm
> >> +EXCLUDE_FILES=3Dxen xen.gz xen-syms xen-syms.map efi.lds xen.lds mkel=
f32
> mkreloc
> > I don't really like to list the files here, since it's very easy for
> > them to get out of sync. The alternative I have is also not very nice
> > however, since it relies on .gitignore:
> >
> > EXCLUDE_FILES:=3D$(patsubst xen/%,%,$(filter xen/%,$(shell cat
> $(XEN_ROOT)/.gitignore)))
>
> The correct way to fix this is to rip the current build system to
> shreds, start again, and get it to support out-of-tree builds.
>
> This linkfarm logic exists only to work around a hole which we couldn't
> fix at the time.
>


As Andrew observes, the linkfarm code is a temporary solution until Xen
supports out of tree builds.

The proposed patch is localized and easy to understand.

If the list of files is not maintained, it will break in obvious ways
(either an unnecessary shim rebuild, or a non-rebuild when it should but
only in a developer environment) and it will serve as a reminder to fix
support for out of tree builds.

So, I'd like to request inclusion of the original patch proposed.

Christopher

--0000000000000d89a90571b29dad
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Mon, Jul 23, 2018 at 2:26 AM, Andrew Cooper <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:andrew.cooper3@citrix.com" target=3D"_blank">andrew.cooper3=
@citrix.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex"><div class=3D"gmail-HOEnZb"><div class=3D"gmail-h5">On 23/07/18=
 10:09, Roger Pau Monn=C3=A9 wrote:<br>
&gt; On Fri, Jul 20, 2018 at 02:15:05PM -0700, Christopher Clark wrote:<br>
&gt;&gt; Exclude named output files from the Xen tree setup.<br>
&gt;&gt;<br>
&gt;&gt; The linkfarm.stamp content will differ between top level &quot;mak=
e&quot;<br>
&gt;&gt; and &quot;make install&quot; invocations, due to the introduction =
of these<br>
&gt;&gt; output files that are produced during the &quot;make&quot; build.<=
br>
&gt;&gt;<br>
&gt;&gt; Filter these out to prevent an unnecessary rebuild of the shim dur=
ing<br>
&gt;&gt; &quot;make install&quot;.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Christopher Clark &lt;<a href=3D"mailto:christopher=
.clark6@baesystems.com">christopher.clark6@<wbr>baesystems.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 tools/firmware/xen-dir/<wbr>Makefile | 6 +++++-<br>
&gt;&gt;=C2=A0 1 file changed, 5 insertions(+), 1 deletion(-)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/tools/firmware/xen-dir/<wbr>Makefile b/tools/firmware=
/xen-dir/<wbr>Makefile<br>
&gt;&gt; index 84648c3..e490dca 100644<br>
&gt;&gt; --- a/tools/firmware/xen-dir/<wbr>Makefile<br>
&gt;&gt; +++ b/tools/firmware/xen-dir/<wbr>Makefile<br>
&gt;&gt; @@ -11,6 +11,9 @@ D=3Dxen-root<br>
&gt;&gt;=C2=A0 LINK_DIRS=3Dconfig xen<br>
&gt;&gt;=C2=A0 LINK_FILES=3DConfig.mk<br>
&gt;&gt;=C2=A0 <br>
&gt;&gt; +# Files to exclude from the link farm<br>
&gt;&gt; +EXCLUDE_FILES=3Dxen xen.gz xen-syms xen-syms.map efi.lds xen.lds =
mkelf32 mkreloc<br>
&gt; I don&#39;t really like to list the files here, since it&#39;s very ea=
sy for<br>
&gt; them to get out of sync. The alternative I have is also not very nice<=
br>
&gt; however, since it relies on .gitignore:<br>
&gt;<br>
&gt; EXCLUDE_FILES:=3D$(patsubst xen/%,%,$(filter xen/%,$(shell cat $(XEN_R=
OOT)/.gitignore)))<br>
<br>
</div></div>The correct way to fix this is to rip the current build system =
to<br>
shreds, start again, and get it to support out-of-tree builds.<br>
<br>
This linkfarm logic exists only to work around a hole which we couldn&#39;t=
<br>
fix at the time.<br></blockquote></div></div><div class=3D"gmail_extra"><di=
v class=3D"gmail_extra"><br></div><div class=3D"gmail_extra"><br></div><div=
 class=3D"gmail_extra">As Andrew observes, the linkfarm code is a temporary=
 solution until Xen supports out of tree builds.</div><div class=3D"gmail_e=
xtra"><br></div><div class=3D"gmail_extra">The proposed patch is localized =
and easy to understand.</div><div class=3D"gmail_extra"><br></div><div clas=
s=3D"gmail_extra">If the list of files is not maintained, it will break in =
obvious ways (either an unnecessary shim rebuild, or a non-rebuild when it =
should but only in a developer environment) and it will serve as a reminder=
 to fix support for out of tree builds.</div><div class=3D"gmail_extra"><br=
></div><div class=3D"gmail_extra">So, I&#39;d like to request inclusion of =
the original patch proposed.</div><div class=3D"gmail_extra"><br></div><div=
 class=3D"gmail_extra">Christopher</div></div><div class=3D"gmail_extra"><b=
r></div></div>

--0000000000000d89a90571b29dad--


--===============1189239265237106865==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1189239265237106865==--
