Return-Path: <SRS0=d7tj=7P=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FD77C433E0
	for <xen-devel@archiver.kernel.org>; Tue,  2 Jun 2020 09:04:04 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D980420679
	for <xen-devel@archiver.kernel.org>; Tue,  2 Jun 2020 09:04:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D980420679
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jg2ps-0003Ea-80; Tue, 02 Jun 2020 09:03:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Exxl=7P=hermes.cam.ac.uk=amc96@srs-us1.protection.inumbo.net>)
 id 1jg2pr-0003EV-Pk
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2020 09:03:51 +0000
X-Inumbo-ID: f9f67996-a4af-11ea-81bc-bc764e2007e4
Received: from ppsw-30.csi.cam.ac.uk (unknown [131.111.8.130])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f9f67996-a4af-11ea-81bc-bc764e2007e4;
 Tue, 02 Jun 2020 09:03:51 +0000 (UTC)
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: http://help.uis.cam.ac.uk/email-scanner-virus
Received: from 88-109-182-220.dynamic.dsl.as9105.com ([88.109.182.220]:53456
 helo=[192.168.1.219])
 by ppsw-30.csi.cam.ac.uk (smtp.hermes.cam.ac.uk [131.111.8.156]:465)
 with esmtpsa (PLAIN:amc96) (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 id 1jg2pn-000AqR-dG (Exim 4.92.3)
 (return-path <amc96@hermes.cam.ac.uk>); Tue, 02 Jun 2020 10:03:47 +0100
Subject: Re: [PATCH v10 08/12] xen: add /buildinfo/config entry to hypervisor
 filesystem
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <20200519072106.26894-1-jgross@suse.com>
 <20200519072106.26894-9-jgross@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <e2e71f5e-ac77-b5ed-71c1-bf5b7d74abcd@citrix.com>
Date: Tue, 2 Jun 2020 10:03:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200519072106.26894-9-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 19/05/2020 08:21, Juergen Gross wrote:
> diff --git a/xen/common/Makefile b/xen/common/Makefile
> index bf7d0e25a3..3d61239fbf 100644
> --- a/xen/common/Makefile
> +++ b/xen/common/Makefile
> @@ -1,6 +1,7 @@
>  obj-$(CONFIG_ARGO) += argo.o
>  obj-y += bitmap.o
>  obj-y += bsearch.o
> +obj-$(CONFIG_HYPFS_CONFIG) += config_data.o
>  obj-$(CONFIG_CORE_PARKING) += core_parking.o
>  obj-y += cpu.o
>  obj-$(CONFIG_DEBUG_TRACE) += debugtrace.o
> @@ -73,3 +74,14 @@ obj-$(CONFIG_UBSAN) += ubsan/
>  
>  obj-$(CONFIG_NEEDS_LIBELF) += libelf/
>  obj-$(CONFIG_HAS_DEVICE_TREE) += libfdt/
> +
> +config.gz: ../.config
> +	gzip -c $< >$@

I had to disable HYPFS in the XenServer build.  Inside RPM, this fails with

make[3]: *** No rule to make target `../.config', needed by
`config.gz'.  Stop.
make[3]: *** Waiting for unfinished jobs....

This needs to be an expression involving $(KCONFIG_CONFIG) because
.config is only the default, and it surely needs a $(XEN_ROOT) in there?

~Andrew

