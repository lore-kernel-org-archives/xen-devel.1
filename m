Return-Path: <SRS0=LbOi=SU=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3EB8C10F0E
	for <xen-devel@archiver.kernel.org>; Thu, 18 Apr 2019 18:57:41 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7EE022186A
	for <xen-devel@archiver.kernel.org>; Thu, 18 Apr 2019 18:57:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7EE022186A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hHCDm-0007xU-1p; Thu, 18 Apr 2019 18:57:18 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Z9nG=SU=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hHCDl-0007xP-7C
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2019 18:57:17 +0000
X-Inumbo-ID: c842ee9b-620b-11e9-92d7-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id c842ee9b-620b-11e9-92d7-bc764e045a96;
 Thu, 18 Apr 2019 18:57:15 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4ED27A78;
 Thu, 18 Apr 2019 11:57:15 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 19B693F5AF;
 Thu, 18 Apr 2019 11:57:13 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <20190327184531.30986-1-julien.grall@arm.com>
 <20190327184531.30986-6-julien.grall@arm.com>
 <2af3ed7f-00d4-2eb7-0dde-c9570578dd4e@citrix.com>
 <bac73177-1ff7-7b7c-6852-832f88707555@arm.com>
 <alpine.DEB.2.10.1904171322560.1370@sstabellini-ThinkPad-X260>
 <888ddebb-7019-45b7-aa84-9ba3cf4bfe7e@arm.com>
 <alpine.DEB.2.10.1904181131450.1370@sstabellini-ThinkPad-X260>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <eb9dd02e-3b0d-19fc-9103-c7ceccc626ab@arm.com>
Date: Thu, 18 Apr 2019 19:57:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.10.1904181131450.1370@sstabellini-ThinkPad-X260>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 05/12] xen/arm64: bitops: Match the register
 size with the value size in flsl
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
Cc: "Artem_Mygaiev@epam.com" <Artem_Mygaiev@epam.com>,
 "Andrii_Anisov@epam.com" <Andrii_Anisov@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 "Oleksandr_Tyshchenko@epam.com" <Oleksandr_Tyshchenko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 nd <nd@arm.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"; format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190418185712.DZrCtAbPTV4QicCHptSCVwZPjt6Nk__oRY_epJr9uAY@z>

