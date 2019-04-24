Return-Path: <SRS0=MKw+=S2=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65988C10F11
	for <xen-devel@archiver.kernel.org>; Wed, 24 Apr 2019 15:02:11 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 38BBF2084F
	for <xen-devel@archiver.kernel.org>; Wed, 24 Apr 2019 15:02:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 38BBF2084F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hJJPL-0005pi-Ge; Wed, 24 Apr 2019 15:01:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8RIj=S2=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hJJPK-0005pd-LM
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2019 15:01:58 +0000
X-Inumbo-ID: e76eb86c-66a1-11e9-b0b9-9f0e5a534887
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id e76eb86c-66a1-11e9-b0b9-9f0e5a534887;
 Wed, 24 Apr 2019 15:01:57 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C7A8F374;
 Wed, 24 Apr 2019 08:01:56 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 978953F557;
 Wed, 24 Apr 2019 08:01:55 -0700 (PDT)
To: Andre Przywara <andre.przywara@arm.com>, Amit Tomer <amittomer25@gmail.com>
References: <1555252419-17121-1-git-send-email-amittomer25@gmail.com>
 <58cbfc08-720c-0d55-75ac-f14dc3799036@arm.com>
 <e60a9e5a-6492-4232-2400-128fce246cc8@arm.com>
 <CABHD4K98oAZURhvraK5F1RHkv0j2YzaCkV8bsBX-=Cc3xc0irA@mail.gmail.com>
 <20190415094139.25256f06@donnerap.cambridge.arm.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <9055daf1-7ab7-f24f-01e8-09e33d503d02@arm.com>
Date: Wed, 24 Apr 2019 16:01:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190415094139.25256f06@donnerap.cambridge.arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/arm: Blacklist PMU with "arm,
 cortex-a53-pmu"
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
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"; format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190424150154.eCwUWFbrmyLKvrd6vB86IhEjUGb5x1sBHb85nK23tw4@z>

