From: Chaitanya Deshpande <chaitanyagd11@gmail.com>
Subject: Re: Query for running Xen on ARM
Date: Tue, 29 May 2018 08:54:01 -0700
Message-ID: <CA+a_UneB3Cgz_tRp227e94XEnxjCnLjQwkX1+e5S7KWLszowdA@mail.gmail.com>
References: <CA+a_UndTaAP0XCssMCqTHVcGT1wnbmZHaohkfx33=tDU6Bq2Dw@mail.gmail.com>
 <ec0d7373-bcc1-2197-231b-aec07a3efb2e@arm.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2460717586343782493=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ts6h=iq=gmail.com=chaitanyagd11@srs-us1.protection.inumbo.net>)
 id 1fNgwn-0002Hd-6f
 for xen-devel@lists.xenproject.org; Tue, 29 May 2018 15:54:05 +0000
Received: by mail-ot0-x22c.google.com with SMTP id q17-v6so6946300otg.2
 for <xen-devel@lists.xenproject.org>; Tue, 29 May 2018 08:54:03 -0700 (PDT)
In-Reply-To: <ec0d7373-bcc1-2197-231b-aec07a3efb2e@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

--===============2460717586343782493==
Content-Type: multipart/alternative; boundary="0000000000003f63e6056d5a3ea0"

--0000000000003f63e6056d5a3ea0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks you so much for the pointers.

On Tue, May 29, 2018 at 7:35 AM, Julien Grall <julien.grall@arm.com> wrote:

> (+Stefano)
>
> On 27/05/18 18:48, Chaitanya Deshpande wrote:
>
>> Hi,
>>
>
> Hello Chaitanya,
>
> I am Chaitanya, pursuing my master=E2=80=99s degree from Portland State U=
niversity
>> in Embedded Systems.
>>
>> I have started working on Xen Project and I am beginner in this field.
>>
>> I have followed all the steps which are given in this link =E2=80=93
>>
>> https://wiki.xenproject.org/wiki/Xen_ARM_with_Virtualization
>> _Extensions/qemu-system-aarch64
>>
>> https://wiki.xenproject.org/wiki/Xen_ARM_with_Virtualization
>> _Extensions#Building_Xen_on_ARM
>>
>>
>> 1) I have used buildroot(rootfs.cpio) for building Linux.
>>
>> 2) I have succeeded in booting Linux on Qemu (qemu-system-.aarch64)
>>
>> 3) Used make dist-xen XEN_TARGET_ARCH=3Darm64 CROSS_COMPILE=3Daarch64-li=
nux-gnu-
>> for cross compiling and getting Xen binary.
>>
>> 4) My root is root - root=3D/dev/sda1
>>
>
> May I ask why the root is different from the example in the wiki page? Ar=
e
> you using a different setup for the disk (e.g no virtio)?


    Chaitanya - For building linux I am using buildroot toolchain (my root
is /path/to/rootfs.cpio) and I able to run the linux on ARM64 (Qemu).

>
>
>
>>
>> After running the  last step UEFI Prompt opens and it gives me this erro=
r.
>>
>
> What do you mean? Which last step?
>
>
>> error: no such device: root.
>>
>
> This is coming from UEFI, right?


   Chaitanya - Yes it was. But I changed the root and it worked for me.

>
>
>
>> Press any key to continue...
>> EFI stub: Booting Linux Kernel...
>>
>
> This is booting Linux and not Xen. It is also trying to using ACPI rather
> than DT. Would it be possible for you to drop to the UEFI shell and try t=
o
> boot by hand?


   Chaitanya -  Yes. I am trying that but I am unable to find fs0: in the
mapping table of qemu. (It is showing only BLK0: and BLK1:)
   I have xen.cfg and xen.efi in the root@127.0.0.1:/boot/efi folder but I
am unable to reach to that folder from qemu UEFI.


>
>
> EFI stub: Using DTB from configuration table
>> EFI stub: Exiting boot services and installing virtual address map...
>> [   11.231789] acpi PNP0A08:00: Bus 0000:00 not present in PCI namespace
>> [   41.972816] NMI watchdog: BUG: soft lockup - CPU#1 stuck for 23s!
>> [swapper/0:1]
>> [  229.940369] NMI watchdog: BUG: soft lockup - CPU#0 stuck for 23s!
>> [swapper/0:1]
>> [  257.939966] NMI watchdog: BUG: soft lockup - CPU#0 stuck for 23s!
>> [swapper/0:1]
>> [  290.035395] NMI watchdog: BUG: soft lockup - CPU#3 stuck for 23s!
>> [swapper/0:1]
>> [  303.595373] kvm [1]: error: no compatible GIC node found
>> [  303.619405] kvm [1]: error initializing Hyp mode: -19
>>
>> I am unable to find the root cause of this issue. Please can anyone help
>> me with this.
>>
>
> Cheers,
>
> --
> Julien Grall
>

Thanks,
Chaitanya

