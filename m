Return-Path: <SRS0=1DY5=BW=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98E5EC433E0
	for <xen-devel@archiver.kernel.org>; Wed, 12 Aug 2020 07:29:30 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 70EB320768
	for <xen-devel@archiver.kernel.org>; Wed, 12 Aug 2020 07:29:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 70EB320768
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k5lBq-0003Lt-Or; Wed, 12 Aug 2020 07:28:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x5l8=BW=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1k5lBp-0003Lo-Eh
 for xen-devel@lists.xenproject.org; Wed, 12 Aug 2020 07:28:49 +0000
X-Inumbo-ID: 8fd9afc8-ceab-40d5-9ab3-174fa7d63d9f
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8fd9afc8-ceab-40d5-9ab3-174fa7d63d9f;
 Wed, 12 Aug 2020 07:28:48 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 82F8FB1EE;
 Wed, 12 Aug 2020 07:29:08 +0000 (UTC)
Subject: Re: [PATCH v4 2/2] xen: add helpers to allocate unpopulated memory
To: Roger Pau Monne <roger.pau@citrix.com>, linux-kernel@vger.kernel.org
References: <20200811094447.31208-1-roger.pau@citrix.com>
 <20200811094447.31208-3-roger.pau@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <7c9a25fa-c52c-66d2-3b03-14a59e069ab6@suse.com>
Date: Wed, 12 Aug 2020 09:28:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200811094447.31208-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 David Airlie <airlied@linux.ie>, Yan Yankovskyi <yyankovskyi@gmail.com>,
 David Hildenbrand <david@redhat.com>, dri-devel@lists.freedesktop.org,
 Michal Hocko <mhocko@kernel.org>, linux-mm@kvack.org,
 Daniel Vetter <daniel@ffwll.ch>, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 11.08.20 11:44, Roger Pau Monne wrote:
> To be used in order to create foreign mappings. This is based on the
> ZONE_DEVICE facility which is used by persistent memory devices in
> order to create struct pages and kernel virtual mappings for the IOMEM
> areas of such devices. Note that on kernels without support for
> ZONE_DEVICE Xen will fallback to use ballooned pages in order to
> create foreign mappings.
> 
> The newly added helpers use the same parameters as the existing
> {alloc/free}_xenballooned_pages functions, which allows for in-place
> replacement of the callers. Once a memory region has been added to be
> used as scratch mapping space it will no longer be released, and pages
> returned are kept in a linked list. This allows to have a buffer of
> pages and prevents resorting to frequent additions and removals of
> regions.
> 
> If enabled (because ZONE_DEVICE is supported) the usage of the new
> functionality untangles Xen balloon and RAM hotplug from the usage of
> unpopulated physical memory ranges to map foreign pages, which is the
> correct thing to do in order to avoid mappings of foreign pages depend
> on memory hotplug.
> 
> Note the driver is currently not enabled on Arm platforms because it
> would interfere with the identity mapping required on some platforms.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
> Cc: Juergen Gross <jgross@suse.com>
> Cc: Stefano Stabellini <sstabellini@kernel.org>
> Cc: Dan Carpenter <dan.carpenter@oracle.com>
> Cc: Roger Pau Monne <roger.pau@citrix.com>
> Cc: Wei Liu <wl@xen.org>
> Cc: Yan Yankovskyi <yyankovskyi@gmail.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: xen-devel@lists.xenproject.org
> Cc: linux-mm@kvack.org
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Michal Hocko <mhocko@kernel.org>
> Cc: Dan Williams <dan.j.williams@intel.com>
> ---
> Changes since v3:
>   - Introduce a Kconfig option that gates the addition of the
>     unpopulated alloc driver. This allows to easily disable it on Arm
>     platforms.
>   - Dropped Juergen RB due to the addition of the Kconfig option.
>   - Switched from MEMORY_DEVICE_DEVDAX to MEMORY_DEVICE_GENERIC.
> 
> Changes since v2:
>   - Drop BUILD_BUG_ON regarding PVMMU page sizes.
>   - Use a SPDX license identifier.
>   - Call fill with only the minimum required number of pages.
>   - Include xen.h header in xen_drm_front_gem.c.
>   - Use less generic function names.
>   - Exit early from the init function if not a PV guest.
>   - Don't use all caps for region name.
> ---
>   drivers/gpu/drm/xen/xen_drm_front_gem.c |   9 +-
>   drivers/xen/Kconfig                     |   4 +
>   drivers/xen/Makefile                    |   1 +
>   drivers/xen/balloon.c                   |   4 +-
>   drivers/xen/grant-table.c               |   4 +-
>   drivers/xen/privcmd.c                   |   4 +-
>   drivers/xen/unpopulated-alloc.c         | 185 ++++++++++++++++++++++++
>   drivers/xen/xenbus/xenbus_client.c      |   6 +-
>   drivers/xen/xlate_mmu.c                 |   4 +-
>   include/xen/xen.h                       |   9 ++
>   10 files changed, 215 insertions(+), 15 deletions(-)
>   create mode 100644 drivers/xen/unpopulated-alloc.c
> 
> diff --git a/drivers/xen/Kconfig b/drivers/xen/Kconfig
> index 1d339ef92422..018020b91baa 100644
> --- a/drivers/xen/Kconfig
> +++ b/drivers/xen/Kconfig
> @@ -327,4 +327,8 @@ config XEN_HAVE_VPMU
>   config XEN_FRONT_PGDIR_SHBUF
>   	tristate
>   
> +config XEN_UNPOPULATED_ALLOC
> +	bool
> +	default y if ZONE_DEVICE && !ARM && !ARM64

There is a current effort to enable Xen on RISC-V. Do we expect this
option to be usable for this architecture? If yes, I'm fine with the
exclusion of Arm, otherwise I'd opt for defaulting to yes only for
X86.

Either way you can have my:

Reviewed-by: Juergen Gross <jgross@suse.com>


Juergen

