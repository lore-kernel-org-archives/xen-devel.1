From: Rishi <2rushikeshj@gmail.com>
Subject: Unable to compile blktap-3.2.0.xs1086 against kernel
 4.16.8
Date: Wed, 16 May 2018 15:34:02 +0530
Message-ID: <CAO9XypX8Z_8egURF=pq27jz34FpTJOjmk7p2Un+CwzgRJ9C0xA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7854693744683324053=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

--===============7854693744683324053==
Content-Type: multipart/alternative; boundary="00000000000055fd4b056c4fd7bf"

--00000000000055fd4b056c4fd7bf
Content-Type: text/plain; charset="UTF-8"

Dear All,

I'm trying to rebuild the blktap module from xenserver. I'm getting
following compile errors, any help or direction would be appreciated.

make[2]: Entering directory
`/root/rpmbuild/BUILD/blktap-3.2.0.xs1086/drivers'

/bin/sh ../libtool  --tag=CC   --mode=compile gcc -DHAVE_CONFIG_H -I.
-I..  -D_GNU_SOURCE
-I../include  -Wall -Werror -DXC_WANT_COMPAT_EVTCHN_API
-DXC_WANT_COMPAT_GNTTAB_API -O2 -g -pipe -Wall -Wp,-D_FORTIFY_SOURCE=2
-fexceptions -fstack-protector-strong --param=ssp-buffer-size=4
-grecord-gcc-switches   -m64 -mtune=generic -c -o td-req.lo td-req.c

libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I.. -D_GNU_SOURCE -I../include
-Wall -Werror -DXC_WANT_COMPAT_EVTCHN_API -DXC_WANT_COMPAT_GNTTAB_API -O2
-g -pipe -Wall -Wp,-D_FORTIFY_SOURCE=2 -fexceptions
-fstack-protector-strong --param=ssp-buffer-size=4 -grecord-gcc-switches
-m64 -mtune=generic -c td-req.c  -fPIC -DPIC -o .libs/td-req.o

*td-req.c:* In function '*guest_copy2*':

*td-req.c:359:18:* *error: *'*struct gntdev_grant_copy_segment*' has no
member named '*iov*'

         gcopy_seg->iov.iov_base = tapreq->vma + (i << PAGE_SHIFT) +
(blkif_seg->first_sect << SECTOR_SHIFT);

*                  ^*

*td-req.c:360:18:* *error: *'*struct gntdev_grant_copy_segment*' has no
member named '*iov*'

         gcopy_seg->iov.iov_len = (blkif_seg->last_sect -
blkif_seg->first_sect + 1) << SECTOR_SHIFT;

*                  ^*

*td-req.c:361:18:* *error: *'*struct gntdev_grant_copy_segment*' has no
member named '*ref*'

         gcopy_seg->ref = blkif_seg->gref;

*                  ^*

*td-req.c:362:18:* *error: *'*struct gntdev_grant_copy_segment*' has no
member named '*offset*'

         gcopy_seg->offset = blkif_seg->first_sect << SECTOR_SHIFT;

*                  ^*

*td-req.c:365:10:* *error: *'*struct ioctl_gntdev_grant_copy*' has no
member named '*dir*'

     gcopy.dir = blkif_rq_wr(&tapreq->msg);

*          ^*

*td-req.c:366:10:* *error: *'*struct ioctl_gntdev_grant_copy*' has no
member named '*domid*'

     gcopy.domid = blkif->domid;

*          ^*

make[2]: *** [td-req.lo] Error 1

make[2]: Leaving directory
`/root/rpmbuild/BUILD/blktap-3.2.0.xs1086/drivers'

make[1]: *** [all-recursive] Error 1

