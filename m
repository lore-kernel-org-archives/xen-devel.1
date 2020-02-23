Return-Path: <SRS0=LwHk=4M=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DATE_IN_PAST_06_12,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 276B9C3567B
	for <xen-devel@archiver.kernel.org>; Mon, 24 Feb 2020 09:56:03 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF1E02072D
	for <xen-devel@archiver.kernel.org>; Mon, 24 Feb 2020 09:56:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EF1E02072D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6ASU-00087M-OP; Mon, 24 Feb 2020 09:55:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=FsOK=4M=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1j6ASU-00087H-2G
 for xen-devel@lists.xenproject.org; Mon, 24 Feb 2020 09:55:26 +0000
X-Inumbo-ID: c6ba074e-56eb-11ea-8ad6-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c6ba074e-56eb-11ea-8ad6-12813bfff9fa;
 Mon, 24 Feb 2020 09:55:24 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1j6ASR-0001bL-Mf; Mon, 24 Feb 2020 09:55:23 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1j6ASR-0001Qn-DT; Mon, 24 Feb 2020 09:55:23 +0000
Date: Sun, 23 Feb 2020 23:55:15 +0000
From: Wei Liu <wl@xen.org>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Message-ID: <20200223235515.5py7oe5fn5hsy7mp@debian>
References: <20200223211330.9968-1-wl@xen.org>
 <20200224084604.GG4679@Air-de-Roger>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200224084604.GG4679@Air-de-Roger>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH] x86/dom0_build: PVH ABI is now in
 pvh.markdown
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
Cc: Xen Development List <xen-devel@lists.xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBGZWIgMjQsIDIwMjAgYXQgMDk6NDY6MDRBTSArMDEwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPiBPbiBTdW4sIEZlYiAyMywgMjAyMCBhdCAwOToxMzozMFBNICswMDAwLCBXZWkg
TGl1IHdyb3RlOgo+ID4gU2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2xAeGVuLm9yZz4KPiA+IC0t
LQo+ID4gIHhlbi9hcmNoL3g4Ni9odm0vZG9tMF9idWlsZC5jIHwgMiArLQo+ID4gIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+ID4gCj4gPiBkaWZmIC0tZ2l0
IGEveGVuL2FyY2gveDg2L2h2bS9kb20wX2J1aWxkLmMgYi94ZW4vYXJjaC94ODYvaHZtL2RvbTBf
YnVpbGQuYwo+ID4gaW5kZXggMzgwNDEyMTUxYi4uZmZiYjJiZDU4NCAxMDA2NDQKPiA+IC0tLSBh
L3hlbi9hcmNoL3g4Ni9odm0vZG9tMF9idWlsZC5jCj4gPiArKysgYi94ZW4vYXJjaC94ODYvaHZt
L2RvbTBfYnVpbGQuYwo+ID4gQEAgLTYxNyw3ICs2MTcsNyBAQCBzdGF0aWMgaW50IF9faW5pdCBw
dmhfc2V0dXBfY3B1cyhzdHJ1Y3QgZG9tYWluICpkLCBwYWRkcl90IGVudHJ5LAo+ID4gICAgICBp
bnQgcmM7Cj4gPiAgICAgIC8qCj4gPiAgICAgICAqIFRoaXMgc2V0cyB0aGUgdkNQVSBzdGF0ZSBh
Y2NvcmRpbmcgdG8gdGhlIHN0YXRlIGRlc2NyaWJlZCBpbgo+ID4gLSAgICAgKiBkb2NzL21pc2Mv
aHZtbGl0ZS5tYXJrZG93bi4KPiA+ICsgICAgICogZG9jcy9taXNjL3B2aC5tYXJrZG93bi4KPiAK
PiBJIHRoaW5rIGl0J3MgcHZoLnBhbmRvYyBub3cuIFdpdGggdGhhdDoKCkluZGVlZC4KCj4gCj4g
UmV2aWV3ZWQtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgoKClRo
YW5rcy4KCldlaS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
