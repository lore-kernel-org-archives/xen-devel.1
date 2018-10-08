From: Omkar Bolla <omkar.bolla@pathpartnertech.com>
Subject: Re: Xen PV: Sample new PV driver for buffer sharing
 between domains
Date: Mon, 8 Oct 2018 14:42:46 +0530
Message-ID: <CAC4nxbuY0vJd8o6Vj9E14m2-sw3JZ5Spbiz3vbq2K0RQhK9p3w@mail.gmail.com>
References: <CAC4nxbvWUpWQcUATQswoaVJfSq8EU7CH6-Jx1VwVGYVeOc0tZw@mail.gmail.com>
 <B9D01323-5CE0-4CAE-9A7C-2B1CE482A833@xenproject.org>
 <aebd40b7-e7d2-c861-b658-863b2c8f2079@gmail.com>
 <f688cda0-a342-0b66-fb5c-56238d941f9c@suse.com>
 <f8ae32f3-8399-24d3-fe1e-45d4c1669e1b@epam.com>
 <CAC4nxbvh6LA=t2iEdiw2UrqrQP3Zf2NtRcViJ1YNGZkyLZqYHg@mail.gmail.com>
 <d130b853-0e33-ecb7-5598-d99791a5f2bf@suse.com>
 <CAC4nxbuTQ1uP6rKiCAp7hDe-ygq9LKHQw8ggVM+fOVH-VvU8Tw@mail.gmail.com>
 <d2b9cd5a-2768-60bd-07bd-2055d1490399@suse.com>
 <CAC4nxbsBox=FgCBx5KwkkvCHwyX2MvBGoGpa1sDyS2cF0itT=Q@mail.gmail.com>
 <074697de-7265-a1fb-2970-4128a58f09ca@arm.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5393840344891366416=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <074697de-7265-a1fb-2970-4128a58f09ca@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: jgross@suse.com, xen-devel@lists.xensource.com, Oleksandr_Andrushchenko@epam.com, Oleksandr Andrushchenko <andr2000@gmail.com>, Lars Kurth <lars.kurth.xen@gmail.com>, Stefano Stabellini <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

--===============5393840344891366416==
Content-Type: multipart/alternative; boundary="000000000000ef8e4d0577b40634"

--000000000000ef8e4d0577b40634
Content-Type: text/plain; charset="UTF-8"

Hi,

Sorry for late response,

On Wed, Oct 3, 2018 at 3:23 PM Julien Grall <julien.grall@arm.com> wrote:

>
>
> On 10/02/2018 11:03 AM, Omkar Bolla wrote:
> > Hi,
> >
> > Thanks,
> > Basic state change is working now, after using above script.
> >
> > As I said, I want to share buffer between two domains.
> > Could you please suggest outlines, how can I share buffer between 2
> > domains(Guest and Host)?
>
> My question on a previous e-mail was left unanswered. Do you have
> requirements to share the buffer dynamically?
>
> Yes, I want to share buffer dynamically but not more than 1024 bytes.

> If not, you may want to have a look at "Allow setting up shared memory
> areas between VMs from xl config files" [2]. We aim to merge it in the
> next Xen release.
>
> Cheers,
>
> [2] https://lists.xen.org/archives/html/xen-devel/2018-08/msg00883.html
>
> This is also okay, but problem here is I am using 4.8 stable  xen because
it  is working on Hkey960(ArmV8)
Is there any other way to share buffer dynamically?

> This message contains confidential information and is intended only for
> > the individual(s) named.If you are not the intended recipient, you are
> > notified that disclosing, copying, distributing or taking any action in
> > reliance on the contents of this mail and attached file/s is strictly
> > prohibited. Please notify the sender immediately and delete this e-mail
> > from your system. E-mail transmission cannot be guaranteed to be secured
> > or error-free as information could be intercepted, corrupted, lost,
> > destroyed, arrive late or incomplete, or contain viruses. The sender
> > therefore does not accept liability for any errors or omissions in the
> > contents of this message, which arise as a result of e-mail transmission.
> >
>
> Please configure your client to remove your disclaimer company.
>
I am looking into settings, to remove disclaimer.

>
> Cheers,
>
> --
> Julien Grall
>

Thanks,
Omkar B

-- 






This
message contains confidential information and is intended only 
for the
individual(s) named. If you are not the intended
recipient, you are 
notified that disclosing, copying, distributing or taking any
action in 
reliance on the contents of this mail and attached file/s is strictly

prohibited. Please notify the
sender immediately and delete this e-mail 
from your system. E-mail transmission
cannot be guaranteed to be secured or 
error-free as information could be
intercepted, corrupted, lost, destroyed, 
arrive late or incomplete, or contain
viruses. The sender therefore does 
not accept liability for any errors or
omissions in the contents of this 
message, which arise as a result of e-mail
transmission.

