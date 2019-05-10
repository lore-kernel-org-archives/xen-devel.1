Return-Path: <SRS0=iSTY=TK=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87B81C04A6B
	for <xen-devel@archiver.kernel.org>; Fri, 10 May 2019 13:30:16 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 60BD12175B
	for <xen-devel@archiver.kernel.org>; Fri, 10 May 2019 13:30:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 60BD12175B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hP5bB-0004Mn-9W; Fri, 10 May 2019 13:30:05 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=thpN=TK=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hP5bA-0004Ax-2c
 for xen-devel@lists.xenproject.org; Fri, 10 May 2019 13:30:04 +0000
X-Inumbo-ID: b6f33513-7327-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id b6f33513-7327-11e9-8980-bc764e045a96;
 Fri, 10 May 2019 13:30:02 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 08DA2374;
 Fri, 10 May 2019 06:30:02 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 77C273F575;
 Fri, 10 May 2019 06:30:00 -0700 (PDT)
To: Jan Beulich <JBeulich@suse.com>
References: <20190507151458.29350-1-julien.grall@arm.com>
 <20190507151458.29350-15-julien.grall@arm.com>
 <5CD57C6F020000780022D8BC@prv1-mh.provo.novell.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <8e10cc12-d9be-3891-fae9-501ab9a69019@arm.com>
Date: Fri, 10 May 2019 14:29:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5CD57C6F020000780022D8BC@prv1-mh.provo.novell.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 14/14] xen/mm: Provide dummy M2P-related
 helpers when !CONFIG_HAVE_M2P
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"; format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190510132959.IJueuL7JrH7gejdNJY5rgyfwOMdOUF_r1LZqLwT1qF0@z>

CgpPbiAxMC8wNS8yMDE5IDE0OjI4LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+PiBPbiAwNy4wNS4x
OSBhdCAxNzoxNCwgPGp1bGllbi5ncmFsbEBhcm0uY29tPiB3cm90ZToKPj4gLS0tIGEveGVuL2lu
Y2x1ZGUveGVuL21tLmgKPj4gKysrIGIveGVuL2luY2x1ZGUveGVuL21tLmgKPj4gQEAgLTY1OCw0
ICs2NTgsMTggQEAgc3RhdGljIGlubGluZSB2b2lkIHNoYXJlX3hlbl9wYWdlX3dpdGhfcHJpdmls
ZWdlZF9ndWVzdHMoCj4+ICAgICAgIHNoYXJlX3hlbl9wYWdlX3dpdGhfZ3Vlc3QocGFnZSwgZG9t
X3hlbiwgZmxhZ3MpOwo+PiAgIH0KPj4gICAKPj4gKy8qCj4+ICsgKiBEdW1teSBpbXBsZW1lbnRh
dGlvbiBvZiBNMlAtcmVsYXRlZCBoZWxwZXJzIGZvciBjb21tb24gY29kZSB3aGVuCj4+ICsgKiB0
aGUgYXJjaGl0ZWN0dXJlIGRvZXNuJ3QgaGF2ZSBhbiBNMlAuCj4+ICsgKi8KPj4gKyNpZm5kZWYg
Q09ORklHX0hBU19NMlAKPj4gKwo+PiArI2RlZmluZSBJTlZBTElEX00yUF9FTlRSWSAgICAgICAg
KH4wVUwpCj4+ICsjZGVmaW5lIFNIQVJFRF9NMlBfRU5UUlkgICAgICAgICAofjBVTCAtIDFVTCkK
Pj4gKyNkZWZpbmUgU0hBUkVEX00yUChfZSkgICAgICAgICAgICgoX2UpID09IFNIQVJFRF9NMlBf
RU5UUlkpCj4+ICsKPj4gK3N0YXRpYyBpbmxpbmUgdm9pZCBzZXRfcGZuX2Zyb21fbWZuKG1mbl90
IG1mbiwgdW5zaWduZWQgbG9uZyBwZm4pIHt9Cj4+ICsKPj4gKyNlbmRpZgo+IAo+IEluIG9yZGVy
IGZvciB0aGluZ3MgdG8gbm90IGJlIHNjYXR0ZXJlZCBhcm91bmQsIGNvdWxkCj4gZG9tYWluX3No
YXJlZF9pbmZvX2dmbigpIChzZWUgcGF0Y2ggOSkgbW92ZSBoZXJlPyBJdCBkb2Vzbid0Cj4gbG9v
ayBhcyBpZiB0aGlzIHdvdWxkIGNhdXNlIGEgYnVpbGQgaXNzdWUuCgpUaGUgdHdvIGFyZSBkaWZm
ZXJlbnQsIG9uZSBkZWFsIHdpdGggbWVtb3J5LCB0aGUgb3RoZXIgd2l0aCBhIGRvbWFpbi4gU28g
dGhlIApjdXJyZW50IHNwbGl0IG1ha2VzIHNlbnNlLgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFs
bAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
