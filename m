Return-Path: <SRS0=/WvL=K4=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A9A1C47083
	for <xen-devel@archiver.kernel.org>; Wed,  2 Jun 2021 11:57:36 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 04498613B1
	for <xen-devel@archiver.kernel.org>; Wed,  2 Jun 2021 11:57:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 04498613B1
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.135991.252363 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1loPUn-0001ht-Ty; Wed, 02 Jun 2021 11:57:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 135991.252363; Wed, 02 Jun 2021 11:57:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1loPUn-0001hm-Qv; Wed, 02 Jun 2021 11:57:13 +0000
Received: by outflank-mailman (input) for mailman id 135991;
 Wed, 02 Jun 2021 11:57:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1loPUm-0001hg-Jy
 for xen-devel@lists.xenproject.org; Wed, 02 Jun 2021 11:57:12 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1loPUm-00062x-EK
 for xen-devel@lists.xenproject.org; Wed, 02 Jun 2021 11:57:12 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1loPUm-0004pH-DQ
 for xen-devel@lists.xenproject.org; Wed, 02 Jun 2021 11:57:12 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1loPUh-00030K-Ll; Wed, 02 Jun 2021 12:57:07 +0100
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
	bh=fkSfa9D8tccyNlc1tEhK8IFgEtqWMbktXu92k+Mn81w=; b=CX/TCcFbqxZetncnzEko10eUtk
	GURr+3jajdAFA59YmN7RJmzqx+4V4qMvZLGboZwea6LCo+oc2ArhOy8Pao9qFaPu15uRi41u0Hww3
	HnxYw8EfFtRI7qMmZZ+j1ROyqXct0DuIlJDKx8QbPKXSwiuQNvqtZAWt6FYyu/zaxSEo=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24759.29203.405999.764567@mariner.uk.xensource.com>
Date: Wed, 2 Jun 2021 12:57:07 +0100
To: Dario Faggioli <dfaggioli@suse.com>
Cc: Jan Beulich <jbeulich@suse.com>,
    "xen-devel\@lists.xenproject.org"  <xen-devel@lists.xenproject.org>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    Wei Liu <wl@xen.org>,
    Roger Pau =?iso-8859-1?Q?Monn=E9?=  <roger.pau@citrix.com>,
    George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH v2] firmware/shim: UNSUPPORTED=n
Newsgroups: chiark.mail.xen.devel
In-Reply-To: <b1f53cd19ed65eec756d20fdec45c2c5cf79d0d8.camel@suse.com>
References: <19695ffc-34d8-b682-b092-668f872d4e57@suse.com>
	<72b98382-34ba-6e9d-c90e-c913dfe66258@suse.com>
	<b1f53cd19ed65eec756d20fdec45c2c5cf79d0d8.camel@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Dario Faggioli writes ("Re: [PATCH v2] firmware/shim: UNSUPPORTED=n"):
> I can try to put something together, but I don't currently have an
> OSSTest development environment up and running any longer, so it may
> take a couple of iterations...

(bit late with this but)

You could use your account on the Xen Project colo.  Let me know if
you need pointers or anything resetting.

Regards,
Ian.

