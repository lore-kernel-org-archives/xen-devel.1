Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 527A0C43458
	for <xen-devel@archiver.kernel.org>; Tue, 30 Jun 2026 22:46:17 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1349480.1607240 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wehDL-0004qy-V8; Tue, 30 Jun 2026 22:45:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1349480.1607240; Tue, 30 Jun 2026 22:45:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wehDL-0004qr-Re; Tue, 30 Jun 2026 22:45:59 +0000
Received: by outflank-mailman (input) for mailman id 1349480;
 Tue, 30 Jun 2026 22:45:58 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sstabellini@kernel.org>) id 1wehDK-0004qV-Lm
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2026 22:45:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wehDJ-007O3T-AE
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 00:45:57 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6a444725-e002-0a2a0a5209dd-0a2a4509899e-0
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 00:45:57 +0200
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6a444723-97e6-0a2a45090019-aceafc1fd952-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 00:45:56 +0200
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id A62E1408C8;
 Tue, 30 Jun 2026 22:45:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A2CF1F000E9;
 Tue, 30 Jun 2026 22:45:54 +0000 (UTC)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=k20260515 header.d=kernel.org header.i="@kernel.org" header.h="Date:From:To:cc:Subject:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782859554;
	bh=rPQp72eYTd+6lIWcs7l+NA5gnGr+DWbIHlo5XcWuHPk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=dh37MX3aQd5SUgwlZof8jYSn41gWSKFxWfefyZ6nxbPJ7jGcdPMsYzCaPgHizfWBr
	 bbGBKF+KnqSCgb5mUzMb6htL275jlgCm5cJOl82tCpNZ33HGh7kIQpJgqOhwq4ompm
	 gfPZU9XFs73czJkrhp2d+mzXvis5MDnhTYkbT3GCFVSurbCBhFjk1rsw2j1y8qpWxu
	 RVaEvQ0rkTcJsVYtNhOOsDc3A44M0Kv7eCIfqXatXY7Lng6v4AB0PdXquEfzcTTQWa
	 uhxqO1eQEKOiZv0GcgJAmKkDIwVgioyHObspvJVaboKooF17mwuy2iaXcN9Uuyd0+x
	 9ZTS217UV7dig==
Date: Tue, 30 Jun 2026 15:45:53 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Dusan Stojkovic <stojkovicdusan555@gmail.com>
cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>, 
    Stefano Garzarella <sgarzare@redhat.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Anthony PERARD <anthony@xenproject.org>, 
    "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
    xen-devel@lists.xenproject.org, Viresh Kumar <viresh.kumar@linaro.org>, 
    Dusan Stojkovic <Dusan.Stojkovic@rt-rk.com>, 
    Nikola Jelic <Nikola.Jelic@rt-rk.com>
Subject: Re: [PATCH RFC v2 1/2] vhost: accept Xen guest RAM sections for
 vhost-user
In-Reply-To: <20260629-vhost-xen-foreign-mapping-v2-1-19e4685e7575@rt-rk.com>
Message-ID: <alpine.DEB.2.22.394.2606301538270.992629@ubuntu-linux-20-04-desktop>
References: <20260629-vhost-xen-foreign-mapping-v2-0-19e4685e7575@rt-rk.com> <20260629-vhost-xen-foreign-mapping-v2-1-19e4685e7575@rt-rk.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-purgate-ID: tlsNG-bad1c0/1782859556-55D90986-804EE7D5/0/0
X-purgate-type: clean
X-purgate-size: 3796

On Mon, 29 Jun 2026, Dusan Stojkovic wrote:
> From: Dusan Stojkovic <Dusan.Stojkovic@rt-rk.com>
> 
> When QEMU runs as a Xen device model, the guest's RAM is not allocated
> by QEMU and is not backed by a file descriptor that could be shared
> with a vhost-user backend: accesses from QEMU go through the Xen
> mapcache and memory_region_get_fd() returns -1. vhost_section()
> therefore filters out every RAM section, the vhost memory listener
> registers no regions, and starting any vhost-user device fails with
> "Failed initializing vhost-user memory map".
> 
> With VHOST_USER_PROTOCOL_F_XEN_MMAP the backend does not need an fd or
> a process-local mapping it maps guest memory itself through the Xen
> foreign mapping interface, using the guest physical address and domain
> id. Accept the Xen RAM region in vhost_section() so that it reaches
> the backend's memory table.
> 
> The Xen grant region (xen.grants) must never be accepted: grant
> references can only be mapped individually on demand via
> address_space_map(), and deriving a host pointer for the whole region,
> as vhost_region_add_section() does, aborts in the Xen mapcache. Note
> that xen_mr_is_memory() returns true for both the RAM and the grants
> region, so the grants region is excluded explicitly.
> 
> Because of the necessity to exlude xen.grants, the missing stub for
> xen_mr_is_grants is added so that it can be called from common code.
> 
> Signed-off-by: Dusan Stojkovic <Dusan.Stojkovic@rt-rk.com>
> Signed-off-by: Nikola Jelic <Nikola.Jelic@rt-rk.com>
> ---
>  hw/virtio/vhost.c  | 18 ++++++++++++++++++
>  hw/xen/xen_stubs.c |  5 +++++
>  2 files changed, 23 insertions(+)
> 
> diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
> index af41841b52..26770d06d5 100644
> --- a/hw/virtio/vhost.c
> +++ b/hw/virtio/vhost.c
> @@ -29,6 +29,7 @@
>  #include "system/dma.h"
>  #include "system/memory.h"
>  #include "system/ramblock.h"
> +#include "system/xen.h"
>  #include "trace.h"
>  
>  /* enabled until disconnected backend stabilizes */
> @@ -657,6 +658,23 @@ static bool vhost_section(struct vhost_dev *dev, MemoryRegionSection *section)
>              return false;
>          }
>  
> +        /*
> +         * Under Xen, the guest's RAM is not backed by an fd that
> +         * be passed to a vhost-user backend.  The backend instead

can be passed


> +         * guest memory through the Xen foreign mapping interface,

maps guest memory

Other than that it looks OK to me but someone more familier with
vhost-user should review the second patch

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> +         * by guest physical address and domain id (see
> +         * VHOST_USER_PROTOCOL_F_XEN_MMAP), so accept the Xen RAM
> +         * region even though it has no fd.
> +         */
> +        if (xen_enabled()) {
> +            if (xen_mr_is_memory(mr) && !xen_mr_is_grants(mr)) {
> +                trace_vhost_section(mr->name);
> +                return true;
> +            }
> +            trace_vhost_reject_section(mr->name, 4);
> +            return false;
> +        }
> +
>          /*
>           * Some backends (like vhost-user) can only handle memory regions
>           * that have an fd (can be mapped into a different process). Filter
> diff --git a/hw/xen/xen_stubs.c b/hw/xen/xen_stubs.c
> index f830768d99..7af39bceb0 100644
> --- a/hw/xen/xen_stubs.c
> +++ b/hw/xen/xen_stubs.c
> @@ -29,6 +29,11 @@ bool xen_mr_is_memory(const MemoryRegion *mr)
>      g_assert_not_reached();
>  }
>  
> +bool xen_mr_is_grants(const MemoryRegion *mr)
> +{
> +    g_assert_not_reached();
> +}
> +
>  bool xen_map_cache_enabled(void)
>  {
>      return false;
> 
> -- 
> 2.43.0
> 

