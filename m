Return-Path: <SRS0=pLaW=GJ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4F28C433DB
	for <xen-devel@archiver.kernel.org>; Wed,  6 Jan 2021 11:10:49 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5002222C9F
	for <xen-devel@archiver.kernel.org>; Wed,  6 Jan 2021 11:10:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5002222C9F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.62420.110529 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kx6i3-0001Zs-8o; Wed, 06 Jan 2021 11:10:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 62420.110529; Wed, 06 Jan 2021 11:10:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kx6i3-0001Zl-5i; Wed, 06 Jan 2021 11:10:35 +0000
Received: by outflank-mailman (input) for mailman id 62420;
 Wed, 06 Jan 2021 11:10:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=eU9S=GJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kx6i1-0001Zg-Rq
 for xen-devel@lists.xenproject.org; Wed, 06 Jan 2021 11:10:33 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5e19bae1-520a-4e07-a4e6-5e58beb9883d;
 Wed, 06 Jan 2021 11:10:32 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 964EAABC4;
 Wed,  6 Jan 2021 11:10:31 +0000 (UTC)
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
X-Inumbo-ID: 5e19bae1-520a-4e07-a4e6-5e58beb9883d
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1609931431; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3i1379Fz+m8CbNwFB0lAkVzFXoJgTqqJV7axUIm/oiM=;
	b=Hei6cpiCwXl7DnETN67XmuJleBbxRVwMc0RilkZd4qLK9XLFVD+nsVuAfPRhJnzhvklRyQ
	BuBceJhYR51dcMVFPl3bDfWM5bouLZn8zCP0Xj7aEEJt1/b/s1qmxK2Whxyf2LHC+y7uzc
	2iE4UXJqOgoh3XQdB7qJ1F/HEw+pKb8=
Subject: Re: [xen-unstable-smoke test] 158191: regressions - FAIL
To: Olaf Hering <olaf@aepfle.de>, Ian Jackson <iwj@xenproject.org>
References: <osstest-158191-mainreport@xen.org>
Cc: xen-devel@lists.xenproject.org,
 osstest service owner <osstest-admin@xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0f144f19-2f06-9df1-c7f2-055b37970cf7@suse.com>
Date: Wed, 6 Jan 2021 12:10:31 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <osstest-158191-mainreport@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 06.01.2021 07:46, osstest service owner wrote:
> flight 158191 xen-unstable-smoke real [real]
> http://logs.test-lab.xenproject.org/osstest/logs/158191/
> 
> Regressions :-(
> 
> Tests which did not succeed and are blocking,
> including tests which could not be run:
>  build-amd64                   6 xen-build                fail REGR. vs. 158134

Perhaps an unwanted effect of c7115531ea8e "tools: ipxe: update for
fixing build with GCC10"? Did the build perhaps fetch a pre-cooked
tarball before?

Jan

make[6]: Entering directory '/home/osstest/build.158191.build-amd64/xen/tools/firmware/etherboot'
set -e; if ! /usr/bin/wget -c -O _ipxe.tar.gz http://xenbits.xen.org/xen-extfiles/ipxe-git-988d2c13cdf0f0b4140685af35ced70ac5b3283c.tar.gz; then \
	git clone file:////osstest/IPXE-GIT-FORBIDDEN ipxe.git; \
	(cd ipxe.git && git archive --format=tar --prefix=ipxe/ \
	988d2c13cdf0f0b4140685af35ced70ac5b3283c | gzip -n >../_ipxe.tar.gz); \
	rm -rf ipxe.git; \
fi
--2021-01-06 05:12:39--  http://xenbits.xen.org/xen-extfiles/ipxe-git-988d2c13cdf0f0b4140685af35ced70ac5b3283c.tar.gz
Resolving cache (cache)... 172.16.148.6
Connecting to cache (cache)|172.16.148.6|:3128... connected.
Proxy request sent, awaiting response... 404 Not Found
2021-01-06 05:12:39 ERROR 404: Not Found.

Cloning into 'ipxe.git'...
fatal: '//osstest/IPXE-GIT-FORBIDDEN' does not appear to be a git repository
fatal: Could not read from remote repository.

Please make sure you have the correct access rights
and the repository exists.
make[6]: Leaving directory '/home/osstest/build.158191.build-amd64/xen/tools/firmware/etherboot'
make[6]: *** [Makefile:36: ipxe.tar.gz] Error 128



