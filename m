Return-Path: <SRS0=r37Z=4N=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18184C35E03
	for <xen-devel@archiver.kernel.org>; Tue, 25 Feb 2020 14:23:39 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E867D20658
	for <xen-devel@archiver.kernel.org>; Tue, 25 Feb 2020 14:23:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E867D20658
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6b7O-0005mL-Ge; Tue, 25 Feb 2020 14:23:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=g8Eh=4N=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j6b7N-0005mD-8U
 for xen-devel@lists.xenproject.org; Tue, 25 Feb 2020 14:23:25 +0000
X-Inumbo-ID: 61b8f0b8-57da-11ea-a490-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 61b8f0b8-57da-11ea-a490-bc764e2007e4;
 Tue, 25 Feb 2020 14:23:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B834AB14B;
 Tue, 25 Feb 2020 14:23:23 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200224142219.30690-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f0b8cde7-d4cd-ff81-54e3-0d5cc0c6e4cb@suse.com>
Date: Tue, 25 Feb 2020 15:23:30 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200224142219.30690-1-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/xmalloc Unify type handling in macros
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

T24gMjQuMDIuMjAyMCAxNToyMiwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBUaGUgbWFjcm9zIGlu
IHhtYWxsb2MuaCBhcmUgYSBtaXggb2YgdXNpbmcgdGhlaXIgdHlwZSBwYXJhbWV0ZXIgZGlyZWN0
bHksIGFuZAo+IHVzaW5nIHR5cGVvZigpLiAgU3dpdGNoIHVuaWZvcm1seSB0byB0aGUgbGF0dGVy
IHNvIGV4cHJlc3Npb25zIGNhbiBiZSB1c2VkLAo+IHJhdGhlciB0aGFuIG9ubHkgdHlwZSBuYW1l
cy4KCkFzIFJvZ2VyIHNheXMsIHRoZXJlJ3MgYSByZWFzb24gZm9yIHRoZSBzcGxpdC4gQW5kIGFz
IGEgcmVzdWx0Cm9mIHRoaXMgSSdtIGhhdmluZyB0cm91YmxlIHNlZWluZyBob3cgdGhpcyBjaGFu
Z2UgaXMgZ29pbmcgdG8KYmUgdXNlZnVsLiBIb3cgaXMgYSB1c2Ugb2YgdGhlc2UgZ29pbmcgdG8g
bG9vayBsaWtlPwoKdm9pZCB0ZXN0KHZvaWQpCnsKICAgIHN0cnVjdCBzICpwczsKCiAgICBwcyA9
IHhtYWxsb2MoKnBzKTsKfQoKaXMgZ2l2aW5nIHRoZSBhcHBlYXJhbmNlIG9mIGEgZGVyZWYgKG5v
dCBldmVuIGp1c3QgYSB1c2UpIG9mCmFuIHVuaW5pdGlhbGl6ZWQgdmFyaWFibGUuCgpIYXZpbmcg
c2VlbiBhbHNvIHlvdXIgcmVwbHkgdG8gUm9nZXIsIEkgdGhpbmsgd2l0aG91dCBhbnkKbWVudGlv
biBvZiB3aGF0IHVzZSB0aGlzIGlzIGdvaW5nIHRvIGJlIHRoZSB0YWtlYXdheSBmcm9tIHRoaXMK
aXMgcmF0aGVyICJsZXQncyBub3QgZG8gdGhpcyIuCgpJJ20gc29ycnksIHRoaXMgaXMgdW5saWtl
bHkgdG8gYmUgd2hhdCB5b3UnZCBsaWtlIHRvIGhlYXIgYmFjaywKSmFuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
