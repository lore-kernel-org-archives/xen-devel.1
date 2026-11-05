Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77AB1606A32C
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2026 21:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n5OND3Bx
Received: from list by lists.xenproject.org with outflank-mailman.1475554.1682163 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xP4er-0002Km-Ec; Thu, 05 Nov 2026 21:06:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1475554.1682163; Thu, 05 Nov 2026 21:06:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xP4er-0002Kf-Am; Thu, 05 Nov 2026 21:06:05 +0000
Received: by outflank-mailman (input) for mailman id 1475554;
 Thu, 05 Nov 2026 21:06:04 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ljs@kernel.org>) id 1xP4eq-0002KZ-Ey
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 21:06:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xP4ep-00FGA3-Rz
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 22:06:03 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ljs@kernel.org>)
 id 6aecef9d-8faa-0a2a0a5109dd-0a2a4508b642-44
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 22:06:03 +0100
Received: from [172.105.4.254] (helo=tor.source.kernel.org)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ljs@kernel.org>)
 id 6aecefba-f659-0a2a45080019-ac6904fed0c4-3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 22:06:03 +0100
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id E0A56601E3;
 Thu,  5 Nov 2026 21:06:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB99D1F0089F;
 Thu,  5 Nov 2026 21:05:49 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=k20260515 header.d=kernel.org header.i="@kernel.org" header.h="From:Subject:Date:To:Cc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793912761;
	bh=r1JpUn64UzzrZcFRUjQyI0S3ynWk5u6y/MaberysBgo=;
	h=From:Subject:Date:To:Cc;
	b=n5OND3BxSSsOe8W9Zhi3cBnfi6d7KzMyxkuyo5/trkHHVydx/yyOeQwXqKCdDUFcT
	 m0c7eQ5D+U2buHxE7rSfcgJl5cMehkqtS+hpW9IxvuXOMi55EMjADBA8fn4bKVqGbY
	 QpdNhrT0rU9HdBZA+CuDfrevb5VT/Sx+nUsDraIAPhBmT6/yt6g6bda0HLCJEF8Rbm
	 u4rk8HUwvqrwddVG/k8amH7FQhV89FGy1AgFqoqMKw9DPQswpB9EwKW20G2YExJRhk
	 9nSCRJkbQMXNq6KKP+CtmuUzVVPRlageLXK7RVKP4WcD+F7KQux77Q7qE1lDODIcT6
	 zYdrWy6DfJfSw==
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Subject: [PATCH 00/14] mm: convert further simple mmap hooks to
 mmap_prepare
Date: Thu, 05 Nov 2026 21:05:31 +0000
Message-Id: <20261105-late-2026-mmap_prepare-v1-0-c56aadfbab8a@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MXQqAIBAE4KvIPregBhVdJSJEt1roRzQiiO7e1
 uM3zMwNmRJThlbdkOjkzPsmMIUCP7ttIuQgBqttZYw2uLiD8BOuq4tDTBRdItTWN3WwpVQIZCz
 5yNd/3PXP8wJmgP8laAAAAA==
X-Change-ID: 20261101-late-2026-mmap_prepare-02c87d23101e
To: Juergen Gross <jgross@suse.com>, 
 Stefano Stabellini <sstabellini@kernel.org>, 
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Nicholas Piggin <npiggin@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, 
 Shrikanth Hegde <sshegde@linux.ibm.com>, 
 Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
 Dexuan Cui <decui@microsoft.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Jason Wang <jasowangio@gmail.com>, 
 =?utf-8?q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Jarkko Sakkinen <jarkko@kernel.org>, 
 Dave Hansen <dave.hansen@linux.intel.com>, 
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Jan Kara <jack@suse.com>, 
 Paul Moore <paul@paul-moore.com>, 
 Stephen Smalley <stephen.smalley.work@gmail.com>, 
 =?utf-8?q?Ondrej_Mosn=C3=A1=C4=8Dek?= <omosnacek@gmail.com>, 
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Ryan Chen <ryan_chen@aspeedtech.com>, 
 Billy Tsai <billy_tsai@aspeedtech.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>, 
 Scott Branden <scott.branden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Richard Cochran <richardcochran@gmail.com>, 
 David Woodhouse <dwmw2@infradead.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: ljs@kernel.org, xen-devel@lists.xenproject.org, 
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 kvm@vger.kernel.org, linux-hyperv@vger.kernel.org, 
 virtualization@lists.linux.dev, linux-sgx@vger.kernel.org, 
 selinux@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-arm-msm@vger.kernel.org, 
 op-tee@lists.trustedfirmware.org, netdev@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2622; i=ljs@kernel.org;
 h=from:subject:message-id; bh=bTkwJYolGBPtNOiPTfj3hFZfQ60rxzsNf5rIq+CvvT4=;
 b=owGbwMvMwCV2fu7ZrsZH9SKMp9WSGLLevF/tK9xtdq7Cd9m+05LfHinP2t1rLvjzsfyV5AfsU
 /zCH+pydZSyMIhxMciKKbI8/yK+P0gkbF7nBX83mDmsTCBDGLg4BWAiX68x/GI6KjBdv8dWvKl/
 o4fajxstEyfeVrhs6VhWqdT9b1lOzElGhhMsTpzms2K+v4ia9+OlpuvFLR9T93vz6S/zZZ6pzvr
 6EAsA
