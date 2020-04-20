Return-Path: <SRS0=l84g=6E=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93709C3815B
	for <xen-devel@archiver.kernel.org>; Mon, 20 Apr 2020 09:32:03 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5903420CC7
	for <xen-devel@archiver.kernel.org>; Mon, 20 Apr 2020 09:32:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=xen.org header.i=@xen.org header.b="61h/SUFo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5903420CC7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jQSmA-0003pf-SD; Mon, 20 Apr 2020 09:31:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=JPG3=6E=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jQSm9-0003p8-71
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2020 09:31:37 +0000
X-Inumbo-ID: ba8857ee-82e9-11ea-903e-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ba8857ee-82e9-11ea-903e-12813bfff9fa;
 Mon, 20 Apr 2020 09:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NYUQwQcNaVU7FSpt2cneenw126eCi3OdfcC0R9kcoTk=; b=61h/SUFosgBa8fVSFD+stmSnWX
 AAHzyM/4Vy+RxoUHNb6Hzv41zuA6MkaNMlghEdWulK8mMtmW7tmI8pkwl2C+e1fuwO64BF+gMOC4d
 xRz0a2EExhEx4kUeR4w7zcHz01VOyucjCotX6wDlrQMxg0yq94RHfCN8xBLmNmxvlOSE=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jQSm3-0000N8-KW; Mon, 20 Apr 2020 09:31:31 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jQSm3-00088B-CN; Mon, 20 Apr 2020 09:31:31 +0000
Subject: Re: [PATCH v3] Introduce a description of the Backport and Fixes tags
To: Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20200417222430.20480-1-sstabellini@kernel.org>
From: Julien Grall <julien@xen.org>
Message-ID: <35b34e2f-e6cd-6afc-19fd-c7880ec0eace@xen.org>
Date: Mon, 20 Apr 2020 10:31:28 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200417222430.20480-1-sstabellini@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: lars.kurth@citrix.com, Wei Liu <wl@xen.org>, konrad.wilk@oracle.com,
 andrew.cooper3@citrix.com, Ian Jackson <ian.jackson@eu.citrix.com>,
 george.dunlap@citrix.com, jbeulich@suse.com,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Stefano,

On 17/04/2020 23:24, Stefano Stabellini wrote:
> Create a new document under docs/process to describe our special tags.
> Add a description of the Fixes tag and the new Backport tag. Also
> clarify that lines with tags should not be split.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> CC: Ian Jackson <ian.jackson@eu.citrix.com>
> CC: Wei Liu <wl@xen.org>
> CC: jbeulich@suse.com
> CC: george.dunlap@citrix.com
> CC: julien@xen.org
> CC: lars.kurth@citrix.com
> CC: andrew.cooper3@citrix.com
> CC: konrad.wilk@oracle.com
> ---
> Removing Acks as I added the description of "Fixes"
> ---
>   docs/process/tags.pandoc | 55 ++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 55 insertions(+)
>   create mode 100644 docs/process/tags.pandoc
> 
> diff --git a/docs/process/tags.pandoc b/docs/process/tags.pandoc
> new file mode 100644
> index 0000000000..06b06dda01
> --- /dev/null
> +++ b/docs/process/tags.pandoc
> @@ -0,0 +1,55 @@
> +Tags: No line splitting
> +-----------------------
> +Do not split a tag across multiple lines, tags are exempt from the
> +"wrap at 75 columns" rule in order to simplify parsing scripts.  For
> +example:
> +
> +        Fixes: 67d01cdb5 ("x86: infrastructure to allow converting certain indirect calls to direct ones")

The SHA-1 ID is 9 characters but...

> +
> +
> +Fixes Tag
> +---------
> +
> +If your patch fixes a bug in a specific commit, e.g. you found an issue using
> +``git bisect``, please use the 'Fixes:' tag with the first 12 characters of
> +the SHA-1 ID, and the one line summary.

... you request 12 characters here. Can you make sure the two match please?

However, I am not entirely sure why we should mandate 12 characters. 
With the title, you should always be able to find back the commit if 
there is a clash.

> +
> +The following ``git config`` settings can be used to add a pretty format for
> +outputting the above style in the ``git log`` or ``git show`` commands:
> +
> +        [core]
> +                abbrev = 12
> +        [pretty]
> +                fixes = Fixes: %h (\"%s\")
> +
> +
> +Backport Tag
> +------------
> +
> +A backport tag is an optional tag in the commit message to request a
> +given commit to be backported to the stable trees:
> +
> +    Backport: 4.9+
> +
> +It marks a commit for being a candidate for backports to all stable
> +trees from 4.9 onward.
> +
> +The backport requester is expected to specify which currently supported
> +releases need the backport; but encouraged to specify a release as far
> +back as possible which applies. If the requester doesn't know the oldest
> +affected tree, they are encouraged to append a comment like the
> +following:
> +
> +    Backport: 4.9+ # maybe older
> +
> +Maintainers request the Backport tag to be added on commit. Contributors
> +are welcome to mark their patches with the Backport tag when they deem
> +appropriate. Maintainers will request for it to be removed when that is
> +not the case.
> +
> +Please note that the Backport tag is a **request** for backport, which
> +will still need to be evaluated by the stable tree maintainers.
> +Maintainers might ask the requester to help with the backporting work if
> +it is not trivial.
> +
> +When possible, please use the Fixes tag instead.
> 

Cheers,

-- 
Julien Grall

