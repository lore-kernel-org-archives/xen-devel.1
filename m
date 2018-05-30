From: Chaitanya Deshpande <chaitanyagd11@gmail.com>
Subject: Re: Query for running Xen on ARM
Date: Wed, 30 May 2018 10:22:49 -0700
Message-ID: <CA+a_Unej2vEbXCzA-14+XjOE2aVrXvTUPZqK5k6yMphyzdbixA@mail.gmail.com>
References: <CA+a_UndTaAP0XCssMCqTHVcGT1wnbmZHaohkfx33=tDU6Bq2Dw@mail.gmail.com>
 <ec0d7373-bcc1-2197-231b-aec07a3efb2e@arm.com>
 <CA+a_Une7WFRaZtb5vjA3DNjf614nKFO+5Aa1QD8vV9CjeNHiRA@mail.gmail.com>
 <alpine.DEB.2.10.1805291305050.5563@sstabellini-ThinkPad-X260>
 <CA+a_UndZ_7E9JNBPwVsfAjPP4PPwx2ter87q9ioDnEE5PiNS_g@mail.gmail.com>
 <alpine.DEB.2.10.1805300906590.23991@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1524596669899270474=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=kxua=ir=gmail.com=chaitanyagd11@srs-us1.protection.inumbo.net>)
 id 1fO4oG-00035W-74
 for xen-devel@lists.xenproject.org; Wed, 30 May 2018 17:22:52 +0000
Received: by mail-ot0-x236.google.com with SMTP id 15-v6so22017281otn.12
 for <xen-devel@lists.xenproject.org>; Wed, 30 May 2018 10:22:50 -0700 (PDT)
In-Reply-To: <alpine.DEB.2.10.1805300906590.23991@sstabellini-ThinkPad-X260>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien.grall@arm.com>
List-Id: xen-devel@lists.xenproject.org

--===============1524596669899270474==
Content-Type: multipart/alternative; boundary="000000000000aa1361056d6f9908"

--000000000000aa1361056d6f9908
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Stefano,

Sure. I will look into those documents. Thanks a lot.

Chaitanya

On Wed, May 30, 2018 at 9:18 AM, Stefano Stabellini <sstabellini@kernel.org=
>
wrote:

> I am not sure what the problem is. I would compared your partition table
> with a standard Linux distro UEFI image [1] to see if there are any
> important differences. Checkout the UEFI spec [2] section 13.3.1 onward
> to read the details of the partitions and filesystem requirements.
>
> [1] https://cloud-images.ubuntu.com/xenial/current/xenial-
> server-cloudimg-arm64-uefi1.img
> [2] http://www.uefi.org/sites/default/files/resources/UEFI%
> 20Spec%202_7_A%20Sept%206.pdf#G17.1019485
>
> On Tue, 29 May 2018, Chaitanya Deshpande wrote:
> > Hi Stefano,
> >
> > I have created W95 FAT32 partition as my first partition (Bootable) but
> still I unable to see fs0: in the list.
> >
> > Please find attached copy of the screen shot with this Email.
> >
> > Please can you help me.
> >
> > Thanks,
> > Chaitanya
> >
> > On Tue, May 29, 2018 at 1:06 PM, Stefano Stabellini <
> sstabellini@kernel.org> wrote:
> >       FS0: is mapped to the first partition on your disk, that needs to
> be
> >       formatted with the FAT filesystem. Do you have a FAT partition on
> your
> >       disk?
> >
> >       On Tue, 29 May 2018, Chaitanya Deshpande wrote:
> >       > Hi Stefano, Julien,
> >       > I am able to solve that problem. Now the problem I am facing is
> my qemu is unable to find file system from EFI.
> >       >
> >       > Please find attached copy with this Email.
> >       >
> >       > No fs0: in mapping table. (Only BLK0: and BLK1:)
> >       >
> >       > Thanks,
> >       > Chaitanya
> >       >
> >       > On Tue, May 29, 2018 at 7:35 AM, Julien Grall <
> julien.grall@arm.com> wrote:
> >       >       (+Stefano)
> >       >
> >       >       On 27/05/18 18:48, Chaitanya Deshpande wrote:
> >       >             Hi,
> >       >
> >       >
> >       >       Hello Chaitanya,
> >       >
> >       >             I am Chaitanya, pursuing my master=E2=80=99s degree=
 from
