Return-Path: <SRS0=7THE=S4=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09687C43219
	for <xen-devel@archiver.kernel.org>; Fri, 26 Apr 2019 16:41:42 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D699F20693
	for <xen-devel@archiver.kernel.org>; Fri, 26 Apr 2019 16:41:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D699F20693
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hK3uk-00086f-2j; Fri, 26 Apr 2019 16:41:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6UZT=S4=citrix.com=prvs=0129f9400=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hK3ui-00085i-Rb
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2019 16:41:28 +0000
X-Inumbo-ID: 212b8e30-6842-11e9-86e3-13b5ef7dec5c
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 212b8e30-6842-11e9-86e3-13b5ef7dec5c;
 Fri, 26 Apr 2019 16:41:25 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,398,1549929600"; d="scan'208";a="84519676"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 26 Apr 2019 17:39:51 +0100
Message-ID: <20190426164002.22381-5-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190426164002.22381-1-ian.jackson@eu.citrix.com>
References: <20190426164002.22381-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH 04/15] arch replumbing: Provide
 $ho->{Arch} and $gho->{Arch}
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190426163951.e7aq5tyj2DZ6cFcwe6_TOX_94AiiWqzdZ--QDj4f5fI@z>

V2l0aCBleGlzdGluZyBmbGlnaHRzIHRoZXNlIGFyZSAkcnthcmNofSBhbmQgR1VFU1RfYXJjaC4K
Tm90aGluZyB1c2VzIHRoZXNlIHlldC4KClNpZ25lZC1vZmYtYnk6IElhbiBKYWNrc29uIDxpYW4u
amFja3NvbkBldS5jaXRyaXguY29tPgotLS0KIE9zc3Rlc3QvVGVzdFN1cHBvcnQucG0gfCAyICsr
CiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvT3NzdGVzdC9U
ZXN0U3VwcG9ydC5wbSBiL09zc3Rlc3QvVGVzdFN1cHBvcnQucG0KaW5kZXggNmFiNjRkNTYuLjE2
YzE3ZTM3IDEwMDY0NAotLS0gYS9Pc3N0ZXN0L1Rlc3RTdXBwb3J0LnBtCisrKyBiL09zc3Rlc3Qv
VGVzdFN1cHBvcnQucG0KQEAgLTExNjQsNiArMTE2NCw3IEBAIHN1YiBzZWxlY3Rob3N0ICgkKSB7
CiAgICAgICAgIE5lc3RpbmdMZXZlbCA9PiAwLAogICAgICAgICBJbmZvID0+IFtdLAogICAgIH07
CisgICAgJGhvLT57QXJjaH0gPSB0YXJnZXRfdmFyKCRobywgJ2FyY2gnKSBvciB3YXJuICJ1bmtu
b3duIGFyY2ggZm9yICRpZGVudCI7CiAgICAgaWYgKGRlZmluZWQgJGpvYikgewogCSRoby0+e1N1
aXRlfSA9IHRhcmdldF92YXIoJGhvLCAic3VpdGUiKSAvLyAkY3tEZWJpYW5TdWl0ZX07CiAJJGhv
LT57RGlWZXJzaW9ufSA9IHRhcmdldF92YXIoJGhvLCAiZGlfdmVyc2lvbiIpCkBAIC0xNzk1LDYg
KzE3OTYsNyBAQCBzdWIgc2VsZWN0Z3Vlc3QgKCQkKSB7CiAJSG9zdCA9PiAkaG8sCiAJU3VpdGUg
PT4gJHJ7IiR7Z259X3N1aXRlIn0sCiAgICAgfTsKKyAgICAkaG8tPntBcmNofSA9IHRhcmdldF92
YXIoJGhvLCAnYXJjaCcpIG9yIHdhcm4gInVua25vd24gYXJjaCBmb3IgJGduIjsKICAgICBmb3Jl
YWNoIG15ICRvcHQgKGd1ZXN0X3Zhcl9jb21tYWxpc3QoJGdobywnb3B0aW9ucycpKSB7CiAgICAg
ICAgICRnaG8tPntPcHRpb25zfXskb3B0fSsrOwogICAgIH0KLS0gCjIuMTEuMAoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
