From: Kun Cheng <chengkunck@gmail.com>
Subject: Re: need help when libxenlight.so is used
Date: Tue, 15 May 2018 11:20:25 +0800
Message-ID: <CAO3v1VTcafDJERqegsdJ3giPFjeVBw7FppJaduPLfPheVr9Vdw@mail.gmail.com>
References: <CAO3v1VT9Hu2vxnNtFKZ1npaau9tZ4NJ6rXk2TAF0govFW2unqQ@mail.gmail.com>
 <20180514171150.slb5igos6nbwhwgy@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8711422488862124479=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180514171150.slb5igos6nbwhwgy@citrix.com>
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

--===============8711422488862124479==
Content-Type: multipart/alternative; boundary="00000000000003fd08056c361616"

--00000000000003fd08056c361616
Content-Type: text/plain; charset="UTF-8"

Thank you, Wei.
I have solved it.  The error accured as 'ctx' was not correctly initailized.

On Tue, May 15, 2018 at 1:11 AM Wei Liu <wei.liu2@citrix.com> wrote:

> On Sat, May 12, 2018 at 08:55:46PM +0800, Kun Cheng wrote:
> > Hello Xen devs,
> >
> > I'm learning code in xen-4.10.0/tools/xl to find out how to program with
> > libxl.
> >
> > I've trying to use libxenlight.so (compiled and installed from xen 4.10.0
> > source code) to control my vms from my own code until I met this issue.
> > Now my test code follows xl_vmmcontrol.c and tries to create a VM from
> its
> > config file (file can be used to successfully create a vm with 'xl
> create').
> >
> > My Xen make is successful and I can use 'xl' to manage all vms.
> >
> > When I test my own code, I got such an error in dmesg"
> >
> > test[16678]: segfault at 18 ip 00007f69fa6526ad sp 00007ffe1eadedf0
> error 4
> > in libxenlight.so.4.10.0[7f69fa61a000+bc000] in dmesg
> >
> > and also segmentation fault in my terminal.
> >
> > I dumped my debugging info, hoping could give everyone some clue.
> >
> > FYI, my program was compiled with:
> >
> > gcc -m64 -pthread -std=gnu99  -g xl_executor.c xl_parse.c  xl_utils.c
> > xl_nic.c -lxenlight -lxlutil -lxentoollog  -lyajl  -o test
> >
> > where xl_executor.c is my code of creating a vm, all other c file are
> > copied from tools/xl/
> >
> > GDB bebugging info:
> >
> > Breakpoint 3, parse_config_data (config_source=0x7fffffffe360
> > "/data/chengkun/vms/vm4/vm4.cfg",
> >     config_data=0x6155f0 "# ", '=' <repeats 69 times>, "\n# Example HVM
> > guest configuration\n# ", '=' <repeats 69 times>, "\n#\n# This is a
> fairly
> > m"..., config_len=1543,
> >     d_config=0x7fffffffdde0) at xl_parse.c:993
> >
> > 993         if (libxl_cpu_bitmap_alloc(ctx, &b_info->avail_vcpus, l)) {
> >
>
> One possibility: you didn't follow the convention of using libxl types,
> which means you get memory corruption all over the place.
>
> See  libxl.h:L490 for more information.
>
> But for a more likely explanation, see below.
>
> >     gic_version = LIBXL_GIC_VERSION_DEFAULT, vuart =
> > LIBXL_VUART_TYPE_UNKNOWN}, altp2m = LIBXL_ALTP2M_MODE_DISABLED}
> >
> > (gdb) p ctx
> > $5 = (libxl_ctx *) 0x0
>
> A NULL pointer? See xl.c:xl_ctx_alloc.
>
> Wei.
>

--00000000000003fd08056c361616
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thank you, Wei.</div>I have solved it.=C2=A0 The erro=
r accured as &#39;ctx&#39; was not correctly initailized.</div><br><div cla=
ss=3D"gmail_quote"><div dir=3D"ltr">On Tue, May 15, 2018 at 1:11 AM Wei Liu=
 &lt;<a href=3D"mailto:wei.liu2@citrix.com">wei.liu2@citrix.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex">On Sat, May 12, 2018 at 08:55:4=
