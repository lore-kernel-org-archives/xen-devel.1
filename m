Return-Path: <SRS0=JVlm=TD=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87E46C43219
	for <xen-devel@archiver.kernel.org>; Fri,  3 May 2019 14:17:14 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 59DF82075E
	for <xen-devel@archiver.kernel.org>; Fri,  3 May 2019 14:17:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 59DF82075E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hMYzi-0005Or-Fo; Fri, 03 May 2019 14:16:58 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Vigr=TD=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hMYzh-0005Om-4H
 for xen-devel@lists.xenproject.org; Fri, 03 May 2019 14:16:57 +0000
X-Inumbo-ID: 1ab6e72d-6dae-11e9-843c-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 1ab6e72d-6dae-11e9-843c-bc764e045a96;
 Fri, 03 May 2019 14:16:55 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E18BD374;
 Fri,  3 May 2019 07:16:54 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C5F2A3F5C1;
 Fri,  3 May 2019 07:16:53 -0700 (PDT)
To: Wei Liu <wei.liu2@citrix.com>
References: <CAOcoXZZtsXQMp0EzFAa2WEBL1sEUcFsNozaQshsnNEs3=NQK3g@mail.gmail.com>
 <CAOcoXZY6jpPKcWTXPqz0sr=Amw7J0KSaBRWiRnQRgTC2XR=hjQ@mail.gmail.com>
 <f95ad35b-42f6-4df2-cade-7a8115f9e49a@arm.com>
 <CAOcoXZaMLfHSyLSE04xRFZZY0hLkFcJ5cBqHTdmwDoqwcreD1w@mail.gmail.com>
 <ff543e3c-0619-5aa6-b36a-e1a8b8cce886@arm.com>
 <20190503110819.GA5900@zion.uk.xensource.com>
 <63ea8905-87ca-a419-95bf-ae497bf1ff85@arm.com>
 <20190503134133.GC5900@zion.uk.xensource.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <b0947b60-d89a-54a5-a11b-708b64ff8053@arm.com>
Date: Fri, 3 May 2019 15:16:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190503134133.GC5900@zion.uk.xensource.com>
Content-Language: en-US
Subject: Re: [Xen-devel] Xen GCC coverage ARM64 testing - Unexpected Trap:
 Data Abort
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
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 Andrii_Anisov@epam.com, Viktor Mitin <viktor.mitin.19@gmail.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"; format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190503141652.NasPlKkhefKqMArPo8EmiSwtrvc6Y1Dzzt0s3AM-lDc@z>

