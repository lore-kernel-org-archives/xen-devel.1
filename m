Return-Path: <SRS0=lvvB=2D=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 338B0C43603
	for <xen-devel@archiver.kernel.org>; Fri, 13 Dec 2019 05:41:17 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D7752253D
	for <xen-devel@archiver.kernel.org>; Fri, 13 Dec 2019 05:41:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0D7752253D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifdh1-00077R-Q6; Fri, 13 Dec 2019 05:40:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=nbPo=2D=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1ifdgz-00077H-UR
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2019 05:40:45 +0000
X-Inumbo-ID: 1ab52a46-1d6b-11ea-8ea0-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1ab52a46-1d6b-11ea-8ea0-12813bfff9fa;
 Fri, 13 Dec 2019 05:40:44 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id F0FB8ACAE;
 Fri, 13 Dec 2019 05:40:42 +0000 (UTC)
To: David Miller <davem@davemloft.net>, pdurrant@amazon.com
References: <20191212135406.26229-1-pdurrant@amazon.com>
 <20191212.110513.1770889236741616001.davem@davemloft.net>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <cefcf3a4-fc10-d62a-cac9-81f0e47710a8@suse.com>
Date: Fri, 13 Dec 2019 06:40:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191212.110513.1770889236741616001.davem@davemloft.net>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH net-next] xen-netback: get rid of old udev
 related code
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
Cc: xen-devel@lists.xenproject.org, wei.liu@kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIuMTIuMTkgMjA6MDUsIERhdmlkIE1pbGxlciB3cm90ZToKPiBGcm9tOiBQYXVsIER1cnJh
bnQgPHBkdXJyYW50QGFtYXpvbi5jb20+Cj4gRGF0ZTogVGh1LCAxMiBEZWMgMjAxOSAxMzo1NDow
NiArMDAwMAo+IAo+PiBJbiB0aGUgcGFzdCBpdCB1c2VkIHRvIGJlIHRoZSBjYXNlIHRoYXQgdGhl
IFhlbiB0b29sc3RhY2sgcmVsaWVkIHVwb24KPj4gdWRldiB0byBleGVjdXRlIGJhY2tlbmQgaG90
cGx1ZyBzY3JpcHRzLiBIb3dldmVyIHRoaXMgaGFzIG5vdCBiZWVuIHRoZQo+PiBjYXNlIGZvciBt
YW55IHJlbGVhc2VzIG5vdyBhbmQgcmVtb3ZhbCBvZiB0aGUgYXNzb2NpYXRlZCBjb2RlIGluCj4+
IHhlbi1uZXRiYWNrIHNob3J0ZW5zIHRoZSBzb3VyY2UgYnkgbW9yZSB0aGFuIDEwMCBsaW5lcywg
YW5kIHJlbW92ZXMgbXVjaAo+PiBjb21wbGV4aXR5IGluIHRoZSBpbnRlcmFjdGlvbiB3aXRoIHRo
ZSB4ZW5zdG9yZSBiYWNrZW5kIHN0YXRlLgo+Pgo+PiBOT1RFOiB4ZW4tbmV0YmFjayBpcyB0aGUg
b25seSB4ZW5idXMgZHJpdmVyIHRvIGhhdmUgYSBmdW5jdGlvbmFsIHVldmVudCgpCj4+ICAgICAg
ICBtZXRob2QuIFRoZSBvbmx5IG90aGVyIGRyaXZlciB0byBoYXZlIGEgbWV0aG9kIGF0IGFsbCBp
cwo+PiAgICAgICAgcHZjYWxscy1iYWNrLCBhbmQgY3VycmVudGx5IHB2Y2FsbHNfYmFja191ZXZl
bnQoKSBzaW1wbHkgcmV0dXJucyAwLgo+PiAgICAgICAgSGVuY2UgdGhpcyBwYXRjaCBhbHNvIGZh
Y2lsaXRhdGVzIGZ1cnRoZXIgY2xlYW51cC4KPj4KPj4gU2lnbmVkLW9mZi1ieTogUGF1bCBEdXJy
YW50IDxwZHVycmFudEBhbWF6b24uY29tPgo+IAo+IElmIHVzZXJzcGFjZSBldmVyIHVzZWQgdGhp
cyBzdHVmZiwgSSBzZXJpb3VzbHkgZG91YnQgeW91IGNhbiByZW1vdmUgdGhpcwo+IGV2ZW4gaWYg
aXQgaGFzbid0IGJlZW4gdXNlZCBpbiA1KyB5ZWFycy4KCkhtbSwgZGVwZW5kcy4KClRoaXMgaGFz
IGJlZW4gdXNlZCBieSBYZW4gdG9vbHMgaW4gZG9tMCBvbmx5LiBJZiB0aGUgbGFzdCB1c2FnZSBo
YXMgYmVlbgppbiBhIFhlbiB2ZXJzaW9uIHdoaWNoIGlzIG5vIGxvbmdlciBhYmxlIHRvIHJ1biB3
aXRoIGN1cnJlbnQgTGludXggaW4KZG9tMCBpdCBjb3VsZCBiZSByZW1vdmVkLiBCdXQgSSBndWVz
cyB0aGlzIHdvdWxkIGhhdmUgdG8gYmUgYSByYXRoZXIgb2xkCnZlcnNpb24gb2YgWGVuIChsaWtl
IDMueD8pLgoKUGF1bCwgY2FuIHlvdSBnaXZlIGEgaGludCBzaW5jZSB3aGljaCBYZW4gdmVyc2lv
biB0aGUgdG9vbHN0YWNrIG5vCmxvbmdlciByZWxpZXMgb24gdWRldiB0byBzdGFydCB0aGUgaG90
cGx1ZyBzY3JpcHRzPwoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
