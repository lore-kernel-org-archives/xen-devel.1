Return-Path: <SRS0=4rCt=ZV=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF6ACC432C0
	for <xen-devel@archiver.kernel.org>; Fri, 29 Nov 2019 10:23:00 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C6484215F1
	for <xen-devel@archiver.kernel.org>; Fri, 29 Nov 2019 10:23:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C6484215F1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iadQ9-0000mp-Kf; Fri, 29 Nov 2019 10:22:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=mjd+=ZV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iadQ8-0000mk-Jy
 for xen-devel@lists.xenproject.org; Fri, 29 Nov 2019 10:22:40 +0000
X-Inumbo-ID: 2bad94d4-1292-11ea-a3e0-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2bad94d4-1292-11ea-a3e0-12813bfff9fa;
 Fri, 29 Nov 2019 10:22:40 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 103F5AF63;
 Fri, 29 Nov 2019 10:22:39 +0000 (UTC)
To: Paul Durrant <pdurrant@amazon.com>
References: <20191128165224.2959-1-pdurrant@amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <98816869-c1db-52c1-baba-b878cde88d7a@suse.com>
Date: Fri, 29 Nov 2019 11:22:47 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191128165224.2959-1-pdurrant@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH-for-4.13 v5] Rationalize max_grant_frames
 and max_maptrack_frames handling
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
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjguMTEuMjAxOSAxNzo1MiwgUGF1bCBEdXJyYW50IHdyb3RlOgo+IC0tLSBhL3hlbi9jb21t
b24vZ3JhbnRfdGFibGUuYwo+ICsrKyBiL3hlbi9jb21tb24vZ3JhbnRfdGFibGUuYwo+IEBAIC04
NCwxMSArODQsNDAgQEAgc3RydWN0IGdyYW50X3RhYmxlIHsKPiAgICAgIHN0cnVjdCBncmFudF90
YWJsZV9hcmNoIGFyY2g7Cj4gIH07Cj4gIAo+ICtzdGF0aWMgaW50IHBhcnNlX2dudHRhYl9saW1p
dChjb25zdCBjaGFyICpwYXJhbSwgY29uc3QgY2hhciAqYXJnLAo+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgKnZhbHApCj4gK3sKPiArICAgIGNvbnN0IGNoYXIg
KmU7Cj4gKyAgICB1bnNpZ25lZCBsb25nIHZhbDsKPiArCj4gKyAgICB2YWwgPSBzaW1wbGVfc3Ry
dG91bChhcmcsICZlLCAwKTsKPiArICAgIGlmICggKmUgKQo+ICsgICAgICAgIHJldHVybiAtRUlO
VkFMOwo+ICsKPiArICAgIGlmICggdmFsID4gSU5UX01BWCApCj4gKyAgICAgICAgcmV0dXJuIC1F
UkFOR0U7Cj4gKwo+ICsgICAgcmV0dXJuIDA7Cj4gK30KCip2YWxwIGRvZXNuJ3QgZ2V0IHdyaXR0
ZW4gdG8gYW55bW9yZS4gV2l0aCB0aGlzIGZpeGVkIChhbmQgbm8gbmV3Cmlzc3VlcyBpbnRyb2R1
Y2VkIDstKSApIGh5cGVydmlzb3Igc2lkZQpSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVs
aWNoQHN1c2UuY29tPgoKQXMgYW4gYWRkaXRpb25hbCByZW1hcmsgKG5vdCBmb3IgdGhpcyBwYXRj
aCkgLSB0aGUgb3JpZ2luYWwgd3JvbmcKdXNlIG9mIF9faW5pdCBpbiB2NCBjb3VsZCBoYXZlIGJl
ZW4gcmVwbGFjZWQgYnkgX19jb2xkLiBCdXQgSQpndWVzcyB3ZSBtYXkgd2FudCB0byBjb25zaWRl
ciBhZGRpbmcgc3VjaCBpbiBhIHdpZGVyIGZhc2hpb24uCgpKYW4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
