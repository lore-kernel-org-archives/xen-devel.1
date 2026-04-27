Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72A9BFF8868
	for <xen-devel@archiver.kernel.org>; Mon, 27 Apr 2026 17:17:33 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1295124.1571809 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHPZv-0006qG-Kq; Mon, 27 Apr 2026 17:17:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1295124.1571809; Mon, 27 Apr 2026 17:17:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHPZv-0006q9-Hk; Mon, 27 Apr 2026 17:17:03 +0000
Received: by outflank-mailman (input) for mailman id 1295124;
 Mon, 27 Apr 2026 17:17:02 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <chleroy@kernel.org>) id 1wHPZu-0006q3-H1
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2026 17:17:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wHPZt-009M5J-F5
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2026 19:17:01 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <chleroy@kernel.org>)
 id 69ef99f6-2eae-0a2a0a5409dd-0a2a4508ea2a-8
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2026 19:17:01 +0200
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <chleroy@kernel.org>)
 id 69ef9a0b-63b5-0a2a45080019-aceafc1fb894-3
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2026 19:17:01 +0200
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 0E7B742ACA;
 Mon, 27 Apr 2026 17:16:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87FE1C2BCB4;
 Mon, 27 Apr 2026 17:16:46 +0000 (UTC)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=k20201202 header.d=kernel.org header.i="@kernel.org" header.h="From:To:Cc:Subject:Date"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777310218;
	bh=Gdo90UdOw5JDNcbBc6CTpgqBoS99tJWdzzhKt47HDkg=;
	h=From:To:Cc:Subject:Date:From;
	b=U2+LLE02v2RJdGrHn64GqYJdP4+hDdO9CRQcGon9U+fg19LBxhX5PBepS5h9HJCqe
	 szqGGe/Sn0Ja8ufrVfKBRayklpg7ZNqhD3AjlJFyhWTD2cy+E9nyVtxoXvU6RVePwS
	 nC/EKNFwPrGycTqEuaSwxvd9NLoS3iznsIjTk0KPgTVc+veLovfoR+uQQZvkXu6BEL
	 XY5HSP+s8CkmcaZnZCCWlv0qtPkuKqPRoos+3EvmYxD3lbF+eVbofOW/u0ribOc9N6
	 46gB4iCE7qS4DHXiu+LbPED9AO2rWWkmtG0xffEU92OaQJ+vWiy9PumgjbDE3AiKLE
	 isfjlgjrnrghg==
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
To: Yury Norov <ynorov@nvidia.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	David Laight <david.laight.linux@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-um@lists.infradead.org,
	dmaengine@vger.kernel.org,
	linux-efi@vger.kernel.org,
	linux-fsi@lists.ozlabs.org,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	linux-wpan@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-serial@vger.kernel.org,
	linux-usb@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	linux-fsdevel@vger.kernel.org,
	ocfs2-devel@lists.linux.dev,
	bpf@vger.kernel.org,
	kasan-dev@googlegroups.com,
	linux-mm@kvack.org,
	linux-x25@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-sound@vger.kernel.org,
	sound-open-firmware@alsa-project.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linux-arch@vger.kernel.org
Subject: [RFC PATCH v1 0/9] uaccess: Convert small fixed size copy_{to/from}_user() to scoped user access
Date: Mon, 27 Apr 2026 19:13:41 +0200
Message-ID: <cover.1777306795.git.chleroy@kernel.org>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7253; i=chleroy@kernel.org; h=from:subject:message-id; bh=Gdo90UdOw5JDNcbBc6CTpgqBoS99tJWdzzhKt47HDkg=; b=owGbwMvMwCV2d0KB2p7V54MZT6slMWS+nxkaMinl/6P42P3bc0Qj3v7nk1G4YbGg/rEse+BPv 7e7BNgWdJSyMIhxMciKKbIc/8+9a0bXl9T8qbv0YeawMoEMYeDiFICJRDExMmwV0vIK89sWnHjX Y4WN3O+gaTyvmP0m2koKTvi9YNORsocM/wPkn2xoM0q8N63lWvLNy/m/speGuG7LLGiQ1I6bVSB dxgQA
X-Developer-Key: i=chleroy@kernel.org; a=openpgp; fpr=10FFE6F8B390DE17ACC2632368A92FEB01B8DD78
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1777310221-3B97DDB1-9AAA5415/0/0
X-purgate-type: clean
X-purgate-size: 7255

