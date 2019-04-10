Return-Path: <SRS0=ih+i=SM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6239C10F11
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 14:26:01 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D0E120850
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 14:26:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8D0E120850
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEEAf-0007H6-S5; Wed, 10 Apr 2019 14:25:49 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xn7x=SM=citrix.com=prvs=996f5bc6d=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hEEAU-0006oj-5x
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 14:25:38 +0000
X-Inumbo-ID: 826fb43f-5b9c-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 826fb43f-5b9c-11e9-92d7-bc764e045a96;
 Wed, 10 Apr 2019 14:25:37 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,332,1549929600"; d="scan'208";a="83227737"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 10 Apr 2019 15:23:58 +0100
Message-ID: <20190410142408.22848-53-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
References: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH 52/62] target_install_packages:
 Consistently use qw(...) rather than '...'
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
Message-ID: <20190410142358.EVUtUR5rhaLeaVBNrrPEeh0nDTlFFuOxDQjhSC1OYkQ@z>

cXcoLi4uKSBzcGxpdHMgaXRzIGFyZ3VtZW50IGludG8gd29yZHMuCgpUaGVyZSBpcyBvbmUgc2Vt
YW50aWMgY2hhbmdlLCB3aGVyZSB0d28gcGFja2FnZSBuYW1lcyB3ZXJlIHBhc3NlZCBpbiBhCnNp
bmdsZSBhcmd1bWVudC4gIFRoYXQgd29ya2VkIGJ5IGFjY2lkZW50LgoKU2lnbmVkLW9mZi1ieTog
SWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+Ci0tLQogdHMteGVuLWluc3Rh
bGwgfCAxMCArKysrKy0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA1IGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3RzLXhlbi1pbnN0YWxsIGIvdHMteGVuLWluc3RhbGwK
aW5kZXggODA5NTI4NTcuLjAzZjhjMDNlIDEwMDc1NQotLS0gYS90cy14ZW4taW5zdGFsbAorKysg
Yi90cy14ZW4taW5zdGFsbApAQCAtNTMsMTggKzUzLDE4IEBAIHN1YiBwYWNrYWdlcyAoKSB7CiAJ
CQkgICAgICAgcWVtdS11dGlscwogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG5ldGNh
dC1vcGVuYnNkKSk7CiAgICAgaWYgKCRoby0+e1N1aXRlfSAhfiBtL3NxdWVlemV8d2hlZXp5fGpl
c3NpZS8pIHsKLSAgICAgICAgdGFyZ2V0X2luc3RhbGxfcGFja2FnZXMoJGhvLCAnbmV0LXRvb2xz
IGxpYm5sLXJvdXRlLTMtMjAwJyk7CisgICAgICAgIHRhcmdldF9pbnN0YWxsX3BhY2thZ2VzKCRo
bywgcXcobmV0LXRvb2xzIGxpYm5sLXJvdXRlLTMtMjAwKSk7CiAgICAgfQogICAgIGlmICgkaG8t
PntTdWl0ZX0gPX4gbS9qZXNzaWUvKSB7Ci0gICAgICAgIHRhcmdldF9pbnN0YWxsX3BhY2thZ2Vz
KCRobywgJ2xpYm5sLXJvdXRlLTMtMjAwJyk7CisgICAgICAgIHRhcmdldF9pbnN0YWxsX3BhY2th
Z2VzKCRobywgcXcobGlibmwtcm91dGUtMy0yMDApKTsKICAgICB9CiAgICAgdGFyZ2V0X2luc3Rh
bGxfcGFja2FnZXMoJGhvLAogCQkJICAgICRoby0+e1N1aXRlfSA9fiAvc3F1ZWV6ZS8gPyAibGli
eWFqbDEiIDogImxpYnlhamwyIik7CiAgICAgaWYgKCRoby0+e1N1aXRlfSAhfiBtL2xlbm55fHNx
dWVlemUvKSB7Ci0gICAgICAgIHRhcmdldF9pbnN0YWxsX3BhY2thZ2VzKCRobywgJ2xpYmZkdDEn
KTsKKyAgICAgICAgdGFyZ2V0X2luc3RhbGxfcGFja2FnZXMoJGhvLCBxdyhsaWJmZHQxKSk7CiAg
ICAgfQogICAgIGlmICgkcnthcmNofSBlcSAnaTM4NicpIHsKLQl0YXJnZXRfaW5zdGFsbF9wYWNr
YWdlcygkaG8sICdsaWJjNi14ZW4nKTsKKwl0YXJnZXRfaW5zdGFsbF9wYWNrYWdlcygkaG8sIHF3
KGxpYmM2LXhlbikpOwogICAgIH0KICAgICB0YXJnZXRfaW5zdGFsbF9wYWNrYWdlcygkaG8sIEB7
dG9vbHN0YWNrKCRobyktPntFeHRyYVBhY2thZ2VzfX0pCiAgICAgICAgIGlmIHRvb2xzdGFjaygk
aG8pLT57RXh0cmFQYWNrYWdlc307CkBAIC04OCw3ICs4OCw3IEBAIHN1YiBzb21lX2V4dHJhZGVi
cyAoJCkgewogCSAgICAkb250YXJnZXQgPSAiZXh0cmFwYWNrYWdlcy0kY2ZndmFyLSRjb3VudGVy
IjsgJGNvdW50ZXIrKzsKIAkgICAgJGRwa2dvcHRzID0gJy1pR1JPRUInOwogCSAgICBsb2dtKCIk
Y2ZndmFyOiB1cGRhdGluZyBwYWNrYWdlcyBmcm9tIGRpcmVjdG9yeSAkcGF0aCIpOwotCSAgICB0
YXJnZXRfaW5zdGFsbF9wYWNrYWdlcygkaG8sICdyc3luYycpIHVubGVzcyAkcnN5bmNfaW5zdGFs
bGVkKys7CisJICAgIHRhcmdldF9pbnN0YWxsX3BhY2thZ2VzKCRobywgcXcocnN5bmMpKSB1bmxl
c3MgJHJzeW5jX2luc3RhbGxlZCsrOwogCSAgICB0YXJnZXRfcHV0ZmlsZV9yb290KCRobywzMDAs
ICIkcGF0aC8uIiwgJG9udGFyZ2V0LCAnLXInKTsKIAl9IGVsc2lmICgkcGF0aCA9fiBte1wuZGVi
JH0pIHsKIAkgICAgJHBhdGggPX4gc3tfXC5kZWJ9eyAiXyRye2FyY2h9LmRlYiIgfWU7Ci0tIAoy
LjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
