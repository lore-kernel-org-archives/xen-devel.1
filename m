Return-Path: <SRS0=UuSr=GI=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8384C433DB
	for <xen-devel@archiver.kernel.org>; Tue,  5 Jan 2021 13:07:29 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 78A5722AAC
	for <xen-devel@archiver.kernel.org>; Tue,  5 Jan 2021 13:07:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 78A5722AAC
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.61914.109206 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwm3P-0007hz-A4; Tue, 05 Jan 2021 13:07:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 61914.109206; Tue, 05 Jan 2021 13:07:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwm3P-0007hq-2V; Tue, 05 Jan 2021 13:07:15 +0000
Received: by outflank-mailman (input) for mailman id 61914;
 Tue, 05 Jan 2021 13:07:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hFWs=GI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kwm3O-0007hl-7G
 for xen-devel@lists.xenproject.org; Tue, 05 Jan 2021 13:07:14 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bbf8ef00-4663-445b-9290-92adeb918934;
 Tue, 05 Jan 2021 13:07:13 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 80639AD19;
 Tue,  5 Jan 2021 13:07:12 +0000 (UTC)
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
X-Inumbo-ID: bbf8ef00-4663-445b-9290-92adeb918934
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1609852032; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=xIV6PAyiiqI7qoLqPvz1Fmz8ZW8SvEHYY9+mtjguX7o=;
	b=JEiA/EsitSFp6S8hpQbQdvf+cSRV8H2OqyyRIrw5s9UMivjnjTcEF4bVv2XHVPBO8uc0Wn
	GFO/hdvv9UBiaAup2Mx8Qt2NAq+QMqBvprHFUiKmOBMUMMWV/LPSZfdAXn3lk7bLOgUuhf
	c/czuybBhNxKMF/M/KiYYpvRKlITGn8=
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v4 00/10] evtchn: (not so) recent XSAs follow-on
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <cf0a1c24-0146-1017-7310-9536f2ed0ad1@suse.com>
Date: Tue, 5 Jan 2021 14:07:12 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

These are grouped into a series largely because of their origin,
not so much because there are heavy dependencies among them.
Compared to v3, there are several a new patches (in particular
the simultaneous locking of two domains' event locks gets done
away with) and movement of a controversial one to the end. See
also the individual patches.

1: use per-channel lock where possible
2: bind-interdomain doesn't need to hold both domains' event locks
3: convert domain event lock to an r/w one
4: don't call Xen consumer callback with per-channel lock held
5: closing of vIRQ-s doesn't require looping over all vCPU-s
6: slightly defer lock acquire where possible
7: add helper for port_is_valid() + evtchn_from_port()
8: closing of ports doesn't need to hold both domains' event locks
9: type adjustments
10: drop acquiring of per-channel lock from send_guest_{global,vcpu}_virq()

Jan

