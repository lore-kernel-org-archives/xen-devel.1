Return-Path: <SRS0=fn8+=SK=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A89EAC10F14
	for <xen-devel@archiver.kernel.org>; Mon,  8 Apr 2019 10:16:15 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8316620880
	for <xen-devel@archiver.kernel.org>; Mon,  8 Apr 2019 10:16:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8316620880
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hDRJr-0004IS-Hn; Mon, 08 Apr 2019 10:16:03 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ng3J=SK=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hDRJq-0004IG-SQ
 for xen-devel@lists.xenproject.org; Mon, 08 Apr 2019 10:16:02 +0000
X-Inumbo-ID: 4eea73c2-59e7-11e9-92d7-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 4eea73c2-59e7-11e9-92d7-bc764e045a96;
 Mon, 08 Apr 2019 10:16:00 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 92BFF15AD;
 Mon,  8 Apr 2019 03:16:00 -0700 (PDT)
Received: from [10.37.12.9] (unknown [10.37.12.9])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DA2853F718;
 Mon,  8 Apr 2019 03:15:59 -0700 (PDT)
To: Lukas Juenger <juenger@ice.rwth-aachen.de>, xen-devel@lists.xenproject.org
References: <abc8ea85-fe26-46b6-af1a-dcaaa877fd7d@rwthex-w1-a.rwth-ad.de>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <e68dfbce-c369-eb90-97a8-894267351c8e@arm.com>
Date: Mon, 8 Apr 2019 11:15:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <abc8ea85-fe26-46b6-af1a-dcaaa877fd7d@rwthex-w1-a.rwth-ad.de>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] xen/arm: Cap the number of interrupt
 lines for dom0
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
Cc: Stefano Stabellini <sstabellini@kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"; format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190408101558.gZymaHypsVNQ6dKL4Q3qqvq_4wTVInCMtTJkDXoa06o@z>

SGkgTHVrYXMsCgpPbiA0LzUvMTkgMjo1NCBQTSwgTHVrYXMgSnVlbmdlciB3cm90ZToKPiBEb20w
IHZHSUMgd2lsbCB1c2UgdGhlIHNhbWUgbnVtYmVyIG9mIGludGVycnVwdCBsaW5lcyBhcyB0aGUg
aGFyZHdhcmUgR0lDLgo+IFdoaWxlIHRoZSBoYXJkd2FyZSBHSUMgY2FuIHN1cHBvcnQgdXAgdG8g
MTAyMCBpbnRlcnJ1cHQgbGluZXMsCj4gdGhlIHZHSUMgaXMgb25seSBzdXBwb3J0aW5nIHVwIHRv
IDk5MiBpbnRlcnJ1cHQgbGluZXMuCj4gVGhpcyBtZWFucyB0aGF0IFhlbiB3aWxsIG5vdCBiZSBh
YmxlIHRvIGJvb3Qgb24gcGxhdGZvcm1zIHdoZXJlIHRoZSBoYXJkd2FyZQo+IEdJQyBzdXBwb3J0
cyBtb3JlIHRoYW4gOTkyIGludGVycnVwdCBsaW5lcy4KPiBXaGlsZSBpdCB3b3VsZCBtYWtlIHNl
bnNlIHRvIGluY3JlYXNlIHRoZSBsaW1pdHMgaW4gdGhlIHZHSUNzLCB0aGlzIGlzIG5vdAo+IHRy
aXZpYWwgYmVjYXVzZSBvZiB0aGUgZGVzaWduIGNob2ljZXMuCj4gQXQgdGhlIG1vbWVudCwgb25s
eSBtb2RlbHMgc2VlbSB0byByZXBvcnQgdGhlIG1heGltdW0gb2YgaW50ZXJydXB0IGxpbmVzLgo+
IFRoZXkgYWxzbyBkbyBub3QgaGF2ZSBhbnkgaW50ZXJydXB0IHdpcmVkIGFib3ZlIHRoZSA5OTIg
bGltaXQuCj4gU28gaXQgc2hvdWxkIGJlIGZpbmUgdG8gY2FwIHRoZSBudW1iZXIgb2YgaW50ZXJy
dXB0IGxpbmVzIGZvciBkb20wIHRvIDk5MiBsaW5lcy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBMdWth
cyBKdWVuZ2VyIDxqdWVuZ2VyQGljZS5yd3RoLWFhY2hlbi5kZT4KCkFja2VkLWJ5OiBKdWxpZW4g
R3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
