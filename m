Return-Path: <SRS0=GvgA=T5=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C911BC28CC0
	for <xen-devel@archiver.kernel.org>; Wed, 29 May 2019 09:58:02 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A475F208CB
	for <xen-devel@archiver.kernel.org>; Wed, 29 May 2019 09:58:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A475F208CB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hVvL6-0001RO-1V; Wed, 29 May 2019 09:57:44 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=9SAg=T5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hVvL4-0001RJ-JO
 for xen-devel@lists.xenproject.org; Wed, 29 May 2019 09:57:42 +0000
X-Inumbo-ID: 32283213-81f8-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 32283213-81f8-11e9-8980-bc764e045a96;
 Wed, 29 May 2019 09:57:40 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Wed, 29 May 2019 03:57:40 -0600
Message-Id: <5CEE57910200007800233571@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Wed, 29 May 2019 03:57:37 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Juergen Gross" <jgross@suse.com>
References: <20190529090407.1225-1-jgross@suse.com>
 <20190529090407.1225-4-jgross@suse.com>
In-Reply-To: <20190529090407.1225-4-jgross@suse.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v2 3/3] xen/swiotlb: remember having called
 xen_create_contiguous_region()
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, xen-devel <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDI5LjA1LjE5IGF0IDExOjA0LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBAQCAt
MzQ1LDggKzM0NiwxMSBAQCB4ZW5fc3dpb3RsYl9mcmVlX2NvaGVyZW50KHN0cnVjdCBkZXZpY2Ug
Kmh3ZGV2LCBzaXplX3Qgc2l6ZSwgdm9pZCAqdmFkZHIsCj4gIAlzaXplID0gMVVMIDw8IChvcmRl
ciArIFhFTl9QQUdFX1NISUZUKTsKPiAgCj4gIAlpZiAoIVdBUk5fT04oKGRldl9hZGRyICsgc2l6
ZSAtIDEgPiBkbWFfbWFzaykgfHwKPiAtCQkgICAgIHJhbmdlX3N0cmFkZGxlc19wYWdlX2JvdW5k
YXJ5KHBoeXMsIHNpemUpKSkKPiArCQkgICAgIHJhbmdlX3N0cmFkZGxlc19wYWdlX2JvdW5kYXJ5
KHBoeXMsIHNpemUpKSAmJgo+ICsJICAgIFBhZ2VYZW5SZW1hcHBlZCh2aXJ0X3RvX3BhZ2UodmFk
ZHIpKSkgewo+ICAJCXhlbl9kZXN0cm95X2NvbnRpZ3VvdXNfcmVnaW9uKHBoeXMsIG9yZGVyKTsK
PiArCQlDbGVhclBhZ2VYZW5SZW1hcHBlZCh2aXJ0X3RvX3BhZ2UodmFkZHIpKTsKPiArCX0KClRv
IGJlIHN5bW1ldHJpYyB3aXRoIHNldHRpbmcgdGhlIGZsYWcgb25seSBhZnRlciBoYXZpbmcgbWFk
ZSB0aGUgcmVnaW9uCmNvbnRpZ3VvdXMsIGFuZCB0byBhdm9pZCAocGVyaGFwcyBqdXN0IHRoZW9y
ZXRpY2FsKSByYWNlcywgd291bGRuJ3QgaXQgYmUKYmV0dGVyIHRvIGNsZWFyIHRoZSBmbGFnIGJl
Zm9yZSBjYWxsaW5nIHhlbl9kZXN0cm95X2NvbnRpZ3VvdXNfcmVnaW9uKCk/CkV2ZW4gYmV0dGVy
IHdvdWxkIGJlIGEgVGVzdEFuZENsZWFyLi4uKCkgb3BlcmF0aW9uLgoKSmFuCgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
