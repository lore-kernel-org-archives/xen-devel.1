Return-Path: <SRS0=jzL+=WC=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A310EC31E40
	for <xen-devel@archiver.kernel.org>; Tue,  6 Aug 2019 15:29:16 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7BF642070D
	for <xen-devel@archiver.kernel.org>; Tue,  6 Aug 2019 15:29:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7BF642070D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hv1OW-0007B8-5G; Tue, 06 Aug 2019 15:29:00 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=jalH=WC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hv1OU-0007B3-HU
 for xen-devel@lists.xenproject.org; Tue, 06 Aug 2019 15:28:58 +0000
X-Inumbo-ID: e80bebf3-b85e-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id e80bebf3-b85e-11e9-8980-bc764e045a96;
 Tue, 06 Aug 2019 15:28:57 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 868E8AF93;
 Tue,  6 Aug 2019 15:28:56 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20190805124301.12887-1-andrew.cooper3@citrix.com>
 <20190805124301.12887-4-andrew.cooper3@citrix.com>
 <20190806145158.ubeqywtxvuezzh3c@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3c93cdb5-49b7-5daa-9406-54f1c5356f64@suse.com>
Date: Tue, 6 Aug 2019 17:28:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190806145158.ubeqywtxvuezzh3c@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 3/4] x86/desc: Shorten boot_{,
 comat_}gdt[] variable names
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDYuMDguMjAxOSAxNjo1MSwgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6Cj4gT24gTW9uLCBB
dWcgMDUsIDIwMTkgYXQgMDE6NDM6MDBQTSArMDEwMCwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4g
VGhlIGN1cnJlbnQgbmFtZXMsIGJvb3RfY3B1X3ssY29tcGF0X31nZHRfdGFibGUsIGhhdmUgYSB0
YWJsZSBzdWZmaXggd2hpY2ggaXMKPj4gcmVkdW5kYW50IHdpdGggdGhlIFQgb2YgR0RULCBhbmQg
dGhlIGNwdSBpbmZpeCBkb2Vzbid0IHByb3ZpZGUgYW55IG1lYW5pbmdmdWwKPj4gY29udGV4dC4g
IERyb3AgdGhlbSBib3RoLgo+Pgo+PiBMaWtld2lzZSwgc2hvcnRlbiB0aGUgeyxjb21wYXRffWdk
dHssX2wxZX0gdmFyaWFibGVzLgo+Pgo+PiBGaW5hbGx5LCByZW5hbWUgZ2R0X2Rlc2NyIHRvIGJv
b3RfZ2R0ciB0byBtb3JlIGNsZWFybHkgaWRlbnRpZnkgaXRzIHB1cnBvc2UuCj4+Cj4+IFNpZ25l
ZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Cj4gCj4g
UmV2aWV3ZWQtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgoKQWNr
ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCihuaXQ6IGlkZWFsbHkgd2l0
aCB0aGUgbWlzc2luZyBwIGluc2VydGVkIGluIHRoZSB0aXRsZSkKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
