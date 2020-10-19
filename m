Return-Path: <SRS0=rP1u=D2=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55E83C433E7
	for <xen-devel@archiver.kernel.org>; Mon, 19 Oct 2020 07:19:47 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D6FDE2224D
	for <xen-devel@archiver.kernel.org>; Mon, 19 Oct 2020 07:19:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="cehT+UtF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D6FDE2224D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.8597.23023 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUPS1-0004j0-Pk; Mon, 19 Oct 2020 07:19:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 8597.23023; Mon, 19 Oct 2020 07:19:25 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUPS1-0004it-Ml; Mon, 19 Oct 2020 07:19:25 +0000
Received: by outflank-mailman (input) for mailman id 8597;
 Mon, 19 Oct 2020 07:19:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nhcc=D2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kUPRz-0004io-Ux
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2020 07:19:23 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a37262c2-e655-43ea-87f0-1f6583655d4e;
 Mon, 19 Oct 2020 07:19:23 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5AB3CABD5;
 Mon, 19 Oct 2020 07:19:22 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=nhcc=D2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kUPRz-0004io-Ux
	for xen-devel@lists.xenproject.org; Mon, 19 Oct 2020 07:19:23 +0000
X-Inumbo-ID: a37262c2-e655-43ea-87f0-1f6583655d4e
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id a37262c2-e655-43ea-87f0-1f6583655d4e;
	Mon, 19 Oct 2020 07:19:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603091962;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=iEd1reE4mBWWJcVdcup4nuKoiAsz84JQ8s20z7nRMv0=;
	b=cehT+UtFMhRWilwnG/fdvzrI0I7SDSkQGE7kqa2ZIRhwnV3ZEilMPpvvDpxQfZ4VD1XfcE
	bS2tbfH5W85C7AMXGVK75rS2emA73mjIYOF6YldKrCziBGceFkAqL5VeOSByvuudHN9bz0
	MB5L84ETkenao/nPkSmS+jpEfcCNllg=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 5AB3CABD5;
	Mon, 19 Oct 2020 07:19:22 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/2] tools/libs: fix build rules to correctly deal with
 multiple public headers
Message-ID: <2c9a0407-1bd1-6898-d1e3-9be4c869684b@suse.com>
Date: Mon, 19 Oct 2020 09:19:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

1: fix header symlinking rule
2: fix uninstall rule for header files

Jan

