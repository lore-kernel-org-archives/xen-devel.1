Return-Path: <SRS0=FMYz=GX=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14918C433E0
	for <xen-devel@archiver.kernel.org>; Wed, 20 Jan 2021 09:26:06 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9089823139
	for <xen-devel@archiver.kernel.org>; Wed, 20 Jan 2021 09:26:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9089823139
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.71290.127550 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l29kN-0007jA-0y; Wed, 20 Jan 2021 09:25:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 71290.127550; Wed, 20 Jan 2021 09:25:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l29kM-0007j3-UI; Wed, 20 Jan 2021 09:25:50 +0000
Received: by outflank-mailman (input) for mailman id 71290;
 Wed, 20 Jan 2021 09:25:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jLlG=GX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l29kL-0007iy-RG
 for xen-devel@lists.xenproject.org; Wed, 20 Jan 2021 09:25:49 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d55c5495-3e20-449d-81dc-194f5e520a62;
 Wed, 20 Jan 2021 09:25:49 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 28C27AC9B;
 Wed, 20 Jan 2021 09:25:48 +0000 (UTC)
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
X-Inumbo-ID: d55c5495-3e20-449d-81dc-194f5e520a62
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611134748; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=5R4SSaM6v1Hk+wcrXqb7RrQrwmMrqgXxwn0k81JQXko=;
	b=XbgEIraRYHwuxV6rEZr7TfcP+9ng6jSg2njeAwqOTFXZnyEWW/nNdh58LkXn6F/2R4bPIJ
	30vduRyrmmoWgEyDgI2vc8r/5GHSgOdhVpYgmxhsA1bjPL3wA8cwO6b+lpQIsA2oOiXCTE
	+QC/gEOkVQSWSrGHlZGmLioRD2OjutI=
To: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: minimum gcc version for Arm64
Message-ID: <f9872f1e-56ea-1f01-1141-0096e520e9d8@suse.com>
Date: Wed, 20 Jan 2021 10:25:47 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hello,

by way of monitoring the stable Linux kernel logs I've become
aware of Linux commit dca5244d2f5b raising the minimum version
to 5.1. For Arm we currently document 4.8 - should this be
adjusted (and perhaps split for Arm32 and Arm64)?

Jan

