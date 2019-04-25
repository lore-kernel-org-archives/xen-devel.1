Return-Path: <SRS0=w6oi=S3=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFF6DC10F03
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 11:20:42 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A95DD2084B
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 11:20:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A95DD2084B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hJcQU-0004AD-71; Thu, 25 Apr 2019 11:20:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=iCIG=S3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hJcQT-0004A8-Ef
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2019 11:20:25 +0000
X-Inumbo-ID: 1ea8e852-674c-11e9-b491-b386a03e5d28
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1ea8e852-674c-11e9-b491-b386a03e5d28;
 Thu, 25 Apr 2019 11:20:24 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 25 Apr 2019 05:20:23 -0600
Message-Id: <5CC197EF0200007800229019@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Thu, 25 Apr 2019 05:20:15 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Julien Grall" <julien.grall@arm.com>
References: <20190218113600.9540-1-julien.grall@arm.com>
 <20190218113600.9540-2-julien.grall@arm.com>
 <alpine.DEB.2.10.1904151453080.29275@sstabellini-ThinkPad-X260>
 <b92d3ffc-0dd9-ddfb-cee0-664f61ee2ff9@arm.com>
 <alpine.DEB.2.10.1904151522330.29275@sstabellini-ThinkPad-X260>
 <c3e5008c-7dd2-61b5-bec1-287b310a471c@arm.com>
 <02478ff8-d1e2-abe1-74a5-ca72ab87f154@arm.com>
In-Reply-To: <02478ff8-d1e2-abe1-74a5-ca72ab87f154@arm.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH for-next 1/9] xen/arm: Use mfn_to_pdx
 instead of pfn_to_pdx when possible
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190425112015.BasxQizb9vDbNnlLvp_w4FYl8SXd47PV9IT3gcvU01U@z>

Pj4+IE9uIDE3LjA0LjE5IGF0IDE5OjA3LCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+
IEFueXdheSwgaXQgaXMgbm90IHRoZSBmaXJzdCB0aW1lIEkgc2VlIGJ1aWxkIGVycm9yIHdoZW4g
dHJ5aW5nIHRvIG1ha2UgdGhlIGNvZGUgdXNpbmcKPiB0eXBlc2FmZSBnZm4vbWZuLiBUaGUgaGVh
ZGVycyBkZXBlbmRlbmN5IGFyZSBxdWl0ZSBtZXNzeSBpbiBnZW5lcmFsLgoKQmVjYXVzZSBvZiB0
aGlzLCAuLi4KCj4gQW5kcmV3LCBKYW4gZG8geW91IGhhdmUgYSBzdWdnZXN0aW9uIGhvdyB0byBw
cm9jZXNzIG9uIHRoZSB4ODYgc2lkZT8KCi4uLiBJIGRvbid0LCBJJ20gc29ycnksIHdpdGhvdXQg
YmVpbmcgYWJsZSB0byBpbnZlc3Qgc29tZSB0aW1lIHRvCnBsYXkgd2l0aCB0aGlzIG15c2VsZi4K
CkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
