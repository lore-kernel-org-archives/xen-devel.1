Return-Path: <SRS0=ih+i=SM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,URI_NOVOWEL,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18485C10F11
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 15:53:39 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD06C20830
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 15:53:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DD06C20830
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEFXP-0004iS-Im; Wed, 10 Apr 2019 15:53:23 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Da5p=SM=citrix.com=prvs=9966e4c82=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hEFXO-0004i6-5z
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 15:53:22 +0000
X-Inumbo-ID: c3c1db1d-5ba8-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id c3c1db1d-5ba8-11e9-92d7-bc764e045a96;
 Wed, 10 Apr 2019 15:53:21 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,332,1549929600"; d="scan'208";a="83242875"
Date: Wed, 10 Apr 2019 16:52:17 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Paul Durrant <paul.durrant@citrix.com>
Message-ID: <20190410155217.GH1435@perard.uk.xensource.com>
References: <20190409164038.25484-1-paul.durrant@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190409164038.25484-1-paul.durrant@citrix.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Subject: Re: [Xen-devel] [PATCH] xen-block: support feature-large-sector-size
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBBcHIgMDksIDIwMTkgYXQgMDU6NDA6MzhQTSArMDEwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+IEEgcmVjZW50IFhlbiBjb21taXQgWzFdIGNsYXJpZmllZCB0aGUgc2VtYW50aWNzIG9m
IHNlY3RvciBiYXNlZCBxdWFudGl0aWVzCj4gdXNlZCBpbiB0aGUgYmxraWYgcHJvdG9jb2wgc3Vj
aCB0aGF0IGl0IGlzIG5vdyBzYWZlIHRvIGNyZWF0ZSBhIHhlbi1ibG9jawo+IGRldmljZSB3aXRo
IGEgbG9naWNhbF9ibG9ja19zaXplICE9IDUxMiwgYXMgbG9uZyBhcyB0aGUgZGV2aWNlIG9ubHkK
PiBjb25uZWN0cyB0byBhIGZyb250ZW5kIGFkdmVydGl6aW5nICdmZWF0dXJlLWxhcmdlLWJsb2Nr
LXNpemUnLgo+IAo+IFRoaXMgcGF0Y2ggbW9kaWZpZXMgeGVuLWJsb2NrIGFjY29yZGluZ2x5LiBJ
dCBhbHNvIHVzZXMgYSBzdGFjayB2YXJpYWJsZQo+IGZvciB0aGUgQmxvY2tCYWNrZW5kIGluIHhl
bl9ibG9ja19yZWFsaXplKCkgdG8gYXZvaWQgcmVwZWF0ZWQgZGVyZWZlcmVuY2luZwo+IG9mIHRo
ZSBCbG9ja0NvbmYgcG9pbnRlciwgYW5kIGNoYW5nZXMgdGhlIHBhcmFtZXRlcnMgb2YKPiB4ZW5f
YmxvY2tfZGF0YXBsYW5lX2NyZWF0ZSgpIHNvIHRoYXQgdGhlIEJsb2NrQmFja2VuZCBwb2ludGVy
IGFuZCBzZWN0b3IKPiBzaXplIGFyZSBwYXNzZWQgZXhwaWNpdGx5IHJhdGhlciB0aGFuIGltcGxp
Y2l0bHkgdmlhIHRoZSBCbG9ja0NvbmYuCj4gCj4gVGhlc2UgbW9kaWZpY2F0aW9ucyBoYXZlIGJl
ZW4gdGVzdGVkIGFnYWluc3QgYSByZWNlbnQgV2luZG93cyBQViBYRU5WQkQKPiBkcml2ZXIgWzJd
IHVzaW5nIGEgeGVuLWRpc2sgZGV2aWNlIHdpdGggYSA0a0IgbG9naWNhbCBibG9jayBzaXplLgo+
IAo+IFsxXSBodHRwOi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYi8/cD14ZW4uZ2l0O2E9Y29tbWl0
O2g9NjdlMWMwNTBlMzZiMmM5OTAwY2NhODM2MThlNTYxODllZmZiYWQ5OAo+IFsyXSBodHRwczov
L3dpbnB2ZHJ2YnVpbGQueGVucHJvamVjdC5vcmc6ODA4MC9qb2IvWEVOVkJELW1hc3Rlci8xMjYK
PiAKPiBTaWduZWQtb2ZmLWJ5OiBQYXVsIER1cnJhbnQgPHBhdWwuZHVycmFudEBjaXRyaXguY29t
Pgo+IC0tLQo+IGRpZmYgLS1naXQgYS9ody9ibG9jay94ZW4tYmxvY2suYyBiL2h3L2Jsb2NrL3hl
bi1ibG9jay5jCj4gaW5kZXggZWY2MzViZTRjMi4uMDVlODkwYWQ3OCAxMDA2NDQKPiAtLS0gYS9o
dy9ibG9jay94ZW4tYmxvY2suYwo+ICsrKyBiL2h3L2Jsb2NrL3hlbi1ibG9jay5jCj4gQEAgLTUx
LDExICs1MSwyNSBAQCBzdGF0aWMgdm9pZCB4ZW5fYmxvY2tfY29ubmVjdChYZW5EZXZpY2UgKnhl
bmRldiwgRXJyb3IgKiplcnJwKQpbLi4uXQo+ICsgICAgaWYgKHhlbl9kZXZpY2VfZnJvbnRlbmRf
c2NhbmYoeGVuZGV2LCAiZmVhdHVyZS1sYXJnZS1zZWN0b3Itc2l6ZSIsICIldSIsCj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAmZmVhdHVyZV9sYXJnZV9zZWN0b3Jfc2l6ZSkg
IT0gMSkgewo+ICsgICAgICAgIGZlYXR1cmVfbGFyZ2Vfc2VjdG9yX3NpemUgPSAwOwo+ICsgICAg
fQo+ICsKPiArICAgIGlmIChmZWF0dXJlX2xhcmdlX3NlY3Rvcl9zaXplICE9IDEgJiYKPiArICAg
ICAgICBjb25mLT5sb2dpY2FsX2Jsb2NrX3NpemUgIT0gWEVOX0JMS0lGX1NFQ1RPUl9TSVpFKSB7
Cj4gKyAgICAgICAgZXJyb3Jfc2V0ZyhlcnJwLCAibG9naWNhbF9ibG9ja19zaXplICE9ICV1IG5v
dCBzdXBwb3J0ZWQiLAoKTWF5YmUgYWRkICJieSBmcm9udGVuZCIgdG8gdGhlIGVycm9yIG1lc3Nh
Z2U/Cgo+ICsgICAgICAgICAgICAgICAgICAgWEVOX0JMS0lGX1NFQ1RPUl9TSVpFKTsKPiArICAg
ICAgICByZXR1cm47Cj4gKyAgICB9Cj4gKwoKV2l0aCB0aGUgcXVlc3Rpb24gYW5zd2VyZWQ6ClJl
dmlld2VkLWJ5OiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KClRo
YW5rcywKCi0tIApBbnRob255IFBFUkFSRAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
