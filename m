Return-Path: <SRS0=qeuA=Y6=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B6CDC5DF63
	for <xen-devel@archiver.kernel.org>; Wed,  6 Nov 2019 15:24:22 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 136632166E
	for <xen-devel@archiver.kernel.org>; Wed,  6 Nov 2019 15:24:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 136632166E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iSNA6-0004WY-Hz; Wed, 06 Nov 2019 15:23:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=cVPj=Y6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iSNA5-0004WT-LV
 for xen-devel@lists.xenproject.org; Wed, 06 Nov 2019 15:23:57 +0000
X-Inumbo-ID: 72cb5d10-00a9-11ea-a1ad-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 72cb5d10-00a9-11ea-a1ad-12813bfff9fa;
 Wed, 06 Nov 2019 15:23:56 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id CDA07AEED;
 Wed,  6 Nov 2019 15:23:55 +0000 (UTC)
To: Andrii Anisov <andrii.anisov@gmail.com>,
 Julien Grall <julien.grall@arm.com>
References: <1573031953-12894-1-git-send-email-andrii.anisov@gmail.com>
 <1573031953-12894-2-git-send-email-andrii.anisov@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b26dc4d7-069f-196e-2045-978f9a9c267e@suse.com>
Date: Wed, 6 Nov 2019 16:24:05 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1573031953-12894-2-git-send-email-andrii.anisov@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [RFC 1/7] xen: clang: Support correctly
 cross-compile
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDYuMTEuMjAxOSAxMDoxOSwgQW5kcmlpIEFuaXNvdiB3cm90ZToKPiAtLS0gYS9jb25maWcv
U3RkR05VLm1rCj4gKysrIGIvY29uZmlnL1N0ZEdOVS5tawo+IEBAIC0xLDggKzEsMTMgQEAKPiAg
QVMgICAgICAgICA9ICQoQ1JPU1NfQ09NUElMRSlhcwo+ICBMRCAgICAgICAgID0gJChDUk9TU19D
T01QSUxFKWxkCj4gIGlmZXEgKCQoY2xhbmcpLHkpCj4gLUNDICAgICAgICAgPSAkKENST1NTX0NP
TVBJTEUpY2xhbmcKPiAtQ1hYICAgICAgICA9ICQoQ1JPU1NfQ09NUElMRSljbGFuZysrCj4gK2lm
bmVxICgkKENST1NTX0NPTVBJTEUpLCkKPiArQ0MgICAgICAgICA9IGNsYW5nIC10YXJnZXQgJChD
Uk9TU19DT01QSUxFOi09KQo+ICtDWFggICAgICAgID0gY2xhbmcrKyAtdGFyZ2V0ICQoQ1JPU1Nf
Q09NUElMRTotPSkKCkFuZCB3aGF0IGd1YXJhbnRlZXMgdGhhdCAod2l0aCB0aGUgaHlwaGVucyBk
cm9wcGVkKSB0aGUgcHJlZml4CiQoQ1JPU1NfQ09NUElMRSkgb3JpZ2luYWxseSByZXByZXNlbnRz
IHRvIGEgdmFsaWQgdmFsdWUgZm9yCmNsYW5nJ3MgLXRhcmdldD8gUGxlYXNlIGRvbid0IGZvcmdl
dCB0aGF0IHBlb3BsZSBtYXkgdXNlIG5vbi0Kc3RhbmRhcmQgJChDUk9TU19DT01QSUxFKSBzZXR0
aW5nIGFzIHdlbGwgKHRvIGUuZy4gbWF0Y2ggdGhlaXIKbG9jYWwgc2V0dXAgb2YgaG93IHRvIGlu
dm9rZSBjcm9zcyBjb21waWxlcnMpLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
