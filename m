Return-Path: <SRS0=v1SG=HA=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDB48C433DB
	for <xen-devel@archiver.kernel.org>; Fri, 29 Jan 2021 08:28:44 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 749F264DFA
	for <xen-devel@archiver.kernel.org>; Fri, 29 Jan 2021 08:28:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 749F264DFA
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.77786.141101 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5P8l-0007Z4-HT; Fri, 29 Jan 2021 08:28:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 77786.141101; Fri, 29 Jan 2021 08:28:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5P8l-0007Yx-EP; Fri, 29 Jan 2021 08:28:27 +0000
Received: by outflank-mailman (input) for mailman id 77786;
 Fri, 29 Jan 2021 08:28:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mmvf=HA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l5P8k-0007Ys-DS
 for xen-devel@lists.xenproject.org; Fri, 29 Jan 2021 08:28:26 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1caf4cc9-9803-4fee-ac73-50bab6bdb2e4;
 Fri, 29 Jan 2021 08:28:24 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E8B77AF7F;
 Fri, 29 Jan 2021 08:28:23 +0000 (UTC)
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
X-Inumbo-ID: 1caf4cc9-9803-4fee-ac73-50bab6bdb2e4
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611908904; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6HqRlTYlkGIdXz89281gEb3e1lNdAsBzdnrOMiBQLeM=;
	b=ImTb6dJlr6hrwRGzlK9WkLdqzfIqs01xajEqSRkPjUTntTmQknXcsC0eT3mSYL/PFmdrGa
	wXAZWWlvkBIA7rl4cuj+zO2rHJXm/CGZhi5O/W4E+0Alu+LR1duBnRdMkS5iTLMrLov2eI
	45liwco45jEqcy0Tz4fpXBms/bSon/E=
Subject: Re: [xen-unstable-smoke test] 158759: regressions - FAIL
To: osstest service owner <osstest-admin@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <osstest-158759-mainreport@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6d314b13-a5d3-deb2-5c71-9438de80b3d8@suse.com>
Date: Fri, 29 Jan 2021 09:28:24 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <osstest-158759-mainreport@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 29.01.2021 07:51, osstest service owner wrote:
> flight 158759 xen-unstable-smoke real [real]
> http://logs.test-lab.xenproject.org/osstest/logs/158759/
> 
> Regressions :-(
> 
> Tests which did not succeed and are blocking,
> including tests which could not be run:
>  build-amd64                   6 xen-build                fail REGR. vs. 158713
>  build-arm64-xsm               6 xen-build                fail REGR. vs. 158713

I'm afraid we may have some trouble doing something about
this:

  CC      hw/audio/intel-hda.o
  CC      hw/audio/hda-codec.o
  CC      hw/audio/pcspk.o
cc: internal compiler error: Segmentation fault signal terminated program cc1
Please submit a full bug report,
with preprocessed source if appropriate.
See <file:///usr/share/doc/gcc-8/README.Bugs> for instructions.
make: *** [/home/osstest/build.158759.build-arm64-xsm/xen/tools/qemu-xen-dir/rules.mak:69: hw/audio/intel-hda.o] Error 4
make: *** Waiting for unfinished jobs....
make: Leaving directory '/home/osstest/build.158759.build-arm64-xsm/xen/tools/qemu-xen-build'
make[2]: *** [Makefile:212: subdir-all-qemu-xen-dir] Error 2
make[2]: Leaving directory '/home/osstest/build.158759.build-arm64-xsm/xen/tools'
make[1]: Leaving directory '/home/osstest/build.158759.build-arm64-xsm/xen/tools'
make[1]: *** [/home/osstest/build.158759.build-arm64-xsm/xen/tools/../tools/Rules.mk:155: subdirs-all] Error 2
make: *** [Makefile:63: build-tools] Error 2

Unless there's a compiler update readily available for the
distro we're building on.

Jan