> Portland State University in Embedded Systems.
> >       >
> >       >             I have started working on Xen Project and I am
> beginner in this field.
> >       >
> >       >             I have followed all the steps which are given in
> this link =E2=80=93
> >       >
> >       >             https://wiki.xenproject.org/wiki/Xen_ARM_with_
> Virtualization_Extensions/qemu-system-aarch64
> >       >
> >       >             https://wiki.xenproject.org/wiki/Xen_ARM_with_
> Virtualization_Extensions#Building_Xen_on_ARM
> >       >
> >       >
> >       >             1) I have used buildroot(rootfs.cpio) for building
> Linux.
> >       >
> >       >             2) I have succeeded in booting Linux on Qemu
> (qemu-system-.aarch64)
> >       >
> >       >             3) Used make dist-xen XEN_TARGET_ARCH=3Darm64
> CROSS_COMPILE=3Daarch64-linux-gnu-  for cross compiling and
> >       >             getting Xen binary.
> >       >
> >       >             4) My root is root - root=3D/dev/sda1
> >       >
> >       >
> >       >       May I ask why the root is different from the example in
> the wiki page? Are you using a different setup for
> >       the disk
> >       >       (e.g no virtio)?
> >       >
> >       >
> >       >
> >       >             After running the  last step UEFI Prompt opens and
> it gives me this error.
> >       >
> >       >
> >       >       What do you mean? Which last step?
> >       >
> >       >
> >       >             error: no such device: root.
> >       >
> >       >
> >       >       This is coming from UEFI, right?
> >       >
> >       >
> >       >             Press any key to continue...
> >       >             EFI stub: Booting Linux Kernel...
> >       >
> >       >
> >       >       This is booting Linux and not Xen. It is also trying to
> using ACPI rather than DT. Would it be possible for
> >       you to
> >       >       drop to the UEFI shell and try to boot by hand?
> >       >
> >       >             EFI stub: Using DTB from configuration table
> >       >             EFI stub: Exiting boot services and installing
> virtual address map...
> >       >             [   11.231789] acpi PNP0A08:00: Bus 0000:00 not
> present in PCI namespace
> >       >             [   41.972816] NMI watchdog: BUG: soft lockup -
> CPU#1 stuck for 23s! [swapper/0:1]
> >       >             [  229.940369] NMI watchdog: BUG: soft lockup -
> CPU#0 stuck for 23s! [swapper/0:1]
> >       >             [  257.939966] NMI watchdog: BUG: soft lockup -
> CPU#0 stuck for 23s! [swapper/0:1]
> >       >             [  290.035395] NMI watchdog: BUG: soft lockup -
> CPU#3 stuck for 23s! [swapper/0:1]
> >       >             [  303.595373] kvm [1]: error: no compatible GIC
> node found
> >       >             [  303.619405] kvm [1]: error initializing Hyp mode=
:
> -19
> >       >
> >       >             I am unable to find the root cause of this issue.
> Please can anyone help me with this.
> >       >
> >       >
> >       >       Cheers,
> >       >
> >       >       --
> >       >       Julien Grall
> >       >
> >       >
> >       >
> >       >
> >
> >
> >
> >
>

--000000000000aa1361056d6f9908
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Stefano,<div><br></div><div>Sure. I will look into thos=
e documents. Thanks a lot.</div><div><br></div><div>Chaitanya<br><div class=
=3D"gmail_extra"><br><div class=3D"gmail_quote">On Wed, May 30, 2018 at 9:1=
8 AM, Stefano Stabellini <span dir=3D"ltr">&lt;<a href=3D"mailto:sstabellin=
i@kernel.org" target=3D"_blank">sstabellini@kernel.org</a>&gt;</span> wrote=
:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex">I am not sure what the problem is. I wo=
uld compared your partition table<br>
with a standard Linux distro UEFI image [1] to see if there are any<br>
important differences. Checkout the UEFI spec [2] section 13.3.1 onward<br>
to read the details of the partitions and filesystem requirements.<br>
<br>
[1] <a href=3D"https://cloud-images.ubuntu.com/xenial/current/xenial-server=
-cloudimg-arm64-uefi1.img" rel=3D"noreferrer" target=3D"_blank">https://clo=
ud-images.ubuntu.<wbr>com/xenial/current/xenial-<wbr>server-cloudimg-arm64-=
uefi1.<wbr>img</a><br>
[2] <a href=3D"http://www.uefi.org/sites/default/files/resources/UEFI%20Spe=
c%202_7_A%20Sept%206.pdf#G17.1019485" rel=3D"noreferrer" target=3D"_blank">=
http://www.uefi.org/sites/<wbr>default/files/resources/UEFI%<wbr>20Spec%202=
_7_A%20Sept%206.pdf#<wbr>G17.1019485</a><br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
On Tue, 29 May 2018, Chaitanya Deshpande wrote:<br>
&gt; Hi Stefano,<br>
&gt; <br>
&gt; I have created W95 FAT32 partition as my first partition (Bootable) bu=
t still I unable to see fs0: in the list.<br>
&gt; <br>
&gt; Please find attached copy of the screen shot with this Email.<br>
&gt; <br>
&gt; Please can you help me.<br>
&gt; <br>
&gt; Thanks,<br>
&gt; Chaitanya<br>
&gt; <br>
&gt; On Tue, May 29, 2018 at 1:06 PM, Stefano Stabellini &lt;<a href=3D"mai=
lto:sstabellini@kernel.org">sstabellini@kernel.org</a>&gt; wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0FS0: is mapped to the first partition on you=
r disk, that needs to be<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0formatted with the FAT filesystem. Do you ha=
ve a FAT partition on your<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0disk?<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0On Tue, 29 May 2018, Chaitanya Deshpande wro=
te:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Hi Stefano,=C2=A0Julien,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; I am able to solve that problem. Now th=
e problem I am facing is my qemu is unable to find file system from EFI.<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Please find attached copy with this Ema=
il.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; No fs0: in mapping table. (Only BLK0: a=
nd BLK1:)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Thanks,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Chaitanya<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; On Tue, May 29, 2018 at 7:35 AM, Julien=
 Grall &lt;<a href=3D"mailto:julien.grall@arm.com">julien.grall@arm.com</a>=
