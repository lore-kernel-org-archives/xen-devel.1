From: Mirela Simonovic <mirela.simonovic@aggios.com>
Subject: Re: [PATCH 00/18] xen/arm64: Suspend to RAM support for
 Xen
Date: Mon, 12 Nov 2018 13:01:26 +0100
Message-ID: <CAKPH-Nix2bzEfqXvXd=aJxxt6hK_hO07PP51EWEBkHb-NPsPiw@mail.gmail.com>
References: <1542022244-22977-1-git-send-email-mirela.simonovic@aggios.com>
 <5bf8c357-ca42-09af-411c-fabec631c6b2@arm.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4019096845443238003=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5bf8c357-ca42-09af-411c-fabec631c6b2@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Xen Devel <xen-devel@lists.xen.org>, Davorin Mista <dm@aggios.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Saeed Nowshadi <saeed.nowshadi@xilinx.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Dario Faggioli <dfaggioli@suse.com>, Stefano Stabellini <stefano.stabellini@xilinx.com>
List-Id: xen-devel@lists.xenproject.org

--===============4019096845443238003==
Content-Type: multipart/alternative; boundary="00000000000098106f057a7676a5"

--00000000000098106f057a7676a5
Content-Type: text/plain; charset="UTF-8"

Hi Julien,

On Mon, Nov 12, 2018 at 12:50 PM Julien Grall <julien.grall@arm.com> wrote:

> Hi Mirela,
>
> Thank you for posting the series. Could you provide a branch with the
> patch applied?
>
>
I have applied patches on top of upstream/staging.


> On 11/12/18 11:30 AM, Mirela Simonovic wrote:
> >
> --------------------------------------------------------------------------------
> > The series does not include:
> > a) UART driver-specific suspend/resume that gets called when console
> suspends
>
> I feel it will be difficult to test this series without UART driver
> support. Would it be possible to integrate them in that series?
>
>
Yes that's possible, but you'll need more than a UART driver's
suspend/resume to test this. E.g. for testing the series on Xilinx
Ultrascale+ MPSoC we need a set of patches that provides the basic platform
support needed to boot, which is not yet upstreamed. Luckily, the suspend
support is independent (ARM specific).
Please let me check with Xilinx people and Stefano how to deal with this,
and I'll come back with a real answer.

Thanks,
Mirela


> Cheers,
>
> --
> Julien Grall
>

--00000000000098106f057a7676a5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Julien,<div><br><div class=3D"gmail_quote"><div dir=3D"=
ltr">On Mon, Nov 12, 2018 at 12:50 PM Julien Grall &lt;<a href=3D"mailto:ju=
lien.grall@arm.com">julien.grall@arm.com</a>&gt; wrote:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex">Hi Mirela,<br>
<br>
Thank you for posting the series. Could you provide a branch with the <br>
patch applied?<br>
<br></blockquote><div><br></div><div>I have applied patches on top of upstr=
eam/staging.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
On 11/12/18 11:30 AM, Mirela Simonovic wrote:<br>
&gt; ----------------------------------------------------------------------=
----------<br>
&gt; The series does not include:<br>
&gt; a) UART driver-specific suspend/resume that gets called when console s=
uspends<br>
<br>
I feel it will be difficult to test this series without UART driver <br>
support. Would it be possible to integrate them in that series?<br>
<br></blockquote><div><br></div><div>Yes that&#39;s possible, but you&#39;l=
l need more than a UART driver&#39;s suspend/resume to test this. E.g. for =
testing the series on Xilinx Ultrascale+ MPSoC we need a set of patches tha=
t provides the basic platform support needed to boot, which is not yet upst=
reamed. Luckily, the suspend support is independent (ARM specific).</div><d=
iv>Please let me check with Xilinx people and Stefano how to deal with this=
, and I&#39;ll come back with a real answer.</div><div><br></div><div>Thank=
s,</div><div>Mirela</div><div>=C2=A0</div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
Cheers,<br>
<br>
-- <br>
Julien Grall<br>
</blockquote></div></div></div>

--00000000000098106f057a7676a5--


--===============4019096845443238003==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4019096845443238003==--
