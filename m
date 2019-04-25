Return-Path: <SRS0=w6oi=S3=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 881A9C10F03
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 12:54:08 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 83F6620644
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 12:54:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 83F6620644
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hJdsz-0003TQ-Pp; Thu, 25 Apr 2019 12:53:57 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=nzHz=S3=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hJdsy-0003TG-E4
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2019 12:53:56 +0000
X-Inumbo-ID: 2f018231-6759-11e9-843c-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 2f018231-6759-11e9-843c-bc764e045a96;
 Thu, 25 Apr 2019 12:53:55 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CBEB0A78;
 Thu, 25 Apr 2019 05:53:54 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2170D3F5C1;
 Thu, 25 Apr 2019 05:53:52 -0700 (PDT)
To: Jan Beulich <JBeulich@suse.com>, Ian Jackson <ian.jackson@citrix.com>
References: <20190418123159.GD30543@zion.uk.xensource.com>
 <5b7cd86e-e664-d5f1-9262-f7671dc3395a@citrix.com>
 <23736.33638.713410.602994@mariner.uk.xensource.com>
 <5CC1A9FD02000078002290A8@prv1-mh.provo.novell.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <8b2130fd-dd48-fcdc-4f8b-0e1f6f698808@arm.com>
Date: Thu, 25 Apr 2019 13:53:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5CC1A9FD02000078002290A8@prv1-mh.provo.novell.com>
Content-Language: en-US
Subject: Re: [Xen-devel] Xen project CI systems and committer workflow
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
Cc: Juergen Gross <jgross@suse.com>, Lars Kurth <lars.kurth@citrix.com>,
 Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Doug Goldstein <cardoe@cardoe.com>, committers@xenproject.org,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"; format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190425125351.iPls5bDe5-nCO2_xxfanYiUfRdB7p5Dqazmabdt22gc@z>

SGkgSmFuLAoKT24gMjUvMDQvMjAxOSAxMzozNywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24g
MTguMDQuMTkgYXQgMTY6MDIsIDxpYW4uamFja3NvbkBjaXRyaXguY29tPiB3cm90ZToKPj4gQW5k
cmV3IENvb3BlciB3cml0ZXMgKCJSZTogWGVuIHByb2plY3QgQ0kgc3lzdGVtcyBhbmQgY29tbWl0
dGVyIHdvcmtmbG93Iik6Cj4+PiBXaGlsZSBldmVyeXRoaW5nIHByZXNlbnRlZCBoZXJlIGlzIGZp
bmUgdG8gZG8gYXMgYSBtYXR0ZXIgb2YgcG9saWN5LCB0aGUKPj4+IGNvbW1pdHRlcnMgc3RpbGwg
bmVlZCB0byByZXRhaW4gdGhlIGFiaWxpdHkgdG8gYWN0dWFsbHkgcHVzaCBkaXJlY3RseSB0bwo+
Pj4gdGhlIHN0YWdpbmcgYnJhbmNoZXMgb24geGVuLmdpdAo+Pgo+PiBXaHkgPwo+Pgo+PiBJbiBw
YXJ0aWN1bGFyLCB0aGlzIHNlZW1zIHRvIHByZXN1cHBvc2UgdGhhdCB0aGVzZSAic3RhZ2luZyIg
YnJhbmNoZXMKPj4gY29udGludWUgdG8gZXhpc3QuCj4+Cj4+IE9uZSBvZiBvdXIgc3RyYW5nZSBw
cmFjdGljZXMgaXMgdGhhdCB3ZSBwdXNoIHRoaW5ncyB0byBhIG5vbi1yZXdpbmRpbmcKPj4gYnJh
bmNoIGJlZm9yZSB0aGV5IGhhdmUgYmVlbiB0ZXN0ZWQuICBOb3csIE9LLCB3ZSBoYXZlIGJlZW4g
ZG9pbmcgdGhhdAo+PiBmb3Igb3ZlciBhIGRlY2FkZSAtIHNpbmNlIGJlZm9yZSBwZW9wbGUgcmVh
bGx5IGludmVudGVkIHRoZSBtb2Rlcm4KPj4gY29uY2VwdCBvZiAiQ0kiIC0gYnV0IHRoYXQgZG9l
c24ndCBtYWtlIGl0IHNlbnNpYmxlLgo+IAo+IE5vdyB0aGUgcXVlc3Rpb24gb2YgY291cnNlIGlz
IC0gd2h5IGRvIHlvdSBjb25zaWRlciB0aGlzIHByYWN0aWNlCj4gInN0cmFuZ2UiPyBBbmQgd2hh
dCBkbyB5b3UgbWVhbiBieSAiYmVmb3JlIHRoZXkgaGF2ZSBiZWVuCj4gdGVzdGVkIj8gQW55IHN1
Ym1pdHRlciBzaG91bGQgaGF2ZSB0ZXN0ZWQgdGhlaXIgcGF0Y2hlcy4gWWVzLCBub3QKPiBldmVy
eW9uZSB0ZXN0cyBhbGwgcG9zc2libGUgKGJhc2ljKSBjb25maWd1cmF0aW9ucywgYnV0IHdlIHNw
b3QKPiBzdWNoIGlzc3VlcyBpbiByZXZpZXcgbW9yZSBvZnRlbiB0aGFuIHRoZXkgc2xpcCB0aHJv
dWdoLCBJIHRoaW5rLgoKSXQgaXMgZmFpcmx5IGNvbW1vbiB0byBzZWUgYnJlYWthZ2Ugb24gQXJt
IGJlY2F1c2UgY2hhbmdlcyB3YXMgb25seSBjb21waWxlZCBvbiAKeDg2LiBUaGUgbW9zdCBjb21t
b24gYXJndW1lbnQgaXMgIkkgZG9uJ3QgaGF2ZSBzZXR1cCB0byBidWlsZCBBcm0iLgoKVGhlIENJ
IHdvdWxkIGFsbG93IHVzIHRvIHRlc3Qgb24gZXZlcnkgYXJjaCwgZGlmZmVyZW50IHZhcmlhdGlv
biBvZiAuY29uZmlnIChhbmQgCnBvc3NpYmx5IGNvbXBpbGVyKS4KCj4gQW5kIEkgZG9uJ3QgZXhw
ZWN0IENJIHdpbGwgY29tZSBhbnl3aGVyZSBuZWFyIHRlc3RpbmcgYWxsCj4gX3Bvc3NpYmxlXyBj
b25maWd1cmF0aW9ucywgaS5lLiB0aGUgcmlzayBvZiBzdWJ0bGUgYnJlYWthZ2Ugd29uJ3QKPiBn
ZXQgZWxpbWluYXRlZCBhbHRvZ2V0aGVyIGFueXdheS4KCk5vdGhpbmcgaXMgZnVsbHkgYnVsbGV0
LXByb29mLCBidXQgdGhpcyBpcyBhbiBpbXByb3ZlbWVudCBvdmVyIG1hbnVhbCB0ZXN0aW5nIG9u
IAptb3N0IG9mIHRoZSBidWlsZCBjb25maWd1cmF0aW9uIHRvZGF5LiBUaGUgQ0kgYWN0dWFsbHkg
cHJvdmVkIHRoZSB1c2VmdWxuZXNzIGJ5IApjYXRjaGluZyBidWlsZCBidWcgaW4gcmFuZG9tIC5j
b25maWcgdGhlIGxhc3QgZmV3IG1vbnRocy4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
