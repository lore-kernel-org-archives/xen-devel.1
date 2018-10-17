From: Omkar Bolla <omkar.bolla@pathpartnertech.com>
Subject: Re: Xen PV: Sample new PV driver for buffer sharing
 between domains
Date: Wed, 17 Oct 2018 17:54:46 +0530
Message-ID: <CAC4nxbsopU7Ths1LYE1HAB8txbBv9rLGwqCgd=kQWLNDhEz6LQ@mail.gmail.com>
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
 <CAC4nxbuY0vJd8o6Vj9E14m2-sw3JZ5Spbiz3vbq2K0RQhK9p3w@mail.gmail.com>
 <c6724ce1-086f-3492-2c39-8192542ff5d8@arm.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4806630735752980086=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <c6724ce1-086f-3492-2c39-8192542ff5d8@arm.com>
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

--===============4806630735752980086==
Content-Type: multipart/alternative; boundary="0000000000001da4bb05786bc200"

--0000000000001da4bb05786bc200
Content-Type: text/plain; charset="UTF-8"

Hi,

I have started finding which patch introduced Armv8 Secondary CPUs issue.

I just want to start PV vdevb before domainU debian rootfs mount. Is it
possible?

Thanks,
Omkar B


On Mon, Oct 8, 2018 at 4:00 PM Julien Grall <julien.grall@arm.com> wrote:

>
>
> On 08/10/2018 10:12, Omkar Bolla wrote:
> > Hi,
>
> Hi,
>
> > This is also okay, but problem here is I am using 4.8 stable  xen
> > because it  is working on Hkey960(ArmV8)
>
> This is because you can't bring up secondary CPUs on the Hikey with Xen
> 4.11 [1], right? It would be nice to find where the bug was introduced
> because Xen 4.8 is out of support and does not contain the latest fixes
> (such as Meltdown/Spectre).
>
> > Is there any other way to share buffer dynamically?
> You would have to write your own PV drivers or port the series to Xen 4.8.
>
> Cheers,
>
> [1]
> https://www.mail-archive.com/xen-devel@lists.xenproject.org/msg21576.html
>
> --
> Julien Grall
>

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

--0000000000001da4bb05786bc200
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"color:#0b5394">Hi,</=
div><div class=3D"gmail_default" style=3D"color:#0b5394"><br></div><div cla=
ss=3D"gmail_default" style=3D"color:#0b5394">I have started finding which p=
atch introduced Armv8 Secondary CPUs issue.</div><div class=3D"gmail_defaul=
t" style=3D"color:#0b5394"><br></div><div class=3D"gmail_default" style=3D"=
color:#0b5394">I just want to start PV vdevb before domainU debian rootfs m=
ount. Is it possible?</div><div class=3D"gmail_default" style=3D"color:#0b5=
394"><br></div><div class=3D"gmail_default" style=3D"color:#0b5394">Thanks,=
</div><div class=3D"gmail_default" style=3D"color:#0b5394">Omkar B</div><di=
v class=3D"gmail_default" style=3D"color:#0b5394"><br></div></div><br><div =
class=3D"gmail_quote"><div dir=3D"ltr">On Mon, Oct 8, 2018 at 4:00 PM Julie=
n Grall &lt;<a href=3D"mailto:julien.grall@arm.com">julien.grall@arm.com</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
<br>
On 08/10/2018 10:12, Omkar Bolla wrote:<br>
&gt; Hi,<br>
<br>
Hi,<br>
<br>
&gt; This is also okay, but problem here is I am using 4.8 stable=C2=A0 xen=
 <br>
&gt; because it=C2=A0 is working on Hkey960(ArmV8)<br>
<br>
This is because you can&#39;t bring up secondary CPUs on the Hikey with Xen=
 <br>
4.11 [1], right? It would be nice to find where the bug was introduced <br>
because Xen 4.8 is out of support and does not contain the latest fixes <br=
>
(such as Meltdown/Spectre).<br>
<br>
&gt; Is there any other way to share buffer dynamically?<br>
You would have to write your own PV drivers or port the series to Xen 4.8.<=
br>
<br>
Cheers,<br>
<br>
[1] <br>
<a href=3D"https://www.mail-archive.com/xen-devel@lists.xenproject.org/msg2=
1576.html" rel=3D"noreferrer" target=3D"_blank">https://www.mail-archive.co=
m/xen-devel@lists.xenproject.org/msg21576.html</a><br>
<br>
-- <br>
Julien Grall<br>
</blockquote></div>

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
--0000000000001da4bb05786bc200--


--===============4806630735752980086==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4806630735752980086==--
