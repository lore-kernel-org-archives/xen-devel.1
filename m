From: Julien Grall <julien.grall@gmail.com>
Subject: Re: RT Xen on ARM - R-Car series
Date: Sat, 16 Feb 2019 09:42:48 +0100
Message-ID: <CAF3u54A+esD9t2n8spkTE8_bYmha_OwFt0NFsxBA-wZNioyj-g@mail.gmail.com>
References: <alpine.DEB.2.10.1901311345570.22962@sstabellini-ThinkPad-X260>
 <2a651c5d-3f94-378d-baf9-f52cab0cdc62@arm.com>
 <20190201165314.ofuvpddlfpzbc247@mac>
 <56b433e0-645e-997d-1bff-de3c4f7fe250@arm.com>
 <20190204125307.aft4tzkjjrxdd34o@mac>
 <fcd6618d-de13-212f-8afb-e2ef0b37396d@arm.com>
 <f045b9a9-2e1a-4d3e-b2ce-51dca97720a8@gmail.com>
 <6457d3e5-1897-d124-ba49-c6325076b393@gmail.com>
 <alpine.DEB.2.10.1902061300540.2723@sstabellini-ThinkPad-X260>
 <ffe52ce4-2fb6-d730-991e-c48c7fc10c5e@gmail.com>
 <20190207103513.ky7xnftn3pj7r2lf@mac>
 <CAF3u54ANHMf1-3=W=R3w-25JbK3_bR_mDiM888pU5UzSTKTVPg@mail.gmail.com>
 <f5c5bfeb-bca3-9601-7825-3d41d7d5e4af@gmail.com>
 <CAF3u54DiExsh-wPt-oZV-Gh56AvaLLes3PrvZDAHOxpHBLROQg@mail.gmail.com>
 <fee642a7-9a1a-53f1-b0a3-6f47ec0b15cc@gmail.com>
 <CAF3u54Dw4n+6HwyQ8-pXMNNMZbu4xVrTh9aV-WAe-XUxhoG1-g@mail.gmail.com>
 <6f9e4f72-332a-679e-e369-c81c760a31c6@gmail.com>
 <CAF3u54BOo_jsymqn_efMWrw0kPecNGSzgd9PhajwX8vato4nzQ@mail.gmail.com>
 <be9966e7-e61d-c12d-4ded-75b5220cb791@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4882395717816289366=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <be9966e7-e61d-c12d-4ded-75b5220cb791@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrii Anisov <andrii.anisov@gmail.com>
Cc: Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Xen Devel <xen-devel@lists.xen.org>, "LOPEZ,
 FUENTES NACARINO Jairo Eduardo" <jairo@ruri.waseda.jp>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

--===============4882395717816289366==
Content-Type: multipart/alternative; boundary="00000000000018ead20581fee1bf"

--00000000000018ead20581fee1bf
Content-Type: text/plain; charset="UTF-8"

On Fri, 15 Feb 2019, 18:41 Andrii Anisov, <andrii.anisov@gmail.com> wrote:

>
> On 15.02.19 19:13, Julien Grall wrote:
> > Not really... This is an implementation details that does not matter
> > on the OS side.
> And on hypervisor side?
>

My point is the interface should be the same whether we decide to keep the
runstate mapped or not. This is just an implementation details.


> > If you want accurate number, then the NOW() macro is not sufficient
> > enough. Read to CNTPCTL_EL0 can occur speculatively and out of order
> > relative to other instructions executed on the same PE. So the PE can
> > potentially execute CNTPCTL_EL0 before update_runstate_area(...).
> >
> > You would want to add an isb() at least before NOW() and potentially
> > after (unless you have register dependency).
> > I have a patch for adding an isb()  in the NOW() macro. I will send it
> later on.Good hint.
>
> >
> >>            update_runstate_area(current);
> >>
> >> +        if (current->domain->domain_id == 1)
> >> +            printk("cp = %"PRI_stime"\n", NOW()-t);
> >
> > That's only one number.  Did you do an average over multiple context
> > switch (say 1000) ?
> No, just got them on the console to see the numbers. They seems to not
> change significantly during a minute run.
>

This does not really tell me a rough number of context switch... The more,
I still don't have the full pictures on your setup as you haven't answered
to my question on the previous e-mail...

Can you please get the number of context switch and the average value?

That's why I did not answer about context switches number


Couldn't you have said that from the beginning? This is rather annoying to
have question ignored.
If you want meaningful feedback, then please start answering *all*
questions. I would have been happy if you said "I didn't do it".

I can do it in a bit more complicated way. But I do not expect I would
> encounter differences.
>

A grep and sed should help to confirm your finding. I want to be sure that
the numbers are correct and not just an impression.

Cheers,

-- 
Julien Grall

--00000000000018ead20581fee1bf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Fri, 15 Feb 2019, 18=
:41 Andrii Anisov, &lt;<a href=3D"mailto:andrii.anisov@gmail.com">andrii.an=
isov@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
On 15.02.19 19:13, Julien Grall wrote:<br>
&gt; Not really... This is an implementation details that does not matter<b=
r>
&gt; on the OS side.<br>
And on hypervisor side?<br></blockquote></div><div><br></div><div>My point =
is the interface should be the same whether we decide to keep the runstate =
mapped or not. This is just an implementation details.</div><div><br></div>=
<div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
&gt; If you want accurate number, then the NOW() macro is not sufficient<br=
>
&gt; enough. Read to CNTPCTL_EL0 can occur speculatively and out of order<b=
r>
&gt; relative to other instructions executed on the same PE. So the PE can<=
br>
&gt; potentially execute CNTPCTL_EL0 before update_runstate_area(...).<br>
&gt;=C2=A0<br>
&gt; You would want to add an isb() at least before NOW() and potentially<b=
r>
&gt; after (unless you have register dependency).<br>
&gt; I have a patch for adding an isb()=C2=A0 in the NOW() macro. I will se=
nd it later on.Good hint.<br>
<br>
&gt; <br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 update_runstate_area(curr=
ent);<br>
&gt;&gt;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (current-&gt;domain-&gt;domain_id =
=3D=3D 1)<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printk(&quot;cp =3D %&q=
uot;PRI_stime&quot;\n&quot;, NOW()-t);<br>
&gt; <br>
&gt; That&#39;s only one number.=C2=A0 Did you do an average over multiple =
context<br>
&gt; switch (say 1000) ?<br>
No, just got them on the console to see the numbers. They seems to not chan=
ge significantly during a minute run.<br></blockquote></div><div><br></div>=
<div>This does not really tell me a rough number of context switch... The m=
ore, I still don&#39;t have the full pictures on your setup as you haven&#3=
9;t answered to my question on the previous e-mail...</div><div><br></div><=
div>Can you please get the number of context switch and the average value?<=
/div><div><br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x">
That&#39;s why I did not answer about context switches number</blockquote><=
/div><div><br></div><div>Couldn&#39;t you have said that from the beginning=
? This is rather annoying to have question ignored.</div><div>If you want m=
eaningful feedback, then please start answering *all* questions. I would ha=
ve been happy if you said &quot;I didn&#39;t do it&quot;.</div><div><br></d=
iv><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
I can do it in a bit more complicated way. But I do not expect I would enco=
unter differences.<br></blockquote></div><div><br></div><div>A grep and sed=
 should help to confirm your finding. I want to be sure that the numbers ar=
e correct and not just an impression.</div><div><br></div><div>Cheers,</div=
><div><br></div><div>--=C2=A0</div><div>Julien Grall</div>

--00000000000018ead20581fee1bf--


--===============4882395717816289366==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4882395717816289366==--
