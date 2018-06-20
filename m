From: Christopher Clark <christopher.w.clark@gmail.com>
Subject: RFC: Boot Domain, domB
Date: Tue, 19 Jun 2018 17:58:45 -0700
Message-ID: <CACMJ4Gai_dq5ZtA6cT5s8cv0MuKyTZw99D93FO7gNe_4G4y89g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5455323085585968821=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=jami=jg=gmail.com=christopher.w.clark@srs-us1.protection.inumbo.net>)
 id 1fVRSV-0000uO-97
 for xen-devel@lists.xenproject.org; Wed, 20 Jun 2018 00:58:51 +0000
Received: by mail-lf0-x22c.google.com with SMTP id q11-v6so2281177lfc.7
 for <xen-devel@lists.xenproject.org>; Tue, 19 Jun 2018 17:58:47 -0700 (PDT)
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel <xen-devel@lists.xenproject.org>, openxt <openxt@googlegroups.com>
Cc: Lars Kurth <lars.kurth@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Jason Andryuk <jandryuk@gmail.com>, Daniel Smith <dpsmith@apertussolutions.com>, Andrew Cooper <andrew.cooper3@citrix.com>, julien.grall@arm.com, Rich Persaud <persaur@gmail.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

--===============5455323085585968821==
Content-Type: multipart/alternative; boundary="00000000000002afbb056f084dc7"

--00000000000002afbb056f084dc7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

Mixed-criticality and safety-critical systems under development need
support for timely boot of multiple domains at system launch -- =E2=80=9CIn=
itial
Domains=E2=80=9D -- with static assignment of resources between them, each =
isolated
from the others and without runtime dependency on a =E2=80=9Cdom0=E2=80=9D-=
type domain.

The Xen hypervisor currently contains a section of fixed policy logic for
creation of a single, highly-privileged domain =E2=80=9Cdom0=E2=80=9D at sy=
stem boot.

We would like to establish a shared understanding of best practice for
configuration and deployment of disaggregated system launch with multiple
domains, for production systems, on both x86 and ARM platforms.

Correctness and integrity of system launch is fundamental to system
security.

Maximizing the commonality between deployed Xen systems enables pooling of
risk and widens the applicability of testing that is performed.

## Requirements:

* Enable fast launch of multiple domains at system boot.
* Obtain the boot materials for Initial Domains -- config, kernel image,
optional ramdisk -- from host boot binaries.
* A system initialization process that is appropriate for both ARM and x86.
* Support minimization of audit work required for safety critical
certification
    * Favour reduction of code size and complexity of highest-privilege
components.
    * Decouple and isolate logic in support of simplifying validation by
enabling reasoning about the interfaces between components.
* Remove the policy logic for initial distribution of privileges from the
hypervisor.
    * Aim to simplify and consolidate the hypervisor code for system launch=
.
    * Allow flexibility of different initial domain configurations by
disaggregation to an external component.
    * Separate the mechanisms of privilege assignment, necessarily within
the hypervisor, from the implementation of policy logic assigning them to
specific domains.
* Support measured launch (e.g. TXT/SKINIT) and verified launch (e.g.
Secure Boot) to include the ability to measure/verify any or all Initial
Domains.
* Support for manageable processes for the system boot binaries.
    * ie. Consider: creation of files, updates to files, build-time
tooling, run-time tooling, dependencies of components.
    * Note that Device Tree tooling is foreign for booting x86.
* Do not make Initial Domain creation depend upon parsing complex data
structures, such as a Device Tree, within the hypervisor.
    * The parsing is unwanted attack surface.
    * A static, unchanging Device Tree binary used just for
hardware-enablement increases commonality across deployments, and is easier
to place trust in than one that changes according to the specific installed
software configuration.
* Support configuration of XSM security labels for the Initial Domains.

## Proposed approach:

Provide support for the hypervisor launching an alternative configuration
for the first domain launched, revising the all-privileged Dom0 to it being
a more capability-constrained =E2=80=9CBoot Domain=E2=80=9D, DomB.

DomB is responsible for starting a set of domains from the material it
discovers within its ramdisk. Once they are running, DomB terminates with
launch success status indicator, in a step we refer to as =E2=80=9CExit Xen=
 Boot
