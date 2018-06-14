From: Zhouyang Jia <jiazhouyang09@gmail.com>
Subject: Re: [PATCH] xen: add error handling for xenbus_printf
Date: Fri, 15 Jun 2018 07:33:37 +0800
Message-ID: <CABb2TxKUS079nEbcPPW0cdSibWYEehkwE7RKBG+zfOa10GZxcg@mail.gmail.com>
References: <1528775073-39322-1-git-send-email-jiazhouyang09@gmail.com>
 <8c85b8d8-0f29-d384-f3a4-c8257e67128b@oracle.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7108156742701241121=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=2aoe=ja=gmail.com=jiazhouyang09@srs-us1.protection.inumbo.net>)
 id 1fTbkL-0002Ki-H8
 for xen-devel@lists.xenproject.org; Thu, 14 Jun 2018 23:33:41 +0000
Received: by mail-io0-x242.google.com with SMTP id l19-v6so9010244ioj.5
 for <xen-devel@lists.xenproject.org>; Thu, 14 Jun 2018 16:33:38 -0700 (PDT)
In-Reply-To: <8c85b8d8-0f29-d384-f3a4-c8257e67128b@oracle.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: xen-devel@lists.xenproject.org

--===============7108156742701241121==
Content-Type: multipart/alternative; boundary="0000000000005d7f2e056ea287ec"

--0000000000005d7f2e056ea287ec
Content-Type: text/plain; charset="UTF-8"

Hi,

Sorry, I can't find which xenbus_device to print. So I inherit the existing
style and use pr_err.

I add __func__ in v2. If it needs to be changed, please let me know.

Thanks for your kind reply.

Best,
Zhouyang

2018-06-15 5:57 GMT+08:00 Boris Ostrovsky <boris.ostrovsky@oracle.com>:

> On 06/11/2018 11:44 PM, Zhouyang Jia wrote:
> > When xenbus_printf fails, the lack of error-handling code may
> > cause unexpected results.
> >
> > This patch adds error-handling code after calling xenbus_printf.
> >
> > Signed-off-by: Zhouyang Jia <jiazhouyang09@gmail.com>
> > ---
> >  drivers/xen/manage.c | 17 ++++++++++++++---
> >  1 file changed, 14 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/xen/manage.c b/drivers/xen/manage.c
> > index 8835065..159694d 100644
> > --- a/drivers/xen/manage.c
> > +++ b/drivers/xen/manage.c
> > @@ -289,8 +289,15 @@ static void sysrq_handler(struct xenbus_watch
> *watch, const char *path,
> >               return;
> >       }
> >
> > -     if (sysrq_key != '\0')
> > -             xenbus_printf(xbt, "control", "sysrq", "%c", '\0');
> > +     if (sysrq_key != '\0') {
> > +             err = xenbus_printf(xbt, "control", "sysrq", "%c", '\0');
> > +             if (err) {
> > +                     pr_err("Error %d writing sysrq code in
> control/sysrq\n",
> > +                            err);
> > +                     xenbus_transaction_end(xbt, 1);
> > +                     return;
> > +             }
> > +     }
> >
> >       err = xenbus_transaction_end(xbt, 0);
> >       if (err == -EAGAIN)
> > @@ -342,7 +349,11 @@ static int setup_shutdown_watcher(void)
> >                       continue;
> >               snprintf(node, FEATURE_PATH_SIZE, "feature-%s",
> >                        shutdown_handlers[idx].command);
> > -             xenbus_printf(XBT_NIL, "control", node, "%u", 1);
> > +             err = xenbus_printf(XBT_NIL, "control", node, "%u", 1);
> > +             if (err) {
> > +                     pr_err("Error %d writing %s\n", err, node);
>
>
> Adding __func__ will make it it easier trying to understand where the
> error is coming from. And for consistency, I'd add it to the one above
> as well.
>
>
> -boris
>
>

--0000000000005d7f2e056ea287ec
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>Sorry, I can&#39;t find which xenbu=
s_device to print. So I=C2=A0<span style=3D"font-size:14px">inherit the exi=
sting</span></div><div><span style=3D"font-size:14px">style and use pr_err.=
</span></div><div><br></div><div>I add __func__ in v2. If it needs to be ch=
anged, please let me know.</div><div><br></div><div>Thanks for your kind re=
ply.</div><div><br></div><div>Best,</div><div>Zhouyang</div></div><div clas=
s=3D"gmail_extra"><br><div class=3D"gmail_quote">2018-06-15 5:57 GMT+08:00 =
Boris Ostrovsky <span dir=3D"ltr">&lt;<a href=3D"mailto:boris.ostrovsky@ora=
cle.com" target=3D"_blank">boris.ostrovsky@oracle.com</a>&gt;</span>:<br><b=
lockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px =
#ccc solid;padding-left:1ex"><div class=3D"HOEnZb"><div class=3D"h5">On 06/=
11/2018 11:44 PM, Zhouyang Jia wrote:<br>
&gt; When xenbus_printf fails, the lack of error-handling code may<br>
&gt; cause unexpected results.<br>
&gt;<br>
&gt; This patch adds error-handling code after calling xenbus_printf.<br>
&gt;<br>
&gt; Signed-off-by: Zhouyang Jia &lt;<a href=3D"mailto:jiazhouyang09@gmail.=
com">jiazhouyang09@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 drivers/xen/manage.c | 17 ++++++++++++++---<br>
&gt;=C2=A0 1 file changed, 14 insertions(+), 3 deletions(-)<br>
&gt;<br>
&gt; diff --git a/drivers/xen/manage.c b/drivers/xen/manage.c<br>
&gt; index 8835065..159694d 100644<br>
&gt; --- a/drivers/xen/manage.c<br>
&gt; +++ b/drivers/xen/manage.c<br>
&gt; @@ -289,8 +289,15 @@ static void sysrq_handler(struct xenbus_watch *wa=
tch, const char *path,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 =C2=A0if (sysrq_key !=3D &#39;\0&#39;)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0xenbus_printf(xbt, &q=
uot;control&quot;, &quot;sysrq&quot;, &quot;%c&quot;, &#39;\0&#39;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (sysrq_key !=3D &#39;\0&#39;) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0err =3D xenbus_printf=
(xbt, &quot;control&quot;, &quot;sysrq&quot;, &quot;%c&quot;, &#39;\0&#39;)=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (err) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0pr_err(&quot;Error %d writing sysrq code in control/sysrq\n&quot;,<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 err);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0xenbus_transaction_end(xbt, 1);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0return;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0err =3D xenbus_transaction_end(xbt, 0);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (err =3D=3D -EAGAIN)<br>
&gt; @@ -342,7 +349,11 @@ static int setup_shutdown_watcher(void)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0continue;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0snprintf(node, F=
EATURE_PATH_SIZE, &quot;feature-%s&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 shutdown_handlers[idx].<wbr>command);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0xenbus_printf(XBT_NIL=
, &quot;control&quot;, node, &quot;%u&quot;, 1);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0err =3D xenbus_printf=
(XBT_NIL, &quot;control&quot;, node, &quot;%u&quot;, 1);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (err) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0pr_err(&quot;Error %d writing %s\n&quot;, err, node);<br>
<br>
<br>
</div></div>Adding __func__ will make it it easier trying to understand whe=
re the<br>
error is coming from. And for consistency, I&#39;d add it to the one above<=
br>
as well.<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
<br>
-boris<br>
<br>
</font></span></blockquote></div><br></div>

--0000000000005d7f2e056ea287ec--


--===============7108156742701241121==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7108156742701241121==--
