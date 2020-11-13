Return-Path: <SRS0=wK0z=ET=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 604BCC388F7
	for <xen-devel@archiver.kernel.org>; Fri, 13 Nov 2020 10:29:53 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC75B22245
	for <xen-devel@archiver.kernel.org>; Fri, 13 Nov 2020 10:29:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="Ts55RB2d"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DC75B22245
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.26274.54521 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kdWKp-0001pt-66; Fri, 13 Nov 2020 10:29:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 26274.54521; Fri, 13 Nov 2020 10:29:39 +0000
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
	id 1kdWKp-0001pm-30; Fri, 13 Nov 2020 10:29:39 +0000
Received: by outflank-mailman (input) for mailman id 26274;
 Fri, 13 Nov 2020 10:29:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5p9l=ET=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kdWKn-0001pg-TJ
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2020 10:29:37 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 17c7362b-c7ff-4fcb-b94e-bafa79243a65;
 Fri, 13 Nov 2020 10:29:36 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D0C1DAE42;
 Fri, 13 Nov 2020 10:29:35 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=5p9l=ET=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kdWKn-0001pg-TJ
	for xen-devel@lists.xenproject.org; Fri, 13 Nov 2020 10:29:37 +0000
X-Inumbo-ID: 17c7362b-c7ff-4fcb-b94e-bafa79243a65
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 17c7362b-c7ff-4fcb-b94e-bafa79243a65;
	Fri, 13 Nov 2020 10:29:36 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605263375; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KGNFsPoPCy3Nl4ebayQGaJ4Fn4Bk+PbHJCKoeTE7JY4=;
	b=Ts55RB2dhEw8HLzKNgbWs4Mh6RsUaVy2DdjIVGrf0pLf8Oy2B4pmBZPnnb6X3H4lEHsQxi
	QJJLXjMICru/bdc1D3gVtNmlVX9/fEkiD8RXT9zgBfhuIygPNTnJ8GYBl90cGazhDET6ls
	3HRWECnoSbRgbuTBqx2bcKtyYzweWFg=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id D0C1DAE42;
	Fri, 13 Nov 2020 10:29:35 +0000 (UTC)
Subject: Re: [PATCH 08/10] vpci/arm: Allow updating BAR's header for non-ECAM
 bridges
To: Oleksandr Andrushchenko <andr2000@gmail.com>
Cc: iwj@xenproject.org, wl@xen.org,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 xen-devel@lists.xenproject.org, julien.grall@arm.com,
 Bertrand.Marquis@arm.com, sstabellini@kernel.org, roger.pau@citrix.com,
 Rahul.Singh@arm.com
References: <20201109125031.26409-1-andr2000@gmail.com>
 <20201109125031.26409-9-andr2000@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ae66dddb-98e3-61fd-86c3-eab30ec33d18@suse.com>
Date: Fri, 13 Nov 2020 11:29:35 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <20201109125031.26409-9-andr2000@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 09.11.2020 13:50, Oleksandr Andrushchenko wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> Non-ECAM host bridges in hwdom go directly to PCI config space,
> not through vpci (they use their specific method for accessing PCI
> configuration, e.g. dedicated registers etc.).

And access to these dedicated registers can't be intercepted? It
would seem to me that if so, such a platform is not capable of
being virtualized (without cooperation by all the domains in
possession of devices).

Jan

