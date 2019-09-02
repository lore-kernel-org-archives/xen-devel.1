Return-Path: <SRS0=4VTz=W5=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40C75C3A59B
	for <xen-devel@archiver.kernel.org>; Mon,  2 Sep 2019 07:20:38 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 17A4222CF7
	for <xen-devel@archiver.kernel.org>; Mon,  2 Sep 2019 07:20:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 17A4222CF7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i4gdP-0006id-Io; Mon, 02 Sep 2019 07:20:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=zPYt=W5=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1i4gdO-0006iY-LA
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2019 07:20:18 +0000
X-Inumbo-ID: 1cbaa21c-cd52-11e9-951b-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1cbaa21c-cd52-11e9-951b-bc764e2007e4;
 Mon, 02 Sep 2019 07:20:17 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id DCCE4AF39;
 Mon,  2 Sep 2019 07:20:15 +0000 (UTC)
To: Souptick Joarder <jrdr.linux@gmail.com>, sstabellini@kernel.org,
 boris.ostrovsky@oracle.com, konrad.wilk@oracle.com
References: <1567366136-874-1-git-send-email-jrdr.linux@gmail.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <b0c46bfb-9903-a3da-be30-e5b3fbabc9bf@suse.com>
Date: Mon, 2 Sep 2019 09:20:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1567366136-874-1-git-send-email-jrdr.linux@gmail.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH] swiotlb-zen: Convert to use macro
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
Cc: xen-devel@lists.xenproject.org, iommu@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDEuMDkuMTkgMjE6MjgsIFNvdXB0aWNrIEpvYXJkZXIgd3JvdGU6Cj4gUmF0aGVyIHRoYW4g
dXNpbmcgc3RhdGljIGludCBtYXhfZG1hX2JpdHMsIHRoaXMKPiBjYW4gYmUgY292ZXJ0ZWQgdG8g
dXNlIGFzIG1hY3JvLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFNvdXB0aWNrIEpvYXJkZXIgPGpyZHIu
bGludXhAZ21haWwuY29tPgoKcy96ZW4veGVuLyBpbiB0aGUgcGF0Y2ggdGl0bGUsIG90aGVyIHRo
YW4gdGhhdDoKClJldmlld2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+CgoK
SnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
