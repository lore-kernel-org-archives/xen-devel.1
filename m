Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 965A4606A31E
	for <xen-devel@archiver.kernel.org>; Sun, 22 Nov 2026 21:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BXie8At5
Received: from list by lists.xenproject.org with outflank-mailman.1499844.1696434 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVFYO-00022Z-H1; Sun, 22 Nov 2026 21:56:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1499844.1696434; Sun, 22 Nov 2026 21:56:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVFYO-00022S-Ds; Sun, 22 Nov 2026 21:56:56 +0000
Received: by outflank-mailman (input) for mailman id 1499844;
 Sun, 22 Nov 2026 21:56:55 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dakr@kernel.org>) id 1xVFYN-00022M-D7
 for xen-devel@lists.xenproject.org; Sun, 22 Nov 2026 21:56:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xVFYM-00BiVh-Kv
 for xen-devel@lists.xenproject.org; Sun, 22 Nov 2026 22:56:54 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dakr@kernel.org>)
 id 6b0364b6-8faa-0a2a0a5109dd-0a2a450ce4a0-28
 for <xen-devel@lists.xenproject.org>; Sun, 22 Nov 2026 22:56:54 +0100
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dakr@kernel.org>)
 id 6b036524-f479-0a2a450c0019-aceafc1f9292-3
 for <xen-devel@lists.xenproject.org>; Sun, 22 Nov 2026 22:56:54 +0100
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 1FC5D4249A;
 Sun, 22 Nov 2026 21:56:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 085171F000CF;
 Sun, 22 Nov 2026 21:56:42 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=k20260515 header.d=kernel.org header.i="@kernel.org" header.h="From:To:Cc:Subject:Date:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795384611;
	bh=bwqVDHaqqXUJecFoI8gfarhhx3uMgHGFcxRh37PQR30=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=BXie8At5QFQ5VGJ5Wgxa+Ryfj2HbGOJ0KDHW1aolgsw2YtdZGPnu8WYcSmeFf9iTy
	 5wiX3oWysPjoCke2hcQZDizPm34+kAe7FMjSaSZ9srwusVIqRO580db6LxZDAFaZ0+
	 3aDEW76QVsDdxoBaJCF/eDmBo7SUv8nl1byepex6XqNbxhpJHXHoKY2hbT2kLTC95N
	 7JnRNOt0TIdCgaQhdXGjEOlBwvV7HGnUumRRGA3StMRgzFJT0plPL8HRWUST+VQqvd
	 X4RjTcvHCj0K1oKGcN/z3PbXWOEFtUMKW6QRQ4AjrpymszI4/3zzB9pQMRd26c47gs
	 kxUaKiE3hZ+vA==
From: Danilo Krummrich <dakr@kernel.org>
To: Ian Rogers <irogers@google.com>
Cc: Danilo Krummrich <dakr@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kees Cook <kees@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Srish Srinivasan <ssrish@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Nayna Jain <nayna@linux.ibm.com>,
	Mimi Zohar <zohar@linux.ibm.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>,
	Alexander Aring <aahringo@redhat.com>,
	Felix Kuehling <felix.kuehling@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Zhihao Cheng <chengzhihao1@huawei.com>,
	Sumanth Korikkar <sumanthk@linux.ibm.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	driver-core@lists.linux.dev,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-sh@vger.kernel.org,
	linux-s390@vger.kernel.org,
	gfs2@lists.linux.dev,
	xen-devel@lists.xenproject.org,
	linux-mtd@lists.infradead.org,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/9] Add __must_init and require explicit kobj_type::release
Date: Sun, 22 Nov 2026 22:56:39 +0100
Message-ID: <20261122215639.1178566-1-dakr@kernel.org>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261119192520.1983406-1-irogers@google.com>
References: <20261119192520.1983406-1-irogers@google.com>
X-Patch-Reply: applied
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1795384614-50D3CA5B-6FBE5FB3/0/0
X-purgate-type: clean
X-purgate-size: 1358
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 19 Nov 2026 11:25:11 -0800, Ian Rogers wrote:
> [PATCH v4 0/9] Add __must_init and require explicit kobj_type::release

Applied, thanks!

  Branch: driver-core-testing
  Tree:   git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git

[1/9] Compiler Attributes: Add __must_init macro
      commit: b8a53320a885
[2/9] powerpc/secvar: Add missing kobject release callback to secvar_ktype
      commit: 4d5d4dd2a2e2
[3/9] sh: sq: Add missing kobject release callback to ktype_percpu_entry
      commit: d19384f2f3c7
[4/9] cpufreq: governor: Initialize kobj_type release callback statically
      commit: 009365942c15
[5/9] dlm: Wait for kobject release before freeing dlm_ls
      commit: 48ae948f4285
[6/9] xen/sys-hypervisor: Add release callback to hyp_sysfs_kobj_type
      commit: ecaf88d385c1
[7/9] ubifs: sysfs: Use kset_create_and_add() for ubifs_kset
      commit: 25d952902dee
[8/9] drm/amdkfd: Free queue in procfs_queue_type kobject release callback
      commit: 6d4ff4a020cf
[9/9] kobject: Require explicit initialization of struct kobj_type::release
      commit: 45eeed1f8094

The patches will appear in the next linux-next integration (typically within 24
hours on weekdays).

The patches are in the driver-core-testing branch and will be promoted to
driver-core-next after validation.

