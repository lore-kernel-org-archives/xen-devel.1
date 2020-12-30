Return-Path: <SRS0=rAmU=GC=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69112C433DB
	for <xen-devel@archiver.kernel.org>; Wed, 30 Dec 2020 18:33:35 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0ED5620770
	for <xen-devel@archiver.kernel.org>; Wed, 30 Dec 2020 18:33:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0ED5620770
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.60228.105585 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kugHS-0006y5-Ra; Wed, 30 Dec 2020 18:33:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 60228.105585; Wed, 30 Dec 2020 18:33:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kugHS-0006xy-OV; Wed, 30 Dec 2020 18:33:06 +0000
Received: by outflank-mailman (input) for mailman id 60228;
 Wed, 30 Dec 2020 18:33:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F8On=GC=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kugHS-0006xt-7x
 for xen-devel@lists.xenproject.org; Wed, 30 Dec 2020 18:33:06 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5eb58d59-54f5-4d15-aa00-c77d33ccc4b6;
 Wed, 30 Dec 2020 18:33:05 +0000 (UTC)
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
X-Inumbo-ID: 5eb58d59-54f5-4d15-aa00-c77d33ccc4b6
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1609353185;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=tvDOwpqolb6BKcp6j3iX/knSiXz2HNVjIGOali1aDK4=;
  b=XIwMbfrGzVVX4j/QMfXQRteOlmNI7+NbfFAzHt9Us+Kt6KK+BZwDmtzm
   x46pG1EcVobVEybwhcdAVHlXywVabaBs8DPA1k76sse9TLfGlA7vD0nAN
   iR/PlYusINpJ5OtUEZxobqioqoJzP0whzhPvP3S1h+i8zT4/ZDyG9Ze8B
   Q=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: QSCED7dQwKsNAqNXWvjaCgE0ZogHY/Sakr8J4F/HVg/P0Fek6w1Z0ZlQhUkcpeVoVTbp3WKeBu
 hp8JhN31VPULb02Qqw9kmqzYqjt4KnbCtJoBUx3Ii1qIbNw8w1PJvOefQLeDJ0+nlP2ocrN7X5
 u9CLJTXYooEQslqx8OR/QrwFuGjh1eOsW2nn46B0l3KeXcCOed93OrL4FR8vdeRRbd5VOX1Jt5
 N2vgrCXpsL1RTJ0tRTb9oqZC8oTGRpnbWbiN46gcPt4SqtNejv1wSotknpWeEZ+YR1oKZfYLXh
 OXc=
X-SBRS: 5.2
X-MesageID: 34165435
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,461,1599537600"; 
   d="scan'208";a="34165435"
Subject: Re: [PATCH] xen: remove the usage of the P ar option
To: Roger Pau Monne <roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>
CC: George Dunlap <george.dunlap@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
References: <20201230173446.1768-1-roger.pau@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <b90b93d0-ea83-bc00-6dc0-cbe9e7cfa1ce@citrix.com>
Date: Wed, 30 Dec 2020 18:32:58 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201230173446.1768-1-roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL03.citrite.net (10.13.108.165)

On 30/12/2020 17:34, Roger Pau Monne wrote:
> It's not part of the POSIX standard [0] and as such non GNU ar
> implementations don't usually have it.
>
> It's not relevant for the use case here anyway, as the archive file is
> recreated every time due to the rm invocation before the ar call. No
> file name matching should happen so matching using the full path name
> or a relative one should yield the same result.
>
> This fixes the build on FreeBSD.
>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>, although...

We really need some kind of BSD build in CI.  This kind of breakage
shouldn't get into master to begin with.

>
> [0] https://pubs.opengroup.org/onlinepubs/9699919799/utilities/ar.html
> ---
> I'm unsure whether the r and s options are also needed, since they
> seem to only be relevant when updating a library, and Xen build system
> always removes the old library prior to any ar call.

... I think r should be dropped, because we're not replacing any files. 
However, I expect the index file is still relevant, because without it,
you've got to perform an O(n) search through the archive to find a file.

~Andrew

