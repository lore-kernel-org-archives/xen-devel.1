Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 133E6C55171
	for <xen-devel@archiver.kernel.org>; Sun,  2 Aug 2026 13:10:40 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1380616.1624312 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqVwu-0002XC-3R; Sun, 02 Aug 2026 13:09:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1380616.1624312; Sun, 02 Aug 2026 13:09:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqVwt-0002Ww-VX; Sun, 02 Aug 2026 13:09:51 +0000
Received: by outflank-mailman (input) for mailman id 1380616;
 Sun, 02 Aug 2026 13:09:51 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sergii.dmytruk@3mdeb.com>) id 1wqVws-0002Ls-Rc
 for xen-devel@lists.xenproject.org; Sun, 02 Aug 2026 13:09:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wqVwr-004d0q-Mc
 for xen-devel@lists.xenproject.org; Sun, 02 Aug 2026 15:09:49 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sergii.dmytruk@3mdeb.com>)
 id 6a6f417e-2eae-0a2a0a5409dd-0a2a4502c3a4-18
 for <xen-devel@lists.xenproject.org>; Sun, 02 Aug 2026 15:09:49 +0200
Received: from [87.98.181.248] (helo=5.mo560.mail-out.ovh.net)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <sergii.dmytruk@3mdeb.com>)
 id 6a6f4197-6ca4-0a2a45020019-5762b5f89245-3
 for <xen-devel@lists.xenproject.org>; Sun, 02 Aug 2026 15:09:44 +0200
Received: from director10.ghost.mail-out.ovh.net (unknown [10.110.37.197])
 by mo560.mail-out.ovh.net (Postfix) with ESMTP id 4hCgBb5RkDzB5lq
 for <xen-devel@lists.xenproject.org>; Sun,  2 Aug 2026 13:09:43 +0000 (UTC)
Received: from ghost-submission-7d8d68f679-xdn7l (unknown [10.110.96.89])
 by director10.ghost.mail-out.ovh.net (Postfix) with ESMTPS id AA4E2C0F4F;
 Sun,  2 Aug 2026 13:09:41 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.96])
 by ghost-submission-7d8d68f679-xdn7l with ESMTPSA
 id 2ctPGpVBb2ofBBsATjhwOw
 (envelope-from <sergii.dmytruk@3mdeb.com>); Sun, 02 Aug 2026 13:09:41 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=ovhmo3617313-selector1 header.d=3mdeb.com header.i="@3mdeb.com" header.h=From
Authentication-Results:garm.ovh; auth=pass (GARM-96R0016b89e747-1785-4152-95ae-486e00688f50,
                    A7BD45287BC66A7121136900083CD01C39616B1D) smtp.auth=sergii.dmytruk@3mdeb.com
X-OVh-ClientIp:176.111.181.215
From: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Ross Philipson <ross.philipson@gmail.com>,
	Lukasz Hawrylko <lukasz@hawrylko.pl>,
	=?UTF-8?q?Mateusz=20M=C3=B3wka?= <mateusz.mowka@intel.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	trenchboot-devel@googlegroups.com
