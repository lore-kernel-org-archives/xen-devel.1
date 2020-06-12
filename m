Return-Path: <SRS0=NwDn=7Z=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CC42C433DF
	for <xen-devel@archiver.kernel.org>; Fri, 12 Jun 2020 15:13:58 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 73DBA2081A
	for <xen-devel@archiver.kernel.org>; Fri, 12 Jun 2020 15:13:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 73DBA2081A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jjlNA-0002MD-OT; Fri, 12 Jun 2020 15:13:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dChH=7Z=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jjlN9-0002M8-Qi
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2020 15:13:35 +0000
X-Inumbo-ID: 487f571a-acbf-11ea-b5de-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 487f571a-acbf-11ea-b5de-12813bfff9fa;
 Fri, 12 Jun 2020 15:13:34 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: hg0iaBBxuQ4i8AxbsjU5IFy1cI7sh2Kv4FRJgEUOcw+gJ2VtQQNAHVcgIFiSg/aXsSmaAc+j+F
 1eeGOxW7Kax9panAOEqii458R1+vajk49OXdzG3IbGm7o7xWF9QU3cTGbggc+2gBKZcU9hnbB7
 518l4/ZYnyrUpwSSuMIeX/seegu9myAKGlKlqHlzyVbbzm0mCPVl5Oya99tU9WLU70XNmWkUvq
 cTXo7kybf7Tppw71Qv2GVgzJH2snohYc6LqssEJvGzzHO54NMDgSsCEtXXdMBxy6+IsqsvLd+G
 lZk=
X-SBRS: 2.7
X-MesageID: 19930688
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,503,1583211600"; d="scan'208";a="19930688"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24291.39821.243999.847153@mariner.uk.xensource.com>
Date: Fri, 12 Jun 2020 16:13:17 +0100
To: "paul@xen.org" <paul@xen.org>
Subject: RE: libxl dirty in tree after libxl build
In-Reply-To: <000401d640c9$7b14e760$713eb620$@xen.org>
References: <439f3d92-2e18-1868-2b4b-2747973fbe3b@citrix.com>
 <24291.36156.961284.809662@mariner.uk.xensource.com>
 <000401d640c9$7b14e760$713eb620$@xen.org>
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
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>, 'Wei Liu' <wl@xen.org>,
 'xen-devel' <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Paul Durrant writes ("RE: libxl dirty in tree after libxl build"):
> Can't we check in a file with a different name 'e.g.' with something
> like '.tmpl' on the end, which we copy into place in case the
> flex/bison don't generate such a file? That way the checked in file
> never gets dirtied.

That would be possible in principle.  It would be necessary to do
something fiddly in the Makefile runes to make sure that the build
failed if you updated the input files but didn't have flex/bison.

Another alterntaive, of course, would be to say that we don't support
such ancient versions of flex/bison, or systems without those tools at
all, and simply delete the generated files.  I forget the details but
the relevant changes were released upstream at least a decade ago.

But I think that at this stage of the release it would be best to
update the files as has been our practice hitherto.  I am not keen on
the idea of inventing new weird Makefile wrinkles during the freeze,
unless we have no reasonable alternative.

Patches will follow in a moment.

Ian.

