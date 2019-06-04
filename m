Return-Path: <SRS0=m2Ej=UD=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10C88C282CE
	for <xen-devel@archiver.kernel.org>; Tue,  4 Jun 2019 17:30:32 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE3A9208E3
	for <xen-devel@archiver.kernel.org>; Tue,  4 Jun 2019 17:30:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CE3A9208E3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYDGL-0000rU-VE; Tue, 04 Jun 2019 17:30:17 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=IhTX=UD=arm.com=robin.murphy@srs-us1.protection.inumbo.net>)
 id 1hYDGK-0000rM-S5
 for xen-devel@lists.xenproject.org; Tue, 04 Jun 2019 17:30:16 +0000
X-Inumbo-ID: 6a5bc5a0-86ee-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 6a5bc5a0-86ee-11e9-8980-bc764e045a96;
 Tue, 04 Jun 2019 17:30:15 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 74ECE80D;
 Tue,  4 Jun 2019 10:30:15 -0700 (PDT)
Received: from [10.1.196.75] (e110467-lin.cambridge.arm.com [10.1.196.75])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 75F363F5AF;
 Tue,  4 Jun 2019 10:30:14 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>,
 xen-devel <xen-devel@lists.xenproject.org>
References: <5CF0F8530200007800233DE0@prv1-mh.provo.novell.com>
 <5CF0F9A30200007800233E07@prv1-mh.provo.novell.com>
 <706bde95-dbde-7291-83ab-efba17d6b291@arm.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <5b96e4b6-4baa-9a64-d8d7-efd80f887a4d@arm.com>
