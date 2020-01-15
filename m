Return-Path: <SRS0=MzdL=3E=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42050C33CB1
	for <xen-devel@archiver.kernel.org>; Wed, 15 Jan 2020 11:10:24 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1BF70222C3
	for <xen-devel@archiver.kernel.org>; Wed, 15 Jan 2020 11:10:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1BF70222C3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irgYl-0007UW-6N; Wed, 15 Jan 2020 11:10:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=0BBJ=3E=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1irgYj-0007KA-OQ
 for xen-devel@lists.xen.org; Wed, 15 Jan 2020 11:10:01 +0000
X-Inumbo-ID: 8dcc8566-3787-11ea-ac27-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8dcc8566-3787-11ea-ac27-bc764e2007e4;
 Wed, 15 Jan 2020 11:09:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id BAB13AC81;
 Wed, 15 Jan 2020 11:09:51 +0000 (UTC)
To: Sergey Dyasli <sergey.dyasli@citrix.com>
References: <20200108152100.7630-1-sergey.dyasli@citrix.com>
 <20200108152100.7630-2-sergey.dyasli@citrix.com>
 <96c2414e-91fb-5a28-44bc-e30d2daabec5@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <6f643816-a7dc-f3bb-d521-b6ac104918d6@suse.com>
Date: Wed, 15 Jan 2020 12:09:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <96c2414e-91fb-5a28-44bc-e30d2daabec5@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v1 1/4] kasan: introduce
 set_pmd_early_shadow()
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
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com, xen-devel@lists.xen.org, linux-mm@kvack.org,
 Alexander Potapenko <glider@google.com>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>, Dmitry Vyukov <dvyukov@google.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTUuMDEuMjAgMTE6NTQsIFNlcmdleSBEeWFzbGkgd3JvdGU6Cj4gSGkgSnVlcmdlbiwKPiAK
PiBPbiAwOC8wMS8yMDIwIDE1OjIwLCBTZXJnZXkgRHlhc2xpIHdyb3RlOgo+PiBJdCBpcyBpbmNv
cnJlY3QgdG8gY2FsbCBwbWRfcG9wdWxhdGVfa2VybmVsKCkgbXVsdGlwbGUgdGltZXMgZm9yIHRo
ZQo+PiBzYW1lIHBhZ2UgdGFibGUuIFhlbiBub3RpY2VzIGl0IGR1cmluZyBrYXNhbl9wb3B1bGF0
ZV9lYXJseV9zaGFkb3coKToKPj4KPj4gICAgICAoWEVOKSBtbS5jOjMyMjI6ZDE1NXYwIG1mbiAz
NzA0YiBhbHJlYWR5IHBpbm5lZAo+Pgo+PiBUaGlzIGhhcHBlbnMgZm9yIGthc2FuX2Vhcmx5X3No
YWRvd19wdGUgd2hlbiBVU0VfU1BMSVRfUFRFX1BUTE9DS1MgaXMKPj4gZW5hYmxlZC4gRml4IHRo
aXMgYnkgaW50cm9kdWNpbmcgc2V0X3BtZF9lYXJseV9zaGFkb3coKSB3aGljaCBjYWxscwo+PiBw
bWRfcG9wdWxhdGVfa2VybmVsKCkgb25seSBvbmNlIGFuZCB1c2VzIHNldF9wbWQoKSBhZnRlcndh
cmRzLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBTZXJnZXkgRHlhc2xpIDxzZXJnZXkuZHlhc2xpQGNp
dHJpeC5jb20+Cj4gCj4gTG9va3MgbGlrZSB0aGUgcGxhbiB0byB1c2Ugc2V0X3BtZCgpIGRpcmVj
dGx5IGhhcyBmYWlsZWQ6IGl0J3MgYW4KPiBhcmNoLXNwZWNpZmljIGZ1bmN0aW9uIGFuZCBjYW4n
dCBiZSB1c2VkIGluIGFyY2gtaW5kZXBlbmRlbnQgY29kZQo+IChhcyBrYnVpbGQgdGVzdCByb2Jv
dCBoYXMgcHJvdmVuKS4KPiAKPiBEbyB5b3Ugc2VlIGFueSB3YXkgb3V0IG9mIHRoaXMgb3RoZXIg
dGhhbiBkaXNhYmxpbmcgU1BMSVRfUFRFX1BUTE9DS1MKPiBmb3IgUFYgS0FTQU4/CgpDaGFuZ2Ug
c2V0X3BtZF9lYXJseV9zaGFkb3coKSBsaWtlIHRoZSBmb2xsb3dpbmc6CgojaWZkZWYgQ09ORklH
X1hFTl9QVgpzdGF0aWMgaW5saW5lIHZvaWQgc2V0X3BtZF9lYXJseV9zaGFkb3cocG1kX3QgKnBt
ZCwgcHRlX3QgKmVhcmx5X3NoYWRvdykKewoJc3RhdGljIGJvb2wgcG1kX3BvcHVsYXRlZCA9IGZh
bHNlOwoKCWlmIChsaWtlbHkocG1kX3BvcHVsYXRlZCkpIHsKCQlzZXRfcG1kKHBtZCwgX19wbWQo
X19wYShlYXJseV9zaGFkb3cpIHwgX1BBR0VfVEFCTEUpKTsKCX0gZWxzZSB7CgkJcG1kX3BvcHVs
YXRlX2tlcm5lbCgmaW5pdF9tbSwgcG1kLCBlYXJseV9zaGFkb3cpOwoJCXBtZF9wb3B1bGF0ZWQg
PSB0cnVlOwoJfQp9CiNlbHNlCnN0YXRpYyBpbmxpbmUgdm9pZCBzZXRfcG1kX2Vhcmx5X3NoYWRv
dyhwbWRfdCAqcG1kLCBwdGVfdCAqZWFybHlfc2hhZG93KQp7CglwbWRfcG9wdWxhdGVfa2VybmVs
KCZpbml0X21tLCBwbWQsIGVhcmx5X3NoYWRvdyk7Cn0KI2VuZGlmCgouLi4gYW5kIG1vdmUgaXQg
dG8gaW5jbHVkZS94ZW4veGVuLW9wcy5oIGFuZCBjYWxsIGl0IHdpdGgKbG1fYWxpYXMoa2FzYW5f
ZWFybHlfc2hhZG93X3B0ZSkgYXMgdGhlIHNlY29uZCBwYXJhbWV0ZXIuCgoKSnVlcmdlbgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
