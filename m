Return-Path: <SRS0=M2I+=XV=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=FROM_EXCESS_BASE64,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 743EAC4360C
	for <xen-devel@archiver.kernel.org>; Thu, 26 Sep 2019 12:38:13 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F9CC21655
	for <xen-devel@archiver.kernel.org>; Thu, 26 Sep 2019 12:38:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4F9CC21655
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDT23-00013O-F0; Thu, 26 Sep 2019 12:38:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=t6lf=XV=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iDT21-000136-Oa
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 12:38:01 +0000
X-Inumbo-ID: 796d043a-e05a-11e9-9650-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 796d043a-e05a-11e9-9650-12813bfff9fa;
 Thu, 26 Sep 2019 12:38:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 78B09B12A;
 Thu, 26 Sep 2019 12:37:59 +0000 (UTC)
To: Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
References: <20190914085251.18816-1-jgross@suse.com>
 <20190914085251.18816-48-jgross@suse.com>
 <f6cae9fa652707ec7548cd0929f9aa06fcd8affc.camel@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <bddb9939-9c68-304d-517e-95368d2fb675@suse.com>
Date: Thu, 26 Sep 2019 14:37:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <f6cae9fa652707ec7548cd0929f9aa06fcd8affc.camel@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 47/47] xen/sched: add scheduling
 granularity enum
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
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjYuMDkuMTkgMTE6NDYsIERhcmlvIEZhZ2dpb2xpIHdyb3RlOgo+IE9uIFNhdCwgMjAxOS0w
OS0xNCBhdCAxMDo1MiArMDIwMCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4gQWRkIGEgc2NoZWR1
bGluZyBncmFudWxhcml0eSBlbnVtICgiY3B1IiwgImNvcmUiLCAic29ja2V0IikgZm9yCj4+IHNw
ZWNpZmljYXRpb24gb2YgdGhlIHNjaGVkdWxpbmcgZ3JhbnVsYXJpdHkuIEluaXRpYWxseSBpdCBp
cyBzZXQgdG8KPj4gImNwdSIsIHRoaXMgY2FuIGJlIG1vZGlmaWVkIGJ5IHRoZSBuZXcgYm9vdCBw
YXJhbWV0ZXIgKHg4NiBvbmx5KQo+PiAic2NoZWQtZ3JhbiIuCj4+Cj4+IEFjY29yZGluZyB0byB0
aGUgc2VsZWN0ZWQgZ3JhbnVsYXJpdHkgc2NoZWRfZ3JhbnVsYXJpdHkgaXMgc2V0IGFmdGVyCj4+
IGFsbCBjcHVzIGFyZSBvbmxpbmUuCj4+Cj4+IEEgdGVzdCBpcyBhZGRlZCBmb3IgYWxsIHNjaGVk
IHJlc291cmNlcyBob2xkaW5nIHRoZSBzYW1lIG51bWJlciBvZgo+PiBjcHVzLiBGYWxsIGJhY2sg
dG8gY29yZS0gb3IgY3B1LXNjaGVkdWxpbmcgaW4gdGhhdCBjYXNlLgo+Pgo+PiBTaWduZWQtb2Zm
LWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Cj4+Cj4gUmV2aWV3ZWQtYnk6IERh
cmlvIEZhZ2dpb2xpIDxkZmFnZ2lvbGlAc3VzZS5jb20+CgpEb2VzIHRoaXMgc3RpbGwgc3RhbmQg
d2l0aCBtb3ZpbmcgYWxsIGNvZGUgb2YgdGhpcyBwYXRjaCB0bwpjcHVwb29sLmM/IFRoYXQgd291
bGQgYXZvaWQgbWFraW5nIHNvbWUgdmFyaWFibGVzL2Z1bmN0aW9ucyBnbG9iYWxseQp2aXNpYmxl
LgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
