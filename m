Return-Path: <SRS0=UuSr=GI=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C65DEC433DB
	for <xen-devel@archiver.kernel.org>; Tue,  5 Jan 2021 13:23:27 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 878C0225AC
	for <xen-devel@archiver.kernel.org>; Tue,  5 Jan 2021 13:23:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 878C0225AC
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.61969.109365 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwmIq-0002YW-C6; Tue, 05 Jan 2021 13:23:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 61969.109365; Tue, 05 Jan 2021 13:23:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwmIq-0002YP-97; Tue, 05 Jan 2021 13:23:12 +0000
Received: by outflank-mailman (input) for mailman id 61969;
 Tue, 05 Jan 2021 13:23:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hFWs=GI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kwmIp-0002YK-Dm
 for xen-devel@lists.xenproject.org; Tue, 05 Jan 2021 13:23:11 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2f5237c5-eb0c-4ebd-abd0-54215e7cb86e;
 Tue, 05 Jan 2021 13:23:10 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A5F3EAD19;
 Tue,  5 Jan 2021 13:23:09 +0000 (UTC)
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
X-Inumbo-ID: 2f5237c5-eb0c-4ebd-abd0-54215e7cb86e
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1609852989; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=WN72IFCFW5naeO674JDCShZqLyu/ABYQakTZOGXb/Ik=;
	b=INnf60PizmtGI69ElxkKI7TFhxJpZjtN9tBkrDrLnfAKpzZ6MSNqss+14R/weVe2/yu+1t
	RhFDcaG2ulWKDe7mkKrcarWcT5SmngxX36bKv1tNjIZfAl8RRbOE8lV+RyDR/upSh135IF
	iJRPhx+qAsqd9Z1Ops+m5ytuY5/v9ZU=
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/5] domain referencing adjustments
Message-ID: <3f069a0e-39a9-f5c8-154e-ac41e8b2a1c8@suse.com>
Date: Tue, 5 Jan 2021 14:23:09 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

In the course of preparing v4 of "evtchn: (not so) recent XSAs follow-on"
(which is a contextual prereq to some of the patches here) I've noticed
some slight inefficiencies. I've then also looked for similar patterns
elsewhere.

1: common: don't (kind of) open-code rcu_lock_domain_by_any_id()
2: evtchn: don't pointlessly use get_domain()
3: argo: don't pointlessly use get_domain_by_id()
4: x86: don't pointlessly use get_domain_by_id()
5: x86/mem-sharing: don't pointlessly use get_domain_by_id()

Jan