--0000000000003f63e6056d5a3ea0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks you so much for the pointers.<br><div class=3D"gmai=
l_extra"><br><div class=3D"gmail_quote">On Tue, May 29, 2018 at 7:35 AM, Ju=
lien Grall <span dir=3D"ltr">&lt;<a href=3D"mailto:julien.grall@arm.com" ta=
rget=3D"_blank">julien.grall@arm.com</a>&gt;</span> wrote:<br><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex">(+Stefano)<br>
<br>
On 27/05/18 18:48, Chaitanya Deshpande wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Hi,<br>
</blockquote>
<br>
Hello Chaitanya,<span class=3D""><br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
I am Chaitanya, pursuing my master=E2=80=99s degree from Portland State Uni=
versity in Embedded Systems.<br>
<br>
I have started working on Xen Project and I am beginner in this field.<br>
<br>
I have followed all the steps which are given in this link =E2=80=93<br>
<br>
<a href=3D"https://wiki.xenproject.org/wiki/Xen_ARM_with_Virtualization_Ext=
ensions/qemu-system-aarch64" rel=3D"noreferrer" target=3D"_blank">https://w=
iki.xenproject.org/wi<wbr>ki/Xen_ARM_with_Virtualization<wbr>_Extensions/qe=
mu-system-<wbr>aarch64</a><br>
<br>
<a href=3D"https://wiki.xenproject.org/wiki/Xen_ARM_with_Virtualization_Ext=
ensions#Building_Xen_on_ARM" rel=3D"noreferrer" target=3D"_blank">https://w=
iki.xenproject.org/wi<wbr>ki/Xen_ARM_with_Virtualization<wbr>_Extensions#Bu=
ilding_Xen_on_<wbr>ARM</a><br>
<br>
<br>
1) I have used buildroot(rootfs.cpio) for building Linux.<br>
<br>
2) I have succeeded in booting Linux on Qemu (qemu-system-.aarch64)<br>
<br>
3) Used make dist-xen XEN_TARGET_ARCH=3Darm64 CROSS_COMPILE=3Daarch64-linux=
-gn<wbr>u-=C2=A0 for cross compiling and getting Xen binary.<br>
<br>
4) My root is root - root=3D/dev/sda1<br>
</blockquote>
<br></span>
May I ask why the root is different from the example in the wiki page? Are =
you using a different setup for the disk (e.g no virtio)?</blockquote><div>=
<br></div><div>=C2=A0 =C2=A0 Chaitanya - For building linux I am using buil=
droot toolchain (my root is /path/to/rootfs.cpio) and I able to run the lin=
ux on ARM64 (Qemu).=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=
=3D""><br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
<br>
<br>
After running the =C2=A0last step UEFI Prompt opens and it gives me this er=
ror.<br>
</blockquote>
<br></span>
What do you mean? Which last step?<span class=3D""><br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
<br>
error: no such device: root.<br>
</blockquote>
<br></span>
This is coming from UEFI, right?</blockquote><div>=C2=A0=C2=A0</div><div>=
=C2=A0 =C2=A0Chaitanya - Yes it was. But I changed the root and it worked f=
or me.=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D""><br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
<br>
Press any key to continue...<br>
EFI stub: Booting Linux Kernel...<br>
</blockquote>
<br></span>
This is booting Linux and not Xen. It is also trying to using ACPI rather t=
han DT. Would it be possible for you to drop to the UEFI shell and try to b=
oot by hand?</blockquote><div>=C2=A0 =C2=A0</div><div>=C2=A0 =C2=A0Chaitany=
a -=C2=A0 Yes. I am trying that but I am unable to find fs0: in the mapping=
 table of qemu. (It is showing only BLK0: and BLK1:)</div><div>=C2=A0 =C2=
=A0I have xen.cfg and xen.efi in the root@127.0.0.1:/boot/efi folder but I =
am unable to reach to that folder from qemu UEFI.</div><div>=C2=A0 =C2=A0 =
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex"><span class=3D""><br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
EFI stub: Using DTB from configuration table<br>
EFI stub: Exiting boot services and installing virtual address map...<br>
[=C2=A0=C2=A0 11.231789] acpi PNP0A08:00: Bus 0000:00 not present in PCI na=
mespace<br>
[=C2=A0=C2=A0 41.972816] NMI watchdog: BUG: soft lockup - CPU#1 stuck for 2=
3s! [swapper/0:1]<br>
[=C2=A0 229.940369] NMI watchdog: BUG: soft lockup - CPU#0 stuck for 23s! [=
swapper/0:1]<br>
[=C2=A0 257.939966] NMI watchdog: BUG: soft lockup - CPU#0 stuck for 23s! [=
swapper/0:1]<br>
[=C2=A0 290.035395] NMI watchdog: BUG: soft lockup - CPU#3 stuck for 23s! [=
swapper/0:1]<br>
[=C2=A0 303.595373] kvm [1]: error: no compatible GIC node found<br>
[=C2=A0 303.619405] kvm [1]: error initializing Hyp mode: -19<br>
<br>
I am unable to find the root cause of this issue. Please can anyone help me=
 with this.<br>
</blockquote>
<br></span>
Cheers,<span class=3D"HOEnZb"><font color=3D"#888888"><br>
<br>
-- <br>
Julien Grall<br></font></span></blockquote><div><br></div><div>Thanks,<br>C=
haitanya=C2=A0</div><div><br></div><div><br></div></div><br></div></div>

--0000000000003f63e6056d5a3ea0--


--===============2460717586343782493==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2460717586343782493==--
