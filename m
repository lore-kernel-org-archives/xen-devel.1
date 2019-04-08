Return-Path: <SRS0=fn8+=SK=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D15CDC10F13
	for <xen-devel@archiver.kernel.org>; Mon,  8 Apr 2019 12:44:30 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A9B8520883
	for <xen-devel@archiver.kernel.org>; Mon,  8 Apr 2019 12:44:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A9B8520883
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hDTd4-0001S4-MT; Mon, 08 Apr 2019 12:44:02 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=RaUp=SK=citrix.com=prvs=994f31c19=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hDTd3-0001Rz-KC
 for xen-devel@lists.xenproject.org; Mon, 08 Apr 2019 12:44:01 +0000
X-Inumbo-ID: fb5b22dc-59fb-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id fb5b22dc-59fb-11e9-92d7-bc764e045a96;
 Mon, 08 Apr 2019 12:44:00 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,325,1549929600"; d="scan'208";a="82996805"
Date: Mon, 8 Apr 2019 13:43:57 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Wei Liu <wei.liu2@citrix.com>
Message-ID: <20190408124357.GA3314@perard.uk.xensource.com>
References: <20190408115031.27127-1-wei.liu2@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190408115031.27127-1-wei.liu2@citrix.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
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
Cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190408124357.nK6b1MPKy1X-f1ujN0MKBQY1Fu-gza9_wLKaaqsLaIM@z>

T24gTW9uLCBBcHIgMDgsIDIwMTkgYXQgMTI6NTA6MzFQTSArMDEwMCwgV2VpIExpdSB3cm90ZToK
PiBUaGUgYnVpbGQgc2NyaXB0IGludm9rZWQgaXMgZGVzaWduZWQgdG8gcnVuIGluIGEgcHJpc3Rp
bmUgY2hlY2tvdXQuCj4gCj4gU2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4
LmNvbT4KPiAtLS0KPiAgYXV0b21hdGlvbi9naXRsYWItY2kvYnVpbGQtZWFjaC1jb21taXQuc2gg
fCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+
IAo+IGRpZmYgLS1naXQgYS9hdXRvbWF0aW9uL2dpdGxhYi1jaS9idWlsZC1lYWNoLWNvbW1pdC5z
aCBiL2F1dG9tYXRpb24vZ2l0bGFiLWNpL2J1aWxkLWVhY2gtY29tbWl0LnNoCj4gaW5kZXggMjc1
YmM3MTkwMi4uODc5MDI4YjVhNyAxMDA3NTUKPiAtLS0gYS9hdXRvbWF0aW9uL2dpdGxhYi1jaS9i
dWlsZC1lYWNoLWNvbW1pdC5zaAo+ICsrKyBiL2F1dG9tYXRpb24vZ2l0bGFiLWNpL2J1aWxkLWVh
Y2gtY29tbWl0LnNoCj4gQEAgLTE1LDQgKzE1LDQgQEAgZmkKPiAgZWNobyAiQnVpbGRpbmcgJHtD
SV9DT01NSVRfQkVGT1JFX1NIQX0uLiR7Q0lfQ09NTUlUX1NIQX0iCj4gIAo+ICBOT05fU1lNQk9M
SUNfUkVGPTEgLi9hdXRvbWF0aW9uL3NjcmlwdHMvYnVpbGQtdGVzdC5zaCAke0NJX0NPTU1JVF9C
RUZPUkVfU0hBfSAke0NJX0NPTU1JVF9TSEF9IFwKPiAtICAgIGJhc2ggLWMgIm1ha2UgLWo0IGRp
c3RjbGVhbiAmJiAuL2F1dG9tYXRpb24vc2NyaXB0cy9idWlsZCIKPiArICAgIGJhc2ggLWMgImdp
dCBjbGVhbiAtZmZkeCAmJiAuL2F1dG9tYXRpb24vc2NyaXB0cy9idWlsZCIKCklzIHRoaXMgbWVh
biB0aGF0IFFFTVUsIE9WTUYsIFNlYUJJT1MsIC4uLiBhcmUgZ29pbmcgdG8gYmUgY2xvbm5lZCBh
Z2FpbgphbmQgYWdhaW4/IEJ1dCBtYXliZSBpdCBkb2Vzbid0IG1hdHRlci4KCi0tIApBbnRob255
IFBFUkFSRAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
