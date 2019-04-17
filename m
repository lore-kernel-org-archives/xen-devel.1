Return-Path: <SRS0=ZpmR=ST=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D28FAC282DA
	for <xen-devel@archiver.kernel.org>; Wed, 17 Apr 2019 21:03:17 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A92CF2183E
	for <xen-devel@archiver.kernel.org>; Wed, 17 Apr 2019 21:03:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A92CF2183E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hGrhv-00044j-BN; Wed, 17 Apr 2019 21:03:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Uj5y=ST=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hGrhu-00044e-47
 for xen-devel@lists.xenproject.org; Wed, 17 Apr 2019 21:03:02 +0000
X-Inumbo-ID: 2f442008-6154-11e9-a93c-432dec7c26ac
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 2f442008-6154-11e9-a93c-432dec7c26ac;
 Wed, 17 Apr 2019 21:03:01 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9E09C15AB;
 Wed, 17 Apr 2019 14:03:00 -0700 (PDT)
Received: from [10.37.12.66] (unknown [10.37.12.66])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BED143F557;
 Wed, 17 Apr 2019 14:02:58 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <20190327184531.30986-1-julien.grall@arm.com>
 <20190327184531.30986-6-julien.grall@arm.com>
 <2af3ed7f-00d4-2eb7-0dde-c9570578dd4e@citrix.com>
 <bac73177-1ff7-7b7c-6852-832f88707555@arm.com>
 <alpine.DEB.2.10.1904171322560.1370@sstabellini-ThinkPad-X260>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <888ddebb-7019-45b7-aa84-9ba3cf4bfe7e@arm.com>
Date: Wed, 17 Apr 2019 22:02:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.10.1904171322560.1370@sstabellini-ThinkPad-X260>
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
Message-ID: <20190417210256.NFcWywyAgi_gr33eQfdiNp89-LkkFHHpRQKUO54v3Pw@z>

