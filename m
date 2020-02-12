Return-Path: <SRS0=1nYC=4A=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72A86C2BA83
	for <xen-devel@archiver.kernel.org>; Wed, 12 Feb 2020 09:32:16 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A9F82073C
	for <xen-devel@archiver.kernel.org>; Wed, 12 Feb 2020 09:32:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4A9F82073C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j1oNI-0002bh-RK; Wed, 12 Feb 2020 09:32:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=JFaq=4A=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j1oNH-0002bc-KL
 for xen-devel@lists.xen.org; Wed, 12 Feb 2020 09:32:03 +0000
X-Inumbo-ID: 86443dd0-4d7a-11ea-ade5-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 86443dd0-4d7a-11ea-ade5-bc764e2007e4;
 Wed, 12 Feb 2020 09:32:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 4F5CCADDA;
 Wed, 12 Feb 2020 09:32:01 +0000 (UTC)
To: Sergey Dyasli <sergey.dyasli@citrix.com>
References: <20200211134220.9194-1-sergey.dyasli@citrix.com>
 <20200211134220.9194-2-sergey.dyasli@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c9c2e957-bb95-0f54-f8cf-57c6b0cd0f55@suse.com>
Date: Wed, 12 Feb 2020 10:32:01 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200211134220.9194-2-sergey.dyasli@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 1/2] xsm: add Kconfig option for denied
 string
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
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xen.org,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>, Doug Goldstein <cardoe@cardoe.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEuMDIuMjAyMCAxNDo0MiwgU2VyZ2V5IER5YXNsaSB3cm90ZToKPiAtLS0gYS94ZW4vY29t
bW9uL0tjb25maWcKPiArKysgYi94ZW4vY29tbW9uL0tjb25maWcKPiBAQCAtMjI4LDYgKzIyOCwx
NCBAQCBjaG9pY2UKPiAgCQlib29sICJTSUxPIiBpZiBYU01fU0lMTwo+ICBlbmRjaG9pY2UKPiAg
Cj4gK2NvbmZpZyBYU01fREVOSUVEX1NUUklORwo+ICsJc3RyaW5nICJ4ZW5fdmVyc2lvbiBoeXBl
cmNhbGwgZGVuaWVkIGluZm9ybWF0aW9uIHJlcGxhY2VtZW50IHN0cmluZyIKPiArCWRlZmF1bHQg
IjxkZW5pZWQ+Igo+ICsJZGVwZW5kcyBvbiBYU00KCldoeSB3b3VsZCB0aGlzIHN0cmluZyB3YW50
IHRvIGJlIGNvbmZpZ3VyYWJsZSBvbmx5IGluIFhTTS0KZW5hYmxlZCBidWlsZHM/CgpKYW4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