Date: Tue, 4 Jun 2019 18:30:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <706bde95-dbde-7291-83ab-efba17d6b291@arm.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH RFC 3/4] Arm64: further speed-up to
 hweight{32, 64}()
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQvMDYvMjAxOSAxNzoxMSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpIEphbiwKPiAKPiBP
biA1LzMxLzE5IDEwOjUzIEFNLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gQWNjb3JkaW5nIHRvIExp
bnV4IGNvbW1pdCBlNzViZWYyYTRmICgiYXJtNjQ6IFNlbGVjdAo+PiBBUkNIX0hBU19GQVNUX01V
TFRJUExJRVIiKSB0aGlzIGlzIGEgZnVydGhlciBpbXByb3ZlbWVudCBvdmVyIHRoZQo+PiB2YXJp
YW50IHVzaW5nIG9ubHkgYml0d2lzZSBvcGVyYXRpb25zIG9uIGF0IGxlYXN0IHNvbWUgaGFyZHdh
cmUsIGFuZCBubwo+PiB3b3JzZSBvbiBvdGhlci4KPj4KPj4gU3VnZ2VzdGVkLWJ5OiBBbmRyZXcg
Q29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgo+PiBTaWduZWQtb2ZmLWJ5OiBKYW4g
QmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4+IC0tLQo+PiBSRkM6IFRvIGJlIGhvbmVzdCBJ
J20gbm90IGZ1bGx5IGNvbnZpbmNlZCB0aGlzIGlzIGEgd2luIGluIHBhcnRpY3VsYXIgaW4KPj4g
wqDCoMKgwqDCoCB0aGUgaHdlaWdodDMyKCkgY2FzZSwgYXMgdGhlcmUncyBubyBhY3R1YWwgc2hp
ZnQgaW5zbiB3aGljaCBnZXRzCj4+IMKgwqDCoMKgwqAgcmVwbGFjZWQgYnkgdGhlIG11bHRpcGxp
Y2F0aW9uLiBFdmVuIGZvciBod2VpZ2h0NjQoKSB0aGUgY29tcGlsZXIKPj4gwqDCoMKgwqDCoCBj
b3VsZCBlbWl0IGJldHRlciBjb2RlIGFuZCBhdm9pZCB0aGUgZXhwbGljaXQgc2hpZnQgYnkgMzIg
KHdoaWNoIGl0Cj4+IMKgwqDCoMKgwqAgZW1pdHMgYXQgbGVhc3QgZm9yIG1lKS4KPiAKPiBJIGNh
biBzZWUgbXVsdGlwbGljYXRpb24gaW5zdHJ1Y3Rpb24gdXNlZCBpbiBib3RoIGh3ZWlnaHQzMigp
IGFuZCAKPiBod2VpZ2h0NjQoKSB3aXRoIHRoZSBjb21waWxlciBJIGFtIHVzaW5nLgo+IAo+IEkg
d291bGQgZXhwZWN0IHRoZSBjb21waWxlciBjb3VsZCBlYXNpbHkgcmVwbGFjZSBhIG11bHRpcGx5
IGJ5IGEgc2VyaWVzIAo+IG9mIHNoaWZ0IGJ1dCBpdCB3b3VsZCBiZSBtb3JlIGRpZmZpY3VsdCB0
byBkbyB0aGUgaW52ZXJ0Lgo+IAo+IEFsc28sIHRoaXMgaGFzIGJlZW4gaW4gTGludXggZm9yIGEg
eWVhciBub3csIHNvIEkgYW0gYXNzdW1pbmcgTGludXggCj4gZm9sa3MgYXJlIGhhcHB5IHdpdGgg
Y2hhbmdlcyAoQ0NpbmcgUm9iaW4ganVzdCBpbiBjYXNlIEkgbWlzc2VkIAo+IGFueXRoaW5nKS4g
VGhlcmVmb3JlIEkgYW0gaGFwcHkgdG8gZ2l2ZSBpdCBhIGdvIG9uIFhlbiBhcyB3ZWxsLgoKSUlS
QyBpdCBkaWQgbG9vayBsaWtlIExpbnV4J3MgaHdlaWdodCgpIHJvdXRpbmVzIGNvdWxkIHBvc3Np
Ymx5IGJlIApmdXJ0aGVyIHR1bmVkIGZvciB0aGUgQTY0IElTQSB0byBzaGF2ZSBvZmYgb25lIG9y
IHR3byBtb3JlIGluc3RydWN0aW9ucywgCmJ1dCBpdCdzIHlldCB0byBiZSBwcm92ZW4gdGhhdCBw
ZXJmb3JtYW5jZSBpcyBhbnl3aGVyZSBuZWFyIGNyaXRpY2FsIAplbm91Z2ggdG8ganVzdGlmeSBt
YWludGFpbmluZyBhcmNoLXNwZWNpZmljIHZlcnNpb25zLiBJdCBjb3N0cyB1cyAKYmFzaWNhbGx5
IG5vdGhpbmcgdG8gc3dpdGNoIGJldHdlZW4gdGhlIHR3byBnZW5lcmljIGltcGxlbWVudGF0aW9u
cyAKdGhvdWdoLCBzbyBzaW5jZSB0aGUgc21hbGxlci1hbmQtbm8tc2xvd2VyIGNvZGUgY2FuIGJl
IGNvbnNpZGVyZWQgYSBuZXQgCndpbiAoaG93ZXZlciBtaW5vciksIHRoZXJlIHNlZW1lZCBubyBy
ZWFzb24gKm5vdCogdG8gYXBwbHkgdGhlIGV4aXN0aW5nIApvcHRpb24gYXBwcm9wcmlhdGVseS4K
ClJvYmluLgoKPiAKPiBDaGVlcnMsCj4gCj4+Cj4+IC0tLSBhL3hlbi9hcmNoL2FybS9LY29uZmln
Cj4+ICsrKyBiL3hlbi9hcmNoL2FybS9LY29uZmlnCj4+IEBAIC0xMiw2ICsxMiw3IEBAIGNvbmZp
ZyBBUk1fMzIKPj4gwqAgY29uZmlnIEFSTV82NAo+PiDCoMKgwqDCoMKgIGRlZl9ib29sIHkKPj4g
wqDCoMKgwqDCoCBkZXBlbmRzIG9uIDY0QklUCj4+ICvCoMKgwqAgc2VsZWN0IEhBU19GQVNUX01V
TFRJUExZCj4+IMKgIGNvbmZpZyBBUk0KPj4gwqDCoMKgwqDCoCBkZWZfYm9vbCB5Cj4+Cj4+Cj4g
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
