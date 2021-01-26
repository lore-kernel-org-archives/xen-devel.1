Return-Path: <SRS0=12TN=G5=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96C47C433E0
	for <xen-devel@archiver.kernel.org>; Tue, 26 Jan 2021 22:42:44 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 171DA204EF
	for <xen-devel@archiver.kernel.org>; Tue, 26 Jan 2021 22:42:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 171DA204EF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=antioche.eu.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.75588.136085 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4X2e-0001B9-9F; Tue, 26 Jan 2021 22:42:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 75588.136085; Tue, 26 Jan 2021 22:42:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4X2e-0001B2-5d; Tue, 26 Jan 2021 22:42:32 +0000
Received: by outflank-mailman (input) for mailman id 75588;
 Tue, 26 Jan 2021 22:42:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BegI=G5=antioche.eu.org=bouyer@srs-us1.protection.inumbo.net>)
 id 1l4X2d-0001Ax-87
 for xen-devel@lists.xenproject.org; Tue, 26 Jan 2021 22:42:31 +0000
Received: from chassiron.antioche.eu.org (unknown [2001:41d0:fe9d:1101::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bd77715a-c854-4f69-a958-23835bb74601;
 Tue, 26 Jan 2021 22:42:29 +0000 (UTC)
Received: from rochebonne.antioche.eu.org (rochebonne
 [IPv6:2001:41d0:fe9d:1100:221:70ff:fe0c:9885])
 by chassiron.antioche.eu.org (8.15.2/8.15.2) with ESMTP id 10QMgO6h008137;
 Tue, 26 Jan 2021 23:42:24 +0100 (MET)
Received: by rochebonne.antioche.eu.org (Postfix, from userid 1210)
 id 03EFB281D; Tue, 26 Jan 2021 23:42:24 +0100 (CET)
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
X-Inumbo-ID: bd77715a-c854-4f69-a958-23835bb74601
Date: Tue, 26 Jan 2021 23:42:23 +0100
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>,
        Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH] libs/light: pass some infos to qemu
Message-ID: <20210126224223.GA3740@antioche.eu.org>
References: <20210112181242.1570-1-bouyer@antioche.eu.org>
 <20210112181242.1570-17-bouyer@antioche.eu.org>
 <20210116101606.sogfpgzg7upunua7@Air-de-Roger>
 <20210116112502.GA1133@antioche.eu.org>
 <20210118083642.deozyeo5o6yziba7@Air-de-Roger>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210118083642.deozyeo5o6yziba7@Air-de-Roger>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.4.3 (chassiron.antioche.eu.org [IPv6:2001:41d0:fe9d:1100:a00:20ff:fe1c:276e]); Tue, 26 Jan 2021 23:42:24 +0100 (MET)

On Mon, Jan 18, 2021 at 09:36:42AM +0100, Roger Pau Monné wrote:
> [...]
> 
> Note also that there are networking modes that don't use a bridge, so
> you could likely end up with nics[i].bridge == NULL?

I couldn't cause this to happen. If no bridge is specified in the
domU's config file, qemu-ifup is called with xenbr0 as bridge name.

I tried this:
vif = [ 'mac=00:16:3e:00:10:54, gatewaydev=wm0 type=ioemu, model=e1000' ]

-- 
Manuel Bouyer <bouyer@antioche.eu.org>
     NetBSD: 26 ans d'experience feront toujours la difference
--

