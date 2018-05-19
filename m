From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [MirageOS-devel] ViryaOS: proposal for a new Xen
 Project sub-project
Date: Fri, 18 May 2018 17:15:10 -0700 (PDT)
Message-ID: <alpine.DEB.2.10.1805181346260.4520__7040.05880184031$1526688878$gmane$org@sstabellini-ThinkPad-X260>
References: <alpine.DEB.2.10.1805141008200.8839@sstabellini-ThinkPad-X260>
 <8871A069-486C-47E4-BE2B-DAF5DABCCDD1@xenproject.org>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="8323329-1099481016-1526676397=:4520"
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=xhg0=ig=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1fJpX6-0003So-BT
 for xen-devel@lists.xenproject.org; Sat, 19 May 2018 00:15:36 +0000
In-Reply-To: <8871A069-486C-47E4-BE2B-DAF5DABCCDD1@xenproject.org>
Content-ID: <alpine.DEB.2.10.1805181715000.4520@sstabellini-ThinkPad-X260>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Lars Kurth <lars.kurth.xen@gmail.com>
Cc: lars.kurth@citrix.com, rajiv.ranganath@atihita.com, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, xen-api@lists.xenproject.org, minios-devel@lists.xenproject.org, julien.grall@arm.com, Committers <committers@xenproject.org>, mirageos-devel@lists.xenproject.org, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1099481016-1526676397=:4520
Content-Type: TEXT/PLAIN; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.10.1805181715001.4520@sstabellini-ThinkPad-X260>

Thank you, Lars.

