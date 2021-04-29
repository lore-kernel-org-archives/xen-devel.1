Return-Path: <SRS0=6BBm=J2=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6449FC433B4
	for <xen-devel@archiver.kernel.org>; Thu, 29 Apr 2021 19:59:09 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F1817613DA
	for <xen-devel@archiver.kernel.org>; Thu, 29 Apr 2021 19:59:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F1817613DA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.120187.227290 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lcCo1-0004hq-3V; Thu, 29 Apr 2021 19:58:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 120187.227290; Thu, 29 Apr 2021 19:58:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lcCo0-0004hj-Vq; Thu, 29 Apr 2021 19:58:36 +0000
Received: by outflank-mailman (input) for mailman id 120187;
 Thu, 29 Apr 2021 19:58:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DefK=J2=xen.org=tim@srs-us1.protection.inumbo.net>)
 id 1lcCnz-0004hb-Je
 for xen-devel@lists.xenproject.org; Thu, 29 Apr 2021 19:58:35 +0000
Received: from deinos.phlegethon.org (unknown [2001:41d0:8:b1d7::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 184d094b-3b00-411c-8b04-17e8809499e8;
 Thu, 29 Apr 2021 19:58:34 +0000 (UTC)
Received: from tjd by deinos.phlegethon.org with local (Exim 4.92.3 (FreeBSD))
 (envelope-from <tim@xen.org>)
 id 1lcCnv-0002je-Vr; Thu, 29 Apr 2021 19:58:31 +0000
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
X-Inumbo-ID: 184d094b-3b00-411c-8b04-17e8809499e8
Date: Thu, 29 Apr 2021 20:58:31 +0100
From: Tim Deegan <tim@xen.org>
To: Costin Lupu <costin.lupu@cs.pub.ro>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH 1/5] tools/debugger: Fix PAGE_SIZE redefinition error
Message-ID: <YIsP5z1ejJbUhmPc@deinos.phlegethon.org>
References: <cover.1619524463.git.costin.lupu@cs.pub.ro>
 <0cd234096c9bfa8d29eac9906553af79d378733e.1619524463.git.costin.lupu@cs.pub.ro>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <0cd234096c9bfa8d29eac9906553af79d378733e.1619524463.git.costin.lupu@cs.pub.ro>
X-SA-Known-Good: Yes
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: tim@xen.org
X-SA-Exim-Scanned: No (on deinos.phlegethon.org); SAEximRunCond expanded to false

Hi,

At 15:05 +0300 on 27 Apr (1619535916), Costin Lupu wrote:
> If PAGE_SIZE is already defined in the system (e.g. in
> /usr/include/limits.h header) then gcc will trigger a redefinition error
> because of -Werror. This commit also protects PAGE_SHIFT definitions for
> keeping consistency.

Thanks for looking into this!  I think properly speaking we should fix
this by defining KDD_PAGE_SHIFT and KDD_PAGE_SIZE in kdd.h and using
those everywhere we currently use PAGE_SIZE/PAGE_SHIFT. in kdd.c and
kdd-xen.c.  If for some reason we ever ended up with a system-defined
PAGE_SIZE that wasn't 4096u then we would not want to use it here
because it would break our guest operations.

Cheers,

Tim

