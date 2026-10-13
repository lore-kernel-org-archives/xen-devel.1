Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91F9ECC6B12
	for <xen-devel@archiver.kernel.org>; Tue, 13 Oct 2026 22:40:45 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1448328.1664328 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGlAQ-0006V7-5S; Tue, 13 Oct 2026 22:40:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1448328.1664328; Tue, 13 Oct 2026 22:40:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGlAQ-0006V0-2c; Tue, 13 Oct 2026 22:40:18 +0000
Received: by outflank-mailman (input) for mailman id 1448328;
 Tue, 13 Oct 2026 22:40:16 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3TLPOagcKCUsv41tr45t11tyr.p1zAr0-qr8ryyv565.Ar0241wrp6.14t@flex--irogers.bounces.google.com>)
 id 1xGlAO-0006Ut-9o
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 22:40:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGlAN-003MCl-Je
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2026 00:40:15 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3TLPOagcKCUsv41tr45t11tyr.p1zAr0-qr8ryyv565.Ar0241wrp6.14t@flex--irogers.bounces.google.com>)
 id 6aceb32c-8faa-0a2a0a5109dd-0a2a45028124-14
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 00:40:15 +0200
Received: from [74.125.82.198] (helo=mail-dy1-f198.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <3TLPOagcKCUsv41tr45t11tyr.p1zAr0-qr8ryyv565.Ar0241wrp6.14t@flex--irogers.bounces.google.com>)
 id 6aceb34e-6ca4-0a2a45020019-4a7d52c6bc56-3
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 00:40:15 +0200
Received: by mail-dy1-f198.google.com with SMTP id
 5a478bee46e88-30bcb065bfdso6715948eec.0
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 15:40:14 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=google.com header.i="@google.com" header.h="Content-Type:Cc:To:From:Subject:Message-ID:Mime-Version:Date"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791931213; x=1792536013; darn=lists.xenproject.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6CWZGGdh7JOQ6UqV1gxmMbPkjK0LPv1nbOU26QpmZ10=;
        b=C8fvNosO2IgQu0e5orrRxXymtHE8QjkmVwVLKfu8B9YcnJIKvbSwDqEMUkprtpea38
         8MeSNUha/jNCh1Nx1KL9tHdJSF+r/cGgSlNaO0mcD8FaT3h7r40Qps23jJDtUNZKNgsA
         hqIn6rgSmAiUjov0hk3uiOoP+4Q0nap72DpjSk1eaywNTKgDhFX1wdGqOtF/NaAkryUw
         5yEQGxASURBK9EcCzNQnTC6+38RbZ4SE8GxMtnJ1OpGwLaCjlJwMzBUlKwyPHlVHU5u1
         P/RYDh253vNgtweiZE+r2CjdzIZ5q5DH3YRo9PLLVg8RhXTogXN26AXheW2Jz16n8BUg
         uHKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791931213; x=1792536013;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6CWZGGdh7JOQ6UqV1gxmMbPkjK0LPv1nbOU26QpmZ10=;
        b=sqqEHPRSNvKrGaDp1wMaUp1VbFaWW1sabcVtnI5E9so8qwVPcV/FG717nJkn2kFYsz
         eBhO7B/N5wi2iucq+Mh7eNOrN2+mnIoKsEy+RuRoENDJbAKLk7B9XqvvEwZEaxVQ/qwE
         9Horv/ZT9L5x9tKogbAZ02babd643Zq9qFF9InLyXAJvakfE20+MRBxd9LbXiiURQw3U
         EkHc2a0X+g6CnQx1o0EhINkPbW6pD3uEzhmSDV2vljV4/zL2wBwKReuUvdpkPH85dat0
         7Dgy+7dEwrFcChVjw2nMq0zf+qs5LceDmSLxlcV/PewqPHb4NjEmuGzBnzXmZxVu40ZV
         +RYg==
X-Forwarded-Encrypted: i=1; AKwUvByl1B22Cr9P8ynjzo1yJF0HnymSxwIEMk7fNnRj83fB3iqaoLU5uUahO4R67RpQH7sR0il++HxKqHA=@lists.xenproject.org
X-Gm-Message-State: AFq9FYIngwcylbWZo5OPtq3qREN4yy1Cj5K74WdpjFA+aDvhD5b3uiW/
	b2mhqQiupifo42+lGIt4vuOXzlDxuT8lfta83b+wXkekIp/mK3grWT+FjLOo0flkG4kQtjnqh7P
	3Votuy1VXyA==
X-Received: from dlak14.prod.google.com ([2002:a05:701b:290e:b0:14e:f9ab:6f83])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:2309:b0:153:7a27:b89
 with SMTP id a92af1059eb24-16a5ed4008cmr22709999c88.21.1791931212336; Tue, 13
 Oct 2026 15:40:12 -0700 (PDT)