Services=E2=80=9D. The domain termination makes it easy to verify that all =
DomB
privileges have been dropped.

The Boot Domain need not be granted hardware access capabilities itself;
but it does require the capability to create a domain that has each
privilege. Since DomB is granted no access to hardware, it is possible for
DomB to operate as a PVH domain - and we would advocate for this.

In a future iteration of the work: when DomB creates domains and delegates
privileges to them, DomB will lose the ability to further delegate the same
privileges to other domains. This atomic transfer will be enforced by the
hypervisor: a ratchet of decreasing capability.

The Boot Domain approach enables flexibility of configuration in system
bring up, with the same approach applicable on both ARM and x86
architectures, while minimizing increase in the hypervisor code base. DomB
can be implemented in a small, single-purpose kernel, e.g. mini-os or LK,
that can easily be audited for certification while maximizing the isolation
of the platform launch process. It provides flexibility to support multiple
models to include but not limited to: single, all privileged domain, in
traditional dom0-style; split privileged domains (control/hardware
domains); disaggregated domains; static partitioned domains; or high
density, cloned domains (e.g. container farm or fast-fork honeypot).

## Q: How does this change the system boot configuration files?

#### Existing practice:

The current dom0 initialization materials are:

* optional entries on the Xen command line
* an OS kernel image
* an OS kernel command line, supplied by the bootloader
* an optional OS kernel initial ramdisk image

#### With the proposal:

The domB initialization materials are:

* optional entries on the Xen command line
* an OS kernel image
* an OS kernel command line, supplied by the bootloader
* the domB initial ramdisk image

The domB initial ramdisk image will contain:

* For each Initial Domain:
    * VM configuration file, including (amongst other things):
        * any OS kernel command line
        * standard VM config items, such as RAM allocation, vCPU
configuration
        * XSM security label for the domain
    * For PV/PVH domains:
        * an OS kernel image
        * an optional ramdisk for the VM
    * An init program to enable the domB kernel to start the Initial
Domains.
        * The domains may be started in parallel, or in sequence, as
required - eg. some domains may depend upon storage backends being
available, and so be started later in the sequence.

The XSM policy will require updating for a domB system.

For booting into the traditional highly-privileged dom0 model with this
launch process, the most visible effect is migration of the dom0
configuration state and kernel boot binaries into the domB ramdisk.
Documentation will be necessary to communicate how to work with this
configuration.

## Q: How does this structure affect the TCB?

The Xen system components that must be within the TCB of each Initial
Domain are:

* The hypervisor.
* The Boot Domain, domB, which has exited and cannot be restarted without
host reboot.

It enables the start of VMs with a shorter chain of trust and substantially
reduced volume of code in their TCB than available with the traditional
dom0 model.
Note that running VMs with privileges over other domains will impact the
size of the TCB of the VMs that they have privilege over. XSM is able to
perform fine-grained confinement which can address this.

## References

RFC for =E2=80=9Cdom0less step 1=E2=80=9D, with aim of preparation for Safe=
ty Certification
https://lists.xenproject.org/archives/html/xen-devel/2018-06/msg00982.html

Domain Builder
https://lists.xenproject.org/archives/html/xen-devel/2014-03/msg00320.html

Hardware Domain support
https://lists.xenproject.org/archives/html/xen-devel/2014-03/msg03556.html


thanks,

Christopher

--00000000000002afbb056f084dc7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello,<br></div><div><br></div><div>Mixed-criticality=
 and safety-critical systems under development need support for timely boot=
 of multiple domains at system launch -- =E2=80=9CInitial Domains=E2=80=9D =
-- with static assignment of resources between them, each isolated from the=
 others and without runtime dependency on a =E2=80=9Cdom0=E2=80=9D-type dom=
ain.</div><div><br></div><div>The Xen hypervisor currently contains a secti=
on of fixed policy logic for creation of a single, highly-privileged domain=
 =E2=80=9Cdom0=E2=80=9D at system boot.</div><div><br></div><div>We would l=
