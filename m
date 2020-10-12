Return-Path: <SRS0=QJhb=DU=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 524A3C433E7
	for <xen-devel@archiver.kernel.org>; Tue, 13 Oct 2020 04:12:25 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E96B8207C3
	for <xen-devel@archiver.kernel.org>; Tue, 13 Oct 2020 04:12:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E96B8207C3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.6030.15987 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSBfM-00071O-Jn; Tue, 13 Oct 2020 04:12:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 6030.15987; Tue, 13 Oct 2020 04:12:00 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSBfM-000718-Dj; Tue, 13 Oct 2020 04:12:00 +0000
Received: by outflank-mailman (input) for mailman id 6030;
 Mon, 12 Oct 2020 20:25:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zk8D=DT=suse.de=cfontana@srs-us1.protection.inumbo.net>)
 id 1kS4NV-0000l8-Ox
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2020 20:25:05 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 28a17db1-52a4-4e34-a587-3f4a41a797f2;
 Mon, 12 Oct 2020 20:25:04 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 809DDAFF9;
 Mon, 12 Oct 2020 20:25:03 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=zk8D=DT=suse.de=cfontana@srs-us1.protection.inumbo.net>)
	id 1kS4NV-0000l8-Ox
	for xen-devel@lists.xenproject.org; Mon, 12 Oct 2020 20:25:05 +0000
X-Inumbo-ID: 28a17db1-52a4-4e34-a587-3f4a41a797f2
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 28a17db1-52a4-4e34-a587-3f4a41a797f2;
	Mon, 12 Oct 2020 20:25:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 809DDAFF9;
	Mon, 12 Oct 2020 20:25:03 +0000 (UTC)
Subject: Re: [PATCH 2/2] accel: Add xen CpusAccel using dummy-cpu
To: Jason Andryuk <jandryuk@gmail.com>, qemu-devel@nongnu.org
Cc: Anthony Perard <anthony.perard@citrix.com>,
 "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>
References: <20201012200725.64137-1-jandryuk@gmail.com>
 <20201012200725.64137-3-jandryuk@gmail.com>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <cafc34c0-0bcd-d138-d46d-ac2c0d5ba2fb@suse.de>
Date: Mon, 12 Oct 2020 22:25:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201012200725.64137-3-jandryuk@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 10/12/20 10:07 PM, Jason Andryuk wrote:
> Xen was broken by commit 1583a3898853 ("cpus: extract out qtest-specific
> code to accel/qtest").  Xen relied on qemu_init_vcpu() calling
> qemu_dummy_start_vcpu() in the default case, but that was replaced by
> g_assert_not_reached().
> 
> Add a minimal "CpusAccel" for xen using the dummy-cpu implementation
> used by qtest.
> 
> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
> ---
>  accel/dummy/meson.build |  1 +
>  accel/xen/xen-all.c     | 10 ++++++++++
>  2 files changed, 11 insertions(+)
> 
> diff --git a/accel/dummy/meson.build b/accel/dummy/meson.build
> index 5fbe27de90..cdff0ba746 100644
> --- a/accel/dummy/meson.build
> +++ b/accel/dummy/meson.build
> @@ -4,3 +4,4 @@ dummy_ss.add(files(
>  ))
>  
>  specific_ss.add_all(when: ['CONFIG_SOFTMMU', 'CONFIG_POSIX'], if_true: dummy_ss)
> +specific_ss.add_all(when: ['CONFIG_XEN'], if_true: dummy_ss)
> diff --git a/accel/xen/xen-all.c b/accel/xen/xen-all.c
> index 60b971d0a8..2d243c58d4 100644
> --- a/accel/xen/xen-all.c
> +++ b/accel/xen/xen-all.c
> @@ -16,12 +16,15 @@
>  #include "hw/xen/xen_pt.h"
>  #include "chardev/char.h"
>  #include "sysemu/accel.h"
> +#include "sysemu/cpus.h"
>  #include "sysemu/xen.h"
>  #include "sysemu/runstate.h"
>  #include "migration/misc.h"
>  #include "migration/global_state.h"
>  #include "hw/boards.h"
>  
> +#include "accel/dummy/dummy-cpus.h"

it seems this should be in includes/sysemu/accel.h or so.

> +
>  //#define DEBUG_XEN
>  
>  #ifdef DEBUG_XEN
> @@ -153,6 +156,10 @@ static void xen_setup_post(MachineState *ms, AccelState *accel)
>      }
>  }
>  
> +const CpusAccel xen_cpus = {
> +    .create_vcpu_thread = dummy_start_vcpu_thread,
> +};
> +
>  static int xen_init(MachineState *ms)
>  {
>      MachineClass *mc = MACHINE_GET_CLASS(ms);
> @@ -180,6 +187,9 @@ static int xen_init(MachineState *ms)
>       * opt out of system RAM being allocated by generic code
>       */
>      mc->default_ram_id = NULL;
> +
> +    cpus_register_accel(&xen_cpus);
> +
>      return 0;
>  }
>  
> 

Ciao,

Claudio

