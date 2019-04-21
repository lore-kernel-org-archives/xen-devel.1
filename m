Return-Path: <SRS0=WZDL=SX=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BDAFC10F14
	for <xen-devel@archiver.kernel.org>; Sun, 21 Apr 2019 17:14:50 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2335D2080D
	for <xen-devel@archiver.kernel.org>; Sun, 21 Apr 2019 17:14:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2335D2080D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hIG2z-0002yA-3y; Sun, 21 Apr 2019 17:14:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hCs2=SX=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hIG2x-0002y5-QJ
 for xen-devel@lists.xenproject.org; Sun, 21 Apr 2019 17:14:31 +0000
X-Inumbo-ID: ec834232-6458-11e9-ae1e-0bfc6d633a83
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id ec834232-6458-11e9-ae1e-0bfc6d633a83;
 Sun, 21 Apr 2019 17:14:30 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B2E19A78;
 Sun, 21 Apr 2019 10:14:29 -0700 (PDT)
Received: from [10.37.12.14] (unknown [10.37.12.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6D0303F557;
 Sun, 21 Apr 2019 10:14:28 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <alpine.DEB.2.10.1902261501020.20689@sstabellini-ThinkPad-X260>
 <1551222427-21749-1-git-send-email-sstabellini@kernel.org>
 <c3716c11-6d87-4f2d-25d7-3d83537a9ca7@arm.com>
 <alpine.DEB.2.10.1904191618390.1370@sstabellini-ThinkPad-X260>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <aad78004-8aec-edc3-13b6-20baff39c9e5@arm.com>
Date: Sun, 21 Apr 2019 18:14:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.10.1904191618390.1370@sstabellini-ThinkPad-X260>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 1/6] xen: extend XEN_DOMCTL_memory_mapping
 to handle cacheability
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
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
 JBeulich@suse.com, Stefano Stabellini <stefanos@xilinx.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"; format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190421171426.yVTbNNYq4qAhxWFJQFwKRH7CKsx0DfxsMcZoU7X4b1g@z>

SGkgU3RlZmFubywKCk9uIDQvMjAvMTkgMTI6MjAgQU0sIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90
ZToKPiBPbiBXZWQsIDI3IEZlYiAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+PiBkaWZmIC0t
Z2l0IGEveGVuL2FyY2gvYXJtL3AybS5jIGIveGVuL2FyY2gvYXJtL3AybS5jCj4+PiBpbmRleCAz
MGNmYjAxLi41YjhmY2M1IDEwMDY0NAo+Pj4gLS0tIGEveGVuL2FyY2gvYXJtL3AybS5jCj4+PiAr
KysgYi94ZW4vYXJjaC9hcm0vcDJtLmMKPj4+IEBAIC0xMDY4LDkgKzEwNjgsMjQgQEAgaW50IHVu
bWFwX3JlZ2lvbnNfcDJtdChzdHJ1Y3QgZG9tYWluICpkLAo+Pj4gICAgaW50IG1hcF9tbWlvX3Jl
Z2lvbnMoc3RydWN0IGRvbWFpbiAqZCwKPj4+ICAgICAgICAgICAgICAgICAgICAgICAgIGdmbl90
IHN0YXJ0X2dmbiwKPj4+ICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgbnIs
Cj4+PiAtICAgICAgICAgICAgICAgICAgICAgbWZuX3QgbWZuKQo+Pj4gKyAgICAgICAgICAgICAg
ICAgICAgIG1mbl90IG1mbiwKPj4+ICsgICAgICAgICAgICAgICAgICAgICB1aW50MzJfdCBjYWNo
ZV9wb2xpY3kpCj4+Cj4+IFJhdGhlciB0aGFuIGV4dGVuZGluZyBtYXBfbW1pb19yZWdpb25zLCBJ
IHdvdWxkIHByZWZlciBpZiB3ZSBraWxsIHRoaXMKPj4gZnVuY3Rpb24gKGFuZCB1bm1hcF9tbWlv
X21taW9fcmVnaW9ucykgYW5kIGluc3RlYWQgdXNlIG1hcF9yZWdpb25zX3AybXQuCj4+Cj4+IFRo
aXMgbWVhbnMgdGhlIGNvbnZlcnNhdGlvbiB0byBwMm10IHNob3VsZCBiZSBkb25lIGluIHRoZSBE
T01DVEwgaGFuZGxpbmcuCj4gCj4gbWFwX3JlZ2lvbnNfcDJtdCBpcyBhbiBhcm0gc3BlY2lmaWMg
ZnVuY3Rpb24uIG1hcF9tbWlvX3JlZ2lvbnMgaXMgdGhlCj4gY29tbW9uIGZ1bmN0aW9uIGFjcm9z
cyB4ODYgYW5kIGFybSwgY2FsbGVkIGZyb20gY29tbW9uIGNvZGUuCgpJIHJlYWxseSBkaXNsaWtl
IHRoZSBpZGVhIHRvIGhhdmUgdHdvIGZ1bmN0aW9ucyBkb2luZyBleGFjdGx5IHRoZSBzYW1lIApi
dXQgaGF2ZSBkaWZmZXJlbnQgcGFyYW1ldGVycy4KCklmIG1hcF9yZWdpb25zX3AybXQgY2FuJ3Qg
YmUgdXNlZCBpbiB0aGUgY29tbW9uIGNvZGUsIHRoZW4gSSB3b3VsZCBsaWtlIAp0aGF0IG1hcF9t
bWlvX3JlZ2lvbnMgdG8gYmUgcmVuYW1lZCB0byBhcmNoX2RvbWN0bF9tYXBfbW1pb19yZWdpb25z
IChvciAKc29tZXRoaW5nIHNpbWlsYXIpLiBTbyBpdCBpcyBwcmV0dHkgY2xlYXIgaXQgc2hvdWxk
IGJlIG5vdCB1c2VkIGluIG90aGVyIApwbGFjZXMuCgpBbGwgdGhlIG90aGVyIGNhbGxlcnMgb2Yg
bWFwX21taW9fcmVnaW9ucyBzaG91bGQgYmUgcmVwbGFjZWQgd2l0aCAKbWFwX3JlZ2lvbnNfcDJt
dC4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
