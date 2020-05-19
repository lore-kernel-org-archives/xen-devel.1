Return-Path: <SRS0=kHyn=7B=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0841C433DF
	for <xen-devel@archiver.kernel.org>; Tue, 19 May 2020 15:31:04 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E2A020809
	for <xen-devel@archiver.kernel.org>; Tue, 19 May 2020 15:31:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9E2A020809
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jb4Ci-0001Be-9y; Tue, 19 May 2020 15:30:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0pGb=7B=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jb4Ch-0001BZ-Jj
 for xen-devel@lists.xenproject.org; Tue, 19 May 2020 15:30:51 +0000
X-Inumbo-ID: b83ee8c8-99e5-11ea-9887-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b83ee8c8-99e5-11ea-9887-bc764e2007e4;
 Tue, 19 May 2020 15:30:51 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: qUqGNsjT6JdZExnSe0VG+HDbHyyq6KcCmGsB3luSxDaYmgQ10Ed2vs6UBY5Be+ZU/53rMPY7d3
 kEo0wyBSSrS8bn5oVC1UzD/r8Gkl3rojPuJ3EepKaWJpH9misww9O4KZXWvkczw/kPLgI1lmha
 dwcVeZvFMRPfYa6PVi0Wp52DrZgkcOYTxwLN4DbSZiDoE3DoRNMkSgmr+u1wwMSb5Zn64Lkzb4
 MtabyWeEtY/w2cvKq92Lfkf3IiiW0aKrqBF0r9o00A9i3JzwI8NWEDi9+clyxxFSmelV5J+M4s
 oMg=
X-SBRS: 2.7
X-MesageID: 18159075
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,410,1583211600"; d="scan'208";a="18159075"
Subject: Re: [PATCH] x86/mem-paging: further adjustments to
 p2m_mem_paging_prep()'s error handling
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <4543e93b-f861-ea0b-9de0-cba1aa938eb7@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <87071b03-a479-c7fc-ea03-b9ad32a6f4ba@citrix.com>
Date: Tue, 19 May 2020 16:30:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <4543e93b-f861-ea0b-9de0-cba1aa938eb7@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Cc: Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 19/05/2020 16:28, Jan Beulich wrote:
> Address late comments on ecb913be4aaa ("x86/mem-paging: correct
> p2m_mem_paging_prep()'s error handling"):
> - insert a gprintk() ahead of domain_crash(),
> - add a comment.
>
> Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

