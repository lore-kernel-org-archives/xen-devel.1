Return-Path: <SRS0=ih+i=SM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4824C10F11
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 15:10:38 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 839332083E
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 15:10:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 839332083E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEErp-00008T-2R; Wed, 10 Apr 2019 15:10:25 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Da5p=SM=citrix.com=prvs=9966e4c82=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hEErn-00008I-L1
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 15:10:23 +0000
X-Inumbo-ID: c2727631-5ba2-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id c2727631-5ba2-11e9-92d7-bc764e045a96;
 Wed, 10 Apr 2019 15:10:22 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,332,1549929600"; d="scan'208";a="83234990"
Date: Wed, 10 Apr 2019 16:09:18 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Paul Durrant <paul.durrant@citrix.com>
Message-ID: <20190410150918.GF1435@perard.uk.xensource.com>
References: <20190408151617.13025-1-paul.durrant@citrix.com>
 <20190408151617.13025-4-paul.durrant@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190408151617.13025-4-paul.durrant@citrix.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Subject: Re: [Xen-devel] [PATCH 3/3] xen-bus / xen-block: add support for
 event channel polling
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
Cc: Kevin Wolf <kwolf@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190410150918.OWt_QaPIVoMvI7zbAE8bNs57JZ_Gt2TfY756HKcBgoA@z>

T24gTW9uLCBBcHIgMDgsIDIwMTkgYXQgMDQ6MTY6MTdQTSArMDEwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+IFRoaXMgcGF0Y2ggaW50cm9kdWNlcyBhIHBvbGwgY2FsbGJhY2sgZm9yIGV2ZW50IGNo
YW5uZWwgZmQtcyBhbmQgdXNlcwo+IHRoaXMgdG8gaW52b2tlIHRoZSBjaGFubmVsIGNhbGxiYWNr
IGZ1bmN0aW9uLgo+IAo+IFRvIHByb3Blcmx5IHN1cHBvcnQgcG9sbGluZywgaXQgaXMgbmVjZXNz
YXJ5IGZvciB0aGUgZXZlbnQgY2hhbm5lbCBjYWxsYmFjawo+IGZ1bmN0aW9uIHRvIHJldHVybiBh
IGJvb2xlYW4gc2F5aW5nIHdoZXRoZXIgaXQgaGFzIGRvbmUgYW55IHVzZWZ1bCB3b3JrIG9yCj4g
bm90LiBUaHVzIHhlbl9ibG9ja19kYXRhcGxhbmVfZXZlbnQoKSBpcyBtb2RpZmllZCB0byBkaXJl
Y3RseSBpbnZva2UKPiB4ZW5fYmxvY2tfaGFuZGxlX3JlcXVlc3RzKCkgYW5kIHRoZSBsYXR0ZXIg
b25seSByZXR1cm5zIHRydWUgaWYgaXQgYWN0dWFsbHkKPiBwcm9jZXNzZXMgYW55IHJlcXVlc3Rz
LiBUaGlzIGFsc28gbWVhbnMgdGhhdCB0aGUgY2FsbCB0byBxZW11X2JoX3NjaGVkdWxlKCkKPiBp
cyBtb3ZlZCBpbnRvIHhlbl9ibG9ja19jb21wbGV0ZV9haW8oKSwgd2hpY2ggaXMgbW9yZSBpbnR1
aXRpdmUgc2luY2UgdGhlCj4gb25seSByZWFzb24gZm9yIGRvaW5nIGEgZGVmZXJyZWQgcG9sbCBv
ZiB0aGUgc2hhcmVkIHJpbmcgc2hvdWxkIGJlIGJlY2F1c2UKPiB0aGVyZSB3ZXJlIHByZXZpb3Vz
bHkgaW5zdWZmaWNpZW50IHJlc291cmNlcyB0byBmdWxseSBjb21wbGV0ZSBhIHByZXZpb3VzCj4g
cG9sbC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBQYXVsIER1cnJhbnQgPHBhdWwuZHVycmFudEBjaXRy
aXguY29tPgo+IC0tLQoKUmV2aWV3ZWQtYnk6IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFy
ZEBjaXRyaXguY29tPgoKVGhhbmtzLAoKLS0gCkFudGhvbnkgUEVSQVJECgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