SGksCgpPbiAxOC8wNC8yMDE5IDE5OjQwLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4gT24g
V2VkLCAxNyBBcHIgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+PiBPbiA0LzE3LzE5IDk6MjQg
UE0sIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPj4+IE9uIFdlZCwgMjcgTWFyIDIwMTksIEp1
bGllbiBHcmFsbCB3cm90ZToKPj4+PiBIaSwKPj4+Pgo+Pj4+IE9uIDI3LzAzLzIwMTkgMTk6MDMs
IEFuZHJldyBDb29wZXIgd3JvdGU6Cj4+Pj4+IE9uIDI3LzAzLzIwMTkgMTg6NDUsIEp1bGllbiBH
cmFsbCB3cm90ZToKPj4+Pj4+IENsYW5nIGlzIHBpY2tpZXIgdGhhbiBHQ0MgZm9yIHRoZSByZWdp
c3RlciBzaXplIGluIGFzbSBzdGF0ZW1lbnQuIEl0Cj4+Pj4+PiBleHBlY3RzCj4+Pj4+PiB0aGUg
cmVnaXN0ZXIgc2l6ZSB0byBtYXRjaCB0aGUgdmFsdWUgc2l6ZS4KPj4+Pj4+Cj4+Pj4+PiBUaGUg
aW5zdHJ1Y3Rpb24gY2x6IGlzIGV4cGVjdGluZyB0aGUgdHdvIG9wZXJhbmRzIHRvIGJlIHRoZSBz
YW1lIHNpemUKPj4+Pj4+IChpLmUgMzItYml0IG9yIDY0LWJpdCkuIEFzIHRoZSBmbHNsIGZ1bmN0
aW9uIGlzIGRlYWxpbmcgd2l0aCA2NC1iaXQKPj4+Pj4+IHZhbHVlLCB3ZSBuZWVkIHRvIG1ha2Ug
dGhlIGRlc3RpbmF0aW9uIHZhcmlhYmxlIDY0LWJpdCBhcyB3ZWxsLgo+Pj4+Pj4KPj4+Pj4+IFdo
aWxlIGF0IGl0LCBhZGQgYSBuZXdsaW5lIGJlZm9yZSB0aGUgcmV0dXJuIHN0YXRlbWVudC4KPj4+
Pj4+Cj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0u
Y29tPgo+Pj4+Pj4gLS0tCj4+Pj4+PiAgICAgeGVuL2luY2x1ZGUvYXNtLWFybS9hcm02NC9iaXRv
cHMuaCB8IDMgKystCj4+Pj4+PiAgICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwg
MSBkZWxldGlvbigtKQo+Pj4+Pj4KPj4+Pj4+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20t
YXJtL2FybTY0L2JpdG9wcy5oCj4+Pj4+PiBiL3hlbi9pbmNsdWRlL2FzbS1hcm0vYXJtNjQvYml0
b3BzLmgKPj4+Pj4+IGluZGV4IDZiZjE5MjI2ODAuLjA1MDQ1ZjExMDkgMTAwNjQ0Cj4+Pj4+PiAt
LS0gYS94ZW4vaW5jbHVkZS9hc20tYXJtL2FybTY0L2JpdG9wcy5oCj4+Pj4+PiArKysgYi94ZW4v
aW5jbHVkZS9hc20tYXJtL2FybTY0L2JpdG9wcy5oCj4+Pj4+PiBAQCAtMzQsMTIgKzM0LDEzIEBA
IHN0YXRpYyAvKl9fKi9hbHdheXNfaW5saW5lIHVuc2lnbmVkIGxvbmcKPj4+Pj4+IF9fZmZzKHVu
c2lnbmVkIGxvbmcgd29yZCkKPj4+Pj4+ICAgICAgICBzdGF0aWMgaW5saW5lIGludCBmbHNsKHVu
c2lnbmVkIGxvbmcgeCkKPj4+Pj4+ICAgICB7Cj4+Pj4+PiAtICAgICAgICBpbnQgcmV0Owo+Pj4+
Pj4gKyAgICAgICAgdWludDY0X3QgcmV0Owo+Pj4+Pj4gICAgICAgICAgICAgICAgaWYgKF9fYnVp
bHRpbl9jb25zdGFudF9wKHgpKQo+Pj4+Pj4gICAgICAgICAgICAgICAgICAgIHJldHVybiBnZW5l
cmljX2Zsc2woeCk7Cj4+Pj4+PiAgICAgICAgICAgICAgICBhc20oImNselx0JTAsICUxIiA6ICI9
ciIgKHJldCkgOiAiciIgKHgpKTsKPj4+Pj4KPj4+Pj4gQXMgeCBpcyBmaXhlZCBieSB0aGUgQUJJ
LCByZXQgc2hvdWxkIGJlIHVuc2lnbmVkIGxvbmcgdG8gbWF0Y2gsIHN1cmVseT8KPj4+Pgo+Pj4+
IE5vIG5lZWQgZm9yIGl0LiBUaGUgcmVzdWx0IG9mIHRoZSBpbnN0cnVjdGlvbiBjbHogd2lsbCBh
bHdheXMgYmUgc21hbGxlcgo+Pj4+IHRoYW4gNjQuCj4+Pj4KPj4+PiBJIHN1c3BlY3QgdGhleSBy
ZXF1aXJlIGEgNjQtYml0IHJlZ2lzdGVyIGp1c3QgZm9yIHNpbXBsaWNpdHkgYXMgdGhleQo+Pj4+
IGVuY29kZSB0aGUgc2l6ZSBmb3IgdGhlIDIgcmVnaXN0ZXJzIGluIG9ubHkgYSBzaW5nbGUgYml0
IChpLmUgc2YpLgo+Pj4+Cj4+Pj4+Cj4+Pj4+IFRoaXMgd2lsbCBjb21waWxlIGFzIGl0IGlzIGFy
bTY0IHNwZWNpZmljLCBidXQgaXQgbG9va3MganVzdCBhcyB3cm9uZwo+Pj4+PiAocGVyIHRoZSBj
b21taXQgbWVzc2FnZSkgYXMgdXNpbmcgaW50IGluIHRoZSBmaXJzdCBwbGFjZS4KPj4+PiBTZWUg
YWJvdmUuIEkgY2FuIGNsYXJpZnkgaXQgaW4gdGhlIGNvbW1pdCBtZXNzYWdlLgo+Pj4KPj4+IEkg
YWdyZWUgd2l0aCBBbmRyZXc6IEkgY2FuIHNlZSB0aGF0IHRoZSBjb2RlIGlzIGNvcnJlY3QsIGJ1
dCBpdCByZWFsbHkKPj4+IGxvb2tzIHdyb25nIGF0IGZpcnN0IHNpZ2h0LiBXaHkgbm90IHVzZSB1
bnNpZ25lZCBsb25nPyBUaGlzIGlzIGFuIGFybTY0Cj4+PiBoZWFkZXIgYW55d2F5Lgo+Pgo+PiBX
aGlsZSB0aGlzIGlzIGltcGxlbWVudGVkIGluIGFybTY0LCB0aGlzIGlzIGEgZnVuY3Rpb24gdXNl
ZCBpbiBjb21tb24gY29kZS4uLgo+PiBTbyB0aGUgcHJvdG90eXBlIHdvdWxkIGhhdmUgdG8gYmUg
Y2hhbmdlZCBldmVyeXdoZXJlLgo+Pgo+PiBIb3dldmVyLCBhcyBJIHBvaW50ZWQgb3V0IHRoaXMg
aXMgYSBkZXNpZ24gZGVjaXNpb24gZnJvbSBBcm02NCBhbmQgSSB0aGluayBpdAo+PiB3b3VsZCBi
ZSB3cm9uZyB0byByZXR1cm4gdW5zaWduZWQgbG9uZy4KPj4KPj4gSSBvZmZlcmVkIHRoZSBzdWdn
ZXN0aW9uIHRvIHVwZGF0ZSB0aGUgY29tbWl0IG1lc3NhZ2UuIEkgY2FuIGFsc28gYWRkIGEKPj4g
Y29tbWVudCBpbiB0aGUgY29kZS4KPiAKPiBSZWFkaW5nIHlvdXIgcmVwbHksIEkgYW0gcHJldHR5
IHN1cmUgdGhhdCB3ZSBhcmUgdGFsa2luZyBhYm91dCBkaWZmZXJlbnQKPiB0aGluZ3MuIEkgYWdy
ZWUgdGhhdCB3ZSBkb24ndCB3YW50IHRvIGNoYW5nZSB0aGUgcHJvdG90eXBlIGV2ZXJ5d2hlcmUs
Cj4gYXJtMzIsIHg4Ni4gSXQgd291bGQgYmUgZ29vZCB0byBhZGQgYSBjb21tZW50IHRvIHRoZSBj
b2RlIG9yIHRoZSBjb21taXQKPiBtZXNzYWdlLCBJIGxlYXZlIGl0IHRvIHlvdS4KPiAKPiBNeSBz
dWdnZXN0aW9uIHdhcyBiYXNpY2FsbHkgImNvZGUgc3R5bGUiLiBJIG9ubHkgbWVhbnQgdGhlIGJl
bG93LiBUbyBtZQo+IGl0IGxvb2tzIG5pY2VyIGJlY2F1c2UgYXQgbGVhc3QgdGhlIHJldCB2YXIg
aXMgdGhlIHNhbWUgdHlwZSBvZiB0aGUKPiBhcmd1bWVudCwgYW5kIGl0IGlzIG1vcmUgaW1tZWRp
YXRlbHkgb2J2aW91cyB0aGF0IHRoZSBjbHogb3BlcmF0aW9uIGlzCj4gY29ycmVjdC4gTm90IGEg
YmlnIGRlYWwuCgpJIGZpbmQgcXVpdGUgYW11c2luZyB0aGF0IHlvdSBzdWdnZXN0IHRoaXMgd2hl
biBpbiB0aGUgcGF0Y2ggIzcgeW91IG1lbnRpb24gdGhlIApNSVNSQSBydWxlIDEwLjEgd2hpY2gg
Zm9yYmlkIGFzc2lnbmluZyBhIHZhbHVlIHRvIGEgbmFycm93ZXIgdHlwZSAodW5zaWduZWQgbG9u
ZyAKLT4gaW50KS4KClJlZ2FyZGxlc3MgdGhhdCwgY2x6IG9wZXJhdGlvbiBjbGVhcmx5IGFzayBm
b3IgYSA2NC1iaXQgdmFsdWUuIFNvIHVpbnQ2NF90IG1ha2VzIAptdWNoIG1vcmUgc2Vuc2UgdGhh
biAidW5zaWduZWQgbG9uZyIuIEluIGdlbmVyYWwsIEkgYW0gYSBzdHJvbmcgYWR2b2NhdGUgdG8g
dXNlIAp1aW50WF90IHdoZW4gdGhlIHNpemUgaXMga25vd24uICJ1bnNpZ25lZCBsb25nIiBzaG91
bGQgb25seSBiZSB1c2VkIGluIHBsYWNlIHlvdSAKbmVlZCBjb21wYXQgYmV0d2VlbiAzMi1iaXQg
YW5kIDY0LWJpdCBjb2RlLgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
