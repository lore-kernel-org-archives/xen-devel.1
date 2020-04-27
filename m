Return-Path: <SRS0=2tZV=6L=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FBD4C54FD0
	for <xen-devel@archiver.kernel.org>; Mon, 27 Apr 2020 07:42:52 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F39262087E
	for <xen-devel@archiver.kernel.org>; Mon, 27 Apr 2020 07:42:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F39262087E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jSyPK-0002Yn-5M; Mon, 27 Apr 2020 07:42:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5iRA=6L=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jSyPI-0002Yi-Tl
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2020 07:42:24 +0000
X-Inumbo-ID: a20c6d92-885a-11ea-b07b-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a20c6d92-885a-11ea-b07b-bc764e2007e4;
 Mon, 27 Apr 2020 07:42:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 5B50CADD5;
 Mon, 27 Apr 2020 07:42:22 +0000 (UTC)
Subject: Re: [PATCH] docs/designs: re-work the xenstore migration document...
To: Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
References: <20200424133736.737-1-paul@xen.org>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <0736f34f-77a1-6e75-138f-06806c970d9b@suse.com>
Date: Mon, 27 Apr 2020 09:42:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200424133736.737-1-paul@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: Paul Durrant <pdurrant@amazon.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 24.04.20 15:37, Paul Durrant wrote:
> From: Paul Durrant <pdurrant@amazon.com>
> 
> ... to specify a separate migration stream that will also be suitable for
> live update.
> 
> The original scope of the document was to support non-cooperative migration
> of guests [1] but, since then, live update of xenstored has been brought into
> scope. Thus it makes more sense to define a separate image format for
> serializing xenstore state that is suitable for both purposes.
> 
> The document has been limited to specifying a new image format. The mechanism
> for acquiring the image for live update or migration is not covered as that
> is more appropriately dealt with by a patch to docs/misc/xenstore.txt. It is
> also expected that, when the first implementation of live update or migration
> making use of this specification is committed, that the document is moved from
> docs/designs into docs/specs.

Can we please add a general remark:

Records depending other records (e.g. watch records referencing a
connection record via a connection-id, or node records for a node
being a child of another node in the stream) must always be located
after the record they depend on.


Juergen

