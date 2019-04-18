Return-Path: <SRS0=LbOi=SU=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 961A9C10F0E
	for <xen-devel@archiver.kernel.org>; Thu, 18 Apr 2019 18:48:00 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6ABAA2064A
	for <xen-devel@archiver.kernel.org>; Thu, 18 Apr 2019 18:48:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6ABAA2064A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hHC4U-0006zH-MD; Thu, 18 Apr 2019 18:47:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Z9nG=SU=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hHC4T-0006zA-7M
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2019 18:47:41 +0000
X-Inumbo-ID: 712cf204-620a-11e9-9562-ff0461711043
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 712cf204-620a-11e9-9562-ff0461711043;
 Thu, 18 Apr 2019 18:47:40 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A8910A78;
 Thu, 18 Apr 2019 11:47:39 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BA1483F5AF;
 Thu, 18 Apr 2019 11:47:38 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <20190327184531.30986-1-julien.grall@arm.com>
 <20190327184531.30986-8-julien.grall@arm.com>
 <alpine.DEB.2.10.1904171327100.1370@sstabellini-ThinkPad-X260>
 <970bfa4e-192e-967a-b211-16dee9cb7ed8@arm.com>
 <alpine.DEB.2.10.1904181104360.1370@sstabellini-ThinkPad-X260>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <66c0b06a-bd34-9044-0aa4-35eee52c3d98@arm.com>
Date: Thu, 18 Apr 2019 19:47:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.10.1904181104360.1370@sstabellini-ThinkPad-X260>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 07/12] xen/arm: cpuerrata: Match register
 size with value size in check_workaround_*
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
Cc: Artem_Mygaiev@epam.com, xen-devel@lists.xenproject.org,
 Andrii_Anisov@epam.com, Oleksandr_Tyshchenko@epam.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"; format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190418184737.N-tXfTxMZ-7s_Ieq66Vixhzt6473OuV-HLfvy033wc0@z>