make[1]: Leaving directory `/root/rpmbuild/BUILD/blktap-3.2.0.xs1086'

make: *** [all] Error 2


I can share updated structures on Xen side but not sure how to modify above
code to let it adhere to latest xen.


Thank you.

--00000000000055fd4b056c4fd7bf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Dear All,<div><br></div><div>I&#39;m trying to rebuild the=
 blktap module from xenserver. I&#39;m getting following compile errors, an=
y help or direction would be appreciated.</div><div><br></div><div>




<span></span>





<p class=3D"gmail-p1" style=3D"margin:0px;font-style:normal;font-variant:no=
rmal;font-weight:normal;font-stretch:normal;font-size:11px;line-height:norm=
al;font-family:Menlo;color:rgb(0,0,0);background-color:rgb(255,255,255)"><s=
pan class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-ligatures"=
>make[2]: Entering directory `/root/rpmbuild/BUILD/blktap-3.2.0.xs1086/driv=
ers&#39;</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-style:normal;font-variant:no=
rmal;font-weight:normal;font-stretch:normal;font-size:11px;line-height:norm=
al;font-family:Menlo;color:rgb(0,0,0);background-color:rgb(255,255,255)"><s=
pan class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-ligatures"=
>/bin/sh ../libtool<span class=3D"gmail-Apple-converted-space">=C2=A0 </spa=
n>--tag=3DCC <span class=3D"gmail-Apple-converted-space">=C2=A0 </span>--mo=
de=3Dcompile gcc -DHAVE_CONFIG_H -I. -I..<span class=3D"gmail-Apple-convert=
ed-space">=C2=A0 </span>-D_GNU_SOURCE -I../include<span class=3D"gmail-Appl=
e-converted-space">=C2=A0 </span>-Wall -Werror -DXC_WANT_COMPAT_EVTCHN_API =
-DXC_WANT_COMPAT_GNTTAB_API -O2 -g -pipe -Wall -Wp,-D_FORTIFY_SOURCE=3D2 -f=
exceptions -fstack-protector-strong --param=3Dssp-buffer-size=3D4 -grecord-=
gcc-switches <span class=3D"gmail-Apple-converted-space">=C2=A0 </span>-m64=
 -mtune=3Dgeneric -c -o td-req.lo td-req.c</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-style:normal;font-variant:no=
rmal;font-weight:normal;font-stretch:normal;font-size:11px;line-height:norm=
al;font-family:Menlo;color:rgb(0,0,0);background-color:rgb(255,255,255)"><s=
pan class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-ligatures"=
>libtool: compile:<span class=3D"gmail-Apple-converted-space">=C2=A0 </span=
>gcc -DHAVE_CONFIG_H -I. -I.. -D_GNU_SOURCE -I../include -Wall -Werror -DXC=
_WANT_COMPAT_EVTCHN_API -DXC_WANT_COMPAT_GNTTAB_API -O2 -g -pipe -Wall -Wp,=
-D_FORTIFY_SOURCE=3D2 -fexceptions -fstack-protector-strong --param=3Dssp-b=
uffer-size=3D4 -grecord-gcc-switches -m64 -mtune=3Dgeneric -c td-req.c<span=
 class=3D"gmail-Apple-converted-space">=C2=A0 </span>-fPIC -DPIC -o .libs/t=
