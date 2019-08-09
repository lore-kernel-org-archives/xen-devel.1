Return-Path: <SRS0=M4UH=WF=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D35A2C433FF
	for <xen-devel@archiver.kernel.org>; Fri,  9 Aug 2019 07:13:10 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A9871208C4
	for <xen-devel@archiver.kernel.org>; Fri,  9 Aug 2019 07:13:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A9871208C4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvz56-0003Om-17; Fri, 09 Aug 2019 07:12:56 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=kmRG=WF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hvz55-0003Oh-0j
 for xen-devel@lists.xenproject.org; Fri, 09 Aug 2019 07:12:55 +0000
X-Inumbo-ID: 1aa7498b-ba75-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 1aa7498b-ba75-11e9-8980-bc764e045a96;
 Fri, 09 Aug 2019 07:12:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 8F635AFCE;
 Fri,  9 Aug 2019 07:12:52 +0000 (UTC)
To: Eslam Elnikety <elnikety@amazon.com>
References: <20190807174223.67590-1-elnikety@amazon.com>
 <5752a9af-ec3b-1401-13d9-4b93bdd99d72@suse.com>
 <4FAA00A4-7025-4882-88C1-C8C5FEEAD18C@amazon.com>
 <bbfb372f-013f-461a-af50-5ac95c5c2d27@suse.com>
 <4fc14ea7-8b86-8c45-bc2c-df02b380553a@amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5f61cf23-75b5-fb94-3b35-07d6ca62b468@suse.com>
Date: Fri, 9 Aug 2019 09:12:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <4fc14ea7-8b86-8c45-bc2c-df02b380553a@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] evtchn: make support for different ABIs
 tunable
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 Anthony PERARD <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 David Woodhouse <dwmw@amazon.co.uk>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDguMDguMjAxOSAyMDo1NCwgRXNsYW0gRWxuaWtldHkgd3JvdGU6Cj4gSSB0YWtlIGl0IHRo
YXQgdGhlIGNvbmNlcm4gaGVyZSBpcyB0aGF0IHdoYXRldmVyIGNoYW5nZXMgdGhlIHBhdGNoCj4g
cHJvcG9zZXMgc2hvdWxkIHBsYXkgbmljZWx5IHdpdGggcG90ZW50aWFsIGZ1dHVyZSBjaGFuZ2Vz
IGludHJvZHVjaW5nCj4gc3VjaCBhIGdlbmVyaWMgZnJhbWV3b3JrLiBBbnkgY29uY3JldGUgc3Vn
Z2VzdGlvbnM/CgpXZWxsLCBpbnZvbHZlZCBkb21jdGwocykgY2FuIGJlIGNoYW5nZWQgYXQgYW55
IHRpbWUsIHNvIHRoZQptYWluIHF1ZXN0aW9uIGlzIHdoZXRoZXIgYXQgdGhlIGd1ZXN0IGNvbmZp
ZyBsZXZlbCB0aGlzIHdhbnRzCnRvIGJlIGV4cHJlc3NlZCBpbiBhIG1vcmUgZm9yd2FyZCBjb21w
YXRpYmxlIG1hbm5lci4gQnV0IHRoYXQncwphIHF1ZXN0aW9uIEknZCBsaWtlIHRvIGRlZmVyIHRv
IHBlb3BsZSBtb3JlIGZhbWlsaWFyIHdpdGggdGhlCmdlbmVyYWwgcHJpbmNpcGxlcyBvZiBob3cg
Z3Vlc3QgY29uZmlnIGZpbGUgaGFuZGxpbmcgc2hvdWxkIGJlCmV4dGVuZGVkLgoKSmFuCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
