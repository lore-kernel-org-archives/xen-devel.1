Return-Path: <SRS0=b7Gi=SO=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16BD7C10F0E
	for <xen-devel@archiver.kernel.org>; Fri, 12 Apr 2019 14:29:16 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E0BC62084D
	for <xen-devel@archiver.kernel.org>; Fri, 12 Apr 2019 14:29:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E0BC62084D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hExAm-0003YW-Tc; Fri, 12 Apr 2019 14:28:56 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=VTWF=SO=citrix.com=prvs=99843409f=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hExAm-0003YR-8U
 for xen-devel@lists.xenproject.org; Fri, 12 Apr 2019 14:28:56 +0000
X-Inumbo-ID: 4c660893-5d2f-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 4c660893-5d2f-11e9-92d7-bc764e045a96;
 Fri, 12 Apr 2019 14:28:54 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,341,1549929600"; d="scan'208";a="83442245"
Date: Fri, 12 Apr 2019 15:28:51 +0100
From: Wei Liu <wei.liu2@citrix.com>
To: Dongli Zhang <dongli.zhang@oracle.com>
Message-ID: <20190412142851.GK30543@zion.uk.xensource.com>
References: <1555052004-31855-1-git-send-email-dongli.zhang@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1555052004-31855-1-git-send-email-dongli.zhang@oracle.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Xen-devel] [PATCH 1/1] xen-netback: add reference from xenvif
 to backend_info to facilitate coredump analysis
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
Cc: wei.liu2@citrix.com, netdev@vger.kernel.org, joe.jin@oracle.com,
 linux-kernel@vger.kernel.org, junxiao.bi@oracle.com, paul.durrant@citrix.com,
 jie.l.li@oracle.com, xen-devel@lists.xenproject.org, davem@davemloft.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBBcHIgMTIsIDIwMTkgYXQgMDI6NTM6MjRQTSArMDgwMCwgRG9uZ2xpIFpoYW5nIHdy
b3RlOgo+IER1cmluZyBjb3JlZHVtcCBhbmFseXNpcywgaXQgaXMgbm90IGVhc3kgdG8gb2J0YWlu
IHRoZSBhZGRyZXNzIG9mCj4gYmFja2VuZF9pbmZvIGluIHhlbi1uZXRiYWNrLgo+IAo+IFNvIGZh
ciB0aGVyZSBhcmUgdHdvIHdheXMgdG8gb2J0YWluIGJhY2tlbmRfaW5mbzoKPiAKPiAxLiBEbyB3
aGF0IHhlbmJ1c19kZXZpY2VfZmluZCgpIGRvZXMgZm9yIHZtY29yZSB0byBmaW5kIHRoZSB4ZW5i
dXNfZGV2aWNlCj4gYW5kIHRoZW4gZGVyaXZlIGl0IGZyb20gZGV2X2dldF9kcnZkYXRhKCkuCj4g
Cj4gMi4gRXh0cmFjdCBiYWNrZW5kX2luZm8gZnJvbSBjYWxsc3RhY2sgb2YgeGVud2F0Y2ggKGUu
Zy4sIG5ldGJhY2tfcmVtb3ZlKCkKPiBvciBmcm9udGVuZF9jaGFuZ2VkKCkpLgo+IAo+IFRoaXMg
cGF0Y2ggYWRkcyBhIHJlZmVyZW5jZSBmcm9tIHhlbnZpZiB0byBiYWNrZW5kX2luZm8gc28gdGhh
dCBpdCB3b3VsZCBiZQo+IG11Y2ggbW9yZSBlYXNpZXIgdG8gb2J0YWluIGJhY2tlbmRfaW5mbyBk
dXJpbmcgY29yZWR1bXAgYW5hbHlzaXMuCj4gCj4gU2lnbmVkLW9mZi1ieTogRG9uZ2xpIFpoYW5n
IDxkb25nbGkuemhhbmdAb3JhY2xlLmNvbT4KCkFja2VkLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBj
aXRyaXguY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
