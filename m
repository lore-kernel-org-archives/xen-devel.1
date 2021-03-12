Return-Path: <SRS0=dPyG=IK=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3EADC433E0
	for <xen-devel@archiver.kernel.org>; Fri, 12 Mar 2021 10:22:25 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9590C64FF3
	for <xen-devel@archiver.kernel.org>; Fri, 12 Mar 2021 10:22:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9590C64FF3
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.96965.183950 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKevo-0007HV-HD; Fri, 12 Mar 2021 10:22:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 96965.183950; Fri, 12 Mar 2021 10:22:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKevo-0007HO-Di; Fri, 12 Mar 2021 10:22:08 +0000
Received: by outflank-mailman (input) for mailman id 96965;
 Fri, 12 Mar 2021 10:22:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lKevm-0007HJ-Vr
 for xen-devel@lists.xenproject.org; Fri, 12 Mar 2021 10:22:06 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lKevm-0005Ue-R8
 for xen-devel@lists.xenproject.org; Fri, 12 Mar 2021 10:22:06 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lKevm-0002la-Od
 for xen-devel@lists.xenproject.org; Fri, 12 Mar 2021 10:22:06 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lKevj-0003XR-DG; Fri, 12 Mar 2021 10:22:03 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:Cc:To:Date
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=3RFzZyrpYW0tRoni8ArV+qjzb1p3DgMTXwJaXhoiPj0=; b=0ZhLJ+erkclZRzJYKOnIstEkGq
	8xHfZU3LTqNVq4fxHzAy9n8HQKdxrs8DsRAUYj0viM94s8T6BplPdFbzrSyb0UXzhbOFzl2LHkFdB
	SJIRH8COp3nZ9MD+m0j1620njBoXsHKTyDLae+VPwUIR09xvPWG/Qz+E2xyk+xlXzzjg=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24651.16587.79927.894745@mariner.uk.xensource.com>
Date: Fri, 12 Mar 2021 10:22:03 +0000
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel\@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
    Ian Jackson <iwj@xenproject.org>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    Wei Liu <wl@xen.org>,
    Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2 1/2][4.15] tools/x86: don't rebuild cpuid-autogen.h every
 time
In-Reply-To: <1b8aee19-9194-153c-8dbb-0aec3412e255@suse.com>
References: <1365013b-1e90-aeb2-3c80-7a5c6284c46a@suse.com>
	<1b8aee19-9194-153c-8dbb-0aec3412e255@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("[PATCH v2 1/2][4.15] tools/x86: don't rebuild cpuid-autogen.h every time"):
> Ian did suggest to pass -0r to xargs (and -print0 to find), but I
> couldn't convince myself that these are standard compliant options. We
> don't use any special characters in file names, so -print0 / -0
> shouldn't be necessary at all. The stray rm invocation when there is no
> output from find can be taken care of by passing -f to it.

I addressed these portability questions in my original mail.

I said that I had checked FreeBSD find and xargs have all these
options.  I didn't check the other *BSDs but I see no reason to think
they would be different.

find -print0 and xargs -0 are not in SuS (for bad reasons) but these
are obviously necessary (unless one thinks people are supposed to use
  -exec printf "%s\n" '{}' \;
when the output is going to something more complicated an just some
command's arguments.

IOW we are IMO find to rely on both these options.

I would be OK with find -exec + in this case.  The {} must be quoted.

> --- a/tools/include/Makefile
> +++ b/tools/include/Makefile
> @@ -19,7 +19,7 @@ xen-foreign:
>  	$(MAKE) -C xen-foreign
>  
>  xen-dir:
> -	@rm -rf xen acpi
> +	find xen/ acpi/ -type l 2>/dev/null | xargs rm -f --

I disapprove of the 2>/dev/null and the -f because I disapprove of
suppressing.

Ian.

