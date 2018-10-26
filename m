From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Subject: Re: Ongoing/future speculative mitigation work
Date: Fri, 26 Oct 2018 06:01:46 -0600
Message-ID: <CABfawhnC-BLRnRQ9Rx9Jgt+runtA4JX-MyF7akcjhU9iGHx8gA@mail.gmail.com>
References: <e3219697-0759-39fc-2486-715cdec1ca9e@citrix.com>
 <CABfawh=GYUi2nvx5Nc1xfu7McVSqCwYOMyA6fyCKgYJCGCRkXA@mail.gmail.com>
 <7079d0ee-a8ef-e164-12d9-8e3bfef81491@citrix.com>
 <03e84c44-2c33-b00f-bdfc-3c6b57123bfb@citrix.com>
 <CABfawhn6Cdv7HK6pbzEj-013wXwouOuzpOpiw5L-_WV=F4e0Bw@mail.gmail.com>
 <f1e40a27-c0c4-c3bd-eb43-1fb314ec20ac@citrix.com>
 <CABfawhnbPfqeXM01=9_55dOzYAkgEcPk4+YqieN-Ab_3OA=v0Q@mail.gmail.com>
 <5c251189-cfb7-a36a-5a33-fd661771c9c0@citrix.com>
 <CABfawhkkwkC3itQMuqVX1aHSD8ysYCckUi0URVy5kQfZFtjugA@mail.gmail.com>
 <7b2ff44127f10b0d01e8ed8865c71206c1a8f2f4.camel@suse.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6305505399509494771=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <7b2ff44127f10b0d01e8ed8865c71206c1a8f2f4.camel@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Dario Faggioli <dfaggioli@suse.com>
Cc: mpohlack@amazon.de, Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>, joao.m.martins@oracle.com, Stefano Stabellini <sstabellini@kernel.org>, Daniel Kiper <daniel.kiper@oracle.com>, =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, aliguori@amazon.com, uwed@amazon.de, Lars Kurth <lars.kurth@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, ross.philipson@oracle.com, George Dunlap <george.dunlap@citrix.com>, Matt Wilson <msw@amazon.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, JGross@suse.com, sergey.dyasli@citrix.com, Wei Liu <wei.liu2@citrix.com>, George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xen.org>, mdontu <mdontu@bitdefender.com>, dwmw@amazon.co.uk, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

--===============6305505399509494771==
Content-Type: multipart/alternative; boundary="00000000000084515d0579207cdc"

--00000000000084515d0579207cdc
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 26, 2018, 1:49 AM Dario Faggioli <dfaggioli@suse.com> wrote:

> On Thu, 2018-10-25 at 12:35 -0600, Tamas K Lengyel wrote:
> > On Thu, Oct 25, 2018 at 12:13 PM Andrew Cooper
> > <andrew.cooper3@citrix.com> wrote:
> > >
> > > TBH, I'd perhaps start with an admin control which lets them switch
> > > between the two modes, and some instructions on how/why they might
> > > want
> > > to try switching.
> > >
> > > Trying to second-guess the best HT setting automatically is most
> > > likely
> > > going to be a lost cause.  It will be system specific as to whether
> > > the
> > > same workload is better with or without HT.
> >
> > This may just not be practically possible at the end as the system
> > administrator may have no idea what workload will be running on any
> > given system. It may also vary between one user to the next on the
> > same system, without the users being allowed to tune such details of
> > the system. If we can show that with core-scheduling deployed for
> > most
> > workloads performance is improved by x % it may be a safe option.
> >
> I haven't done this kind of benchmark yet, but I'd say that, if every
> vCPU of every domain is doing 100% CPU intensive work, core-scheduling
> isn't going to make much difference, or help you much, as compared to
> regular scheduling with hyperthreading enabled.
>

Understood, we actually went into the this with the assumption that in such
cases core-scheduling would underperform plain credit1. The idea was to
measure the worst case with plain scheduling and with core-scheduling to be
able to see the difference clearly between the two.


> Actual numbers may vary depending on whether VMs have odd or even
> number of vCPUs but, e.g., on hardware with 2 threads per core, and
> using VMs with at least 2 vCPUs each, the _perfect_ implementation of
> core-scheduling would still manage to keep all the *threads* busy,
> which is --as far as our speculations currently go-- what is causing
> the performance degradation you're seeing.
>
> So, again, if it is confirmed that this workload of yours is a
> particularly bad one for SMT, then you are just better off disabling
> hyperthreading. And, no, I don't think such a situation is common
> enough to say "let's disable for everyone by default".
>