X-Developer-Key: i=ljs@kernel.org; a=openpgp;
 fpr=E7F417BF5214569E89D04F46CF9DCD8A81E27F14
X-purgate-ID: tlsNG-c1860d/1793912763-CD54C87B-EB5C5A15/0/0
X-purgate-type: clean
X-purgate-size: 2624
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Continue the conversion of users of the deprecated f_op->mmap callback to
f_op->mmap_prepare. Keep things gentle this cycle by targeting simple
cases.

No functional change intended.

Build tested on x86-64 (allmodconfig, each patch individually), i386,
arm64 and ppc64le.

<<>>

David, Andrew - I wonder whether one of you guys could take this series
through your tree? Since it's kernel-wide it seems sensible to take it
through an mm tree.

Thanks!

Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
---
Lorenzo Stoakes (ARM) (14):
      xen/privcmd: convert mmap hook to mmap_prepare
      KVM: PPC: Book3S: convert spapr TCE mmap hook to mmap_prepare
      mshv_vtl: convert mmap hooks to mmap_prepare
      vduse: convert IOVA domain mmap hook to mmap_prepare
      x86/sgx: convert vepc mmap hook to mmap_prepare
      udf: convert mmap hook to mmap_prepare
      selinuxfs: convert mmap hooks to mmap_prepare
      xen: convert xenstore interface mmap hooks to mmap_prepare
      soc: aspeed: convert LPC and P2A control mmap hooks to mmap_prepare
      soc: qcom: rmtfs_mem: convert mmap hook to mmap_prepare
      tee: convert shm mmap hook to mmap_prepare
      misc: bcm-vk: convert mmap hook to mmap_prepare
      ptp: vmclock: convert mmap hook to mmap_prepare
      vhost-vdpa: convert mmap hook to mmap_prepare

 arch/powerpc/kvm/book3s_64_vio.c        |  6 +++---
 arch/x86/kernel/cpu/sgx/virt.c          | 15 ++++++++-------
 drivers/hv/mshv_vtl_main.c              | 14 +++++++-------
 drivers/misc/bcm-vk/bcm_vk_dev.c        | 20 ++++++++++----------
 drivers/ptp/ptp_vmclock.c               | 19 +++++++++----------
 drivers/soc/aspeed/aspeed-lpc-ctrl.c    | 20 +++++++++-----------
 drivers/soc/aspeed/aspeed-p2a-ctrl.c    | 22 ++++++++--------------
 drivers/soc/qcom/rmtfs_mem.c            | 22 ++++++++++------------
 drivers/tee/tee_shm.c                   | 14 +++++++-------
 drivers/vdpa/vdpa_user/iova_domain.c    | 12 ++++++------
 drivers/vhost/vdpa.c                    | 23 ++++++++++++-----------
 drivers/xen/privcmd.c                   | 11 +++++------
 drivers/xen/xenbus/xenbus_dev_backend.c | 14 ++++++--------
 drivers/xen/xenfs/xenstored.c           | 14 ++++++--------
 fs/udf/file.c                           |  8 ++++----
 security/selinux/selinuxfs.c            | 24 +++++++++++-------------
 16 files changed, 121 insertions(+), 137 deletions(-)
---
base-commit: b61fa14ce6bcbba2cb9a96feea31b760226d6b43
change-id: 20261101-late-2026-mmap_prepare-02c87d23101e

Cheers,
-- 
Lorenzo Stoakes (ARM) <ljs@kernel.org>


