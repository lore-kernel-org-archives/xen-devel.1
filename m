Return-Path: <SRS0=7ods=SL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FBBCC10F0E
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 16:23:02 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1590920833
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 16:23:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1590920833
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hDtWF-0006An-Qo; Tue, 09 Apr 2019 16:22:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zDjF=SL=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hDtWE-0006Ai-1y
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2019 16:22:42 +0000
X-Inumbo-ID: b25b4998-5ae3-11e9-a422-b3241dc0ec37
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id b25b4998-5ae3-11e9-a422-b3241dc0ec37;
 Tue, 09 Apr 2019 16:22:40 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8982115AB;
 Tue,  9 Apr 2019 09:22:40 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0D5403F68F;
 Tue,  9 Apr 2019 09:22:38 -0700 (PDT)
To: Jan Beulich <JBeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
References: <5CAC97C30200007800225DED@prv1-mh.provo.novell.com>
 <08968726-0f4a-f267-b1f7-c1e08893c5a6@citrix.com>
 <5CACB7900200007800225F17@prv1-mh.provo.novell.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <d19d69ba-2930-c66d-a42e-0ca344e2f923@arm.com>
Date: Tue, 9 Apr 2019 17:22:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <5CACB7900200007800225F17@prv1-mh.provo.novell.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] timers: limit heap size
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"; format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190409162237.q7iBKMHPOAjJMyV6iL9bXdN56WuxzdoZRjwsxu0B670@z>

CgpPbiAwOS8wNC8yMDE5IDE2OjE3LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+PiBPbiAwOS4wNC4x
OSBhdCAxNTozOCwgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+IHdyb3RlOgo+PiBPbiAwOS8w
NC8yMDE5IDE0OjAxLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+IEBAIC00NjMsOSArNDYzLDE0IEBA
IHN0YXRpYyB2b2lkIHRpbWVyX3NvZnRpcnFfYWN0aW9uKHZvaWQpCj4+PiAgICAgICBpZiAoIHVu
bGlrZWx5KHRzLT5saXN0ICE9IE5VTEwpICkKPj4+ICAgICAgIHsKPj4+ICAgICAgICAgICAvKiBv
bGRfbGltaXQgPT0gKDJebiktMTsgbmV3X2xpbWl0ID09ICgyXihuKzQpKS0xICovCj4+PiAtICAg
ICAgICBpbnQgb2xkX2xpbWl0ID0gaGVhcF9tZXRhZGF0YShoZWFwKS0+bGltaXQ7Cj4+PiAtICAg
ICAgICBpbnQgbmV3X2xpbWl0ID0gKChvbGRfbGltaXQgKyAxKSA8PCA0KSAtIDE7Cj4+PiAtICAg
ICAgICBzdHJ1Y3QgdGltZXIgKipuZXdoZWFwID0geG1hbGxvY19hcnJheShzdHJ1Y3QgdGltZXIg
KiwgbmV3X2xpbWl0ICsKPj4gMSk7Cj4+PiArICAgICAgICB1bnNpZ25lZCBpbnQgb2xkX2xpbWl0
ID0gaGVhcF9tZXRhZGF0YShoZWFwKS0+bGltaXQ7Cj4+PiArICAgICAgICB1bnNpZ25lZCBpbnQg
bmV3X2xpbWl0ID0gKChvbGRfbGltaXQgKyAxKSA8PCA0KSAtIDE7Cj4+PiArICAgICAgICBzdHJ1
Y3QgdGltZXIgKipuZXdoZWFwID0gTlVMTDsKPj4+ICsKPj4+ICsgICAgICAgIC8qIERvbid0IGdy
b3cgdGhlIGhlYXAgYmV5b25kIHdoYXQgaXMgcmVwcmVzZW50YWJsZSBpbiBpdHMgbWV0YWRhdGEu
ICovCj4+PiArICAgICAgICBpZiAoIG5ld19saW1pdCA9PSAodHlwZW9mKGhlYXBfbWV0YWRhdGEo
aGVhcCktPmxpbWl0KSluZXdfbGltaXQgJiYKPj4+ICsgICAgICAgICAgICAgbmV3X2xpbWl0ICsg
MSApCj4+PiArICAgICAgICAgICAgbmV3aGVhcCA9IHhtYWxsb2NfYXJyYXkoc3RydWN0IHRpbWVy
ICosIG5ld19saW1pdCArIDEpOwo+Pgo+PiBJdCB3b3VsZCBwcm9iYWJseSBiZSBoZWxwZnVsIHRv
IGhhdmUgYSB3YXJuX29uY2UvcHJpbnRfb25jZSBpbiB0aGUgY2FzZQo+PiB0aGF0IHdlIGRvIGhp
dCB0aGUgbWV0YWRhdGEgbGltaXQKPiAKPiBJIGNhbiBkbyB0aGlzLCBhbGJlaXQgdGhlIGxhY2sg
b2YgdGhlIGNvbnN0cnVjdHMgeW91IHN1Z2dlc3Qgd2lsbAo+IG1ha2UgdGhpcyBhIGxpdHRsZSB1
Z2x5LgoKTWFjcm9zIGltcGxlbWVudGluZyBzdWNoIGJlaGF2aW9yIHdvdWxkIGJlIG1vcmUgdGhh
biB3ZWxjb21lZC4gV2UgdGVuZCB0byAKb3Blbi1jb2RlIFdBUk5fT05DRS9QUklOVF9PTkNFIGxv
Z2ljIGluIGV2ZXJ5IHBsYWNlIHdoaWNoIGlzIG5vdCB2ZXJ5IG5pY2UuCgpDaGVlcnMsCgotLSAK
SnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