ike to establish a shared understanding of best practice for configuration =
and deployment of disaggregated system launch with multiple domains, for pr=
oduction systems, on both x86 and ARM platforms.</div><div><br></div><div>C=
orrectness and integrity of system launch is fundamental to system security=
.</div><div><br></div><div>Maximizing the commonality between deployed Xen =
systems enables pooling of risk and widens the applicability of testing tha=
t is performed.</div><div><br></div><div>## Requirements:</div><div><br></d=
iv><div>* Enable fast launch of multiple domains at system boot.</div><div>=
* Obtain the boot materials for Initial Domains -- config, kernel image, op=
tional ramdisk -- from host boot binaries.</div><div>* A system initializat=
ion process that is appropriate for both ARM and x86.</div><div>* Support m=
inimization of audit work required for safety critical certification</div><=
div>=C2=A0 =C2=A0 * Favour reduction of code size and complexity of highest=
-privilege components.</div><div>=C2=A0 =C2=A0 * Decouple and isolate logic=
 in support of simplifying validation by enabling reasoning about the inter=
faces between components.</div><div>* Remove the policy logic for initial d=
istribution of privileges from the hypervisor.</div><div>=C2=A0 =C2=A0 * Ai=
m to simplify and consolidate the hypervisor code for system launch.</div><=
div>=C2=A0 =C2=A0 * Allow flexibility of different initial domain configura=
tions by disaggregation to an external component.</div><div>=C2=A0 =C2=A0 *=
 Separate the mechanisms of privilege assignment, necessarily within the hy=
pervisor, from the implementation of policy logic assigning them to specifi=
c domains.</div><div>* Support measured launch (e.g. TXT/SKINIT) and verifi=
ed launch (e.g. Secure Boot) to include the ability to measure/verify any o=
r all Initial Domains.</div><div>* Support for manageable processes for the=
 system boot binaries.</div><div>=C2=A0 =C2=A0 * ie. Consider: creation of =
files, updates to files, build-time tooling, run-time tooling, dependencies=
 of components.</div><div>=C2=A0 =C2=A0 * Note that Device Tree tooling is =
foreign for booting x86.</div><div>* Do not make Initial Domain creation de=
pend upon parsing complex data structures, such as a Device Tree, within th=
e hypervisor.</div><div>=C2=A0 =C2=A0 * The parsing is unwanted attack surf=
ace.</div><div>=C2=A0 =C2=A0 * A static, unchanging Device Tree binary used=
 just for hardware-enablement increases commonality across deployments, and=
 is easier to place trust in than one that changes according to the specifi=
c installed software configuration.</div><div>* Support configuration of XS=
M security labels for the Initial Domains.</div><div><br></div><div>## Prop=
osed approach:</div><div><br></div><div>Provide support for the hypervisor =
launching an alternative configuration for the first domain launched, revis=
ing the all-privileged Dom0 to it being a more capability-constrained =E2=
=80=9CBoot Domain=E2=80=9D, DomB.</div><div><br></div><div>DomB is responsi=
ble for starting a set of domains from the material it discovers within its=
 ramdisk. Once they are running, DomB terminates with launch success status=
 indicator, in a step we refer to as =E2=80=9CExit Xen Boot Services=E2=80=
=9D. The domain termination makes it easy to verify that all DomB privilege=
s have been dropped.</div><div><br></div><div>The Boot Domain need not be g=
ranted hardware access capabilities itself; but it does require the capabil=
ity to create a domain that has each privilege. Since DomB is granted no ac=
cess to hardware, it is possible for DomB to operate as a PVH domain - and =
we would advocate for this.</div><div><br></div><div>In a future iteration =
of the work: when DomB creates domains and delegates privileges to them, Do=
mB will lose the ability to further delegate the same privileges to other d=
omains. This atomic transfer will be enforced by the hypervisor: a ratchet =
of decreasing capability.</div><div><br></div><div>The Boot Domain approach=
 enables flexibility of configuration in system bring up, with the same app=
