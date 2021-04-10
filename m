Return-Path: <SRS0=aogY=JH=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C78C5C433ED
	for <xen-devel@archiver.kernel.org>; Sat, 10 Apr 2021 18:25:19 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 399B261056
	for <xen-devel@archiver.kernel.org>; Sat, 10 Apr 2021 18:25:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 399B261056
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ipxe.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.108272.206677 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVII9-0004hP-SM; Sat, 10 Apr 2021 18:25:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 108272.206677; Sat, 10 Apr 2021 18:25:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVII9-0004hI-OY; Sat, 10 Apr 2021 18:25:09 +0000
Received: by outflank-mailman (input) for mailman id 108272;
 Sat, 10 Apr 2021 18:25:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FbzA=JH=ipxe.org=mcb30@srs-us1.protection.inumbo.net>)
 id 1lVII8-0004hC-T2
 for xen-devel@lists.xenproject.org; Sat, 10 Apr 2021 18:25:08 +0000
Received: from blyat.fensystems.co.uk (unknown [54.246.183.96])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4b587eb5-6b1a-4cad-af57-582dc7d145b1;
 Sat, 10 Apr 2021 18:25:07 +0000 (UTC)
Received: from dolphin.home (unknown
 [IPv6:2a00:23c6:5495:5e00:72b3:d5ff:feb1:e101])
 by blyat.fensystems.co.uk (Postfix) with ESMTPSA id 3DBA24422B;
 Sat, 10 Apr 2021 18:25:04 +0000 (UTC)
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
X-Inumbo-ID: 4b587eb5-6b1a-4cad-af57-582dc7d145b1
To: Wei Liu <wei.liu@kernel.org>, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org, netdev@vger.kernel.org,
 Paul Durrant <pdurrant@amazon.com>
From: Michael Brown <mcb30@ipxe.org>
Subject: xen-netback hotplug-status regression bug
Message-ID: <afedd7cb-a291-e773-8b0d-4db9b291fa98@ipxe.org>
Date: Sat, 10 Apr 2021 19:25:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Commit https://github.com/torvalds/linux/commit/1f25657 ("xen-netback: 
remove 'hotplug-status' once it has served its purpose") seems to have 
introduced a regression that prevents a vif frontend from transitioning 
more than once into Connected state.

As far as I can tell:

- The defined vif script (e.g. /etc/xen/scripts/vif-bridge) executes 
only once, at domU startup, and sets 
backend/vif/<domU>/0/hotplug-status="connected"

- When the frontend first enters Connected state, 
drivers/net/xen-netback/xenbus.c's connect() sets up a watch on 
"hotplug-status" with the callback function hotplug_status_changed()

- When hotplug_status_changed() is triggered by the watch, it 
transitions the backend to Connected state and calls xenbus_rm() to 
delete the "hotplug-status" attribute.

If the frontend subsequently disconnects and reconnects (e.g. 
transitions through Closed->Initialising->Connected) then:

- Nothing recreates "hotplug-status"

- When the frontend re-enters Connected state, connect() sets up a watch 
on "hotplug-status" again

- The callback hotplug_status_changed() is never triggered, and so the 
backend device never transitions to Connected state.


Reverting the commit would fix this bug, but would obviously also 
reintroduce the race condition that the commit was designed to avoid.

I'm happy to put together a patch, if one of the maintainers could 
suggest a sensible design approach.

I'm not a list member, so please CC me directly on replies.

Thanks,

Michael

