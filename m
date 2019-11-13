Return-Path: <SRS0=Sbqy=ZF=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C12F8C43331
	for <xen-devel@archiver.kernel.org>; Wed, 13 Nov 2019 14:42:31 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 99591222CD
	for <xen-devel@archiver.kernel.org>; Wed, 13 Nov 2019 14:42:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 99591222CD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iUtqg-0000l3-3M; Wed, 13 Nov 2019 14:42:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=SDLk=ZF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iUtqe-0000kj-Ar
 for xen-devel@lists.xenproject.org; Wed, 13 Nov 2019 14:42:20 +0000
X-Inumbo-ID: cb0e690c-0623-11ea-9631-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cb0e690c-0623-11ea-9631-bc764e2007e4;
 Wed, 13 Nov 2019 14:42:19 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 94701B1F1;
 Wed, 13 Nov 2019 14:42:18 +0000 (UTC)
To: osstest service owner <osstest-admin@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <osstest-144059-mainreport@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <22a5f661-0b8a-45dd-3129-2be4a6c3764b@suse.com>
Date: Wed, 13 Nov 2019 15:42:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <osstest-144059-mainreport@xen.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [xen-4.12-testing test] 144059: regressions - FAIL
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTMuMTEuMjAxOSAxMjo1NSwgb3NzdGVzdCBzZXJ2aWNlIG93bmVyIHdyb3RlOgo+IGZsaWdo
dCAxNDQwNTkgeGVuLTQuMTItdGVzdGluZyByZWFsIFtyZWFsXQo+IGh0dHA6Ly9sb2dzLnRlc3Qt
bGFiLnhlbnByb2plY3Qub3JnL29zc3Rlc3QvbG9ncy8xNDQwNTkvCj4gCj4gUmVncmVzc2lvbnMg
Oi0oCj4gCj4gVGVzdHMgd2hpY2ggZGlkIG5vdCBzdWNjZWVkIGFuZCBhcmUgYmxvY2tpbmcsCj4g
aW5jbHVkaW5nIHRlc3RzIHdoaWNoIGNvdWxkIG5vdCBiZSBydW46Cj4gIHRlc3QtYW1kNjQtYW1k
NjQtcWVtdXUtbmVzdGVkLWludGVsIDE3IGRlYmlhbi1odm0taW5zdGFsbC9sMS9sMiBmYWlsIFJF
R1IuIHZzLiAxNDQwMzUKCkZyb20gbG9va2luZyBhdCB0aGlzIHNvbWUgSSBnZXQgdGhlIGltcHJl
c3Npb24gdGhhdCB0aGUgTDIgZ3Vlc3QKaXMgYnVzeS13YWl0aW5nIGluIGl0cyBib290IGxvYWRl
ci4gU2VlaW5nIHRoYXQgdGhlIHNhbWUgdGVzdAphbHNvIGZhaWxlZCBmb3IgNC4xMSwgaXQgZG9l
c24ndCBzZWVtIGVudGlyZWx5IGltcG9zc2libGUgdGhhdAp0aGUgZml4ZXMgZm9yIHRoZSB0d28g
WFNBcyBoYXZlIGNhdXNlZCBhIHJlZ3Jlc3Npb24gaGVyZS4gQW55Cm90aGVyIHRob3VnaHRzIC8g
aW5zaWdodHMgYW55b25lPwoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
