Return-Path: <SRS0=xJ9Z=25=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6785C282DD
	for <xen-devel@archiver.kernel.org>; Wed,  8 Jan 2020 16:59:10 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B166C20692
	for <xen-devel@archiver.kernel.org>; Wed,  8 Jan 2020 16:59:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B166C20692
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipEfa-0006uR-6S; Wed, 08 Jan 2020 16:58:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=jtyv=25=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ipEfY-0006uK-NV
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2020 16:58:56 +0000
X-Inumbo-ID: 232eaf62-3238-11ea-8599-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 232eaf62-3238-11ea-8599-bc764e2007e4;
 Wed, 08 Jan 2020 16:58:48 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 86D53ADC8;
 Wed,  8 Jan 2020 16:58:47 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20200108165716.9677-1-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5854340b-c561-5275-6655-28f91072a164@suse.com>
Date: Wed, 8 Jan 2020 17:58:46 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200108165716.9677-1-jgross@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] MAINTAINERS: fix malformed entry
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

T24gMDguMDEuMjAyMCAxNzo1NywgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBNQUlOVEFJTkVSUyBl
bnRyaWVzIHRhZ2dlZCB3aXRoICJMOiIgc2hvdWxkIGhhdmUgYSBwdXJlIG1haWwgYWRkcmVzcwo+
IGFzIHRoZSBzZWNvbmQgd29yZC4gRml4IGEgbWFsZm9ybWVkIGVudHJ5LiBPdGhlcndpc2UgYWRk
X21haW50YWluZXJzLnBsCj4gd2lsbCBwcm9kdWNlIGFuIGVtcHR5ICJDYzoiIGxpbmUuCj4gCj4g
U2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgoKQWNrZWQtYnk6
IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCk9mIGNvdXJzZSB0aGUgYWx0ZXJuYXRp
dmUgd291bGQgYmUgdG8gbWFrZSB0aGUgc2NyaXB0IGxlc3MgcGlja3kuCgpKYW4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