SGksCgpPbiAxOC8wNC8yMDE5IDE5OjIzLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4gT24g
V2VkLCAxNyBBcHIgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+PiBIaSwKPj4KPj4gT24gNC8x
Ny8xOSA5OjI4IFBNLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4+PiBPbiBXZWQsIDI3IE1h
ciAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+Pj4gQ2xhbmcgaXMgcGlja2llciB0aGFuIEdD
QyBmb3IgdGhlIHJlZ2lzdGVyIHNpemUgaW4gYXNtIHN0YXRlbWVudC4gSXQKPj4+PiBleHBlY3Rz
IHRoZSByZWdpc3RlciBzaXplIHRvIG1hdGNoIHRoZSB2YWx1ZSBzaXplLgo+Pj4+Cj4+Pj4gVGhl
IGFzbSBzdGF0ZW1lbnQgZXhwZWN0cyBhIDMyLWJpdCAocmVzcC4gNjQtYml0KSB2YWx1ZSBvbiBB
cm0zMgo+Pj4+IChyZXNwLiBBcm02NCkgd2hlcmVhcyB0aGUgdmFsdWUgaXMgYSBib29sZWFuIChD
bGFuZyBjb25zaWRlciB0byBiZQo+Pj4+IDMyLWJpdCkuCj4+Pj4KPj4+PiBJdCB3b3VsZCBiZSBw
b3NzaWJsZSB0byBpbXBvc2UgMzItYml0IHJlZ2lzdGVyIGZvciBib3RoIGFyY2hpdGVjdHVyZQo+
Pj4+IGJ1dCB0aGlzIHJlcXVpcmUgdGhlIGNvZGUgdG8gdXNlIF9fT1AzMi4gSG93ZXZlciwgaXQg
ZG9lcyBub3QgcmVhbGx5Cj4+Pj4gaW1wcm92ZSB0aGUgYXNzZW1ibHkgZ2VuZXJhdGVkLiBJbnN0
ZWFkLCByZXBsYWNlIHN3aXRjaCB0aGUgdmFyaWFibGUKPj4+PiB0byB1c2UgcmVnaXN0ZXJfdC4K
Pj4+Pgo+Pj4+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5j
b20+Cj4+Pj4gLS0tCj4+Pj4gICAgeGVuL2luY2x1ZGUvYXNtLWFybS9jcHVlcnJhdGEuaCB8IDIg
Ky0KPj4+PiAgICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
Pj4+Pgo+Pj4+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20tYXJtL2NwdWVycmF0YS5oCj4+
Pj4gYi94ZW4vaW5jbHVkZS9hc20tYXJtL2NwdWVycmF0YS5oCj4+Pj4gaW5kZXggNTVkZGZkYTI3
Mi4uODhlZjNjYTkzNCAxMDA2NDQKPj4+PiAtLS0gYS94ZW4vaW5jbHVkZS9hc20tYXJtL2NwdWVy
cmF0YS5oCj4+Pj4gKysrIGIveGVuL2luY2x1ZGUvYXNtLWFybS9jcHVlcnJhdGEuaAo+Pj4+IEBA
IC0xNCw3ICsxNCw3IEBAIHN0YXRpYyBpbmxpbmUgYm9vbCBjaGVja193b3JrYXJvdW5kXyMjZXJy
YXR1bSh2b2lkKQo+Pj4+IFwKPj4+PiAgICAgICAgICAgIHJldHVybiBmYWxzZTsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+Pj4+ICAgICAgICBlbHNlICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4+Pj4g
ICAgICAgIHsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIFwKPj4+PiAtICAgICAgICBib29sIHJldDsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIFwKPj4+PiArICAgICAgICByZWdpc3Rlcl90IHJldDsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPj4+PiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
XAo+Pj4+ICAgICAgICAgICAgYXNtIHZvbGF0aWxlIChBTFRFUk5BVElWRSgibW92ICUwLCAjMCIs
ICAgICAgICAgICAgICAgICBcCj4+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICJtb3YgJTAsICMxIiwgICAgICAgICAgICAgICAgIFwKPj4+Cj4+PiBUaGlzIGlzIE9LLiBD
b3VsZCB5b3UgcGxlYXNlIGFsc28gY2hhbmdlIHRoZSByZXR1cm4gc3RhdGVtZW50IGJlbG93Pwo+
Pj4gTWF5YmUgc29tZXRoaW5nIGxpa2U6Cj4+Pgo+Pj4gICAgIHJldHVybiB1bmxpa2VseSghIXJl
dCk7Cj4+IFdoeT8gVGhlIGNvbXBpbGVyIHdpbGwgaW1wbGljaXRseSBjb252ZXJ0IHRoZSBpbnQg
dG8gYm9vbC4gMCB3aWxsIHR1cm4gdG8KPj4gZmFsc2UsIGFsbCB0aGUgb3RoZXIgd2lsbCBiZSB0
cnVlLgo+Pgo+PiBXZSBhY3R1YWxseSBiZWVuIGFjdGl2ZWx5IHJlbW92aW5nICEhIHdoZW4gdGhl
IHR5cGUgaXMgYm9vbCAoc2VlIHRoZSBleGFtcGxlCj4+IGluIGdldF9wYWdlZF9mcmFtZSBpbiBj
b21tb24vZ3JhbnRfdGFibGUuYykuCj4gCj4gUmVhbGx5PyBUb28gYmFkLCBJIGxvdmVkIHRoZSBl
eHBsaWNpdCBjb252ZXJzaW9ucyB0byBib29sLiBUaGlzIGlzIGEKPiBtYXR0ZXIgb2YgY29kZSBz
dHlsZSwgbm90IGNvcnJlY3RuZXNzLCBzbyB1c3VhbGx5IEkgd291bGRuJ3QgY2FyZSBtdWNoLgo+
IEJ1dCBJIHdlbnQgdG8gcmVhZCBNSVNSQS1DIHRvIGZpZ3VyZSBvdXQgaWYgdGhlcmUgYXJlIGFu
eSBkaWZmZXJlbmNlcwo+IGZyb20gdGhhdCBwb2ludCBvZiB2aWV3LiBGcm9tIFJ1bGUgMTAuMywg
aXQgbG9va3MgbGlrZSBpdCBpcyBub3QKPiBjb21wbGlhbnQsIGJlY2F1c2UgdGhleSBzYXkgdGhh
dDoKPiAKPiAgICBib29sX3QgYmxhID0gMDsKPiAKPiBpcyBub3QgTUlTUkEtQyBjb21wbGlhbnQu
IFdoaWxlOgo+IAo+ICAgIGludCBjID0gMTsKPiAgICBib29sX3QgYmxhID0gYyA9PSAwOwo+IAo+
IGlzIGNvbXBsaWFudC4gU28sIGlmIEkgcmVhZCB0aGlzIHJpZ2h0Ogo+IAo+ICAgIHJldHVybiAh
IXJldCAvL2NvbXBsaWFudAo+ICAgIHJldHVybiByZXQ7ICAvL25vdCBjb21wbGlhbnQKPiAKPiBJ
IGFtIG5vdCAxMDAlIHN1cmUgdGhvdWdoLgoKQW5kIGlmIHlvdSByZWFkIHRoYXQgcnVsZSB0aGUg
Zm9sbG93aW5nIHdvdWxkIGFsc28gYmUgbm9uLWNvbXBsaWFudAoKYm9vbCBpc19ub256ZXJvKGlu
dCBiKQp7CiAgIHJldHVybiBiOwp9CgpJIGtub3cgdGhpcyBleGFtcGxlIGlzIHByZXR0eSBleGFn
Z2VyYXRlZCBidXQgdGhlbiBkb2VzIGl0IG1lYW4gdGhlIGZvbGxvd2luZyAKY29kZSBpcyBhbHNv
IG5vbi1jb21wbGlhbnQ/Cgpib29sIGlzX25vbnplcm8oaW50IGIpCnsKICAgICBpZiAoYikKICAg
ICAgIHJldHVybiB0cnVlOwogICAgIGVsc2UKICAgICAgIHJldHVybiBmYWxzZTsKfQoKSWYgaXQg
aXMgY29uc2lkZXJlZCBjb21wbGlhbnQsIHRoZW4gaXQgZG9lcyBub3QgbWFrZSBzZW5zZS4KCkNo
ZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
