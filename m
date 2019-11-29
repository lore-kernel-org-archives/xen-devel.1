Return-Path: <SRS0=4rCt=ZV=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0A05C432C3
	for <xen-devel@archiver.kernel.org>; Fri, 29 Nov 2019 10:13:31 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B837220833
	for <xen-devel@archiver.kernel.org>; Fri, 29 Nov 2019 10:13:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B837220833
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iadGz-0008Df-IO; Fri, 29 Nov 2019 10:13:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=mjd+=ZV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iadGy-0008Da-D6
 for xen-devel@lists.xenproject.org; Fri, 29 Nov 2019 10:13:12 +0000
X-Inumbo-ID: d8b310a2-1290-11ea-a55d-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d8b310a2-1290-11ea-a55d-bc764e2007e4;
 Fri, 29 Nov 2019 10:13:11 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 3E940B47D;
 Fri, 29 Nov 2019 10:13:10 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5766dd2b-2aa7-bafe-56ad-3ea33ddf4591@suse.com>
Date: Fri, 29 Nov 2019 11:13:18 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] [PATCH] console: avoid buffer overflow in
 guest_console_write()
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ilja Van Sprundel <ivansprundel@ioactive.com>,
 Ian Jackson <ian.jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIHN3aXRjaCBvZiBndWVzdF9jb25zb2xlX3dyaXRlKCkncyBzZWNvbmQgcGFyYW1ldGVyIGZy
b20gcGxhaW4gdG8KdW5zaWduZWQgaW50IGhhcyBjYXVzZWQgdGhlIGZ1bmN0aW9uJ3MgbWFpbiBs
b29wIGhlYWRlciB0byBubyBsb25nZXIKZ3VhcmQgdGhlIG1pbl90KCkgdXNlIHdpdGhpbiB0aGUg
ZnVuY3Rpb24gYWdhaW5zdCBlZmZlY3RpdmVseSBuZWdhdGl2ZQp2YWx1ZXMsIGR1ZSB0byB0aGUg
Y2FzdHMgaGlkZGVuIGluc2lkZSB0aGUgbWFjcm8uIFJlcGxhY2UgYnkgYSBwbGFpbgptaW4oKSwg
Y29udmVydGluZyBvbmUgb2YgdGhlIGFyZ3VtZW50cyBzdWl0YWJseSB3aXRob3V0IGludm9sdmlu
ZyBhbnkKY2FzdC4KCkZpeGVzOiBlYTYwMWVjOTk5NWIgKCJ4ZW4vY29uc29sZTogUmV3b3JrIEhZ
UEVSQ0FMTF9jb25zb2xlX2lvIGludGVyZmFjZSIpClJlcG9ydGVkLWJ5OiBJbGphIFZhbiBTcHJ1
bmRlbCA8aXZhbnNwcnVuZGVsQGlvYWN0aXZlLmNvbT4KU2lnbmVkLW9mZi1ieTogSmFuIEJldWxp
Y2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKLS0tIGEveGVuL2RyaXZlcnMvY2hhci9jb25zb2xlLmMK
KysrIGIveGVuL2RyaXZlcnMvY2hhci9jb25zb2xlLmMKQEAgLTUzOCw3ICs1MzgsNyBAQCBzdGF0
aWMgbG9uZyBndWVzdF9jb25zb2xlX3dyaXRlKFhFTl9HVUVTCiAgICAgICAgICAgICAgICAgX19I
WVBFUlZJU09SX2NvbnNvbGVfaW8sICJpaWgiLAogICAgICAgICAgICAgICAgIENPTlNPTEVJT193
cml0ZSwgY291bnQsIGJ1ZmZlcik7CiAKLSAgICAgICAga2NvdW50ID0gbWluX3QoaW50LCBjb3Vu
dCwgc2l6ZW9mKGtidWYpLTEpOworICAgICAgICBrY291bnQgPSBtaW4oY291bnQgKyBzaXplb2Yo
Y2hhclswXSksIHNpemVvZihrYnVmKSAtIDEpOwogICAgICAgICBpZiAoIGNvcHlfZnJvbV9ndWVz
dChrYnVmLCBidWZmZXIsIGtjb3VudCkgKQogICAgICAgICAgICAgcmV0dXJuIC1FRkFVTFQ7CiAK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
