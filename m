Return-Path: <SRS0=DbOf=ZM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C61F3C432C0
	for <xen-devel@archiver.kernel.org>; Wed, 20 Nov 2019 14:03:20 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C6A92235D
	for <xen-devel@archiver.kernel.org>; Wed, 20 Nov 2019 14:03:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9C6A92235D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iXQZJ-0006Jq-3D; Wed, 20 Nov 2019 14:02:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Oy8C=ZM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iXQZH-0006Jb-HP
 for xen-devel@lists.xenproject.org; Wed, 20 Nov 2019 14:02:51 +0000
X-Inumbo-ID: 6f57704c-0b9e-11ea-adbe-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6f57704c-0b9e-11ea-adbe-bc764e2007e4;
 Wed, 20 Nov 2019 14:02:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 6482BB0B6;
 Wed, 20 Nov 2019 14:02:48 +0000 (UTC)
To: Krzysztof Kozlowski <krzk@kernel.org>
References: <20191120133822.12909-1-krzk@kernel.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <82f7c786-c240-66bd-895a-d71cd6977807@suse.com>
Date: Wed, 20 Nov 2019 15:02:48 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191120133822.12909-1-krzk@kernel.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen: Fix Kconfig indentation
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjAuMTEuMjAxOSAxNDozOCwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPiBBZGp1c3Qg
aW5kZW50YXRpb24gZnJvbSBzcGFjZXMgdG8gdGFiICgrb3B0aW9uYWwgdHdvIHNwYWNlcykgYXMg
aW4KPiBjb2Rpbmcgc3R5bGUgd2l0aCBjb21tYW5kIGxpa2U6Cj4gCSQgc2VkIC1lICdzL14gICAg
ICAgIC9cdC8nIC1pICovS2NvbmZpZwo+IAo+IFNpZ25lZC1vZmYtYnk6IEtyenlzenRvZiBLb3ps
b3dza2kgPGtyemtAa2VybmVsLm9yZz4KPiAtLS0KPiAgZHJpdmVycy94ZW4vS2NvbmZpZyB8IDIy
ICsrKysrKysrKysrLS0tLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMo
KyksIDExIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3hlbi9LY29uZmln
IGIvZHJpdmVycy94ZW4vS2NvbmZpZwo+IGluZGV4IGI3MWYxYWQxMDEzYy4uY2JhOTQ5YzBmOGIz
IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMveGVuL0tjb25maWcKPiArKysgYi9kcml2ZXJzL3hlbi9L
Y29uZmlnCj4gQEAgLTExMCwxMiArMTEwLDEyIEBAIGNvbmZpZyBYRU5fQ09NUEFUX1hFTkZTCj4g
ICAgICAgICBkZXBlbmRzIG9uIFhFTkZTCj4gICAgICAgICBkZWZhdWx0IHkKPiAgICAgICAgIGhl
bHAKPiAtICAgICAgICAgVGhlIG9sZCB4ZW5zdG9yZSB1c2Vyc3BhY2UgdG9vbHMgZXhwZWN0IHRv
IGZpbmQgInhlbmJ1cyIKPiAtICAgICAgICAgdW5kZXIgL3Byb2MveGVuLCBidXQgInhlbmJ1cyIg
aXMgbm93IGZvdW5kIGF0IHRoZSByb290IG9mIHRoZQo+IC0gICAgICAgICB4ZW5mcyBmaWxlc3lz
dGVtLiAgU2VsZWN0aW5nIHRoaXMgY2F1c2VzIHRoZSBrZXJuZWwgdG8gY3JlYXRlCj4gLSAgICAg
ICAgIHRoZSBjb21wYXRpYmlsaXR5IG1vdW50IHBvaW50IC9wcm9jL3hlbiBpZiBpdCBpcyBydW5u
aW5nIG9uCj4gLSAgICAgICAgIGEgeGVuIHBsYXRmb3JtLgo+IC0gICAgICAgICBJZiBpbiBkb3Vi
dCwgc2F5IHllcy4KPiArCSBUaGUgb2xkIHhlbnN0b3JlIHVzZXJzcGFjZSB0b29scyBleHBlY3Qg
dG8gZmluZCAieGVuYnVzIgo+ICsJIHVuZGVyIC9wcm9jL3hlbiwgYnV0ICJ4ZW5idXMiIGlzIG5v
dyBmb3VuZCBhdCB0aGUgcm9vdCBvZiB0aGUKPiArCSB4ZW5mcyBmaWxlc3lzdGVtLiAgU2VsZWN0
aW5nIHRoaXMgY2F1c2VzIHRoZSBrZXJuZWwgdG8gY3JlYXRlCj4gKwkgdGhlIGNvbXBhdGliaWxp
dHkgbW91bnQgcG9pbnQgL3Byb2MveGVuIGlmIGl0IGlzIHJ1bm5pbmcgb24KPiArCSBhIHhlbiBw
bGF0Zm9ybS4KPiArCSBJZiBpbiBkb3VidCwgc2F5IHllcy4KCkhlcmUgYW5kIC4uLgoKPiBAQCAt
MTIzLDcgKzEyMyw3IEBAIGNvbmZpZyBYRU5fU1lTX0hZUEVSVklTT1IKPiAgICAgICAgIHNlbGVj
dCBTWVNfSFlQRVJWSVNPUgo+ICAgICAgICAgZGVmYXVsdCB5Cj4gICAgICAgICBoZWxwCj4gLSAg
ICAgICAgIENyZWF0ZSBlbnRyaWVzIHVuZGVyIC9zeXMvaHlwZXJ2aXNvciBkZXNjcmliaW5nIHRo
ZSBYZW4KPiArCSBDcmVhdGUgZW50cmllcyB1bmRlciAvc3lzL2h5cGVydmlzb3IgZGVzY3JpYmlu
ZyB0aGUgWGVuCj4gIAkgaHlwZXJ2aXNvciBlbnZpcm9ubWVudC4gIFdoZW4gcnVubmluZyBuYXRp
dmUgb3IgaW4gYW5vdGhlcgo+ICAJIHZpcnR1YWwgZW52aXJvbm1lbnQsIC9zeXMvaHlwZXJ2aXNv
ciB3aWxsIHN0aWxsIGJlIHByZXNlbnQsCj4gIAkgYnV0IHdpbGwgaGF2ZSBubyB4ZW4gY29udGVu
dHMuCgouLi4gaGVyZSB5b3UgZW5kIHVwIHdpdGggYSB0YWIgYW5kIG9uZSBzcGFjZSwgd2hlcmVh
cyAuLi4KCj4gQEAgLTI3MSw3ICsyNzEsNyBAQCBjb25maWcgWEVOX0FDUElfUFJPQ0VTU09SCj4g
IAlkZXBlbmRzIG9uIFhFTiAmJiBYRU5fRE9NMCAmJiBYODYgJiYgQUNQSV9QUk9DRVNTT1IgJiYg
Q1BVX0ZSRVEKPiAgCWRlZmF1bHQgbQo+ICAJaGVscAo+IC0gICAgICAgICAgVGhpcyBBQ1BJIHBy
b2Nlc3NvciB1cGxvYWRzIFBvd2VyIE1hbmFnZW1lbnQgaW5mb3JtYXRpb24gdG8gdGhlIFhlbgo+
ICsJICBUaGlzIEFDUEkgcHJvY2Vzc29yIHVwbG9hZHMgUG93ZXIgTWFuYWdlbWVudCBpbmZvcm1h
dGlvbiB0byB0aGUgWGVuCj4gIAkgIGh5cGVydmlzb3IuCj4gIAo+ICAJICBUbyBkbyB0aGF0IHRo
ZSBkcml2ZXIgcGFyc2VzIHRoZSBQb3dlciBNYW5hZ2VtZW50IGRhdGEgYW5kIHVwbG9hZHMKPiBA
QCAtMjgwLDcgKzI4MCw3IEBAIGNvbmZpZyBYRU5fQUNQSV9QUk9DRVNTT1IKPiAgCSAgU01NIHNv
IHRoYXQgb3RoZXIgZHJpdmVycyAoc3VjaCBhcyBBQ1BJIGNwdWZyZXEgc2NhbGluZyBkcml2ZXIp
IHdpbGwKPiAgCSAgbm90IGxvYWQuCj4gIAo+IC0gICAgICAgICAgVG8gY29tcGlsZSB0aGlzIGRy
aXZlciBhcyBhIG1vZHVsZSwgY2hvb3NlIE0gaGVyZTogdGhlIG1vZHVsZSB3aWxsIGJlCj4gKwkg
IFRvIGNvbXBpbGUgdGhpcyBkcml2ZXIgYXMgYSBtb2R1bGUsIGNob29zZSBNIGhlcmU6IHRoZSBt
b2R1bGUgd2lsbCBiZQo+ICAJICBjYWxsZWQgeGVuX2FjcGlfcHJvY2Vzc29yICBJZiB5b3UgZG8g
bm90IGtub3cgd2hhdCB0byBjaG9vc2UsIHNlbGVjdAo+ICAJICBNIGhlcmUuIElmIHRoZSBDUFVG
UkVRIGRyaXZlcnMgYXJlIGJ1aWx0IGluLCBzZWxlY3QgWSBoZXJlLgo+ICAKPiBAQCAtMzEzLDgg
KzMxMyw4IEBAIGNvbmZpZyBYRU5fU1lNUwo+ICAgICAgICAgZGVwZW5kcyBvbiBYODYgJiYgWEVO
X0RPTTAgJiYgWEVORlMKPiAgICAgICAgIGRlZmF1bHQgeSBpZiBLQUxMU1lNUwo+ICAgICAgICAg
aGVscAo+IC0gICAgICAgICAgRXhwb3J0cyBoeXBlcnZpc29yIHN5bWJvbHMgKGFsb25nIHdpdGgg
dGhlaXIgdHlwZXMgYW5kIGFkZHJlc3NlcykgdmlhCj4gLSAgICAgICAgICAvcHJvYy94ZW4veGVu
c3ltcyBmaWxlLCBzaW1pbGFyIHRvIC9wcm9jL2thbGxzeW1zCj4gKwkgIEV4cG9ydHMgaHlwZXJ2
aXNvciBzeW1ib2xzIChhbG9uZyB3aXRoIHRoZWlyIHR5cGVzIGFuZCBhZGRyZXNzZXMpIHZpYQo+
ICsJICAvcHJvYy94ZW4veGVuc3ltcyBmaWxlLCBzaW1pbGFyIHRvIC9wcm9jL2thbGxzeW1zCgou
Li4gZXZlcnl3aGVyZSBlbHNlIHlvdSBoYXZlIGEgdGFiIGFuZCB0d28gc3BhY2VzLCBhcyBJIHdv
dWxkCmhhdmUgZXhwZWN0ZWQuCgpGdXJ0aGVybW9yZSBpbiB2YXJpb3VzIGNhc2VzIHlvdSBsZWF2
ZSBzcGFjZSBpbmRlbnRlZCB0aGUKZGlyZWN0aXZlcyBvdGhlciB0aGFuICJoZWxwIi4gV2l0aCBh
IHRpdGxlIGxpa2UgdGhlIG9uZSB0aGlzCnBhdGNoIGhhcyBJJ2QgZXhwZWN0IGFsbCBpbmRlbnRh
dGlvbiBpc3N1ZXMgdG8gYmUgdGFrZW4gY2FyZSBvZi4KCkphbgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
