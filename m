Return-Path: <SRS0=y6zA=H2=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72ADBC433DB
	for <xen-devel@archiver.kernel.org>; Wed, 24 Feb 2021 07:26:54 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E308E64ECB
	for <xen-devel@archiver.kernel.org>; Wed, 24 Feb 2021 07:26:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E308E64ECB
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.89187.167794 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEoZD-0006GT-C7; Wed, 24 Feb 2021 07:26:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89187.167794; Wed, 24 Feb 2021 07:26:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEoZD-0006GM-8v; Wed, 24 Feb 2021 07:26:39 +0000
Received: by outflank-mailman (input) for mailman id 89187;
 Wed, 24 Feb 2021 07:26:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=F+xl=H2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lEoZB-0006GH-V4
 for xen-devel@lists.xenproject.org; Wed, 24 Feb 2021 07:26:37 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0fa980ba-ef95-4a71-b3d3-c66f84bb3cfe;
 Wed, 24 Feb 2021 07:26:37 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 465ADAD2B;
 Wed, 24 Feb 2021 07:26:36 +0000 (UTC)
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
X-Inumbo-ID: 0fa980ba-ef95-4a71-b3d3-c66f84bb3cfe
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1614151596; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y+hTg0wQmFtQ+vVLAIpOFsCYKuz3H3w3GIYg8JoR9qA=;
	b=OE/8cbnvfLIme65otmPurDyNqeUVkItNOh7pn6/S9i5kbGJo4UEVZKkFZ+rQx21TJKs5/9
	L1xRZHuqiOnDDxX+JfkjMbIzWP7Ui6Drxg8fBaaWG38fzj/AhOvhfPqAOxLVwTRhtfrnfL
	oYjAmSqIPKuQn+9NgXmKzybBudGsIgg=
Subject: Re: [PATCH for-next] configure: probe for gcc -m32 integer sizes
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: andrew.cooper3@citrix.com, wl@xen.org, iwj@xenproject.org,
 anthony.perard@citrix.com, xen-devel@lists.xenproject.org
References: <alpine.DEB.2.21.2102231648580.3234@sstabellini-ThinkPad-T480s>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b221e588-c21c-fcd8-6c89-70b424d10620@suse.com>
Date: Wed, 24 Feb 2021 08:26:31 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2102231648580.3234@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 24.02.2021 02:08, Stefano Stabellini wrote:
> --- a/tools/configure.ac
> +++ b/tools/configure.ac
> @@ -307,6 +307,12 @@ AC_ARG_VAR([AWK], [Path to awk tool])
>  
>  # Checks for programs.
>  AC_PROG_CC
> +AC_LANG(C)
> +AC_LANG_CONFTEST([AC_LANG_SOURCE([[#include <stdint.h>
> +#define BUILD_BUG_ON(p) ((void)sizeof(char[1 - 2 * !!(p)]))
> +int main() { BUILD_BUG_ON(sizeof(uint64_t) != 8); }]])])
> +AS_IF([gcc -m32 -c conftest.c -o /dev/null 2>/dev/null], [hvmloader=y], [AC_MSG_WARN(hvmloader build disabled due to headers mismatch)])
> +AC_SUBST(hvmloader)
>  AC_PROG_MAKE_SET
>  AC_PROG_INSTALL
>  AC_PATH_PROG([FLEX], [flex])

I'm fine with the approach now, but I'm rather uncertain about
the insertion point you've selected (in the middle of the
"Checks for programs" section). It'll need to be the tools
maintainers to judge about this.

Jan

