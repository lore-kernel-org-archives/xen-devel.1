From: Lars Kurth <lars.kurth.xen@gmail.com>
Subject: Re: [MirageOS-devel] ViryaOS: proposal for a new Xen
 Project sub-project
Date: Fri, 18 May 2018 11:50:52 +0100
Message-ID: <8871A069-486C-47E4-BE2B-DAF5DABCCDD1__23383.1869591542$1526640732$gmane$org@xenproject.org>
References: <alpine.DEB.2.10.1805141008200.8839@sstabellini-ThinkPad-X260>
Mime-Version: 1.0 (Mac OS X Mail 11.3 \(3445.6.18\))
Content-Type: multipart/mixed; boundary="===============7017454862708769936=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=i+hb=if=gmail.com=lars.kurth.xen@srs-us1.protection.inumbo.net>)
 id 1fJd0i-0002zI-6b
 for xen-devel@lists.xenproject.org; Fri, 18 May 2018 10:53:20 +0000
In-Reply-To: <alpine.DEB.2.10.1805141008200.8839@sstabellini-ThinkPad-X260>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: lars.kurth@citrix.com, rajiv.ranganath@atihita.com, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, xen-api@lists.xenproject.org, minios-devel@lists.xenproject.org, julien.grall@arm.com, Committers <committers@xenproject.org>, mirageos-devel@lists.xenproject.org, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org


--===============7017454862708769936==
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_44428F54-27C9-4476-BEA1-F5A3230A0B83"


--Apple-Mail=_44428F54-27C9-4476-BEA1-F5A3230A0B83
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Hi Stefano,

what we also need for the project proposal are

Sponsor: A sponsor can be a member of the project leadership team of a =
mature project, a member of the advisory board or the community manager. =
This ensures that a distinguished community member supports the idea =
behind the project.
I would suggest that maybe someone from ARM (e.g. Thomas - member of the =
AB, or Julien - leadership team member) sponsors the project. There is =
no work involved.

Mentor: I am happy to pick this up

Regards
Lars


> On 17 May 2018, at 23:31, Stefano Stabellini <sstabellini@kernel.org> =
wrote:
>=20
> Hi all,
>=20
> Following up from previous conversations with the committers, I am
> appending a proposal for a new Xen Project sub-project aimed at =
embedded
> and IoT. Let me know if you have questions or suggestions. Also,
> sponsors are very welcome! :-)

What do you mean by sponsors in this context? A sponsor as required by =
the process, or a show of hand as to who would be interested in =
participating in the effort? Or something else?

