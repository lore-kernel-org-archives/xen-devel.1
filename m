Return-Path: <SRS0=b7Gi=SO=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 735D0C10F14
	for <xen-devel@archiver.kernel.org>; Fri, 12 Apr 2019 13:31:27 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B48D2084D
	for <xen-devel@archiver.kernel.org>; Fri, 12 Apr 2019 13:31:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4B48D2084D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEwGd-0007Ro-Bp; Fri, 12 Apr 2019 13:30:55 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=UMhk=SO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hEwGc-0007Rj-4l
 for xen-devel@lists.xenproject.org; Fri, 12 Apr 2019 13:30:54 +0000
X-Inumbo-ID: 313bd87b-5d27-11e9-92d7-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 313bd87b-5d27-11e9-92d7-bc764e045a96;
 Fri, 12 Apr 2019 13:30:52 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Fri, 12 Apr 2019 07:30:51 -0600
Message-Id: <5CB0930C0200007800226E5D@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Fri, 12 Apr 2019 07:30:52 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "xen-devel" <xen-devel@lists.xenproject.org>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [Xen-devel] [PATCH] x86/IO-APIC: drop an unused variable from
 setup_IO_APIC_irqs()
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190412133052.9w6oEgRnlIq2s-aS6rBZKymfSHEdgpSFpsUbVvR-l58@z>

TXVzdCBiZSBhIGxlZnQtb3ZlciBmcm9tIGVhcmxpZXIgZGF5cy4KClNpZ25lZC1vZmYtYnk6IEph
biBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCi0tLSBhL3hlbi9hcmNoL3g4Ni9pb19hcGlj
LmMKKysrIGIveGVuL2FyY2gveDg2L2lvX2FwaWMuYwpAQCAtOTg0LDggKzk4NCw2IEBAIHN0YXRp
YyB2b2lkIF9faW5pdCBzZXR1cF9JT19BUElDX2lycXModm8KIAogICAgIGZvciAoYXBpYyA9IDA7
IGFwaWMgPCBucl9pb2FwaWNzOyBhcGljKyspIHsKICAgICAgICAgZm9yIChwaW4gPSAwOyBwaW4g
PCBucl9pb2FwaWNfZW50cmllc1thcGljXTsgcGluKyspIHsKLSAgICAgICAgICAgIHN0cnVjdCBp
cnFfZGVzYyAqZGVzYzsKLQogICAgICAgICAgICAgLyoKICAgICAgICAgICAgICAqIGFkZCBpdCB0
byB0aGUgSU8tQVBJQyBpcnEtcm91dGluZyB0YWJsZToKICAgICAgICAgICAgICAqLwpAQCAtMTAz
OCw3ICsxMDM2LDYgQEAgc3RhdGljIHZvaWQgX19pbml0IHNldHVwX0lPX0FQSUNfaXJxcyh2bwog
ICAgICAgICAgICAgaWYgKHBsYXRmb3JtX2xlZ2FjeV9pcnEoaXJxKSkKICAgICAgICAgICAgICAg
ICBkaXNhYmxlXzgyNTlBX2lycShpcnFfdG9fZGVzYyhpcnEpKTsKIAotICAgICAgICAgICAgZGVz
YyA9IGlycV90b19kZXNjKGlycSk7CiAgICAgICAgICAgICBTRVRfREVTVChlbnRyeSwgbG9naWNh
bCwgY3B1X21hc2tfdG9fYXBpY2lkKFRBUkdFVF9DUFVTKSk7CiAgICAgICAgICAgICBzcGluX2xv
Y2tfaXJxc2F2ZSgmaW9hcGljX2xvY2ssIGZsYWdzKTsKICAgICAgICAgICAgIF9faW9hcGljX3dy
aXRlX2VudHJ5KGFwaWMsIHBpbiwgMCwgZW50cnkpOwoKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
