Return-Path: <SRS0=bRyV=TX=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A545C282DD
	for <xen-devel@archiver.kernel.org>; Thu, 23 May 2019 13:04:40 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 02E7C20879
	for <xen-devel@archiver.kernel.org>; Thu, 23 May 2019 13:04:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 02E7C20879
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hTnO7-0001Hj-MA; Thu, 23 May 2019 13:04:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=oIoO=TX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hTnO6-0001He-QR
 for xen-devel@lists.xenproject.org; Thu, 23 May 2019 13:04:02 +0000
X-Inumbo-ID: 3955a7ec-7d5b-11e9-bc90-5fa7d31ecf38
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3955a7ec-7d5b-11e9-bc90-5fa7d31ecf38;
 Thu, 23 May 2019 13:03:57 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 23 May 2019 07:03:56 -0600
Message-Id: <5CE69A3B0200007800231B81@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Thu, 23 May 2019 07:03:55 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>
References: <1558347494-21640-1-git-send-email-andrew.cooper3@citrix.com>
 <1558347494-21640-2-git-send-email-andrew.cooper3@citrix.com>
In-Reply-To: <1558347494-21640-2-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 1/4] x86/pv: Fix error handling in
 dom0_construct_pv()
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190523130355.LHOzGCczSu7AhRKHG57BlMU8JX6THnc8btepibmn5zs@z>

Pj4+IE9uIDIwLjA1LjE5IGF0IDEyOjE4LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT25lIHBhdGggaW4gZG9tMF9jb25zdHJ1Y3RfcHYoKSByZXR1cm5zIC0xIHVubGlrZSBh
bGwgb3RoZXIgZXJyb3IgcGF0aHMuCj4gU3dpdGNoIGl0IHRvIHJldHVybmluZyAtRUlOVkFMLgo+
IAo+IFRoaXMgd2FzIGxhc3QgbW9kaWZpZWQgYnkgYy9zIGM4NDQ4MWZiIFhTQS01NSwgYnV0IHRo
ZSBidWcgcHJlZGF0ZXMgdGhhdAo+IHNlcmllcy4gIEhvd2V2ZXIsIHRoaXMgcGF0Y2ggZGlkIChm
b3Igbm8gb2J2aW91cyByZWFzb24pIGludHJvZHVjZSBhCj4gYmlmdXJjYXRlZCB0YWlsIHRvIHRo
ZSBmdW5jdGlvbiB3aXRoIHR3byBzdWJ0bHkgZGlmZmVyZW50IGVsZl9jaGVja19icm9rZW4oKQo+
IGNsYXVzZXMuCj4gCj4gQXMgdGhlIGVsZl9jaGVja19icm9rZW4oKSBpcyBqdXN0IGEgd2Fybmlu
ZyBhbmQgZG9lc24ndCBpbmZsdWVuY2UgdGhlIGZ1cnRoZXIKPiBib290LCBmb2xkIHRoZSBleGl0
IHBhdGhzIHRvZ2V0aGVyIGFuZCB1c2UgYSBzaW5nbGUgY2xhdXNlLgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgpSZXZpZXdlZC1i
eTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
