Return-Path: <SRS0=ih+i=SM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06E0CC10F11
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 14:25:42 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D48E420850
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 14:25:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D48E420850
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEEAK-0006RA-69; Wed, 10 Apr 2019 14:25:28 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xn7x=SM=citrix.com=prvs=996f5bc6d=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hEEAI-0006Mu-Ba
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 14:25:26 +0000
X-Inumbo-ID: 7ae482af-5b9c-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 7ae482af-5b9c-11e9-92d7-bc764e045a96;
 Wed, 10 Apr 2019 14:25:24 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,332,1549929600"; d="scan'208";a="83227696"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 10 Apr 2019 15:23:33 +0100
Message-ID: <20190410142408.22848-28-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
References: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH 27/62] ts-host-install: Break out
 $persistent_net_rules
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
Message-ID: <20190410142333.Z4tikp4Ml6Hk47whg638qAYHMXw5SqbqujjGqsSroy8@z>

V2UncmUgZ29pbmcgdG8gd2FudCB0byByZXVzZSB0aGlzIHZhbHVlLgoKU2lnbmVkLW9mZi1ieTog
SWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+Ci0tLQogdHMtaG9zdC1pbnN0
YWxsIHwgNSArKysrLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlv
bigtKQoKZGlmZiAtLWdpdCBhL3RzLWhvc3QtaW5zdGFsbCBiL3RzLWhvc3QtaW5zdGFsbAppbmRl
eCA4ZWE4MWUyNC4uZjgwYTE1MWMgMTAwNzU1Ci0tLSBhL3RzLWhvc3QtaW5zdGFsbAorKysgYi90
cy1ob3N0LWluc3RhbGwKQEAgLTE5NSw2ICsxOTUsOSBAQCBzdWIgc2V0dXBfbmV0Ym9vdF9maXJz
dGJvb3QoJCkgewogCXN5c3RlbV9jaGVja2VkIEBjbWQ7CiAgICAgfQogCisgICAgbXkgJHBlcnNp
c3RlbnRfbmV0X3J1bGVzID0KKwkiJGluaXRyZF9vdmVybGF5LmQvZXRjL3VkZXYvcnVsZXMuZC83
MC1wZXJzaXN0ZW50LW5ldC5ydWxlcyI7CisKICAgICBteSAkaXBhcHBlbmQgPSAyOwogICAgIG15
ICR3YW50cGh5c2lmPSBnZXRfaG9zdF9wcm9wZXJ0eSgkaG8sJ2ludGVyZmFjZSBmb3JjZScsJ2F1
dG8nKTsKICAgICBsb2dtKCJGb3JjaW5nIGludGVyZmFjZSAkd2FudHBoeXNpZiIpOwpAQCAtMjA2
LDcgKzIwOSw3IEBAIHN1YiBzZXR1cF9uZXRib290X2ZpcnN0Ym9vdCgkKSB7CiAJIyBpcCg4KSBt
b3ZlZCB0byAvc2JpbiBpbiBKZXNzaWUKIAlteSAkaXBjbWQgPSAkaG8tPntTdWl0ZX0gPX4gbS93
aGVlenkvID8gIi9iaW4vaXAiIDogIi9zYmluL2lwIjsKICAgICAgICAgZmlsZV9zaW1wbGVfd3Jp
dGVfY29udGVudHMKLSAgICAgICAgICAgICgiJGluaXRyZF9vdmVybGF5LmQvZXRjL3VkZXYvcnVs
ZXMuZC83MC1wZXJzaXN0ZW50LW5ldC5ydWxlcyIsCisgICAgICAgICAgICAoJHBlcnNpc3RlbnRf
bmV0X3J1bGVzLAogICAgICAgICAgICAgICRoby0+e0ZsYWdzfXsnZm9yY2UtbWFjLWFkZHJlc3Mn
fSA/IDw8RU5EIDogPDxFTkQpOwogU1VCU1lTVEVNPT0ibmV0IiwgQUNUSU9OPT0iYWRkIiwgRFJJ
VkVSUz09Ij8qIiwgS0VSTkVMPT0iJHdhbnRwaHlzaWYiLCBSVU4gKz0gIiRpcGNtZCBsaW5rIHNl
dCAkd2FudHBoeXNpZiBhZGRyZXNzICRoby0+e0V0aGVyfSIKIEVORAotLSAKMi4xMS4wCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
