Return-Path: <SRS0=w6oi=S3=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FB3AC4321A
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 15:33:31 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C7D03205ED
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 15:33:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C7D03205ED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hJgMz-0000um-Tr; Thu, 25 Apr 2019 15:33:05 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=nzHz=S3=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hJgMy-0000uh-Ig
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2019 15:33:04 +0000
X-Inumbo-ID: 6999c41d-676f-11e9-843c-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 6999c41d-676f-11e9-843c-bc764e045a96;
 Thu, 25 Apr 2019 15:33:02 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1464E80D;
 Thu, 25 Apr 2019 08:33:02 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 92E6A3F557;
 Thu, 25 Apr 2019 08:32:59 -0700 (PDT)
To: Jan Beulich <JBeulich@suse.com>
References: <20190415052502.1067-1-jgross@suse.com>
 <bad92fbd-6513-4b11-7668-74af70bf7176@arm.com>
 <5CC1CF0A020000780022920A@prv1-mh.provo.novell.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <dabb943e-d5a5-31c1-b4d5-e3012ac10beb@arm.com>
Date: Thu, 25 Apr 2019 16:32:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5CC1CF0A020000780022920A@prv1-mh.provo.novell.com>
Content-Language: en-US
Subject: Re: [Xen-devel] Xen 4.13 Development Update
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
 Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Marek Marczykowski <marmarek@invisiblethingslab.com>,
 Dario Faggioli <dfaggioli@suse.com>, Paul Durrant <paul.durrant@citrix.com>,
 committers@xenproject.org, Pu Wen <puwen@hygon.cn>,
 Luwei Kang <luwei.kang@intel.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Chao Gao <chao.gao@intel.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"; format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190425153258.LjLs9Ax0TBhQwkWdtez1vVq7lr-YJKCMTPLyapUv86Y@z>

