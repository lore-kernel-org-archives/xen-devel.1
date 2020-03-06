Return-Path: <SRS0=sMQa=4X=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C945C10DCE
	for <xen-devel@archiver.kernel.org>; Fri,  6 Mar 2020 11:45:59 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 12D062072A
	for <xen-devel@archiver.kernel.org>; Fri,  6 Mar 2020 11:45:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 12D062072A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jABQF-0000NB-Aw; Fri, 06 Mar 2020 11:45:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=JlMq=4X=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jABQE-0000N6-6X
 for xen-devel@lists.xenproject.org; Fri, 06 Mar 2020 11:45:42 +0000
X-Inumbo-ID: 01495b14-5fa0-11ea-a7b2-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 01495b14-5fa0-11ea-a7b2-12813bfff9fa;
 Fri, 06 Mar 2020 11:45:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 45C52AD80;
 Fri,  6 Mar 2020 11:45:40 +0000 (UTC)
To: pdurrant@amzn.com
References: <20200305124504.3564-1-pdurrant@amzn.com>
 <20200305124504.3564-3-pdurrant@amzn.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5c8e1d01-74e8-ed77-5900-9419c010b407@suse.com>
Date: Fri, 6 Mar 2020 12:45:42 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200305124504.3564-3-pdurrant@amzn.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 2/6] x86 / p2m: remove page_list check in
 p2m_alloc_table
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
Cc: Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <pdurrant@amazon.com>, George Dunlap <george.dunlap@citrix.com>,
 xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDUuMDMuMjAyMCAxMzo0NSwgcGR1cnJhbnRAYW16bi5jb20gd3JvdGU6Cj4gRnJvbTogUGF1
bCBEdXJyYW50IDxwZHVycmFudEBhbWF6b24uY29tPgo+IAo+IFRoZXJlIGRvZXMgbm90IHNlZW0g
dG8gYmUgYW55IGp1c3RpZmljYXRpb24gZm9yIHJlZnVzaW5nIHRvIGNyZWF0ZSB0aGUKPiBkb21h
aW4ncyBwMm0gdGFibGUgc2ltcGx5IGJlY2F1c2UgaXQgbWF5IGhhdmUgYXNzaWduZWQgcGFnZXMu
CgpJIHRoaW5rIHRoZXJlIGlzOiBJZiBhbnkgc3VjaCBhbGxvY2F0aW9uIGhhZCBoYXBwZW5lZCBi
ZWZvcmUsIGhvdwp3b3VsZCBpdCBiZSByZXByZXNlbnRlZCBpbiB0aGUgZG9tYWluJ3MgcDJtPwoK
PiBQYXJ0aWN1bGFybHkKPiBpdCBwcmV2ZW50cyB0aGUgcHJpb3IgYWxsb2NhdGlvbiBvZiBQR0Nf
ZXh0cmEgcGFnZXMuCgpUaGF0J3MgdW5mb3J0dW5hdGUsIGJ1dCB3aWxsIG5lZWQgdGFraW5nIGNh
cmUgb2YgZGlmZmVyZW50bHkgdGhlbjoKCj4gLS0tIGEveGVuL2FyY2gveDg2L21tL3AybS5jCj4g
KysrIGIveGVuL2FyY2gveDg2L21tL3AybS5jCj4gQEAgLTY5NSwxNCArNjk1LDYgQEAgaW50IHAy
bV9hbGxvY190YWJsZShzdHJ1Y3QgcDJtX2RvbWFpbiAqcDJtKQo+ICAKPiAgICAgIHAybV9sb2Nr
KHAybSk7Cj4gIAo+IC0gICAgaWYgKCBwMm1faXNfaG9zdHAybShwMm0pCj4gLSAgICAgICAgICYm
ICFwYWdlX2xpc3RfZW1wdHkoJmQtPnBhZ2VfbGlzdCkgKQo+IC0gICAgewo+IC0gICAgICAgIFAy
TV9FUlJPUigiZG9tICVkIGFscmVhZHkgaGFzIG1lbW9yeSBhbGxvY2F0ZWRcbiIsIGQtPmRvbWFp
bl9pZCk7Cj4gLSAgICAgICAgcDJtX3VubG9jayhwMm0pOwo+IC0gICAgICAgIHJldHVybiAtRUlO
VkFMOwo+IC0gICAgfQoKSW5zdGVhZCBvZiBjaGVja2luZyB0aGUgbGlzdCB0byBiZSBlbXB0eSwg
aG93IGFib3V0IGNoZWNraW5nCmRvbWFpbl90b3RfcGFnZXMoKSB0byByZXR1cm4gemVybz8KCkph
bgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
