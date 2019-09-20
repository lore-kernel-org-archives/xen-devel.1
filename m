Return-Path: <SRS0=CxSR=XP=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28F68C49ED7
	for <xen-devel@archiver.kernel.org>; Fri, 20 Sep 2019 10:25:29 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF08F2086A
	for <xen-devel@archiver.kernel.org>; Fri, 20 Sep 2019 10:25:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EF08F2086A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iBG66-0000VI-RX; Fri, 20 Sep 2019 10:25:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=qXnC=XP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iBG65-0000VD-HH
 for xen-devel@lists.xenproject.org; Fri, 20 Sep 2019 10:25:05 +0000
X-Inumbo-ID: e8f804ea-db90-11e9-b299-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e8f804ea-db90-11e9-b299-bc764e2007e4;
 Fri, 20 Sep 2019 10:25:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id CA030AB6D;
 Fri, 20 Sep 2019 10:25:03 +0000 (UTC)
To: Oleksandr <olekstysh@gmail.com>
References: <1568388917-7287-1-git-send-email-olekstysh@gmail.com>
 <1568388917-7287-6-git-send-email-olekstysh@gmail.com>
 <e27f519a-465f-58b9-b517-67c23cb85444@suse.com>
 <79a765a6-c3be-bb52-611d-ceddc3837a22@gmail.com>
 <2bc775b5-fa9a-c4e7-8183-0f961a89c30f@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <10e07baa-a61b-e000-c87c-75b286a207e4@suse.com>
Date: Fri, 20 Sep 2019 12:25:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <2bc775b5-fa9a-c4e7-8183-0f961a89c30f@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V4 5/8] xen/common: Introduce
 xrealloc_flex_struct() helper macros
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
Cc: sstabellini@kernel.org, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, julien.grall@arm.com,
 Paul Durrant <paul.durrant@citrix.com>, xen-devel@lists.xenproject.org,
 Volodymyr_Babchuk@epam.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjAuMDkuMjAxOSAxMTo1MSwgT2xla3NhbmRyIHdyb3RlOgo+Pj4gT24gMTMuMDkuMjAxOSAx
NzozNSwgT2xla3NhbmRyIFR5c2hjaGVua28gd3JvdGU6Cj4+Pj4gLS0tIGEveGVuL2luY2x1ZGUv
eGVuL3htYWxsb2MuaAo+Pj4+ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi94bWFsbG9jLmgKPj4+PiBA
QCAtMzUsNiArMzUsMTUgQEAKPj4+PiDCoCAjZGVmaW5lIHh6YWxsb2NfYXJyYXkoX3R5cGUsIF9u
dW0pIFwKPj4+PiDCoMKgwqDCoMKgICgoX3R5cGUgKilfeHphbGxvY19hcnJheShzaXplb2YoX3R5
cGUpLCBfX2FsaWdub2ZfXyhfdHlwZSksIAo+Pj4+IF9udW0pKQo+Pj4+IMKgICsvKiBBbGxvY2F0
ZSBzcGFjZSBmb3IgYSBzdHJ1Y3R1cmUgd2l0aCBhIGZsZXhpYmxlIGFycmF5IG9mIHR5cGVkIAo+
Pj4+IG9iamVjdHMuICovCj4+Pj4gKyNkZWZpbmUgeG1hbGxvY19mbGV4X3N0cnVjdCh0eXBlLCBm
aWVsZCwgbnIpIFwKPj4+PiArwqDCoMKgICh0eXBlICopX3htYWxsb2Mob2Zmc2V0b2YodHlwZSwg
ZmllbGRbbnJdKSwgX19hbGlnbm9mX18odHlwZSkpCj4+Pj4gKwo+Pj4+ICsvKiBSZS1hbGxvY2F0
ZSBzcGFjZSBmb3IgYSBzdHJ1Y3R1cmUgd2l0aCBhIGZsZXhpYmxlIGFycmF5IG9mIHR5cGVkIAo+
Pj4+IG9iamVjdHMuICovCj4+Pj4gKyNkZWZpbmUgeHJlYWxsb2NfZmxleF9zdHJ1Y3QocHRyLCBm
aWVsZCwgCj4+Pj4gbnIpwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgXAo+Pj4+ICvCoMKgwqAgKHR5cGVvZihwdHIpKV94cmVhbGxvYyhwdHIsIG9mZnNl
dG9mKHR5cGVvZigqKHB0cikpLCAKPj4+PiBmaWVsZFtucl0pLMKgIFwKPj4+PiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBfX2FsaWdub2ZfXyh0
eXBlb2YoKihwdHIpKSkpCj4+PiBXaXRoIHRoZSBtaXNzaW5nIHBhcmVudGhlc2VzIGFyb3VuZCB0
aGUgZW50aXJlIGNvbnN0cnVjdHMgYWRkZWQKPj4+IFJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8
amJldWxpY2hAc3VzZS5jb20+Cj4+Cj4+IFRoYW5rIHlvdS4KPiAKPiAKPiBXb3VsZCB5b3UgYmUg
aGFwcHkgaWYgSSBhZGQgeHphbGxvY19mbGV4X3N0cnVjdCBoZXJlIGFzIHdlbGwgKG1heSBJIAo+
IHJldGFpbiB5b3VyIFItYik/CgpZZXMgdG8gYm90aC4KCkphbgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
