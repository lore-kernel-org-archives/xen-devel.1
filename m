Return-Path: <SRS0=tzN1=C7=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F358CC4363D
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2020 14:02:34 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A911320719
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2020 14:02:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="l9Vrj2aY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A911320719
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKirs-0001mZ-Mn; Tue, 22 Sep 2020 14:02:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1J9w=C7=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kKii0-0004k4-4L
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2020 13:51:52 +0000
X-Inumbo-ID: f3f98077-60a5-41dd-a51f-635f10fdd292
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f3f98077-60a5-41dd-a51f-635f10fdd292;
 Tue, 22 Sep 2020 13:51:01 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1600782661;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oi6bcO2Z0ZXQCW4E2kvYbotzHBDOG60PEFIzDN5c64E=;
 b=l9Vrj2aYb3lMRTc5JHxBhGSLclMvoAhykeXINUA0Eykgl9uqgYlGyH4cV8/LtUOzMynXQu
 R2Cq60NWyJhAL19qcb1Jf/5atIjBDhqhOyRbzKz/JkghKyfAtbhta+sjnj/e8NXRnrRFKl
 lmVdVGU/vzVscn5fVa5vzMglHxF9AZ0=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C036DB11D;
 Tue, 22 Sep 2020 13:51:37 +0000 (UTC)
Subject: Re: races in toolstack build
To: Olaf Hering <olaf@aepfle.de>, xen-devel@lists.xenproject.org
References: <20200922141700.4627df0d.olaf@aepfle.de>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <fa2ba088-f95d-ce85-b991-793eb4d98f92@suse.com>
Date: Tue, 22 Sep 2020 15:51:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200922141700.4627df0d.olaf@aepfle.de>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 22.09.20 14:17, Olaf Hering wrote:
> With commit 68a8aa5d72 the build randomly fails. Up to commit c7e3021a71 no errors (like this) are seen. For some reason nothing below tools/ was touched in this range, so the bug may already exist for a while.
> 
> attempt on host#1:
> [   81s] ln: failed to create symbolic link '/home/abuild/rpmbuild/BUILD/xen-4.15.20200922T102230.68a8aa5d72/non-dbg/tools/libs/ctrl/../../../tools/include/xenctrl_dom.h': File exists

This is very weird, as the link is created via "ln -sf", so an existing
target should not make the command failing.

> [   81s] /home/abuild/rpmbuild/BUILD/xen-4.15.20200922T102230.68a8aa5d72/non-dbg/tools/libs/ctrl/../../../tools/libs/libs.mk:82: recipe for target '/home/abuild/rpmbuild/BUILD/xen-4.15.20200922T102230.68a8aa5d72/non-dbg/tools/libs/ctrl/../../../tools/include/xenctrl_compat.h' failed
> [   81s] make[6]: *** [/home/abuild/rpmbuild/BUILD/xen-4.15.20200922T102230.68a8aa5d72/non-dbg/tools/libs/ctrl/../../../tools/include/xenctrl_compat.h] Error 1
> 
> attempt on host#2:
> [  178s] xenstat_qmp.c:26:10: fatal error: _paths.h: No such file or directory
> [  178s] me/abuild/rpmbuild/BUILD/xen-4.15.20200922T102230.68a8aa5d72/non-dbg/tools/libs/stat/../../../tools/Rules.mk:153: xenstat_qmp.opic] Error 1

This shouldn't happen, too.

Is this really a normal upstream build, or do you have any additional
patches applied?


Juergen


