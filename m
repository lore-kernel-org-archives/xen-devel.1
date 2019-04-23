Return-Path: <SRS0=MgWH=SZ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3453FC10F03
	for <xen-devel@archiver.kernel.org>; Tue, 23 Apr 2019 18:36:38 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF459217D9
	for <xen-devel@archiver.kernel.org>; Tue, 23 Apr 2019 18:36:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DF459217D9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hJ0HD-00047J-Tu; Tue, 23 Apr 2019 18:36:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Jhle=SZ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hJ0HC-00047C-Jq
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2019 18:36:18 +0000
X-Inumbo-ID: ad412fe0-65f6-11e9-912b-239f4e55a060
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ad412fe0-65f6-11e9-912b-239f4e55a060;
 Tue, 23 Apr 2019 18:36:16 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E5FA8ABAC;
 Tue, 23 Apr 2019 18:36:14 +0000 (UTC)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <20190423105457.17502-1-jgross@suse.com>
 <20190423105457.17502-4-jgross@suse.com>
 <alpine.DEB.2.10.1904230955190.24598@sstabellini-ThinkPad-X260>
From: Juergen Gross <jgross@suse.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jgross@suse.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <e744c7eb-1685-13b6-7ae9-e952f8f53ab0@suse.com>
Date: Tue, 23 Apr 2019 20:36:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.10.1904230955190.24598@sstabellini-ThinkPad-X260>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH 3/3] xen/swiotlb: remember having called
 xen_create_contiguous_region()
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
Cc: boris.ostrovsky@oracle.com, xen-devel@lists.xenproject.org,
 iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 konrad.wilk@oracle.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjMvMDQvMjAxOSAxOTowNSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+IE9uIFR1ZSwg
MjMgQXByIDIwMTksIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IEluc3RlYWQgb2YgYWx3YXlzIGNh
bGxpbmcgeGVuX2Rlc3Ryb3lfY29udGlndW91c19yZWdpb24oKSBpbiBjYXNlIHRoZQo+PiBtZW1v
cnkgaXMgRE1BLWFibGUgZm9yIHRoZSB1c2VkIGRldmljZSwgZG8gc28gb25seSBpbiBjYXNlIGl0
IGhhcyBiZWVuCj4+IG1hZGUgRE1BLWFibGUgdmlhIHhlbl9jcmVhdGVfY29udGlndW91c19yZWdp
b24oKSBiZWZvcmUuCj4+Cj4+IFRoaXMgd2lsbCBhdm9pZCBhIGxvdCBvZiB4ZW5fZGVzdHJveV9j
b250aWd1b3VzX3JlZ2lvbigpIGNhbGxzIGZvcgo+PiA2NC1iaXQgY2FwYWJsZSBkZXZpY2VzLgo+
Pgo+PiBBcyB0aGUgbWVtb3J5IGluIHF1ZXN0aW9uIGlzIG93bmVkIGJ5IHN3aW90bGIteGVuIHRo
ZSBQR19vd25lcl9wcml2XzEKPj4gZmxhZyBvZiB0aGUgZmlyc3QgYWxsb2NhdGVkIHBhZ2UgY2Fu
IGJlIHVzZWQgZm9yIHJlbWVtYmVyaW5nLgo+IAo+IEFsdGhvdWdoIHRoZSBwYXRjaCBsb29rcyBP
SywgdGhpcyBzZW50ZW5jZSBwdXp6bGVzIG1lLiBXaHkgZG8geW91IHNheQo+IHRoYXQgdGhlIG1l
bW9yeSBpbiBxdWVzdGlvbiBpcyBvd25lZCBieSBzd2lvdGxiLXhlbj8gQmVjYXVzZSBpdCB3YXMK
PiByZXR1cm5lZCBieSB4ZW5fYWxsb2NfY29oZXJlbnRfcGFnZXM/IEJvdGggdGhlIHg4NiBhbmQg
dGhlIEFybQo+IGltcGxlbWVudGF0aW9uIHJldHVybiBmcmVzaCBuZXcgbWVtb3J5LCBoZW5jZSwg
aXQgc2hvdWxkIGJlIHNhZmUgdG8gc2V0Cj4gdGhlIFBhZ2VPd25lclByaXYxIGZsYWc/Cj4gCj4g
TXkgY29uY2VybiB3aXRoIHRoaXMgYXBwcm9hY2ggaXMgd2l0aCB0aGUgc2VtYW50aWNzIG9mIFBH
X293bmVyX3ByaXZfMS4KPiBJcyBhIHBhZ2UgbWFya2VkIHdpdGggUEdfb3duZXJfcHJpdl8xIG9u
bHkgc3VwcG9zZWQgdG8gYmUgdXNlZCBieSB0aGUKPiBvd25lcj8KClRoZSBvd25lciBvZiB0aGUg
cGFnZSBpcyBmcmVlIHRvIHVzZSB0aGUgZmxhZy4KCkxpa2UgR3JhbnQgcGFnZXMgYXJlIG1hcmtl
ZCBieSB0aGUgZ3JhbnQgZHJpdmVyIHVzaW5nIHRoaXMgZmxhZy4gQW5kClhlbiBwYWdlIHRhYmxl
cyBhcmUgdXNpbmcgaXQgaW4gUFYtZ3Vlc3RzIGZvciBpbmRpY2F0aW5nIGEgIlBpbm5lZCIKcGFn
ZSB0YWJsZS4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
