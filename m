Return-Path: <SRS0=OoRj=ZL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C0E9C432C3
	for <xen-devel@archiver.kernel.org>; Tue, 19 Nov 2019 09:17:47 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 74392222D3
	for <xen-devel@archiver.kernel.org>; Tue, 19 Nov 2019 09:17:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 74392222D3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iWzdX-0005so-39; Tue, 19 Nov 2019 09:17:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=56Vh=ZL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iWzdW-0005sj-Fv
 for xen-devel@lists.xen.org; Tue, 19 Nov 2019 09:17:26 +0000
X-Inumbo-ID: 6608d6da-0aad-11ea-a2f8-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6608d6da-0aad-11ea-a2f8-12813bfff9fa;
 Tue, 19 Nov 2019 09:17:25 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 5177FAC35;
 Tue, 19 Nov 2019 09:17:23 +0000 (UTC)
To: Rishi <2rushikeshj@gmail.com>
References: <CAO9XypWibNu0iDnJsZXkQ+=Ecd6eThnu+td4O3VVLMe+qJ80eQ@mail.gmail.com>
 <76a91fb3-d2b0-dd23-7e99-0015fbee5990@suse.com>
 <CAO9XypVpBAPk8Hakqt7jJ08pCUhR_GzNxDWh2D-CGfp0+tfaAA@mail.gmail.com>
 <3b8d187e-c4d5-a7a5-76c2-874db47440ee@suse.com>
 <CAO9XypVNhSd8hPu1nA1uP8PVCPVgW-Bs_q6gmPky6Px0-U6G+w@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <04b95cfb-afa0-b6ba-2e69-74b56edbf4c4@suse.com>
Date: Tue, 19 Nov 2019 10:17:23 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <CAO9XypVNhSd8hPu1nA1uP8PVCPVgW-Bs_q6gmPky6Px0-U6G+w@mail.gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] Xen hiding thermal capabilities from Dom0
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
Cc: xen-devel@lists.xen.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTkuMTEuMjAxOSAwNjoyMywgUmlzaGkgd3JvdGU6Cj4gb2ssIHRoYW5rcyBmb3IgY2xlYXJp
bmcgaXQgdXAuIFdvdWxkIGEgcGF0Y2ggYmUgYWNjZXB0ZWQgaWYgdGhpcwo+IG9wdGlvbiBvZiBz
aG93aW5nIEVBWCBsZWFmIGlzIHNlbGVjdGl2ZWx5IGRvbmUgdGhyb3VnaCBjb21tYW5kIGxpbmUK
PiAoZGVmYXVsdCBkaXNhYmxlZCk/CgpJbiBnZW5lcmFsIEknZCBleHBlY3QgdGhpcyB0byBiZSBy
YXRoZXIgdW5saWtlbHksIGJ1dCBJIGd1ZXNzIG11Y2gKd291bGQgZGVwZW5kIG9uIHRoZSBhY3R1
YWwgcmVhc29uaW5nIGRvbmUgaW4gdGhlIGRlc2NyaXB0aW9uLgoKPiBPbiBsb25nZXIgcnVuLCB3
aGF0IGlzIGFuIGV4cGVjdGVkIHNhbmUgbW9kZWwgb2YgdmlydHVhbGl6aW5nIHRoaXM/Cj4gV2l0
aCBzb21lIGd1aWRhbmNlLCBtYXkgYmUgSSBvciBzb21lb25lIGVsc2UgY2FuIGNvZGUgdG8gYnJp
bmcgdGhlCj4gZnVuY3Rpb25hbGl0eSBiYWNrLgoKV2hpY2ggZnVuY3Rpb25hbGl0eT8gU28gZmFy
IHlvdSd2ZSB0YWxrZWQgb2Ygb25seSBDUFVJRCBiaXRzIEkKdGhpbmssIHdpdGhvdXQgZXhwbGFp
bmluZyBhdCBhbGwgd2hhdCBmdW5jdGlvbmFsaXR5IHlvdSB3YW50IHRvCmhhdmUgdGhhdCBkZXBl
bmRzIG9uIHRoZXNlLiBJbiBnZW5lcmFsLCBhcyBzYWlkIGVhcmxpZXIsIENQVQptYW5hZ2VtZW50
IGlzIHRoZSBoeXBlcnZpc29yJ3MgcmVzcG9uc2liaWxpdHksIHNvIEknZCByYXRoZXIKbm90IHNl
ZSB0aGlzIHZpcnR1YWxpemVkLCBidXQgdGhlIGh5cGVydmlzb3IgYmUgcHV0IGludG8gYQpwb3Np
dGlvbiBvZiBkb2luZyB3aGF0ZXZlciBpcyBuZWVkZWQuCgpKYW4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