Subject: [PATCH v4 00/23] x86: Trenchboot Secure Launch DRTM (Xen)
Date: Sun,  2 Aug 2026 16:09:16 +0300
Message-ID: <cover.1785668458.git.sergii.dmytruk@3mdeb.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
x-ovh-tracer-id: 4726246333962331580
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -51
X-VR-SPAMCAUSE: dmFkZTFdXTrARFACQ6m9P7gTxX0PekKK8WeIVA15uE+Q8jnwA9gEyJa7xjXxo5vANI53/0+D44IJm6ZWpxAtd4w3ij7mPxMHSgilLVIAbFfDh74rWf79n1eaYlmPcZv5e6jI+mYGSty3r03VTenwEhPzEEAFz6EhCwT2dGzWQhDVwl7Wvgr5EyDql+zuQNMTRf0D8nzyFZGp15N6IkYLAr7uLr2cUucu71/cfXLIz/4eakvJn7uag/1v5Pka9Gi+tIHo0NtqsYPZIVphzck04C9GB6uAf2dfA8R8ZCdxSLdLJLip4cwRyE5bwLdAwax0O1xBzxePGB2TbRYRKAiiU/R9VFwcmJFnFqemLxjevb6bqC3OcwQg3SqHW2QNlhG0XgELBicbjxtMdkPA7T9MMgGaOmTZi+54x63HT3yvj+kLO6jmxmQxgDq5vJHm4U6fnVEf4hupdi4mg6ImUsJAb/16BOkq/SmCA6zb98joQZtJpiqYtz1ZOry7gpZSC8ZlfdpAAejx5FqdltDSrGM1e3LRoSxFCJziHrcGuKTiSGapnoCOLPVbkXMcx4RVTTvyv+LavBs8GkpYomQHQjrKYm2H3jDDZNRHCPloGrHv9Ndvv7kohZbstOpKU6A2nHx25hBWQdmBv5aC2gyCA4qJ6fJc3/ZzxP8sUaCsCzWkpNK6rBJDNg
DKIM-Signature: a=rsa-sha256; bh=qHXC8mHNWg/aZvJUsYG80TVBq7kbjbeH1mde4zTkom8=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1785676183; v=1;
 b=TRXyQY/eSHLhVvcblvdDseI8wit6I9NXOVUiHWc9PbvJDgJ5L3XPgXviZ4mQcCzoDvOKmvww
 JX3w35rxT4hSszEayPR1PoruXap/gmtTGFeJZqaQrWS1nBdOo/OGcROqjFLuuW4ZwrfcNMi8uS1
 Mktf0Bm6FqEe7UZfuO9OBjx9hg767448xVz9fhAiBkErQ1VeSqq5Md4Ln1MAHNduTjdJAIokOTg
 w850fbkIqb0zauwsJegtUXYtXQZvno6t9P3HaKKhwNRwgFgqKEVyjNTuvil3RwvpVKag6TP6a/F
 XubtPBpo+3dj78TZ4rC3rmu338U7cNkCSIzZm3hu4ddxA==
X-purgate-ID: tlsNG-720697/1785676189-66EB32AC-0E948AD1/0/0
X-purgate-type: clean
X-purgate-size: 10266

The aim of the [TrenchBoot] project is to provide an implementation of
DRTM that is generic enough to cover various use cases:
 - Intel TXT and AMD SKINIT on x86 CPUs
 - legacy and UEFI boot
 - TPM1.2 and TPM2.0 (TIS and CRB)
 - (in the future) DRTM on Arm CPUs

DRTM is a version of a measured launch that starts on request rather
than at the start of a boot cycle.  One of its advantages is in not
including the firmware in the chain of trust.

Xen already supports DRTM via [tboot] which targets Intel TXT only.
tboot encapsulates some of the DRTM details within itself while with
TrenchBoot Xen (or Linux) is meant to be a self-contained payload for a
TrenchBoot-enabled bootloader (think GRUB).  The one exception is that
UEFI case requires calling back into bootloader to initiate DRTM, which
is necessary to give Xen a chance of querying all the information it
needs from the firmware before performing DRTM start.

From reading the above tboot might seem like a more abstracted, but the
reality is that the payload needs to have DRTM-specific knowledge
either way.  In principle, TrenchBoot, allows coming up with
independent implementations of bootloaders and payloads that are
compatible with each other.

The "x86/boot: choose AP stack based on APIC ID" patch is shared with
[Parallelize AP bring-up] series and is required here because Intel TXT
always releases all APs simultaneously.  The rest of the patches are
unique.

This version of the patches corresponds to this branch:
  https://github.com/TrenchBoot/xen/compare/7c77acd452fb...tb-staging-2026-07-31-v4

-----

[TrenchBoot]: https://trenchboot.org/
[tboot]: https://sourceforge.net/p/tboot/wiki/Home/
[Parallelize AP bring-up]: https://lore.kernel.org/xen-devel/cover.1699982111.git.krystian.hebel@3mdeb.com/
[v1]: https://lore.kernel.org/xen-devel/cover.1745172094.git.sergii.dmytruk@3mdeb.com/
[v2]: https://lore.kernel.org/xen-devel/cover.1747155790.git.sergii.dmytruk@3mdeb.com/
[v3]: https://lore.kernel.org/xen-devel/cover.1748611041.git.sergii.dmytruk@3mdeb.com/

-----

