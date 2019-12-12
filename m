Return-Path: <SRS0=p1A9=2C=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B63CC43603
	for <xen-devel@archiver.kernel.org>; Thu, 12 Dec 2019 15:51:54 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F7AB205C9
	for <xen-devel@archiver.kernel.org>; Thu, 12 Dec 2019 15:51:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4F7AB205C9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifQkZ-0000yf-8Z; Thu, 12 Dec 2019 15:51:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=R5lD=2C=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ifQkX-0000ya-SJ
 for xen-devel@lists.xenproject.org; Thu, 12 Dec 2019 15:51:33 +0000
X-Inumbo-ID: 3f89f71c-1cf7-11ea-88e7-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3f89f71c-1cf7-11ea-88e7-bc764e2007e4;
 Thu, 12 Dec 2019 15:51:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 18C2AACD9;
 Thu, 12 Dec 2019 15:51:23 +0000 (UTC)
To: Ian Jackson <ian.jackson@citrix.com>
References: <osstest-144726-mainreport@xen.org>
 <24050.24437.97024.719788@mariner.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6ae910a6-933b-0b6a-6371-7cc6a09097b3@suse.com>
Date: Thu, 12 Dec 2019 16:51:44 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <24050.24437.97024.719788@mariner.uk.xensource.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [xen-4.8-testing test] 144726: regressions -
 trouble: fail/pass/starved
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
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIuMTIuMjAxOSAxNjo0MCwgSWFuIEphY2tzb24gd3JvdGU6Cj4gb3NzdGVzdCBzZXJ2aWNl
IG93bmVyIHdyaXRlcyAoIlt4ZW4tNC44LXRlc3RpbmcgdGVzdF0gMTQ0NzI2OiByZWdyZXNzaW9u
cyAtIHRyb3VibGU6IGZhaWwvcGFzcy9zdGFydmVkIik6Cj4+IGZsaWdodCAxNDQ3MjYgeGVuLTQu
OC10ZXN0aW5nIHJlYWwgW3JlYWxdCj4+IGh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnByb2plY3Qu
b3JnL29zc3Rlc3QvbG9ncy8xNDQ3MjYvCj4+Cj4+IFJlZ3Jlc3Npb25zIDotKAo+Pgo+PiBUZXN0
cyB3aGljaCBkaWQgbm90IHN1Y2NlZWQgYW5kIGFyZSBibG9ja2luZywKPj4gaW5jbHVkaW5nIHRl
c3RzIHdoaWNoIGNvdWxkIG5vdCBiZSBydW46Cj4+ICB0ZXN0LXh0Zi1hbWQ2NC1hbWQ2NC01IDUw
IHh0Zi90ZXN0LWh2bTY0LWxici10c3gtdm1lbnRyeSBmYWlsIFJFR1IuIHZzLiAxNDQ1NTgKPiAK
PiBTZWUgcGF0Y2ggYmVsb3cgZm9yIGFuYWx5c2lzLiAgQW5kcmV3LCB3b3VsZCB5b3UgcGxlYXNl
IHRha2UgYSBsb29rCj4gYW5kIGNoZWNrIHRoYXQgd2hhdCBJIHNhaWQgaXMgdHJ1ZS4KPiAKPiBJ
ZiBKYW4gYXBwcm92ZXMgd2lsbCBmb3JjZSBwdXNoIDQuOC10ZXN0aW5nLgoKSSBkby4gVGhhbmtz
LgoKPiBGcm9tIEp1ZXJnZW4gSSB3b3VsZCBsaWtlIGEgcmVsZWFzZS1hY2sgZm9yIHRoZSBvc3N0
ZXN0IGNvbW1pdCB0bwo+ICJhbGxvdyIgaXQgZm9yIHRoZSBmdXR1cmUuCgpJcyB0aGlzIHJlYWxs
eSB3b3J0aCBpdD8gVGhlIDQuOCB0cmVlIGlzIGRlYWQgbm93OyBzdHJpY3RseSBzcGVha2luZwpl
dmVuIHRoZSBsYXN0IGJhdGNoIG9mIFhTQXMgc2hvdWxkbid0IGhhdmUgZ29uZSB0aGVyZSBhbnlt
b3JlLCBidXQKd2UgZGlkIHNvIHRvIGJlIGZyaWVuZGx5IHRvIGNlcnRhaW4gZGlzdHJvcywgYXMg
aXQgd2FzIGp1c3QgYmFyZWx5CnBhc3QgdGhlIGV4cGlyeSBkYXRlLgoKSmFuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
