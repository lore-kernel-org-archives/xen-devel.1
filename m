Return-Path: <SRS0=7THE=S4=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D026C43218
	for <xen-devel@archiver.kernel.org>; Fri, 26 Apr 2019 21:17:15 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 76BA9206C1
	for <xen-devel@archiver.kernel.org>; Fri, 26 Apr 2019 21:17:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 76BA9206C1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hK8D4-0005XE-EA; Fri, 26 Apr 2019 21:16:42 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pi39=S4=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hK8D3-0005X9-18
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2019 21:16:41 +0000
X-Inumbo-ID: 9485a4e2-6868-11e9-843c-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 9485a4e2-6868-11e9-843c-bc764e045a96;
 Fri, 26 Apr 2019 21:16:39 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B8D13A78;
 Fri, 26 Apr 2019 14:16:38 -0700 (PDT)
Received: from [10.37.8.211] (unknown [10.37.8.211])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E6A643F557;
 Fri, 26 Apr 2019 14:16:36 -0700 (PDT)
To: Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
References: <20190418163158.11408-1-ian.jackson@eu.citrix.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <fa02ed11-5bb4-d324-b9a5-a019c2b696d8@arm.com>
Date: Fri, 26 Apr 2019 22:16:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190418163158.11408-1-ian.jackson@eu.citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [OSSTEST PATCH 00/21] Abandon jobs which are
 unreasonably delaying their flight
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
Cc: Lars Kurth <lars.kurth@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, committers@xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"; format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190426211635._uPXCMfUiixl-nqTMISzwgIw_yhOpFcJJpCfUaRRNJs@z>

