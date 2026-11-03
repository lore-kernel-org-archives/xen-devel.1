Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00676606A31B
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2026 22:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AuKAd+2p
Received: from list by lists.xenproject.org with outflank-mailman.1470675.1679308 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOMZK-0004sk-4N; Tue, 03 Nov 2026 22:01:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1470675.1679308; Tue, 03 Nov 2026 22:01:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOMZK-0004sd-1B; Tue, 03 Nov 2026 22:01:26 +0000
Received: by outflank-mailman (input) for mailman id 1470675;
 Tue, 03 Nov 2026 22:01:24 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dakr@kernel.org>) id 1xOMZI-0004sP-Ke
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 22:01:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOMZH-00FeOK-PJ
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 23:01:23 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dakr@kernel.org>)
 id 6aea59b0-2eae-0a2a0a5409dd-0a2a4505d9f0-4
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 23:01:23 +0100
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dakr@kernel.org>)
 id 6aea59b2-4cb1-0a2a45050019-aceafc1fb816-3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 23:01:23 +0100
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id B58204026B;
 Tue,  3 Nov 2026 22:01:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73E5C1F000C1;
 Tue,  3 Nov 2026 22:01:16 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=k20260515 header.d=kernel.org header.i="@kernel.org" header.h="Date:Subject:Cc:To:From:References:In-Reply-To"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793743281;
	bh=R6uA9hX7fD85rhN6sNXcNNPGP4g4K/KhTQ6rqqOfAX0=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=AuKAd+2pAiWxmodz6a5kLrzOGag2dQXGCvIWfiU2SqiHPwjnt+DZeZOIZzwDoeFgW
	 f5tvI82TTyJbTTJBeMupREcEqkEJOTnvm2tcg6rR6KzI977TOiUnB4XfJblBR0m8Ko
	 3on7l/RW87okd18TkMziqprxQ9KNwBaxunuTpwN+wdELBok8svqqglFYItI7OaAie9
	 SaIAxAjUUZc0FGMB/GEzff7Fem5FCCZW2y7K8Ha9aPGJ34HwNpxMac8F2DMTukXzX4
	 NMMYmaBoHXuYiAJmGYwn0YL5KCqaN+IzO8Fe7/dimMO7SXev4BOPXOSMGcMZiQPmb5
	 yEemvUz0AwJZg==
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 03 Nov 2026 23:01:15 +0100
Message-Id: <DMLWX8NY1N1N.2OMQMQCIVRR18@kernel.org>
Subject: Re: [PATCH v2 0/9] Add __must_init and require explicit
 kobj_type::release
Cc: "Kees Cook" <kees@kernel.org>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Miguel Ojeda" <ojeda@kernel.org>, "Rafael J
 . Wysocki" <rafael@kernel.org>, "Nathan Chancellor" <nathan@kernel.org>,
 "Nick Desaulniers" <ndesaulniers@google.com>, "Miguel Ojeda"
 <miguel.ojeda.sandonis@gmail.com>, =?utf-8?q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, "Zhihao Cheng" <chengzhihao1@huawei.com>,
 "Zhongqiu Han" <zhongqiu.han@oss.qualcomm.com>, "Sumanth Korikkar"
 <sumanthk@linux.ibm.com>, "Bill Wendling" <morbo@google.com>, "Justin
 Stitt" <justinstitt@google.com>, <driver-core@lists.linux.dev>,
 <llvm@lists.linux.dev>, <linux-hardening@vger.kernel.org>,
 <linux-fsdevel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
 <linux-acpi@vger.kernel.org>, <linux-pm@vger.kernel.org>,
 <linuxppc-dev@lists.ozlabs.org>, <linux-sh@vger.kernel.org>,
 <linux-s390@vger.kernel.org>, <gfs2@lists.linux.dev>,
 <xen-devel@lists.xenproject.org>, <linux-mtd@lists.infradead.org>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
To: "Ian Rogers" <irogers@google.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20261027223847.652884-1-irogers@google.com>
In-Reply-To: <20261027223847.652884-1-irogers@google.com>
X-purgate-ID: tlsNG-c201ff/1793743283-738BE2A1-A7A6175B/0/0
X-purgate-type: clean
X-purgate-size: 1324
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue Oct 27, 2026 at 11:38 PM CET, Ian Rogers wrote:
> Clang supports the 'require_explicit_initialization' attribute on struct
> fields to enforce that the field is explicitly initialized when an
> aggregate object is constructed, emitting -Wuninitialized-explicit-init
> (enabled by default) if the field is omitted.
>
> Following discussion at the Linux Plumbers Conference [1], patch 1 adds
> the attribute to include/linux/compiler_attributes.h as __must_init. In
> v1 it was called __require_explicit_initialization. Kees picked up that
> patch with a first seq_file user [2], and in that thread Greg suggested
> the shorter __must_init spelling, which Kees and Miguel agreed to. As
> the attribute did not land in the v7.4 merge window, Kees asked that
> this series carry the renamed attribute. The Acked-by/Reviewed-by tags
> on patch 1 were given for the original spelling; the rename is
> mechanical.

This looks ready, and I plan to pick it up through the driver-core tree wit=
h the
minor commit message correction.

>   powerpc/secvar: Add missing kobject release callback to secvar_ktype
>   sh: sq: Add missing kobject release callback to ktype_percpu_entry
>   xen/sys-hypervisor: Add release callback to hyp_sysfs_kobj_type

Some ACKs would be appreciated. :)

Thanks,
Danilo

