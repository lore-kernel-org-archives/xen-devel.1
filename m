From: Omkar Bolla <omkar062@gmail.com>
Subject: Re: Xen support on ARM64
Date: Tue, 4 Dec 2018 12:50:52 +0530
Message-ID: <CAKPiPDqu9nbNk6gNQVw4ao29GKk_+m2WwCS=5bhaBi_Gmawaww@mail.gmail.com>
References: <CAKPiPDrgwFCM4ic=O1uUaHgN-WoYMwuOtxtgLSWzhy3d2MYr2A@mail.gmail.com>
 <d2dd6717-de9d-1fbf-08db-f013cca5207c@arm.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8137123950361767286=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <d2dd6717-de9d-1fbf-08db-f013cca5207c@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: julien.grall@arm.com
Cc: xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

--===============8137123950361767286==
Content-Type: multipart/alternative; boundary="000000000000b525d0057c2d1b1d"

--000000000000b525d0057c2d1b1d
Content-Type: text/plain; charset="UTF-8"

Hi Julien,

Awesome, after applying those patches in latest xen, hikey960 able to
enable 4 CPUs and other four CPUs are giving error -5.
And after using "hmp-unsafe" in xen command line, all CPUs got enabled
successfully.

Thank you,
Omkar B

On Mon, Dec 3, 2018 at 7:27 PM Julien Grall <julien.grall@arm.com> wrote:

>
>
> On 29/11/2018 07:39, Omkar Bolla wrote:
> > Hi,
>
> Hello,
>
> > I just wanted to run xen hypervisor on ARMv8 architecture, I tried on
> Hikey960
> > platform which has armv8, but latest xen giving cpu errors.
> >
> > Could you please tell me, on which platforms latest xen is working?
>
> If your platform supports virtualization. Then there are a good chance for
> Xen
> to boot on it out-of-box. So what platform are you looking at?
>
> Regarding the hikey960, there are patches on the ML to fix boot. See [1].
>
> Cheers,
>
> [1]
> https://lists.xenproject.org/archives/html/xen-devel/2018-11/msg03360.html
>
> --
> Julien Grall
>

--000000000000b525d0057c2d1b1d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Hi Julien,</div><div><br></div><div>=
<div>Awesome, after applying those patches in latest xen, hikey960 able to =
enable 4 CPUs and other four CPUs are giving error -5.</div></div><div>And =
after using &quot;hmp-unsafe&quot; in xen command line, all CPUs got enable=
d successfully.</div><div><br></div><div>Thank you,</div><div>Omkar B<br></=
div></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Mon, Dec=
 3, 2018 at 7:27 PM Julien Grall &lt;<a href=3D"mailto:julien.grall@arm.com=
">julien.grall@arm.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x"><br>
<br>
On 29/11/2018 07:39, Omkar Bolla wrote:<br>
&gt; Hi,<br>
<br>
Hello,<br>
<br>
&gt; I just wanted to run xen hypervisor on ARMv8 architecture, I tried on =
Hikey960 <br>
&gt; platform which has armv8, but latest xen giving cpu errors.<br>
&gt; <br>
&gt; Could you please tell me, on which platforms latest xen is working?<br=
>
<br>
If your platform supports virtualization. Then there are a good chance for =
Xen <br>
to boot on it out-of-box. So what platform are you looking at?<br>
<br>
Regarding the hikey960, there are patches on the ML to fix boot. See [1].<b=
r>
<br>
Cheers,<br>
<br>
[1] <a href=3D"https://lists.xenproject.org/archives/html/xen-devel/2018-11=
/msg03360.html" rel=3D"noreferrer" target=3D"_blank">https://lists.xenproje=
ct.org/archives/html/xen-devel/2018-11/msg03360.html</a><br>
<br>
-- <br>
Julien Grall<br>
</blockquote></div>

--000000000000b525d0057c2d1b1d--


--===============8137123950361767286==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8137123950361767286==--
