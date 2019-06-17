Return-Path: <SRS0=yLx4=UQ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D4CFC31E57
	for <xen-devel@archiver.kernel.org>; Mon, 17 Jun 2019 10:15:06 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F01552087F
	for <xen-devel@archiver.kernel.org>; Mon, 17 Jun 2019 10:15:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F01552087F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hcofA-0005yM-1L; Mon, 17 Jun 2019 10:14:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=wVRv=UQ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hcof8-0005yA-6g
 for xen-devel@lists.xenproject.org; Mon, 17 Jun 2019 10:14:54 +0000
X-Inumbo-ID: bdd6a9b2-90e8-11e9-b20c-07771fddee0f
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bdd6a9b2-90e8-11e9-b20c-07771fddee0f;
 Mon, 17 Jun 2019 10:14:50 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 115B5AE65;
 Mon, 17 Jun 2019 10:14:50 +0000 (UTC)
To: Ankur Arora <ankur.a.arora@oracle.com>, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org
References: <20190509172540.12398-1-ankur.a.arora@oracle.com>
 <20190509172540.12398-16-ankur.a.arora@oracle.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <8b6cb452-f565-c515-cabb-068300ce3ef5@suse.com>
Date: Mon, 17 Jun 2019 12:14:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190509172540.12398-16-ankur.a.arora@oracle.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [RFC PATCH 15/16] xen/net: gnttab, evtchn,
 xenbus API changes
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: pbonzini@redhat.com, boris.ostrovsky@oracle.com, sstabellini@kernel.org,
 joao.m.martins@oracle.com, konrad.wilk@oracle.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkuMDUuMTkgMTk6MjUsIEFua3VyIEFyb3JhIHdyb3RlOgo+IEZvciB0aGUgbW9zdCBwYXJ0
LCB3ZSBub3cgcGFzcyB4ZW5ob3N0X3QgKiBhcyBwYXJhbWV0ZXIuCj4gCj4gQ28tZGV2ZWxvcGVk
LWJ5OiBKb2FvIE1hcnRpbnMgPGpvYW8ubS5tYXJ0aW5zQG9yYWNsZS5jb20+Cj4gU2lnbmVkLW9m
Zi1ieTogQW5rdXIgQXJvcmEgPGFua3VyLmEuYXJvcmFAb3JhY2xlLmNvbT4KClNhbWUgYXMgcHJl
dmlvdXMgcGF0Y2guCgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
