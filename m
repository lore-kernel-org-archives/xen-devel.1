Return-Path: <SRS0=wySQ=WX=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1541C3A5A3
	for <xen-devel@archiver.kernel.org>; Tue, 27 Aug 2019 13:30:58 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E3F720673
	for <xen-devel@archiver.kernel.org>; Tue, 27 Aug 2019 13:30:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8E3F720673
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i2bYe-0004Cw-Gd; Tue, 27 Aug 2019 13:30:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=72vU=WX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i2bYd-0004Cm-0W
 for xen-devel@lists.xenproject.org; Tue, 27 Aug 2019 13:30:47 +0000
X-Inumbo-ID: e008b8b8-c8ce-11e9-ac23-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e008b8b8-c8ce-11e9-ac23-bc764e2007e4;
 Tue, 27 Aug 2019 13:30:46 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A09BDB678;
 Tue, 27 Aug 2019 13:30:45 +0000 (UTC)
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
References: <1566324587-3442-1-git-send-email-olekstysh@gmail.com>
 <1566324587-3442-7-git-send-email-olekstysh@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <20f3a150-3619-deea-d0cd-fefe7f062a4f@suse.com>
Date: Tue, 27 Aug 2019 15:30:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1566324587-3442-7-git-send-email-olekstysh@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V3 6/8] iommu: Add of_xlate callback
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
Cc: xen-devel@lists.xenproject.org, julien.grall@arm.com,
 sstabellini@kernel.org, Volodymyr_Babchuk@epam.com,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjAuMDguMjAxOSAyMDowOSwgT2xla3NhbmRyIFR5c2hjaGVua28gd3JvdGU6Cj4gLS0tIGEv
eGVuL2luY2x1ZGUveGVuL2lvbW11LmgKPiArKysgYi94ZW4vaW5jbHVkZS94ZW4vaW9tbXUuaAo+
IEBAIC0yNDAsNiArMjQwLDE2IEBAIHN0cnVjdCBpb21tdV9vcHMgewo+ICAgICAgIGludCBfX211
c3RfY2hlY2sgKCppb3RsYl9mbHVzaF9hbGwpKHN0cnVjdCBkb21haW4gKmQpOwo+ICAgICAgIGlu
dCAoKmdldF9yZXNlcnZlZF9kZXZpY2VfbWVtb3J5KShpb21tdV9ncmRtX3QgKiwgdm9pZCAqKTsK
PiAgICAgICB2b2lkICgqZHVtcF9wMm1fdGFibGUpKHN0cnVjdCBkb21haW4gKmQpOwo+ICsKPiAr
I2lmZGVmIENPTkZJR19IQVNfREVWSUNFX1RSRUUKPiArICAgIC8qCj4gKyAgICAgKiBBbGwgSU9N
TVUgZHJpdmVycyB3aGljaCBzdXBwb3J0IGdlbmVyaWMgSU9NTVUgRFQgYmluZGluZ3Mgc2hvdWxk
IHVzZQo+ICsgICAgICogdGhpcyBjYWxsYmFjay4gVGhpcyBpcyBhIHdheSBmb3IgdGhlIGZyYW1l
d29yayB0byBwcm92aWRlIHRoZSBkcml2ZXIKPiArICAgICAqIHdpdGggRFQgSU9NTVUgc3BlY2lm
aWVyIHdoaWNoIGRlc2NyaWJlcyB0aGUgSU9NTVUgbWFzdGVyIGludGVyZmFjZXMgb2YKPiArICAg
ICAqIHRoYXQgZGV2aWNlIChkZXZpY2UgSURzLCBldGMpLgo+ICsgICAgICovCj4gKyAgICBpbnQg
KCpvZl94bGF0ZSkoZGV2aWNlX3QgKmRldiwgc3RydWN0IGR0X3BoYW5kbGVfYXJncyAqYXJncyk7
Cj4gKyNlbmRpZgo+ICAgfTsKCkkgdGhpbmsgdGhpcyBzaG91bGQgYmUgZm9sZGVkIGludG8gdGhl
IGZpcnN0IHBhdGNoIHVzaW5nIGl0LiBEb2luZwpzbyBtYXkgYWxzbyBhbnN3ZXIgbXkgcXVlc3Rp
b24gb2Ygd2hhdCAib2YiIGhlcmUgc3RhbmRzIGZvci4KCkphbgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
