From: Chaitanya Deshpande <chaitanyagd11@gmail.com>
Subject: Re: Query for running Xen on ARM
Date: Wed, 30 May 2018 10:21:58 -0700
Message-ID: <CA+a_UneGpJ4w+aPkOQx9BZCAFvFAwDJgzWb0SspPzhjoi=uEng@mail.gmail.com>
References: <CA+a_UndTaAP0XCssMCqTHVcGT1wnbmZHaohkfx33=tDU6Bq2Dw@mail.gmail.com>
 <ec0d7373-bcc1-2197-231b-aec07a3efb2e@arm.com>
 <CA+a_Une7WFRaZtb5vjA3DNjf614nKFO+5Aa1QD8vV9CjeNHiRA@mail.gmail.com>
 <alpine.DEB.2.10.1805291305050.5563@sstabellini-ThinkPad-X260>
 <CA+a_UndZ_7E9JNBPwVsfAjPP4PPwx2ter87q9ioDnEE5PiNS_g@mail.gmail.com>
 <alpine.DEB.2.10.1805300906590.23991@sstabellini-ThinkPad-X260>
 <f24216bf-37b9-310c-5865-e062b0c181f9@arm.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1461336723690859892=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=kxua=ir=gmail.com=chaitanyagd11@srs-us1.protection.inumbo.net>)
 id 1fO4nw-00034O-5b
 for xen-devel@lists.xenproject.org; Wed, 30 May 2018 17:22:32 +0000
Received: by mail-ot0-x232.google.com with SMTP id l12-v6so22045155oth.6
 for <xen-devel@lists.xenproject.org>; Wed, 30 May 2018 10:22:00 -0700 (PDT)
In-Reply-To: <f24216bf-37b9-310c-5865-e062b0c181f9@arm.com>
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

--===============1461336723690859892==
Content-Type: multipart/alternative; boundary="000000000000a1b017056d6f96ce"

--000000000000a1b017056d6f96ce
Content-Type: text/plain; charset="UTF-8"

On Wed, May 30, 2018 at 9:44 AM, Julien Grall <julien.grall@arm.com> wrote:

> Hi,
>
> On 05/30/2018 05:18 PM, Stefano Stabellini wrote:
>
>> I am not sure what the problem is. I would compared your partition table
>> with a standard Linux distro UEFI image [1] to see if there are any
>> important differences. Checkout the UEFI spec [2] section 13.3.1 onward
>> to read the details of the partitions and filesystem requirements.
>>
>
> I may have an idea of what's going on. Looking at the picture sent, The
> disk you show seems to be the one used by your Ubuntu running in
> VirtualBox. This seems to be confirmed by your previous e-mail where you
> mention sda1. Am I right?
>
>    Chaitanya - Yes you are absolutely right. I have Virtualbox on which I
am running Ubuntu.  And I have sda1 disk (bootable) which is FAT32
   (1st partition for mapping fs0:).



> You need to create that partition in the image used by QEMU. But likely
> this will already be there if you use a pre-built image (e.g ubuntu or
> else). I am assuming you were booting Linux using UEFI.
>

  Chaitanya: I able to boot Linux through UEFI because I have root =
rootfs.cpio which I created from buildroot. And in config file of Linux I
have put INITRAMFS =        "rootfs.cpio" . So do you want me to give
root=/dev/sda1 while booting Linux on qemu?

>
> Cheers,
>
> --
> Julien Grall
>

Thanks,
Chaitanya

--000000000000a1b017056d6f96ce
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Wed, May 30, 2018 at 9:44 AM, Julien Grall <span dir=3D"ltr">&lt;<a =
href=3D"mailto:julien.grall@arm.com" target=3D"_blank">julien.grall@arm.com=
</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>Hi,<span class=3D"gmail-"><br>
<br>
On 05/30/2018 05:18 PM, Stefano Stabellini wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
I am not sure what the problem is. I would compared your partition table<br=
>
with a standard Linux distro UEFI image [1] to see if there are any<br>
important differences. Checkout the UEFI spec [2] section 13.3.1 onward<br>
to read the details of the partitions and filesystem requirements.<br>
</blockquote>
<br></span>
I may have an idea of what&#39;s going on. Looking at the picture sent, The=
 disk you show seems to be the one used by your Ubuntu running in VirtualBo=
x. This seems to be confirmed by your previous e-mail where you mention sda=
1. Am I right?<br>
<br></blockquote><div>=C2=A0 =C2=A0Chaitanya - Yes you are absolutely right=
. I have Virtualbox on which I am running Ubuntu.=C2=A0 And I have sda1 dis=
k (bootable) which is FAT32=C2=A0</div><div>=C2=A0 =C2=A0(1st partition for=
 mapping fs0:).</div><div><br></div><div>=C2=A0</div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">
You need to create that partition in the image used by QEMU. But likely thi=
s will already be there if you use a pre-built image (e.g ubuntu or else). =
I am assuming you were booting Linux using UEFI.<br></blockquote><div><br><=
/div><div>=C2=A0 Chaitanya: I able to boot Linux through UEFI because I hav=
e root =3D rootfs.cpio which I created from buildroot. And in config file o=
f Linux I have put INITRAMFS =3D=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;rootfs.cp=
io&quot; . So do you want me to give root=3D/dev/sda1 while booting Linux o=
n qemu?</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Cheers,<span class=3D"gmail-HOEnZb"><font color=3D"#888888"><br>
<br>
-- <br>
Julien Grall<br></font></span></blockquote><div><br></div><div>Thanks,<br>C=
haitanya=C2=A0</div></div><br></div></div>

--000000000000a1b017056d6f96ce--


--===============1461336723690859892==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1461336723690859892==--