&gt; wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0(+Stefano)<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0On 27/05/18 1=
8:48, Chaitanya Deshpande wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0Hi,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Hello Chaitan=
ya,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0I am Chaitanya, pursuing my master=E2=80=99s degree from Portland=
 State University in Embedded Systems.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0I have started working on Xen Project and I am beginner in this f=
ield.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0I have followed all the steps which are given in this link =E2=80=
=93<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0<a href=3D"https://wiki.xenproject.org/wiki/Xen_ARM_with_Virtuali=
zation_Extensions/qemu-system-aarch64" rel=3D"noreferrer" target=3D"_blank"=
>https://wiki.xenproject.org/<wbr>wiki/Xen_ARM_with_<wbr>Virtualization_Ext=
ensions/<wbr>qemu-system-aarch64</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0<a href=3D"https://wiki.xenproject.org/wiki/Xen_ARM_with_Virtuali=
zation_Extensions#Building_Xen_on_ARM" rel=3D"noreferrer" target=3D"_blank"=
>https://wiki.xenproject.org/<wbr>wiki/Xen_ARM_with_<wbr>Virtualization_Ext=
ensions#<wbr>Building_Xen_on_ARM</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A01) I have used buildroot(rootfs.cpio) for building Linux.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A02) I have succeeded in booting Linux on Qemu (qemu-system-.aarch6=
4)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A03) Used make dist-xen XEN_TARGET_ARCH=3Darm64 CROSS_COMPILE=3Daar=
ch64-linux-<wbr>gnu-=C2=A0 for cross compiling and<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0getting Xen binary.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A04) My root is root - root=3D/dev/sda1<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0May I ask why=
 the root is different from the example in the wiki page? Are you using a d=
ifferent setup for<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0the disk<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0(e.g no virti=
o)?<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0After running the =C2=A0last step UEFI Prompt opens and it gives =
me this error.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0What do you m=
ean? Which last step?<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0error: no such device: root.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0This is comin=
g from UEFI, right?<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0Press any key to continue...<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0EFI stub: Booting Linux Kernel...<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0This is booti=
ng Linux and not Xen. It is also trying to using ACPI rather than DT. Would=
 it be possible for<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0you to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0drop to the U=
EFI shell and try to boot by hand?<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0EFI stub: Using DTB from configuration table<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0EFI stub: Exiting boot services and installing virtual address ma=
p...<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0[=C2=A0=C2=A0 11.231789] acpi PNP0A08:00: Bus 0000:00 not present=
 in PCI namespace<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0[=C2=A0=C2=A0 41.972816] NMI watchdog: BUG: soft lockup - CPU#1 s=
tuck for 23s! [swapper/0:1]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0[=C2=A0 229.940369] NMI watchdog: BUG: soft lockup - CPU#0 stuck =
for 23s! [swapper/0:1]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0[=C2=A0 257.939966] NMI watchdog: BUG: soft lockup - CPU#0 stuck =
for 23s! [swapper/0:1]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0[=C2=A0 290.035395] NMI watchdog: BUG: soft lockup - CPU#3 stuck =
for 23s! [swapper/0:1]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0[=C2=A0 303.595373] kvm [1]: error: no compatible GIC node found<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0[=C2=A0 303.619405] kvm [1]: error initializing Hyp mode: -19<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0I am unable to find the root cause of this issue. Please can anyo=
ne help me with this.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Cheers,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0--<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Julien Grall<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; </div></div></blockquote></div><br></div></div></div>

--000000000000aa1361056d6f9908--


--===============1524596669899270474==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1524596669899270474==--
