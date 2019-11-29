Return-Path: <SRS0=4rCt=ZV=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 984E0C432C0
	for <xen-devel@archiver.kernel.org>; Fri, 29 Nov 2019 14:20:49 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F50A215A5
	for <xen-devel@archiver.kernel.org>; Fri, 29 Nov 2019 14:20:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F50A215A5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iah8K-00013g-1d; Fri, 29 Nov 2019 14:20:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=lAOS=ZV=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iah8I-00013X-3C
 for xen-devel@lists.xenproject.org; Fri, 29 Nov 2019 14:20:30 +0000
X-Inumbo-ID: 651e3bb2-12b3-11ea-83b8-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 651e3bb2-12b3-11ea-83b8-bc764e2007e4;
 Fri, 29 Nov 2019 14:20:29 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id B3F6CB2C0;
 Fri, 29 Nov 2019 14:20:28 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <909ca24b-e673-e786-06b4-c8877288248b@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <b32c1c79-1c62-f43b-86b8-8a6b68e026db@suse.com>
Date: Fri, 29 Nov 2019 15:20:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <909ca24b-e673-e786-06b4-c8877288248b@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] console: avoid buffer overrun in
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjkuMTEuMTkgMTU6MTUsIEphbiBCZXVsaWNoIHdyb3RlOgo+IGNvbnJpbmdfcHV0cygpIGhh
cyBiZWVuIHJlcXVpcmluZyBhIG51bC10ZXJtaW5hdGVkIHN0cmluZywgd2hpY2ggdGhlCj4gbG9j
YWwga2J1ZltdIGRvZXNuJ3QgZ2V0IHNldCBmb3IgYW55bW9yZS4gQWRkIGEgbGVuZ3RoIHBhcmFt
ZXRlciB0byB0aGUKPiBmdW5jdGlvbiwganVzdCBsaWtlIHdhcyBkb25lIGZvciBvdGhlcnMsIHRo
dXMgYWxsb3dpbmcgZW1iZWRkZWQgbnVsIHRvCj4gYWxzbyBiZSByZWFkIHRocm91Z2ggWEVOX1NZ
U0NUTF9yZWFkY29uc29sZS4KPiAKPiBXaGlsZSB0aGVyZSBkcm9wIGEgc3RyYXkgY2FzdDogQm90
aCBvcGVyYW5kcyBvZiAtIGFyZSBhbHJlYWR5IHVpbnQzMl90Lgo+IAo+IEZpeGVzOiBlYTYwMWVj
OTk5NWIgKCJ4ZW4vY29uc29sZTogUmV3b3JrIEhZUEVSQ0FMTF9jb25zb2xlX2lvIGludGVyZmFj
ZSIpCj4gUmVwb3J0ZWQtYnk6IErDvHJnZW4gR3Jvw58gPGpncm9zc0BzdXNlLmNvbT4KPiBTaWdu
ZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpSZXZpZXdlZC1ieTog
SnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgpSZWxlYXNlLWFja2VkLWJ5OiBKdWVyZ2Vu
IEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+CgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
