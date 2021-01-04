Return-Path: <SRS0=Mbyf=GH=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4415FC433E0
	for <xen-devel@archiver.kernel.org>; Mon,  4 Jan 2021 10:23:15 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E5B8722473
	for <xen-devel@archiver.kernel.org>; Mon,  4 Jan 2021 10:23:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E5B8722473
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=antioche.eu.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.61060.107150 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwN0w-0000CD-8L; Mon, 04 Jan 2021 10:23:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 61060.107150; Mon, 04 Jan 2021 10:23:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwN0w-0000C6-4h; Mon, 04 Jan 2021 10:23:02 +0000
Received: by outflank-mailman (input) for mailman id 61060;
 Mon, 04 Jan 2021 10:23:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jmHV=GH=antioche.eu.org=bouyer@srs-us1.protection.inumbo.net>)
 id 1kwN0v-0000C1-Ot
 for xen-devel@lists.xenproject.org; Mon, 04 Jan 2021 10:23:01 +0000
Received: from chassiron.antioche.eu.org (unknown [2001:41d0:fe9d:1101::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d84c5401-440a-4a6b-a3ca-5ef4408f8e2f;
 Mon, 04 Jan 2021 10:22:59 +0000 (UTC)
Received: from rochebonne.antioche.eu.org (rochebonne
 [IPv6:2001:41d0:fe9d:1100:221:70ff:fe0c:9885])
 by chassiron.antioche.eu.org (8.15.2/8.15.2) with ESMTP id 104AMo6N028846;
 Mon, 4 Jan 2021 11:22:50 +0100 (MET)
Received: by rochebonne.antioche.eu.org (Postfix, from userid 1210)
 id 4059B281D; Mon,  4 Jan 2021 11:22:50 +0100 (CET)
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
X-Inumbo-ID: d84c5401-440a-4a6b-a3ca-5ef4408f8e2f
Date: Mon, 4 Jan 2021 11:22:50 +0100
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: [PATCH 06/24] Handle the case where vifname is not present in
 xenstore.
Message-ID: <20210104102250.GB2005@antioche.eu.org>
References: <20201214163623.2127-1-bouyer@netbsd.org>
 <20201214163623.2127-7-bouyer@netbsd.org>
 <20201229114302.kqszcnb7ynk7enin@Air-de-Roger>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201229114302.kqszcnb7ynk7enin@Air-de-Roger>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.4.3 (chassiron.antioche.eu.org [IPv6:2001:41d0:fe9d:1100:a00:20ff:fe1c:276e]); Mon, 04 Jan 2021 11:22:50 +0100 (MET)

On Tue, Dec 29, 2020 at 12:43:02PM +0100, Roger Pau Monné wrote:
> Maybe it would be easier to just fix libxl to always set the vifname
> in xenstore?
> 
> FWIW, on FreeBSD I'm passing the vifname as an environment parameter
> to the script.

Actually I don't know why the vifname is not always set. It may depend on
the Xen version ...

-- 
Manuel Bouyer <bouyer@antioche.eu.org>
     NetBSD: 26 ans d'experience feront toujours la difference
--

