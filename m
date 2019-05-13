Return-Path: <SRS0=55t9=TN=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CE4BC04AA7
	for <xen-devel@archiver.kernel.org>; Mon, 13 May 2019 15:07:56 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2625A208C3
	for <xen-devel@archiver.kernel.org>; Mon, 13 May 2019 15:07:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2625A208C3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQCYI-0006AF-WB; Mon, 13 May 2019 15:07:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rpFc=TN=citrix.com=prvs=0298122e9=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hQCYH-0006A6-QL
 for xen-devel@lists.xenproject.org; Mon, 13 May 2019 15:07:41 +0000
X-Inumbo-ID: d9aec412-7590-11e9-a8b3-c312b33c6840
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d9aec412-7590-11e9-a8b3-c312b33c6840;
 Mon, 13 May 2019 15:07:40 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,465,1549929600"; d="scan'208";a="85393529"
Date: Mon, 13 May 2019 16:07:27 +0100
From: Wei Liu <wei.liu2@citrix.com>
To: Olaf Hering <olaf@aepfle.de>
Message-ID: <20190513150727.GB3977@zion.uk.xensource.com>
References: <20190513165321.464fdeaf.olaf@aepfle.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190513165321.464fdeaf.olaf@aepfle.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Xen-devel] how to disable build of pv-shim?
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190513150727.y-GFcN5M0yCufI2uoXT9lZ1WT4Zzzw0I8UnUnNDlfo8@z>

T24gTW9uLCBNYXkgMTMsIDIwMTkgYXQgMDQ6NTM6MjFQTSArMDIwMCwgT2xhZiBIZXJpbmcgd3Jv
dGU6Cj4gV2hhdCBpcyB0aGUgcmVjb21tZW5kZWQgd2F5IHRvIGRpc2FibGUgQ09ORklHX1BWX1NI
SU0sIHdoaWNoIGlzIHNldCBpbgo+IHRvb2xzL2Zpcm13YXJlL01ha2VmaWxlPyBGcm9tIG15IHVu
ZGVyc3RhbmRpbmcgdGhlcmUgaXMgbm8gd2F5IHRvIGluZmx1ZW5jZQo+IGl0cyB2YWx1ZSBmcm9t
IG91dHNpZGUsIHdoaWNoIG1lYW5zIHRoZSBidWlsZCBhbHdheXMgZW50ZXJzIHhlbi1kaXIvLgo+
IAoKVGhlcmUgaXNuJ3QgYSB3YXkgdG8gZGlzYWJsZSBpdCB5ZXQuCgpJIHdvdWxkIHN1Z2dlc3Qg
eW91IGFkZCBhIC0tZGlzYWJsZS1wdi1zaGltIG9yIHNvbWV0aGluZyB0byB0b29scycKY29uZmln
dXJlIHNjcmlwdC4KCldlaS4KCj4gCj4gT2xhZgoKCgo+IF9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCj4gWGVuLWRldmVsIG1haWxpbmcgbGlzdAo+IFhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwo+IGh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWwKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
