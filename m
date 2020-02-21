Return-Path: <SRS0=8o9x=4J=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3AD1C35647
	for <xen-devel@archiver.kernel.org>; Fri, 21 Feb 2020 10:30:11 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9AC4D207FD
	for <xen-devel@archiver.kernel.org>; Fri, 21 Feb 2020 10:30:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9AC4D207FD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j55ZB-0007ab-5g; Fri, 21 Feb 2020 10:29:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=aa0I=4J=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1j55Z9-0007aW-FD
 for xen-devel@lists.xenproject.org; Fri, 21 Feb 2020 10:29:51 +0000
X-Inumbo-ID: 17772fee-5495-11ea-ade5-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 17772fee-5495-11ea-ade5-bc764e2007e4;
 Fri, 21 Feb 2020 10:29:51 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1j55Z8-0007yw-6A; Fri, 21 Feb 2020 10:29:50 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1j55Z7-0002DR-TY; Fri, 21 Feb 2020 10:29:50 +0000
Date: Fri, 21 Feb 2020 10:29:47 +0000
From: Wei Liu <wl@xen.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20200221102947.huairapxh4wbz4dl@debian>
References: <20200220195845.5676-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200220195845.5676-1-andrew.cooper3@citrix.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH] x86/splitlock: CPUID and MSR details
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBGZWIgMjAsIDIwMjAgYXQgMDc6NTg6NDVQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBBIHNwbGl0bG9jayBpcyBhbiBhdG9taWMgb3BlcmF0aW9uIHdoaWNoIGNyb3NzZXMg
YSBjYWNoZSBsaW5lIGJvdW5kYXJ5LiAgSXQKPiBzZXJpYWxpc2VzIG9wZXJhdGlvbnMgaW4gdGhl
IGNhY2hlIGNvaGVyZW5jeSBmYWJyaWMgYW5kIGNvbWVzIHdpdGggYQo+IG11bHRpLXRob3VzYW5k
IGN5Y2xlIHN0YWxsLgo+IAo+IEludGVsIFRyZW1vbnQgQ1BVcyBpbnRyb2R1Y2UgTVNSX0NPUkVf
Q0FQUyB0byBlbnVtZXJhdGUgdmFyaW91cyBjb3JlLXNwZWNpZmljCj4gZmVhdHVyZXMsIGFuZCBN
U1JfVEVTVF9DVFJMIHRvIGFkanVzdCB0aGUgYmVoYXZpb3VyIGluIHRoZSBjYXNlIG9mIGEKPiBz
cGxpdGxvY2suCj4gCj4gVmlydHVhbGlzaW5nIHRoaXMgZm9yIGd1ZXN0cyBpcyBkaXN0aW5jdGx5
IHRyaWNreSBvd2luZyB0byB0aGUgZmFjdCB0aGF0Cj4gTVNSX1RFU1RfQ1RSTCBoYXMgY29yZSBy
YXRoZXIgdGhhbiB0aHJlYWQgc2NvcGUuICBJbiB0aGUgbWVhbnRpbWUgaG93ZXZlciwKPiBwcmV2
ZW50IHRoZSBNU1IgdmFsdWVzIGxlYWtpbmcgaW50byBndWVzdHMuCj4gCj4gU2lnbmVkLW9mZi1i
eTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KClJldmlld2VkLWJ5
OiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
