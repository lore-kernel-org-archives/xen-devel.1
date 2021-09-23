Return-Path: <SRS0=63tD=ON=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3048EC433F5
	for <xen-devel@archiver.kernel.org>; Thu, 23 Sep 2021 11:10:59 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 90C7660F6F
	for <xen-devel@archiver.kernel.org>; Thu, 23 Sep 2021 11:10:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 90C7660F6F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dingwall.me.uk
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.193709.345058 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTMcr-0005Td-CE; Thu, 23 Sep 2021 11:10:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 193709.345058; Thu, 23 Sep 2021 11:10:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTMcr-0005TW-9Q; Thu, 23 Sep 2021 11:10:49 +0000
Received: by outflank-mailman (input) for mailman id 193709;
 Thu, 23 Sep 2021 11:10:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zMzq=ON=dingwall.me.uk=james@srs-us1.protection.inumbo.net>)
 id 1mTMcq-0005TQ-0S
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 11:10:48 +0000
Received: from smarthost01a.sbp.mail.zen.net.uk (unknown [212.23.1.1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c9dac02b-4d0e-48ad-b64c-fcfd1cedb045;
 Thu, 23 Sep 2021 11:10:46 +0000 (UTC)
Received: from [217.155.64.189] (helo=mail0.xen.dingwall.me.uk)
 by smarthost01a.sbp.mail.zen.net.uk with esmtpsa
 (TLS1.0:ECDHE_RSA_AES_256_CBC_SHA1:256) (Exim 4.90_1)
 (envelope-from <james@dingwall.me.uk>) id 1mTMcn-0002Jj-2O
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 11:10:45 +0000
Received: from localhost (localhost [IPv6:::1])
 by mail0.xen.dingwall.me.uk (Postfix) with ESMTP id 67DDF172026
 for <xen-devel@lists.xenproject.org>; Thu, 23 Sep 2021 12:10:44 +0100 (BST)
Received: from mail0.xen.dingwall.me.uk ([IPv6:::1])
 by localhost (mail0.xen.dingwall.me.uk [IPv6:::1]) (amavisd-new, port 10024)
 with ESMTP id I78hNExp92bf for <xen-devel@lists.xenproject.org>;
 Thu, 23 Sep 2021 12:10:44 +0100 (BST)
Received: from ghoul.dingwall.me.uk (ghoul.dingwall.me.uk
 [IPv6:2a02:8010:698e:302::c0a8:1c8])
 by dingwall.me.uk (Postfix) with ESMTP id 425B9172023
 for <xen-devel@lists.xenproject.org>; Thu, 23 Sep 2021 12:10:44 +0100 (BST)
Received: by ghoul.dingwall.me.uk (Postfix, from userid 1000)
 id 2D41C816; Thu, 23 Sep 2021 12:10:44 +0100 (BST)
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
X-Inumbo-ID: c9dac02b-4d0e-48ad-b64c-fcfd1cedb045
X-Virus-Scanned: Debian amavisd-new at dingwall.me.uk
Date: Thu, 23 Sep 2021 12:10:44 +0100
From: James Dingwall <james-xen@dingwall.me.uk>
To: xen-devel@lists.xenproject.org
Subject: domain never exits after using 'xl save'
Message-ID: <20210923111044.GA3849950@dingwall.me.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Originating-smarthost01a-IP: [217.155.64.189]
Feedback-ID: 217.155.64.189

Hi,

This is an issue that was observed on 4.11.3 but I have reproduced on 4.14.3.
After using the `xl save` command the associated `xl create` process exits
which later results in the domain not being cleaned up when the guest is
shutdown.

e.g.:

# xl list -v | grep d13cc54d-dcb8-4337-9dfe-3b04f671b16
guest01  15  2048     3     -b----    1555.9 d13cc54d-dcb8-4337-9dfe-3b04f671b16a        - system_u:system_r:migrate_domU_t

# ps -ef | grep d13cc54d-dcb8-4337-9dfe-3b04f671b16
root     18694     1  0 Sep22 ?        00:00:00 /usr/sbin/xl create -p /etc/xen/config/d13cc54d-dcb8-4337-9dfe-3b04f671b16a.cfg

# xl save -p guest01 /vmsave/guest01.mem
Saving to /vmsave/guest01.mem new xl format (info 0x3/0x0/2900)
xc: info: Saving domain 15, type x86 HVM
xc: Frames: 1044480/1044480  100%
xc: End of stream: 0/0    0%

# xl list -v | grep d13cc54d-dcb8-4337-9dfe-3b04f671b16
guest01  15  2048     3     --p---    1558.3 d13cc54d-dcb8-4337-9dfe-3b04f671b16a        - system_u:system_r:migrate_domU_t

# ps -ef | grep d13cc54d-dcb8-4337-9dfe-3b04f671b16
- no matches -

# xl unpause guest01

# xl list -v | grep d13cc54d-dcb8-4337-9dfe-3b04f671b16
guest01  15  2048     3     -b----    1559.0 d13cc54d-dcb8-4337-9dfe-3b04f671b16a        - system_u:system_r:migrate_domU_t

# xl shutdown guest01

# xl list -v | grep d13cc54d-dcb8-4337-9dfe-3b04f671b16
guest01  15  2048     3     ---s--    1575.8 d13cc54d-dcb8-4337-9dfe-3b04f671b16a        0 system_u:system_r:migrate_domU_t


What we would expect is that the `xl create` process remains running so that
when the domain is later shutdown then it gets cleaned up without having to
manually `xl destroy`.

tools/xl/xl_vmcontrol.c handle_domain_death() has (0 == DOMAIN_RESTART_NONE in xl.h)

    case LIBXL_SHUTDOWN_REASON_SUSPEND:
        LOG("Domain has suspended.");
        return 0;

The while(1) loop of create_domain() has a switch statement which handles this
return value with:

            case DOMAIN_RESTART_NONE:
                LOG("Done. Exiting now");
                libxl_event_free(ctx, event);
                ret = 0;
                goto out;


Is this the expected behaviour?  Would an approach to getting the behaviour we
want be to change the return value from handle_domain_death() to one which
doesn't trigger the exit?

Thanks,
James

