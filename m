Return-Path: <SRS0=qwBA=TO=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CA3AC04AB4
	for <xen-devel@archiver.kernel.org>; Tue, 14 May 2019 07:08:15 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 27342208C3
	for <xen-devel@archiver.kernel.org>; Tue, 14 May 2019 07:08:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 27342208C3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQRXM-0003Vd-Jk; Tue, 14 May 2019 07:07:44 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=NyQH=TO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hQRXL-0003VY-N5
 for xen-devel@lists.xenproject.org; Tue, 14 May 2019 07:07:43 +0000
X-Inumbo-ID: f70a900c-7616-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id f70a900c-7616-11e9-8980-bc764e045a96;
 Tue, 14 May 2019 07:07:42 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Tue, 14 May 2019 01:07:41 -0600
Message-Id: <5CDA693B020000780022E62C@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Tue, 14 May 2019 01:07:39 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Brian Woods" <brian.woods@amd.com>,
 "Suravee Suthikulpanit" <suravee.suthikulpanit@amd.com>
References: <5CA6FD300200007800224C43@prv1-mh.provo.novell.com>
 <5CCB03F2020000780022B557@prv1-mh.provo.novell.com>
In-Reply-To: <5CCB03F2020000780022B557@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [Xen-devel] =?utf-8?b?UGluZ8KyOiBbUEFUQ0hdIEFNRC9JT01NVTogZG9u?=
 =?utf-8?b?J3Qgb3Blbi1jb2RlIGZvcl9lYWNoX2FtZF9pb21tdSgp?=
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
Cc: xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190514070739.dARWuRnHI4zOxMvuo-nqk6cTTJ7Vrq2xqXjEHLQ_kxQ@z>

Pj4+IE9uIDAyLjA1LjE5IGF0IDE2OjUxLCA8SkJldWxpY2hAc3VzZS5jb20+IHdyb3RlOgo+Pj4+
IE9uIDA1LjA0LjE5IGF0IDA5OjAxLCA8SkJldWxpY2hAc3VzZS5jb20+IHdyb3RlOgo+PiBTaWdu
ZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4+IAo+PiAtLS0gYS94
ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hbWQvaW9tbXVfaW50ci5jCj4+ICsrKyBiL3hlbi9kcml2
ZXJzL3Bhc3N0aHJvdWdoL2FtZC9pb21tdV9pbnRyLmMKPj4gQEAgLTUwMyw3ICs1MDMsNyBAQCBz
dGF0aWMgc3RydWN0IGFtZF9pb21tdSAqX2ZpbmRfaW9tbXVfZm9yCj4+ICB7Cj4+ICAgICAgc3Ry
dWN0IGFtZF9pb21tdSAqaW9tbXU7Cj4+ICAKPj4gLSAgICBsaXN0X2Zvcl9lYWNoX2VudHJ5ICgg
aW9tbXUsICZhbWRfaW9tbXVfaGVhZCwgbGlzdCApCj4+ICsgICAgZm9yX2VhY2hfYW1kX2lvbW11
ICggaW9tbXUgKQo+PiAgICAgICAgICBpZiAoIGlvbW11LT5zZWcgPT0gc2VnICYmIGlvbW11LT5i
ZGYgPT0gYmRmICkKPj4gICAgICAgICAgICAgIHJldHVybiBOVUxMOwo+PiAgCgpJJ20gc29ycnkg
Zm9yIGJlaW5nIGJsdW50LCBidXQgYSB0cml2aWFsIGNoYW5nZSBsaWtlIHRoaXMgc2hvdWxkbid0
CnJlcXVpcmUgd2VsbCBvdmVyIGEgbW9udGggYW5kIG11bHRpcGxlIHBpbmdzIHRvIGZpbmFsbHkg
Z2V0IGFuIGFjay4KSSdsbCBnaXZlIHRoaXMgYSBkYXkgb3IgdHdvIG1vcmUsIGFuZCB0aGVuIGNv
bW1pdCB3aXRob3V0IGFjawp1bmxlc3MgSSBoZWFyIG9iamVjdGlvbnMuCgpKYW4KCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
