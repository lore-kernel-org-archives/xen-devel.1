Return-Path: <SRS0=IXL8=37=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5B04C352A3
	for <xen-devel@archiver.kernel.org>; Tue, 11 Feb 2020 09:37:04 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BEE862070A
	for <xen-devel@archiver.kernel.org>; Tue, 11 Feb 2020 09:37:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BEE862070A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j1RyP-00005W-QL; Tue, 11 Feb 2020 09:36:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=zfJQ=37=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1j1RyP-00005O-4S
 for xen-devel@lists.xenproject.org; Tue, 11 Feb 2020 09:36:53 +0000
X-Inumbo-ID: 08b8ef14-4cb2-11ea-b53d-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 08b8ef14-4cb2-11ea-b53d-12813bfff9fa;
 Tue, 11 Feb 2020 09:36:52 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 01B0EB297;
 Tue, 11 Feb 2020 09:36:51 +0000 (UTC)
To: Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
References: <20200210164533.29549-1-jgross@suse.com>
 <042afa6eee4bc8e9316e636bf30f0a2190f7ee11.camel@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <d3ef20e2-82c5-5b60-3bde-b3093565980d@suse.com>
Date: Tue, 11 Feb 2020 10:36:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <042afa6eee4bc8e9316e636bf30f0a2190f7ee11.camel@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/sched: remove pointless ASSERT() in
 credit2
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEuMDIuMjAgMTA6MjksIERhcmlvIEZhZ2dpb2xpIHdyb3RlOgo+IE9uIE1vbiwgMjAyMC0w
Mi0xMCBhdCAxNzo0NSArMDEwMCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4gVGhlIEFTU0VSVCgp
IGF0IHRoZSB0b3Agb2YgY3NjaGVkMl9jb250ZXh0X3NhdmVkKCkgaXMgY29tcGxldGVseQo+PiBw
b2ludGxlc3MsIGFzIHRoZSBCVUdfT04oKSBqdXN0IGluIGZyb250IG9mIGl0IGNhdGNoZXMgdGhl
IHNhbWUKPj4gcHJvYmxlbQo+PiBhbHJlYWR5Lgo+Pgo+IFllcCwgSSB3ZW50IGRvdWJsZSBjaGVj
a2luZyBhbmQgdGhpcyBpcyBteSBmYXVsdC4gOi0oCj4gCj4gQXBwYXJlbnRseSwgaW4gY2NmMmVh
ZDdmNTIgKCJ4ZW46IGNyZWRpdDI6IG1ha2UgdGhlIGNvZGUgbGVzcwo+IGV4cGVyaW1lbnRhbCIp
LCBmb3IgdGhpcyBzcGVjaWZpYyBjYXNlLCBJIGFkZGVkIHRoZSBhc3NlcnQgYnV0IGZvcmdvdAo+
IHRvIHJlbW92ZSB0aGUgQlVHX09OKCkuCj4gCj4gVGhhbmtzIGZvciBub3RpY2luZyBhbmQgYWN0
aW5nIG9uIHRoaXMuIDotKQo+IAo+IFRCSCwgdGhvdWdoLCBjb25zaWRlcmluZyB0aGUgbmF0dXJl
IG9mIHRoZSBjaGVjaywgSSdkIHJhdGhlciBrZWVwIHRoZQo+IEFTU0VSVCgpIGFuZCBraWxsIHRo
ZSBCVUdfT04oKS4KPiAKPiBJIGNhbiBkbyB0aGUgcGF0Y2ggbXlzZWxmIGlmIHlvdSBkb24ndCB3
YW50IHRvIHJlc3BpbiBpdCB0aGF0IHdheS4KCkknbGwgcmVzcGluLgoKCkp1ZXJnZW4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
