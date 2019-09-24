Return-Path: <SRS0=VluW=XT=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=FROM_EXCESS_BASE64,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56075C432C1
	for <xen-devel@archiver.kernel.org>; Tue, 24 Sep 2019 11:09:13 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 31D412146E
	for <xen-devel@archiver.kernel.org>; Tue, 24 Sep 2019 11:09:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 31D412146E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCigo-0003PH-PC; Tue, 24 Sep 2019 11:09:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=MVCM=XT=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iCign-0003Ou-EH
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2019 11:09:01 +0000
X-Inumbo-ID: 8d0a01d6-dead-11e9-ae5c-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 8d0a01d6-dead-11e9-ae5c-bc764e2007e4;
 Tue, 24 Sep 2019 09:27:39 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 9625FB9FB;
 Tue, 24 Sep 2019 09:27:38 +0000 (UTC)
To: Lars Kurth <lars.kurth@citrix.com>, xen-devel@lists.xenproject.org
References: <9E62742B-981B-4496-B856-BDD76B80B476@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <7bfbdb61-ce54-65b1-a76a-22fa99cca4f5@suse.com>
Date: Tue, 24 Sep 2019 11:27:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <9E62742B-981B-4496-B856-BDD76B80B476@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] Moving next week's community call to Thu 10th
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjQuMDkuMTkgMTA6MzYsIExhcnMgS3VydGggd3JvdGU6Cj4gSGkgYWxsLAo+IAo+IGJlY2F1
c2UgbWFueSBvZiB1cyB3aWxsIGJlIGF0IHRoZSBQbGF0Zm9ybSBTZWN1cml0eSBTdW1taXQgbmV4
dCB3ZWVrLCBJIAo+IHByb3Bvc2UgdG8gbW92ZSB0aGUgY29tbXVuaXR5IGNhbGwgdG8gVGh1IDEw
XnRoIGF0IHRoZSB1c3VhbCB0aW1lCgorMQoKLi4uIGVzcGVjaWFsbHkgYXMgdGhlcmUgaXMgYSBw
dWJsaWMgaG9saWRheSBpbiBHZXJtYW55IG9uIE9jdCAzcmQuCgoKSnVlcmdlbgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