SGksCgpPbiAyNS8wNC8yMDE5IDE2OjE1LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+PiBPbiAyNS4w
NC4xOSBhdCAxNjo1NywgPGp1bGllbi5ncmFsbEBhcm0uY29tPiB3cm90ZToKPj4gT24gMTUvMDQv
MjAxOSAwNjoyNSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4+IFRoaXMgZW1haWwgb25seSB0cmFj
a3MgYmlnIGl0ZW1zIGZvciB4ZW4uZ2l0IHRyZWUuIFBsZWFzZSByZXBseSBmb3IgaXRlbXMgeW91
Cj4+PiB3b3VsZCBsaWtlIHRvIHNlZSBpbiA0LjEzIHNvIHRoYXQgcGVvcGxlIGhhdmUgYW4gaWRl
YSB3aGF0IGlzIGdvaW5nIG9uIGFuZAo+Pj4gcHJpb3JpdGlzZSBhY2NvcmRpbmdseS4KPj4KPj4g
VGhvc2UgZS1tYWlscyBiZWNvbWUgZWFzaWx5IHVubm90aWNlZCBvbiB4ZW4tZGV2ZWwgd2hlbiB5
b3UgYXJlIG5vdCBDQ2VkLiBJbiBhbGwKPj4gaG9uZXN0eSwgSSBwcm9iYWJseSBtaXNzZWQgdGhl
IGFsbCB0aG9zZSBlLW1haWxzIGZvciB0aGUgcGFzdCB5ZWFyIGJlY2F1c2UgdGhleQo+PiBkaWRu
J3QgbGFuZCBpbiBteSBpbmJveC4gWWVzIEkgdGhpbmsgdGhleSBhcmUgaW1wb3J0YW50IGZvciB0
aGUgbWFpbnRhaW5lcnMgdG8KPj4gc2VlIHdoYXQncyBnb2luZyBvbi4KPiAKPiBTbyB5b3UncmUg
bm90IHN1YnNjcmliZWQgdG8geGVuLWRldmVsPwoKTm90IGV2ZXJ5b25lIGhhcyB0aW1lIHRvIGdv
IHRocm91Z2ggeGVuLWRldmVsLiBJIG9ubHkgcmVjZWl2ZWQgZS1tYWlsIHdoZXJlIEkgYW0gCkND
ZWQgaW4gbXkgaW5ib3guIEFsbCB0aGUgb3RoZXJzIGFyZSBxdWV1ZWQgaW4gYSBmb2xkZXIuCgo+
IAo+PiBDb3VsZCB3ZSBmaW5kIGEgd2F5IHRvIGVhc2lseSBmaWx0ZXIgdGhlbT8gT24gSVJDLCBK
dWVyZ2VuIHN1Z2dlc3RlZCBbUHJvY2Nlc10uCj4+IEFueSBvcGluaW9ucz8KPiAKPiBIb3cgd291
bGQgYSB0YWcgaGVscD8gVGhhdCB0YWcgd291bGQgYmUgdGhlcmUgb24gYWxsIHRoZSByZXBsaWVz
Cj4gb2YgcGVvcGxlIG5vdCB0cmltbWluZyB0aGUgQ2MgbGlzdHMuIEFuZCBpZiB5b3UgYXNrZWQg
dGhlbSB0byBkcm9wCj4gdGhlIHRhZywgdGhleSdkIHN1cmVseSBob25vciB0aGUgcmVxdWVzdCBh
cyBtdWNoIGFzIHRoZXkgZG8KPiBob25vciB0aGUgQ2MgbGlzdCBjbGlwcGluZyBvbmUuCgpJIGhv
bmVzdGx5IGRvbid0IGV4cGVjdCBhIGxvdyB2b2x1bWUgb2YgZS1tYWlsIG9uIHN1Y2ggdGFnZ2Vk
IGUtbWFpbC4gU28gSSBkb24ndCAKc2VlIGFueSBjb25jZXJuIGhlcmUuCgo+IAo+IEkndmUgYWxz
byBqdXN0IHNlZW4gdGhlIG1lbnRpb24gb24gYW4gImltcG9ydGFudCIgdGFnIG9uIElSQzogSSdt
Cj4gYWZyYWlkIEknbSBhZ2FpbnN0IHRoYXQgYXMgd2VsbC4gV2hhdCBpcyBvciBpcyBub3QgaW1w
b3J0YW50IHRvIGEKPiBwYXJ0aWN1bGFyIGluZGl2aWR1YWwgaXMgZW50aXJlbHkgdXAgdG8gdGhl
bS4KPiAKPiBJIGd1ZXNzIGlmIHRoZSBjdXJyZW50IG1haWwgbW9kZWwgZG9lc24ndCB3b3JrIGZv
ciB5b3UgYW5kIG1heWJlCj4gb3RoZXJzLCB0aGVuIHBlcmhhcHMgaXQgd291bGQgYmUgYmVzdCBp
ZiB0aGVyZSB3YXMgYSBjYW5vbmljYWwKPiBzdWJqZWN0IHVzZWQsIHNvIHlvdSBhbmQgb3RoZXJz
IGNvdWxkIHRoZW4gZ28gYW5kIGh1bnQgZG93bgo+IHRoZSBtb3N0IHJlY2VudCBpbnN0YW5jZSBp
biB0aGUgbGlzdCBhcmNoaXZlcz8KClRoZSBjYW5vbmljYWwgc3ViamVjdCBvbmx5IHdvcmtzIGZv
ciBvbmUgc29ydCBvZiBlLW1haWwuIEl0IGRvZXMgbm90IHNjYWxlIGlmIAp5b3UgaGF2ZSBhbGwg
c29ydCBvZiByZWxlYXNlIGUtbWFpbCAoZS5nIGJyYW5jaGluZywgY29tbWl0IG1vcmF0b3JpdW0u
Li4pLgoKSSBrbm93IGFzIGNvbW1pdHRlcnMgd2UgYXJlIENDZWQgaW4gc29tZSBvZiB0aG9zZSBl
LW1haWxzLiBCdXQgdGhhdCBkb2VzIG5vdCAKbWFrZSBpdCB2ZXJ5IGVhc3kgZm9yIG90aGVycy4K
CkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
