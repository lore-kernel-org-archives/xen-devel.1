Return-Path: <SRS0=diO+=XN=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC6A2C4CEC9
	for <xen-devel@archiver.kernel.org>; Wed, 18 Sep 2019 09:05:26 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B29DF20640
	for <xen-devel@archiver.kernel.org>; Wed, 18 Sep 2019 09:05:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B29DF20640
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAVte-0003W2-1V; Wed, 18 Sep 2019 09:05:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=rYmb=XN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iAVtc-0003Vv-IE
 for xen-devel@lists.xenproject.org; Wed, 18 Sep 2019 09:05:08 +0000
X-Inumbo-ID: 68f7e394-d9f3-11e9-962a-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 68f7e394-d9f3-11e9-962a-12813bfff9fa;
 Wed, 18 Sep 2019 09:05:07 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D2019B6D4;
 Wed, 18 Sep 2019 09:05:06 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <625c29ba-cfb8-88ee-eb15-5f2019198865@suse.com>
 <46ce7d1a-2a04-726c-919b-2d8bb4844391@suse.com>
 <cb6f6672-7b81-d901-36da-5292bcf45bad@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3dfc56b0-7084-19a8-85d0-70ebbb5a3a45@suse.com>
Date: Wed, 18 Sep 2019 11:05:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <cb6f6672-7b81-d901-36da-5292bcf45bad@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 5/9] x86/HVM: refuse CR3 loads with
 reserved (upper) bits set
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTcuMDkuMjAxOSAyMTozNSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAxNy8wOS8yMDE5
IDA3OjE1LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gLS0tIGEveGVuL2FyY2gveDg2L2h2bS9odm0u
Ywo+PiArKysgYi94ZW4vYXJjaC94ODYvaHZtL2h2bS5jCj4+IEBAIC0xMDA0LDYgKzEwMDQsMTMg
QEAgc3RhdGljIGludCBodm1fbG9hZF9jcHVfY3R4dChzdHJ1Y3QgZG9tYQo+PiAgICAgICAgICBy
ZXR1cm4gLUVJTlZBTDsKPj4gICAgICB9Cj4+ICAKPj4gKyAgICBpZiAoIGN0eHQuY3IzID4+IGQt
PmFyY2guY3B1aWQtPmV4dGQubWF4cGh5c2FkZHIgKQo+PiArICAgIHsKPj4gKyAgICAgICAgcHJp
bnRrKFhFTkxPR19HX0VSUiAiSFZNJWQgcmVzdG9yZTogYmFkIENSMyAlIyIgUFJJeDY0ICJcbiIs
Cj4+ICsgICAgICAgICAgICAgICBkLT5kb21haW5faWQsIGN0eHQuY3IzKTsKPj4gKyAgICAgICAg
cmV0dXJuIFg4NkVNVUxfRVhDRVBUSU9OOwo+IAo+IC1FSU5WQUwsIHN1cmVseT8KCk9oLCBpbmRl
ZWQuIFRoYW5rcyBmb3Igc3BvdHRpbmcuCgo+IEV2ZXJ5dGhpbmcgZWxzZSBMR1RNIChhbHRob3Vn
aCBJIGd1ZXNzIGl0IGRlcGVuZHMgb24gdGhlIHByZXZpb3VzCj4gcGF0Y2g/KQoKSXQgZG9lcywg
eWVzLgoKPiBzbyB3aXRoIHRoaXMgZml4ZWQsIFJldmlld2VkLWJ5OiBBbmRyZXcgQ29vcGVyCj4g
PGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgpUaGFua3MuCgpKYW4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