Changes in v4:
 - added notes to individial commits, the notes below cover some of
   more generic changes or those spanning multiple commits
 - dropped SHA-1 changes (was committed independently of this patchset)
 - added CONFIG_SLAUNCH Kconfig option
 - TPM driver changes have been moved to the front and are now
   independent from TPM event log and the rest of this patchset in
   general
 - a few commits were split, joined and/or renamed to make changes more
   independent, see notes in individual patches
 - added support for communicating with TPM2.0 via CRB and memory
   protection using TPR to support newer handware
 - moved UEFI_SLR_TABLE_GUID from xen/include/xen/slr-table.h to
   xen/common/efi/boot.c
 - changed the code for dealing with tables in TXT heap to be iterative
 - added more implementation-specific error codes and removed unused
   ones
 - extracted declarations from tpm.c into headers for TPM1.2 and TPM2.0
 - return EACCES instead of EPERM when refusing to go into S3 state
 - moved SLAUNCH_BOOTLOADER_MAGIC from x86/asm/intel-txt.h to
   x86/boot/head.S
 - moved making MTRR-related functions public to commit which uses them
 - use container_of() after slr_next_entry_by_tag() instead of a cast
 - made more code that deals with SLRT const-correct (including adding
   const to the parameter of dl_handler_func)
 - absent TPM event log is now consistently allowed by both TPM1.2 and
   TPM2.0 implementations

Changes in [v3]:
 - sorted `F:` entries in MAINTAINERS file
 - made sha1 implementation more similar to sha256
 - dropped unused parameter from
   xen/arch/x86/cpu/intel.c:intel_log_smx_txt()
 - updated header guards according to new style
 - xen/arch/x86/include/asm/intel-txt.h:
   + briefly explained what TXT is
   + renamed: NR_TXT_CONFIG_SIZE -> TXT_CONFIG_SPACE_SIZE
   + renamed: read_txt_reg() -> txt_read()
   + renamed: write_txt_reg() -> txt_write()
   + marked txt_reset() as noreturn and used unreacheable() instead of
     while(1)
   + explained a bit more about TXT Heap
 - xen/include/xen/slr-table.h:
   + briefly explained what SLRT is
   + fixed checks in slr_next_entry()
 - SPDX-License-Identifier: GPL-2.0 -> GPL-2.0-only
 - made more code const-correct
 - use arithmetic on pointers to `void` instead of pointers to
   `uint8_t`

Changes in [v2]:
 - using dashes instead of underscores in the names of new files
 - dropping of an extra sha256 implementation
 - rewriting sha1 implementation to be in line with already present
   sha256 implementation (simplifying it and getting rid of macros)
 - correct placement of new lines in Makefile
 - add header guards to all new files
 - use correct names for header guards in new files
 - update license of xen/include/xen/slr-table.h
 - changed fixmlehdr to search for header within 8 instead of 4 KiB
   file prefix
 - don't print DRTM-related capabilities when resuming from S3
 - forbade S3 in case of Secure Launch
 - fixed an issue with resuming from S3 caused by inappropriate use of
   __initdata
 - added a new section to MAINTAINERS
 - improved commit messages
 - fixed MISRA C violations:
   + shadowing of e820 global
   + missing U literal suffixes
   + use of ull literal suffix
   + excluded fixmlehdr from analysis (similar to other build tools)
   + use of 0 instead of NULL in one place
   + provided declarations for some definitions
   + marked asm-invoked functions with `asmlinkage`

-----

Kacper Stojek (2):
  x86/boot: add CONFIG_SLAUNCH, MLE header and Secure Launch entry point
  xen/arch/x86: reserve TXT memory during Slaunch

Krystian Hebel (7):
  x86/tpm.c: hashing and extending PCRs for TPM1.2
  x86/include/asm/intel-txt.h: constants and accessors for TXT registers
    and heap
  x86/boot/slaunch-early: early Intel TXT sanity checks
  x86/slaunch: restore boot MTRRs after Intel TXT DRTM
  x86/slaunch: measure MBI into TPM
  x86/boot: choose AP stack based on APIC ID
  x86/smpboot.c: TXT AP bringup

Michał Żygowski (2):
  x86/cpu: report SMX, TXT and SKINIT capabilities
  x86/hvm: check for VMX in SMX if Slaunch is active

Sergii Dmytruk (10):
  x86/mtrr: get rid of a static variable on pause/restore
  x86/tpm.c: support extending PCRs of TPM2.0 via TIS
  include/xen/slr-table.h: Secure Launch Resource Table definitions
  x86/boot/slaunch-early: implement early initialization
  x86/slaunch: update TPM event log (TPM1.2 or TPM2.0)
  x86/slaunch: process DRTM policy
  x86/acpi: disallow S3 on Secure Launch boot
  x86/slaunch: support AMD CPUs
  x86/slaunch: support EFI boot
  MAINTAINERS: add a section for TrenchBoot Slaunch