Date: Tue, 13 Oct 2026 15:39:35 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Message-ID: <20261013223946.1836757-1-irogers@google.com>
Subject: [PATCH 00/11] kobject: Require explicit initialization of struct kobj_type::release
From: Ian Rogers <irogers@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Kees Cook <kees@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <chleroy@kernel.org>, Nayna Jain <nayna@linux.ibm.com>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Viresh Kumar <viresh.kumar@linaro.org>, 
	David Teigland <teigland@redhat.com>, Alexander Aring <aahringo@redhat.com>, 
	Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Richard Weinberger <richard@nod.at>, Zhihao Cheng <chengzhihao1@huawei.com>, 
	Felix Kuehling <Felix.Kuehling@amd.com>, Alex Deucher <alexander.deucher@amd.com>, 
	"=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>, driver-core@lists.linux.dev, 
	llvm@lists.linux.dev, linux-hardening@vger.kernel.org, 
	linux-doc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-sh@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-acpi@vger.kernel.org, gfs2@lists.linux.dev, 
	xen-devel@lists.xenproject.org, linux-s390@vger.kernel.org, 
	linux-mtd@lists.infradead.org, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"
X-purgate-ID: tlsNG-720697/1791931215-30DC12AC-E5852568/0/0
X-purgate-type: clean
X-purgate-size: 4246

Clang supports the 'require_explicit_initialization' attribute on struct
fields to enforce that the field is explicitly initialized when an
aggregate object is constructed, emitting -Wuninitialized-explicit-init
(enabled by default) if the field is omitted.

Following discussion at the Linux Plumbers Conference [1], this series
introduces __require_explicit_initialization in
include/linux/compiler_attributes.h and applies it to
struct kobj_type::release.

As Documentation/core-api/kobject.rst notes:
  "One important point cannot be overstated: every kobject must have a
  release() method, and the kobject must persist (in a consistent state)
  until that method is called. If these constraints are not met, the code
  is flawed."

Annotating struct kobj_type::release caught 30 struct kobj_type
definitions across the tree that omitted .release:
- Patches 2-10 fix 10 struct kobj_type definitions where dynamically
  allocated kobjects, ksets, or enclosing structures were either leaked on
  kobject_put() or freed prematurely before kobject release (risking a
  use-after-free when CONFIG_DEBUG_KOBJECT_RELEASE=y).
- Patch 11 annotates struct kobj_type::release with
  __require_explicit_initialization and explicitly sets .release = NULL
  (with explanatory comments) on the remaining legacy struct kobj_type
  definitions whose kobjects are static, per-CPU, or embedded in devm- or
  parent-managed structures.

[1] https://lpc.events/event/20/contributions/2392/

Ian Rogers (11):
  Compiler Attributes: Add __require_explicit_initialization macro
  powerpc/secvar: Add missing kobject release callback to secvar_ktype
  sh: sq: Add missing kobject release callback to ktype_percpu_entry
  cpufreq: Initialize kobj_type release callback in ondemand and
    conservative governors
  ACPI: CPPC: Free cpc_desc in kobject release callback
  dlm: Free dlm_ls in kobject release callback
  xen/sys-hypervisor: Add release callback to hyp_sysfs_kobj_type
  s390/sclp_mem: Allocate struct sclp_mem dynamically and add kobject
    release
  ubifs: sysfs: Use kset_create_and_add() for ubifs_kset
  drm/amdkfd: Free queue in procfs_queue_type kobject release callback
  kobject: Require explicit initialization of struct kobj_type::release

 Documentation/conf.py                         |  1 +
 arch/arm64/kernel/cpuinfo.c                   |  2 +
 arch/powerpc/kernel/secvar-sysfs.c            |  6 ++
 arch/sh/kernel/cpu/sh4/sq.c                   |  6 ++
 drivers/acpi/cppc_acpi.c                      | 39 +++++-----
 drivers/acpi/sysfs.c                          |  2 +
 drivers/cpufreq/cpufreq_conservative.c        |  5 +-
 drivers/cpufreq/cpufreq_governor.c            |  3 +-
 drivers/cpufreq/cpufreq_governor.h            |  1 +
 drivers/cpufreq/cpufreq_ondemand.c            |  5 +-
 drivers/dma/ioat/sysfs.c                      |  2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c       |  4 +
 drivers/gpu/drm/amd/amdkfd/kfd_process.c      | 10 ++-
 drivers/gpu/drm/amd/amdkfd/kfd_queue.c        |  5 +-
 drivers/infiniband/hw/hfi1/sysfs.c            |  2 +
 drivers/infiniband/hw/usnic/usnic_ib_sysfs.c  |  2 +
 drivers/parisc/pdc_stable.c                   |  2 +
 drivers/power/supply/ab8500_fg.c              |  2 +
 drivers/s390/char/sclp_mem.c                  | 73 +++++++++----------
 drivers/soc/hisilicon/kunpeng_hccs.c          |  6 ++
 .../fbdev/omap2/omapfb/dss/display-sysfs.c    |  2 +
 .../fbdev/omap2/omapfb/dss/manager-sysfs.c    |  2 +
 .../fbdev/omap2/omapfb/dss/overlay-sysfs.c    |  2 +
 drivers/xen/sys-hypervisor.c                  |  6 ++
 fs/dlm/lockspace.c                            | 19 +++--
 fs/erofs/sysfs.c                              |  4 +
 fs/f2fs/sysfs.c                               |  6 ++
 fs/ocfs2/cluster/masklog.c                    |  2 +
 fs/ubifs/sysfs.c                              | 24 ++----
 include/linux/compiler_attributes.h           | 11 +++
 include/linux/kobject.h                       |  2 +-
 scripts/checkpatch.pl                         |  1 +
 tools/lib/python/kdoc/xforms_lists.py         |  1 +
 33 files changed, 170 insertions(+), 90 deletions(-)

-- 
2.56.0.385.gd3acb90ef8-goog


