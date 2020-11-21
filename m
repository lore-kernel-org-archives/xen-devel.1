Return-Path: <SRS0=pPQF=E3=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39168C388F9
	for <xen-devel@archiver.kernel.org>; Sat, 21 Nov 2020 17:10:55 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA95322206
	for <xen-devel@archiver.kernel.org>; Sat, 21 Nov 2020 17:10:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EA95322206
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.33021.64100 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kgWOw-0003xF-8o; Sat, 21 Nov 2020 17:10:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 33021.64100; Sat, 21 Nov 2020 17:10:18 +0000
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
	id 1kgWOw-0003x8-5n; Sat, 21 Nov 2020 17:10:18 +0000
Received: by outflank-mailman (input) for mailman id 33021;
 Sat, 21 Nov 2020 17:10:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pLDK=E3=perches.com=joe@srs-us1.protection.inumbo.net>)
 id 1kgWOu-0003x3-LL
 for xen-devel@lists.xenproject.org; Sat, 21 Nov 2020 17:10:16 +0000
Received: from smtprelay.hostedemail.com (unknown [216.40.44.103])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a8584925-c3f6-4189-aac3-6b588fe83b48;
 Sat, 21 Nov 2020 17:10:15 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay03.hostedemail.com (Postfix) with ESMTP id C09E2837F24A;
 Sat, 21 Nov 2020 17:10:14 +0000 (UTC)
Received: from XPS-9350.home (unknown [47.151.128.180])
 (Authenticated sender: joe@perches.com)
 by omf05.hostedemail.com (Postfix) with ESMTPA;
 Sat, 21 Nov 2020 17:10:09 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=pLDK=E3=perches.com=joe@srs-us1.protection.inumbo.net>)
	id 1kgWOu-0003x3-LL
	for xen-devel@lists.xenproject.org; Sat, 21 Nov 2020 17:10:16 +0000
X-Inumbo-ID: a8584925-c3f6-4189-aac3-6b588fe83b48
Received: from smtprelay.hostedemail.com (unknown [216.40.44.103])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id a8584925-c3f6-4189-aac3-6b588fe83b48;
	Sat, 21 Nov 2020 17:10:15 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
	by smtprelay03.hostedemail.com (Postfix) with ESMTP id C09E2837F24A;
	Sat, 21 Nov 2020 17:10:14 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: crook72_110ffeb27355
X-Filterd-Recvd-Size: 4090
Received: from XPS-9350.home (unknown [47.151.128.180])
	(Authenticated sender: joe@perches.com)
	by omf05.hostedemail.com (Postfix) with ESMTPA;
	Sat, 21 Nov 2020 17:10:09 +0000 (UTC)
Message-ID: <2105f0c05e9eae8bee8e17dcc5314474b3c0bc73.camel@perches.com>
Subject: Re: [RFC] MAINTAINERS tag for cleanup robot
From: Joe Perches <joe@perches.com>
To: trix@redhat.com, clang-built-linux@googlegroups.com
Cc: linux-hyperv@vger.kernel.org, linux-kernel@vger.kernel.org, 
 xen-devel@lists.xenproject.org, tboot-devel@lists.sourceforge.net, 
 kvm@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-acpi@vger.kernel.org,  devel@acpica.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 intel-gfx@lists.freedesktop.org, netdev@vger.kernel.org, 
 linux-media@vger.kernel.org, MPT-FusionLinux.pdl@broadcom.com, 
 linux-scsi@vger.kernel.org, linux-wireless@vger.kernel.org, 
 ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-omap@vger.kernel.org, 
 linux-fbdev@vger.kernel.org, ecryptfs@vger.kernel.org, 
 linux-fsdevel@vger.kernel.org, cluster-devel@redhat.com, 
 linux-mtd@lists.infradead.org, keyrings@vger.kernel.org, 
 netfilter-devel@vger.kernel.org, coreteam@netfilter.org, 
 alsa-devel@alsa-project.org, bpf@vger.kernel.org, 
 linux-bluetooth@vger.kernel.org, linux-nfs@vger.kernel.org, 
 patches@opensource.cirrus.com
Date: Sat, 21 Nov 2020 09:10:08 -0800
In-Reply-To: <20201121165058.1644182-1-trix@redhat.com>
References: <20201121165058.1644182-1-trix@redhat.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sat, 2020-11-21 at 08:50 -0800, trix@redhat.com wrote:
> A difficult part of automating commits is composing the subsystem
> preamble in the commit log.  For the ongoing effort of a fixer producing
> one or two fixes a release the use of 'treewide:' does not seem appropriate.
> 
> It would be better if the normal prefix was used.  Unfortunately normal is
> not consistent across the tree.
> 
> So I am looking for comments for adding a new tag to the MAINTAINERS file
> 
> 	D: Commit subsystem prefix
> 
> ex/ for FPGA DFL DRIVERS
> 
> 	D: fpga: dfl:

I'm all for it.  Good luck with the effort.  It's not completely trivial.

From a decade ago:

https://lore.kernel.org/lkml/1289919077.28741.50.camel@Joe-Laptop/

(and that thread started with extra semicolon patches too)

> Continuing with cleaning up clang's -Wextra-semi-stmt

> diff --git a/Makefile b/Makefile
[]
> @@ -1567,20 +1567,21 @@ help:
>  	 echo  ''
>  	@echo  'Static analysers:'
>  	@echo  '  checkstack      - Generate a list of stack hogs'
>  	@echo  '  versioncheck    - Sanity check on version.h usage'
>  	@echo  '  includecheck    - Check for duplicate included header files'
>  	@echo  '  export_report   - List the usages of all exported symbols'
>  	@echo  '  headerdep       - Detect inclusion cycles in headers'
>  	@echo  '  coccicheck      - Check with Coccinelle'
>  	@echo  '  clang-analyzer  - Check with clang static analyzer'
>  	@echo  '  clang-tidy      - Check with clang-tidy'
> +	@echo  '  clang-tidy-fix  - Check and fix with clang-tidy'

A pity the ordering of the code below isn't the same as the above.

> -PHONY += clang-tidy clang-analyzer
> +PHONY += clang-tidy-fix clang-tidy clang-analyzer
[]
> -clang-tidy clang-analyzer: $(extmod-prefix)compile_commands.json
> +clang-tidy-fix clang-tidy clang-analyzer: $(extmod-prefix)compile_commands.json
>  	$(call cmd,clang_tools)
>  else
> -clang-tidy clang-analyzer:
> +clang-tidy-fix clang-tidy clang-analyzer:

[]

> diff --git a/scripts/clang-tools/run-clang-tools.py b/scripts/clang-tools/run-clang-tools.py
[]
> @@ -22,43 +22,57 @@ def parse_arguments():
[]
>      parser.add_argument("type",
> -                        choices=["clang-tidy", "clang-analyzer"],
> +                        choices=["clang-tidy-fix", "clang-tidy", "clang-analyzer"],

etc...


