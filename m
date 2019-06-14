Return-Path: <SRS0=aUBB=UN=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 983D4C31E4B
	for <xen-devel@archiver.kernel.org>; Fri, 14 Jun 2019 11:44:49 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 78D1E2082C
	for <xen-devel@archiver.kernel.org>; Fri, 14 Jun 2019 11:44:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 78D1E2082C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hbkdE-0002SW-KT; Fri, 14 Jun 2019 11:44:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Gode=UN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hbkdD-0002SR-5V
 for xen-devel@lists.xenproject.org; Fri, 14 Jun 2019 11:44:31 +0000
X-Inumbo-ID: c3775dc2-8e99-11e9-a583-db9a01e150f8
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c3775dc2-8e99-11e9-a583-db9a01e150f8;
 Fri, 14 Jun 2019 11:44:27 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Fri, 14 Jun 2019 05:44:26 -0600
Message-Id: <5D03889A0200007800238498@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Fri, 14 Jun 2019 05:44:26 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Brian Woods" <brian.woods@amd.com>
References: <5CA75E460200007800224E23@prv1-mh.provo.novell.com>
 <5CA75E4602000000001041BD@prv1-mh.provo.novell.com>
 <5CA75E460200007800232A93@prv1-mh.provo.novell.com>
In-Reply-To: <5CA75E460200007800232A93@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [Xen-devel] Ping#2: [PATCH v2 0/2] x86/AMD: correct certain Fam17
 checks
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
 xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDA1LjA0LjE5IGF0IDE1OjU1LCAgd3JvdGU6Cj4gMTogY29ycmVjdCBjZXJ0YWluIEZh
bTE3IGNoZWNrcwo+IDI6IGxpbWl0IEMxRSBkaXNhYmxlIGZhbWlseSByYW5nZQo+IAo+IHYyOiBG
b2xsb3cgQW5kcmV3J3Mgc3VnZ2VzdGlvbiBmb3IgTkJfQ0ZHIGluIHBhdGNoIDEuIE5ldyBwYXRj
aCAyLgo+IAo+IEphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
