Return-Path: <SRS0=3gbt=4V=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C00F4C3F2D7
	for <xen-devel@archiver.kernel.org>; Wed,  4 Mar 2020 16:03:52 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9DDF121739
	for <xen-devel@archiver.kernel.org>; Wed,  4 Mar 2020 16:03:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9DDF121739
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9WUo-0007bZ-LZ; Wed, 04 Mar 2020 16:03:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=bsO7=4V=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j9WUn-0007bS-Oi
 for xen-devel@lists.xenproject.org; Wed, 04 Mar 2020 16:03:41 +0000
X-Inumbo-ID: b739e6a2-5e31-11ea-b52f-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b739e6a2-5e31-11ea-b52f-bc764e2007e4;
 Wed, 04 Mar 2020 16:03:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 59CE9AF6F;
 Wed,  4 Mar 2020 16:03:40 +0000 (UTC)
To: Anthony PERARD <anthony.perard@citrix.com>
References: <20200226113355.2532224-1-anthony.perard@citrix.com>
 <20200226113355.2532224-19-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8c7e8650-a898-fce2-7e3f-067a6de71062@suse.com>
Date: Wed, 4 Mar 2020 17:03:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200226113355.2532224-19-anthony.perard@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [XEN PATCH v3 18/23] xen/build: use if_changed on
 built_in.o
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

T24gMjYuMDIuMjAyMCAxMjozMywgQW50aG9ueSBQRVJBUkQgd3JvdGU6Cj4gLS0tIGEveGVuL1J1
bGVzLm1rCj4gKysrIGIveGVuL1J1bGVzLm1rCj4gQEAgLTEyNiwxNCArMTI2LDIxIEBAIGluY2x1
ZGUgJChCQVNFRElSKS9hcmNoLyQoVEFSR0VUX0FSQ0gpL1J1bGVzLm1rCj4gIGNfZmxhZ3MgKz0g
JChDRkxBR1MteSkKPiAgYV9mbGFncyArPSAkKENGTEFHUy15KSAkKEFGTEFHUy15KQo+ICAKPiAt
YnVpbHRfaW4ubzogJChvYmoteSkgJChleHRyYS15KQo+ICtxdWlldF9jbWRfbGRfYnVpbHRpbiA9
IExEICAgICAgJEAKPiArY21kX2xkX2J1aWx0aW4gPSBcCj4gKyAgICAkKExEKSAkKFhFTl9MREZM
QUdTKSAtciAtbyAkQCAkKGZpbHRlci1vdXQgJChleHRyYS15KSwkKHJlYWwtcHJlcmVxcykpCj4g
K3F1aWV0X2NtZF9jY19idWlsdGluID0gTEQgICAgICAkQAo+ICtjbWRfY2NfYnVpbHRpbiA9IFwK
PiArICAgICQoQ0MpICQoWEVOX0NGTEFHUykgLWMgLXggYyAvZGV2L251bGwgLW8gJEAKPiArCj4g
K2J1aWx0X2luLm86ICQob2JqLXkpICQoZXh0cmEteSkgRk9SQ0UKPiAgaWZlcSAoJChvYmoteSks
KQo+IC0JJChDQykgJChjX2ZsYWdzKSAtYyAteCBjIC9kZXYvbnVsbCAtbyAkQAo+ICsJJChjYWxs
IGlmX2NoYW5nZWQsY2NfYnVpbHRpbikKPiAgZWxzZQo+ICBpZmVxICgkKENPTkZJR19MVE8pLHkp
Cj4gIAkkKExEX0xUTykgLXIgLW8gJEAgJChmaWx0ZXItb3V0ICQoZXh0cmEteSksJF4pCgpXaGF0
IGFib3V0IHRoaXM/IENvdWxkbid0IHlvdSBzaW1wbHkgdmFyeSB3aGF0IGNtZF9sZF9idWlsdGlu
CmV4cGFuZHMgdG8sIGFuZCBkcm9wIHRoaXMgaW5uZXIgaWZlcSgpPwoKSmFuCgo+ICBlbHNlCj4g
LQkkKExEKSAkKFhFTl9MREZMQUdTKSAtciAtbyAkQCAkKGZpbHRlci1vdXQgJChleHRyYS15KSwk
XikKPiArCSQoY2FsbCBpZl9jaGFuZ2VkLGxkX2J1aWx0aW4pCj4gIGVuZGlmCj4gIGVuZGlmCj4g
IAo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
