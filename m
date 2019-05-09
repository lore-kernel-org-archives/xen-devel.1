Return-Path: <SRS0=7Zzv=TJ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A582C04AB1
	for <xen-devel@archiver.kernel.org>; Thu,  9 May 2019 13:40:41 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 43801205C9
	for <xen-devel@archiver.kernel.org>; Thu,  9 May 2019 13:40:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 43801205C9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hOjHi-0005tD-UA; Thu, 09 May 2019 13:40:30 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=1wQJ=TJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hOjHi-0005t5-BU
 for xen-devel@lists.xenproject.org; Thu, 09 May 2019 13:40:30 +0000
X-Inumbo-ID: 01e165bf-7260-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 01e165bf-7260-11e9-8980-bc764e045a96;
 Thu, 09 May 2019 13:40:28 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 09 May 2019 07:40:28 -0600
Message-Id: <5CD42DCB020000780022D317@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Thu, 09 May 2019 07:40:27 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "xen-devel" <xen-devel@lists.xenproject.org>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [Xen-devel] [PATCH v2 0/3] x86/mm: guest_physmap_add_*() adjustments
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190509134027.EmUHkaCHRvjuCKyPaNbJjZsZnkxeoOWA-eT5KmnpBl0@z>

UGF0Y2ggMSBpcyByZWFsbHkgaW5kZXBlbmRlbnQsIGJ1dCBwYXRjaCAyIHJlbGllcyBvbiBpdCBi
ZWluZyBpbiBwbGFjZS4KUGF0Y2ggMiBpdHNlbGYgd2FzIGFkZGVkIGFzIGEgcmVzdWx0IG9mIHRo
ZSBkaXNjdXNzaW9uIG9mIHBhdGNoIDMncwp2MSAod2hpY2ggd2FzIHByZXZpb3VzbHkgYSBzdGFu
ZGFsb25lIG9uZSkuCgoxOiBzaG9ydC1jaXJjdWl0IEhWTS1vbmx5IG1vZGUgZmxhZ3Mgd2hlbiAh
SFZNCjI6IG1ha2UgZ3Vlc3RfcGh5c21hcF9hZGRfZW50cnkoKSBIVk0tb25seQozOiBzdWJzdW1l
IHNldF9ncGZuX2Zyb21fbWZuKCkgaW50byBndWVzdF9waHlzbWFwX2FkZF9wYWdlKCkKCkphbgoK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
