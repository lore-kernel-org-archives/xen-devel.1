Return-Path: <SRS0=y94i=27=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 333A8C282DD
	for <xen-devel@archiver.kernel.org>; Fri, 10 Jan 2020 00:56:22 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0360D2072E
	for <xen-devel@archiver.kernel.org>; Fri, 10 Jan 2020 00:56:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zy1Dctpb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0360D2072E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipiaw-00059c-Dr; Fri, 10 Jan 2020 00:56:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=oc5E=27=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1ipiau-00059X-Tw
 for xen-devel@lists.xenproject.org; Fri, 10 Jan 2020 00:56:08 +0000
X-Inumbo-ID: fc6b5d46-3343-11ea-bba3-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fc6b5d46-3343-11ea-bba3-12813bfff9fa;
 Fri, 10 Jan 2020 00:56:08 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 24FD120673;
 Fri, 10 Jan 2020 00:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1578617767;
 bh=u/57/a7Q/k273eueAiHedJ2iAVm8Iwjcf9fy5QMhsYs=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=Zy1DctpbfJFfR1WqU0U52gPGEfsQwFGZ5QAzZClDgxmUhSUCi8ZQEfgAQfParHxWE
 YqBQtHfL5ULVGF4rs5q2tqcUBCv45kE6xXa3LWAd2s8ePPS1gx5nWtjZ3mry+7pZ/o
 ZieEy+b6kpo2IuR0hsDCiDFqLRwyfDPT2uM2wx1M=
Date: Thu, 9 Jan 2020 16:56:06 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Lars Kurth <lars.kurth@citrix.com>
In-Reply-To: <2BEABB31-EC08-4E37-A1CE-A26743837A87@citrix.com>
Message-ID: <alpine.DEB.2.21.2001091654550.18413@sstabellini-ThinkPad-T480s>
References: <2BEABB31-EC08-4E37-A1CE-A26743837A87@citrix.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] Updating
 https://wiki.xenproject.org/wiki/Outreach_Program_Projects
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
Cc: Felipe Huici <felipe.huici@neclab.eu>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Paul_Durrant=C2=A0?= <pdurrant@amazon.com>,
 George Dunlap <George.Dunlap@citrix.com>,
 "minios-devel@lists.xenproject.org" <minios-devel@lists.xenproject.org>,
 Julien Grall <julien.grall@arm.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Simon Kuenzer <simon.kuenzer@neclab.eu>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCA4IEphbiAyMDIwLCBMYXJzIEt1cnRoIHdyb3RlOgo+IEBTdGVmYW5vLCBASnVsaWVu
OiB0aGUgNSBwcm9qZWN0cyBiZWxvdyBhcmUgYWdhaW5zdCB5b3UgLSBhcmUgdGhlc2Ugc3RpbGwg
dmFsaWQ/Cj4gQEp1bGllbjogdGhlc2UgYXJlIGFnYWluc3QgeW91ciBBcm0gYWRkcmVzcwo+IGh0
dHBzOi8vd2lraS54ZW5wcm9qZWN0Lm9yZy93aWtpL091dHJlYWNoX1Byb2dyYW1fUHJvamVjdHMj
WGVuX0h5cGVydmlzb3IKPiAtIGh0dHBzOi8vd2lraS54ZW5wcm9qZWN0Lm9yZy93aWtpL091dHJl
YWNoX1Byb2dyYW1fUHJvamVjdHMjWGVuX29uX0FSTTpfVHJhcF8uMjZfc2FuaXRpemVfSURfcmVn
aXN0ZXJzXy4yOElEX1BGUjAuMkNfSURfREZSMC4yQ19ldGMuMjkKPiAtIGh0dHBzOi8vd2lraS54
ZW5wcm9qZWN0Lm9yZy93aWtpL091dHJlYWNoX1Byb2dyYW1fUHJvamVjdHMjWGVuX29uX0FSTS4y
Q19kb20wbGVzczpfY29uZmlndXJhYmxlX21lbW9yeV9sYXlvdXRfZm9yX2d1ZXN0cwo+IC0gaHR0
cHM6Ly93aWtpLnhlbnByb2plY3Qub3JnL3dpa2kvT3V0cmVhY2hfUHJvZ3JhbV9Qcm9qZWN0cyNB
Uk12OC4xX2F0b21pY3MKPiAtIGh0dHBzOi8vd2lraS54ZW5wcm9qZWN0Lm9yZy93aWtpL091dHJl
YWNoX1Byb2dyYW1fUHJvamVjdHMjWGVuX29uX0FSTTpfZHluYW1pY192aXJ0dWFsX21lbW9yeV9s
YXlvdXQKPiAtIGh0dHBzOi8vd2lraS54ZW5wcm9qZWN0Lm9yZy93aWtpL091dHJlYWNoX1Byb2dy
YW1fUHJvamVjdHMjWGVuX29uX0FSTTpfUGVyZm9ybWFuY2VfQ291bnRlcnNfVmlydHVhbGl6YXRp
b24KClRoZXkgYXJlIHN0aWxsIHZhbGlkLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
