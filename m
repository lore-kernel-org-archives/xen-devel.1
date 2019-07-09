Return-Path: <SRS0=USwc=VG=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4563C73C42
	for <xen-devel@archiver.kernel.org>; Tue,  9 Jul 2019 12:11:50 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8139B20844
	for <xen-devel@archiver.kernel.org>; Tue,  9 Jul 2019 12:11:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8139B20844
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hkoxu-0005EK-L2; Tue, 09 Jul 2019 12:11:22 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DJix=VG=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hkoxu-0005EF-0m
 for xen-devel@lists.xenproject.org; Tue, 09 Jul 2019 12:11:22 +0000
X-Inumbo-ID: a90136d8-a242-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id a90136d8-a242-11e9-8980-bc764e045a96;
 Tue, 09 Jul 2019 12:11:20 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9BF512B;
 Tue,  9 Jul 2019 05:11:19 -0700 (PDT)
Received: from [10.119.48.199] (unknown [10.119.48.199])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 21D443F59C;
 Tue,  9 Jul 2019 05:11:19 -0700 (PDT)
To: Viktor Mitin <viktor.mitin.19@gmail.com>, xen-devel@lists.xenproject.org
References: <20190709105617.16088-1-viktor.mitin.19@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <a569e616-431e-474c-0e3f-4c309555dc7f@arm.com>
Date: Tue, 9 Jul 2019 13:11:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190709105617.16088-1-viktor.mitin.19@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/doc: remove obsolete warning about
 testing gcov on arm
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
 Viktor Mitin <viktor_mitin@epam.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Jan Beulich <jbeulich@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiA3LzkvMTkgMTE6NTYgQU0sIFZpa3RvciBNaXRpbiB3cm90ZToKPiBSZW1vdmUgb2Jz
b2xldGUgd2FybmluZyBhYm91dCB0ZXN0aW5nIGdjb3Ygb24gYXJtLgo+IGdjb3YgaGFzIGJlZW4g
Zml4ZWQgYW5kIHRlc3RlZCB3aXRoIGFybSBodyBwcmV2aW91c2x5Cj4gCj4gU2VlIGNvbW1pdCA2
YWM2NmM5CgpUaGlzIGNvbW1pdC4uLgoKPiAKPiBTaWduZWQtb2ZmLWJ5OiBWaWt0b3IgTWl0aW4g
PHZpa3Rvcl9taXRpbkBlcGFtLmNvbT4KPiAtLS0KPiAgIGRvY3MvaHlwZXJ2aXNvci1ndWlkZS9j
b2RlLWNvdmVyYWdlLnJzdCB8IDcgLS0tLS0tLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDcgZGVsZXRp
b25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RvY3MvaHlwZXJ2aXNvci1ndWlkZS9jb2RlLWNvdmVy
YWdlLnJzdCBiL2RvY3MvaHlwZXJ2aXNvci1ndWlkZS9jb2RlLWNvdmVyYWdlLnJzdAo+IGluZGV4
IDNjZWJmMmQ5NmUuLjk0N2VlNDg3MDEgMTAwNjQ0Cj4gLS0tIGEvZG9jcy9oeXBlcnZpc29yLWd1
aWRlL2NvZGUtY292ZXJhZ2UucnN0Cj4gKysrIGIvZG9jcy9oeXBlcnZpc29yLWd1aWRlL2NvZGUt
Y292ZXJhZ2UucnN0Cj4gQEAgLTYsMTMgKzYsNiBAQCB0aGUgY292ZXJhZ2Ugb2YgaXRzIG93biBi
YXNpYyBibG9ja3MuICBCZWluZyBhIHBpZWNlIG9mIHN5c3RlbSBzb2Z0d2FyZSByYXRoZXIKPiAg
IHRoYW4gYSB1c2Vyc3BhY2UsIGl0IGNhbid0IGF1dG9tYXRpY2FsbHkgd3JpdGUgY292ZXJhZ2Ug
b3V0IHRvIHRoZSBmaWxlc3lzdGVtLAo+ICAgc28gc29tZSBleHRyYSBzdGVwcyBhcmUgcmVxdWly
ZWQgdG8gY29sbGVjdCBhbmQgcHJvY2VzcyB0aGUgZGF0YS4KPiAgIAo+IC0uLiB3YXJuaW5nOjoK
PiAtCj4gLSAgQ292ZXJhZ2UgaGFzIG9ubHkgYmVlbiB0ZXN0ZWQgb24geDg2IGF0IHRoZSBtb21l
bnQuICBBUk0gZG9lc24ndCBjdXJyZW50bHkKPiAtICBib290IHdoZW4gdGhlIGZpbmFsIGJpbmFy
eSBleGNlZWRzIDJNQiBpbiBzaXplLCBhbmQgdGhlIGNvdmVyYWdlIGJ1aWxkIHRlbmRzCj4gLSAg
dG8gZXhjZWVkcyB0aGlzIGxpbWl0LgoKLi4uIGRvZXMgbm90IGFkZHJlc3MgdGhlIDJNQiBwYXJ0
LiBTbyBwYXJ0IG9mIHRoZSB3YXJuaW5nIGlzIHN0aWxsIHZhbGlkIApoZXJlLgoKQ2hlZXJzLAoK
LS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
