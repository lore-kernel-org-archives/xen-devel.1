Return-Path: <SRS0=kbZc=SS=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5492AC10F13
	for <xen-devel@archiver.kernel.org>; Tue, 16 Apr 2019 07:23:06 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 295AA2073F
	for <xen-devel@archiver.kernel.org>; Tue, 16 Apr 2019 07:23:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 295AA2073F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hGIQX-0000vP-GD; Tue, 16 Apr 2019 07:22:45 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=levW=SS=citrix.com=prvs=002eeef3a=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hGIQW-0000uM-4d
 for xen-devel@lists.xenproject.org; Tue, 16 Apr 2019 07:22:44 +0000
X-Inumbo-ID: 6c59cbae-6018-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 6c59cbae-6018-11e9-92d7-bc764e045a96;
 Tue, 16 Apr 2019 07:22:42 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,355,1549929600"; d="scan'208";a="83659430"
From: Wei Liu <wei.liu2@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 16 Apr 2019 08:21:39 +0100
Message-ID: <20190416072139.490-1-wei.liu2@citrix.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] gitlab-ci: allow specifying base and tip in
 build test
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
Cc: Doug Goldstein <cardoe@cardoe.com>, Wei Liu <wei.liu2@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190416072139.SIejX129yRawSmBXOnFAJE7TFBjz7QxelIMqwNGtoGk@z>

V2Ugd2lsbCBzb29uIHByb3ZpZGUgdGhpcyBuZXcgY2FwYWJpbGl0eSB0byBodW1hbnMgYW5kIGF1
dG9tYXRlZApzeXN0ZW1zLgoKVGhlIGRlZmF1bHQgYmVoYXZpb3VyIGlzIHJldGFpbmVkOiB0aXAg
YW5kIGJhc2UgYXJlIHBhc3NlZCBieSBHaXRsYWIKQ0kuCgpTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1
IDx3ZWkubGl1MkBjaXRyaXguY29tPgotLS0KIGF1dG9tYXRpb24vZ2l0bGFiLWNpL2J1aWxkLWVh
Y2gtY29tbWl0LnNoIHwgMTAgKysrKystLS0tLQogYXV0b21hdGlvbi9naXRsYWItY2kvdGVzdC55
YW1sICAgICAgICAgICAgfCAgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyks
IDYgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXV0b21hdGlvbi9naXRsYWItY2kvYnVpbGQt
ZWFjaC1jb21taXQuc2ggYi9hdXRvbWF0aW9uL2dpdGxhYi1jaS9idWlsZC1lYWNoLWNvbW1pdC5z
aAppbmRleCA4NzkwMjhiNWE3Li4xOWUzMzdiNDY4IDEwMDc1NQotLS0gYS9hdXRvbWF0aW9uL2dp
dGxhYi1jaS9idWlsZC1lYWNoLWNvbW1pdC5zaAorKysgYi9hdXRvbWF0aW9uL2dpdGxhYi1jaS9i
dWlsZC1lYWNoLWNvbW1pdC5zaApAQCAtMSwxOCArMSwxOCBAQAogIyEvYmluL2Jhc2gKIAogIyBG
b3IgYSBuZXdseSBwdXNoZWQgYnJhbmNoIHRoZSBCRUZPUkVfU0hBIHdpbGwgYmUgYWxsIDBzCi1p
ZiBbWyAke0NJX0NPTU1JVF9CRUZPUkVfU0hBfSA9PSAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwIF1dOyB0aGVuCitpZiBbWyAke0JBU0V9ID09IDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAgXV07IHRoZW4KICAgICBlY2hvICJOZXdseSBwdXNo
ZWQgYnJhbmNoLCBza2lwcGVkIgogICAgIGV4aXQgMAogZmkKIAotZ2l0IG1lcmdlLWJhc2UgLS1p
cy1hbmNlc3RvciAke0NJX0NPTU1JVF9CRUZPUkVfU0hBfSAke0NJX0NPTU1JVF9TSEF9CitnaXQg
bWVyZ2UtYmFzZSAtLWlzLWFuY2VzdG9yICR7QkFTRX0gJHtUSVB9CiBpZiBbWyAkPyAtbmUgMCBd
XTsgdGhlbgotICAgIGVjaG8gIiR7Q0lfQ09NTUlUX1NIQX0gaXMgbm90IGEgZGVzY2VuZGVudCBv
ZiAke0NJX0NPTU1JVF9CRUZPUkVfU0hBfSwgc2tpcHBlZCIKKyAgICBlY2hvICIke1RJUH0gaXMg
bm90IGEgZGVzY2VuZGVudCBvZiAke0JBU0V9LCBza2lwcGVkIgogICAgIGV4aXQgMAogZmkKIAot
ZWNobyAiQnVpbGRpbmcgJHtDSV9DT01NSVRfQkVGT1JFX1NIQX0uLiR7Q0lfQ09NTUlUX1NIQX0i
CitlY2hvICJCdWlsZGluZyAke0JBU0V9Li4ke1RJUH0iCiAKLU5PTl9TWU1CT0xJQ19SRUY9MSAu
L2F1dG9tYXRpb24vc2NyaXB0cy9idWlsZC10ZXN0LnNoICR7Q0lfQ09NTUlUX0JFRk9SRV9TSEF9
ICR7Q0lfQ09NTUlUX1NIQX0gXAorTk9OX1NZTUJPTElDX1JFRj0xIC4vYXV0b21hdGlvbi9zY3Jp
cHRzL2J1aWxkLXRlc3Quc2ggJHtCQVNFfSAke1RJUH0gXAogICAgIGJhc2ggLWMgImdpdCBjbGVh
biAtZmZkeCAmJiAuL2F1dG9tYXRpb24vc2NyaXB0cy9idWlsZCIKZGlmZiAtLWdpdCBhL2F1dG9t
YXRpb24vZ2l0bGFiLWNpL3Rlc3QueWFtbCBiL2F1dG9tYXRpb24vZ2l0bGFiLWNpL3Rlc3QueWFt
bAppbmRleCBkNDU1NmFmZTExLi5hNzk1ODY2NjczIDEwMDY0NAotLS0gYS9hdXRvbWF0aW9uL2dp
dGxhYi1jaS90ZXN0LnlhbWwKKysrIGIvYXV0b21hdGlvbi9naXRsYWItY2kvdGVzdC55YW1sCkBA
IC03LDcgKzcsNyBAQCBidWlsZC1lYWNoLWNvbW1pdC1nY2M6CiAgICAgWEVOX1RBUkdFVF9BUkNI
OiB4ODZfNjQKICAgICBDQzogZ2NjCiAgIHNjcmlwdDoKLSAgICAtIC4vYXV0b21hdGlvbi9naXRs
YWItY2kvYnVpbGQtZWFjaC1jb21taXQuc2ggMj4mMSB8IHRlZSBidWlsZC1lYWNoLWNvbW1pdC1n
Y2MubG9nCisgICAgLSBCQVNFPSR7QkFTRV9TSEE6LSR7Q0lfQ09NTUlUX0JFRk9SRV9TSEF9fSBU
SVA9JHtUSVBfU0hBOi0ke0NJX0NPTU1JVF9TSEF9fSAuL2F1dG9tYXRpb24vZ2l0bGFiLWNpL2J1
aWxkLWVhY2gtY29tbWl0LnNoIDI+JjEgfCB0ZWUgYnVpbGQtZWFjaC1jb21taXQtZ2NjLmxvZwog
ICBhcnRpZmFjdHM6CiAgICAgcGF0aHM6CiAgICAgICAtICcqLmxvZycKLS0gCjIuMjAuMQoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
