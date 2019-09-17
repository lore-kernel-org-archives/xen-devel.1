Return-Path: <SRS0=xGdN=XM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7429BC4CEC9
	for <xen-devel@archiver.kernel.org>; Tue, 17 Sep 2019 09:41:30 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D92B21881
	for <xen-devel@archiver.kernel.org>; Tue, 17 Sep 2019 09:41:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4D92B21881
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iA9yu-0004VC-Rs; Tue, 17 Sep 2019 09:41:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DkBD=XM=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iA9yt-0004Uz-IX
 for xen-devel@lists.xenproject.org; Tue, 17 Sep 2019 09:41:07 +0000
X-Inumbo-ID: 4560122c-d92f-11e9-9605-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 4560122c-d92f-11e9-9605-12813bfff9fa;
 Tue, 17 Sep 2019 09:41:06 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0FF88142F;
 Tue, 17 Sep 2019 02:41:06 -0700 (PDT)
Received: from [10.37.13.58] (unknown [10.37.13.58])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B08D73F59C;
 Tue, 17 Sep 2019 02:41:03 -0700 (PDT)
To: Paul Durrant <paul.durrant@citrix.com>, xen-devel@lists.xenproject.org
References: <20190913105826.2704-1-paul.durrant@citrix.com>
 <20190913105826.2704-6-paul.durrant@citrix.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <b2103103-cbf3-356e-7e14-e036f4848830@arm.com>
Date: Tue, 17 Sep 2019 10:41:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190913105826.2704-6-paul.durrant@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v11 5/6] iommu: tidy up iommu_use_hap_pt()
 and need_iommu_pt_sync() macros
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
 Jan Beulich <jbeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgUGF1bCwKCk9uIDkvMTMvMTkgMTE6NTggQU0sIFBhdWwgRHVycmFudCB3cm90ZToKPiBUaGVz
IG1hY3JvcyByZWFsbHkgb3VnaHQgdG8gbGl2ZSBpbiB0aGUgY29tbW9uIHhlbi9pb21tdS5oIGhl
YWRlciByYXRoZXIKPiB0aGVuIGJlaW5nIGRpc3RyaWJ1dGVkIGFtb25nc3QgYXJjaGl0ZWN0dXJl
IHNwZWNpZmljIGlvbW11IGhlYWRlcnMgYW5kCj4geGVuL3NjaGVkLmguIFRoaXMgcGF0Y2ggbW92
ZXMgdGhlbSB0aGVyZS4KPiAKPiBOT1RFOiBEaXNhYmxpbmcgJ3NoYXJlcHQnIGluIHRoZSBjb21t
YW5kIGxpbmUgaW9tbXUgb3B0aW9ucyBzaG91bGQgcmVhbGx5Cj4gICAgICAgIGJlIGhhcmQgZXJy
b3Igb24gQVJNIChhcyBvcHBvc2VkIHRvIGp1c3QgYmVpbmcgaWdub3JlZCksIHNvIGRlZmluZQo+
ICAgICAgICAnaW9tbXVfaGFwX3B0X3NoYXJlJyB0byBiZSB0cnVlIGZvciBBUk0gKHZpYSBBUk0t
c2VsZWN0ZWQKPiAgICAgICAgQ09ORklHX0lPTU1VX0ZPUkNFX1BUX1NIQVJFKS4KPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBQYXVsIER1cnJhbnQgPHBhdWwuZHVycmFudEBjaXRyaXguY29tPgo+IFJldmll
d2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpBY2tlZC1ieTogSnVsaWVu
IEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
