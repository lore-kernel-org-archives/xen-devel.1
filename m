Return-Path: <SRS0=SZmv=Z7=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9596FC43603
	for <xen-devel@archiver.kernel.org>; Mon,  9 Dec 2019 11:58:02 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E1AF2077B
	for <xen-devel@archiver.kernel.org>; Mon,  9 Dec 2019 11:58:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6E1AF2077B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ieHfe-0001yb-Bb; Mon, 09 Dec 2019 11:57:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=HzjL=Z7=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1ieHfc-0001yT-VS
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2019 11:57:44 +0000
X-Inumbo-ID: 1bb1ede6-1a7b-11ea-88e7-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1bb1ede6-1a7b-11ea-88e7-bc764e2007e4;
 Mon, 09 Dec 2019 11:57:44 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 36E8EAEE9;
 Mon,  9 Dec 2019 11:57:43 +0000 (UTC)
To: "Durrant, Paul" <pdurrant@amazon.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20191205140123.3817-1-pdurrant@amazon.com>
 <20191205140123.3817-2-pdurrant@amazon.com>
 <38908166-6a4b-9dab-144c-71df691da167@suse.com>
 <bd8a9c19fd944e0faf7a36354db2d495@EX13D32EUC003.ant.amazon.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <74b1c655-e107-51dd-e719-05a750f324a5@suse.com>
Date: Mon, 9 Dec 2019 12:57:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <bd8a9c19fd944e0faf7a36354db2d495@EX13D32EUC003.ant.amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 1/4] xenbus: move xenbus_dev_shutdown() into
 frontend code...
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
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkuMTIuMTkgMTI6NTUsIER1cnJhbnQsIFBhdWwgd3JvdGU6Cj4+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tCj4+IEZyb206IErDvHJnZW4gR3Jvw58gPGpncm9zc0BzdXNlLmNvbT4KPj4g
U2VudDogMDkgRGVjZW1iZXIgMjAxOSAxMTozNAo+PiBUbzogRHVycmFudCwgUGF1bCA8cGR1cnJh
bnRAYW1hem9uLmNvbT47IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7Cj4+IHhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwo+PiBDYzogQm9yaXMgT3N0cm92c2t5IDxib3Jpcy5vc3Ry
b3Zza3lAb3JhY2xlLmNvbT47IFN0ZWZhbm8gU3RhYmVsbGluaQo+PiA8c3N0YWJlbGxpbmlAa2Vy
bmVsLm9yZz4KPj4gU3ViamVjdDogUmU6IFtQQVRDSCAxLzRdIHhlbmJ1czogbW92ZSB4ZW5idXNf
ZGV2X3NodXRkb3duKCkgaW50byBmcm9udGVuZAo+PiBjb2RlLi4uCj4+Cj4+IE9uIDA1LjEyLjE5
IDE1OjAxLCBQYXVsIER1cnJhbnQgd3JvdGU6Cj4+PiAuLi5hbmQgbWFrZSBpdCBzdGF0aWMKPj4+
Cj4+PiB4ZW5idXNfZGV2X3NodXRkb3duKCkgaXMgc2VlbWluZ2x5IGludGVuZGVkIHRvIGNhdXNl
IGNsZWFuIHNodXRkb3duIG9mCj4+IFBWCj4+PiBmcm9udGVuZHMgd2hlbiBhIGd1ZXN0IGlzIHJl
Ym9vdGVkLiBJbmRlZWQgdGhlIGZ1bmN0aW9uIHdhaXRzIGZvciBhCj4+PiBjb25wbGV0aW9uIHdo
aWNoIGlzIG9ubHkgc2V0IGJ5IGEgY2FsbCB0byB4ZW5idXNfZnJvbnRlbmRfY2xvc2VkKCkuCj4+
Pgo+Pj4gVGhpcyBwYXRjaCByZW1vdmVzIHRoZSBzaHV0ZG93bigpIG1ldGhvZCBmcm9tIGJhY2tl
bmRzIGFuZCBtb3Zlcwo+Pj4geGVuYnVzX2Rldl9zaHV0ZG93bigpIGZyb20geGVuYnVzX3Byb2Jl
LmMgaW50byB4ZW5idXNfcHJvYmVfZnJvbnRlbmQuYywKPj4+IHJlbmFtaW5nIGl0IGFwcHJvcHJp
YXRlbHkgYW5kIG1ha2luZyBpdCBzdGF0aWMuCj4+Cj4+IElzIHRoaXMgYSBnb29kIG1vdmUgY29u
c2lkZXJpbmcgZHJpdmVyIGRvbWFpbnM/Cj4gCj4gSSBkb24ndCB0aGluayBpdCBjYW4gaGF2ZSBl
dmVyIHdvcmtlZCBwcm9wZXJseSBmb3IgZHJpdmVyIGRvbWFpbnMsIGFuZCB3aXRoIHRoZSByZXN0
IG9mIHRoZSBwYXRjaGVzIGEgYmFja2VuZCBzaG91bGQgYmUgYWJsZSBnbyBhd2F5IGFuZCByZXR1
cm4gdW5hbm5vdW5jZWQgKGFzIGxvbmcgYXMgdGhlIGRvbWFpbiBpZCBpcyBrZXB0Li4uIGZvciB3
aGljaCBwYXRjaGVzIG5lZWQgdG8gYmUgdXBzdHJlYW1lZCBpbnRvIFhlbikuCj4gCj4+Cj4+IEF0
IGxlYXN0IEknZCBleHBlY3QgdGhlIGNvbW1pdCBtZXNzYWdlIGFkZHJlc3NpbmcgdGhlIGV4cGVj
dGVkIGJlaGF2aW9yCj4+IHdpdGggcmVib290aW5nIGEgZHJpdmVyIGRvbWFpbiBhbmQgd2h5IHRo
aXMgcGF0Y2ggaXNuJ3QgbWFraW5nIHRoaW5ncwo+PiB3b3JzZS4KPj4KPiAKPiBGb3IgYSBjbGVh
biByZWJvb3QgSSdkIGV4cGVjdCB0aGUgdG9vbHN0YWNrIHRvIHNodXQgZG93biB0aGUgcHJvdG9j
b2wgYmVmb3JlIHJlYm9vdGluZyB0aGUgZHJpdmVyIGRvbWFpbiwgc28gdGhlIGJhY2tlbmQgc2h1
dGRvd24gbWV0aG9kIGlzIG1vb3QuIEFuZCBJIGRvbid0IGJlbGlldmUgcmUtc3RhcnRhYmxlIGRy
aXZlciBkb21haW5zIHdlcmUgc29tZXRoaW5nIHRoYXQgZXZlciBtYWRlIGl0IGludG8gc3VwcG9y
dCAoYmVjYXVzZSBvZiB0aGUgbm9uLXBlcnNpc3RlbnQgZG9taWQgcHJvYmxlbSkuIEkgY2FuIGFk
ZCBzb21ldGhpbmcgdG8gdGhlIGNvbW1pdCBjb21tZW50IHRvIHRoYXQgZWZmZWN0IGlmIHlvdSdk
IGxpa2UuCgpZZXMsIHBsZWFzZSBkbyBzby4KCldpdGggdGhpcyB5b3UgY2FuIGFkZCBteToKClJl
dmlld2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+CgoKSnVlcmdlbgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