SGkgSWFuLAoKT24gNC8xOC8xOSA1OjMxIFBNLCBJYW4gSmFja3NvbiB3cm90ZToKPiBTb21ldGlt
ZXMgd2UgZmluZCBvdXJzZWx2ZXMgc2VyaW91c2x5IGxhY2tpbmcgdGhlIGNhcGFjaXR5IHRvIHJ1
bgo+IHBhcnRpY3VsYXIgam9iKHMpLiAgVGhlIHJlc3VsdCBjYW4gYmUgdGhhdCB0aGUgd2hvbGUg
c3lzdGVtIHN0YW5kcwo+IG1vc3RseSBpZGxlIHdoaWxlIGEgc21hbGwgcHJvcG9ydGlvbiBvZiB0
aGUgcmVzb3VyY2VzIHJ1bnMgZmxhdCBvdXQKPiB3aXRoIGEgZ2lhbnQgcXVldWUuCj4gCj4gSW4g
dGhpcyBzZXJpZXMgd2UgYXJyYW5nZSBmb3Igb3NzdGVzdCB0byBiZSBhYmxlIHRvIHNwb3QgdGhp
cwo+IGhhcHBlbmluZywgYW5kIGF1dG9tYXRpY2FsbHkgcmViYWxhbmNlIGxvYWQgYnkgZ2l2ZSB1
cCBlYXJsaWVyIG9uIHRoZQo+IGpvYnMgd2hpY2ggYXJlIG92ZXJseS1jb250ZW5kZWQuCj4gCj4g
VGhlcmUgYXJlIHNvbWUgdHVuaW5nIHBhcmFtZXRlcnMsIG9mIGNvdXJzZS4gIFRvIHN1bW1hcmlz
ZSwgSSBoYXZlCj4gY2hvc2VuIGhlcmUgdG8gdHJlYXQgam9icyBhcyBzdGFydmVkIGlmIChmb3Ig
ZXhhbXBsZSk6Cj4gICAgV2UgaGF2ZSBjb21wbGV0ZWQgOTAlIG9mIHRoZSBmbGlnaHQsIGFuZCB0
aGUgcmVtYWluaW5nIDEwJQo+ICAgIGlzIHByb2plY3RlZCB0byB0YWtlIDV4IGFzIGxvbmcgYXMg
dGhlIGZpcnN0IDkwJS4KPiAoVGhlICI5MCUiIGlzIGJ5IG51bWJlciBvZiBqb2JzLikgIFNlZSB0
aGUgcGF0Y2gKPiAgICBzdGFydmF0aW9uOiBJbmZyYXN0cnVjdHVyZSBmb3Igam9icyB3aGljaCBh
cmUgZGVsYXlpbmcgdGhlaXIgZmxpZ2h0cwo+IGZvciBkZXRhaWxzIG9mIHRoZSBoZXVyaXN0aWMg
YW5kIGl0cyBwYXJhbWV0ZXJzLgo+IAo+IFdoZW4gc2l0dWF0aW9ucyBsaWtlIHRoaXMgcGVyc2lz
dCBpdCB3aWxsIHN0aWxsIGJlIGdvb2QgdG8gbWFudWFsbHkKPiBiYWxhbmNlIHRoZSBsb2FkIGJ5
IGFkanVzdGluZyB0aGUgam9iIG1peCBpbiBzdWJtaXR0ZWQgZmxpZ2h0cy4gIFRoaXMKPiBpcyBi
ZWNhdXNlIHRoZSBzdGFydmF0aW9uIHdpbGwgbm90IG5lY2Vzc2FyaWx5IGRyb3AgdGhlIHNhbWUg
am9iIGluCj4gc3Vic2VxdWVudCBmbGlnaHRzIG9uIHRoZSBzYW1lICJicmFuY2giLCBzbyBzdGFy
dmF0aW9uIHdpbGwgaW1wYWlyIHRoZQo+IHJlZ3Jlc3Npb24gZGV0ZWN0aW9uLgoKQXMgd2UgZGlz
Y3Vzc2VkIG9uIElSQywgSSB1bmRlcnN0YW5kIHRoaXMgd2lsbCBoYXZlIGFuIGltcGFjdCBvbiBB
cm0zMiAKdGVzdGluZy4gRG8geW91IGhhdmUgYW4gZXN0aW1hdGUgaG93IGxpa2VseSB0aGUgdGVz
dHMgd2lsbCBiZSBza2lwcGVkPwoKSSBhbSB3b25kZXJpbmcgd2hldGhlciB3ZSBzaG91bGQgZGlz
Y3VzcyB0byByZWR1Y2UgdGhlIG51bWJlciBvZiAKdGVzdGluZ3MgZG9uZSBvbiBBcm0zMi4gV2Ug
ZGlkIHRoYXQgaW4gdGhlIHBhc3Qgb24gQXJtNjQgd2hlbiB3ZSB3ZXJlIApzdHJ1Z2dsZSB3aXRo
IGJyb2tlbiBsYXh0b24wL2xheHRvbjEuCgpDaGVlcnMsCgo+IAo+IElhbiBKYWNrc29uICgyMSk6
Cj4gICAgdHMtaG9zdHMtYWxsb2NhdGUtRXhlY3V0aXZlOiB3aXRoIC1VLCBqdXN0IGFwcGVuZCB0
byB0aGUgc2FtZSBsb2dmaWxlCj4gICAgc2VsZWN0aG9zdDogSG9ub3VyIG5ldyAkbm9uZV9vayBv
cHRpb25hbCBwYXJhbWV0ZXIKPiAgICB0cy1sb2dzLWNhcHR1cmU6IERvIG5vdCB0cnkgdG8gY2Fw
dHVyZSBsb2dzIG9mIGhvc3RzIG5vdCBhbGxvY2F0ZWQKPiAgICBhbGxvY19yZXNvdXJjZXM6IFN1
cHBvcnQgc3BlY2lhbCBhYmFuZG9ubWVudCB2YWx1ZXMKPiAgICBzdGFydmF0aW9uOiBUZWFjaCBz
Zy1yZXBvcnQtZmxpZ2h0IGFib3V0IHN0YXJ2ZWQgc3RlcCBzdGF0ZQo+ICAgIHN0YXJ2YXRpb246
IFRlYWNoIGFyY2hhZW9sb2dpc3RzIGFib3V0IHN0YXJ2ZWQgam9iIHN0YXRlCj4gICAgc3RhcnZh
dGlvbjogVGVhY2ggbXMtZmxpZ2h0cy1zdW1tYXJ5IGFib3V0IGpvYiBzdGF0ZSBzdGFydmVkCj4g
ICAgc3RhcnZhdGlvbjogVGVhY2ggc2ctZXhlY3V0ZS1mbGlnaHQgYWJvdXQgam9iIHN0YXRlIHN0
YXJ2ZWQKPiAgICBzdGVwIGhhbmRsaW5nOiBQcmVzZXJ2ZSBzdGVwIHN0YXRlcyBzZXQgYnkgdHMt
KiBzY3JpcHRzCj4gICAgVGVzdFN1cHBvcnQ6IE1ha2UgImJyb2tlbiIgcHJpbnQgdGhlIGFjdHVh
bCBqb2Igc3RhdGUKPiAgICBKb2JEQjo6RXhlY3V0aXZlOiBzdGVwXyo6IGZpeCBsb2cgbWVzc2Fn
ZXMgdG8gdGFsayBhYm91dCAic3RlcHMiCj4gICAgc3RhcnZhdGlvbjogUGVybWl0IHN0ZXBfZmlu
aXNoIHRvIHNldCB0aGUgc3RhdGUgYHN0YXJ2ZWQnCj4gICAgVGVzdFN1cHBvcnQ6IE1ha2UgImJy
b2tlbiIgc2V0IHRoZSBzdGVwIHN0YXRlIHRvbwo+ICAgIHRjbC9Kb2JEQi1FeGVjdXRpdmU6IERv
IG5vdCBzcXVhc2ggInN0YXJ2ZWQiIHN0YXR1cwo+ICAgIHN0YXJ2YXRpb246IFByb3BhZ2F0ZSBz
dGFydmVkIGpvYiBzdGF0dXMgaW50byBkZXBlbmRlbnQgam9icwo+ICAgIHRzLWhvc3QtYWxsb2Nh
dGUtRXhlY3V0aXZlOiBCcmVhayBvdXQgJG5vdyBhbmQgYWRkIGEgbmV3bGluZQo+ICAgIHN0YXJ2
YXRpb246IFVzZSAic3RhcnZlZCIgZm9yIGhvc3RhbGxvY19tYXh3YWl0X21heAo+ICAgIHN0YXJ2
YXRpb246IEluZnJhc3RydWN0dXJlIGZvciBqb2JzIHdoaWNoIGFyZSBkZWxheWluZyB0aGVpciBm
bGlnaHRzCj4gICAgc3RhcnZhdGlvbjogQWJhbmRvbiBqb2JzIHdoaWNoIGFyZSB1bnJlYXNvbmFi
bHkgZGVsYXlpbmcgdGhlaXIgZmxpZ2h0Cj4gICAgaG9zdGFsbG9jX21heHdhaXRfbWF4OiBVc2Ug
c3RhcnZhdGlvbiBtb3N0X29wdGltaXN0aWMKPiAgICBzdGFydmF0aW9uOiBCZXR0ZXIgbG9nZ2lu
Zy9kZWJ1Z2dpbmcgb3V0cHV0Cj4gCj4gICBPc3N0ZXN0L0V4ZWN1dGl2ZS5wbSAgICAgICAgIHwg
IDk1ICsrKysrKysrKysrKysrKysrKysrKysrKysrLS0tCj4gICBPc3N0ZXN0L0pvYkRCL0V4ZWN1
dGl2ZS5wbSAgIHwgICA4ICsrLQo+ICAgT3NzdGVzdC9UZXN0U3VwcG9ydC5wbSAgICAgICB8ICAy
NCArKysrKystLQo+ICAgbWctaG9zdGFsbG9jLXN0YXJ2YXRpb24tZGVtbyB8ICA1MyArKysrKysr
KysrKysrKysrCj4gICBtcy1mbGlnaHRzLXN1bW1hcnkgICAgICAgICAgIHwgICA5ICstLQo+ICAg
c2ctZXhlY3V0ZS1mbGlnaHQgICAgICAgICAgICB8ICAgMiArLQo+ICAgc2ctcmVwb3J0LWZsaWdo
dCAgICAgICAgICAgICB8ICAxNyArKysrKy0KPiAgIHRjbC9Kb2JEQi1FeGVjdXRpdmUudGNsICAg
ICAgfCAgIDYgKy0KPiAgIHRzLWhvc3RzLWFsbG9jYXRlLUV4ZWN1dGl2ZSAgfCAxNDIgKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLQo+ICAgdHMtbG9ncy1jYXB0dXJl
ICAgICAgICAgICAgICB8ICAgNyArKy0KPiAgIDEwIGZpbGVzIGNoYW5nZWQsIDMyOCBpbnNlcnRp
b25zKCspLCAzNSBkZWxldGlvbnMoLSkKPiAgIGNyZWF0ZSBtb2RlIDEwMDc1NSBtZy1ob3N0YWxs
b2Mtc3RhcnZhdGlvbi1kZW1vCj4gCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
