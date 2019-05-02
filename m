Return-Path: <SRS0=9xPH=TC=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE239C46470
	for <xen-devel@archiver.kernel.org>; Thu,  2 May 2019 17:53:39 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB2622089E
	for <xen-devel@archiver.kernel.org>; Thu,  2 May 2019 17:53:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AB2622089E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hMFtS-0006hP-4s; Thu, 02 May 2019 17:53:14 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=yl7K=TC=citrix.com=prvs=018ff06f8=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hMFtQ-0006gl-CC
 for xen-devel@lists.xenproject.org; Thu, 02 May 2019 17:53:12 +0000
X-Inumbo-ID: 26efc359-6d03-11e9-843c-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 26efc359-6d03-11e9-843c-bc764e045a96;
 Thu, 02 May 2019 17:53:11 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,422,1549929600"; d="scan'208";a="84983434"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 2 May 2019 18:42:31 +0100
Message-ID: <20190502174238.23848-3-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190502174238.23848-1-ian.jackson@eu.citrix.com>
References: <20190502174238.23848-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH 2/9] cs-adjust-flight: Break out
 copy_jobs_*
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
Message-ID: <20190502174231.Ab7N1A2wKrvqFunObEjDbBUXzUSh-4xFet2zCKnhFoM@z>

Tm8gZnVuY3Rpb25hbCBjaGFuZ2UuCgpTaWduZWQtb2ZmLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmph
Y2tzb25AZXUuY2l0cml4LmNvbT4KLS0tCiBjcy1hZGp1c3QtZmxpZ2h0IHwgMjAgKysrKysrKysr
KysrKystLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2NzLWFkanVzdC1mbGlnaHQgYi9jcy1hZGp1c3QtZmxpZ2h0Cmlu
ZGV4IGVlMWQ5MTdjLi5iYWRhYmVmZiAxMDA3NTUKLS0tIGEvY3MtYWRqdXN0LWZsaWdodAorKysg
Yi9jcy1hZGp1c3QtZmxpZ2h0CkBAIC0xOTQsMTAgKzE5NCw4IEBAIHN1YiBkb19ybV9qb2IgKCQp
IHsKICAgICB2ZXJib3NlICIkZHN0ZmxpZ2h0LiRqb2Igam9iIGRlbGV0ZWRcbiIgaWYgJGNvdW50
OwogfQogCi1zdWIgY29weV9qb2JzICgkJCkgewotICAgIG15ICgkc3JjZmxpZ2h0LCAkam9icykg
PSBAXzsKLSAgICBwcmVwX3JtX2pvYnMoKTsKLSAgICBteSBAam9iX2NvcHlfcXMgPSBtYXAgeyAk
ZGJoX3Rlc3RzLT5wcmVwYXJlKCRfKSB9CitzdWIgY29weV9qb2JzX3FzICgpIHsKKyAgICBtYXAg
eyAkZGJoX3Rlc3RzLT5wcmVwYXJlKCRfKSB9CiAgICAgICAgICgiSU5TRVJUIElOVE8gam9icyAo
ZmxpZ2h0LCBqb2IsIHJlY2lwZSwgc3RhdHVzKSIuCiAgICAgICAgICAiICAgICBTRUxFQ1QgPywg
am9iLCByZWNpcGUsICdxdWV1ZWQnIi4KICAgICAgICAgICIgICAgICAgRlJPTSBqb2JzIi4KQEAg
LTIwNiwxMiArMjA0LDIyIEBAIHN1YiBjb3B5X2pvYnMgKCQkKSB7CiAgICAgICAgICAiICAgICBT
RUxFQ1QgPywgam9iLCBuYW1lLCB2YWwsICdmJyIuCiAgICAgICAgICAiICAgICAgIEZST00gcnVu
dmFycyIuCiAgICAgICAgICAiICAgICAgV0hFUkUgZmxpZ2h0ID0gPyBBTkQgam9iID0gPyBBTkQg
Tk9UIHN5bnRoIik7Cit9CitzdWIgY29weV9qb2JzX2RvICgkJCkgeworICAgIG15ICgkcXMsICRz
cmNmbGlnaHQsICRzcmNqb2IpID0gQF87CisgICAgJF8tPmV4ZWN1dGUoJGRzdGZsaWdodCwgJHNy
Y2ZsaWdodCwgJGpvYikgZm9yZWFjaCBAJHFzOworICAgIHZlcmJvc2UgIiRkc3RmbGlnaHQuJGpv
YiBqb2IgY3JlYXRlZCBmcm9tICRzcmNmbGlnaHQuJGpvYlxuIjsKK30KKworc3ViIGNvcHlfam9i
cyAoJCQpIHsKKyAgICBteSAoJHNyY2ZsaWdodCwgJGpvYnMpID0gQF87CisgICAgcHJlcF9ybV9q
b2JzKCk7CisgICAgbXkgQGpvYl9jb3B5X3FzID0gY29weV9qb2JzX3FzOwogICAgIGZvcl9qb2Jz
KCRkc3RmbGlnaHQsICRqb2JzLCBcJmRvX3JtX2pvYiwgMSk7CiAgICAgZm9yX2pvYnMoJHNyY2Zs
aWdodCwgJGpvYnMsIFwmZG9fcm1fam9iKTsKICAgICBmb3Jfam9icygkc3JjZmxpZ2h0LCAkam9i
cywgc3ViIHsKICAgICAgICAgbXkgKCRqb2IpID0gQF87Ci0gICAgICAgICRfLT5leGVjdXRlKCRk
c3RmbGlnaHQsICRzcmNmbGlnaHQsICRqb2IpIGZvcmVhY2ggQGpvYl9jb3B5X3FzOwotCXZlcmJv
c2UgIiRkc3RmbGlnaHQuJGpvYiBqb2IgY3JlYXRlZCBmcm9tICRzcmNmbGlnaHQuJGpvYlxuIjsK
Kwljb3B5X2pvYnNfZG8oXEBqb2JfY29weV9xcywgJHNyY2ZsaWdodCwgJGpvYik7CiAgICAgfSk7
CiB9CiAKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