--000000000000ef8e4d0577b40634
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"color:#0b5394">Hi,</=
div><div class=3D"gmail_default" style=3D"color:#0b5394"><br></div><div cla=
ss=3D"gmail_default" style=3D"color:#0b5394">Sorry for late response,</div>=
<br><div class=3D"gmail_quote"><div dir=3D"ltr">On Wed, Oct 3, 2018 at 3:23=
 PM Julien Grall &lt;<a href=3D"mailto:julien.grall@arm.com">julien.grall@a=
rm.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
<br>
On 10/02/2018 11:03 AM, Omkar Bolla wrote:<br>
&gt; Hi,<br>
&gt; <br>
&gt; Thanks,<br>
&gt; Basic state change is working now, after using above script.<br>
&gt; <br>
&gt; As I said, I want to share buffer between two domains.<br>
&gt; Could you please suggest outlines, how can I share buffer between 2 <b=
r>
&gt; domains(Guest and Host)?<br>
<br>
My question on a previous e-mail was left unanswered. Do you have <br>
requirements to share the buffer dynamically?<br>
<br></blockquote><div class=3D"gmail_default" style=3D"color:rgb(11,83,148)=
">Yes, I want to share buffer dynamically but not more than 1024 bytes.</di=
v><div class=3D"gmail_default" style=3D"color:rgb(11,83,148)"></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex">
If not, you may want to have a look at &quot;Allow setting up shared memory=
 <br>
areas between VMs from xl config files&quot; [2]. We aim to merge it in the=
 <br>
next Xen release.<br>
<br>
Cheers,<br>
<br>
[2] <a href=3D"https://lists.xen.org/archives/html/xen-devel/2018-08/msg008=
83.html" rel=3D"noreferrer" target=3D"_blank">https://lists.xen.org/archive=
s/html/xen-devel/2018-08/msg00883.html</a><br>
<br></blockquote><div><span class=3D"gmail_default" style=3D"color:rgb(11,8=
3,148)">This is also okay, but problem here is I am using 4.8 stable=C2=A0 =
xen because it=C2=A0 is working on Hkey960(ArmV8)</span></div><div><span cl=
ass=3D"gmail_default" style=3D"color:rgb(11,83,148)">Is there any other way=
 to share buffer dynamically?</span></div><div><span class=3D"gmail_default=
" style=3D"color:rgb(11,83,148)"><br></span></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex">
&gt; This message contains confidential information and is intended only fo=
r <br>
&gt; the individual(s) named.If you are not the intended recipient, you are=
 <br>
&gt; notified that disclosing, copying, distributing or taking any action i=
n <br>
&gt; reliance on the contents of this mail and attached file/s is strictly=
=C2=A0 <br>
&gt; prohibited. Please notify the sender immediately and delete this e-mai=
l <br>
&gt; from your system. E-mail transmission cannot be guaranteed to be secur=
ed <br>
&gt; or error-free as information could be intercepted, corrupted, lost, <b=
r>
&gt; destroyed, arrive late or incomplete, or contain viruses. The sender <=
br>
&gt; therefore does not accept liability for any errors or omissions in the=
 <br>
&gt; contents of this message, which arise as a result of e-mail transmissi=
on.<br>
&gt; <br>
<br>
Please configure your client to remove your disclaimer company.<br></blockq=
uote><div><span class=3D"gmail_default" style=3D"color:rgb(11,83,148)">I am=
 looking into settings, to remove disclaimer.</span>=C2=A0</div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc soli=
d;padding-left:1ex">
<br>
Cheers,<br>
<br>
-- <br>
Julien Grall<br></blockquote><div><br></div><div class=3D"gmail_default" st=
yle=3D"color:rgb(11,83,148)">Thanks,</div><div class=3D"gmail_default" styl=
e=3D"color:rgb(11,83,148)">Omkar B</div></div></div>

<br>




<p><span lang=3D"EN-IN">This
message contains confidential information and is intended only for the
individual(s) named.</span><span lang=3D"EN-IN"> </span>If you are not the =
intended
recipient, you are notified that disclosing, copying, distributing or takin=
g any
action in reliance on the contents of this mail and attached file/s is stri=
ctly
prohibited<span lang=3D"EN-IN">. Please notify the
sender immediately and delete this e-mail from your system. E-mail transmis=
sion
cannot be guaranteed to be secured or error-free as information could be
intercepted, corrupted, lost, destroyed, arrive late or incomplete, or cont=
ain
viruses. The sender therefore does not accept liability for any errors or
omissions in the contents of this message, which arise as a result of e-mai=
l
transmission.</span></p>
--000000000000ef8e4d0577b40634--


--===============5393840344891366416==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5393840344891366416==--