Szymon Acedański (2):
  x86/tpm.c: add CRB interface support
  xen/arch/x86: add TPR (TXT Protected Range) DMA protection support

 .gitignore                                    |   1 +
 MAINTAINERS                                   |  19 +
 .../eclair_analysis/ECLAIR/out_of_scope.ecl   |   1 +
 docs/hypervisor-guide/x86/how-xen-boots.rst   |  12 +
 xen/arch/x86/Kconfig                          |   8 +
 xen/arch/x86/Makefile                         |  16 +-
 xen/arch/x86/acpi/power.c                     |   8 +
 xen/arch/x86/boot/Makefile                    |  22 +-
 xen/arch/x86/boot/head.S                      | 267 ++++++
 xen/arch/x86/boot/slaunch-early.c             | 104 +++
 xen/arch/x86/boot/trampoline.S                |  42 +-
 xen/arch/x86/boot/x86_64.S                    |  67 +-
 xen/arch/x86/cpu/amd.c                        |  16 +
 xen/arch/x86/cpu/cpu.h                        |   1 +
 xen/arch/x86/cpu/hygon.c                      |   1 +
 xen/arch/x86/cpu/intel.c                      |  50 +
 xen/arch/x86/cpu/mtrr/generic.c               |  50 +-
 xen/arch/x86/e820.c                           |   5 +
 xen/arch/x86/efi/efi-boot.h                   |  95 +-
 xen/arch/x86/efi/fixmlehdr.c                  | 127 +++
 xen/arch/x86/hvm/vmx/vmcs.c                   |   3 +-
 xen/arch/x86/include/asm/apicdef.h            |   4 +
 xen/arch/x86/include/asm/intel-txt.h          | 573 ++++++++++++
 xen/arch/x86/include/asm/msr-index.h          |   3 +
 xen/arch/x86/include/asm/mtrr.h               |   8 +
 xen/arch/x86/include/asm/processor.h          |   1 +
 xen/arch/x86/include/asm/setup.h              |   3 +
 xen/arch/x86/include/asm/slaunch-tpm.h        |  26 +
 xen/arch/x86/include/asm/slaunch.h            | 128 +++
 xen/arch/x86/include/asm/tpm.h                |  74 ++
 xen/arch/x86/include/asm/tpm1.h               |  94 ++
 xen/arch/x86/include/asm/tpm2.h               | 150 +++
 xen/arch/x86/intel-txt.c                      | 197 ++++
 xen/arch/x86/setup.c                          |  32 +-
 xen/arch/x86/slaunch-tpm.c                    | 312 +++++++
 xen/arch/x86/slaunch.c                        | 478 ++++++++++
 xen/arch/x86/smpboot.c                        |  75 ++
 xen/arch/x86/tboot.c                          |  20 +-
 xen/arch/x86/tpm.c                            | 862 ++++++++++++++++++
 xen/arch/x86/x86_64/asm-offsets.c             |  13 +
 xen/common/efi/boot.c                         |   6 +
 xen/common/efi/runtime.c                      |   1 +
 xen/include/xen/efi.h                         |   1 +
 xen/include/xen/slr-table.h                   | 272 ++++++
 44 files changed, 4191 insertions(+), 57 deletions(-)
 create mode 100644 xen/arch/x86/boot/slaunch-early.c
 create mode 100644 xen/arch/x86/efi/fixmlehdr.c
 create mode 100644 xen/arch/x86/include/asm/intel-txt.h
 create mode 100644 xen/arch/x86/include/asm/slaunch-tpm.h
 create mode 100644 xen/arch/x86/include/asm/slaunch.h
 create mode 100644 xen/arch/x86/include/asm/tpm.h
 create mode 100644 xen/arch/x86/include/asm/tpm1.h
 create mode 100644 xen/arch/x86/include/asm/tpm2.h
 create mode 100644 xen/arch/x86/intel-txt.c
 create mode 100644 xen/arch/x86/slaunch-tpm.c
 create mode 100644 xen/arch/x86/slaunch.c
 create mode 100644 xen/arch/x86/tpm.c
 create mode 100644 xen/include/xen/slr-table.h


base-commit: 7c77acd452fb6a3079661e75ebb5cf23ed985cc7
-- 
2.55.0


