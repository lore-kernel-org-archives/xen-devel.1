From: Julien Grall <julien.grall@gmail.com>
Subject: Re: [PATCH 0/6] iomem cacheability
Date: Tue, 5 Mar 2019 22:45:52 +0000
Message-ID: <CAF3u54Di61CufwzwJ35sqPrBRVt2ewrmR=siDHPWA8ur29db7Q@mail.gmail.com>
References: <alpine.DEB.2.10.1902261501020.20689@sstabellini-ThinkPad-X260>
 <CABHD4K-UAuyv0Cwmk1d-SBUgGvUarWq-fsAsJATbg3r+ovGLrg@mail.gmail.com>
 <alpine.DEB.2.10.1903051321390.17552@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6700256480039020101=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hOUM=RI=gmail.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1h1Ip7-0002V3-7Z
 for xen-devel@lists.xenproject.org; Tue, 05 Mar 2019 22:46:09 +0000
Received: by mail-vk1-xa44.google.com with SMTP id v131so2359836vkd.3
 for <xen-devel@lists.xenproject.org>; Tue, 05 Mar 2019 14:46:06 -0800 (PST)
In-Reply-To: <alpine.DEB.2.10.1903051321390.17552@sstabellini-ThinkPad-X260>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: wei.liu2@citrix.com, Andrew Cooper <andrew.cooper3@citrix.com>, Amit Tomer <amittomer25@gmail.com>, Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>, xen-devel@lists.xenproject.org, ian.jackson@citrix.com
List-Id: xen-devel@lists.xenproject.org

--===============6700256480039020101==
Content-Type: multipart/alternative; boundary="000000000000746692058360a370"

--000000000000746692058360a370
Content-Type: text/plain; charset="UTF-8"

Sorry for the formatting.

On Tue, 5 Mar 2019, 21:24 Stefano Stabellini, <sstabellini@kernel.org>
wrote:

> On Sun, 3 Mar 2019, Amit Tomer wrote:
> > Hi,
> >
> > > This series introduces a cacheability parameter for the iomem option,
> so
> > > that we can map an iomem region into a guest as cacheable memory.
> > >
> > > Then, this series fixes the way Xen handles reserved memory regions on
> > > ARM: they should be mapped as normal memory, instead today they are
> > > treated as device memory.
> > >
> >
> > We tried testing this patch series on R-CAR platform but see following
> crash
> > when booting dom0 Linux.
>
> Thanks for testing! You might have found a real bug in the series. Could
> you please also attach the full device tree?
>

Looking at the stack trace, this is very likely due to the issue I pointed
out earlier on. I.e reserved-memory region should be described in the
memory nodes.

Cheers,