SGksCgpPbiAxNS8wNC8yMDE5IDA5OjQxLCBBbmRyZSBQcnp5d2FyYSB3cm90ZToKPiBPbiBNb24s
IDE1IEFwciAyMDE5IDEzOjQxOjQxICswNTMwCj4gQW1pdCBUb21lciA8YW1pdHRvbWVyMjVAZ21h
aWwuY29tPiB3cm90ZToKPiAKPj4gSGVsbG8sCj4+Cj4+PiBBZnRlciB0YWxraW5nIHZpYSBJUkMs
IHRoZSBwcm9ibGVtIGlzIFBQSXMsIHRoYXQgdGhpcyBwbGF0Zm9ybSB1c2VzIGZvcgo+Pj4gUE1V
IGludGVycnVwdHMuIFdoZW4gWGVuIHRyaWVzIHRvIHNldHVwIHRoZSBJUlEgZm9yd2FyZGluZyBm
b3IgRG9tMCBmb3IKPj4+IHRoaXMgZGV2aWNlLCBpdCBmYWlscyBiZWNhdXNlIGl0IG9ubHkgc3Vw
cG9ydHMgZm9yd2FyZGluZyBTUElzLgo+Pj4gU28gaW50ZXJlc3RpbmdseSB3ZSBlcnJvbmVvdXNs
eSBmb3J3YXJkZWQgQTUzIFBNVXMgKHRob3NlIHRoYXQgYXJlCj4+PiBkZXNjcmliZWQgYnkgdGhh
dCBwYXJ0aWN1bGFyIGNvbXBhdGlibGUgc3RyaW5nIG9ubHkpIHRvIERvbTAgZm9yIHF1aXRlIGEK
Pj4+IHdoaWxlLCBidXQgbm9ib2R5IG5vdGljZWQgKG9yIGNhcmVkKS4KPj4+Cj4+PiBBbWl0LCBw
bGVhc2UgYWRqdXN0IHRoZSBjb21taXQgbWVzc2FnZSBhY2NvcmRpbmdseS4KPj4+ICAgCj4+IE9r
IGJ1dCBvcmlnaW5hbCBjb21taXQgImQ0NWU5YjdjNTM0MjhhMmFhNGQwNjc5MjdlN2VmNWUzMDc4
M2ZiOGIiIHRoYXQgYmxhY2tsaXN0Cj4+IFBNVSdzIGNsZWFybHkgc3RhdGVzIHRoYXQgaXNzdWUg
aXMgZHVlIHRvIFBQSSBhbmQgdGhhdCBjYW4gbm90IGJlCj4+IHJvdXRlZCB0byBndWVzdC4KPj4K
Pj4gSSB0aG91Z2h0LCBUaGlzIHBhdGNoIGlzIGp1c3QgY29udGludWF0aW9uIG9mIHNhbWUuCj4g
Cj4gU3VyZSwgYnV0IEp1bGllbiB3YXMgYXNraW5nIGZvciBhIHJlYXNvbiBmb3IgdGhpcyBwYXRj
aCBpbiB0aGUgY29tbWl0Cj4gbWVzc2FnZS4gVGhlcmUgYXJlIHF1aXRlIHNvbWUgcGxhdGZvcm1z
IHdoaWNoIHVzZSB0aGlzIGNvbXBhdGlibGUgc3RyaW5nCj4gYWxyZWFkeSwgYW5kIG5vbmUgb2Yg
dGhlbSBmYWlsZWQgc28gZmFyLiBUaGlzIGlzIGJlY2F1c2UgdGhleSB1c2UgU1BJcywKPiBidXQg
YXMgdGhlIG9yaWdpbmFsIGNvbW1pdCBtZXNzYWdlIG1lbnRpb25zIHRoZXJlIGFyZSBtb3JlIGlz
c3VlcyB0aGFuIGp1c3QKPiB0aGUgSVJRcy4KPiAKPiBBbGwgdGhpcyBzaG91bGQgYmUgaW4gdGhl
IGNvbW1pdCBtZXNzYWdlLiBBcyB5b3UgaGF2ZSBzZWVuIHlvdXJzZWxmIGluIElhbidzCj4gY29t
bWl0LCBpdCdzIHF1aXRlIGhlbHBmdWwgbGF0ZXIgb24uCj4gCj4gU28geW91IHNob3VsZCBtZW50
aW9uOgo+IGEpIHRoZSBwcm9ibGVtIHlvdSBlbmNvdW50ZXJlZDogUFBJIGZvcndhcmRpbmcgZGVu
aWVkIG9uIGlNWDgKPiBiKSB0aGUgcmVhc29uIGZvciB0aGUgcHJvYmxlbTogQTUzIFBNVSBub3Qg
YmxhY2tsaXN0ZWQKPiBjKSB0aGUgZml4OiBhZGRpbmcgdGhlIEE1MyBjb21wYXRpYmxlIHN0cmlu
ZyB0byB0aGUgYmxhY2tsaXN0CgpUaGVyZSBhcmUgfjI1IGNvbXBhdGlibGUgc3RyaW5nIGZvciB0
aGUgUE1VcyBhbmQgSSB3b3VsZCByYXRoZXIgbm90IHdhbnQgdG8gc2VlIAphbGwgb2YgdGhlbSBh
ZGRlZCBpbiBYZW4uCgogRnJvbSB0aGUgdGVzdCBvbiBKdW5vIChpdCBpcyB1c2luZyBhcm0sY29y
dGV4LWE1My1wbXUgd2l0aCBTUElzKSwgTGludXggd2lsbCAKaGFwcGlseSBnaXZlIHVwIGJlY2F1
c2Ugd2UgY3JhZnQgdGhlIFBNVSByZWdpc3RlcnMgdG8gZXhwb3NlIG5vdGhpbmcuCgpDb3VsZCB3
ZSBpbnN0ZWFkIHRyeSB0byBhdXRvbWF0aWNhbGx5IGJsYWNrbGlzdCBhbnkgZGV2aWNlIHVzaW5n
IFBQST8KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
