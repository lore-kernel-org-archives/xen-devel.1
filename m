Return-Path: <SRS0=O6u+=2A=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44CB9C43603
	for <xen-devel@archiver.kernel.org>; Tue, 10 Dec 2019 10:11:12 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C2CC2077B
	for <xen-devel@archiver.kernel.org>; Tue, 10 Dec 2019 10:11:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1C2CC2077B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iecTu-0006mF-1D; Tue, 10 Dec 2019 10:11:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=1mH3=2A=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iecTs-0006m7-A7
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2019 10:11:00 +0000
X-Inumbo-ID: 5c2f8a31-1b35-11ea-8914-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5c2f8a31-1b35-11ea-8914-12813bfff9fa;
 Tue, 10 Dec 2019 10:10:59 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id ED8AEAFF1;
 Tue, 10 Dec 2019 10:10:58 +0000 (UTC)
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20191209173757.46833-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d2709b23-ea42-e3aa-7018-4d4d93f6c0ee@suse.com>
Date: Tue, 10 Dec 2019 11:11:18 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191209173757.46833-1-roger.pau@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4] x86: do not enable global pages when
 virtualized on AMD hardware
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
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkuMTIuMjAxOSAxODozNywgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IC0tLSBhL3hlbi9h
cmNoL3g4Ni9wdi9kb21haW4uYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9wdi9kb21haW4uYwo+IEBA
IC0xMTgsNiArMTE4LDE5IEBAIHVuc2lnbmVkIGxvbmcgcHZfZml4dXBfZ3Vlc3RfY3I0KGNvbnN0
IHN0cnVjdCB2Y3B1ICp2LCB1bnNpZ25lZCBsb25nIGNyNCkKPiAgICAgICAgICAgICAgKG1tdV9j
cjRfZmVhdHVyZXMgJiBQVl9DUjRfR1VFU1RfVklTSUJMRV9NQVNLKSk7Cj4gIH0KPiAgCj4gK3N0
YXRpYyBpbnQ4X3QgX19yZWFkX21vc3RseSBvcHRfZ2xvYmFsX3BhZ2VzID0gLTE7Cj4gK2Jvb2xl
YW5fcnVudGltZV9wYXJhbSgiZ2xvYmFsLXBhZ2VzIiwgb3B0X2dsb2JhbF9wYWdlcyk7Cj4gKwo+
ICtzdGF0aWMgaW50IF9faW5pdCBwZ2VfaW5pdCh2b2lkKQo+ICt7Cj4gKyAgICBpZiAoIG9wdF9n
bG9iYWxfcGFnZXMgPT0gLTEgKQo+ICsgICAgICAgIG9wdF9nbG9iYWxfcGFnZXMgPSAhY3B1X2hh
c19oeXBlcnZpc29yIHx8Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgIGJvb3RfY3B1X2Rh
dGEueDg2X3ZlbmRvciAhPSBYODZfVkVORE9SX0FNRDsKCkkgd2FzIGFib3V0IHRvIGNvbW1pdCB0
aGlzIHdoZW4gSSBub3RpY2VkIC0gd2hhdCBhYm91dCBIeWdvbiBoZXJlPwpJJ20gaGFwcHkgdG8g
bWFrZSB0aGUgYWRqdXN0bWVudCB3aGlsZSBjb21taXR0aW5nLCBidXQgSSBkb24ndAp3YW50IHRv
IGRvIHNvIHdpdGhvdXQgeW91ciBjb25zZW50LgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
