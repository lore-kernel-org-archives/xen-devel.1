Return-Path: <SRS0=QKFq=WI=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 908B0C433FF
	for <xen-devel@archiver.kernel.org>; Mon, 12 Aug 2019 17:33:55 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E4B62067D
	for <xen-devel@archiver.kernel.org>; Mon, 12 Aug 2019 17:33:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6E4B62067D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxECQ-0008Vh-OJ; Mon, 12 Aug 2019 17:33:38 +0000
Received: from [172.99.69.81] (helo=us1-rack-iad1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dIXR=WI=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hxECP-0008VR-Dk
 for xen-devel@lists.xenproject.org; Mon, 12 Aug 2019 17:33:37 +0000
X-Inumbo-ID: 509ea9e2-bd27-11e9-b8ca-cfecfad5300c
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 509ea9e2-bd27-11e9-b8ca-cfecfad5300c;
 Mon, 12 Aug 2019 17:33:36 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 703AC15AB;
 Mon, 12 Aug 2019 10:33:36 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F38263F706;
 Mon, 12 Aug 2019 10:33:35 -0700 (PDT)
To: xen-devel@lists.xenproject.org
References: <20190812173019.11956-1-julien.grall@arm.com>
 <20190812173019.11956-10-julien.grall@arm.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <71c2ffba-50bd-d6d5-7e58-77b6e6292cdc@arm.com>
Date: Mon, 12 Aug 2019 18:33:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190812173019.11956-10-julien.grall@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 09/28] xen/arm32: head: Mark the end of
 subroutines with ENDPROC
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAxMi8wOC8yMDE5IDE4OjMwLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gcHV0bigpIGFuZCBw
dXRzKCkgYXJlIHR3byBzdWJyb3V0aW5lcy4gQWRkIEVORFBST0MgZm9yIHRoZSBiZW5lZml0cyBv
Zgo+IHN0YXRpYyBhbmFseXNpcyB0b29scyBhbmQgdGhlIHJlYWRlci4KPiAKPiBTaWduZWQtb2Zm
LWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgo+IEFja2VkLWJ5OiBTdGVm
YW5vIFN0YWJlbGxpbmkgPHNzdGFibGxpbmlAa2VybmVsLm9yZz4KCkhtbW0sIEkgbWFkZSBhIHR5
cG8gaW4gU3RlZmFubydzIGUtbWFpbCBhZGRyZXNzLiBJIGNhbiBmaXggaXQgb24gY29tbWl0IG1l
c3NhZ2UgCihvciBuZXh0IHZlcnNpb24pLgoKQ2hlZXJzLAoKPiAKPiAtLS0KPiAgICAgIENoYW5n
ZXMgaW4gdjM6Cj4gICAgICAgICAgLSBBZGQgU3RlZmFubydzIGFja2VkLWJ5Cj4gCj4gICAgICBD
aGFuZ2VzIGluIHYyOgo+ICAgICAgICAgIC0gUGF0Y2ggYWRkZWQKPiAtLS0KPiAgIHhlbi9hcmNo
L2FybS9hcm0zMi9oZWFkLlMgfCAyICsrCj4gICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25z
KCspCj4gCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9hcm0zMi9oZWFkLlMgYi94ZW4vYXJj
aC9hcm0vYXJtMzIvaGVhZC5TCj4gaW5kZXggOTlmNGFmMThkOC4uOGI0YzhhNDcxNCAxMDA2NDQK
PiAtLS0gYS94ZW4vYXJjaC9hcm0vYXJtMzIvaGVhZC5TCj4gKysrIGIveGVuL2FyY2gvYXJtL2Fy
bTMyL2hlYWQuUwo+IEBAIC01MTgsNiArNTE4LDcgQEAgcHV0czoKPiAgICAgICAgICAgbW92ZXEg
cGMsIGxyCj4gICAgICAgICAgIGVhcmx5X3VhcnRfdHJhbnNtaXQgcjExLCByMQo+ICAgICAgICAg
ICBiIHB1dHMKPiArRU5EUFJPQyhwdXRzKQo+ICAgCj4gICAvKgo+ICAgICogUHJpbnQgYSAzMi1i
aXQgbnVtYmVyIGluIGhleC4gIFNwZWNpZmljIHRvIHRoZSBQTDAxMSBVQVJULgo+IEBAIC01Mzcs
NiArNTM4LDcgQEAgcHV0bjoKPiAgICAgICAgICAgc3VicyAgcjMsIHIzLCAjMQo+ICAgICAgICAg
ICBibmUgICAxYgo+ICAgICAgICAgICBtb3YgICBwYywgbHIKPiArRU5EUFJPQyhwdXRuKQo+ICAg
Cj4gICBoZXg6ICAgIC5hc2NpaSAiMDEyMzQ1Njc4OWFiY2RlZiIKPiAgICAgICAgICAgLmFsaWdu
IDIKPiAKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
