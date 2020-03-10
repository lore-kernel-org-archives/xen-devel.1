Return-Path: <SRS0=Qyg3=43=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79D0DC10F27
	for <xen-devel@archiver.kernel.org>; Tue, 10 Mar 2020 13:56:59 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4858221D7E
	for <xen-devel@archiver.kernel.org>; Tue, 10 Mar 2020 13:56:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4858221D7E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBfNC-0006Jh-Qv; Tue, 10 Mar 2020 13:56:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=EhAh=43=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jBfNB-0006Jc-Og
 for xen-devel@lists.xenproject.org; Tue, 10 Mar 2020 13:56:41 +0000
X-Inumbo-ID: f7afc4e6-62d6-11ea-ada5-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f7afc4e6-62d6-11ea-ada5-12813bfff9fa;
 Tue, 10 Mar 2020 13:56:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 24B6DAE63;
 Tue, 10 Mar 2020 13:56:40 +0000 (UTC)
To: paul@xen.org
References: <20200310124353.4337-1-paul@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <cb92de03-a210-ea3e-ad73-c0c817e29c4b@suse.com>
Date: Tue, 10 Mar 2020 14:56:38 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200310124353.4337-1-paul@xen.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v5] x86: irq: Do not BUG_ON multiple unbind
 calls for shared pirqs
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
Cc: xen-devel@lists.xenproject.org, Varad Gautam <vrd@amazon.de>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTAuMDMuMjAyMCAxMzo0MywgcGF1bEB4ZW4ub3JnIHdyb3RlOgo+IHY1Ogo+ICAtIEJVR19P
Tighc2hhcmVhYmxlKSByYXRoZXIgdGhhbiBBU1NFUlQoc2hhcmVhYmxlKQo+ICAtIERyb3AgQVNT
RVJUIG9uIG5yX2d1ZXN0cwoKV2h5IGRyb3AsIHJhdGhlciB0aGFuIG1vdmUgLi4uCgo+IC0tLSBh
L3hlbi9hcmNoL3g4Ni9pcnEuYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9pcnEuYwo+IEBAIC0xNjgw
LDkgKzE2ODAsMjIgQEAgc3RhdGljIGlycV9ndWVzdF9hY3Rpb25fdCAqX19waXJxX2d1ZXN0X3Vu
YmluZCgKPiAgCj4gICAgICBCVUdfT04oIShkZXNjLT5zdGF0dXMgJiBJUlFfR1VFU1QpKTsKPiAg
Cj4gLSAgICBmb3IgKCBpID0gMDsgKGkgPCBhY3Rpb24tPm5yX2d1ZXN0cykgJiYgKGFjdGlvbi0+
Z3Vlc3RbaV0gIT0gZCk7IGkrKyApCj4gLSAgICAgICAgY29udGludWU7Cj4gLSAgICBCVUdfT04o
aSA9PSBhY3Rpb24tPm5yX2d1ZXN0cyk7Cj4gKyAgICBmb3IgKCBpID0gMDsgaSA8IGFjdGlvbi0+
bnJfZ3Vlc3RzOyBpKysgKQo+ICsgICAgICAgIGlmICggYWN0aW9uLT5ndWVzdFtpXSA9PSBkICkK
PiArICAgICAgICAgICAgYnJlYWs7Cj4gKwo+ICsgICAgaWYgKCBpID09IGFjdGlvbi0+bnJfZ3Vl
c3RzICkgLyogTm8gbWF0Y2hpbmcgZW50cnkgKi8KPiArICAgIHsKCi4uLiBiYWNrIGhlcmU/IChU
aGlzIHdvdWxkIGJlIGVhc3kgZW5vdWdoIHRvIHRha2UgY2FyZSBvZiB3aGlsZQpjb21taXR0aW5n
LCBpZmYgd2UgZGVjaWRlZCB0byBnbyB3aXRoIHRoaXMgdmFyaWFudC4pCgpKYW4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
