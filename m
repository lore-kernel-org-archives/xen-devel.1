From: Matthew Daley <mattd@bugfuzz.com>
Subject: Re: Problems building and running Xen on Hikey960
Date: Mon, 26 Nov 2018 14:07:23 +1300
Message-ID: <CAD3CaneTvD6vy4QjisdonhxfmV37+S-=duGW3q_JFVhxJPHJHw@mail.gmail.com>
References: <CAD3CancOq7wwLGEoL6HcCc8iO2rYtGr8n68GA=e6iiqtUVGZyQ@mail.gmail.com>
 <31b037ae-0f4e-0494-7460-b0d78422e01b@arm.com>
 <CAD3CanfUmzin+jw6xHYJ=8vQ6V2DGbRXjj0LdCm7qspMtZ7Y=g@mail.gmail.com>
 <481882d7-e510-51ae-2529-8bf381b6c252@arm.com>
 <CAD3CaneTnc9VGb830sWmYU9VAuOh9wxPcOnxq2OpmFxP-h0row@mail.gmail.com>
 <6dd06247-df82-5206-5fe1-77ed41da3e96@arm.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2465177648282826500=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <6dd06247-df82-5206-5fe1-77ed41da3e96@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: julien.grall@arm.com
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Stefano Stabellini <sstabellini@kernel.org>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

--===============2465177648282826500==
Content-Type: multipart/alternative; boundary="0000000000004f6883057b86f5ae"

--0000000000004f6883057b86f5ae
Content-Type: text/plain; charset="UTF-8"

On Fri, 23 Nov 2018 at 09:51, Julien Grall <julien.grall@arm.com> wrote:

> Hi Matthew,
>
> Sorry for the late answer and thank you for testing the patch.
>
> On 11/13/18 10:43 PM, Matthew Daley wrote:
> > On Tue, 13 Nov 2018 at 02:01, Julien Grall <julien.grall@arm.com> wrote:
> >> On 11/11/18 1:15 AM, Matthew Daley wrote:
> > I gave this a go but unfortunately the same problem occurs (error
> > -9s). Just to check nothing weird is happening I added a printk to
> > check the value of __pa(init_secondary) in call_psci_cpu_on, giving
> > 0xdfe00180.
>
> I have posted a patch that disables completely the relocation [1]. Could
> you have a try and see whether it works now?
>
> Cheers,
>
> [1] https://lists.xen.org/archives/html/xen-devel/2018-11/msg02638.html
>
> --
> Julien Grall
>

Hi Julien,

Unfortunately with this patch it appears to freeze after the call
to switch_ttbr(ttbr).

- Matthew

--0000000000004f6883057b86f5ae
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>On Fri, 23 Nov 2018 at 09:51, Julien=
 Grall &lt;<a href=3D"mailto:julien.grall@arm.com">julien.grall@arm.com</a>=
&gt; wrote:<br></div></div><div class=3D"gmail_quote"><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex">Hi Matthew,<br>
<br>
Sorry for the late answer and thank you for testing the patch.<br>
<br>
On 11/13/18 10:43 PM, Matthew Daley wrote:<br>
&gt; On Tue, 13 Nov 2018 at 02:01, Julien Grall &lt;<a href=3D"mailto:julie=
n.grall@arm.com" target=3D"_blank">julien.grall@arm.com</a>&gt; wrote:<br>
&gt;&gt; On 11/11/18 1:15 AM, Matthew Daley wrote:<br>
&gt; I gave this a go but unfortunately the same problem occurs (error<br>
&gt; -9s). Just to check nothing weird is happening I added a printk to<br>
&gt; check the value of __pa(init_secondary) in call_psci_cpu_on, giving<br=
>
&gt; 0xdfe00180.<br>
<br>
I have posted a patch that disables completely the relocation [1]. Could <b=
r>
you have a try and see whether it works now?<br>
<br>
Cheers,<br>
<br>
[1] <a href=3D"https://lists.xen.org/archives/html/xen-devel/2018-11/msg026=
38.html" rel=3D"noreferrer" target=3D"_blank">https://lists.xen.org/archive=
s/html/xen-devel/2018-11/msg02638.html</a><br>
<br>
-- <br>
Julien Grall<br></blockquote><div><br></div><div>Hi Julien,<br class=3D"gma=
il-Apple-interchange-newline"></div><div><br></div>Unfortunately with this =
patch it appears to freeze after the call to=C2=A0switch_ttbr(ttbr).</div><=
div class=3D"gmail_quote"><br></div><div class=3D"gmail_quote">- Matthew</d=
iv></div>

--0000000000004f6883057b86f5ae--


--===============2465177648282826500==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2465177648282826500==--