On Fri, 18 May 2018, Lars Kurth wrote:
> Hi Stefano,
> what we also need for the project proposal are
> 
> Sponsor: A sponsor can be a member of the project leadership team of a mature project, a member of the advisory board or the
> community manager. This ensures that a distinguished community member supports the idea behind the project.
> I would suggest that maybe someone from ARM (e.g. Thomas - member of the AB, or Julien - leadership team member) sponsors the
> project. There is no work involved.
> 
> Mentor: I am happy to pick this up
> 
> Regards
> Lars
> 
> 
>       On 17 May 2018, at 23:31, Stefano Stabellini <sstabellini@kernel.org> wrote:
> 
> Hi all,
> 
> Following up from previous conversations with the committers, I am
> appending a proposal for a new Xen Project sub-project aimed at embedded
> and IoT. Let me know if you have questions or suggestions. Also,
> sponsors are very welcome! :-)
> 
> 
> What do you mean by sponsors in this context? A sponsor as required by the process, or a show of hand as to who would be
> interested in participating in the effort? Or something else?
> 
> 
>       FYI, I also have a presentation on ViryaOS at Xen Developer Summit, I am
>       looking forward to it!
> 
>       Cheers,
> 
>       Stefano
> 
>       ---
> 
> 
>       # ViryaOS
> 
>       ## Mission
> 
>       To create and support open source Xen based tools that help users build
>       end-to-end secure embedded systems.
> 
> 
>       ## The Problem
> 
>       Xen enables highly secure, flexible architectures, suitable for widely
>       different embedded use-cases, from industrial to IoT and cloud. However,
>       putting a Xen based system together is still a complex endeavor. It is
>       even harder to configure it to be as secure as possible. In the Xen
>       ecosystem, we lack a unifying effort to help with the integration
>       challenges that anybody building Xen-based systems is facing. Setting up
>       a Xen based system takes too long and it is too hard for both users and
>       developers.
> 
>       Today, many of us are spending time, effort and money to maintain their
>       own build systems and techniques for generating VM configurations,
>       resulting in significant duplication of efforts. These scripts and tools
>       could be more powerful if we worked on them together. It would cost
>       less to maintain them as a shared project, and eventually, they would be
>       more flexible and of better quality.
> 
> 
>       ## The Solution
> 
>       The solution is to unify our efforts behind a single open source
>       project, that will focus our collective development efforts on a shared
>       set of components.
> 
>       The new project is ViryaOS, a multi-vendor open source collaborative
>       effort. ViryaOS will create a highly secure easy-to-use development
>       platform for Xen based systems aimed at IoT and embedded environments.
>       It will make it easier for engineers to develop secure Xen-based
>       platforms. In addition, ViryaOS will produce ready-to-use binary images
>       to help users and system integrators get started with Xen
>       on embedded systems.
> 
>       ViryaOS will provide the space for us and others to collaborate. As a
>       unified group, it will be easier to approach hardware vendors and
>       partners to discuss support for ViryaOS.
> 
>       Users will be able to build and deploy Xen-based disaggregated
>       architectures quickly and easily on x86 and ARM SoCs. ViryaOS will support
>       as many hardware platforms as possible, as many guest operating systems
>       as possible (including RTOSes and proprietary OSes), and highly
>       heterogeneous environments. ViryaOS will meet low power consumption
>       requirements.
> 
>       ViryaOS will be secure out of the box. Unlike traditional operating
>       system designs based on a monolithic kernel, ViryaOS takes a microkernel
>       approach. ViryaOS will come with driver and service domains. The
>       security and manageability of the platform are achieved through security
>       by compartmentalization and privilege separation to minimize the attack
>       surface of the "supervisor" component (the part of the system capable of
>       unconstrained access to the underlying hardware).
> 
>       All workloads will be supported. Virtual machines, containers, baremetal
>       applications and unikernels will all be first-class "applications"
>       running on ViryaOS. ViryaOS will support running containers natively and
>       securely by transparently spawning Xen virtual machines for isolation.
> 
> 
>       ## Build and Output
> 
>       ViryaOS will come with the tools to build Xen, Dom0, multiple VMs (with
>       or without device assignement) and assemble the complete system. The
>       build will rely on containers to shorten the build time and to make it
>       easier to reuse any single component. The output will include the
>       following binaries:
> 
>       * Xen
>       * the Dom0 kernel (Linux)
>       * the Dom0 filesystem
>       * a disaggregated set of Service Domains, including their kernels,
>        disk images and configurations (Service Domains include drivers
>        domains and management VMs)
>       * any number of user-provided containers and VMs
> 
>       The result will be a ready-to-use system image with all the pieces
>       already included. The image will be small, suitable for embedded systems
>       and IoT.
> 
>       Users will be able to select different components and configurations at
>       build time, resulting in different outputs. Cross-compilation will be
>       supported.
> 
>       ViryaOS will be able to use Yocto and/or existing distros such as Alpine
>       Linux to build some, or all, of its components. Anything could be used
>       as long as it can be built inside a container and the output follows a
>       specified format.
> 
>       As the key enabler for Service Domains, device assignment will be
>       supported on both ARM and x86 to the best of the capabilities of the
>       hardware. The image will contain all the necessary configurations
>       (device tree manipulations, Xen command line arguments, etc) to make
>       device assignment work out of the box.
> 
> 
>       ## Security
> 
>       Security is one of ViryaOS's key attributes. The hardware capabilities
>       can differ for different boards, with some having TPM support and other
>       TEE (trusted execution environment) support. When the hardware supports
>       it, ViryaOS will use secure/measured boot on Intel and ARM, using the
>       best technologies available in hardware (such as Intel TXT and ARM
>       TrustZone).
> 
> 
>       ## Hardware Support
> 
>       ViryaOS will support as many hardware platforms as possible, x86 and ARM
>       (ARMv8). Given that TPM and VT-d are (almost) ubiquitous on Intel
>       platform, they can be requirements for ViryaOS. On the ARM side, many
>       SoCs don't have equivalent functionalities yet (SMMU and TEE). ViryaOS
>       will support running on them, although with limited functionalities.
> 
>       ### x86 Requirements
>       * Intel VT-x or AMD-V
>       * 1G RAM
>       * Intel VT-d or AMD-Vi
>       * Intel TPM
>       * 1 serial port for development
> 
>       ### ARM Requirements
>       #### Hard Requirements
>       * ARMv8 (Xen 64-bit)
>       * 1G RAM or better
>       * 1 network interface
> 
>       #### Soft Requirements
>       * SMMU and a Xen driver, for device assignment (today only ARM
>        SMMUv1 and SMMUv2 are supported in Xen)
>       * TPM-like functionalities for secure key storage and secure boot
>       * 1 serial port for development
>       * Device Tree for firmware tables
> 
> 
>       ## Open Source
> 
>       ViryaOS is a multi-vendor collaborative open source project. ViryaOS
>       will consume other upstream projects, such as the Linux kernel, Xen
>       Project, Alpine Linux, and Yocto. For convenience, ViryaOS might use
>       private clones of these repositories, but ViryaOS will not diverge from
>       upstream in any meaningful way. Changes to ViryaOS's private clones of
>       upstream repositories will only be temporary, small-scoped and
>       inconsequential.  ViryaOS will remain as close as possible to upstream
>       Xen and Linux.
> 
> 
>       ## Certifications
> 
>       For many ViryaOS use-cases safety certifications are critical. As an
>       open source project, ViryaOS will attempt at producing an easily
>       certifiable software stack.
> 
> 
>       ## License
> 
>       A permissive license is the best fit for this project. Apache 2.0 is the
>       option of choice because of the clause covering patents.
> 
> 
>       ## Roles
> 
>       Project Lead: Stefano Stabellini <sstabellini@kernel.org>
> 
>       _______________________________________________
>       MirageOS-devel mailing list
>       MirageOS-devel@lists.xenproject.org
>       https://lists.xenproject.org/mailman/listinfo/mirageos-devel
> 
> 
> 
> 
--8323329-1099481016-1526676397=:4520
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-1099481016-1526676397=:4520--