d-req.o</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-style:normal;font-variant:no=
rmal;font-weight:normal;font-stretch:normal;font-size:11px;line-height:norm=
al;font-family:Menlo;color:rgb(0,0,0);background-color:rgb(255,255,255)"><s=
pan class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-ligatures"=
><b>td-req.c:</b> In function &#39;<b>guest_copy2</b>&#39;:</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-style:normal;font-variant:no=
rmal;font-weight:normal;font-stretch:normal;font-size:11px;line-height:norm=
al;font-family:Menlo;color:rgb(0,0,0);background-color:rgb(255,255,255)"><s=
pan class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-ligatures"=
><b>td-req.c:359:18:</b> </span><span class=3D"gmail-s2" style=3D"font-vari=
ant-ligatures:no-common-ligatures;color:rgb(195,55,32)"><b>error: </b></spa=
n><span class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-ligatu=
res">&#39;<b>struct gntdev_grant_copy_segment</b>&#39; has no member named =
&#39;<b>iov</b>&#39;</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-style:normal;font-variant:no=
rmal;font-weight:normal;font-stretch:normal;font-size:11px;line-height:norm=
al;font-family:Menlo;color:rgb(0,0,0);background-color:rgb(255,255,255)"><s=
pan class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-ligatures"=
><span class=3D"gmail-Apple-converted-space">=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 </span>gcopy_seg-&gt;iov.iov_base =3D tapreq-&gt;vma + (i &lt;&lt; PAGE=
_SHIFT) + (blkif_seg-&gt;first_sect &lt;&lt; SECTOR_SHIFT);</span></p>
<p class=3D"gmail-p2" style=3D"margin:0px;font-style:normal;font-variant:no=
rmal;font-weight:normal;font-stretch:normal;font-size:11px;line-height:norm=
al;font-family:Menlo;color:rgb(52,188,38);background-color:rgb(255,255,255)=
"><span class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-ligatu=
res"><b><span class=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>^</b></span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-style:normal;font-variant:no=
rmal;font-weight:normal;font-stretch:normal;font-size:11px;line-height:norm=
al;font-family:Menlo;color:rgb(0,0,0);background-color:rgb(255,255,255)"><s=
pan class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-ligatures"=
><b>td-req.c:360:18:</b> </span><span class=3D"gmail-s2" style=3D"font-vari=
ant-ligatures:no-common-ligatures;color:rgb(195,55,32)"><b>error: </b></spa=
n><span class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-ligatu=
res">&#39;<b>struct gntdev_grant_copy_segment</b>&#39; has no member named =
&#39;<b>iov</b>&#39;</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-style:normal;font-variant:no=
rmal;font-weight:normal;font-stretch:normal;font-size:11px;line-height:norm=
al;font-family:Menlo;color:rgb(0,0,0);background-color:rgb(255,255,255)"><s=
pan class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-ligatures"=
><span class=3D"gmail-Apple-converted-space">=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 </span>gcopy_seg-&gt;iov.iov_len =3D (blkif_seg-&gt;last_sect - blkif_s=
eg-&gt;first_sect + 1) &lt;&lt; SECTOR_SHIFT;</span></p>
<p class=3D"gmail-p2" style=3D"margin:0px;font-style:normal;font-variant:no=
rmal;font-weight:normal;font-stretch:normal;font-size:11px;line-height:norm=
al;font-family:Menlo;color:rgb(52,188,38);background-color:rgb(255,255,255)=
"><span class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-ligatu=
res"><b><span class=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>^</b></span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-style:normal;font-variant:no=
rmal;font-weight:normal;font-stretch:normal;font-size:11px;line-height:norm=
al;font-family:Menlo;color:rgb(0,0,0);background-color:rgb(255,255,255)"><s=
pan class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-ligatures"=
><b>td-req.c:361:18:</b> </span><span class=3D"gmail-s2" style=3D"font-vari=
ant-ligatures:no-common-ligatures;color:rgb(195,55,32)"><b>error: </b></spa=
n><span class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-ligatu=
res">&#39;<b>struct gntdev_grant_copy_segment</b>&#39; has no member named =
&#39;<b>ref</b>&#39;</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-style:normal;font-variant:no=
rmal;font-weight:normal;font-stretch:normal;font-size:11px;line-height:norm=
al;font-family:Menlo;color:rgb(0,0,0);background-color:rgb(255,255,255)"><s=
pan class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-ligatures"=
><span class=3D"gmail-Apple-converted-space">=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 </span>gcopy_seg-&gt;ref =3D blkif_seg-&gt;gref;</span></p>
<p class=3D"gmail-p2" style=3D"margin:0px;font-style:normal;font-variant:no=
rmal;font-weight:normal;font-stretch:normal;font-size:11px;line-height:norm=
al;font-family:Menlo;color:rgb(52,188,38);background-color:rgb(255,255,255)=
"><span class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-ligatu=
res"><b><span class=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>^</b></span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-style:normal;font-variant:no=
rmal;font-weight:normal;font-stretch:normal;font-size:11px;line-height:norm=
al;font-family:Menlo;color:rgb(0,0,0);background-color:rgb(255,255,255)"><s=
pan class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-ligatures"=
><b>td-req.c:362:18:</b> </span><span class=3D"gmail-s2" style=3D"font-vari=
ant-ligatures:no-common-ligatures;color:rgb(195,55,32)"><b>error: </b></spa=
n><span class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-ligatu=
res">&#39;<b>struct gntdev_grant_copy_segment</b>&#39; has no member named =
&#39;<b>offset</b>&#39;</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-style:normal;font-variant:no=
rmal;font-weight:normal;font-stretch:normal;font-size:11px;line-height:norm=
al;font-family:Menlo;color:rgb(0,0,0);background-color:rgb(255,255,255)"><s=
pan class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-ligatures"=
><span class=3D"gmail-Apple-converted-space">=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 </span>gcopy_seg-&gt;offset =3D blkif_seg-&gt;first_sect &lt;&lt; SECTO=
R_SHIFT;</span></p>
<p class=3D"gmail-p2" style=3D"margin:0px;font-style:normal;font-variant:no=
rmal;font-weight:normal;font-stretch:normal;font-size:11px;line-height:norm=
al;font-family:Menlo;color:rgb(52,188,38);background-color:rgb(255,255,255)=
"><span class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-ligatu=
res"><b><span class=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>^</b></span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-style:normal;font-variant:no=
rmal;font-weight:normal;font-stretch:normal;font-size:11px;line-height:norm=
al;font-family:Menlo;color:rgb(0,0,0);background-color:rgb(255,255,255)"><s=
pan class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-ligatures"=
><b>td-req.c:365:10:</b> </span><span class=3D"gmail-s2" style=3D"font-vari=
ant-ligatures:no-common-ligatures;color:rgb(195,55,32)"><b>error: </b></spa=
n><span class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-ligatu=
res">&#39;<b>struct ioctl_gntdev_grant_copy</b>&#39; has no member named &#=
39;<b>dir</b>&#39;</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-style:normal;font-variant:no=
rmal;font-weight:normal;font-stretch:normal;font-size:11px;line-height:norm=
al;font-family:Menlo;color:rgb(0,0,0);background-color:rgb(255,255,255)"><s=
pan class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-ligatures"=
><span class=3D"gmail-Apple-converted-space">=C2=A0=C2=A0 =C2=A0 </span>gco=
py.dir =3D blkif_rq_wr(&amp;tapreq-&gt;msg);</span></p>
<p class=3D"gmail-p2" style=3D"margin:0px;font-style:normal;font-variant:no=
rmal;font-weight:normal;font-stretch:normal;font-size:11px;line-height:norm=
al;font-family:Menlo;color:rgb(52,188,38);background-color:rgb(255,255,255)=
"><span class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-ligatu=
res"><b><span class=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 </span>^</b></span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-style:normal;font-variant:no=
rmal;font-weight:normal;font-stretch:normal;font-size:11px;line-height:norm=
al;font-family:Menlo;color:rgb(0,0,0);background-color:rgb(255,255,255)"><s=
pan class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-ligatures"=
><b>td-req.c:366:10:</b> </span><span class=3D"gmail-s2" style=3D"font-vari=
ant-ligatures:no-common-ligatures;color:rgb(195,55,32)"><b>error: </b></spa=
n><span class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-ligatu=
res">&#39;<b>struct ioctl_gntdev_grant_copy</b>&#39; has no member named &#=
39;<b>domid</b>&#39;</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-style:normal;font-variant:no=
rmal;font-weight:normal;font-stretch:normal;font-size:11px;line-height:norm=
al;font-family:Menlo;color:rgb(0,0,0);background-color:rgb(255,255,255)"><s=
pan class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-ligatures"=
><span class=3D"gmail-Apple-converted-space">=C2=A0=C2=A0 =C2=A0 </span>gco=
py.domid =3D blkif-&gt;domid;</span></p>
<p class=3D"gmail-p2" style=3D"margin:0px;font-style:normal;font-variant:no=
rmal;font-weight:normal;font-stretch:normal;font-size:11px;line-height:norm=
al;font-family:Menlo;color:rgb(52,188,38);background-color:rgb(255,255,255)=
"><span class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-ligatu=
res"><b><span class=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 </span>^</b></span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-style:normal;font-variant:no=
rmal;font-weight:normal;font-stretch:normal;font-size:11px;line-height:norm=
al;font-family:Menlo;color:rgb(0,0,0);background-color:rgb(255,255,255)"><s=
pan class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-ligatures"=
>make[2]: *** [td-req.lo] Error 1</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-style:normal;font-variant:no=
rmal;font-weight:normal;font-stretch:normal;font-size:11px;line-height:norm=
al;font-family:Menlo;color:rgb(0,0,0);background-color:rgb(255,255,255)"><s=
pan class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-ligatures"=
>make[2]: Leaving directory `/root/rpmbuild/BUILD/blktap-3.2.0.xs1086/drive=
rs&#39;</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-style:normal;font-variant:no=
rmal;font-weight:normal;font-stretch:normal;font-size:11px;line-height:norm=
al;font-family:Menlo;color:rgb(0,0,0);background-color:rgb(255,255,255)"><s=
pan class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-ligatures"=
>make[1]: *** [all-recursive] Error 1</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-style:normal;font-variant:no=
rmal;font-weight:normal;font-stretch:normal;font-size:11px;line-height:norm=
al;font-family:Menlo;color:rgb(0,0,0);background-color:rgb(255,255,255)"><s=
pan class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-ligatures"=
>make[1]: Leaving directory `/root/rpmbuild/BUILD/blktap-3.2.0.xs1086&#39;<=
/span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-style:normal;font-variant:no=
rmal;font-weight:normal;font-stretch:normal;font-size:11px;line-height:norm=
al;font-family:Menlo;color:rgb(0,0,0);background-color:rgb(255,255,255)"><s=
pan class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-ligatures"=
>make: *** [all] Error 2</span></p>


<br></div><div><br></div><div>I can share updated structures on Xen side bu=
t not sure how to modify above code to let it adhere to latest xen.</div><d=
iv><br></div><div><br></div><div>Thank you.</div><div><br></div></div>

--00000000000055fd4b056c4fd7bf--


--===============7854693744683324053==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7854693744683324053==--
