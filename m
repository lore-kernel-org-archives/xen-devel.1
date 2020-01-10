Return-Path: <SRS0=y94i=27=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94FBDC282DD
	for <xen-devel@archiver.kernel.org>; Fri, 10 Jan 2020 16:48:12 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6CBF0206ED
	for <xen-devel@archiver.kernel.org>; Fri, 10 Jan 2020 16:48:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6CBF0206ED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipxRz-0004Xd-JB; Fri, 10 Jan 2020 16:47:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=xm9j=27=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ipxRx-0004XX-R9
 for xen-devel@lists.xenproject.org; Fri, 10 Jan 2020 16:47:53 +0000
X-Inumbo-ID: ecb355ea-33c8-11ea-a985-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ecb355ea-33c8-11ea-a985-bc764e2007e4;
 Fri, 10 Jan 2020 16:47:45 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 1F2F6B257;
 Fri, 10 Jan 2020 16:47:44 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200109193241.14542-1-andrew.cooper3@citrix.com>
 <20200109193241.14542-3-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <95b15f66-1a26-aece-7bc5-f3633c0993d1@suse.com>
Date: Fri, 10 Jan 2020 17:47:45 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200109193241.14542-3-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 2/4] x86/boot: Clean up l?_bootmap[]
 construction
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkuMDEuMjAyMCAyMDozMiwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBUaGUgbmVlZCBmb3Ig
WGVuIHRvIGJlIGlkZW50aXR5IG1hcHBlZCBpbnRvIHRoZSBib290bWFwIGlzIG5vdCBvYnZpb3Vz
LCBhbmQKPiBkaWZmZXJzIGJldHdlZW4gdGhlIE1CIGFuZCBFRkkgYm9vdCBwYXRocy4KPiAKPiBU
aGUgRUZJIHNpZGUgaXMgZnVydGhlciBjb21wbGljYXRlZCBieSBhbiBhdHRlbXB0IHRvIGNvcGUg
d2l0aCB3aXRoIGwyX2Jvb3RtYXAKPiBvbmx5IGJlaW5nIDRrIGxvbmcuICBUaGlzIGlzIHVuZG9j
dW1lbnRlZCwgY29uZnVzaW5nLCBvbmx5IHdvcmtzIGlmIFhlbiBpcyB0aGUKPiBzaW5nbGUgb2Jq
ZWN0IHdhbnRpbmcgbWFwcGluZy4KPiAKPiBUaGUgcGFnZWFibGVzIGFyZSBjb21tb24gdG8gYm90
aCB0aGUgTUIgYW5kIEVGSSBidWlsZHMsIHNvIHNpbXBsaWZ5IHRoZSBFRkkKPiBib290bWFwIGNv
bnN0cnVjdGlvbiBjb2RlIHRvIG1ha2UgZXhhY3RseSBvbmUgaWRlbnRpdHktbWFwIG9mIFhlbiwg
d2hpY2ggbm93Cj4gbWFrZXMgdGhlIHR3byBwYXRocyBjb25zaXN0ZW50LiAgQ29tbWVudCBib3Ro
IHBpZWNlcyBvZiBsb2dpYywgZXhwbGFpbmluZyB3aGF0Cj4gdGhlIG1hcHBpbmdzIGFyZSBuZWVk
ZWQgZm9yLgo+IAo+IEZpbmFsbHksIGxlYXZlIGEgbGlua2VyIGFzc2VydCBjb3ZlcmluZyB0aGUg
ZmFjdCB0aGF0IHBsZW50eSBvZiBjb2RlIGJsaW5kbHkKPiBhc3N1bWVzIHRoYXQgWGVuIGlzIGxl
c3MgdGhhdCAxNk0uICBUaGlzIHdhbnRzIGZpeGluZyBpbiBkdWUgY291cnNlLgo+IAo+IFNpZ25l
ZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgpSZXZp
ZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
