From: Mirela Simonovic <mirela.simonovic@aggios.com>
Subject: Re: [PATCH 02/18] xen/arm: Implement PSCI system
 suspend call (virtual interface)
Date: Mon, 12 Nov 2018 12:50:33 +0100
Message-ID: <CAKPH-NjKU6KvU7ZaQUXuaKYFBgKqCNO0uW2Rn2K8YVEtbew8mg@mail.gmail.com>
References: <1542022244-22977-1-git-send-email-mirela.simonovic@aggios.com>
 <1542022244-22977-3-git-send-email-mirela.simonovic@aggios.com>
 <5BE9672802000078001FAD79@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5960888566671885199=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5BE9672802000078001FAD79@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Davorin Mista <dm@aggios.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Xen Devel <xen-devel@lists.xen.org>, Julien Grall <julien.grall@arm.com>, Stefano Stabellini <stefano.stabellini@xilinx.com>, Saeed Nowshadi <saeed.nowshadi@xilinx.com>
List-Id: xen-devel@lists.xenproject.org

--===============5960888566671885199==
Content-Type: multipart/alternative; boundary="000000000000a01413057a764f4f"

--000000000000a01413057a764f4f
Content-Type: text/plain; charset="UTF-8"

What?

On Mon, Nov 12, 2018 at 12:42 PM Jan Beulich <JBeulich@suse.com> wrote:

> >>> On 12.11.18 at 12:30, <mirela.simonovic@aggios.com> wrote:
> > --- a/xen/include/xen/sched.h
> > +++ b/xen/include/xen/sched.h
> > @@ -24,6 +24,7 @@
> >  #include <xen/wait.h>
> >  #include <public/xen.h>
> >  #include <public/domctl.h>
> > +#include <public/sched.h>
> >  #include <public/sysctl.h>
> >  #include <public/vcpu.h>
> >  #include <public/vm_event.h>
>
> Why?
>
> Jan.
>
>
>

--000000000000a01413057a764f4f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">What?</div><br><div class=3D"gmail_quote"><div dir=3D"ltr"=
>On Mon, Nov 12, 2018 at 12:42 PM Jan Beulich &lt;<a href=3D"mailto:JBeulic=
h@suse.com">JBeulich@suse.com</a>&gt; wrote:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex">&gt;&gt;&gt; On 12.11.18 at 12:30, &lt;<a href=3D"mailto:mirela.s=
imonovic@aggios.com" target=3D"_blank">mirela.simonovic@aggios.com</a>&gt; =
wrote:<br>
&gt; --- a/xen/include/xen/sched.h<br>
&gt; +++ b/xen/include/xen/sched.h<br>
&gt; @@ -24,6 +24,7 @@<br>
&gt;=C2=A0 #include &lt;xen/wait.h&gt;<br>
&gt;=C2=A0 #include &lt;public/xen.h&gt;<br>
&gt;=C2=A0 #include &lt;public/domctl.h&gt;<br>
&gt; +#include &lt;public/sched.h&gt;<br>
&gt;=C2=A0 #include &lt;public/sysctl.h&gt;<br>
&gt;=C2=A0 #include &lt;public/vcpu.h&gt;<br>
&gt;=C2=A0 #include &lt;public/vm_event.h&gt;<br>
<br>
Why?<br>
<br>
Jan.<br>
<br>
<br>
</blockquote></div>

--000000000000a01413057a764f4f--


--===============5960888566671885199==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5960888566671885199==--
