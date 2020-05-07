Return-Path: <SRS0=QEX0=6V=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 498FDC38A24
	for <xen-devel@archiver.kernel.org>; Thu,  7 May 2020 08:15:29 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 21B9420753
	for <xen-devel@archiver.kernel.org>; Thu,  7 May 2020 08:15:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 21B9420753
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jWbgU-0001i7-I9; Thu, 07 May 2020 08:15:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0ibL=6V=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jWbgT-0001i2-Lq
 for xen-devel@lists.xenproject.org; Thu, 07 May 2020 08:15:09 +0000
X-Inumbo-ID: dd586ee0-903a-11ea-9eec-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dd586ee0-903a-11ea-9eec-12813bfff9fa;
 Thu, 07 May 2020 08:15:08 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 366EBADFE;
 Thu,  7 May 2020 08:15:10 +0000 (UTC)
Subject: Re: [RFC PATCH] docs/designs: domB design document
To: Christopher Clark <christopher.w.clark@gmail.com>
References: <20200506032312.878-1-christopher.w.clark@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <fa40a5f7-39e4-bd30-1e1d-89311cfe2ff7@suse.com>
Date: Thu, 7 May 2020 10:15:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200506032312.878-1-christopher.w.clark@gmail.com>
Content-Type: text/plain; charset=utf-8
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Adam Schwalm <adam.schwalm@starlab.io>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Rich Persaud <persaur@gmail.com>,
 xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 06.05.2020 05:23, Christopher Clark wrote:
> +It is with this understanding as presented that the DomB project used as the
> +basis for the development of its multiple domain boot capability for Xen. Within
> +the remainder of this document is a detailed explanation of the multiple domain
> +boot, the objectives it strives to achieve, the structure behind the approach,
> +the sequence events in a boot, a contrasting with ARM’s dom0less, and closing
> +with some exemplar implementations.

May I ask that along with dom0less you also explain the (non-)relationship
to the late-Dom0 model we've been having for a number of years? Some
aspects of what the boot domain does look, to me, quite similar.

Apart from this one immediate detail I'm curious about (and that I also
don't know/recall how it gets handled with dom0less): Death of Dom0 in a
traditional setup is a signal to Xen to reboot the host. With any of the
boot time created domains not functioning anymore, the intended purpose
of the host may no longer be fulfilled. But of course there may be a
subset of "optional" domains. As a result - are there any intentions
towards identifying under what conditions it may be better to reboot the
host than wait for human interaction?

Jan

