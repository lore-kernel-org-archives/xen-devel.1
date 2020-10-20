Return-Path: <SRS0=M+rI=D3=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9600CC4363A
	for <xen-devel@archiver.kernel.org>; Tue, 20 Oct 2020 14:06:55 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 22E052224A
	for <xen-devel@archiver.kernel.org>; Tue, 20 Oct 2020 14:06:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="MCDXh5CO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 22E052224A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.9646.25333 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUsHb-0000Vi-B5; Tue, 20 Oct 2020 14:06:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 9646.25333; Tue, 20 Oct 2020 14:06:35 +0000
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
	id 1kUsHb-0000Vb-85; Tue, 20 Oct 2020 14:06:35 +0000
Received: by outflank-mailman (input) for mailman id 9646;
 Tue, 20 Oct 2020 14:06:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oMcx=D3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kUsHZ-0000VW-Ik
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2020 14:06:33 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 49b2eaf7-8659-42b2-bc93-2e6f3d6888f7;
 Tue, 20 Oct 2020 14:06:32 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9C8CFAC6A;
 Tue, 20 Oct 2020 14:06:31 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=oMcx=D3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kUsHZ-0000VW-Ik
	for xen-devel@lists.xenproject.org; Tue, 20 Oct 2020 14:06:33 +0000
X-Inumbo-ID: 49b2eaf7-8659-42b2-bc93-2e6f3d6888f7
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 49b2eaf7-8659-42b2-bc93-2e6f3d6888f7;
	Tue, 20 Oct 2020 14:06:32 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603202791;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=2bEQvlLtJUOmcPiYR/FdIE43eZRz67l8BMCvXkO+7Vg=;
	b=MCDXh5COPvTqLLo9JQoXY+GXndOWhZdUjQ5M+fNgG3BtdEZ9nZ7PS+aMHI9VIDK5XTof+o
	X9JuPebvKzmn9mYA52cUfNz0ZHMUMvsdmDuPkhKfHsHTzt9FGD6LZ7mI0WXyBMQwZV+juB
	XMsWUxCGHWrw+Yq7r29QEMnws9kG1+U=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 9C8CFAC6A;
	Tue, 20 Oct 2020 14:06:31 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 0/8] evtchn: recent XSAs follow-on
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
Message-ID: <19babf20-3649-5c63-44a9-7edfa81835aa@suse.com>
Date: Tue, 20 Oct 2020 16:06:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

These are grouped into a series largely because of their origin,
not so much because there are heavy dependencies among them.
Compared to v1, besides there being 3 new patches, some
re-ordering has been done; in particular the last patch isn't
ready yet, but I still wanted to include it to have a chance to
discuss what changes to make. See also the individual patches.

1: avoid race in get_xen_consumer()
2: replace FIFO-specific header by generic private one
3: rename and adjust guest_enabled_event()
4: let evtchn_set_priority() acquire the per-channel lock
5: drop acquiring of per-channel lock from send_guest_{global,vcpu}_virq()
6: convert vIRQ lock to an r/w one
7: convert domain event lock to an r/w one
8: don't call Xen consumer callback with per-channel lock held

Jan

