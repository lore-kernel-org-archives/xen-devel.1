From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: Porting XEN hypervisor on iMX8QM
Date: Tue, 6 Nov 2018 10:59:12 -0800 (PST)
Message-ID: <alpine.DEB.2.10.1811061053370.18518@sstabellini-ThinkPad-X260>
References: <CAAxnE7vgDxcekeE04z_Ps7mJ9EX6W9a=U+r765GKStuZNonBMw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="8323329-1753675011-1541530424=:18518"
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <CAAxnE7vgDxcekeE04z_Ps7mJ9EX6W9a=U+r765GKStuZNonBMw@mail.gmail.com>
Content-ID: <alpine.DEB.2.10.1811061053530.18518@sstabellini-ThinkPad-X260>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ravi Pichholiya <pichholiyaravi@gmail.com>
Cc: julien.grall@arm.com, sstabellini@kernel.org, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1753675011-1541530424=:18518
Content-Type: TEXT/PLAIN; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.10.1811061053531.18518@sstabellini-ThinkPad-X260>

Hi Ravi,

Please have a look at our wiki as a reference:
http://wiki.xenproject.org/wiki/Xen_ARM_with_Virtualization_Extensions

I would start from cross-compiling the Xen hypervisor (the xen/
directory), no need to build the Xen userspace tools initially.
Make sure to have the right early boot uart driver, see
CONFIG_EARLY_PRINTK and docs/misc/arm/early-printk.txt.

After you boot the Xen binary from uboot, you should be able to see some
console output from the hypervisror. The step after that is booting
Dom0.

Cheers,

Stefano

On Mon, 5 Nov 2018, Ravi Pichholiya wrote:
> Hi Stefano,
> This is in reference to our LinkedIn discussion, in our one of the project we need to port XEN hypervisor on iMx8QM.
> 
> Request you to share what all visibility we should require from boot prospective as currently we are having access to Device tree
> and U-boot source code only. Is access to any other files are also required?
> 
> Also some reference to start with the porting of XEN if available with you.
> 
> Thanks & Regards,
> Ravi Pichholiya
> 
> 
--8323329-1753675011-1541530424=:18518
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-1753675011-1541530424=:18518--