>=20
> FYI, I also have a presentation on ViryaOS at Xen Developer Summit, I =
am
> looking forward to it!
>=20
> Cheers,
>=20
> Stefano
>=20
> ---
>=20
>=20
> # ViryaOS
>=20
> ## Mission
>=20
> To create and support open source Xen based tools that help users =
build
> end-to-end secure embedded systems.
>=20
>=20
> ## The Problem
>=20
> Xen enables highly secure, flexible architectures, suitable for widely
> different embedded use-cases, from industrial to IoT and cloud. =
However,
> putting a Xen based system together is still a complex endeavor. It is
> even harder to configure it to be as secure as possible. In the Xen
> ecosystem, we lack a unifying effort to help with the integration
> challenges that anybody building Xen-based systems is facing. Setting =
up
> a Xen based system takes too long and it is too hard for both users =
and
> developers.
>=20
> Today, many of us are spending time, effort and money to maintain =
their
> own build systems and techniques for generating VM configurations,
> resulting in significant duplication of efforts. These scripts and =
tools
> could be more powerful if we worked on them together. It would cost
> less to maintain them as a shared project, and eventually, they would =
be
> more flexible and of better quality.
>=20
>=20
> ## The Solution
>=20
> The solution is to unify our efforts behind a single open source
> project, that will focus our collective development efforts on a =
shared
> set of components.
>=20
> The new project is ViryaOS, a multi-vendor open source collaborative
> effort. ViryaOS will create a highly secure easy-to-use development
> platform for Xen based systems aimed at IoT and embedded environments.
> It will make it easier for engineers to develop secure Xen-based
> platforms. In addition, ViryaOS will produce ready-to-use binary =
images
> to help users and system integrators get started with Xen
> on embedded systems.
>=20
> ViryaOS will provide the space for us and others to collaborate. As a
> unified group, it will be easier to approach hardware vendors and
> partners to discuss support for ViryaOS.
>=20
> Users will be able to build and deploy Xen-based disaggregated
> architectures quickly and easily on x86 and ARM SoCs. ViryaOS will =
support
> as many hardware platforms as possible, as many guest operating =
systems
> as possible (including RTOSes and proprietary OSes), and highly
> heterogeneous environments. ViryaOS will meet low power consumption
> requirements.
>=20
> ViryaOS will be secure out of the box. Unlike traditional operating
> system designs based on a monolithic kernel, ViryaOS takes a =
microkernel
> approach. ViryaOS will come with driver and service domains. The
> security and manageability of the platform are achieved through =
security
> by compartmentalization and privilege separation to minimize the =
attack
> surface of the "supervisor" component (the part of the system capable =
of
> unconstrained access to the underlying hardware).
>=20
> All workloads will be supported. Virtual machines, containers, =
baremetal
> applications and unikernels will all be first-class "applications"
> running on ViryaOS. ViryaOS will support running containers natively =
and
> securely by transparently spawning Xen virtual machines for isolation.
>=20
>=20
> ## Build and Output
>=20
> ViryaOS will come with the tools to build Xen, Dom0, multiple VMs =
(with
> or without device assignement) and assemble the complete system. The
> build will rely on containers to shorten the build time and to make it
> easier to reuse any single component. The output will include the
> following binaries:
>=20
> * Xen
> * the Dom0 kernel (Linux)
> * the Dom0 filesystem
> * a disaggregated set of Service Domains, including their kernels,
>  disk images and configurations (Service Domains include drivers
>  domains and management VMs)
> * any number of user-provided containers and VMs
>=20
> The result will be a ready-to-use system image with all the pieces
> already included. The image will be small, suitable for embedded =
systems
> and IoT.
>=20
> Users will be able to select different components and configurations =
at
> build time, resulting in different outputs. Cross-compilation will be
> supported.
>=20
> ViryaOS will be able to use Yocto and/or existing distros such as =
Alpine
> Linux to build some, or all, of its components. Anything could be used
> as long as it can be built inside a container and the output follows a
> specified format.
>=20
> As the key enabler for Service Domains, device assignment will be
> supported on both ARM and x86 to the best of the capabilities of the
> hardware. The image will contain all the necessary configurations
> (device tree manipulations, Xen command line arguments, etc) to make
> device assignment work out of the box.
>=20
>=20
> ## Security
>=20
> Security is one of ViryaOS's key attributes. The hardware capabilities
> can differ for different boards, with some having TPM support and =
other
> TEE (trusted execution environment) support. When the hardware =
supports
> it, ViryaOS will use secure/measured boot on Intel and ARM, using the
> best technologies available in hardware (such as Intel TXT and ARM
> TrustZone).
>=20
>=20
> ## Hardware Support
>=20
> ViryaOS will support as many hardware platforms as possible, x86 and =
ARM
> (ARMv8). Given that TPM and VT-d are (almost) ubiquitous on Intel
> platform, they can be requirements for ViryaOS. On the ARM side, many
> SoCs don't have equivalent functionalities yet (SMMU and TEE). ViryaOS
> will support running on them, although with limited functionalities.
>=20
> ### x86 Requirements
> * Intel VT-x or AMD-V
> * 1G RAM
> * Intel VT-d or AMD-Vi
> * Intel TPM
> * 1 serial port for development
>=20
> ### ARM Requirements
> #### Hard Requirements
> * ARMv8 (Xen 64-bit)
> * 1G RAM or better
> * 1 network interface
>=20
> #### Soft Requirements
> * SMMU and a Xen driver, for device assignment (today only ARM
>  SMMUv1 and SMMUv2 are supported in Xen)
> * TPM-like functionalities for secure key storage and secure boot
> * 1 serial port for development
> * Device Tree for firmware tables
>=20
>=20
> ## Open Source
>=20
> ViryaOS is a multi-vendor collaborative open source project. ViryaOS
> will consume other upstream projects, such as the Linux kernel, Xen
> Project, Alpine Linux, and Yocto. For convenience, ViryaOS might use
> private clones of these repositories, but ViryaOS will not diverge =
from
> upstream in any meaningful way. Changes to ViryaOS's private clones of
> upstream repositories will only be temporary, small-scoped and
> inconsequential.  ViryaOS will remain as close as possible to upstream
> Xen and Linux.
>=20
>=20
> ## Certifications
>=20
> For many ViryaOS use-cases safety certifications are critical. As an
> open source project, ViryaOS will attempt at producing an easily
> certifiable software stack.
>=20
>=20
> ## License
>=20
> A permissive license is the best fit for this project. Apache 2.0 is =
the
> option of choice because of the clause covering patents.
>=20
>=20
> ## Roles
>=20
> Project Lead: Stefano Stabellini <sstabellini@kernel.org>
>=20
> _______________________________________________
> MirageOS-devel mailing list
> MirageOS-devel@lists.xenproject.org
> https://lists.xenproject.org/mailman/listinfo/mirageos-devel


