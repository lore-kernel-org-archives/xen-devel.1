Return-Path: <SRS0=4OGc=HH=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBDE6C433DB
	for <xen-devel@archiver.kernel.org>; Fri,  5 Feb 2021 15:41:52 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7507B650EC
	for <xen-devel@archiver.kernel.org>; Fri,  5 Feb 2021 15:41:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7507B650EC
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.81818.151251 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l83Eq-0000a4-2a; Fri, 05 Feb 2021 15:41:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 81818.151251; Fri, 05 Feb 2021 15:41:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l83Ep-0000Zx-Vc; Fri, 05 Feb 2021 15:41:39 +0000
Received: by outflank-mailman (input) for mailman id 81818;
 Fri, 05 Feb 2021 15:41:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l83Eo-0000Zs-L6
 for xen-devel@lists.xenproject.org; Fri, 05 Feb 2021 15:41:38 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l83Eo-0000dy-HS
 for xen-devel@lists.xenproject.org; Fri, 05 Feb 2021 15:41:38 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l83Eo-0002s4-G5
 for xen-devel@lists.xenproject.org; Fri, 05 Feb 2021 15:41:38 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1l83El-00030N-4V; Fri, 05 Feb 2021 15:41:35 +0000
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
	bh=i5r1kT9l6nzTnQb8KcgXr4DsHfbpXhigJZttROLTS9Y=; b=GUzsyOf/XTSpG2XbWB1kULcCqn
	1ezV8TsU1ISBCkbVL/Dh7i6XbCn3ehR4qq5Kam2diw1UpmEIkJqNKBwzXQ7b4UM3WD/KZpTILxXYE
	HonL3obWGZ0cZ21UQXPjyQdBS5FwXqXMombUromy9LGfiF9SdPFJEaPIXp4IlhNN0ing=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <24605.26414.914939.725856@mariner.uk.xensource.com>
Date: Fri, 5 Feb 2021 15:41:34 +0000
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: <xen-devel@lists.xenproject.org>,
    Wei Liu <wl@xen.org>
Subject: [PATCH for-4.15] tools/configure: add bison as mandatory
In-Reply-To: <20210205115327.4086-1-roger.pau@citrix.com>
References: <20210205115327.4086-1-roger.pau@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Roger Pau Monne writes ("[PATCH for-4.15] tools/configure: add bison as mandatory"):
> Bison is now mandatory when the pvshim build is enabled in order to
> generate the Kconfig.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> Please re-run autogen.sh after applying.
> 
> Fallout from this patch can lead to broken configure script being
> generated or bison not detected correctly, but those will be cached
> quite quickly by the automated testing.

Release-Acked-by: Ian Jackson <iwj@xenproject.org>
Reviewed-by: Ian Jackson <iwj@xenproject.org>

I've read the rest of the thread and I prefer Roger's version of this
patch.

Thanks,
Ian.

