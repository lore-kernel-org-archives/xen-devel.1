Return-Path: <SRS0=9xPH=TC=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 103A0C43219
	for <xen-devel@archiver.kernel.org>; Thu,  2 May 2019 12:21:43 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE6A320645
	for <xen-devel@archiver.kernel.org>; Thu,  2 May 2019 12:21:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DE6A320645
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hMAiS-0005Kv-VC; Thu, 02 May 2019 12:21:32 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=oUxd=TC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hMAiR-0005KZ-VE
 for xen-devel@lists.xenproject.org; Thu, 02 May 2019 12:21:31 +0000
X-Inumbo-ID: d0cab5a7-6cd4-11e9-843c-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id d0cab5a7-6cd4-11e9-843c-bc764e045a96;
 Thu, 02 May 2019 12:21:30 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 02 May 2019 06:21:30 -0600
Message-Id: <5CCAE0C8020000780022B30D@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Thu, 02 May 2019 06:21:28 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "xen-devel" <xen-devel@lists.xenproject.org>
References: <5CCAD5ED020000780022B2A2@prv1-mh.provo.novell.com>
In-Reply-To: <5CCAD5ED020000780022B2A2@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [Xen-devel] [PATCH 6/9] x86/HVM: relax shadow mode check in
 hvm_set_cr3()
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
Message-ID: <20190502122128.QEtrS0VlF5HIE4OL2kTommoxIimYuSg2Kjf1IxkwZI8@z>

VGhlcmUncyBubyBuZWVkIHRvIHJlLW9idGFpbiBhIHBhZ2UgcmVmZXJlbmNlIGlmIG9ubHkgYml0
cyBub3QgYWZmZWN0aW5nCnRoZSBhZGRyZXNzIGNoYW5nZS4KClNpZ25lZC1vZmYtYnk6IEphbiBC
ZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCi0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vaHZtLmMK
KysrIGIveGVuL2FyY2gveDg2L2h2bS9odm0uYwpAQCAtMjMyMCw3ICsyMzIwLDcgQEAgaW50IGh2
bV9zZXRfY3IzKHVuc2lnbmVkIGxvbmcgdmFsdWUsIGJvbwogICAgIH0KIAogICAgIGlmICggaHZt
X3BhZ2luZ19lbmFibGVkKHYpICYmICFwYWdpbmdfbW9kZV9oYXAoY3VycmQpICYmCi0gICAgICAg
ICAodmFsdWUgIT0gdi0+YXJjaC5odm0uZ3Vlc3RfY3JbM10pICkKKyAgICAgICAgICgodmFsdWUg
XiB2LT5hcmNoLmh2bS5ndWVzdF9jclszXSkgPj4gUEFHRV9TSElGVCkgKQogICAgIHsKICAgICAg
ICAgLyogU2hhZG93LW1vZGUgQ1IzIGNoYW5nZS4gQ2hlY2sgUERCUiBhbmQgdXBkYXRlIHJlZmNv
dW50cy4gKi8KICAgICAgICAgSFZNX0RCR19MT0coREJHX0xFVkVMX1ZNTVUsICJDUjMgdmFsdWUg
PSAlbHgiLCB2YWx1ZSk7CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
