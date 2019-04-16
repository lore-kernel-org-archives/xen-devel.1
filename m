Return-Path: <SRS0=kbZc=SS=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E699C10F13
	for <xen-devel@archiver.kernel.org>; Tue, 16 Apr 2019 10:30:15 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 18C2F20693
	for <xen-devel@archiver.kernel.org>; Tue, 16 Apr 2019 10:30:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 18C2F20693
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hGLLf-0008No-98; Tue, 16 Apr 2019 10:29:55 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=H9vN=SS=citrix.com=prvs=00244cc2b=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hGLLd-0008Nj-MD
 for xen-devel@lists.xenproject.org; Tue, 16 Apr 2019 10:29:53 +0000
X-Inumbo-ID: 91835714-6032-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 91835714-6032-11e9-92d7-bc764e045a96;
 Tue, 16 Apr 2019 10:29:52 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,357,1549929600"; d="scan'208";a="83671161"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23733.44695.786166.103822@mariner.uk.xensource.com>
Date: Tue, 16 Apr 2019 11:29:43 +0100
To: Jan Beulich <JBeulich@suse.com>
In-Reply-To: <5CAC85300200007800225C72@prv1-mh.provo.novell.com>
References: <20190402164238.1815-1-julien.grall@arm.com>
 <20190402164238.1815-4-julien.grall@arm.com>
 <5CA4AF5E0200007800224462@prv1-mh.provo.novell.com>
 <dc5849f6-4659-49b7-9ebf-8ea27860f28b@arm.com>
 <5CAC85300200007800225C72@prv1-mh.provo.novell.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH 3/4] xen/public: Document
 HYPERCALL_console_io()
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim \(Xen.org\)" <tim@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190416102943.jkQzkswuOpvMGih4ukSJ5jrkTQEjzuIcq7I6n4r16bw@z>

SmFuIEJldWxpY2ggd3JpdGVzICgiUmU6IFtQQVRDSCAzLzRdIHhlbi9wdWJsaWM6IERvY3VtZW50
IEhZUEVSQ0FMTF9jb25zb2xlX2lvKCkiKToKPiBPbiAwOS4wNC4xOSBhdCAxMzoyNiwgPGp1bGll
bi5ncmFsbEBhcm0uY29tPiB3cm90ZToKPiA+IEkgaGF2ZW4ndCByZXBsaWNhdGVkIHRoZSBgIGJl
Y2F1c2UgSSBoYXZlIG5vIGlkZWEgd2hhdCB0aGV5IGFyZSB1c2VkIGZvci4gSSAKPiA+IHdvdWxk
IGFwcHJlY2lhdGUgaWYgeW91IHByb3ZpZGUgcG9pbnRlciBob3cgdG8gdXNlIHRoZW0uCj4gCj4g
V2VsbCwgSSBjYW4gb25seSBwb2ludCB5b3UgYXQgdGhlIGhpc3Rvcnkgb2YgdGhpbmdzLCBlLmcu
Cj4gMjYyZTExOGEzNyAiZG9jcy9odG1sLzogQW5ub3RhdGlvbnMgZm9yIHR3byBoeXBlcmNhbGxz
Ii4KClRoYXQgaXMgYSByZWFzb25hYmxlIGV4YW1wbGUsIGJ1dDoKClRoZXJlIGlzIGluIGZhY3Qg
c29tZSBkb2N1bWVudGF0aW9uIGZvciB0aGUgYCBzeW50YXguClNlZSBkb2NzL3hlbi1oZWFkZXJz
LCB3aGljaCBpcyB0aGUgc2NyaXB0IHdoaWNoIHNjYW5zIHRoZSAuaApmaWxlcyBhbmQgbWFrZXMg
dGhlIG9ubGluZSBoeXBlcmNhbGwgZG9jdW1lbnRhdGlvbi4gIFRoZSBzeW50YXgKZG9jIGlzIHJh
dGhlciB0ZXJzZSwgSSdtIGFmcmFpZCwgYnV0IGl0J3Mgb25seSBhIDQwMC1saW5lCnNjcmlwdC4u
LgoKSSB3cm90ZSB0aGF0IHNjcmlwdCBiZWNhdXNlIEkgd2FudGVkIHNvbWUga2luZCBvZiBicm93
c2VhYmxlCmRvY3VtZW50YXRpb24sIGFuZCBJIGRpZG4ndCB3YW50IHRvIHRvdGFsbHkgb3Zlcmhh
dWwgdGhlIGhlYWRlcnMuCgpJYW4uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
