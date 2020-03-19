Return-Path: <SRS0=5+kv=5E=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBC11C4332D
	for <xen-devel@archiver.kernel.org>; Thu, 19 Mar 2020 13:59:21 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8FD2920658
	for <xen-devel@archiver.kernel.org>; Thu, 19 Mar 2020 13:59:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8FD2920658
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jEvhS-0004Bh-S1; Thu, 19 Mar 2020 13:59:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=UVx/=5E=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jEvhR-0004Bb-UF
 for xen-devel@lists.xenproject.org; Thu, 19 Mar 2020 13:59:05 +0000
X-Inumbo-ID: cb18f302-69e9-11ea-b34e-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cb18f302-69e9-11ea-b34e-bc764e2007e4;
 Thu, 19 Mar 2020 13:59:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id E524DAC1E;
 Thu, 19 Mar 2020 13:59:03 +0000 (UTC)
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
References: <20200313130614.27265-1-jgross@suse.com>
 <20200313130614.27265-2-jgross@suse.com>
 <b4662498-e705-8127-be67-6bf1b5930eb0@suse.com>
 <39aed3e5-d044-29a3-7072-6bcc2483039e@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b78c98a6-2a1e-1d1d-49fd-1c12e8b6c3ce@suse.com>
Date: Thu, 19 Mar 2020 14:59:02 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <39aed3e5-d044-29a3-7072-6bcc2483039e@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v6 1/4] xen/rcu: don't use
 stop_machine_run() for rcu_barrier()
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
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTkuMDMuMjAyMCAxMzowNiwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPiBPbiAxNy4wMy4yMCAx
NDo1NiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDEzLjAzLjIwMjAgMTQ6MDYsIEp1ZXJnZW4g
R3Jvc3Mgd3JvdGU6Cj4+PiArwqDCoMKgIGNwdW1hc2tfcmFpc2Vfc29mdGlycSgmY3B1X29ubGlu
ZV9tYXAsIFJDVV9TT0ZUSVJRKTsKPj4KPj4gSXNuJ3QgdGhlcmUgYW5vdGhlciBiYXJyaWVyIG5l
ZWRlZCBhaGVhZCBvZiB0aGlzLCB0byBvcmRlciBpdCB3cnQKPj4gdGhlIHNldD8KPiAKPiBObywg
SSBkb24ndCB0aGluayBzby4gY3B1bWFza19yYWlzZV9zb2Z0aXJxKCkgbmVlZHMgdG8gaGF2ZSBh
cHByb3ByaWF0ZQo+IG9yZGVyaW5nIHNlbWFudGljcyBhcyBvdGhlcndpc2UgdGhlIHNvZnRpcnEg
cGVuZGluZyBiaXQgd291bGRuJ3QgYmUKPiBndWFyYW50ZWVkIHRvIGJlIHNlZW4gYnkgc29mdGly
cSBwcm9jZXNzaW5nLgoKWW91IG1heSBoYXZlIGEgcG9pbnQgaGVyZSwgYnV0IEkgaGFkIGdpdmVu
IG15IGNvbW1lbnQgYWZ0ZXIKbG9va2luZyBhdCBjcHVtYXNrX3JhaXNlX3NvZnRpcnEoKSBhbmQg
bm90IGZpbmRpbmcgYW55IHN1Y2gKYmFycmllciB0aGVyZS4gT2gsIGFjdHVhbGx5IC0gc2V0X2Jp
dCgpIGFuZCB0ZXN0X2FuZF9zZXRfYml0KCkKZGlmZmVyIGluIHRoZWlyIGJhcnJpZXIgY2hhcmFj
dGVyaXN0aWNzOyBJIHdhc24ndCBhd2FyZSBvZgp0aGlzLgoKSmFuCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
