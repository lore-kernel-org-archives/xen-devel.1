From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: Query for running Xen on ARM
Date: Tue, 29 May 2018 13:06:13 -0700 (PDT)
Message-ID: <alpine.DEB.2.10.1805291305050.5563@sstabellini-ThinkPad-X260>
References: <CA+a_UndTaAP0XCssMCqTHVcGT1wnbmZHaohkfx33=tDU6Bq2Dw@mail.gmail.com>
 <ec0d7373-bcc1-2197-231b-aec07a3efb2e@arm.com>
 <CA+a_Une7WFRaZtb5vjA3DNjf614nKFO+5Aa1QD8vV9CjeNHiRA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="8323329-2073441678-1527624378=:5563"
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=g2yr=iq=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1fNksw-0007bJ-6F
 for xen-devel@lists.xenproject.org; Tue, 29 May 2018 20:06:22 +0000
In-Reply-To: <CA+a_Une7WFRaZtb5vjA3DNjf614nKFO+5Aa1QD8vV9CjeNHiRA@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Chaitanya Deshpande <chaitanyagd11@gmail.com>
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-2073441678-1527624378=:5563
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: 8BIT

FS0: is mapped to the first partition on your disk, that needs to be
formatted with the FAT filesystem. Do you have a FAT partition on your
disk?

On Tue, 29 May 2018, Chaitanya Deshpande wrote:
> Hi Stefano, Julien,
> I am able to solve that problem. Now the problem I am facing is my qemu is unable to find file system from EFI.
> 
> Please find attached copy with this Email.
> 
> No fs0: in mapping table. (Only BLK0: and BLK1:)
> 
> Thanks,
> Chaitanya
> 
> On Tue, May 29, 2018 at 7:35 AM, Julien Grall <julien.grall@arm.com> wrote:
>       (+Stefano)
> 
>       On 27/05/18 18:48, Chaitanya Deshpande wrote:
>             Hi,
> 
> 
>       Hello Chaitanya,
> 
>             I am Chaitanya, pursuing my master’s degree from Portland State University in Embedded Systems.
> 
>             I have started working on Xen Project and I am beginner in this field.
> 
>             I have followed all the steps which are given in this link –
> 
>             https://wiki.xenproject.org/wiki/Xen_ARM_with_Virtualization_Extensions/qemu-system-aarch64
> 
>             https://wiki.xenproject.org/wiki/Xen_ARM_with_Virtualization_Extensions#Building_Xen_on_ARM
> 
> 
>             1) I have used buildroot(rootfs.cpio) for building Linux.
> 
>             2) I have succeeded in booting Linux on Qemu (qemu-system-.aarch64)
> 
>             3) Used make dist-xen XEN_TARGET_ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu-  for cross compiling and
>             getting Xen binary.
> 
>             4) My root is root - root=/dev/sda1
> 
> 
>       May I ask why the root is different from the example in the wiki page? Are you using a different setup for the disk
>       (e.g no virtio)?
> 
> 
> 
>             After running the  last step UEFI Prompt opens and it gives me this error.
> 
> 
>       What do you mean? Which last step?
> 
> 
>             error: no such device: root.
> 
> 
>       This is coming from UEFI, right?
> 
> 
>             Press any key to continue...
>             EFI stub: Booting Linux Kernel...
> 
> 
>       This is booting Linux and not Xen. It is also trying to using ACPI rather than DT. Would it be possible for you to
>       drop to the UEFI shell and try to boot by hand?
> 
>             EFI stub: Using DTB from configuration table
>             EFI stub: Exiting boot services and installing virtual address map...
>             [   11.231789] acpi PNP0A08:00: Bus 0000:00 not present in PCI namespace
>             [   41.972816] NMI watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [swapper/0:1]
>             [  229.940369] NMI watchdog: BUG: soft lockup - CPU#0 stuck for 23s! [swapper/0:1]
>             [  257.939966] NMI watchdog: BUG: soft lockup - CPU#0 stuck for 23s! [swapper/0:1]
>             [  290.035395] NMI watchdog: BUG: soft lockup - CPU#3 stuck for 23s! [swapper/0:1]
>             [  303.595373] kvm [1]: error: no compatible GIC node found
>             [  303.619405] kvm [1]: error initializing Hyp mode: -19
> 
>             I am unable to find the root cause of this issue. Please can anyone help me with this.
> 
> 
>       Cheers,
> 
>       --
>       Julien Grall
> 
> 
> 
> 
--8323329-2073441678-1527624378=:5563
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-2073441678-1527624378=:5563--
