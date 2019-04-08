Return-Path: <SRS0=fn8+=SK=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31A69C10F13
	for <xen-devel@archiver.kernel.org>; Mon,  8 Apr 2019 12:45:41 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0947620883
	for <xen-devel@archiver.kernel.org>; Mon,  8 Apr 2019 12:45:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0947620883
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hDTeR-0001WE-1Q; Mon, 08 Apr 2019 12:45:27 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PEQb=SK=citrix.com=prvs=994fb90f6=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hDTeP-0001W5-AW
 for xen-devel@lists.xenproject.org; Mon, 08 Apr 2019 12:45:25 +0000
X-Inumbo-ID: 2d3f208b-59fc-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 2d3f208b-59fc-11e9-92d7-bc764e045a96;
 Mon, 08 Apr 2019 12:45:24 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,325,1549929600"; d="scan'208";a="82996905"
Date: Mon, 8 Apr 2019 13:45:15 +0100
From: Wei Liu <wei.liu2@citrix.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <20190408124515.GE1986@zion.uk.xensource.com>
References: <20190408115031.27127-1-wei.liu2@citrix.com>
 <20190408124357.GA3314@perard.uk.xensource.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190408124357.GA3314@perard.uk.xensource.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Xen-devel] [PATCH] gitlab-ci: use git clean -ffdx in build
 each commit test
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>,
 Doug Goldstein <cardoe@cardoe.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190408124515.hMCRiU0q7aq3vLstMnPVm5fv9VB3gAGwSXc3-In4-v0@z>

T24gTW9uLCBBcHIgMDgsIDIwMTkgYXQgMDE6NDM6NTdQTSArMDEwMCwgQW50aG9ueSBQRVJBUkQg
d3JvdGU6Cj4gT24gTW9uLCBBcHIgMDgsIDIwMTkgYXQgMTI6NTA6MzFQTSArMDEwMCwgV2VpIExp
dSB3cm90ZToKPiA+IFRoZSBidWlsZCBzY3JpcHQgaW52b2tlZCBpcyBkZXNpZ25lZCB0byBydW4g
aW4gYSBwcmlzdGluZSBjaGVja291dC4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogV2VpIExpdSA8
d2VpLmxpdTJAY2l0cml4LmNvbT4KPiA+IC0tLQo+ID4gIGF1dG9tYXRpb24vZ2l0bGFiLWNpL2J1
aWxkLWVhY2gtY29tbWl0LnNoIHwgMiArLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgMSBkZWxldGlvbigtKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvYXV0b21hdGlvbi9naXRs
YWItY2kvYnVpbGQtZWFjaC1jb21taXQuc2ggYi9hdXRvbWF0aW9uL2dpdGxhYi1jaS9idWlsZC1l
YWNoLWNvbW1pdC5zaAo+ID4gaW5kZXggMjc1YmM3MTkwMi4uODc5MDI4YjVhNyAxMDA3NTUKPiA+
IC0tLSBhL2F1dG9tYXRpb24vZ2l0bGFiLWNpL2J1aWxkLWVhY2gtY29tbWl0LnNoCj4gPiArKysg
Yi9hdXRvbWF0aW9uL2dpdGxhYi1jaS9idWlsZC1lYWNoLWNvbW1pdC5zaAo+ID4gQEAgLTE1LDQg
KzE1LDQgQEAgZmkKPiA+ICBlY2hvICJCdWlsZGluZyAke0NJX0NPTU1JVF9CRUZPUkVfU0hBfS4u
JHtDSV9DT01NSVRfU0hBfSIKPiA+ICAKPiA+ICBOT05fU1lNQk9MSUNfUkVGPTEgLi9hdXRvbWF0
aW9uL3NjcmlwdHMvYnVpbGQtdGVzdC5zaCAke0NJX0NPTU1JVF9CRUZPUkVfU0hBfSAke0NJX0NP
TU1JVF9TSEF9IFwKPiA+IC0gICAgYmFzaCAtYyAibWFrZSAtajQgZGlzdGNsZWFuICYmIC4vYXV0
b21hdGlvbi9zY3JpcHRzL2J1aWxkIgo+ID4gKyAgICBiYXNoIC1jICJnaXQgY2xlYW4gLWZmZHgg
JiYgLi9hdXRvbWF0aW9uL3NjcmlwdHMvYnVpbGQiCj4gCj4gSXMgdGhpcyBtZWFuIHRoYXQgUUVN
VSwgT1ZNRiwgU2VhQklPUywgLi4uIGFyZSBnb2luZyB0byBiZSBjbG9ubmVkIGFnYWluCj4gYW5k
IGFnYWluPyBCdXQgbWF5YmUgaXQgZG9lc24ndCBtYXR0ZXIuCgpZZXMuIEJ1dCBJIGRvbid0IHRo
aW5rIHRoYXQgbWF0dGVycyBtdWNoLgoKV2VpLgoKPiAKPiAtLSAKPiBBbnRob255IFBFUkFSRAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
