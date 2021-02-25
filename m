Return-Path: <SRS0=BiGO=H3=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5673DC433E0
	for <xen-devel@archiver.kernel.org>; Thu, 25 Feb 2021 17:54:33 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 027C464F36
	for <xen-devel@archiver.kernel.org>; Thu, 25 Feb 2021 17:54:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 027C464F36
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.89915.169874 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFKqF-000800-RV; Thu, 25 Feb 2021 17:54:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89915.169874; Thu, 25 Feb 2021 17:54:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFKqF-0007zt-OV; Thu, 25 Feb 2021 17:54:23 +0000
Received: by outflank-mailman (input) for mailman id 89915;
 Thu, 25 Feb 2021 17:54:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lFKqD-0007zl-Rt
 for xen-devel@lists.xenproject.org; Thu, 25 Feb 2021 17:54:21 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lFKqD-00063J-R2
 for xen-devel@lists.xenproject.org; Thu, 25 Feb 2021 17:54:21 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lFKqD-0003mD-P5
 for xen-devel@lists.xenproject.org; Thu, 25 Feb 2021 17:54:21 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lFKqA-0002Ah-Dj; Thu, 25 Feb 2021 17:54:18 +0000
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
	bh=BPTPd5kn0P1h32iZdd7ewLNHkk5RdLdb6Txgn6b8Qlw=; b=fMbPDRE19J9BoFXEjlAbq6DLVZ
	13PDKMXC/C5l2SiZBMCH80DaxhQzHuXwQgbNbxXjWce6aNt0uAzT+4wPFNQZ9A8iz+nrOJQH4m60T
	8A5d2ScnijC8AhrfhT/urjrmA/w+kjG9FekzhE1/bJc8uY8A9X0AwgbQjunepHNYPiqQ=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24631.58442.167560.663929@mariner.uk.xensource.com>
Date: Thu, 25 Feb 2021 17:54:18 +0000
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org,
    raphning@amazon.co.uk,
    Julien Grall <jgrall@amazon.com>,
    Wei Liu <wl@xen.org>,
    Juergen Gross <jgross@suse.com>
Subject: [PATCH for-4.15 0/5] xenstore: Address coverity issues in the LiveUpdate code
In-Reply-To: <20210225174131.10115-1-julien@xen.org>
References: <20210225174131.10115-1-julien@xen.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Julien Grall writes ("[PATCH for-4.15 0/5] xenstore: Address coverity issues in the LiveUpdate code"):
>   tools/xenstored: Avoid unnecessary talloc_strdup() in do_control_lu()
>   tools/xenstored: Avoid unnecessary talloc_strdup() in do_lu_start()
>   tools/xenstored: control: Store the save filename in lu_dump_state
>   tools/xenstore-control: Don't leak buf in live_update_start()

These four are actual bugfixes:

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

>   tools/xenstored: Silence coverity when using xs_state_* structures

For this I can't see a reason to give a release ack ?  See also Andy's
comments.

Ian.