A lot of copy_from_user() and copy_to_user() perform copies of small
fixed size pieces of data between kernel and userspace, and don't
care about partial copies.

copy_from_user() and copy_to_user() are big functions optimised for
copying large amount of data, with cache management, etc ... This is
often overkill for small copies that could just be inlined instead.

What makes things a bit more tricky is that those copy functions
are designed to handle partial copies in case of page fault. But among
the 6000 callers of those functions, only 2% really care about the
quantity of no-copied data that those functions return. All other ones
fails as soon as the returned value is not 0, returning -EACCESS.

So first step in this series is to introduce variants called
copy_from_user_partial() and copy_to_user_partial() which will be
called by the 2% users that care about the partial copy, then the
original copy_from_user() and copy_to_user() are changed to return
-EFAULT when the copy fails.

Then the second step is to implement copy of small fixed-size data
with scoped user access instead of calling the arch specific heavy
user copy functions.

Patch 5, can be split in different patches for each archicture or
subsystem, but let's get a first feedback and agree on the principle.

Christophe Leroy (CS GROUP) (9):
  uaccess: Split check_zeroed_user() out of usercopy.c
  uaccess: Convert INLINE_COPY_{TO/FROM}_USER to kconfig and reduce
    ifdefery
  x86/umip: Be stricter in fixup_umip_exception()
  uaccess: Introduce copy_{to/from}_user_partial()
  uaccess: Switch to copy_{to/from}_user_partial() when relevant
  uaccess: Change copy_{to/from}_user to return -EFAULT
  x86: Add unsafe_copy_from_user()
  arm64: Add unsafe_copy_from_user()
  uaccess: Convert small fixed size copy_{to/from}_user() to scoped user
    access

 arch/alpha/Kconfig                            |   1 +
 arch/alpha/kernel/osf_sys.c                   |   4 +-
 arch/alpha/kernel/termios.c                   |   2 +-
 arch/arc/include/asm/uaccess.h                |   3 -
 arch/arc/kernel/disasm.c                      |   2 +-
 arch/arm/include/asm/uaccess.h                |   2 -
 arch/arm64/include/asm/gcs.h                  |   2 +-
 arch/arm64/include/asm/uaccess.h              |  30 +++--
 arch/arm64/kernel/signal32.c                  |   2 +-
 arch/csky/Kconfig                             |   1 +
 arch/hexagon/include/asm/uaccess.h            |   3 -
 arch/loongarch/include/asm/uaccess.h          |   3 -
 arch/m68k/include/asm/uaccess.h               |   3 -
 arch/microblaze/include/asm/uaccess.h         |   2 -
 arch/mips/include/asm/uaccess.h               |   3 -
 arch/mips/kernel/rtlx.c                       |   8 +-
 arch/mips/kernel/vpe.c                        |   2 +-
 arch/nios2/include/asm/uaccess.h              |   2 -
 arch/openrisc/include/asm/uaccess.h           |   2 -
 arch/parisc/include/asm/uaccess.h             |   3 -
 arch/powerpc/Kconfig                          |   1 +
 arch/powerpc/kvm/book3s_64_mmu_hv.c           |   4 +-
 arch/powerpc/kvm/book3s_64_mmu_radix.c        |   4 +-
 arch/powerpc/kvm/book3s_hv.c                  |   2 +-
 arch/riscv/Kconfig                            |   1 +
 arch/riscv/kernel/signal.c                    |   2 +-
 arch/s390/include/asm/idals.h                 |   8 +-
 arch/s390/include/asm/uaccess.h               |   3 -
 arch/sh/include/asm/uaccess.h                 |   2 -
 arch/sparc/include/asm/uaccess_32.h           |   3 -
 arch/sparc/include/asm/uaccess_64.h           |   2 -
 arch/sparc/kernel/termios.c                   |   2 +-
 arch/um/include/asm/uaccess.h                 |   3 -
 arch/um/kernel/process.c                      |   2 +-
 arch/x86/Kconfig                              |   1 +
 arch/x86/include/asm/uaccess.h                |  29 ++++-
 arch/x86/kernel/umip.c                        |   2 +-
 arch/x86/lib/insn-eval.c                      |   2 +-
 arch/x86/um/signal.c                          |   2 +-
 arch/xtensa/include/asm/uaccess.h             |   2 -
 drivers/android/binder_alloc.c                |   2 +-
 drivers/comedi/comedi_fops.c                  |   4 +-
 drivers/dma/idxd/cdev.c                       |   2 +-
 drivers/firmware/efi/test/efi_test.c          |   2 +-
 drivers/fsi/fsi-scom.c                        |   2 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_debugfs.c |   2 +-
 drivers/gpu/drm/i915/gt/intel_sseu.c          |   4 +-
 drivers/gpu/drm/i915/i915_gem.c               |   4 +-
 drivers/hwtracing/intel_th/msu.c              |   2 +-
 drivers/misc/ibmvmc.c                         |   2 +-
 drivers/misc/vmw_vmci/vmci_host.c             |   2 +-
 drivers/most/most_cdev.c                      |   2 +-
 drivers/net/ieee802154/ca8210.c               |   4 +-
 drivers/net/wireless/ath/wil6210/debugfs.c    |   2 +-
 .../intel/iwlwifi/pcie/gen1_2/trans.c         |   2 +-
 drivers/net/wireless/ti/wlcore/debugfs.c      |   2 +-
 drivers/ps3/ps3-lpm.c                         |   2 +-
 drivers/s390/crypto/zcrypt_api.h              |   4 +-
 drivers/spi/spidev.c                          |   2 +-
 .../staging/media/atomisp/pci/atomisp_cmd.c   |   8 +-
 drivers/tty/tty_ioctl.c                       |  14 +--
 drivers/tty/vt/vc_screen.c                    |   4 +-
 drivers/usb/gadget/function/f_hid.c           |   4 +-
 drivers/usb/gadget/function/f_printer.c       |   2 +-
 drivers/vfio/vfio_iommu_type1.c               |   4 +-
 drivers/xen/xenbus/xenbus_dev_frontend.c      |   2 +-
 fs/namespace.c                                |   2 +-
 fs/ocfs2/dlmfs/dlmfs.c                        |   2 +-
 fs/proc/base.c                                |   4 +-
 include/asm-generic/uaccess.h                 |   2 -
 include/linux/bpfptr.h                        |   2 +-
 include/linux/sockptr.h                       |   4 +-
 include/linux/uaccess.h                       | 107 ++++++++++++++----
 ipc/msg.c                                     |   8 +-
 ipc/sem.c                                     |   8 +-
 ipc/shm.c                                     |  18 +--
 kernel/regset.c                               |   2 +-
 kernel/sys.c                                  |   4 +-
 lib/Kconfig                                   |   3 +
 lib/Makefile                                  |   4 +-
 lib/kfifo.c                                   |   8 +-
 lib/{usercopy.c => usercheck.c}               |  22 ----
 lib/usercopy.c                                |  66 -----------
 mm/kasan/kasan_test_c.c                       |   4 +-
 mm/memory.c                                   |   2 +-
 net/x25/af_x25.c                              |   2 +-
 rust/helpers/uaccess.c                        |   6 +-
 sound/pci/emu10k1/emufx.c                     |   4 +-
 sound/pci/rme9652/hdsp.c                      |   6 +-
 sound/soc/intel/avs/probes.c                  |   6 +-
 sound/soc/sof/compress.c                      |  12 +-
 sound/soc/sof/sof-client-probes.c             |   6 +-
 92 files changed, 269 insertions(+), 288 deletions(-)
 copy lib/{usercopy.c => usercheck.c} (73%)

-- 
2.49.0