--Apple-Mail=_44428F54-27C9-4476-BEA1-F5A3230A0B83
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D"">Hi =
Stefano,<div class=3D""><br class=3D""><div class=3D"">what we also need =
for the project proposal are</div><div class=3D""><br =
class=3D""></div><div class=3D"">Sponsor:&nbsp;<span style=3D"color: =
rgb(51, 51, 51); font-family: Arial, sans-serif; font-variant-ligatures: =
normal; orphans: 2; widows: 2; background-color: rgb(255, 255, 255);" =
class=3D"">A sponsor can be a member of the project leadership team of a =
mature project, a member of the advisory board or the community manager. =
This ensures that a distinguished community member supports the idea =
behind the project.</span></div><div class=3D""><div style=3D"orphans: =
2; widows: 2;" class=3D""><font color=3D"#333333" face=3D"Arial, =
sans-serif" class=3D""><span style=3D"caret-color: rgb(51, 51, 51); =
background-color: rgb(255, 255, 255);" class=3D"">I would suggest that =
maybe someone from ARM (e.g. Thomas - member of the AB, or Julien - =
leadership team member) sponsors the project. There is no work =
involved.</span></font></div><div style=3D"orphans: 2; widows: 2;" =
class=3D""><font color=3D"#333333" face=3D"Arial, sans-serif" =
class=3D""><span style=3D"caret-color: rgb(51, 51, 51); =
background-color: rgb(255, 255, 255);" class=3D""><br =
class=3D""></span></font></div><div style=3D"orphans: 2; widows: 2;" =
class=3D""><font color=3D"#333333" face=3D"Arial, sans-serif" =
class=3D""><span style=3D"background-color: rgb(255, 255, 255);" =
class=3D"">Mentor: I am&nbsp;happy to pick this =
up</span></font></div><div style=3D"orphans: 2; widows: 2;" =
class=3D""><font color=3D"#333333" face=3D"Arial, sans-serif" =
class=3D""><span style=3D"background-color: rgb(255, 255, 255);" =
class=3D""><br class=3D""></span></font></div><div style=3D"orphans: 2; =
widows: 2;" class=3D""><font color=3D"#333333" face=3D"Arial, =
sans-serif" class=3D""><span style=3D"background-color: rgb(255, 255, =
255);" class=3D"">Regards</span></font></div><div style=3D"orphans: 2; =
widows: 2;" class=3D""><font color=3D"#333333" face=3D"Arial, =
sans-serif" class=3D""><span style=3D"background-color: rgb(255, 255, =
255);" class=3D"">Lars</span></font></div><div style=3D"orphans: 2; =
widows: 2;" class=3D""><font color=3D"#333333" face=3D"Arial, =
sans-serif" class=3D""><span style=3D"caret-color: rgb(51, 51, 51); =
background-color: rgb(255, 255, 255);" class=3D""><br =
class=3D""></span></font></div><div><br class=3D""><blockquote =
type=3D"cite" class=3D""><div class=3D"">On 17 May 2018, at 23:31, =
Stefano Stabellini &lt;<a href=3D"mailto:sstabellini@kernel.org" =
class=3D"">sstabellini@kernel.org</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div class=3D"">Hi =
all,<br class=3D""><br class=3D"">Following up from previous =
conversations with the committers, I am<br class=3D"">appending a =
proposal for a new Xen Project sub-project aimed at embedded<br =
class=3D"">and IoT. Let me know if you have questions or suggestions. =
Also,<br class=3D"">sponsors are very welcome! :-)<br =
class=3D""></div></div></blockquote><div><br class=3D""></div>What do =
you mean by sponsors in this context? A sponsor as required by the =
process, or a show of hand as to who would be interested in =
participating in the effort? Or something else?</div><div><br =
class=3D""><blockquote type=3D"cite" class=3D""><div class=3D""><div =
class=3D""><br class=3D"">FYI, I also have a presentation on ViryaOS at =
Xen Developer Summit, I am<br class=3D"">looking forward to it!<br =
class=3D""><br class=3D"">Cheers,<br class=3D""><br class=3D"">Stefano<br =
class=3D""><br class=3D"">---<br class=3D""><br class=3D""><br =
class=3D""># ViryaOS<br class=3D""><br class=3D"">## Mission<br =
class=3D""><br class=3D"">To create and support open source Xen based =
tools that help users build<br class=3D"">end-to-end secure embedded =
systems.<br class=3D""><br class=3D""><br class=3D"">## The Problem<br =
class=3D""><br class=3D"">Xen enables highly secure, flexible =
architectures, suitable for widely<br class=3D"">different embedded =
use-cases, from industrial to IoT and cloud. However,<br =
class=3D"">putting a Xen based system together is still a complex =
endeavor. It is<br class=3D"">even harder to configure it to be as =
secure as possible. In the Xen<br class=3D"">ecosystem, we lack a =
unifying effort to help with the integration<br class=3D"">challenges =
that anybody building Xen-based systems is facing. Setting up<br =
class=3D"">a Xen based system takes too long and it is too hard for both =
users and<br class=3D"">developers.<br class=3D""><br class=3D"">Today, =
many of us are spending time, effort and money to maintain their<br =
class=3D"">own build systems and techniques for generating VM =
configurations,<br class=3D"">resulting in significant duplication of =
efforts. These scripts and tools<br class=3D"">could be more powerful if =
we worked on them together. It would cost<br class=3D"">less to maintain =
them as a shared project, and eventually, they would be<br class=3D"">more=
 flexible and of better quality.<br class=3D""><br class=3D""><br =