roach applicable on both ARM and x86 architectures, while minimizing increa=
se in the hypervisor code base. DomB can be implemented in a small, single-=
purpose kernel, e.g. mini-os or LK, that can easily be audited for certific=
ation while maximizing the isolation of the platform launch process. It pro=
vides flexibility to support multiple models to include but not limited to:=
 single, all privileged domain, in traditional dom0-style; split privileged=
 domains (control/hardware domains); disaggregated domains; static partitio=
ned domains; or high density, cloned domains (e.g. container farm or fast-f=
ork honeypot).</div><div><br></div><div>## Q: How does this change the syst=
em boot configuration files?</div><div><br></div><div>#### Existing practic=
e:</div><div><br></div><div>The current dom0 initialization materials are:<=
/div><div><br></div><div>* optional entries on the Xen command line</div><d=
iv>* an OS kernel image</div><div>* an OS kernel command line, supplied by =
the bootloader</div><div>* an optional OS kernel initial ramdisk image</div=
><div><br></div><div>#### With the proposal:</div><div><br></div><div>The d=
omB initialization materials are:</div><div><br></div><div>* optional entri=
es on the Xen command line</div><div>* an OS kernel image</div><div>* an OS=
 kernel command line, supplied by the bootloader</div><div>* the domB initi=
al ramdisk image</div><div><br></div><div>The domB initial ramdisk image wi=
ll contain:</div><div><br></div><div>* For each Initial Domain:</div><div>=
=C2=A0 =C2=A0 * VM configuration file, including (amongst other things):</d=
iv><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 * any OS kernel command line</div><div>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 * standard VM config items, such as RAM allocat=
ion, vCPU configuration</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 * XSM securit=
y label for the domain</div><div>=C2=A0 =C2=A0 * For PV/PVH domains:</div><=
div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 * an OS kernel image</div><div>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 * an optional ramdisk for the VM</div><div>=C2=A0 =C2=A0 =
* An init program to enable the domB kernel to start the Initial Domains.</=
div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 * The domains may be started in parall=
el, or in sequence, as required - eg. some domains may depend upon storage =
backends being available, and so be started later in the sequence.</div><di=
v><br></div><div>The XSM policy will require updating for a domB system.</d=
iv><div><br></div><div>For booting into the traditional highly-privileged d=
om0 model with this launch process, the most visible effect is migration of=
 the dom0 configuration state and kernel boot binaries into the domB ramdis=
k. Documentation will be necessary to communicate how to work with this con=
figuration.</div><div><br></div><div>## Q: How does this structure affect t=
he TCB?</div><div><br></div><div>The Xen system components that must be wit=
hin the TCB of each Initial Domain are:</div><div><br></div><div>* The hype=
rvisor.</div><div>* The Boot Domain, domB, which has exited and cannot be r=
estarted without host reboot.</div><div><br></div><div>It enables the start=
 of VMs with a shorter chain of trust and substantially reduced volume of c=
ode in their TCB than available with the traditional dom0 model.</div><div>=
Note that running VMs with privileges over other domains will impact the si=
ze of the TCB of the VMs that they have privilege over. XSM is able to perf=
orm fine-grained confinement which can address this.</div><div><br></div><d=
iv>## References</div><div><br></div><div>RFC for =E2=80=9Cdom0less step 1=
=E2=80=9D, with aim of preparation for Safety Certification</div><div><a hr=
ef=3D"https://lists.xenproject.org/archives/html/xen-devel/2018-06/msg00982=
.html">https://lists.xenproject.org/archives/html/xen-devel/2018-06/msg0098=
2.html</a></div><div><br></div><div>Domain Builder</div><div><a href=3D"htt=
ps://lists.xenproject.org/archives/html/xen-devel/2014-03/msg00320.html">ht=
tps://lists.xenproject.org/archives/html/xen-devel/2014-03/msg00320.html</a=
></div><div><br></div><div>Hardware Domain support</div><div><a href=3D"htt=
ps://lists.xenproject.org/archives/html/xen-devel/2014-03/msg03556.html">ht=
tps://lists.xenproject.org/archives/html/xen-devel/2014-03/msg03556.html</a=
></div><div><br></div><div><br></div><div>thanks,</div><div><br></div><div>=
Christopher</div></div>

--00000000000002afbb056f084dc7--


--===============5455323085585968821==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5455323085585968821==--
