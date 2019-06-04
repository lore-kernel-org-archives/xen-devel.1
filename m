Return-Path: <SRS0=m2Ej=UD=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40C5EC28CC3
	for <xen-devel@archiver.kernel.org>; Tue,  4 Jun 2019 12:55:39 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 074CE23A79
	for <xen-devel@archiver.kernel.org>; Tue,  4 Jun 2019 12:55:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 074CE23A79
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hY8yD-0003nJ-4X; Tue, 04 Jun 2019 12:55:17 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0KbE=UD=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hY8yB-0003nE-Rl
 for xen-devel@lists.xenproject.org; Tue, 04 Jun 2019 12:55:15 +0000
X-Inumbo-ID: fef1295a-86c7-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id fef1295a-86c7-11e9-8980-bc764e045a96;
 Tue, 04 Jun 2019 12:55:14 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4D0EDA78;
 Tue,  4 Jun 2019 05:55:14 -0700 (PDT)
Received: from [10.37.8.2] (unknown [10.37.8.2])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ABAAA3F690;
 Tue,  4 Jun 2019 05:55:11 -0700 (PDT)
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
References: <5CF664580200007800235089@prv1-mh.provo.novell.com>
 <5CF667500200007800235116@prv1-mh.provo.novell.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <4c58c2b3-4d47-1a47-59f6-dda8b3077d9d@arm.com>
Date: Tue, 4 Jun 2019 13:55:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5CF667500200007800235116@prv1-mh.provo.novell.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 2/4] PCI: move pdev_list field to common
 structure
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@cirix.com>,
 Tim Deegan <tim@xen.org>, Roger Pau Monne <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiA2LzQvMTkgMTo0MiBQTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gSXRzIG1hbmFnZW1l
bnQgc2hvdWxkbid0IGJlIGFyY2gtc3BlY2lmaWMsIGFuZCBpbiBwYXJ0aWN1bGFyIHRoZXJlCj4g
c2hvdWxkIGJlIG5vIG5lZWQgZm9yIHNwZWNpYWwgcHJlY2F1dGlvbnMgd2hlbiBjcmVhdGluZyB0
aGUgc3BlY2lhbAo+IGRvbWFpbnMuCj4gCj4gQXQgdGhpcyBvY2Nhc2lvbgo+IC0gY29ycmVjdCBw
YXJlbnRoZXNpemF0aW9uIG9mIGZvcl9lYWNoX3BkZXYoKSwKPiAtIHN0b3Agb3Blbi1jb2Rpbmcg
Zm9yX2VhY2hfcGRldigpIGluIHZQQ0kgY29kZS4KCiBGcm9tIGFuIEFybSBQT1YsIHRoaXMgbWFr
ZXMgc2Vuc2UuIFdpdGggb25lIGNvbW1lbnQgYmVsb3cuCgo+IEBAIC00NzYsOCArNDc0LDYgQEAg
c3RydWN0IGFyY2hfZG9tYWluCj4gICAjZGVmaW5lIGhhc19waXJxKGQpICAgICAgICAoISEoKGQp
LT5hcmNoLmVtdWxhdGlvbl9mbGFncyAmIFg4Nl9FTVVfVVNFX1BJUlEpKQo+ICAgI2RlZmluZSBo
YXNfdnBjaShkKSAgICAgICAgKCEhKChkKS0+YXJjaC5lbXVsYXRpb25fZmxhZ3MgJiBYODZfRU1V
X1ZQQ0kpKQo+ICAgCj4gLSNkZWZpbmUgaGFzX2FyY2hfcGRldnMoZCkgICAgKCFsaXN0X2VtcHR5
KCYoZCktPmFyY2gucGRldl9saXN0KSkKPiAtCj4gICAjZGVmaW5lIGdkdF9sZHRfcHRfaWR4KHYp
IFwKPiAgICAgICAgICgodiktPnZjcHVfaWQgPj4gKFBBR0VUQUJMRV9PUkRFUiAtIEdEVF9MRFRf
VkNQVV9TSElGVCkpCj4gICAjZGVmaW5lIHB2X2dkdF9wdGVzKHYpIFwKPiAtLS0gYS94ZW4vaW5j
bHVkZS94ZW4vcGNpLmgKPiArKysgYi94ZW4vaW5jbHVkZS94ZW4vcGNpLmgKPiBAQCAtMTIxLDcg
KzEyMSw5IEBAIHN0cnVjdCBwY2lfZGV2IHsKPiAgIH07Cj4gICAKPiAgICNkZWZpbmUgZm9yX2Vh
Y2hfcGRldihkb21haW4sIHBkZXYpIFwKPiAtICAgIGxpc3RfZm9yX2VhY2hfZW50cnkocGRldiwg
Jihkb21haW4tPmFyY2gucGRldl9saXN0KSwgZG9tYWluX2xpc3QpCj4gKyAgICBsaXN0X2Zvcl9l
YWNoX2VudHJ5KHBkZXYsICYoZG9tYWluKS0+cGRldl9saXN0LCBkb21haW5fbGlzdCkKPiArCj4g
KyNkZWZpbmUgaGFzX2FyY2hfcGRldnMoZCkgKCFsaXN0X2VtcHR5KCYoZCktPnBkZXZfbGlzdCkp
CgpUaGlzIGZlZWxzIGEgYml0IHN0cmFuZ2UgdG8ga2VlcCAiYXJjaCIgaW4gdGhlIG1hY3JvIG5h
bWUgd2hlbiB0aGUgY29kZSAKaXMgbm93IGdlbmVyaWMuIEhvdyBhYm91dCAiZG9tYWluX2hhc19w
ZGV2cyI/CgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
