Return-Path: <SRS0=LbOi=SU=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0
	tests=HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 325EEC10F0E
	for <xen-devel@archiver.kernel.org>; Thu, 18 Apr 2019 11:26:46 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0AFB2214DA
	for <xen-devel@archiver.kernel.org>; Thu, 18 Apr 2019 11:26:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0AFB2214DA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hH5BS-0000jK-II; Thu, 18 Apr 2019 11:26:26 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tvKn=SU=citrix.com=prvs=004dc2360=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hH5BR-0000jF-CM
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2019 11:26:25 +0000
X-Inumbo-ID: cbf37f80-61cc-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id cbf37f80-61cc-11e9-92d7-bc764e045a96;
 Thu, 18 Apr 2019 11:26:23 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,365,1549929600"; d="scan'208";a="83879865"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 18 Apr 2019 12:26:18 +0100
Message-ID: <20190418112618.16706-1-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH] cr-daily-branch: ovmf: "usually" use
 xen-tested-master
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
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190418112618._fKXhsm7WWjBSNAWD6awnqsBad0pHxTZFWGbxtd2QzU@z>

VGhpcyBicmFuY2ggaXMgc3VwcG9zZWQgdG8gYmUgc3VpdGFibGUgZm9yIGFsbCB2ZXJzaW9ucyBv
ZiBYZW4uCkNvbnZlcnNlbHksIG9sZGVyIHZlcnNpb25zIG9mIE9WTUYgZG8gbm90IGJ1aWxkIG9u
IG5ld2VyIGNvbXBpbGVycyAoYXMKcHJvdmlkZWQsIGVnLCBpbiBzdHJldGNoKS4KClNvLCBmb3Ig
ImJyYW5jaGVzIiBvdGhlciB0aGFuIHhlbi11bnN0YWJsZSBhbmQgeGVuLXVuc3RhYmxlLXNtb2tl
LCB1c2UKdGhlIHVzdWFsICJkZXRlcm1pbmVfdmVyc2lvbiIgbWFjaGluZXJ5LCB3aGljaCB3aWxs
IHNlbGVjdAp4ZW4tdGVzdGVkLW1hc3RlciBmb3IgYnJhbmNoZXMgb3RoZXIgdGhhbiB0aGUgb3Zt
ZiBicmFuY2ggaXRzZWxmLgoKTm8gY2hhbmdlIGZvciB0aGUgb3ZtZiAiYnJhbmNoIiwgbm9yIGZv
ciB4ZW4tdW5zdGFibGUqLiAgVGhlIGVmZmVjdCBpcwp0byBzd2l0Y2ggeGVuLSotdGVzdGluZywg
cWVtdS0qLCBsaW51eC0qLCBldGMuLCB0byBhbGwgdXNlIG92bWYKeGVuLXRlc3RlZC1tYXN0ZXIu
CgpWZXJpZmllZCB3aXRoIHN0YW5kYWxvbmUtZ2VuZXJhdGUtZHVtcC1mbGlnaHQtcnVudmFycy4g
IEluIGRldGFpbDoKSW4gdGhlc2UgZmxpZ2h0czoKICAgZXhhbWluZSBmcmVlYnNkLW1hc3RlciBs
aWJ2aXJ0IGxpbnV4LSoKICAgb3NzdGVzdCBxZW11LSogc2VhYmlvcyB4ZW4tNC4qIHh0ZgppbiB0
aGVzZSBqb2JzCiAgIGJ1aWxkLWFtZDY0CiAgIGJ1aWxkLWFybTY0CiAgIGJ1aWxkLWFybWhmCiAg
IGJ1aWxkLWkzODYKY2hhbmdlCiAgIHJldmlzaW9uX292bWYgIHRvICAgdGhlIG91dHB1dCBvZiAg
IC4vYXAtZmV0Y2gtdmVyc2lvbi1iYXNlbGluZSBvdm1mCiAgIHRyZWVfb3ZtZiAgICAgIHRvICAg
Z2l0Oi8veGVuYml0cy54ZW4ub3JnL29zc3Rlc3Qvb3ZtZi5naXQKKGVhY2ggYmVpbmcgcHJldmlv
dXNseSBzZXQgdG8gdGhlIGVtcHR5IHN0cmluZykuCgpDQzogQW50aG9ueSBQRVJBUkQgPGFudGhv
bnkucGVyYXJkQGNpdHJpeC5jb20+ClNpZ25lZC1vZmYtYnk6IElhbiBKYWNrc29uIDxpYW4uamFj
a3NvbkBldS5jaXRyaXguY29tPgotLS0KIGNyLWRhaWx5LWJyYW5jaCB8IDExICsrKysrKystLS0t
CiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2NyLWRhaWx5LWJyYW5jaCBiL2NyLWRhaWx5LWJyYW5jaAppbmRleCA1Njk4YjA4My4u
MDBiNzEzYjMgMTAwNzU1Ci0tLSBhL2NyLWRhaWx5LWJyYW5jaAorKysgYi9jci1kYWlseS1icmFu
Y2gKQEAgLTIwNCwxNCArMjA0LDE3IEBAIGlmIFsgIngkUkVWSVNJT05fU0VBQklPUyIgPSB4IF07
IHRoZW4KICAgICBmaQogZmkKIGlmIFsgIngkUkVWSVNJT05fT1ZNRiIgPSB4IF07IHRoZW4KLSAg
ICBpZiBbICJ4JHRyZWUiID0gInhvdm1mIiBdOyB0aGVuCisgICAgY2FzZSAiJGJyYW5jaCIgaW4K
KyAgICB4ZW4tdW5zdGFibGUqKQorCTogUkVWSVNJT05fT1ZNRiBmcm9tIENvbmZpZy5taworCTs7
CisgICAgKikKIAlUUkVFX09WTUY9JFRSRUVfT1ZNRl9VUFNUUkVBTQogCWV4cG9ydCBUUkVFX09W
TUYKIAlkZXRlcm1pbmVfdmVyc2lvbiBSRVZJU0lPTl9PVk1GIG92bWYgT1ZNRgogCWV4cG9ydCBS
RVZJU0lPTl9PVk1GCi0gICAgZWxzZQotCTogUkVWSVNJT05fT1ZNRiBmcm9tIENvbmZpZy5tawot
ICAgIGZpCisJOzsKKyAgICBlc2FjCiBmaQogaWYgWyAieCRSRVZJU0lPTl9MSUJWSVJUIiA9IHgg
XTsgdGhlbgogCWNhc2UgIiR4ZW5icmFuY2giIGluCi0tIAoyLjExLjAKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