>
> > [    0.577777] bd20: 0000000000000000 ffff000008b27fa0
> > ffffffffffffffff ffff000008b27000
> > [    0.585639] bd40: ffff00000804bd50 ffff000008959164
> > [    0.590565] [<ffff000008959164>] cma_init_reserved_areas+0x98/0x1d0
> > [    0.596876] [<ffff000008083a50>] do_one_initcall+0x38/0x120
> > [    0.602493] [<ffff000008940d04>] kernel_init_freeable+0x188/0x228
> > [    0.608628] [<ffff0000086a6288>] kernel_init+0x10/0x100
> > [    0.613898] [<ffff000008084c68>] ret_from_fork+0x10/0x18
> > [    0.619250] ---[ end trace c2041e247871a6ff ]---
> > [    0.623929] Unable to handle kernel paging request at virtual
> > address ffff7dffe55c0000
> > [    0.631880] Mem abort info:
> > [    0.634715]   Exception class = DABT (current EL), IL = 32 bits
> > [    0.640684]   SET = 0, FnV = 0
> > [    0.643786]   EA = 0, S1PTW = 0
> > [    0.646990] Data abort info:
> > [    0.649920]   ISV = 0, ISS = 0x00000006
> > [    0.653821]   CM = 0, WnR = 0
> > [    0.656834] swapper pgtable: 4k pages, 48-bit VAs, pgd =
> ffff000008b47000
> > [    0.663670] [ffff7dffe55c0000] *pgd=0000000700aef803,
> > *pud=0000000700af0803, *pmd=0000000000000000
> > [    0.672652] Internal error: Oops: 96000006 [#1] PREEMPT SMP
> > [    0.678259] Modules linked in:
> > [    0.681371] CPU: 0 PID: 1 Comm: swapper/0 Tainted: G        W
> > 4.14.50-yocto-standard #1
> > [    0.689923] Hardware name: Renesas Salvator-X board based on
> > r8a7795 ES2.0+ (DT)
> > [    0.697355] task: ffff80001e910000 task.stack: ffff000008048000
> > [    0.703317] PC is at cma_init_reserved_areas+0xbc/0x1d0
> > [    0.708587] LR is at cma_init_reserved_areas+0x94/0x1d0
> > [    0.713862] pc : [<ffff000008959188>] lr : [<ffff000008959160>]
> > pstate: 60000045
> > [    0.721287] sp : ffff00000804bd50
> > [    0.724657] x29: ffff00000804bd50 x28: ffff000008a88a28
> > [    0.730013] x27: 0000000000057000 x26: ffff000008994040
> > [    0.735370] x25: ffff000008b27fa0 x24: ffff000008b27000
> > [    0.740727] x23: ffff7e0000000000 x22: ffff0000088ed000
> > [    0.746084] x21: 0000000000000000 x20: 0000000000000000
> > [    0.751440] x19: 0000000000000004 x18: 0000000000000000
> > [    0.756797] x17: 0000000000000001 x16: 00000000deadbeef
> > [    0.762154] x15: 0000000000000000 x14: 0000000000000400
> > [    0.767511] x13: 0000000000000400 x12: 0000000000000000
> > [    0.772872] x11: 0000000000000000 x10: 0000000000000002
> > [    0.778224] x9 : 0000000000000000 x8 : ffff80001e945800
> > [    0.783586] x7 : 0000000000000000 x6 : ffff000008b24868
> > [    0.788938] x5 : ffff000008b24868 x4 : 0000000000000000
> > [    0.794295] x3 : 0000000000000780 x2 : 0000000700000000
> > [    0.799652] x1 : ffff000008a88a28 x0 : ffffffffe55c0000
> > [    0.805010] Process swapper/0 (pid: 1, stack limit =
> 0xffff000008048000)
> > [    0.811747] Call trace:
> > [    0.814254] Exception stack(0xffff00000804bc10 to 0xffff00000804bd50)
> > [    0.820734] bc00:
> > ffffffffe55c0000 ffff000008a88a28
> > [    0.828598] bc20: 0000000700000000 0000000000000780
> > 0000000000000000 ffff000008b24868
> > [    0.836460] bc40: ffff000008b24868 0000000000000000
> > ffff80001e945800 0000000000000000
> > [    0.844322] bc60: 0000000000000002 0000000000000000
> > 0000000000000000 0000000000000400
> > [    0.852184] bc80: 0000000000000400 0000000000000000
> > 00000000deadbeef 0000000000000001
> > [    0.860047] bca0: 0000000000000000 0000000000000004
> > 0000000000000000 0000000000000000
> > [    0.867910] bcc0: ffff0000088ed000 ffff7e0000000000
> > ffff000008b27000 ffff000008b27fa0
> > [    0.875772] bce0: ffff000008994040 0000000000057000
> > ffff000008a88a28 ffff00000804bd50
> > [    0.883639] bd00: ffff000008959160 ffff00000804bd50
> > ffff000008959188 0000000060000045
> > [    0.891497] bd20: 0000000000000000 ffff000008b27fa0
> > ffffffffffffffff ffff000008b27000
> > [    0.899359] bd40: ffff00000804bd50 ffff000008959188
> > [    0.904285] [<ffff000008959188>] cma_init_reserved_areas+0xbc/0x1d0
> > [    0.910592] [<ffff000008083a50>] do_one_initcall+0x38/0x120
> > [    0.916209] [<ffff000008940d04>] kernel_init_freeable+0x188/0x228
> > [    0.922343] [<ffff0000086a6288>] kernel_init+0x10/0x100
> > [    0.927613] [<ffff000008084c68>] ret_from_fork+0x10/0x18
> > [    0.932975] Code: f94262c0 aa0103fc cb803360 d37ae400 (f8776800)
> > [    0.939104] ---[ end trace c2041e247871a700 ]---
> > [    0.943800] Kernel panic - not syncing: Attempted to kill init!
> > exitcode=0x0000000b
> > [    0.943800]
> > [    0.953021] SMP: stopping secondary CPUs
> > [    0.957009] ---[ end Kernel panic - not syncing: Attempted to kill
> > init! exitcode=0x0000000b
> >
> > Below is how reserved node looks like:
> >
> >          reserved-memory {
> >                  #address-cells = <2>;
> >                  #size-cells = <2>;
> >                  ranges;
> >
> >                  /* device specific region for Lossy Decompression */
> >                  lossy_decompress: linux,lossy_decompress@54000000 {
> >                          no-map;
> >                          reg = <0x00000000 0x54000000 0x0 0x03000000>;
> >                  };
> >
> >                  /* For Audio DSP */
> >                  adsp_reserved: linux,adsp@57000000 {
> >                          compatible = "shared-dma-pool";
> >                          reusable;
> >                          reg = <0x00000000 0x57000000 0x0 0x01000000>;
> >                  };
> >
> >                  /* global autoconfigured region for contiguous
> allocations */
> >                  linux,cma@58000000 {
> >                          compatible = "shared-dma-pool";
> >                          reusable;
> >                          reg = <0x00000000 0x58000000 0x0 0x18000000>;
> >                          linux,cma-default;
> >                  };
> >
> >                  /* device specific region for contiguous allocations */
> >                  mmp_reserved: linux,multimedia@70000000 {
> >                          compatible = "shared-dma-pool";
> >                          reusable;
> >                          reg = <0x00000000 0x70000000 0x0 0x10000000>;
> >                  };
> >          };
> >
>
> _______________________________________________
> Xen-devel mailing list
> Xen-devel@lists.xenproject.org
> https://lists.xenproject.org/mailman/listinfo/xen-devel

--000000000000746692058360a370
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sorry for the formatting.<br><br><div class=3D"gmail_quote"><div dir=3D"ltr=
">On Tue, 5 Mar 2019, 21:24 Stefano Stabellini, &lt;<a href=3D"mailto:sstab=
ellini@kernel.org">sstabellini@kernel.org</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex">On Sun, 3 Mar 2019, Amit Tomer wrote:<br>
&gt; Hi,<br>
&gt; <br>
&gt; &gt; This series introduces a cacheability parameter for the iomem opt=
ion, so<br>
&gt; &gt; that we can map an iomem region into a guest as cacheable memory.=
<br>
&gt; &gt;<br>
&gt; &gt; Then, this series fixes the way Xen handles reserved memory regio=
ns on<br>
&gt; &gt; ARM: they should be mapped as normal memory, instead today they a=
re<br>
&gt; &gt; treated as device memory.<br>
&gt; &gt;<br>
&gt; <br>
&gt; We tried testing this patch series on R-CAR platform but see following=
 crash<br>
&gt; when booting dom0 Linux.<br>
<br>
Thanks for testing! You might have found a real bug in the series. Could<br=
>
you please also attach the full device tree?<br></blockquote></div><div><br=
></div><div>Looking at the stack trace, this is very likely due to the issu=
e I pointed out earlier on. I.e reserved-memory region should be described =
in the memory nodes.</div><div><br></div><div>Cheers,</div><div><br></div><=
div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
<br>
&gt; [=C2=A0 =C2=A0 0.577777] bd20: 0000000000000000 ffff000008b27fa0<br>
&gt; ffffffffffffffff ffff000008b27000<br>
&gt; [=C2=A0 =C2=A0 0.585639] bd40: ffff00000804bd50 ffff000008959164<br>
&gt; [=C2=A0 =C2=A0 0.590565] [&lt;ffff000008959164&gt;] cma_init_reserved_=
areas+0x98/0x1d0<br>
&gt; [=C2=A0 =C2=A0 0.596876] [&lt;ffff000008083a50&gt;] do_one_initcall+0x=
38/0x120<br>
&gt; [=C2=A0 =C2=A0 0.602493] [&lt;ffff000008940d04&gt;] kernel_init_freeab=
le+0x188/0x228<br>
&gt; [=C2=A0 =C2=A0 0.608628] [&lt;ffff0000086a6288&gt;] kernel_init+0x10/0=
x100<br>
&gt; [=C2=A0 =C2=A0 0.613898] [&lt;ffff000008084c68&gt;] ret_from_fork+0x10=
/0x18<br>
&gt; [=C2=A0 =C2=A0 0.619250] ---[ end trace c2041e247871a6ff ]---<br>
&gt; [=C2=A0 =C2=A0 0.623929] Unable to handle kernel paging request at vir=
tual<br>
&gt; address ffff7dffe55c0000<br>
&gt; [=C2=A0 =C2=A0 0.631880] Mem abort info:<br>
&gt; [=C2=A0 =C2=A0 0.634715]=C2=A0 =C2=A0Exception class =3D DABT (current=
 EL), IL =3D 32 bits<br>
&gt; [=C2=A0 =C2=A0 0.640684]=C2=A0 =C2=A0SET =3D 0, FnV =3D 0<br>
&gt; [=C2=A0 =C2=A0 0.643786]=C2=A0 =C2=A0EA =3D 0, S1PTW =3D 0<br>
&gt; [=C2=A0 =C2=A0 0.646990] Data abort info:<br>
&gt; [=C2=A0 =C2=A0 0.649920]=C2=A0 =C2=A0ISV =3D 0, ISS =3D 0x00000006<br>
&gt; [=C2=A0 =C2=A0 0.653821]=C2=A0 =C2=A0CM =3D 0, WnR =3D 0<br>
&gt; [=C2=A0 =C2=A0 0.656834] swapper pgtable: 4k pages, 48-bit VAs, pgd =
=3D ffff000008b47000<br>
&gt; [=C2=A0 =C2=A0 0.663670] [ffff7dffe55c0000] *pgd=3D0000000700aef803,<b=
r>
&gt; *pud=3D0000000700af0803, *pmd=3D0000000000000000<br>
&gt; [=C2=A0 =C2=A0 0.672652] Internal error: Oops: 96000006 [#1] PREEMPT S=
MP<br>
&gt; [=C2=A0 =C2=A0 0.678259] Modules linked in:<br>
&gt; [=C2=A0 =C2=A0 0.681371] CPU: 0 PID: 1 Comm: swapper/0 Tainted: G=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 W<br>
&gt; 4.14.50-yocto-standard #1<br>
&gt; [=C2=A0 =C2=A0 0.689923] Hardware name: Renesas Salvator-X board based=
 on<br>
&gt; r8a7795 ES2.0+ (DT)<br>
&gt; [=C2=A0 =C2=A0 0.697355] task: ffff80001e910000 task.stack: ffff000008=
048000<br>
&gt; [=C2=A0 =C2=A0 0.703317] PC is at cma_init_reserved_areas+0xbc/0x1d0<b=
r>
&gt; [=C2=A0 =C2=A0 0.708587] LR is at cma_init_reserved_areas+0x94/0x1d0<b=
r>
&gt; [=C2=A0 =C2=A0 0.713862] pc : [&lt;ffff000008959188&gt;] lr : [&lt;fff=
f000008959160&gt;]<br>
&gt; pstate: 60000045<br>
&gt; [=C2=A0 =C2=A0 0.721287] sp : ffff00000804bd50<br>
&gt; [=C2=A0 =C2=A0 0.724657] x29: ffff00000804bd50 x28: ffff000008a88a28<b=
r>
&gt; [=C2=A0 =C2=A0 0.730013] x27: 0000000000057000 x26: ffff000008994040<b=
r>
&gt; [=C2=A0 =C2=A0 0.735370] x25: ffff000008b27fa0 x24: ffff000008b27000<b=
r>
&gt; [=C2=A0 =C2=A0 0.740727] x23: ffff7e0000000000 x22: ffff0000088ed000<b=
r>
&gt; [=C2=A0 =C2=A0 0.746084] x21: 0000000000000000 x20: 0000000000000000<b=
r>
&gt; [=C2=A0 =C2=A0 0.751440] x19: 0000000000000004 x18: 0000000000000000<b=
r>
&gt; [=C2=A0 =C2=A0 0.756797] x17: 0000000000000001 x16: 00000000deadbeef<b=
r>
&gt; [=C2=A0 =C2=A0 0.762154] x15: 0000000000000000 x14: 0000000000000400<b=
r>
&gt; [=C2=A0 =C2=A0 0.767511] x13: 0000000000000400 x12: 0000000000000000<b=
r>
&gt; [=C2=A0 =C2=A0 0.772872] x11: 0000000000000000 x10: 0000000000000002<b=
r>
&gt; [=C2=A0 =C2=A0 0.778224] x9 : 0000000000000000 x8 : ffff80001e945800<b=
r>
&gt; [=C2=A0 =C2=A0 0.783586] x7 : 0000000000000000 x6 : ffff000008b24868<b=
r>
&gt; [=C2=A0 =C2=A0 0.788938] x5 : ffff000008b24868 x4 : 0000000000000000<b=
r>
&gt; [=C2=A0 =C2=A0 0.794295] x3 : 0000000000000780 x2 : 0000000700000000<b=
r>
&gt; [=C2=A0 =C2=A0 0.799652] x1 : ffff000008a88a28 x0 : ffffffffe55c0000<b=
r>
&gt; [=C2=A0 =C2=A0 0.805010] Process swapper/0 (pid: 1, stack limit =3D 0x=
ffff000008048000)<br>
&gt; [=C2=A0 =C2=A0 0.811747] Call trace:<br>
&gt; [=C2=A0 =C2=A0 0.814254] Exception stack(0xffff00000804bc10 to 0xffff0=
0000804bd50)<br>
&gt; [=C2=A0 =C2=A0 0.820734] bc00:<br>
&gt; ffffffffe55c0000 ffff000008a88a28<br>
&gt; [=C2=A0 =C2=A0 0.828598] bc20: 0000000700000000 0000000000000780<br>
&gt; 0000000000000000 ffff000008b24868<br>
&gt; [=C2=A0 =C2=A0 0.836460] bc40: ffff000008b24868 0000000000000000<br>
&gt; ffff80001e945800 0000000000000000<br>
&gt; [=C2=A0 =C2=A0 0.844322] bc60: 0000000000000002 0000000000000000<br>
&gt; 0000000000000000 0000000000000400<br>
&gt; [=C2=A0 =C2=A0 0.852184] bc80: 0000000000000400 0000000000000000<br>
&gt; 00000000deadbeef 0000000000000001<br>
&gt; [=C2=A0 =C2=A0 0.860047] bca0: 0000000000000000 0000000000000004<br>
&gt; 0000000000000000 0000000000000000<br>
&gt; [=C2=A0 =C2=A0 0.867910] bcc0: ffff0000088ed000 ffff7e0000000000<br>
&gt; ffff000008b27000 ffff000008b27fa0<br>
&gt; [=C2=A0 =C2=A0 0.875772] bce0: ffff000008994040 0000000000057000<br>
&gt; ffff000008a88a28 ffff00000804bd50<br>
&gt; [=C2=A0 =C2=A0 0.883639] bd00: ffff000008959160 ffff00000804bd50<br>
&gt; ffff000008959188 0000000060000045<br>
&gt; [=C2=A0 =C2=A0 0.891497] bd20: 0000000000000000 ffff000008b27fa0<br>
&gt; ffffffffffffffff ffff000008b27000<br>
&gt; [=C2=A0 =C2=A0 0.899359] bd40: ffff00000804bd50 ffff000008959188<br>
&gt; [=C2=A0 =C2=A0 0.904285] [&lt;ffff000008959188&gt;] cma_init_reserved_=
areas+0xbc/0x1d0<br>
&gt; [=C2=A0 =C2=A0 0.910592] [&lt;ffff000008083a50&gt;] do_one_initcall+0x=
38/0x120<br>
&gt; [=C2=A0 =C2=A0 0.916209] [&lt;ffff000008940d04&gt;] kernel_init_freeab=
le+0x188/0x228<br>
&gt; [=C2=A0 =C2=A0 0.922343] [&lt;ffff0000086a6288&gt;] kernel_init+0x10/0=
x100<br>
&gt; [=C2=A0 =C2=A0 0.927613] [&lt;ffff000008084c68&gt;] ret_from_fork+0x10=
/0x18<br>
&gt; [=C2=A0 =C2=A0 0.932975] Code: f94262c0 aa0103fc cb803360 d37ae400 (f8=
776800)<br>
&gt; [=C2=A0 =C2=A0 0.939104] ---[ end trace c2041e247871a700 ]---<br>
&gt; [=C2=A0 =C2=A0 0.943800] Kernel panic - not syncing: Attempted to kill=
 init!<br>
&gt; exitcode=3D0x0000000b<br>
&gt; [=C2=A0 =C2=A0 0.943800]<br>
&gt; [=C2=A0 =C2=A0 0.953021] SMP: stopping secondary CPUs<br>
&gt; [=C2=A0 =C2=A0 0.957009] ---[ end Kernel panic - not syncing: Attempte=
d to kill<br>
&gt; init! exitcode=3D0x0000000b<br>
&gt; <br>
&gt; Below is how reserved node looks like:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reserved-memory {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #address=
-cells =3D &lt;2&gt;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #size-ce=
lls =3D &lt;2&gt;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ranges;<=
br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* devic=
e specific region for Lossy Decompression */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lossy_de=
compress: linux,lossy_decompress@54000000 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 no-map;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 reg =3D &lt;0x00000000 0x54000000 0x0 0x03000000&gt;;<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* For A=
udio DSP */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 adsp_res=
erved: linux,adsp@57000000 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 compatible =3D &quot;shared-dma-pool&quot;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 reusable;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 reg =3D &lt;0x00000000 0x57000000 0x0 0x01000000&gt;;<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* globa=
l autoconfigured region for contiguous allocations */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 linux,cm=
a@58000000 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 compatible =3D &quot;shared-dma-pool&quot;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 reusable;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 reg =3D &lt;0x00000000 0x58000000 0x0 0x18000000&gt;;<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 linux,cma-default;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* devic=
e specific region for contiguous allocations */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mmp_rese=
rved: linux,multimedia@70000000 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 compatible =3D &quot;shared-dma-pool&quot;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 reusable;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 reg =3D &lt;0x00000000 0x70000000 0x0 0x10000000&gt;;<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
&gt; <br>
<br>
_______________________________________________<br>
Xen-devel mailing list<br>
<a href=3D"mailto:Xen-devel@lists.xenproject.org" target=3D"_blank">Xen-dev=
el@lists.xenproject.org</a><br>
<a href=3D"https://lists.xenproject.org/mailman/listinfo/xen-devel" rel=3D"=
noreferrer" target=3D"_blank">https://lists.xenproject.org/mailman/listinfo=
/xen-devel</a></blockquote></div>

--000000000000746692058360a370--


--===============6700256480039020101==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6700256480039020101==--
