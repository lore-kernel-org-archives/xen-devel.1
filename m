Return-Path: <SRS0=y3rP=FH=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 336B3C64E8A
	for <xen-devel@archiver.kernel.org>; Thu,  3 Dec 2020 11:27:17 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA921206A1
	for <xen-devel@archiver.kernel.org>; Thu,  3 Dec 2020 11:27:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AA921206A1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.43358.77946 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkmlO-0006Jc-Us; Thu, 03 Dec 2020 11:27:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 43358.77946; Thu, 03 Dec 2020 11:27:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkmlO-0006JV-Rr; Thu, 03 Dec 2020 11:27:06 +0000
Received: by outflank-mailman (input) for mailman id 43358;
 Thu, 03 Dec 2020 11:27:06 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>) id 1kkmlO-0006JQ-6H
 for xen-devel@lists.xenproject.org; Thu, 03 Dec 2020 11:27:06 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1kkmlN-0002WS-Uz; Thu, 03 Dec 2020 11:27:05 +0000
Received: from 54-240-197-236.amazon.com ([54.240.197.236]
 helo=freeip.amazon.com) by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1kkmlN-0001iB-Ih; Thu, 03 Dec 2020 11:27:05 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Mime-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID;
	bh=689NNRGAyqYRHkIFe91jNNqjvJ66cOutkepvTDUu2MM=; b=AQGKeyfSeNozMX+mtojvVThtEP
	8Pfcu2F7YDfiEib8T7JwpgB8N6HkpBohN5P8ZGcb3CQz2DmDwUgYvoAGci93qkEGh3GS1oxLd1PVO
	QvbVgByJ7dup85hftfD20ffIAeCRGhYzBqN2mcSEJjJB8FpRgsKTpngFLYNUoO4cYb1A=;
Message-ID: <1d8ce4a8f7e3bde2df8d56e9d7f96ccf492d9f6b.camel@xen.org>
Subject: Re: [PATCH] x86/vmap: handle superpages in vmap_to_mfn()
From: Hongyan Xia <hx242@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>,  Roger Pau =?ISO-8859-1?Q?Monn=E9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Date: Thu, 03 Dec 2020 11:27:03 +0000
In-Reply-To: <4a69a1177f9496ad0e3ea77e9b1d5b802bf83b60.1606994506.git.hongyxia@amazon.com>
References: 
	<4a69a1177f9496ad0e3ea77e9b1d5b802bf83b60.1606994506.git.hongyxia@amazon.com>
Content-Type: text/plain
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Apologies. Missing v2 in the title.


