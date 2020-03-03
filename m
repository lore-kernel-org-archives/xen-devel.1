Return-Path: <SRS0=Wnau=4U=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E15A0C3F2C6
	for <xen-devel@archiver.kernel.org>; Tue,  3 Mar 2020 18:32:13 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA1502073B
	for <xen-devel@archiver.kernel.org>; Tue,  3 Mar 2020 18:32:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BA1502073B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9CKc-0005sK-8O; Tue, 03 Mar 2020 18:31:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=qb1F=4U=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1j9CKa-0005sF-OQ
 for xen-devel@lists.xenproject.org; Tue, 03 Mar 2020 18:31:48 +0000
X-Inumbo-ID: 3dc78432-5d7d-11ea-a1fb-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3dc78432-5d7d-11ea-a1fb-12813bfff9fa;
 Tue, 03 Mar 2020 18:31:47 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1j9CKZ-0003Yv-4o; Tue, 03 Mar 2020 18:31:47 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1j9CKY-0000gv-SF; Tue, 03 Mar 2020 18:31:47 +0000
Date: Tue, 3 Mar 2020 18:31:44 +0000
From: Wei Liu <wl@xen.org>
To: Doug Goldstein <cardoe@cardoe.com>
Message-ID: <20200303183144.nfwgiy3u7scuepg4@debian>
References: <20200225121048.5889-1-wl@xen.org>
 <ccce9550-8dd4-0f0c-e20a-300137e53a29@cardoe.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ccce9550-8dd4-0f0c-e20a-300137e53a29@cardoe.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH] automation: document vsyscall=emulate for
 old glibc
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
Cc: Xen Development List <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBNYXIgMDMsIDIwMjAgYXQgMTE6Mzg6MDZBTSAtMDYwMCwgRG91ZyBHb2xkc3RlaW4g
d3JvdGU6Cj4gT24gMi8yNS8yMCA2OjEwIEFNLCBXZWkgTGl1IHdyb3RlOgo+ID4gU2lnbmVkLW9m
Zi1ieTogV2VpIExpdSA8d2xAeGVuLm9yZz4KPiAKPiBBY2tlZC1ieTogRG91ZyBHb2xkc3RlaW4g
PGNhcmRvZUBjYXJkb2UuY29tPgo+IAo+IAo+IERvIEkgbmVlZCB0byBtYWtlIHRoaXMgdHdlYWsg
b24gdGhlIGN1cnJlbnQgcnVubmVycz8KCkkgZG9uJ3QgdGhpbmsgc28uIENlbnRPUyA2IGNvbnRh
aW5lcnMgc2VlbSB0byB3b3JrIGZpbmUuCgpXZWkuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
