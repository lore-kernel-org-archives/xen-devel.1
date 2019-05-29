Return-Path: <SRS0=GvgA=T5=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EE1BC28CC0
	for <xen-devel@archiver.kernel.org>; Wed, 29 May 2019 09:52:43 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3DB9420657
	for <xen-devel@archiver.kernel.org>; Wed, 29 May 2019 09:52:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3DB9420657
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hVvFz-0001F5-94; Wed, 29 May 2019 09:52:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=9SAg=T5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hVvFy-0001F0-6u
 for xen-devel@lists.xenproject.org; Wed, 29 May 2019 09:52:26 +0000
X-Inumbo-ID: 74af54c8-81f7-11e9-bcdc-534e8ebc3763
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 74af54c8-81f7-11e9-bcdc-534e8ebc3763;
 Wed, 29 May 2019 09:52:23 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Wed, 29 May 2019 03:52:22 -0600
Message-Id: <5CEE56510200007800233550@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Wed, 29 May 2019 03:52:17 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Juergen Gross" <jgross@suse.com>
References: <20190529090407.1225-1-jgross@suse.com>
 <20190529090407.1225-2-jgross@suse.com>
In-Reply-To: <20190529090407.1225-2-jgross@suse.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v2 1/3] xen/swiotlb: fix condition for
 calling xen_destroy_contiguous_region()
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
 stable@vger.kernel.org, iommu@lists.linux-foundation.org,
 xen-devel <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDI5LjA1LjE5IGF0IDExOjA0LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBUaGUg
Y29uZGl0aW9uIGluIHhlbl9zd2lvdGxiX2ZyZWVfY29oZXJlbnQoKSBmb3IgZGVjaWRpbmcgd2hl
dGhlciB0bwo+IGNhbGwgeGVuX2Rlc3Ryb3lfY29udGlndW91c19yZWdpb24oKSBpcyB3cm9uZzog
aW4gY2FzZSB0aGUgcmVnaW9uIHRvCj4gYmUgZnJlZWQgaXMgbm90IGNvbnRpZ3VvdXMgY2FsbGlu
ZyB4ZW5fZGVzdHJveV9jb250aWd1b3VzX3JlZ2lvbigpIGlzCj4gdGhlIHdyb25nIHRoaW5nIHRv
IGRvOiBpdCB3b3VsZCByZXN1bHQgaW4gaW5jb25zaXN0ZW50IG1hcHBpbmdzIG9mCj4gbXVsdGlw
bGUgUEZOcyB0byB0aGUgc2FtZSBNRk4uIFRoaXMgd2lsbCBsZWFkIHRvIHZhcmlvdXMgc3RyYW5n
ZQo+IGNyYXNoZXMgb3IgZGF0YSBjb3JydXB0aW9uLgo+IAo+IEluc3RlYWQgb2YgY2FsbGluZyB4
ZW5fZGVzdHJveV9jb250aWd1b3VzX3JlZ2lvbigpIGluIHRoYXQgY2FzZSBhCj4gd2FybmluZyBz
aG91bGQgYmUgaXNzdWVkIGFzIHRoYXQgc2l0dWF0aW9uIHNob3VsZCBuZXZlciBvY2N1ci4KPiAK
PiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZyAKPiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdy
b3NzIDxqZ3Jvc3NAc3VzZS5jb20+Cj4gUmV2aWV3ZWQtYnk6IEJvcmlzIE9zdHJvdnNreSA8Ym9y
aXMub3N0cm92c2t5QG9yYWNsZS5jb20+CgpSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVs
aWNoQHN1c2UuY29tPgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
