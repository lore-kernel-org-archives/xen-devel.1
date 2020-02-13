Return-Path: <SRS0=/EcG=4B=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64551C2BA83
	for <xen-devel@archiver.kernel.org>; Thu, 13 Feb 2020 10:01:32 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C9232073C
	for <xen-devel@archiver.kernel.org>; Thu, 13 Feb 2020 10:01:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3C9232073C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j2BJB-0006MU-H1; Thu, 13 Feb 2020 10:01:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=06QY=4B=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1j2BJ9-0006ML-Qd
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2020 10:01:19 +0000
X-Inumbo-ID: c7270d64-4e47-11ea-b870-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c7270d64-4e47-11ea-b870-12813bfff9fa;
 Thu, 13 Feb 2020 10:01:18 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 813A1ACD6;
 Thu, 13 Feb 2020 10:01:17 +0000 (UTC)
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
References: <20200211093527.6811-1-jgross@suse.com>
 <d11ca0a6-652a-13d8-864a-82893f0969cc@xen.org>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <fd9c5b57-001c-cecb-d42f-ab02ef6e8f36@suse.com>
Date: Thu, 13 Feb 2020 11:01:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <d11ca0a6-652a-13d8-864a-82893f0969cc@xen.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen: make sure stop_machine_run() is always
 called in a tasklet
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
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTMuMDIuMjAgMTA6MDEsIEp1bGllbiBHcmFsbCB3cm90ZToKPiBIaSwKPiAKPiBPbiAxMS8w
Mi8yMDIwIDEwOjM1LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+PiBXaXRoIGNvcmUgc2NoZWR1bGlu
ZyBhY3RpdmUgaXQgaXMgbWFuZGF0b3J5IGZvciBzdG9wX21hY2hpbmVfcnVuKCkgdG8KPj4gYmUg
Y2FsbGVkIGluIGEgdGFza2xldCBvbmx5LCBhcyBvdGhlcndpc2UgYSBzY2hlZHVsaW5nIGRlYWRs
b2NrIHdvdWxkCj4+IG9jY3VyOiBzdG9wX21hY2hpbmVfcnVuKCkgZG9lcyBhIGNwdSByZW5kZXp2
b3VzIGJ5IGFjdGl2YXRpbmcgYSB0YXNrbGV0Cj4+IG9uIGFsbCBvdGhlciBjcHVzLiBJbiBjYXNl
IHN0b3BfbWFjaGluZV9ydW4oKSB3YXMgbm90IGNhbGxlZCBpbiBhbiBpZGxlCj4+IHZjcHUgaXQg
d291bGQgYmxvY2sgc2NoZWR1bGluZyB0aGUgaWRsZSB2Y3B1IG9uIGl0cyBzaWJsaW5ncyB3aXRo
IGNvcmUKPj4gc2NoZWR1bGluZyBiZWluZyBhY3RpdmUsIHJlc3VsdGluZyBpbiBhIGhhbmcuCj4g
Cj4gVGhpcyBzdWdnZXN0cyBpdCBpcyBub3Qgc2FmZSB0byBjYWxsIHN0b3BfbWFjaGluZV9ydW4o
KSBvdXRzaWRlIGEgCj4gdGFza2xldCBidXQgc3RpbGwgdW5kZXIgImlkbGUgdkNQVSIgY29udGV4
dC4gSG93ZXZlciwgYWx0ZXJuYXRpdmUgCj4gcGF0Y2hpbmcgb24gQXJtIGR1cmluZyBib290IHdp
bGwgbm90IGJlIGluIGEgdGFza2xldC4gSXMgaXQgZ29pbmcgdG8gYmUgCj4gc2FmZT8KClllcy4K
CkkgY2FuIHJlcGhyYXNlIHRoYXQgcGFydCB0byBtYWtlIGl0IGNsZWFyLgoKCkp1ZXJnZW4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
