Return-Path: <SRS0=CxSR=XP=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4F94C49ED7
	for <xen-devel@archiver.kernel.org>; Fri, 20 Sep 2019 11:15:20 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9668520882
	for <xen-devel@archiver.kernel.org>; Fri, 20 Sep 2019 11:15:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9668520882
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iBGsO-0005nv-TC; Fri, 20 Sep 2019 11:15:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=qXnC=XP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iBGsN-0005nl-MP
 for xen-devel@lists.xenproject.org; Fri, 20 Sep 2019 11:14:59 +0000
X-Inumbo-ID: e13e8164-db97-11e9-978d-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e13e8164-db97-11e9-978d-bc764e2007e4;
 Fri, 20 Sep 2019 11:14:58 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 37EE2AC52;
 Fri, 20 Sep 2019 11:14:57 +0000 (UTC)
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20190903161428.7159-1-roger.pau@citrix.com>
 <20190903161428.7159-6-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <56846f60-fcea-2bef-77b5-84e04e01f98a@suse.com>
Date: Fri, 20 Sep 2019 13:15:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190903161428.7159-6-roger.pau@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 05/11] ioreq: add internal ioreq
 initialization support
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
Cc: xen-devel@lists.xenproject.org, Paul Durrant <paul.durrant@citrix.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMuMDkuMjAxOSAxODoxNCwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IEBAIC04MjEsNiAr
ODUxLDkgQEAgaW50IGh2bV9jcmVhdGVfaW9yZXFfc2VydmVyKHN0cnVjdCBkb21haW4gKmQsIGlu
dCBidWZpb3JlcV9oYW5kbGluZywKPiAgICAgIGlmICggaSA+PSBNQVhfTlJfSU9SRVFfU0VSVkVS
UyApCj4gICAgICAgICAgZ290byBmYWlsOwo+ICAKPiArICAgIEFTU0VSVCgoaW50ZXJuYWwgJiYK
PiArICAgICAgICAgICAgaSA+PSBNQVhfTlJfRVhURVJOQUxfSU9SRVFfU0VSVkVSUyAmJiBpIDwg
TUFYX05SX0lPUkVRX1NFUlZFUlMpIHx8Cj4gKyAgICAgICAgICAgKCFpbnRlcm5hbCAmJiBpIDwg
TUFYX05SX0VYVEVSTkFMX0lPUkVRX1NFUlZFUlMpKTsKClBlcmhhcHMgZWFzaWVyIHRvIHJlYWQg
Ym90aCBoZXJlIGFuZCBpbiB0aGUgZXZlbnQgdGhlIGFzc2VydGlvbgp3b3VsZCBhY3R1YWxseSB0
cmlnZ2VyIGFzIGVpdGhlcgoKICAgIEFTU0VSVChpbnRlcm5hbAogICAgICAgICAgID8gaSA+PSBN
QVhfTlJfRVhURVJOQUxfSU9SRVFfU0VSVkVSUyAmJiBpIDwgTUFYX05SX0lPUkVRX1NFUlZFUlMK
ICAgICAgICAgICA6IGkgPCBNQVhfTlJfRVhURVJOQUxfSU9SRVFfU0VSVkVSUyk7CgpvciBldmVu
CgogICAgQVNTRVJUKGkgPCBNQVhfTlJfRVhURVJOQUxfSU9SRVFfU0VSVkVSUwogICAgICAgICAg
ID8gIWludGVybmFsCiAgICAgICAgICAgOiBpbnRlcm5hbCAmJiBpIDwgTUFYX05SX0lPUkVRX1NF
UlZFUlMpOwoKPwoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
