Return-Path: <SRS0=8zAd=32=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CB8CC33CAC
	for <xen-devel@archiver.kernel.org>; Thu,  6 Feb 2020 15:52:23 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2595F20838
	for <xen-devel@archiver.kernel.org>; Thu,  6 Feb 2020 15:52:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2595F20838
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1izjRe-0008AQ-VT; Thu, 06 Feb 2020 15:51:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Ya+N=32=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1izjRd-0008AH-Gt
 for xen-devel@lists.xenproject.org; Thu, 06 Feb 2020 15:51:57 +0000
X-Inumbo-ID: 9a0dbe3a-48f8-11ea-afe7-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9a0dbe3a-48f8-11ea-afe7-12813bfff9fa;
 Thu, 06 Feb 2020 15:51:56 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 8798BAC42;
 Thu,  6 Feb 2020 15:51:55 +0000 (UTC)
To: Julien Grall <julien@xen.org>
References: <20200206154118.31451-1-julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <22a72040-c4cd-7068-4064-b738bca74669@suse.com>
Date: Thu, 6 Feb 2020 16:52:02 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200206154118.31451-1-julien@xen.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/include: public: Document the padding
 in struct xen_hvm_param
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
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <jgrall@amazon.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDYuMDIuMjAyMCAxNjo0MSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEZyb206IEp1bGllbiBH
cmFsbCA8amdyYWxsQGFtYXpvbi5jb20+Cj4gCj4gVGhlcmUgaXMgYW4gaW1wbGljaXQgcGFkZGlu
ZyBvZiAyIGJ5dGVzIGluIHN0cnVjdCB4ZW5faHZtX3BhcmFtIGJldHdlZW4KPiB0aGUgZmllbGQg
ZG9taWQgYW5kIGluZGV4LiBNYWtlIGl0IGV4cGxpY2l0IGJ5IGludHJvZHVjZSBhIHBhZGRpbmcK
PiBmaWVsZC4gVGhpcyBjYW4gYWxzbyBzZXJ2ZSBhcyBkb2N1bWVudGF0aW9uLgo+IAo+IE5vdGUg
dGhhdCBJIGRvbid0IHRoaW5rIHdlIGNhbiBtYW5kYXRlIGl0IHRvIGJlIHplcm8gYmVjYXVzZSBh
IGd1ZXN0IG1heQo+IG5vdCBoYXZlIGluaXRpYWxpemVkIHRoZSBwYWRkaW5nLgoKQWdyZWVkIC0g
d2UgY2FuIG1hbmRhdGUgc3VjaCBvbmx5IGF0IGludHJvZHVjdGlvbiwgbm90IGF0IGFueQpsYXRl
ciB0aW1lLgoKPiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGpncmFsbEBhbWF6b24uY29t
PgoKQWNrZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCihJIGRvdWJ0IHRo
aXMgaXMgdGhlIG9ubHkgbWlzc2luZyBmaWVsZCB0byBtYWtlIHBhZGRpbmcgZXhwbGljaXQuKQoK
SmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