SGksCgpPbiAwMy8wNS8yMDE5IDE0OjQxLCBXZWkgTGl1IHdyb3RlOgo+IE9uIEZyaSwgTWF5IDAz
LCAyMDE5IGF0IDAyOjM1OjA4UE0gKzAxMDAsIEp1bGllbiBHcmFsbCB3cm90ZToKPj4gSGkgV2Vp
LAo+Pgo+PiBPbiA1LzMvMTkgMTI6MDggUE0sIFdlaSBMaXUgd3JvdGU6Cj4+PiBPbiBUaHUsIE1h
eSAwMiwgMjAxOSBhdCAwOTo0MzoxN1BNICswMTAwLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+Pj4g
KCsgV2VpKQo+Pj4+Cj4+Pj4gT24gNS8yLzE5IDU6NTUgUE0sIFZpa3RvciBNaXRpbiB3cm90ZToK
Pj4+Pj4gSGkgSnVsaWVuLAo+Pj4+Cj4+Pj4gSGksCj4+Pj4KPj4+Pj4gUGxlYXNlIGZpbmQgdHJh
Y2UgbG9nIGJlbG93Ogo+Pj4+Pgo+Pj4+PiByb290QGgzdWxjYjp+IyB4ZW5jb3YgcmVzZXQKPj4+
Pj4gKFhFTikgRGF0YSBBYm9ydCBUcmFwLiBTeW5kcm9tZT0weDcKPj4+Pj4gKFhFTikgV2Fsa2lu
ZyBIeXBlcnZpc29yIFZBIDB4MzYxNzAwIG9uIENQVTMgdmlhIFRUQlIgMHgwMDAwMDAwMDc4MjY2
MDAwCj4+Pj4gU28gdGhpcyBpcyBhIGRhdGEgYWJvcnQgd2hlbiB0cnlpbmcgdG8gYWNjZXNzIFZB
IDB4MzYxNzAwIChpdCBpcyBwYXJ0IG9mIFhlbgo+Pj4+IGl0c2VsZikuIEkgbWlzcmVhZCB0aGUg
QXJtIEFybSBiZWZvcmUsIHdoaWxlIElTViBpcyAwIERGU0Mgd2lsbCBzdGlsbAo+Pj4+IHByb3Zp
ZGUgYSBjb3JyZWN0IHZhbHVlLiBTbyBoZXJlIHdlIGhhdmUgYSAiVHJhbnNsYXRpb24gZmF1bHQs
IGxldmVsIDMiLgo+Pj4+Cj4+Pj4gV2hpY2ggbWFrZXMgc2Vuc2UgYmVjYXVzZSAuLi4KPj4+Pgo+
Pj4+Cj4+Pj4+IChYRU4pIDBUSFsweDBdID0gMHgwMDAwMDAwMDc4MjY1ZjdmCj4+Pj4+IChYRU4p
IDFTVFsweDBdID0gMHgwMDAwMDAwMDc4MjYyZjdmCj4+Pj4+IChYRU4pIDJORFsweDFdID0gMHgw
MDQwMDAwMDc4MjVmZjdmCj4+Pj4+IChYRU4pIDNSRFsweDE2MV0gPSAweDAwNjAwMDAwNzgxZTFm
N2UKPj4+Pgo+Pj4+IHRoZSAzcmQgZW50cnkgaXMgbm90IHZhbGlkLiBJIG1hbmFnZWQgdG8gcmVk
dWNlIHRoZSBlcnJvciBhbmQgaXQgbG9va3MgbGlrZQo+Pj4+IGdjb3YgaXMgdHJ5aW5nIHRvIGFj
Y2VzcyBhIGNvdW50ZXIgaW4gdGhlIHNlY3Rpb24gaW5pdC5kYXRhLgo+Pj4+Cj4+Pj4gQXMgYWxs
IHRoZSAuaW5pdC4qIHNlY3Rpb25zIGFyZSBzdHJpcHBlZCBhZnRlciBib290LCBpdCBtZWFucyB0
aGF0IGFueXRoaW5nCj4+Pj4gaW4gLmluaXQuZGF0YSBjYW5ub3QgYmUgYWNjZXNzZWQgYW55bW9y
ZS4KPj4+Pgo+Pj4+IFdlaSwgaG93IGRvIHlvdSBkZWFsIHdpdGggY291bnRlcnMgaW4gaW5pdC5k
YXRhIG9uIHg4Nj8KPj4+Cj4+PiBUaGUgYnVpbGQgc3lzdGVtIGV4cGxpY2l0bHkgY29tcGlsZSBh
bnkgLmluaXQgYmluYXJ5IHdpdGhvdXQgZ2Nvdgo+Pj4gb3B0aW9uLiBTbyBtYXliZSBzb21lIGZp
bGUgd2FzIG5vdCBjb3JyZWN0bHkgYWRkZWQ/Cj4+Cj4+IFRoYW5rIHlvdSBmb3IgdGhlIHBvaW50
ZXIuIFRoZSBwcm9ibGVtIGlzIGNvbWluZyBmcm9tIGxpYmZkdC4gVGhlIGVudGlyZQo+PiBsaWJy
YXJ5IGlzIG1vdmVkIHRvIC5pbml0IHVzaW5nOgo+Pgo+PiAgICQoT0JKQ09QWSkgJChmb3JlYWNo
IHMsJChTRUNUSU9OUyksLS1yZW5hbWUtc2VjdGlvbiAuJChzKT0uaW5pdC4kKHMpKSAkPCAkQAo+
Pgo+PiBTbyB3ZSBuZWVkIHRvIHRlbGwgdGhlIHRvcCBNYWtlZmlsZSB0byBmaWx0ZXIgb3V0IGxp
YmZkdC4gVGhlIHBhdGNoIGJlbG93Cj4+IHNob3VsZCBkbyB0aGUgam9iOgo+Pgo+PiBkaWZmIC0t
Z2l0IGEveGVuL2NvbW1vbi9saWJmZHQvTWFrZWZpbGUgYi94ZW4vY29tbW9uL2xpYmZkdC9NYWtl
ZmlsZQo+PiBpbmRleCBkODFmNTRiNmI4Li5jMDc1YmJmNTQ2IDEwMDY0NAo+PiAtLS0gYS94ZW4v
Y29tbW9uL2xpYmZkdC9NYWtlZmlsZQo+PiArKysgYi94ZW4vY29tbW9uL2xpYmZkdC9NYWtlZmls
ZQo+PiBAQCAtMyw2ICszLDcgQEAgaW5jbHVkZSBNYWtlZmlsZS5saWJmZHQKPj4gICBTRUNUSU9O
UyA6PSB0ZXh0IGRhdGEgJChTUEVDSUFMX0RBVEFfU0VDVElPTlMpCj4+Cj4+ICAgb2JqLXkgKz0g
bGliZmR0Lm8KPj4gK25vY292LXkgKz0gbGliZmR0Lm8KPj4KPj4gICBDRkxBR1MgKz0gLUkkKEJB
U0VESVIpL2luY2x1ZGUveGVuL2xpYmZkdC8KPj4KPj4gV2hpbGUgbG9va2luZyBhdCB0aGUgY29k
ZSwgSSBub3RpY2VkIGxpYmVsZiBpcyBhbHNvIGJ1aWx0IHdpdGggY292ZXJhZ2UgYnV0Cj4+IGlu
IC5pbml0IHNlY3Rpb24uIFNvIEkgd291bGQgZXhwZWN0IHRoZSBzYW1lIGVycm9yIG9uIHg4Niwg
ZGlkIHlvdSB0cnkKPj4gInhlbmNvdiByZXNldCIgb24geDg2Pwo+IAo+IEkgZGlkLiBJdCB3b3Jr
ZWQuIFRob3VnaCBhdCB0aGlzIHBvaW50IEknbSBub3Qgc3VyZSB3aHkgaXQgd29ya2VkLiA6LS8K
CkkgdGhpbmsgSSBrbm93IHdoeSwgb25seSB0aGUgc2VjdGlvbnMgLnRleHQgYW5kIC5kYXRhIGFy
ZSBwcmVmaXhlZCB3aXRoIC5pbml0LiAKSW4gdGhlIGNhc2Ugb2YgbGliZWxmLCBub25lIG9mIHRo
ZSBHQ09WIHN5bWJvbHMgc2VlbXMgdG8gYmUgbG9jYXRlZCBpbiAuZGF0YS4KCkZvciBsaWJmZHQs
IHNvbWUgb2YgdGhlbSBhcmUgbG9jYXRlZCBpbiAuZGF0YSAocmVuYW1lZCB0byAuaW5pdC5kYXRh
KS4gSGVuY2UgdGhlIApkaWZmZXJlbmNlIGluIGJlaGF2aW9yLgoKV2Ugc2hvdWxkIHByb2JhYmx5
IGZpeGVkIHRoZSB0d28gbGlicmFyaWVzIGFzIHRoaXMgaXMgcXVpdGUgZnJhZ2lsZSBmb3IgbGli
ZWxmIAphcyB3ZWxsLgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
