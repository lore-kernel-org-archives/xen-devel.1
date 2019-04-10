Return-Path: <SRS0=ih+i=SM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CCC7C10F14
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 14:25:34 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5217220854
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 14:25:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5217220854
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEEAD-0006EO-EO; Wed, 10 Apr 2019 14:25:21 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xn7x=SM=citrix.com=prvs=996f5bc6d=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hEEAB-0006C3-LY
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 14:25:19 +0000
X-Inumbo-ID: 76fb510d-5b9c-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 76fb510d-5b9c-11e9-92d7-bc764e045a96;
 Wed, 10 Apr 2019 14:25:18 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,332,1549929600"; d="scan'208";a="83227674"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 10 Apr 2019 15:23:18 +0100
Message-ID: <20190410142408.22848-13-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
References: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH 12/62] ts-guests-nbd-mirror: make it
 work with stretch
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
Cc: Wei Liu <wei.liu2@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190410142318.y_YWMq4ynefuKY8xUAdOiVs3_WG-RwnzV1WcPdwly0g@z>

RnJvbTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KCk9uIHRoZSBzZXJ2ZXIgc2lkZSwg
b25seSBhZGQgb2xkc3R5bGU9IGFuZCBwb3J0PSBvbiB3aGVlenkgYW5kIGplc3NpZS4Kc3RyZXRj
aCBkb2Vzbid0IHN1cHBvcnQgb3IgbmVlZCB0aG9zZSBhbnltb3JlLgoKT24gdGhlIGNsaWVudCBz
aWRlLCBnZW5lcmF0ZSBuZXcgc3R5bGUgY29uZmlndXJhdGlvbiBmaWxlLgoKUmVvcmRlciBuYmQt
Y2xpZW50IHNldHVwIGEgYml0LiBJbnN0YWxsIGl0IGZpcnN0LCB0aGVuIHdyaXRlIG91ciBvd24K
Y29uZmlndXJhdGlvbiBmaWxlLCB0aGVuIHN0YXJ0IGl0LiAgVGhpcyBzdG9wcyBkcGtnIGFza2lu
ZyB3aGF0IHRvCmRvIHJlZ2FyZGluZyBjb25maWd1cmF0aW9uIGZpbGVzLgoKU2lnbmVkLW9mZi1i
eTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KQWNrZWQtYnk6IElhbiBKYWNrc29uIDxp
YW4uamFja3NvbkBldS5jaXRyaXguY29tPgotLS0KdjM6IGludmVydCBzb21lIHRlc3RzLCByZWFy
cmFuZ2UgY2xpZW50IHNldHVwIGNvZGUuCnY0OiBGaXggY29tbWl0IG1lc3NhZ2UgZ3JhbW1hci4K
LS0tCiB0cy1ndWVzdHMtbmJkLW1pcnJvciB8IDQ3ICsrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgNDMgaW5zZXJ0aW9ucygrKSwg
NCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS90cy1ndWVzdHMtbmJkLW1pcnJvciBiL3RzLWd1
ZXN0cy1uYmQtbWlycm9yCmluZGV4IGNhODMwMGRiLi43ZWEzMWY3YyAxMDA3NTUKLS0tIGEvdHMt
Z3Vlc3RzLW5iZC1taXJyb3IKKysrIGIvdHMtZ3Vlc3RzLW5iZC1taXJyb3IKQEAgLTYwLDE1ICs2
MCwxOSBAQCBzdWIgY29uZmlnc2VydmVyICgpIHsKIFtnZW5lcmljXQogICAgIHVzZXIgPSByb290
CiBFTkQKLSAgICAkc2NmZyAuPSA8PEVORCB1bmxlc3MgJHNoby0+e1N1aXRlfSA9fiBtL3Nhcmdl
fGxlbm55fHNxdWVlemUvOworCisgICAgJHNjZmcgLj0gPDxFTkQgaWYgJHNoby0+e1N1aXRlfSA9
fiBtL3doZWV6eXxqZXNzaWUvOwogICAgIG9sZHN0eWxlID0gdHJ1ZQogRU5ECisKICAgICBmb3Jl
YWNoIG15ICR2IChAdm9scykgewogCSR2LT57UG9ydH09IHVuaXF1ZV9pbmNyZW1lbnRpbmdfcnVu
dmFyKCIke3Nydmhvc3R9X25leHRwb3J0Iiw0MDAwKTsKIAkkdi0+e1BhdGh9PSAiL2Rldi8kdi0+
e0dob317Vmd9LyR2LT57THZ9IjsKIAkkc2NmZy49PDxFTkQ7CiBbZXhwb3J0JHYtPntJeH1dCiAg
ICAgZXhwb3J0bmFtZSA9ICR2LT57UGF0aH0KK0VORAorCSRzY2ZnLj08PEVORCBpZiAkc2hvLT57
U3VpdGV9ID1+IG0vd2hlZXp5fGplc3NpZS87CiAgICAgcG9ydCA9ICR2LT57UG9ydH0KIEVORAog
ICAgIH0KQEAgLTc5LDkgKzgzLDcgQEAgRU5ECiAgICAgdGFyZ2V0X2luc3RhbGxfcGFja2FnZXMo
JHNobywgcXcobmJkLXNlcnZlcikpOwogfQogCi1zdWIgY29uZmlnY2xpZW50ICgpIHsKLSAgICB0
YXJnZXRfY21kX3Jvb3QoJGNobywgImRwa2cgLS1wdXJnZSBuYmQtY2xpZW50IHx8OiIpOwotCitz
dWIgY29uZmlnY2xpZW50X3ByZV9zdHJldGNoICgpIHsKICAgICBteSAkbXlkYWVtb249ICcvcm9v
dC9uYmQtY2xpZW50LWFzeW5jJzsKICAgICB0YXJnZXRfcHV0ZmlsZWNvbnRlbnRzX3Jvb3Rfc3Rh
c2goJGNobywxMCw8PCdFTkQnLCRteWRhZW1vbik7CiAjIS9iaW4vc2gKQEAgLTEwNyw3ICsxMDks
NDQgQEAgTkJEX1BPUlRbJHYtPntJeH1dPSR2LT57UG9ydH0KIEVORAogICAgIH0KICAgICB0YXJn
ZXRfcHV0ZmlsZWNvbnRlbnRzX3Jvb3Rfc3Rhc2goJGNobywxMCwkY2NmZywiL2V0Yy9uYmQtY2xp
ZW50Iik7Cit9CisKK3N1YiBjb25maWdjbGllbnRfc3RyZXRjaF9hbmRfbGF0ZXIgKCkgeworICAg
IG15ICRjY2ZnID0gPDxFTkQ7CisjIGdlbmVyYXRlZCBieSAkMAorRU5ECisKKyAgICBmb3JlYWNo
IG15ICR2IChAdm9scykgeworCW15ICRuYmRkZXYgPSAibmJkJHYtPntJeH0iOworCSRjY2ZnIC49
IDw8RU5EOworJG5iZGRldiAkc2hvLT57TmFtZX0gZXhwb3J0JHYtPntJeH0KK0VORAorICAgIH0K
KworICAgIHRhcmdldF9wdXRmaWxlY29udGVudHNfcm9vdF9zdGFzaCgkY2hvLDEwLCRjY2ZnLCIv
ZXRjL25iZHRhYiIpOworfQorCitzdWIgY29uZmlnY2xpZW50ICgpIHsKKyAgICB0YXJnZXRfY21k
X3Jvb3QoJGNobywgImRwa2cgLS1wdXJnZSBuYmQtY2xpZW50IHx8OiIpOworCiAgICAgdGFyZ2V0
X2luc3RhbGxfcGFja2FnZXMoJGNobywgcXcobmJkLWNsaWVudCkpOworCisgICAgdGFyZ2V0X2Nt
ZF9yb290KCRjaG8sICIvZXRjL2luaXQuZC9uYmQtY2xpZW50IHN0b3AgfHw6Iik7CisKKyAgICBp
ZiAoJGNoby0+e1N1aXRlfSA9fiBtL3doZWV6eXxqZXNzaWUvKSB7CisgICAgICAgIGNvbmZpZ2Ns
aWVudF9wcmVfc3RyZXRjaCgpOworICAgIH0gZWxzZSB7CisgICAgICAgIGNvbmZpZ2NsaWVudF9z
dHJldGNoX2FuZF9sYXRlcigpOworCWZvcmVhY2ggbXkgJHYgKEB2b2xzKSB7CisJICAgIG15ICRu
YmRkZXYgPSAibmJkJHYtPntJeH0iOworCSAgICB0YXJnZXRfY21kX3Jvb3QoJGNobywgPDxFTkQp
OworbWtkaXIgLXAgL2Rldi8kdi0+e0dob317Vmd9CitpZiAhIHRlc3QgLUwgJHYtPntQYXRofTsg
dGhlbiBsbiAtcyAvZGV2LyRuYmRkZXYgJHYtPntQYXRofTsgZmkKK0VORAorCX0KKyAgICB9CisK
KyAgICB0YXJnZXRfY21kX3Jvb3QoJGNobywgIi9ldGMvaW5pdC5kL25iZC1jbGllbnQgc3RhcnQi
KTsKIH0KIAogc3ViIHNodWZmbGVjb25maWdzICgpIHsKLS0gCjIuMTEuMAoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
