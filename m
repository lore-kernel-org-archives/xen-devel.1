From: "Volo M." <vm@vovs.net>
Subject: Xen Virtio Drivers
Date: Wed, 7 Mar 2018 16:13:47 +0200
Message-ID: <CAFU1X6ww54Ohq4L837sQzNz=Q9w=RBx3Ma4R6rjin=8YRgTdDQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1456581718693354894=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=+etp=f5=vovs.net=vm@srs-us1.protection.inumbo.net>)
 id 1etZpG-0007Rf-6w
 for xen-devel@lists.xenproject.org; Wed, 07 Mar 2018 14:13:50 +0000
Received: by mail-oi0-x236.google.com with SMTP id t185so1738829oif.6
 for <xen-devel@lists.xenproject.org>; Wed, 07 Mar 2018 06:13:48 -0800 (PST)
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

--===============1456581718693354894==
Content-Type: multipart/alternative; boundary="001a113dd978ed1d090566d32a2a"

--001a113dd978ed1d090566d32a2a
Content-Type: text/plain; charset="UTF-8"

Hi Devs,

Could you please help me to identify right way to start using Virtio
drivers for Xen guests
as described here https://wiki.xen.org/wiki/QEMU_Upstream .
I've managed to start my Windows 2008 VM with Virtio network drivers by
using 'model='virtio-net'' option as described above and it works fine (but
only for network interfaces).

The problem is I still can't identify how to make Xen using virtio-blk or
virtio-scsi backend for 'qemu-xen' qemu-model as mentioned here
https://en.wikibooks.org/wiki/QEMU/Devices/Virtio which should be
compatible with 'qemu-xen' qemu upstream model.

I can't see any mention about virtio disk types in docs:
https://xenbits.xen.org/docs/4.8-testing/misc/xl-disk-configuration.txt   .
Also I've done very common check through Xen source code ('*/tools/libxl/*'
area) while looking how to apply virtio disk drivers for our Xen guests.

Can you please clarify if it's been ever implemented. Do you have any ETA
when it's going to be implemented...etc? Or probably you could give me any
advice how to make it working?

Thanks a lot in advance.

--001a113dd978ed1d090566d32a2a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Devs,<div><br></div><div>Could you please help me to id=
entify right way to start using Virtio drivers for Xen guests</div><div>as =
described here=C2=A0<a href=3D"https://wiki.xen.org/wiki/QEMU_Upstream">htt=
ps://wiki.xen.org/wiki/QEMU_Upstream</a> .</div><div>I&#39;ve managed to st=
art my Windows 2008 VM with Virtio network drivers by using &#39;model=3D&#=
39;virtio-net&#39;&#39; option as described above and it works fine (but on=
ly for network interfaces).</div><div><br></div><div>The problem is I still=
 can&#39;t identify how to make Xen using virtio-blk or virtio-scsi backend=
 for &#39;qemu-xen&#39; qemu-model as mentioned here=C2=A0<a href=3D"https:=
//en.wikibooks.org/wiki/QEMU/Devices/Virtio">https://en.wikibooks.org/wiki/=
QEMU/Devices/Virtio</a> which should be compatible with &#39;qemu-xen&#39; =
qemu upstream model.</div><div><br></div><div>I can&#39;t see any mention a=
bout virtio disk types in docs:=C2=A0<a href=3D"https://xenbits.xen.org/doc=
s/4.8-testing/misc/xl-disk-configuration.txt">https://xenbits.xen.org/docs/=
4.8-testing/misc/xl-disk-configuration.txt</a>=C2=A0 =C2=A0.</div><div>Also=
 I&#39;ve done very common check through Xen source code (&#39;*/<span styl=
e=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:small;font-=
style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-we=
ight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-transf=
orm:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,2=
55);text-decoration-style:initial;text-decoration-color:initial;float:none;=
display:inline">tools/libxl/*&#39; area</span>) while looking how to apply =
virtio disk drivers for our Xen guests.</div><div><br></div><div>Can you pl=
ease clarify if it&#39;s been ever implemented. Do you have any ETA when it=
&#39;s going to be implemented...etc? Or probably you could give me any adv=
ice how to make it working?</div><div><br></div><div>Thanks a lot in advanc=
e.</div><div><br></div></div>

--001a113dd978ed1d090566d32a2a--


--===============1456581718693354894==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1456581718693354894==--
