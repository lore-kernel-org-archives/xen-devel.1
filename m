Return-Path: <SRS0=3Sku=TR=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A808CC04AB4
	for <xen-devel@archiver.kernel.org>; Fri, 17 May 2019 10:51:20 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 848E62087E
	for <xen-devel@archiver.kernel.org>; Fri, 17 May 2019 10:51:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 848E62087E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRaSE-0006jt-7G; Fri, 17 May 2019 10:51:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=mYL4=TR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hRaSC-0006jg-OY
 for xen-devel@lists.xenproject.org; Fri, 17 May 2019 10:51:08 +0000
X-Inumbo-ID: a9f9b980-7891-11e9-8547-4f5cb1990017
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a9f9b980-7891-11e9-8547-4f5cb1990017;
 Fri, 17 May 2019 10:51:03 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Fri, 17 May 2019 04:51:02 -0600
Message-Id: <5CDE921602000078002300B4@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Fri, 17 May 2019 04:51:02 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "xen-devel" <xen-devel@lists.xenproject.org>
References: <5CC6DD090200007800229E80@prv1-mh.provo.novell.com>
 <5CDE8F5B020000780023005F@prv1-mh.provo.novell.com>
In-Reply-To: <5CDE8F5B020000780023005F@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [Xen-devel] [PATCH v3 11/15] x86/IRQ: simplify and rename
 pirq_acktype()
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190517105102.9q-o6iKXp5a-NK-eg4aMWD-orW7phcQbAex_3ojFdqc@z>

SXRzIG9ubHkgY2FsbGVyIGFscmVhZHkgaGFzIHRoZSBJUlEgZGVzY3JpcHRvciBpbiBpdHMgaGFu
ZHMsIHNvIHRoZXJlJ3MKbm8gbmVlZCBmb3IgdGhlIGZ1bmN0aW9uIHRvIHJlLW9idGFpbiBpdC4g
QXMgYSByZXN1bHQgdGhlIGxlYWRpbmcgcCBvZgppdHMgbmFtZSBpcyBubyBsb25nZXIgYXBwcm9w
cmlhdGUgYW5kIGhlbmNlIGdldHMgZHJvcHBlZC4KClNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNo
IDxqYmV1bGljaEBzdXNlLmNvbT4KUmV2aWV3ZWQtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2Vy
LnBhdUBjaXRyaXguY29tPgotLS0KdjI6IE5ldy4KCi0tLSBhL3hlbi9hcmNoL3g4Ni9pcnEuYwor
KysgYi94ZW4vYXJjaC94ODYvaXJxLmMKQEAgLTE1NTYsMTcgKzE1NTYsOCBAQCBpbnQgcGlycV9n
dWVzdF91bm1hc2soc3RydWN0IGRvbWFpbiAqZCkKICAgICByZXR1cm4gMDsKIH0KIAotc3RhdGlj
IGludCBwaXJxX2Fja3R5cGUoc3RydWN0IGRvbWFpbiAqZCwgaW50IHBpcnEpCitzdGF0aWMgaW50
IGlycV9hY2t0eXBlKGNvbnN0IHN0cnVjdCBpcnFfZGVzYyAqZGVzYykKIHsKLSAgICBzdHJ1Y3Qg
aXJxX2Rlc2MgICpkZXNjOwotICAgIGludCBpcnE7Ci0KLSAgICBpcnEgPSBkb21haW5fcGlycV90
b19pcnEoZCwgcGlycSk7Ci0gICAgaWYgKCBpcnEgPD0gMCApCi0gICAgICAgIHJldHVybiBBQ0tU
WVBFX05PTkU7Ci0KLSAgICBkZXNjID0gaXJxX3RvX2Rlc2MoaXJxKTsKLQogICAgIGlmICggZGVz
Yy0+aGFuZGxlciA9PSAmbm9faXJxX3R5cGUgKQogICAgICAgICByZXR1cm4gQUNLVFlQRV9OT05F
OwogCkBAIC0xNTk3LDcgKzE1ODgsOCBAQCBzdGF0aWMgaW50IHBpcnFfYWNrdHlwZShzdHJ1Y3Qg
ZG9tYWluICpkCiAgICAgaWYgKCAhc3RyY21wKGRlc2MtPmhhbmRsZXItPnR5cGVuYW1lLCAiWFQt
UElDIikgKQogICAgICAgICByZXR1cm4gQUNLVFlQRV9VTk1BU0s7CiAKLSAgICBwcmludGsoIlVu
a25vd24gUElDIHR5cGUgJyVzJyBmb3IgSVJRICVkXG4iLCBkZXNjLT5oYW5kbGVyLT50eXBlbmFt
ZSwgaXJxKTsKKyAgICBwcmludGsoIlVua25vd24gUElDIHR5cGUgJyVzJyBmb3IgSVJRJWRcbiIs
CisgICAgICAgICAgIGRlc2MtPmhhbmRsZXItPnR5cGVuYW1lLCBkZXNjLT5pcnEpOwogICAgIEJV
RygpOwogCiAgICAgcmV0dXJuIDA7CkBAIC0xNjc0LDcgKzE2NjYsNyBAQCBpbnQgcGlycV9ndWVz
dF9iaW5kKHN0cnVjdCB2Y3B1ICp2LCBzdHJ1CiAgICAgICAgIGFjdGlvbi0+bnJfZ3Vlc3RzICAg
PSAwOwogICAgICAgICBhY3Rpb24tPmluX2ZsaWdodCAgID0gMDsKICAgICAgICAgYWN0aW9uLT5z
aGFyZWFibGUgICA9IHdpbGxfc2hhcmU7Ci0gICAgICAgIGFjdGlvbi0+YWNrX3R5cGUgICAgPSBw
aXJxX2Fja3R5cGUodi0+ZG9tYWluLCBwaXJxLT5waXJxKTsKKyAgICAgICAgYWN0aW9uLT5hY2tf
dHlwZSAgICA9IGlycV9hY2t0eXBlKGRlc2MpOwogICAgICAgICBpbml0X3RpbWVyKCZhY3Rpb24t
PmVvaV90aW1lciwgaXJxX2d1ZXN0X2VvaV90aW1lcl9mbiwgZGVzYywgMCk7CiAKICAgICAgICAg
ZGVzYy0+c3RhdHVzIHw9IElSUV9HVUVTVDsKCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
