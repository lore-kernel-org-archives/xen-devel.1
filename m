Return-Path: <SRS0=9ImI=TA=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D4E3C43219
	for <xen-devel@archiver.kernel.org>; Tue, 30 Apr 2019 07:34:23 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E457D2080C
	for <xen-devel@archiver.kernel.org>; Tue, 30 Apr 2019 07:34:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E457D2080C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hLNHH-0003ZG-6n; Tue, 30 Apr 2019 07:34:11 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=xzkl=TA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hLNHF-0003Z7-Tk
 for xen-devel@lists.xenproject.org; Tue, 30 Apr 2019 07:34:09 +0000
X-Inumbo-ID: 567c9e25-6b1a-11e9-843c-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 567c9e25-6b1a-11e9-843c-bc764e045a96;
 Tue, 30 Apr 2019 07:34:08 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Tue, 30 Apr 2019 01:34:07 -0600
Message-Id: <5CC7FA6C020000780022A405@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Tue, 30 Apr 2019 01:34:04 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>
References: <1556554590-25358-1-git-send-email-andrew.cooper3@citrix.com>
 <1556554590-25358-3-git-send-email-andrew.cooper3@citrix.com>
In-Reply-To: <1556554590-25358-3-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH for 4.11 2/2] xen: Fix backport of "x86/tsx:
 Implement controls for RTM force-abort mode"
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
Cc: xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190430073404.nBO96thngFcZxAMF2u7jxYmGJgvngizpjZTBSVP9Pg0@z>

Pj4+IE9uIDI5LjA0LjE5IGF0IDE4OjE2LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gVGhlIHBvc3RlZCB2ZXJzaW9uIG9mIHRoaXMgcGF0Y2ggZGVwZW5kcyBvbiBjL3MgM2M1
NTUyOTUgIng4Ni92cG11OiBJbXByb3ZlCj4gZG9jdW1lbnRhdGlvbiBhbmQgcGFyc2luZyBmb3Ig
dnBtdT0iIChYZW4gNC4xMiBhbmQgbGF0ZXIpIHRvIHByZXZlbnQKPiBgdnBtdT1ydG0tYWJvcnRg
IGltcGxpeWluZyBgdnBtdT0xYCwgd2hpY2ggaXMgb3V0c2lkZSBvZiBzZWN1cml0eSBzdXBwb3J0
Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJp
eC5jb20+CgpSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
