Return-Path: <SRS0=bRyV=TX=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 096C8C282DD
	for <xen-devel@archiver.kernel.org>; Thu, 23 May 2019 12:17:57 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CEA1B20879
	for <xen-devel@archiver.kernel.org>; Thu, 23 May 2019 12:17:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CEA1B20879
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hTmfK-0005fb-Mf; Thu, 23 May 2019 12:17:46 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=oIoO=TX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hTmfI-0005fQ-Pt
 for xen-devel@lists.xenproject.org; Thu, 23 May 2019 12:17:44 +0000
X-Inumbo-ID: c442903f-7d54-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id c442903f-7d54-11e9-8980-bc764e045a96;
 Thu, 23 May 2019 12:17:43 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 23 May 2019 06:17:43 -0600
Message-Id: <5CE68F650200007800231B38@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Thu, 23 May 2019 06:17:41 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "xen-devel" <xen-devel@lists.xenproject.org>
References: <5CE68CD30200007800231B01@prv1-mh.provo.novell.com>
In-Reply-To: <5CE68CD30200007800231B01@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [Xen-devel] [PATCH 2/5] x86/cpuidle: really use C1 for "urgent" CPUs
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
Message-ID: <20190523121741.xzcRX3fxUIHTGASfVuyMsWROiNX4PHqDDLSKqdC3Ck0@z>

Rm9yIG9uZSBvbiByZWNlbnQgQU1EIENQVXMgZW50ZXJpbmcgQzEgKGlmIGF2YWlsYWJsZSBhdCBh
bGwpIHJlcXVpcmVzCnVzZSBvZiBNV0FJVCwgd2hpbGUgSExUIChpLmUuIGRlZmF1bHRfaWRsZSgp
KSB3b3VsZCBwdXQgdGhlIHByb2Nlc3NvcgppbnRvIGFzIGRlZXAgYXMgQ0M2LiBBbmQgdGhlbiBl
dmVuIG9uIG90aGVyIHZlbmRvcnMnIENQVXMgd2Ugc2hvdWxkCmF2b2lkIGVudGVyaW5nIGRlZmF1
bHRfaWRsZSgpIHdoZW4gdGhlIGludGVuZGVkIHN0YXRlIGNhbiBiZSByZWFjaGVkCmJ5IHVzaW5n
IHRoZSBhY3RpdmUgaWRsZSBkcml2ZXIncyBmYWNpbGl0aWVzLgoKU2lnbmVkLW9mZi1ieTogSmFu
IEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKLS0tIGEveGVuL2FyY2gveDg2L2FjcGkvY3B1
X2lkbGUuYworKysgYi94ZW4vYXJjaC94ODYvYWNwaS9jcHVfaWRsZS5jCkBAIC01ODAsMTIgKzU4
MCwxNSBAQCBzdGF0aWMgdm9pZCBhY3BpX3Byb2Nlc3Nvcl9pZGxlKHZvaWQpCiAgICAgdTMyIGV4
cCA9IDAsIHByZWQgPSAwOwogICAgIHUzMiBpcnFfdHJhY2VkWzRdID0geyAwIH07CiAKLSAgICBp
ZiAoIG1heF9jc3RhdGUgPiAwICYmIHBvd2VyICYmICFzY2hlZF9oYXNfdXJnZW50X3ZjcHUoKSAm
JgorICAgIGlmICggbWF4X2NzdGF0ZSA+IDAgJiYgcG93ZXIgJiYKICAgICAgICAgIChuZXh0X3N0
YXRlID0gY3B1aWRsZV9jdXJyZW50X2dvdmVybm9yLT5zZWxlY3QocG93ZXIpKSA+IDAgKQogICAg
IHsKKyAgICAgICAgdW5zaWduZWQgaW50IG1heF9zdGF0ZSA9IHNjaGVkX2hhc191cmdlbnRfdmNw
dSgpID8gQUNQSV9TVEFURV9DMQorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgOiBtYXhfY3N0YXRlOworCiAgICAgICAgIGRvIHsKICAgICAg
ICAgICAgIGN4ID0gJnBvd2VyLT5zdGF0ZXNbbmV4dF9zdGF0ZV07Ci0gICAgICAgIH0gd2hpbGUg
KCBjeC0+dHlwZSA+IG1heF9jc3RhdGUgJiYgLS1uZXh0X3N0YXRlICk7CisgICAgICAgIH0gd2hp
bGUgKCBjeC0+dHlwZSA+IG1heF9zdGF0ZSAmJiAtLW5leHRfc3RhdGUgKTsKICAgICAgICAgaWYg
KCBuZXh0X3N0YXRlICkKICAgICAgICAgewogICAgICAgICAgICAgaWYgKCBjeC0+dHlwZSA9PSBB
Q1BJX1NUQVRFX0MzICYmIHBvd2VyLT5mbGFncy5ibV9jaGVjayAmJgotLS0gYS94ZW4vYXJjaC94
ODYvY3B1L213YWl0LWlkbGUuYworKysgYi94ZW4vYXJjaC94ODYvY3B1L213YWl0LWlkbGUuYwpA
QCAtNzI0LDExICs3MjQsMTQgQEAgc3RhdGljIHZvaWQgbXdhaXRfaWRsZSh2b2lkKQogCXU2NCBi
ZWZvcmUsIGFmdGVyOwogCXUzMiBleHAgPSAwLCBwcmVkID0gMCwgaXJxX3RyYWNlZFs0XSA9IHsg
MCB9OwogCi0JaWYgKG1heF9jc3RhdGUgPiAwICYmIHBvd2VyICYmICFzY2hlZF9oYXNfdXJnZW50
X3ZjcHUoKSAmJgorCWlmIChtYXhfY3N0YXRlID4gMCAmJiBwb3dlciAmJgogCSAgICAobmV4dF9z
dGF0ZSA9IGNwdWlkbGVfY3VycmVudF9nb3Zlcm5vci0+c2VsZWN0KHBvd2VyKSkgPiAwKSB7CisJ
CXVuc2lnbmVkIGludCBtYXhfc3RhdGUgPSBzY2hlZF9oYXNfdXJnZW50X3ZjcHUoKSA/IEFDUElf
U1RBVEVfQzEKKwkJCQkJCQkJIDogbWF4X2NzdGF0ZTsKKwogCQlkbyB7CiAJCQljeCA9ICZwb3dl
ci0+c3RhdGVzW25leHRfc3RhdGVdOwotCQl9IHdoaWxlIChjeC0+dHlwZSA+IG1heF9jc3RhdGUg
JiYgLS1uZXh0X3N0YXRlKTsKKwkJfSB3aGlsZSAoY3gtPnR5cGUgPiBtYXhfc3RhdGUgJiYgLS1u
ZXh0X3N0YXRlKTsKIAkJaWYgKCFuZXh0X3N0YXRlKQogCQkJY3ggPSBOVUxMOwogCQllbHNlIGlm
ICh0Yl9pbml0X2RvbmUpCgoKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
