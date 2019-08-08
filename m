Return-Path: <SRS0=JtEA=WE=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B3AEC0650F
	for <xen-devel@archiver.kernel.org>; Thu,  8 Aug 2019 06:35:23 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E317D217F4
	for <xen-devel@archiver.kernel.org>; Thu,  8 Aug 2019 06:35:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E317D217F4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvc0v-0007HU-EG; Thu, 08 Aug 2019 06:35:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=UoSe=WE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hvc0u-0007HP-8F
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2019 06:35:04 +0000
X-Inumbo-ID: a4185ed0-b9a6-11e9-84a7-279a6bb1d810
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a4185ed0-b9a6-11e9-84a7-279a6bb1d810;
 Thu, 08 Aug 2019 06:34:58 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 74535AE84;
 Thu,  8 Aug 2019 06:34:57 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20190807143119.8360-1-jgross@suse.com>
 <20190807143119.8360-3-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ab0314ec-9af8-e1b3-343c-b7183152418d@suse.com>
Date: Thu, 8 Aug 2019 08:34:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190807143119.8360-3-jgross@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 2/4] xen: add new CONFIG_SPINLOCK_DEBUG
 option
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
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDcuMDguMjAxOSAxNjozMSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiAtLS0gYS94ZW4vS2Nv
bmZpZy5kZWJ1Zwo+ICsrKyBiL3hlbi9LY29uZmlnLmRlYnVnCj4gQEAgLTQ0LDYgKzQ0LDEzIEBA
IGNvbmZpZyBDT1ZFUkFHRQo+ICAgCj4gICAJICBJZiB1bnN1cmUsIHNheSBOIGhlcmUuCj4gICAK
PiArY29uZmlnIFNQSU5MT0NLX0RFQlVHCj4gKwlib29sICJTcGlubG9jayBkZWJ1Z2dpbmciCj4g
KwlkZWZhdWx0IERFQlVHCj4gKwktLS1oZWxwLS0tCj4gKwkgIEVuYWJsZSBkZWJ1Z2dpbmcgZmVh
dHVyZXMgb2Ygc3BpbmxvY2sgaGFuZGxpbmcuICBTb21lIGFkZGl0aW9uYWwKPiArICAgICAgICAg
IGNoZWNrcyB3aWxsIGJlIHBlcmZvcm1lZCB3aGVuIGFjcXVpcmluZyBhbmQgcmVsZWFzaW5nIGxv
Y2tzLgo+ICsKPiAgIGNvbmZpZyBMT0NLX1BST0ZJTEUKCldoaWxlIHRoZSBwcmUtZXhpc3Rpbmcg
TE9DS19QUk9GSUxFIHN1Z2dlc3RzIHRoZSBvcHBvc2l0ZSwgSSdkCnN0aWxsIGxpa2UgdG8gcHJv
cG9zZSB0aGF0IHdlIHVuaWZvcm1seSBuYW1lIGFsbCBkZWJ1Z2dpbmcKb3B0aW9ucyBDT05GSUdf
REVCVUdfKiAocmF0aGVyIHRoYW4gaGF2aW5nIHRoZSBERUJVRyBhdCB0aGUKZW5kKS4gVGhvdWdo
dHM/CgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
