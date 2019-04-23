Return-Path: <SRS0=MgWH=SZ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74A64C282E1
	for <xen-devel@archiver.kernel.org>; Tue, 23 Apr 2019 12:12:13 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 49E14214AE
	for <xen-devel@archiver.kernel.org>; Tue, 23 Apr 2019 12:12:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 49E14214AE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hIuHF-0006Og-9D; Tue, 23 Apr 2019 12:11:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=VyzP=SZ=citrix.com=prvs=009f8e5a5=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hIuHE-0006OX-H6
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2019 12:11:56 +0000
X-Inumbo-ID: fb795bbe-65c0-11e9-9a52-470ba4ef17ab
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fb795bbe-65c0-11e9-9a52-470ba4ef17ab;
 Tue, 23 Apr 2019 12:11:54 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,385,1549929600"; d="scan'208";a="84180807"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 23 Apr 2019 13:11:36 +0100
Message-ID: <20190423121139.25996-1-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH 0/3] stretch fallout: run 32-bit builds
 on 64-bit Linux
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
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wei.liu2@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Paul Durrant <paul.durrant@citrix.com>, committers@xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190423121136.ILuRzwhTm4y_9BJAuGC8B_qc8j_VP_cn23aqOt2DI0o@z>

SSBhbSBnb2luZyB0byBwdXNoIHRoaXMgdG8gb3NzdGVzdCBwcmV0ZXN0IHJpZ2h0IGF3YXkuICBU
aGlzIHByb2JsZW0KaXMgY3VycmVudGx5IGJsb2NraW5nIG9zc3Rlc3QncyBvd24gc2VsZi1wdXNo
LWdhdGUgYW5kIHByZXZlbnRpbmcgbWFueQpvdGhlciBmaXhlcyBmcm9tIG1ha2luZyBpdCBpbi4u
LgoKSWFuIEphY2tzb24gKDMpOgogIHRzLXN5c2xvZy1zZXJ2ZXI6IC0tbm8tc3RkaW4gb3B0aW9u
CiAgc2ctcnVuLWpvYiwgdHMtaG9zdC1pbnN0YWxsOiBOZXcgLS1idWlsZCBvcHRpb24KICBidWls
ZHM6IFJ1biBpMzg2IGJ1aWxkcyBvbiBhbWQ2NCBrZXJuZWxzCgogT3NzdGVzdC9EZWJpYW4ucG0g
fCAzNSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwogc2ctcnVuLWpvYiAgICAg
ICAgfCAgMiArLQogdHMtaG9zdC1pbnN0YWxsICAgfCAgOSArKysrKysrKysKIHRzLXN5c2xvZy1z
ZXJ2ZXIgIHwgMTAgKysrKysrKysrLQogNCBmaWxlcyBjaGFuZ2VkLCA1NCBpbnNlcnRpb25zKCsp
LCAyIGRlbGV0aW9ucygtKQoKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
