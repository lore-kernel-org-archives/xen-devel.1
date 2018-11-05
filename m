From: Rishi <2rushikeshj@gmail.com>
Subject: Re: Dom0 kernel 4.14 with SMP randomly crashing
Date: Mon, 5 Nov 2018 16:26:03 +0530
Message-ID: <CAO9XypWZ=Qr4Bo9Km_MUeod3cCHOnA=SonXXRF95zeeu0+RNHQ@mail.gmail.com>
References: <CAO9XypUsz-e3vmX-n5eSMz7rG2aZpDG1h03CMRAAT2X=TpZNNw@mail.gmail.com>
 <20181105101938.mj2c6l4nx5sbsk2n@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3674767924627962890=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20181105101938.mj2c6l4nx5sbsk2n@zion.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

--===============3674767924627962890==
Content-Type: multipart/alternative; boundary="000000000000e3e89a0579e8bbbe"

--000000000000e3e89a0579e8bbbe
Content-Type: text/plain; charset="UTF-8"

Nothing is getting logged. I suspect its because the kernel just goes in
halt state.

/var/log/kern.log /var/log/messages /var/log/xen/hypervisor.log

All of these files have nothing appended.

I can fetch info from kernel debugfs, if you point me to required area,


The dom0 kernel works fine without spilt of SMP code or with "nosmp" option
at xen command line.

On Mon, Nov 5, 2018 at 3:49 PM Wei Liu <wei.liu2@citrix.com> wrote:

> On Sun, Nov 04, 2018 at 06:37:36PM +0530, Rishi wrote:
> > I've built a dom0 kernel 4.14 with SMP support. The dom0 kernel crashes
> > when I'm downloading a large file on host. It does not crash if I have
> > nosmp boot option on xen command line.
> >
> > my .config SMP options are
> >
> > [root@f6029920339a wip-kernel-4.14.78]# grep SMP .config
> >
> > CONFIG_X86_64_*SMP*=y
> >
> > CONFIG_GENERIC_*SMP*_IDLE_THREAD=y
> >
> > CONFIG_*SMP*=y
> >
> > CONFIG_XEN_PV_*SMP*=y
> >
> > CONFIG_XEN_PVHVM_*SMP*=y
> >
> > # CONFIG_MAX*SMP* is not set
> >
> > CONFIG_PM_SLEEP_*SMP*=y
> >
> > CONFIG_SCSI_SAS_HOST_*SMP*=y
> >
> >
> > While comparing it to earlier kernels the options
> >
> > CONFIG_XEN_PV_*SMP*=y
> >
> > CONFIG_XEN_PVHVM_*SMP*=y
> >
> >
> > are newly introduced. Does xen need any update to better handle them?
> >
>
> Please post the kernel log when it crashed. I'm afraid Xen developers
> can't read your mind to figure out what went wrong. :-)
>
> Wei.
>

--000000000000e3e89a0579e8bbbe
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Nothing is getting logged. I suspect its because the kerne=
l just goes in halt state.<div><br></div><div>





<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">/var/log/kern.log /var/log/mess=
ages /var/log/xen/hypervisor.log<br><br><span style=3D"color:rgb(34,34,34);=
font-family:Arial,Helvetica,sans-serif;font-size:small;font-variant-ligatur=
es:normal">All of these files have nothing appended.<br></span><br><span st=
yle=3D"color:rgb(34,34,34);font-family:Arial,Helvetica,sans-serif;font-size=
:small;font-variant-ligatures:normal">I can fetch info from kernel debugfs,=
 if you point me to required area,</span><br></span></p><p class=3D"gmail-p=
1" style=3D"margin:0px;font-variant-numeric:normal;font-variant-east-asian:=
normal;font-stretch:normal;font-size:11px;line-height:normal;font-family:Me=
nlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"font-variant-ligatu=
res:no-common-ligatures"><span style=3D"color:rgb(34,34,34);font-family:Ari=
al,Helvetica,sans-serif;font-size:small;font-variant-ligatures:normal"><br>=
</span></span></p><p class=3D"gmail-p1" style=3D"margin:0px;font-variant-nu=
meric:normal;font-variant-east-asian:normal;font-stretch:normal;font-size:1=
1px;line-height:normal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"g=
mail-s1" style=3D"font-variant-ligatures:no-common-ligatures"><span style=
=3D"color:rgb(34,34,34);font-family:Arial,Helvetica,sans-serif;font-size:sm=
all;font-variant-ligatures:normal">The dom0 kernel works fine without spilt=
 of SMP code or with &quot;nosmp&quot; option at xen command line.</span></=
span></p></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Mon=
, Nov 5, 2018 at 3:49 PM Wei Liu &lt;<a href=3D"mailto:wei.liu2@citrix.com"=
>wei.liu2@citrix.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
>On Sun, Nov 04, 2018 at 06:37:36PM +0530, Rishi wrote:<br>
&gt; I&#39;ve built a dom0 kernel 4.14 with SMP support. The dom0 kernel cr=
ashes<br>
&gt; when I&#39;m downloading a large file on host. It does not crash if I =
have<br>
&gt; nosmp boot option on xen command line.<br>
&gt; <br>
&gt; my .config SMP options are<br>
&gt; <br>
&gt; [root@f6029920339a wip-kernel-4.14.78]# grep SMP .config<br>
&gt; <br>
&gt; CONFIG_X86_64_*SMP*=3Dy<br>
&gt; <br>
&gt; CONFIG_GENERIC_*SMP*_IDLE_THREAD=3Dy<br>
&gt; <br>
&gt; CONFIG_*SMP*=3Dy<br>
&gt; <br>
&gt; CONFIG_XEN_PV_*SMP*=3Dy<br>
&gt; <br>
&gt; CONFIG_XEN_PVHVM_*SMP*=3Dy<br>
&gt; <br>
&gt; # CONFIG_MAX*SMP* is not set<br>
&gt; <br>
&gt; CONFIG_PM_SLEEP_*SMP*=3Dy<br>
&gt; <br>
&gt; CONFIG_SCSI_SAS_HOST_*SMP*=3Dy<br>
&gt; <br>
&gt; <br>
&gt; While comparing it to earlier kernels the options<br>
&gt; <br>
&gt; CONFIG_XEN_PV_*SMP*=3Dy<br>
&gt; <br>
&gt; CONFIG_XEN_PVHVM_*SMP*=3Dy<br>
&gt; <br>
&gt; <br>
&gt; are newly introduced. Does xen need any update to better handle them?<=
br>
&gt; <br>
<br>
Please post the kernel log when it crashed. I&#39;m afraid Xen developers<b=
r>
can&#39;t read your mind to figure out what went wrong. :-)<br>
<br>
Wei.<br>
</blockquote></div>

--000000000000e3e89a0579e8bbbe--


--===============3674767924627962890==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3674767924627962890==--
