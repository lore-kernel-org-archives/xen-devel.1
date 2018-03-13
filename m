From: Oleksandr Grytsov <al1img@gmail.com>
Subject: Re: [PATCH] tools/xl: fix uninitialized variable in
	xl_vdispl
Date: Tue, 13 Mar 2018 12:33:39 +0200
Message-ID: <CACvf2oVxeFUkFEv0NWqK+9KJk=mvRmVf_NE3VUEAh7RTmro=9g@mail.gmail.com>
References: <20180313044333.27923-1-cardoe@cardoe.com>
 <5AA793F302000078001B0CC4@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============9081230819173449935=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5AA793F302000078001B0CC4@prv-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Doug Goldstein <cardoe@cardoe.com>, Xen Development List <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

--===============9081230819173449935==
Content-Type: multipart/alternative; boundary="001a11406f18be4e94056748caa2"

--001a11406f18be4e94056748caa2
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 13, 2018 at 10:03 AM, Jan Beulich <JBeulich@suse.com> wrote:

> >>> On 13.03.18 at 05:43, <cardoe@cardoe.com> wrote:
> > The code added in 7a48622a78a0b452e8afa55b8442c958abd226a7 could use rc
> > uninitialized in main_vdisplattach().
> >
> > Signed-off-by: Doug Goldstein <cardoe@cardoe.com>
> > ---
> > CC: Oleksandr Grytsov <oleksandr_grytsov@epam.com>
> > ---
> >  tools/xl/xl_vdispl.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
>
> Please trim your Cc list - I've removed all individuals here, and I
> don't see why you've copied all REST maintainers when this is
> clearly a pure tool stack change.
>
> Jan
>
>
> _______________________________________________
> Xen-devel mailing list
> Xen-devel@lists.xenproject.org
> https://lists.xenproject.org/mailman/listinfo/xen-devel
>


Hi, Doug,

Thanks for pointing it out.

The implementation is done according to CODING_STYLE document (see ERROR
HANDLING)
which requests to define return value rc uninitialized. The only path where
rc is uninitialized it is
when dryrun_only set to true. So, proper fix should be:

    if (dryrun_only) {
        char *json = libxl_device_vdispl_to_json(ctx, &vdispl);
        printf("vdispl: %s\n", json);
        free(json);
+      rc = 0;
        goto out;
    }


-- 
Best Regards,
Oleksandr Grytsov.

--001a11406f18be4e94056748caa2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Tue, Mar 13, 2018 at 10:03 AM, Jan Beulich <span dir=3D"ltr">&lt;<a =
href=3D"mailto:JBeulich@suse.com" target=3D"_blank">JBeulich@suse.com</a>&g=
t;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><span=
 class=3D"gmail-">&gt;&gt;&gt; On 13.03.18 at 05:43, &lt;<a href=3D"mailto:=
cardoe@cardoe.com">cardoe@cardoe.com</a>&gt; wrote:<br>
&gt; The code added in 7a48622a78a0b452e8afa55b8442c9<wbr>58abd226a7 could =
use rc<br>
&gt; uninitialized in main_vdisplattach().<br>
&gt;<br>
&gt; Signed-off-by: Doug Goldstein &lt;<a href=3D"mailto:cardoe@cardoe.com"=
>cardoe@cardoe.com</a>&gt;<br>
&gt; ---<br>
&gt; CC: Oleksandr Grytsov &lt;<a href=3D"mailto:oleksandr_grytsov@epam.com=
">oleksandr_grytsov@epam.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 tools/xl/xl_vdispl.c | 2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
</span>Please trim your Cc list - I&#39;ve removed all individuals here, an=
d I<br>
don&#39;t see why you&#39;ve copied all REST maintainers when this is<br>
clearly a pure tool stack change.<br>
<span class=3D"gmail-HOEnZb"><font color=3D"#888888"><br>
Jan<br>
</font></span><div class=3D"gmail-HOEnZb"><div class=3D"gmail-h5"><br>
<br>
______________________________<wbr>_________________<br>
Xen-devel mailing list<br>
<a href=3D"mailto:Xen-devel@lists.xenproject.org">Xen-devel@lists.xenprojec=
t.org</a><br>
<a href=3D"https://lists.xenproject.org/mailman/listinfo/xen-devel" rel=3D"=
noreferrer" target=3D"_blank">https://lists.xenproject.org/<wbr>mailman/lis=
tinfo/xen-devel</a></div></div></blockquote></div><br><br></div><div class=
=3D"gmail_extra">Hi, Doug,<br><br></div><div class=3D"gmail_extra">Thanks f=
or pointing it out.<br><br>The implementation is done according to CODING_S=
TYLE document (see ERROR HANDLING)<br></div><div class=3D"gmail_extra">whic=
h requests to define return value rc uninitialized. The only path where rc =
is uninitialized it is<br></div><div class=3D"gmail_extra">when dryrun_only=
 set to true. So, proper fix should be:<br></div><div class=3D"gmail_extra"=
><br>=C2=A0=C2=A0=C2=A0 if (dryrun_only) {<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 char *json =3D libxl_device_vdispl_to_json(ctx, &amp;vdispl=
);<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 printf(&quot;vdispl: %s\n&=
quot;, json);<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 free(json);<br>=
</div><div class=3D"gmail_extra">+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rc =3D 0;<=
br></div><div class=3D"gmail_extra">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 goto out;<br>=C2=A0=C2=A0=C2=A0 }<br><br></div><div class=3D"gmail_extr=
a"><br></div><div class=3D"gmail_extra">-- <br><div class=3D"gmail_signatur=
e">Best Regards,<br>Oleksandr Grytsov.</div>
</div></div>

--001a11406f18be4e94056748caa2--


--===============9081230819173449935==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============9081230819173449935==--