6PM +0800, Kun Cheng wrote:<br>
&gt; Hello Xen devs,<br>
&gt; <br>
&gt; I&#39;m learning code in xen-4.10.0/tools/xl to find out how to progra=
m with<br>
&gt; libxl.<br>
&gt; <br>
&gt; I&#39;ve trying to use libxenlight.so (compiled and installed from xen=
 4.10.0<br>
&gt; source code) to control my vms from my own code until I met this issue=
.<br>
&gt; Now my test code follows xl_vmmcontrol.c and tries to create a VM from=
 its<br>
&gt; config file (file can be used to successfully create a vm with &#39;xl=
 create&#39;).<br>
&gt; <br>
&gt; My Xen make is successful and I can use &#39;xl&#39; to manage all vms=
.<br>
&gt; <br>
&gt; When I test my own code, I got such an error in dmesg&quot;<br>
&gt; <br>
&gt; test[16678]: segfault at 18 ip 00007f69fa6526ad sp 00007ffe1eadedf0 er=
ror 4<br>
&gt; in libxenlight.so.4.10.0[7f69fa61a000+bc000] in dmesg<br>
&gt; <br>
&gt; and also segmentation fault in my terminal.<br>
&gt; <br>
&gt; I dumped my debugging info, hoping could give everyone some clue.<br>
&gt; <br>
&gt; FYI, my program was compiled with:<br>
&gt; <br>
&gt; gcc -m64 -pthread -std=3Dgnu99=C2=A0 -g xl_executor.c xl_parse.c=C2=A0=
 xl_utils.c<br>
&gt; xl_nic.c -lxenlight -lxlutil -lxentoollog=C2=A0 -lyajl=C2=A0 -o test<b=
r>
&gt; <br>
&gt; where xl_executor.c is my code of creating a vm, all other c file are<=
br>
&gt; copied from tools/xl/<br>
&gt; <br>
&gt; GDB bebugging info:<br>
&gt; <br>
&gt; Breakpoint 3, parse_config_data (config_source=3D0x7fffffffe360<br>
&gt; &quot;/data/chengkun/vms/vm4/vm4.cfg&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0config_data=3D0x6155f0 &quot;# &quot;, &#39;=3D&#39=
; &lt;repeats 69 times&gt;, &quot;\n# Example HVM<br>
&gt; guest configuration\n# &quot;, &#39;=3D&#39; &lt;repeats 69 times&gt;,=
 &quot;\n#\n# This is a fairly<br>
&gt; m&quot;..., config_len=3D1543,<br>
&gt;=C2=A0 =C2=A0 =C2=A0d_config=3D0x7fffffffdde0) at xl_parse.c:993<br>
&gt; <br>
&gt; 993=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (libxl_cpu_bitmap_alloc(ctx, &=
amp;b_info-&gt;avail_vcpus, l)) {<br>
&gt; <br>
<br>
One possibility: you didn&#39;t follow the convention of using libxl types,=
<br>
which means you get memory corruption all over the place.<br>
<br>
See=C2=A0 libxl.h:L490 for more information.<br>
<br>
But for a more likely explanation, see below.<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0gic_version =3D LIBXL_GIC_VERSION_DEFAULT, vuart =
=3D<br>
&gt; LIBXL_VUART_TYPE_UNKNOWN}, altp2m =3D LIBXL_ALTP2M_MODE_DISABLED}<br>
&gt; <br>
&gt; (gdb) p ctx<br>
&gt; $5 =3D (libxl_ctx *) 0x0<br>
<br>
A NULL pointer? See xl.c:xl_ctx_alloc.<br>
<br>
Wei.<br>
</blockquote></div>

--00000000000003fd08056c361616--


--===============8711422488862124479==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8711422488862124479==--
