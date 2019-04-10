Return-Path: <SRS0=ih+i=SM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F917C10F11
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 11:00:46 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 227A62075B
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 11:00:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 227A62075B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEAy3-0004ON-6t; Wed, 10 Apr 2019 11:00:35 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=B5aJ=SM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hEAy2-0004OG-5R
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 11:00:34 +0000
X-Inumbo-ID: dc19c7d2-5b7f-11e9-92d7-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id dc19c7d2-5b7f-11e9-92d7-bc764e045a96;
 Wed, 10 Apr 2019 11:00:32 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Wed, 10 Apr 2019 04:58:31 -0600
Message-Id: <5CADCC560200007800226221@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Wed, 10 Apr 2019 04:58:30 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "xen-devel" <xen-devel@lists.xenproject.org>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [Xen-devel] [PATCH] xmalloc: statically initialize pool list head
 and lock
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190410105830.64IJzArZraNIeVzrISp0idH8_MLjXkbOGsciOxxrgk8@z>

VGhlcmUncyBubyBuZWVkIHRvIGV4ZWN1dGUgYW55IGluc3RydWN0aW9ucyBmb3IgZG9pbmcgc28u
CgpTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgotLS0gYS94
ZW4vY29tbW9uL3htYWxsb2NfdGxzZi5jCisrKyBiL3hlbi9jb21tb24veG1hbGxvY190bHNmLmMK
QEAgLTY1LDggKzY1LDggQEAKICNkZWZpbmUgUFJFVl9GUkVFICAgICAgICgweDIpCiAjZGVmaW5l
IFBSRVZfVVNFRCAgICAgICAoMHgwKQogCi1zdGF0aWMgc3BpbmxvY2tfdCBwb29sX2xpc3RfbG9j
azsKLXN0YXRpYyBzdHJ1Y3QgbGlzdF9oZWFkIHBvb2xfbGlzdF9oZWFkOworc3RhdGljIERFRklO
RV9TUElOTE9DSyhwb29sX2xpc3RfbG9jayk7CitzdGF0aWMgTElTVF9IRUFEKHBvb2xfbGlzdF9o
ZWFkKTsKIAogc3RydWN0IGZyZWVfcHRyIHsKICAgICBzdHJ1Y3QgYmhkciAqcHJldjsKQEAgLTU1
MSw4ICs1NTEsNiBAQCBzdGF0aWMgdm9pZCAqeG1hbGxvY193aG9sZV9wYWdlcyh1bnNpZ25lCiAK
IHN0YXRpYyB2b2lkIHRsc2ZfaW5pdCh2b2lkKQogewotICAgIElOSVRfTElTVF9IRUFEKCZwb29s
X2xpc3RfaGVhZCk7Ci0gICAgc3Bpbl9sb2NrX2luaXQoJnBvb2xfbGlzdF9sb2NrKTsKICAgICB4
ZW5wb29sID0geG1lbV9wb29sX2NyZWF0ZSgKICAgICAgICAgInhtYWxsb2MiLCB4bWFsbG9jX3Bv
b2xfZ2V0LCB4bWFsbG9jX3Bvb2xfcHV0LAogICAgICAgICBQQUdFX1NJWkUsIDAsIFBBR0VfU0la
RSk7CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