class=3D"">## The Solution<br class=3D""><br class=3D"">The solution is =
to unify our efforts behind a single open source<br class=3D"">project, =
that will focus our collective development efforts on a shared<br =
class=3D"">set of components.<br class=3D""><br class=3D"">The new =
project is ViryaOS, a multi-vendor open source collaborative<br =
class=3D"">effort. ViryaOS will create a highly secure easy-to-use =
development<br class=3D"">platform for Xen based systems aimed at IoT =
and embedded environments.<br class=3D"">It will make it easier for =
engineers to develop secure Xen-based<br class=3D"">platforms. In =
addition, ViryaOS will produce ready-to-use binary images<br class=3D"">to=
 help users and system integrators get started with Xen<br class=3D"">on =
embedded systems.<br class=3D""><br class=3D"">ViryaOS will provide the =
space for us and others to collaborate. As a<br class=3D"">unified =
group, it will be easier to approach hardware vendors and<br =
class=3D"">partners to discuss support for ViryaOS.<br class=3D""><br =
class=3D"">Users will be able to build and deploy Xen-based =
disaggregated<br class=3D"">architectures quickly and easily on x86 and =
ARM SoCs. ViryaOS will support<br class=3D"">as many hardware platforms =
as possible, as many guest operating systems<br class=3D"">as possible =
(including RTOSes and proprietary OSes), and highly<br =
class=3D"">heterogeneous environments. ViryaOS will meet low power =
consumption<br class=3D"">requirements.<br class=3D""><br =
class=3D"">ViryaOS will be secure out of the box. Unlike traditional =
operating<br class=3D"">system designs based on a monolithic kernel, =
ViryaOS takes a microkernel<br class=3D"">approach. ViryaOS will come =
with driver and service domains. The<br class=3D"">security and =
manageability of the platform are achieved through security<br =
class=3D"">by compartmentalization and privilege separation to minimize =
the attack<br class=3D"">surface of the "supervisor" component (the part =
of the system capable of<br class=3D"">unconstrained access to the =
underlying hardware).<br class=3D""><br class=3D"">All workloads will be =
supported. Virtual machines, containers, baremetal<br =
class=3D"">applications and unikernels will all be first-class =
"applications"<br class=3D"">running on ViryaOS. ViryaOS will support =
running containers natively and<br class=3D"">securely by transparently =
spawning Xen virtual machines for isolation.<br class=3D""><br =
class=3D""><br class=3D"">## Build and Output<br class=3D""><br =
class=3D"">ViryaOS will come with the tools to build Xen, Dom0, multiple =
VMs (with<br class=3D"">or without device assignement) and assemble the =
complete system. The<br class=3D"">build will rely on containers to =
shorten the build time and to make it<br class=3D"">easier to reuse any =
single component. The output will include the<br class=3D"">following =
binaries:<br class=3D""><br class=3D"">* Xen<br class=3D"">* the Dom0 =
kernel (Linux)<br class=3D"">* the Dom0 filesystem<br class=3D"">* a =
disaggregated set of Service Domains, including their kernels,<br =
class=3D""> &nbsp;disk images and configurations (Service Domains =
include drivers<br class=3D""> &nbsp;domains and management VMs)<br =
class=3D"">* any number of user-provided containers and VMs<br =
class=3D""><br class=3D"">The result will be a ready-to-use system image =
with all the pieces<br class=3D"">already included. The image will be =
small, suitable for embedded systems<br class=3D"">and IoT.<br =
class=3D""><br class=3D"">Users will be able to select different =
components and configurations at<br class=3D"">build time, resulting in =
different outputs. Cross-compilation will be<br class=3D"">supported.<br =
class=3D""><br class=3D"">ViryaOS will be able to use Yocto and/or =
existing distros such as Alpine<br class=3D"">Linux to build some, or =
all, of its components. Anything could be used<br class=3D"">as long as =
it can be built inside a container and the output follows a<br =
class=3D"">specified format.<br class=3D""><br class=3D"">As the key =
enabler for Service Domains, device assignment will be<br =
class=3D"">supported on both ARM and x86 to the best of the capabilities =
of the<br class=3D"">hardware. The image will contain all the necessary =
configurations<br class=3D"">(device tree manipulations, Xen command =
line arguments, etc) to make<br class=3D"">device assignment work out of =
the box.<br class=3D""><br class=3D""><br class=3D"">## Security<br =
class=3D""><br class=3D"">Security is one of ViryaOS's key attributes. =
The hardware capabilities<br class=3D"">can differ for different boards, =
with some having TPM support and other<br class=3D"">TEE (trusted =
execution environment) support. When the hardware supports<br =
class=3D"">it, ViryaOS will use secure/measured boot on Intel and ARM, =
using the<br class=3D"">best technologies available in hardware (such as =
Intel TXT and ARM<br class=3D"">TrustZone).<br class=3D""><br =
class=3D""><br class=3D"">## Hardware Support<br class=3D""><br =
class=3D"">ViryaOS will support as many hardware platforms as possible, =
x86 and ARM<br class=3D"">(ARMv8). Given that TPM and VT-d are (almost) =
ubiquitous on Intel<br class=3D"">platform, they can be requirements for =
ViryaOS. On the ARM side, many<br class=3D"">SoCs don't have equivalent =
functionalities yet (SMMU and TEE). ViryaOS<br class=3D"">will support =
running on them, although with limited functionalities.<br class=3D""><br =
class=3D"">### x86 Requirements<br class=3D"">* Intel VT-x or AMD-V<br =
class=3D"">* 1G RAM<br class=3D"">* Intel VT-d or AMD-Vi<br class=3D"">* =
Intel TPM<br class=3D"">* 1 serial port for development<br class=3D""><br =
class=3D"">### ARM Requirements<br class=3D"">#### Hard Requirements<br =
class=3D"">* ARMv8 (Xen 64-bit)<br class=3D"">* 1G RAM or better<br =
class=3D"">* 1 network interface<br class=3D""><br class=3D"">#### Soft =
Requirements<br class=3D"">* SMMU and a Xen driver, for device =
assignment (today only ARM<br class=3D""> &nbsp;SMMUv1 and SMMUv2 are =
supported in Xen)<br class=3D"">* TPM-like functionalities for secure =
key storage and secure boot<br class=3D"">* 1 serial port for =
development<br class=3D"">* Device Tree for firmware tables<br =
class=3D""><br class=3D""><br class=3D"">## Open Source<br class=3D""><br =
class=3D"">ViryaOS is a multi-vendor collaborative open source project. =
ViryaOS<br class=3D"">will consume other upstream projects, such as the =
Linux kernel, Xen<br class=3D"">Project, Alpine Linux, and Yocto. For =
convenience, ViryaOS might use<br class=3D"">private clones of these =
repositories, but ViryaOS will not diverge from<br class=3D"">upstream =
in any meaningful way. Changes to ViryaOS's private clones of<br =
class=3D"">upstream repositories will only be temporary, small-scoped =
and<br class=3D"">inconsequential. &nbsp;ViryaOS will remain as close as =
possible to upstream<br class=3D"">Xen and Linux.<br class=3D""><br =
class=3D""><br class=3D"">## Certifications<br class=3D""><br =
class=3D"">For many ViryaOS use-cases safety certifications are =
critical. As an<br class=3D"">open source project, ViryaOS will attempt =
at producing an easily<br class=3D"">certifiable software stack.<br =
class=3D""><br class=3D""><br class=3D"">## License<br class=3D""><br =
class=3D"">A permissive license is the best fit for this project. Apache =
2.0 is the<br class=3D"">option of choice because of the clause covering =
patents.<br class=3D""><br class=3D""><br class=3D"">## Roles<br =
class=3D""><br class=3D"">Project Lead: Stefano Stabellini &lt;<a =
href=3D"mailto:sstabellini@kernel.org" =
class=3D"">sstabellini@kernel.org</a>&gt;<br class=3D""><br =
class=3D"">_______________________________________________<br =
class=3D"">MirageOS-devel mailing list<br class=3D""><a =
href=3D"mailto:MirageOS-devel@lists.xenproject.org" =
class=3D"">MirageOS-devel@lists.xenproject.org</a><br =
class=3D"">https://lists.xenproject.org/mailman/listinfo/mirageos-devel<br=
 class=3D""></div></div></blockquote></div><br =
class=3D""></div></div></body></html>=

--Apple-Mail=_44428F54-27C9-4476-BEA1-F5A3230A0B83--


--===============7017454862708769936==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7017454862708769936==--
