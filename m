Return-Path: <SRS0=5Xtu=SY=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43CC1C10F11
	for <xen-devel@archiver.kernel.org>; Mon, 22 Apr 2019 16:50:16 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B981214AE
	for <xen-devel@archiver.kernel.org>; Mon, 22 Apr 2019 16:50:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1B981214AE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hIc8r-0004oM-Fw; Mon, 22 Apr 2019 16:50:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tD/7=SY=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hIc8q-0004il-Nn
 for xen-devel@lists.xenproject.org; Mon, 22 Apr 2019 16:50:04 +0000
X-Inumbo-ID: accf1e7e-651e-11e9-8c13-179d71b0fcb1
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id accf1e7e-651e-11e9-8c13-179d71b0fcb1;
 Mon, 22 Apr 2019 16:50:03 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4583B15AB;
 Mon, 22 Apr 2019 09:50:03 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 35D443F557;
 Mon, 22 Apr 2019 09:50:02 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Mon, 22 Apr 2019 17:49:26 +0100
Message-Id: <20190422164937.21350-10-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190422164937.21350-1-julien.grall@arm.com>
References: <20190422164937.21350-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH 09/20] xen/arm64: head: Correctly report the HW
 CPU ID
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
Cc: Oleksandr_Tyshchenko@epam.com, Julien Grall <julien.grall@arm.com>,
 sstabellini@kernel.org, Andrii_Anisov@epam.com
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190422164926.EtLnNSjM52XDaEySH16PeyQqE6t-t_icd3Kh_ieIX6E@z>

VGhlcmUgYXJlIG5vIHJlYXNvbiB0byBjb25zaWRlciB0aGUgSFcgQ1BVIElEIHdpbGwgYmUgMCB3
aGVuIHRoZQpwcm9jZXNzb3IgaXMgcGFydCBvZiBhIHVuaXByb2Nlc3NvciBzeXN0ZW0uIEF0IGJl
c3QsIHRoaXMgd2lsbCByZXN1bHQgdG8KY29uZmxpY3Rpbmcgb3V0cHV0IGFzIHRoZSByZXN0IG9m
IFhlbiB1c2UgdGhlIHZhbHVlIGRpcmVjdGx5IHJlYWQgZnJvbQpNUElEUl9FTDEuCgpTbyByZW1v
dmUgdGhlIHplcm9pbmcgYW5kIGxvZ2ljIHRvIGNoZWNrIGlmIHRoZSBDUFUgaXMgcGFydCBvZiBh
CnVuaXByb2Nlc3NvciBzeXN0ZW0uCgpTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGll
bi5ncmFsbEBhcm0uY29tPgotLS0KIHhlbi9hcmNoL2FybS9hcm02NC9oZWFkLlMgfCA2IC0tLS0t
LQogMSBmaWxlIGNoYW5nZWQsIDYgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gv
YXJtL2FybTY0L2hlYWQuUyBiL3hlbi9hcmNoL2FybS9hcm02NC9oZWFkLlMKaW5kZXggYjk1N2Vi
OTBmYi4uMDgwOTRhMjczZSAxMDA2NDQKLS0tIGEveGVuL2FyY2gvYXJtL2FybTY0L2hlYWQuUwor
KysgYi94ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZC5TCkBAIC0yNzcsMTUgKzI3Nyw5IEBAIEdMT0JB
TChpbml0X3NlY29uZGFyeSkKICAgICAgICAgbW92ICAgeDI2LCAjMSAgICAgICAgICAgICAgICAv
KiBYMjYgOj0gc2tpcF96ZXJvX2JzcyAqLwogCiBjb21tb25fc3RhcnQ6Ci0gICAgICAgIG1vdiAg
IHgyNCwgIzAgICAgICAgICAgICAgICAgLyogeDI0IDo9IENQVSBJRC4gSW5pdGlhbHkgemVybyB1
bnRpbCB3ZQotICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAqIGZpbmQgdGhh
dCBtdWx0aXByb2Nlc3NvciBleHRlbnNpb25zIGFyZQotICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAqIHByZXNlbnQgYW5kIHRoZSBzeXN0ZW0gaXMgU01QICAqLwogICAgICAg
ICBtcnMgICB4MCwgbXBpZHJfZWwxCi0gICAgICAgIHRibnogIHgwLCBfTVBJRFJfVVAsIDFmICAg
ICAgLyogVW5pcHJvY2Vzc29yIHN5c3RlbT8gKi8KLQogICAgICAgICBsZHIgICB4MTMsID0ofk1Q
SURSX0hXSURfTUFTSykKICAgICAgICAgYmljICAgeDI0LCB4MCwgeDEzICAgICAgICAgICAvKiBN
YXNrIG91dCBmbGFncyB0byBnZXQgQ1BVIElEICovCi0xOgogCiAgICAgICAgIC8qIE5vbi1ib290
IENQVXMgd2FpdCBoZXJlIHVudGlsIF9fY3B1X3VwIGlzIHJlYWR5IGZvciB0aGVtICovCiAgICAg
ICAgIGNieiAgIHgyMiwgMWYKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
