From: Julien Grall <julien.grall@gmail.com>
Subject: Re: Make coverity results public
Date: Thu, 29 Mar 2018 00:30:25 +0000
Message-ID: <CAF3u54DfcrUWn6hhVhQVe9xW38LRYbxTU=vjnKiW1F97MSHCDQ@mail.gmail.com>
References: <20180328133337.xlzb7vqwr4dflnlu@MacBook-Pro-de-Roger.local>
 <51636480-c21c-4f93-d2f7-0f3349f3b023@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8254875521624714506=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=z/a2=gt=gmail.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1f1LSg-0004cR-Dz
 for xen-devel@lists.xenproject.org; Thu, 29 Mar 2018 00:30:38 +0000
Received: by mail-oi0-x230.google.com with SMTP id z8-v6so3746528oix.2
 for <xen-devel@lists.xenproject.org>; Wed, 28 Mar 2018 17:30:37 -0700 (PDT)
In-Reply-To: <51636480-c21c-4f93-d2f7-0f3349f3b023@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <george.dunlap@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

--===============8254875521624714506==
Content-Type: multipart/alternative; boundary="001a113d48fe758d280568823b8f"

--001a113d48fe758d280568823b8f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

(sorry for the formatting)

On Wed, 28 Mar 2018, 21:48 George Dunlap, <george.dunlap@citrix.com> wrote:

> On 03/28/2018 02:33 PM, Roger Pau Monn=C3=A9 wrote:
> > Hello,
> >
> > According to the contribution guidelines document [0] the coverity
> > database of issues is private, which makes it hard for new people to
> > see issues. IMO it makes no sense to keep the result private anymore:
> >
> >  - They have been audited for plenty of time by different people
> >    that currently has access to the database.
> >  - Anyone can reproduce the same results by forking Xen on github and
> >    sending a build to coverity for analysis AFAICT.
> >
> > On the plus side, having the database open would allow us the
> > following:
> >
> >  - Coverity reports could be sent to xen-devel, so anyone could pick
> >    and fix new issues.
> >  - Newcomers could use coverity in order to find small size tasks to
> >    work on.
>
> In general, +1 from me.  But Stefano, was there some special
> circumstance for the ARM Coverity runs?
>

We don't control what is tested on the ARM coverity. This was setup on a
testing branch by EPAM, so they are putting their patches and update
manually.

If we want to open that coverity then we need to track staging and have
automatic push.

Otherwise it will be near to impossible to know if the failure is because
of staging or their patches.

Cheers,


>  -George
>
> _______________________________________________
> Xen-devel mailing list
> Xen-devel@lists.xenproject.org
> https://lists.xenproject.org/mailman/listinfo/xen-devel

--001a113d48fe758d280568823b8f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

(sorry for the formatting)<br><br><div class=3D"gmail_quote"><div dir=3D"lt=
r">On Wed, 28 Mar 2018, 21:48 George Dunlap, &lt;<a href=3D"mailto:george.d=
unlap@citrix.com">george.dunlap@citrix.com</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex">On 03/28/2018 02:33 PM, Roger Pau Monn=C3=A9 wrote:<=
br>
&gt; Hello,<br>
&gt;<br>
&gt; According to the contribution guidelines document [0] the coverity<br>
&gt; database of issues is private, which makes it hard for new people to<b=
r>
&gt; see issues. IMO it makes no sense to keep the result private anymore:<=
br>
&gt;<br>
&gt;=C2=A0 - They have been audited for plenty of time by different people<=
br>
&gt;=C2=A0 =C2=A0 that currently has access to the database.<br>
&gt;=C2=A0 - Anyone can reproduce the same results by forking Xen on github=
 and<br>
&gt;=C2=A0 =C2=A0 sending a build to coverity for analysis AFAICT.<br>
&gt;<br>
&gt; On the plus side, having the database open would allow us the<br>
&gt; following:<br>
&gt;<br>
&gt;=C2=A0 - Coverity reports could be sent to xen-devel, so anyone could p=
ick<br>
&gt;=C2=A0 =C2=A0 and fix new issues.<br>
&gt;=C2=A0 - Newcomers could use coverity in order to find small size tasks=
 to<br>
&gt;=C2=A0 =C2=A0 work on.<br>
<br>
In general, +1 from me.=C2=A0 But Stefano, was there some special<br>
circumstance for the ARM Coverity runs?<br></blockquote></div><div><br></di=
v><div>We don&#39;t control what is tested on the ARM coverity. This was se=
tup on a testing branch by EPAM, so they are putting their patches and upda=
te manually.</div><div><br></div><div>If we want to open that coverity then=
 we need to track staging and have automatic push.</div><div><br></div><div=
>Otherwise it will be near to impossible to know if the failure is because =
of staging or their patches.</div><div><br></div><div>Cheers,</div><div><br=
></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
=C2=A0-George<br>
<br>
_______________________________________________<br>
Xen-devel mailing list<br>
<a href=3D"mailto:Xen-devel@lists.xenproject.org" target=3D"_blank">Xen-dev=
el@lists.xenproject.org</a><br>
<a href=3D"https://lists.xenproject.org/mailman/listinfo/xen-devel" rel=3D"=
noreferrer" target=3D"_blank">https://lists.xenproject.org/mailman/listinfo=
/xen-devel</a></blockquote></div>

--001a113d48fe758d280568823b8f--


--===============8254875521624714506==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8254875521624714506==--
