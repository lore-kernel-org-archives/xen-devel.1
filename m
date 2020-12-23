Return-Path: <SRS0=Rlng=F3=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A9D9C433DB
	for <xen-devel@archiver.kernel.org>; Wed, 23 Dec 2020 19:46:27 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 355D6223E0
	for <xen-devel@archiver.kernel.org>; Wed, 23 Dec 2020 19:46:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 355D6223E0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.58575.103151 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ksA5B-00020k-OL; Wed, 23 Dec 2020 19:46:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 58575.103151; Wed, 23 Dec 2020 19:46:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ksA5B-00020d-L8; Wed, 23 Dec 2020 19:46:01 +0000
Received: by outflank-mailman (input) for mailman id 58575;
 Wed, 23 Dec 2020 19:46:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4sWS=F3=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1ksA5A-00020Y-BP
 for xen-devel@lists.xenproject.org; Wed, 23 Dec 2020 19:46:00 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 98a17feb-b208-4c64-a499-53cc565320b2;
 Wed, 23 Dec 2020 19:45:59 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 073ED223E0;
 Wed, 23 Dec 2020 19:45:58 +0000 (UTC)
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
X-Inumbo-ID: 98a17feb-b208-4c64-a499-53cc565320b2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1608752758;
	bh=1NBYXDgUkzTpKW+ODJ7wVYF3slivVDEp19EAREGs5h8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=poCpyLvLRzM3mTuDl3S/hLRkUYOegtx+pKzbhxo2SsFWVvtoEDDOG2ynri36YnakT
	 VJCiZuNPYmKqauglbSBb+aCrBNX+s9qxWxvKuG9RAOWA7T061WFpKI+wT3j4/T57dW
	 aY9u3X7EuWaTfWHbSCdlP8vRlQfV4/tdPK6d6lvON0WfqIoRcsqgwVrSnqvgtkME/5
	 6PIXs1GRFSSo0D0BBiu7H/lO64dk/i+k2w6m998nde1wET7NvTOZICpPDhbhKl7rRP
	 kdpsevVqIfB3vbKEUD/TwU6LJ7sgh981BBPyRQG79uZZwQT1AaIVZtH78jAxR9Zq5b
	 EpfeKe7p3AjTA==
Date: Wed, 23 Dec 2020 11:45:57 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: xen-devel@lists.xenproject.org
cc: famzheng@amazon.com, sstabellini@kernel.org, cardoe@cardoe.com, wl@xen.org, 
    Bertrand.Marquis@arm.com, julien@xen.org, andrew.cooper3@citrix.com
Subject: Re: [PATCH 0/4] xen: domain-tracked allocations, and fault
 injection
In-Reply-To: <160874604800.15699.17952392608790984041@600e7e483b3a>
Message-ID: <alpine.DEB.2.21.2012231143430.4040@sstabellini-ThinkPad-T480s>
References: <160874604800.15699.17952392608790984041@600e7e483b3a>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 23 Dec 2020, no-reply@patchew.org wrote:
> Hi,
> 
> Patchew automatically ran gitlab-ci pipeline with this patch (series) applied, but the job failed. Maybe there's a bug in the patches?
> 
> You can find the link to the pipeline near the end of the report below:
> 
> Type: series
> Message-id: 20201223163442.8840-1-andrew.cooper3@citrix.com
> Subject: [PATCH 0/4] xen: domain-tracked allocations, and fault injection
> 
> === TEST SCRIPT BEGIN ===
> #!/bin/bash
> sleep 10
> patchew gitlab-pipeline-check -p xen-project/patchew/xen
> === TEST SCRIPT END ===

[...]

> === OUTPUT BEGIN ===
> [2020-12-23 16:38:43] Looking up pipeline...
> [2020-12-23 16:38:43] Found pipeline 233889763:
> 
> https://gitlab.com/xen-project/patchew/xen/-/pipelines/233889763

This seems to be a genuine failure. Looking at the alpine-3.12-gcc-arm64
build test, the build error is appended below. This is a link to the
failed job: https://gitlab.com/xen-project/patchew/xen/-/jobs/929842628



gcc  -DBUILD_ID -fno-strict-aliasing -std=gnu99 -Wall -Wstrict-prototypes -Wdeclaration-after-statement -Wno-unused-but-set-variable -Wno-unused-local-typedefs   -O2 -fomit-frame-pointer -D__XEN_INTERFACE_VERSION__=__XEN_LATEST_INTERFACE_VERSION__ -MMD -MP -MF .xen-diag.o.d -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE   -Werror -include /builds/xen-project/patchew/xen/tools/misc/../../tools/config.h -I/builds/xen-project/patchew/xen/tools/misc/../../tools/include -I/builds/xen-project/patchew/xen/tools/misc/../../tools/include -D__XEN_TOOLS__ -I/builds/xen-project/patchew/xen/tools/misc/../../tools/include -I/builds/xen-project/patchew/xen/tools/misc/../../tools/include -I/builds/xen-project/patchew/xen/tools/misc/../../tools/include -Wno-declaration-after-statement  -c -o xen-diag.o xen-diag.c 
xen-fault-ttl.c: In function 'main':
xen-fault-ttl.c:25:14: error: 'struct xen_arch_domainconfig' has no member named 'emulation_flags'
   25 |             .emulation_flags = XEN_X86_EMU_LAPIC,
      |              ^~~~~~~~~~~~~~~
xen-fault-ttl.c:25:32: error: 'XEN_X86_EMU_LAPIC' undeclared (first use in this function)
   25 |             .emulation_flags = XEN_X86_EMU_LAPIC,
      |                                ^~~~~~~~~~~~~~~~~
xen-fault-ttl.c:25:32: note: each undeclared identifier is reported only once for each function it appears in
make[4]: *** [/builds/xen-project/patchew/xen/tools/misc/../../tools/Rules.mk:144: xen-fault-ttl.o] Error 1
make[4]: *** Waiting for unfinished jobs....
make[4]: Leaving directory '/builds/xen-project/patchew/xen/tools/misc'
make[3]: *** [/builds/xen-project/patchew/xen/tools/../tools/Rules.mk:160: subdir-install-misc] Error 2
make[3]: Leaving directory '/builds/xen-project/patchew/xen/tools'
make[2]: *** [/builds/xen-project/patchew/xen/tools/../tools/Rules.mk:155: subdirs-install] Error 2
make[2]: Leaving directory '/builds/xen-project/patchew/xen/tools'
make[1]: *** [Makefile:67: install] Error 2
make[1]: Leaving directory '/builds/xen-project/patchew/xen/tools'
make: *** [Makefile:134: install-tools] Error 2

