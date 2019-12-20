Return-Path: <SRS0=WPd/=2K=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C2AAC43603
	for <xen-devel@archiver.kernel.org>; Fri, 20 Dec 2019 16:48:34 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D8D0620716
	for <xen-devel@archiver.kernel.org>; Fri, 20 Dec 2019 16:48:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D8D0620716
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iiLRv-0004DI-Q4; Fri, 20 Dec 2019 16:48:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=fFWP=2K=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iiLRu-0004DD-DC
 for xen-devel@lists.xenproject.org; Fri, 20 Dec 2019 16:48:22 +0000
X-Inumbo-ID: 8328ebf2-2348-11ea-88e7-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8328ebf2-2348-11ea-88e7-bc764e2007e4;
 Fri, 20 Dec 2019 16:48:13 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 0FA31AD1A;
 Fri, 20 Dec 2019 16:48:13 +0000 (UTC)
To: Tamas K Lengyel <tamas.lengyel@intel.com>
References: <cover.1576697796.git.tamas.lengyel@intel.com>
 <3b07eeab8b384b4abf5277f26ebb8178e9434427.1576697796.git.tamas.lengyel@intel.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9e57efc1-02f6-a023-9e95-bcb03f019e2f@suse.com>
Date: Fri, 20 Dec 2019 17:48:42 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <3b07eeab8b384b4abf5277f26ebb8178e9434427.1576697796.git.tamas.lengyel@intel.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 02/20] xen/x86: Make hap_get_allocation
 accessible
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTguMTIuMjAxOSAyMDo0MCwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+IC0tLSBhL3hlbi9h
cmNoL3g4Ni9tbS9oYXAvaGFwLmMKPiArKysgYi94ZW4vYXJjaC94ODYvbW0vaGFwL2hhcC5jCj4g
QEAgLTMyMSw4ICszMjEsNyBAQCBzdGF0aWMgdm9pZCBoYXBfZnJlZV9wMm1fcGFnZShzdHJ1Y3Qg
ZG9tYWluICpkLCBzdHJ1Y3QgcGFnZV9pbmZvICpwZykKPiAgfQo+ICAKPiAgLyogUmV0dXJuIHRo
ZSBzaXplIG9mIHRoZSBwb29sLCByb3VuZGVkIHVwIHRvIHRoZSBuZWFyZXN0IE1CICovCj4gLXN0
YXRpYyB1bnNpZ25lZCBpbnQKPiAtaGFwX2dldF9hbGxvY2F0aW9uKHN0cnVjdCBkb21haW4gKmQp
Cj4gK3Vuc2lnbmVkIGludCBoYXBfZ2V0X2FsbG9jYXRpb24oc3RydWN0IGRvbWFpbiAqZCkKCkFs
b25nIHRoZSBsaW5lcyBvZiB0aGUgY29tbWVudCBvbiBwYXRjaCAxLCBwbGVhc2UgdGFrZSB0aGUK
b3Bwb3J0dW5pdHkgYW5kIGNvbnN0aWZ5IHRoZSBwYXJhbWV0ZXIgKHdoaWNoIGxvb2tzIGVudGly
ZWx5CnN0cmFpZ2h0Zm9yd2FyZCBoZXJlKS4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
