Return-Path: <SRS0=XJfI=DV=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3B76C433E7
	for <xen-devel@archiver.kernel.org>; Wed, 14 Oct 2020 10:40:51 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3898320878
	for <xen-devel@archiver.kernel.org>; Wed, 14 Oct 2020 10:40:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="VkTBwq3m"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3898320878
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.6523.17391 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSeCt-0003qB-74; Wed, 14 Oct 2020 10:40:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 6523.17391; Wed, 14 Oct 2020 10:40:31 +0000
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
	id 1kSeCt-0003q4-45; Wed, 14 Oct 2020 10:40:31 +0000
Received: by outflank-mailman (input) for mailman id 6523;
 Wed, 14 Oct 2020 10:40:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VoTD=DV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kSeCs-0003pz-5Q
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2020 10:40:30 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2ebfe3c7-d529-4fb6-9efb-da78cc0d9b95;
 Wed, 14 Oct 2020 10:40:28 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 672FDACDB;
 Wed, 14 Oct 2020 10:40:27 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=VoTD=DV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kSeCs-0003pz-5Q
	for xen-devel@lists.xenproject.org; Wed, 14 Oct 2020 10:40:30 +0000
X-Inumbo-ID: 2ebfe3c7-d529-4fb6-9efb-da78cc0d9b95
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 2ebfe3c7-d529-4fb6-9efb-da78cc0d9b95;
	Wed, 14 Oct 2020 10:40:28 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1602672027;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ZeDaxzox18EA90MQXGDuuH+u33d5yeG2bASj7X/xAu8=;
	b=VkTBwq3m+c/b66+cF/FkPgtOPibVNRpAEyJ/4/Gn9iQA2v/dTxZUANLpeYA85cVsKNd2XM
	+b4ovW9FrF3AiSghYyd/9bo32O1xS1dcdOYx42iGGqyF5v6QUx+tG42MuCtny3RdtoAz7U
	qwcupAFKBE7hlpMUqKpviEcW+L4GQVA=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 672FDACDB;
	Wed, 14 Oct 2020 10:40:27 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Trammell Hudson <hudson@trmm.net>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/2] EFI: adjustments after "Unified Xen
 hypervisor/kernel/initrd images"
Message-ID: <dd26ba44-66e4-8870-3359-efe93ab28f64@suse.com>
Date: Wed, 14 Oct 2020 12:40:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

The first change is, I believe, addressing the regression spotted by
osstest. The second change is simply a result of me going over the
involved code in, effectively, a re-review of the original changes.

1: EFI/Arm64: don't clobber DTB pointer
2: EFI: further "need_to_free" adjustments

Jan

