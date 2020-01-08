Return-Path: <SRS0=xJ9Z=25=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50FFEC282DD
	for <xen-devel@archiver.kernel.org>; Wed,  8 Jan 2020 13:32:12 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2EAEA20643
	for <xen-devel@archiver.kernel.org>; Wed,  8 Jan 2020 13:32:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2EAEA20643
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipBRE-0001BT-52; Wed, 08 Jan 2020 13:31:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=jtyv=25=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ipBRC-0001BL-Fd
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2020 13:31:54 +0000
X-Inumbo-ID: 3ba86079-321b-11ea-b7f5-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3ba86079-321b-11ea-b7f5-12813bfff9fa;
 Wed, 08 Jan 2020 13:31:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 16278AD0F;
 Wed,  8 Jan 2020 13:31:53 +0000 (UTC)
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
References: <20200108110148.18988-1-jgross@suse.com>
 <879882aa-9bd8-d56c-c567-fbd556361d97@suse.com>
 <a309620d-bb2d-b456-94b1-69f3a0c84d76@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d6abab52-151f-9c9c-6394-2e46af6dcf6f@suse.com>
Date: Wed, 8 Jan 2020 14:31:52 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <a309620d-bb2d-b456-94b1-69f3a0c84d76@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/x86: clear per cpu stub page
 information in cpu_smpboot_free()
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
Cc: xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDguMDEuMjAyMCAxNDoyNiwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPiBPbiAwOC4wMS4yMCAx
NDoyMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDA4LjAxLjIwMjAgMTI6MDEsIEp1ZXJnZW4g
R3Jvc3Mgd3JvdGU6Cj4+PiAtLS0gYS94ZW4vYXJjaC94ODYvc21wYm9vdC5jCj4+PiArKysgYi94
ZW4vYXJjaC94ODYvc21wYm9vdC5jCj4+PiBAQCAtOTQ1LDYgKzk0NSw4IEBAIHN0YXRpYyB2b2lk
IGNwdV9zbXBib290X2ZyZWUodW5zaWduZWQgaW50IGNwdSwgYm9vbCByZW1vdmUpCj4+PiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgKHBlcl9jcHUoc3R1YnMuYWRkciwgY3B1KSB8IH5Q
QUdFX01BU0spICsgMSk7Cj4+PiAgICAgICAgICAgaWYgKCBpID09IFNUVUJTX1BFUl9QQUdFICkK
Pj4+ICAgICAgICAgICAgICAgZnJlZV9kb21oZWFwX3BhZ2UobWZuX3RvX3BhZ2UobWZuKSk7Cj4+
PiArICAgICAgICBwZXJfY3B1KHN0dWJzLmFkZHIsIGNwdSkgPSAwOwo+Pj4gKyAgICAgICAgcGVy
X2NwdShzdHVicy5tZm4sIGNwdSkgPSAwOwo+Pj4gICAgICAgfQo+Pgo+PiBBZmFpY3QgdGhpcyB3
YXMgYSByZWdyZXNzaW9uIGZyb20gdGhlIGludHJvZHVjdGlvbiBvZiBDUFUgcGFya2luZzoKPj4g
UHJpb3IgdG8gdGhhdCwgcGVyLUNQVSBkYXRhIHdvdWxkIGhhdmUgYmVlbiB6ZXJvZWQgaW4gYWxs
IGNhc2VzCj4+IGJlZm9yZSBhIG5ldyBDUFUgd2FzIHVubGVhc2hlZC4gSSB0aGluayBpdCB3b3Vs
ZCBiZSBoZWxwZnVsIGl0Cj4+IHRoaXMgd2FzIG1lbnRpb25lZCBpbiB0aGUgZGVzY3JpcHRpb24g
KHBvc3NpYmx5IGJ5IHdheSBvZiBhIEZpeGVzOgo+PiB0YWcpLgo+IAo+IE9rYXksIHdpbGwgZG8u
IEp1c3QgdG8gYmUgc3VyZSAtIHlvdSBhcmUgdGhpbmtpbmcgb2YgY29tbWl0IDJlNmM4ZjE4Mj8K
ClllcywgdGhpcyBsb29rcyB0byBiZSB0aGUgb25lLgoKSmFuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
