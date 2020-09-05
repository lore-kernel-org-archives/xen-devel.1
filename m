Return-Path: <SRS0=/E4b=CO=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C843C43461
	for <xen-devel@archiver.kernel.org>; Sat,  5 Sep 2020 18:12:51 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8779A206A5
	for <xen-devel@archiver.kernel.org>; Sat,  5 Sep 2020 18:12:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8779A206A5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ens-lyon.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kEcfr-0003Gx-Gc; Sat, 05 Sep 2020 18:12:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FDU+=CO=ens-lyon.org=samuel.thibault@srs-us1.protection.inumbo.net>)
 id 1kEcfq-0003Gq-RD
 for xen-devel@lists.xenproject.org; Sat, 05 Sep 2020 18:12:26 +0000
X-Inumbo-ID: 4ed36e98-0d51-401c-92b5-6e71fe7995f5
Received: from hera.aquilenet.fr (unknown [185.233.100.1])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4ed36e98-0d51-401c-92b5-6e71fe7995f5;
 Sat, 05 Sep 2020 18:12:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id BD4B91F1D;
 Sat,  5 Sep 2020 20:12:23 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qRFqlhgIX74O; Sat,  5 Sep 2020 20:12:23 +0200 (CEST)
Received: from function.home (unknown
 [IPv6:2a01:cb19:956:1b00:9eb6:d0ff:fe88:c3c7])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id 1C9111D1E;
 Sat,  5 Sep 2020 20:12:23 +0200 (CEST)
Received: from samy by function.home with local (Exim 4.94)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1kEcfm-003DdB-6h; Sat, 05 Sep 2020 20:12:22 +0200
Date: Sat, 5 Sep 2020 20:12:22 +0200
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Jason Long <hack3rcon@yahoo.com>
Cc: Ian Jackson <iwj@xenproject.org>, xen-devel@lists.xenproject.org,
 Jan Beulich <jbeulich@suse.com>,
 Costin Lupu <costin.lupu@cs.pub.ro>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] minios: Revert recent change and revert to working minios
Message-ID: <20200905181222.6g3vrkwadua2pmo2@function>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Jason Long <hack3rcon@yahoo.com>, Ian Jackson <iwj@xenproject.org>,
 xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
 Costin Lupu <costin.lupu@cs.pub.ro>, Wei Liu <wl@xen.org>
References: <233c6207-4724-55b0-3c92-84251edfc5b2@suse.com>
 <20200904160034.11456-1-iwj@xenproject.org>
 <806680552.2537432.1599256902267@mail.yahoo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <806680552.2537432.1599256902267@mail.yahoo.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hello,

Jason Long, le ven. 04 sept. 2020 22:01:42 +0000, a ecrit:
> Can anyone tell me about the goal and features of Mini-OS?

https://wiki.xen.org/wiki/Mini-OS

Samuel