SGksCgpPbiA0LzE3LzE5IDk6MjQgUE0sIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPiBPbiBX
ZWQsIDI3IE1hciAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IEhpLAo+Pgo+PiBPbiAyNy8w
My8yMDE5IDE5OjAzLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+Pj4gT24gMjcvMDMvMjAxOSAxODo0
NSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+Pj4+IENsYW5nIGlzIHBpY2tpZXIgdGhhbiBHQ0MgZm9y
IHRoZSByZWdpc3RlciBzaXplIGluIGFzbSBzdGF0ZW1lbnQuIEl0IGV4cGVjdHMKPj4+PiB0aGUg
cmVnaXN0ZXIgc2l6ZSB0byBtYXRjaCB0aGUgdmFsdWUgc2l6ZS4KPj4+Pgo+Pj4+IFRoZSBpbnN0
cnVjdGlvbiBjbHogaXMgZXhwZWN0aW5nIHRoZSB0d28gb3BlcmFuZHMgdG8gYmUgdGhlIHNhbWUg
c2l6ZQo+Pj4+IChpLmUgMzItYml0IG9yIDY0LWJpdCkuIEFzIHRoZSBmbHNsIGZ1bmN0aW9uIGlz
IGRlYWxpbmcgd2l0aCA2NC1iaXQKPj4+PiB2YWx1ZSwgd2UgbmVlZCB0byBtYWtlIHRoZSBkZXN0
aW5hdGlvbiB2YXJpYWJsZSA2NC1iaXQgYXMgd2VsbC4KPj4+Pgo+Pj4+IFdoaWxlIGF0IGl0LCBh
ZGQgYSBuZXdsaW5lIGJlZm9yZSB0aGUgcmV0dXJuIHN0YXRlbWVudC4KPj4+Pgo+Pj4+IFNpZ25l
ZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Cj4+Pj4gLS0tCj4+
Pj4gICAgeGVuL2luY2x1ZGUvYXNtLWFybS9hcm02NC9iaXRvcHMuaCB8IDMgKystCj4+Pj4gICAg
MSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Pj4+Cj4+Pj4g
ZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2FzbS1hcm0vYXJtNjQvYml0b3BzLmggYi94ZW4vaW5j
bHVkZS9hc20tYXJtL2FybTY0L2JpdG9wcy5oCj4+Pj4gaW5kZXggNmJmMTkyMjY4MC4uMDUwNDVm
MTEwOSAxMDA2NDQKPj4+PiAtLS0gYS94ZW4vaW5jbHVkZS9hc20tYXJtL2FybTY0L2JpdG9wcy5o
Cj4+Pj4gKysrIGIveGVuL2luY2x1ZGUvYXNtLWFybS9hcm02NC9iaXRvcHMuaAo+Pj4+IEBAIC0z
NCwxMiArMzQsMTMgQEAgc3RhdGljIC8qX18qL2Fsd2F5c19pbmxpbmUgdW5zaWduZWQgbG9uZyBf
X2Zmcyh1bnNpZ25lZCBsb25nIHdvcmQpCj4+Pj4gICAgCj4+Pj4gICAgc3RhdGljIGlubGluZSBp
bnQgZmxzbCh1bnNpZ25lZCBsb25nIHgpCj4+Pj4gICAgewo+Pj4+IC0gICAgICAgIGludCByZXQ7
Cj4+Pj4gKyAgICAgICAgdWludDY0X3QgcmV0Owo+Pj4+ICAgIAo+Pj4+ICAgICAgICAgICAgaWYg
KF9fYnVpbHRpbl9jb25zdGFudF9wKHgpKQo+Pj4+ICAgICAgICAgICAgICAgICAgIHJldHVybiBn
ZW5lcmljX2Zsc2woeCk7Cj4+Pj4gICAgCj4+Pj4gICAgICAgICAgICBhc20oImNselx0JTAsICUx
IiA6ICI9ciIgKHJldCkgOiAiciIgKHgpKTsKPj4+Cj4+PiBBcyB4IGlzIGZpeGVkIGJ5IHRoZSBB
QkksIHJldCBzaG91bGQgYmUgdW5zaWduZWQgbG9uZyB0byBtYXRjaCwgc3VyZWx5Pwo+Pgo+PiBO
byBuZWVkIGZvciBpdC4gVGhlIHJlc3VsdCBvZiB0aGUgaW5zdHJ1Y3Rpb24gY2x6IHdpbGwgYWx3
YXlzIGJlIHNtYWxsZXIKPj4gdGhhbiA2NC4KPj4KPj4gSSBzdXNwZWN0IHRoZXkgcmVxdWlyZSBh
IDY0LWJpdCByZWdpc3RlciBqdXN0IGZvciBzaW1wbGljaXR5IGFzIHRoZXkKPj4gZW5jb2RlIHRo
ZSBzaXplIGZvciB0aGUgMiByZWdpc3RlcnMgaW4gb25seSBhIHNpbmdsZSBiaXQgKGkuZSBzZiku
Cj4+Cj4+Pgo+Pj4gVGhpcyB3aWxsIGNvbXBpbGUgYXMgaXQgaXMgYXJtNjQgc3BlY2lmaWMsIGJ1
dCBpdCBsb29rcyBqdXN0IGFzIHdyb25nCj4+PiAocGVyIHRoZSBjb21taXQgbWVzc2FnZSkgYXMg
dXNpbmcgaW50IGluIHRoZSBmaXJzdCBwbGFjZS4KPj4gU2VlIGFib3ZlLiBJIGNhbiBjbGFyaWZ5
IGl0IGluIHRoZSBjb21taXQgbWVzc2FnZS4KPiAKPiBJIGFncmVlIHdpdGggQW5kcmV3OiBJIGNh
biBzZWUgdGhhdCB0aGUgY29kZSBpcyBjb3JyZWN0LCBidXQgaXQgcmVhbGx5Cj4gbG9va3Mgd3Jv
bmcgYXQgZmlyc3Qgc2lnaHQuIFdoeSBub3QgdXNlIHVuc2lnbmVkIGxvbmc/IFRoaXMgaXMgYW4g
YXJtNjQKPiBoZWFkZXIgYW55d2F5LgoKV2hpbGUgdGhpcyBpcyBpbXBsZW1lbnRlZCBpbiBhcm02
NCwgdGhpcyBpcyBhIGZ1bmN0aW9uIHVzZWQgaW4gY29tbW9uIApjb2RlLi4uIFNvIHRoZSBwcm90
b3R5cGUgd291bGQgaGF2ZSB0byBiZSBjaGFuZ2VkIGV2ZXJ5d2hlcmUuCgpIb3dldmVyLCBhcyBJ
IHBvaW50ZWQgb3V0IHRoaXMgaXMgYSBkZXNpZ24gZGVjaXNpb24gZnJvbSBBcm02NCBhbmQgSSAK
dGhpbmsgaXQgd291bGQgYmUgd3JvbmcgdG8gcmV0dXJuIHVuc2lnbmVkIGxvbmcuCgpJIG9mZmVy
ZWQgdGhlIHN1Z2dlc3Rpb24gdG8gdXBkYXRlIHRoZSBjb21taXQgbWVzc2FnZS4gSSBjYW4gYWxz
byBhZGQgYSAKY29tbWVudCBpbiB0aGUgY29kZS4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
