From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: RFC: Boot Domain, domB
Date: Fri, 29 Jun 2018 15:09:32 -0700 (PDT)
Message-ID: <alpine.DEB.2.10.1806291416480.23811@sstabellini-ThinkPad-X260>
References: <CACMJ4Gai_dq5ZtA6cT5s8cv0MuKyTZw99D93FO7gNe_4G4y89g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="8323329-920733245-1530308517=:23811"
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ukoo=jp=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1fZ1aC-0000ZU-Jg
 for xen-devel@lists.xenproject.org; Fri, 29 Jun 2018 22:09:36 +0000
In-Reply-To: <CACMJ4Gai_dq5ZtA6cT5s8cv0MuKyTZw99D93FO7gNe_4G4y89g@mail.gmail.com>
Content-ID: <alpine.DEB.2.10.1806291442110.23811@sstabellini-ThinkPad-X260>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: Lars Kurth <lars.kurth@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Jason Andryuk <jandryuk@gmail.com>, Daniel Smith <dpsmith@apertussolutions.com>, Andrew Cooper <andrew.cooper3@citrix.com>, openxt <openxt@googlegroups.com>, julien.grall@arm.com, Rich Persaud <persaur@gmail.com>, Jan Beulich <jbeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-920733245-1530308517=:23811
Content-Type: TEXT/PLAIN; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.10.1806291442111.23811@sstabellini-ThinkPad-X260>

On Tue, 19 Jun 2018, Christopher Clark wrote:
> Hello,
> 
> Mixed-criticality and safety-critical systems under development need support for timely boot of multiple domains at system launch
> -- “Initial Domains” -- with static assignment of resources between them, each isolated from the others and without runtime
> dependency on a “dom0”-type domain.
> 
> The Xen hypervisor currently contains a section of fixed policy logic for creation of a single, highly-privileged domain “dom0”
> at system boot.
> 
> We would like to establish a shared understanding of best practice for configuration and deployment of disaggregated system
> launch with multiple domains, for production systems, on both x86 and ARM platforms.
> 
> Correctness and integrity of system launch is fundamental to system security.
> 
> Maximizing the commonality between deployed Xen systems enables pooling of risk and widens the applicability of testing that is
> performed.
> 
> ## Requirements:
> 
> * Enable fast launch of multiple domains at system boot.
> * Obtain the boot materials for Initial Domains -- config, kernel image, optional ramdisk -- from host boot binaries.
> * A system initialization process that is appropriate for both ARM and x86.
> * Support minimization of audit work required for safety critical certification
>     * Favour reduction of code size and complexity of highest-privilege components.
>     * Decouple and isolate logic in support of simplifying validation by enabling reasoning about the interfaces between
> components.
> * Remove the policy logic for initial distribution of privileges from the hypervisor.
>     * Aim to simplify and consolidate the hypervisor code for system launch.
>     * Allow flexibility of different initial domain configurations by disaggregation to an external component.
>     * Separate the mechanisms of privilege assignment, necessarily within the hypervisor, from the implementation of policy logic
> assigning them to specific domains.
> * Support measured launch (e.g. TXT/SKINIT) and verified launch (e.g. Secure Boot) to include the ability to measure/verify any
> or all Initial Domains.
> * Support for manageable processes for the system boot binaries.
>     * ie. Consider: creation of files, updates to files, build-time tooling, run-time tooling, dependencies of components.
>     * Note that Device Tree tooling is foreign for booting x86.
> * Do not make Initial Domain creation depend upon parsing complex data structures, such as a Device Tree, within the hypervisor.
>     * The parsing is unwanted attack surface.
>     * A static, unchanging Device Tree binary used just for hardware-enablement increases commonality across deployments, and is
> easier to place trust in than one that changes according to the specific installed software configuration.
> * Support configuration of XSM security labels for the Initial Domains.

This approach is orthogonal to my dom0less step1 series, and I have no
problems with having both of them implemented in the hypervisor.

My dom0less approach is optimized for static partitioning scenarios,
where you only have 2-4 VMs total, you don't want a dom0 running on your
system, you don't want to boot additional VMs ever, and you don't have
PV drivers (all devices are assigned). For those scenarios, I don't
think we can do better than dom0less for simplicity and performance.
Your approach is optimized for different use-cases. It is OK to use
different solutions for different use-cases.

However, given that you are calling out Device Tree a few times in this
document as a reason for using a different approach, I'll reply here to
the specific points you raised. I do think you are wrong on those
points. However, it doesn't necessarely mean you don't have a good
reason for doing things differently regardless.


1) multiboot is not the same thing as device tree

My solution is based on extending the existing multiboot protocol to
pass more than one kernel/ramdisk for booting. It just happens that the
multiboot protocol on ARM is enterely based on device tree. On x86, you
could do the same as my dom0less series by extending the x86 multiboot
protocol. Given that multiboot on x86 is not based on device tree, you
don't need to touch anything related to device tree to make it work.


2) device tree is not an attack vector

My solution on ARM is based on extending multiboot, hence device tree.
Device Tree is already parsed by Xen using libfdt. It doesn't require
parsing additional complex data structure, as Xen on ARM is already
capable of parsing device tree and dom0 kernel and ramdisk options. I
only made those options generic. On x86, you would extend multiboot and
still wouldn't need to add any device tree parsing to Xen on x86.

Also, on ARM the device tree binary comes from elsewhere, not from the
dom0 filesystem. In secure deployments, it cannot be modified by dom0.
Thus, I cannot see how it could be used as an attack vector.


3) device tree can still be static

As I wrote, the device tree typically comes from elsewhere. On ARM, I
expect it would be modified by the platform integrator once and never
again. It is also possible to modify it at boot time from U-Boot with a
static set of U-Boot commands. In both cases, the system integrator
would make these changes only once, and could properly sign the device
tree binary. From Xen's point of view the device tree would be static.
Regardless, on x86 dom0less would not be based on device tree but on
multiboot.


In conclusion, please remove the requirements above about not having
device tree because they are not relevant. Instead, please explain why a
multiboot based solution would not be a good fit for your use case.
Specifically, if the purpose is to boot the TPM manager domain, wouldn't
it be possible to use multiboot for that?

In any case, I don't see this as an alternative to dom0less -- it is
complementary.  Let's keep future conversations about this proposal
separate.

Speaking about other uses for this technology, I think it would be
useful in embedded to have a feature that allows Dom0 to deprivilege
itself down to a regular DomU after booting the required VMs. I don't
know if what you are suggestion would help with that but I thought it
would be good to keep that in mind.

--8323329-920733245-1530308517=:23811
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-920733245-1530308517=:23811--
