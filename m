Return-Path: <SRS0=9xPH=TC=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E7C9C43219
	for <xen-devel@archiver.kernel.org>; Thu,  2 May 2019 12:22:40 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 227882081C
	for <xen-devel@archiver.kernel.org>; Thu,  2 May 2019 12:22:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 227882081C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hMAjL-0005ZI-PF; Thu, 02 May 2019 12:22:27 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=oUxd=TC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hMAjJ-0005Yt-Rw
 for xen-devel@lists.xenproject.org; Thu, 02 May 2019 12:22:25 +0000
X-Inumbo-ID: f1447920-6cd4-11e9-843c-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id f1447920-6cd4-11e9-843c-bc764e045a96;
 Thu, 02 May 2019 12:22:25 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 02 May 2019 06:22:24 -0600
Message-Id: <5CCAE0FE020000780022B313@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Thu, 02 May 2019 06:22:22 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "xen-devel" <xen-devel@lists.xenproject.org>
References: <5CCAD5ED020000780022B2A2@prv1-mh.provo.novell.com>
In-Reply-To: <5CCAD5ED020000780022B2A2@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [Xen-devel] [PATCH 8/9] x86/CPUID: drop INVPCID dependency on PCID
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
Message-ID: <20190502122222.DchTr8XdAFsUxT4_HDAFv8eZPGbIo8LZaYcL2P8yABg@z>

UENJRCB2YWxpZGx5IGRlcGVuZHMgb24gTE0sIGFzIGl0IGNhbiBiZSBlbmFibGVkIGluIExvbmcg
TW9kZSBvbmx5LgpJTlZQQ0lELCBvdG9oLCBjYW4gYmUgdXNlZCBub3Qgb25seSB3aXRob3V0IFBD
SUQgZW5hYmxlZCwgYnV0IGFsc28Kb3V0c2lkZSBvZiBMb25nIE1vZGUgYWx0b2dldGhlci4gSW4g
Ym90aCBjYXNlcyBpdHMgZnVuY3Rpb25hbGl0eSBpcwpzaW1wbHkgcmVzdHJpY3RlZCB0byBQQ0lE
IDAsIHdoaWNoIGlzIHNvcnQgb2YgZXhwZWN0ZWQgYXMgbm8gb3RoZXIgUENJRApjYW4gYmUgYWN0
aXZhdGVkIHRoZXJlLgoKU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2Uu
Y29tPgoKLS0tIGEveGVuL3Rvb2xzL2dlbi1jcHVpZC5weQorKysgYi94ZW4vdG9vbHMvZ2VuLWNw
dWlkLnB5CkBAIC0yMTcsMTAgKzIxNyw2IEBAIGRlZiBjcnVuY2hfbnVtYmVycyhzdGF0ZSk6CiAg
ICAgICAgICMKICAgICAgICAgIyBTU0U0XzI6IFtQT1BDTlRdCiAKLSAgICAgICAgIyBUaGUgSU5W
UENJRCBpbnN0cnVjdGlvbiBkZXBlbmRzIG9uIFBDSUQgaW5mcmFzdHJ1Y3R1cmUgYmVpbmcKLSAg
ICAgICAgIyBhdmFpbGFibGUuCi0gICAgICAgIFBDSUQ6IFtJTlZQQ0lEXSwKLQogICAgICAgICAj
IFhTQVZFIGlzIGFuIGV4dHJhIHNldCBvZiBpbnN0cnVjdGlvbnMgZm9yIHN0YXRlIG1hbmFnZW1l
bnQsIGJ1dAogICAgICAgICAjIGRvZXNuJ3QgY29uc3RpdHVlIG5ldyBzdGF0ZSBpdHNlbGYuICBT
b21lIG9mIHRoZSBkZXBlbmRlbnQgZmVhdHVyZXMKICAgICAgICAgIyBhcmUgaW5zdHJ1Y3Rpb25z
IGJ1aWx0IG9uIHRvcCBvZiBiYXNlIFhTQVZFLCB3aGlsZSBvdGhlcnMgYXJlIG5ldwoKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