I wasn't asking to make it the default in Xen but if we make it the default
for our deployment where such workloads are entirely possible, would that
be reasonable. Again, we don't know the workload and we can't predict it.
We were hoping to use core-scheduling eventually but it was not expected
that hyperthreading can cause such drops in performance. If there are tests
that I can run which are the "best case" for hyperthreading, I would like
to repeat those tests to see where we are.

Thanks,
Tamas

--00000000000084515d0579207cdc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr">=
On Fri, Oct 26, 2018, 1:49 AM Dario Faggioli &lt;<a href=3D"mailto:dfaggiol=
i@suse.com">dfaggioli@suse.com</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding=
-left:1ex">On Thu, 2018-10-25 at 12:35 -0600, Tamas K Lengyel wrote:<br>
&gt; On Thu, Oct 25, 2018 at 12:13 PM Andrew Cooper<br>
&gt; &lt;<a href=3D"mailto:andrew.cooper3@citrix.com" target=3D"_blank" rel=
=3D"noreferrer">andrew.cooper3@citrix.com</a>&gt; wrote:<br>
&gt; &gt; <br>
&gt; &gt; TBH, I&#39;d perhaps start with an admin control which lets them =
switch<br>
&gt; &gt; between the two modes, and some instructions on how/why they migh=
t<br>
&gt; &gt; want<br>
&gt; &gt; to try switching.<br>
&gt; &gt; <br>
&gt; &gt; Trying to second-guess the best HT setting automatically is most<=
br>
&gt; &gt; likely<br>
&gt; &gt; going to be a lost cause.=C2=A0 It will be system specific as to =
whether<br>
&gt; &gt; the<br>
&gt; &gt; same workload is better with or without HT.<br>
&gt; <br>
&gt; This may just not be practically possible at the end as the system<br>
&gt; administrator may have no idea what workload will be running on any<br=
>
&gt; given system. It may also vary between one user to the next on the<br>
&gt; same system, without the users being allowed to tune such details of<b=
r>
&gt; the system. If we can show that with core-scheduling deployed for<br>
&gt; most<br>
&gt; workloads performance is improved by x % it may be a safe option. <br>
&gt;<br>
I haven&#39;t done this kind of benchmark yet, but I&#39;d say that, if eve=
ry<br>
vCPU of every domain is doing 100% CPU intensive work, core-scheduling<br>
isn&#39;t going to make much difference, or help you much, as compared to<b=
r>
regular scheduling with hyperthreading enabled.<br></blockquote></div></div=
><div dir=3D"auto"><br></div><div dir=3D"auto">Understood, we actually went=
 into the this with the assumption that in such cases core-scheduling would=
 underperform plain credit1. The idea was to measure the worst case with pl=
ain scheduling and with core-scheduling to be able to see the difference cl=
early between the two.</div><div dir=3D"auto"><br></div><div dir=3D"auto"><=
div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
Actual numbers may vary depending on whether VMs have odd or even<br>
number of vCPUs but, e.g., on hardware with 2 threads per core, and<br>
using VMs with at least 2 vCPUs each, the _perfect_ implementation of<br>
core-scheduling would still manage to keep all the *threads* busy,<br>
which is --as far as our speculations currently go-- what is causing<br>
the performance degradation you&#39;re seeing.<br>
<br>
So, again, if it is confirmed that this workload of yours is a<br>
particularly bad one for SMT, then you are just better off disabling<br>
hyperthreading. And, no, I don&#39;t think such a situation is common<br>
enough to say &quot;let&#39;s disable for everyone by default&quot;.<br></b=
lockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">I wasn&=
#39;t asking to make it the default in Xen but if we make it the default fo=
r our deployment where such workloads are entirely possible, would that be =
reasonable. Again, we don&#39;t know the workload and we can&#39;t predict =
it. We were hoping to use core-scheduling eventually but it was not expecte=
d that hyperthreading can cause such drops in performance. If there are tes=
ts that I can run which are the &quot;best case&quot; for hyperthreading, I=
 would like to repeat those tests to see where we are.</div><div dir=3D"aut=
o"><br></div><div dir=3D"auto">Thanks,</div><div dir=3D"auto">Tamas</div></=
div>

--00000000000084515d0579207cdc--


--===============6305505399509494771==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6305505399509494771==--
