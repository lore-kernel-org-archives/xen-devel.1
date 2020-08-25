Return-Path: <SRS0=XBNZ=CD=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D254DC433DF
	for <xen-devel@archiver.kernel.org>; Tue, 25 Aug 2020 05:47:40 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A61ED2071E
	for <xen-devel@archiver.kernel.org>; Tue, 25 Aug 2020 05:47:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A61ED2071E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kARnj-0002FS-7r; Tue, 25 Aug 2020 05:47:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tInE=CD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kARnh-0002FN-RW
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2020 05:47:17 +0000
X-Inumbo-ID: cad4e600-46d5-46ec-bc2f-6283acd3208c
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cad4e600-46d5-46ec-bc2f-6283acd3208c;
 Tue, 25 Aug 2020 05:47:17 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 64D8EACCF;
 Tue, 25 Aug 2020 05:47:46 +0000 (UTC)
Subject: Re: [PATCH 3/5] x86/vmsi: use the newly introduced EOI callbacks
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>
References: <20200812124709.4165-1-roger.pau@citrix.com>
 <20200812124709.4165-4-roger.pau@citrix.com>
 <0d3afbb2-a2a8-f570-6f59-fd3c3d56e6dd@suse.com>
 <20200824144440.GD1587@Air-de-Roger>
 <f1913d9a-a0a3-3eef-5427-f10573d5385a@suse.com>
 <20200824163952.GE1587@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <afb485ce-ab90-2e1a-1b2c-ff18ee302e7a@suse.com>
Date: Tue, 25 Aug 2020 07:47:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200824163952.GE1587@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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

On 24.08.2020 18:39, Roger Pau Monné wrote:
> Would you be fine with clearing the callback in vlapic_handle_EOI and

Yes - as said, I'd prefer such a model.

> then vlapic_set_irq_callback complaining if it finds there's a
> previous callback different than the one provided already set for the
> to be injected vector?

For debugging purposes this may indeed be helpful, albeit I'll admit
that initially I didn't consider this as necessary.

Jan

