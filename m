Return-Path: <SRS0=DbOf=ZM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BF46C432C0
	for <xen-devel@archiver.kernel.org>; Wed, 20 Nov 2019 14:56:38 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 11A71206EC
	for <xen-devel@archiver.kernel.org>; Wed, 20 Nov 2019 14:56:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 11A71206EC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iXROu-00022x-SD; Wed, 20 Nov 2019 14:56:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=F8UZ=ZM=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iXROt-00022s-CX
 for xen-devel@lists.xenproject.org; Wed, 20 Nov 2019 14:56:11 +0000
X-Inumbo-ID: e302e984-0ba5-11ea-9631-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e302e984-0ba5-11ea-9631-bc764e2007e4;
 Wed, 20 Nov 2019 14:56:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id BE227B272E;
 Wed, 20 Nov 2019 14:56:08 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, Julien Grall <julien.grall.oss@gmail.com>
References: <20191120133751.67925-1-jgrall@amazon.com>
 <3ceac08c-cdf3-aad5-de55-9e3055fa079e@suse.com>
 <d88b5d07-76b9-4861-0f7f-846e6d239aa5@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <97a62b8d-2e5b-b6a8-95a0-2eee764d4a3b@suse.com>
Date: Wed, 20 Nov 2019 15:56:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <d88b5d07-76b9-4861-0f7f-846e6d239aa5@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen: Add missing va_end() in
 hypercall_create_continuation()
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
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjAuMTEuMTkgMTU6MDYsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gT24gMjAvMTEvMjAxOSAx
Mzo1NiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDIwLjExLjIwMTkgMTQ6MzcsIEp1bGllbiBH
cmFsbCB3cm90ZToKPj4+IEZyb206IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+Cj4+Pgo+
Pj4gVGhlIGRvY3VtZW50YXRpb24gcmVxdWlyZXMgdmFfc3RhcnQoKSB0byBhbHdheXMgYmUgbWF0
Y2hlZCB3aXRoIGEKPj4+IGNvcnJlc3BvbmRpbmcgdmFfZW5kKCkuIEhvd2V2ZXIsIHRoaXMgaXMg
bm90IHRoZSBjYXNlIGluIHRoZSBwYXRoIHVzZWQKPj4+IGZvciBiYWQgZm9ybWF0Lgo+Pj4KPj4+
IFRoaXMgd2FzIGludHJvZHVjZWQgYnkgWFNBLTI5Ni4KPj4+Cj4+PiBDb3Zlcml0eS1JRDogMTQ4
ODcyNwo+Pj4gRml4ZXM6IDBiZjlmOGQzZTMgKCJ4ZW4vaHlwZXJjYWxsOiBEb24ndCB1c2UgQlVH
KCkgZm9yIHBhcmFtZXRlciBjaGVja2luZyBpbiBoeXBlcmNhbGxfY3JlYXRlX2NvbnRpbnVhdGlv
bigpIikKPj4+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+Cj4+
IFJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4gCj4gUmV2aWV3
ZWQtYnk6IEFuZHJldyBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoK
UmVsZWFzZS1hY2tlZC1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgoKCkp1ZXJn
ZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
