Return-Path: <SRS0=r495=46=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9307C10DCE
	for <xen-devel@archiver.kernel.org>; Fri, 13 Mar 2020 08:48:45 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8582D20746
	for <xen-devel@archiver.kernel.org>; Fri, 13 Mar 2020 08:48:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8582D20746
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jCfzX-0006tH-Q0; Fri, 13 Mar 2020 08:48:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=9TpK=46=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jCfzX-0006t8-0V
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2020 08:48:27 +0000
X-Inumbo-ID: 674af0b4-6507-11ea-92cf-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 674af0b4-6507-11ea-92cf-bc764e2007e4;
 Fri, 13 Mar 2020 08:48:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7E75AAC52;
 Fri, 13 Mar 2020 08:48:25 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20200313080517.28728-1-jgross@suse.com>
 <20200313080517.28728-2-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <17a9b7ff-f287-6318-3d3b-daf7f4158fc7@suse.com>
Date: Fri, 13 Mar 2020 09:48:27 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200313080517.28728-2-jgross@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 1/2] xen/rwlocks: call preempt_disable()
 when taking a rwlock
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

T24gMTMuMDMuMjAyMCAwOTowNSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBTaW1pbGFyIHRvIHNw
aW5sb2NrcyBwcmVlbXB0aW9uIHNob3VsZCBiZSBkaXNhYmxlZCB3aGlsZSBob2xkaW5nIGEKPiBy
d2xvY2suCj4gCj4gU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29t
PgoKSnVzdCBvbmUgbm90ZS9xdWVzdGlvbjoKCj4gQEAgLTMwOCw2ICszMjMsNyBAQCBzdGF0aWMg
aW5saW5lIHZvaWQgX3BlcmNwdV9yZWFkX3VubG9jayhwZXJjcHVfcndsb2NrX3QgKipwZXJfY3B1
ZGF0YSwKPiAgICAgICAgICByZXR1cm47Cj4gICAgICB9Cj4gICAgICB0aGlzX2NwdV9wdHIocGVy
X2NwdWRhdGEpID0gTlVMTDsKPiArICAgIHByZWVtcHRfZW5hYmxlKCk7Cj4gICAgICBzbXBfd21i
KCk7Cj4gIH0KCkl0IHdvdWxkIHNlZW0gbW9yZSBsb2dpY2FsIHRvIG1lIHRvIGluc2VydCB0aGlz
IGFmdGVyIHRoZSBzbXBfd21iKCkuClRob3VnaHRzPyBJJ2xsIGJlIGhhcHB5IHRvIGdpdmUgbXkg
Ui1iIG9uY2Ugd2UndmUgc2V0dGxlZCBvbiB0aGlzLgoKSmFuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
