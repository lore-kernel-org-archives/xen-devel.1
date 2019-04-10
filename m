Return-Path: <SRS0=ih+i=SM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1707AC10F11
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 14:29:08 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D7A5720850
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 14:29:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D7A5720850
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEEDg-0003dC-UX; Wed, 10 Apr 2019 14:28:56 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xn7x=SM=citrix.com=prvs=996f5bc6d=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hEEDe-0003b1-S0
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 14:28:54 +0000
X-Inumbo-ID: 7bac1868-5b9c-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 7bac1868-5b9c-11e9-92d7-bc764e045a96;
 Wed, 10 Apr 2019 14:25:26 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,332,1549929600"; d="scan'208";a="83227698"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 10 Apr 2019 15:23:34 +0100
Message-ID: <20190410142408.22848-29-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
References: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH 28/62] ts-host-install: Unconditionally
 mkdir -p /etc/udev/rules.d
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
Message-ID: <20190410142334.0EkcT3K8DsDh_55bK33AIjfauZvp6TphxVicc0Dwee4@z>

V2UgYXJlIGdvaW5nIHRvIHdhbnQgdGhpcyBkaXJlY3RvcnkgdG8gZXhpc3Qgc28gdGhhdCB3ZSBj
YW4gcHV0IGEKY2FuYXJ5IGluIDcwLXBlcnNpc3RlbnQtbmV0LnJ1bGVzLgoKSW4gdGhlIGNhc2Vz
IHdoZXJlIHRoZSBiZWhhdmlvdXIgb2Ygb3NzdGVzdCBjaGFuZ2VzLCB0aGUgZW1wdHkKZGlyZWN0
b3J5IGRvZXMgbm90IHJlc3VsdCBpbiBhbnkgb3ZlcmFsbCBjaGFuZ2UuCgpTaWduZWQtb2ZmLWJ5
OiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KLS0tCiB0cy1ob3N0LWlu
c3RhbGwgfCAzICsrLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlv
bigtKQoKZGlmZiAtLWdpdCBhL3RzLWhvc3QtaW5zdGFsbCBiL3RzLWhvc3QtaW5zdGFsbAppbmRl
eCBmODBhMTUxYy4uNzQyM2ViOWIgMTAwNzU1Ci0tLSBhL3RzLWhvc3QtaW5zdGFsbAorKysgYi90
cy1ob3N0LWluc3RhbGwKQEAgLTE5OCw2ICsxOTgsOCBAQCBzdWIgc2V0dXBfbmV0Ym9vdF9maXJz
dGJvb3QoJCkgewogICAgIG15ICRwZXJzaXN0ZW50X25ldF9ydWxlcyA9CiAJIiRpbml0cmRfb3Zl
cmxheS5kL2V0Yy91ZGV2L3J1bGVzLmQvNzAtcGVyc2lzdGVudC1uZXQucnVsZXMiOwogCisgICAg
c3lzdGVtX2NoZWNrZWQocXcobWtkaXIgLXAgLS0pLCAiJGluaXRyZF9vdmVybGF5LmQvZXRjL3Vk
ZXYvcnVsZXMuZCIpOworCiAgICAgbXkgJGlwYXBwZW5kID0gMjsKICAgICBteSAkd2FudHBoeXNp
Zj0gZ2V0X2hvc3RfcHJvcGVydHkoJGhvLCdpbnRlcmZhY2UgZm9yY2UnLCdhdXRvJyk7CiAgICAg
bG9nbSgiRm9yY2luZyBpbnRlcmZhY2UgJHdhbnRwaHlzaWYiKTsKQEAgLTIwNSw3ICsyMDcsNiBA
QCBzdWIgc2V0dXBfbmV0Ym9vdF9maXJzdGJvb3QoJCkgewogCSRpcGFwcGVuZCA9IDA7CiAJZGll
ICJuZWVkIEV0aGVyIGZvciAkaG8tPntOYW1lfSAoJHdhbnRwaHlzaWYpIgogCSAgICB1bmxlc3Mg
ZGVmaW5lZCAkaG8tPntFdGhlcn07Ci0gICAgICAgIHN5c3RlbV9jaGVja2VkKHF3KG1rZGlyIC1w
IC0tKSwgIiRpbml0cmRfb3ZlcmxheS5kL2V0Yy91ZGV2L3J1bGVzLmQiKTsKIAkjIGlwKDgpIG1v
dmVkIHRvIC9zYmluIGluIEplc3NpZQogCW15ICRpcGNtZCA9ICRoby0+e1N1aXRlfSA9fiBtL3do
ZWV6eS8gPyAiL2Jpbi9pcCIgOiAiL3NiaW4vaXAiOwogICAgICAgICBmaWxlX3NpbXBsZV93cml0
ZV9jb250ZW50cwotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
