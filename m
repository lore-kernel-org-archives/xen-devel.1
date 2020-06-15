Return-Path: <SRS0=hCD3=74=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79CF2C433E0
	for <xen-devel@archiver.kernel.org>; Mon, 15 Jun 2020 15:43:53 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 529D5206D7
	for <xen-devel@archiver.kernel.org>; Mon, 15 Jun 2020 15:43:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 529D5206D7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jkrGu-0001Bc-Ex; Mon, 15 Jun 2020 15:43:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7yVv=74=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jkrGs-0001BX-OQ
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2020 15:43:38 +0000
X-Inumbo-ID: fa8e72cc-af1e-11ea-8496-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fa8e72cc-af1e-11ea-8496-bc764e2007e4;
 Mon, 15 Jun 2020 15:43:38 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: XLNuK+rMv2pAcnrjJfENZtKybViCdhtxN40UnfVf2AWfD5pFAN4dGkcMCiVvPLkyhm6k5r8l0r
 aEeMQHzrvAWkwA3Fc/aomqexM15I+X9SjqGavXBuv31EnotfS5ONGxaF5scJwimWGO/CHc5Zdt
 jmCOtPdBN/J7iCxDQim9LgcI59W4x1+F0ixbThmkxBgIPrDRT6mQqBy//lqFU8uiNqmE/T/9ac
 focS2Rwhyl3/y3ZFJoxcPk1Fnyd5HH16jnR2bUl+Cs+P33yTBWJMv6fgOBvJ5g8Ukns4ib0zT8
 438=
X-SBRS: 2.7
X-MesageID: 20420760
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,515,1583211600"; d="scan'208";a="20420760"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24295.38675.682397.522303@mariner.uk.xensource.com>
Date: Mon, 15 Jun 2020 16:43:15 +0100
To: Nick Rosbrook <rosbrookn@gmail.com>
Subject: Re: [PATCH for-4.14] golang/xenlight: sort cases in switch statement
In-Reply-To: <42ba06bc716cf91d25c8bb1d988cb1310219b8fe.1592234663.git.rosbrookn@ainfosec.com>
References: <42ba06bc716cf91d25c8bb1d988cb1310219b8fe.1592234663.git.rosbrookn@ainfosec.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
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
Cc: Wei Liu <wl@xen.org>, "paul@xen.org" <paul@xen.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>,
 Nick Rosbrook <rosbrookn@ainfosec.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Nick Rosbrook writes ("[PATCH for-4.14] golang/xenlight: sort cases in switch statement"):
> The xenlight_golang_union_from_C function iterates over a dict to
> construct a switch statement that marshals a C keyed union into a Go
> type. Because python does not guarantee dict ordering across all
> versions, this can result in the switch statement being generated in a
> different order depending on the version of python used. For example,
> running gengotypes.py with python2.7 and python3.6 will yield different
> orderings.
> 
> Iterate over sorted(cases.items()) rather than cases.items() to fix
> this.
> 
> This patch changes the ordering from what was previously checked-in, but
> running gengotypes.py with different versions of python will now yield
> the same result.
> 
> Signed-off-by: Nick Rosbrook <rosbrookn@ainfosec.com>
> ---
> Andrew reported this in [1], so I intend this as a build fix for 4.14.
> 
> [1] https://lists.xenproject.org/archives/html/xen-devel/2020-06/msg00881.html
> ---
>  tools/golang/xenlight/gengotypes.py  |  2 +-
>  tools/golang/xenlight/helpers.gen.go | 32 ++++++++++++++--------------
>  2 files changed, 17 insertions(+), 17 deletions(-)
> 
> diff --git a/tools/golang/xenlight/gengotypes.py b/tools/golang/xenlight/gengotypes.py
> index ecca59745f..557fecd07b 100644
> --- a/tools/golang/xenlight/gengotypes.py
> +++ b/tools/golang/xenlight/gengotypes.py
> @@ -379,7 +379,7 @@ def xenlight_golang_union_from_C(ty = None, union_name = '', struct_name = ''):
>  
>      # Create switch statement to determine which 'union element'
>      # to populate in the Go struct.
> -    for case_name, case_tuple in cases.items():
> +    for case_name, case_tuple in sorted(cases.items()):
>          (case_val, case_type) = case_tuple

This part

Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>

But I don't think I have the right golang tools to verify the
autogenerated code.  George, can you check that this patch is right,
and/or do the commit and rerun the generation ?

Obviously that needs to wait for a release ack.

Ian.

