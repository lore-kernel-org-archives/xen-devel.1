Return-Path: <SRS0=w6oi=S3=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9F41C43218
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 20:24:46 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B7AF120878
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 20:24:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B7AF120878
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hJkuz-0001Iq-0X; Thu, 25 Apr 2019 20:24:29 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tBju=S3=citrix.com=prvs=011b478a6=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1hJkux-0001IV-LS
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2019 20:24:27 +0000
X-Inumbo-ID: 1f20c595-6798-11e9-843c-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 1f20c595-6798-11e9-843c-bc764e045a96;
 Thu, 25 Apr 2019 20:24:26 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,394,1549929600"; d="scan'208";a="84450969"
From: Igor Druzhinin <igor.druzhinin@citrix.com>
To: <devel@edk2.groups.io>
Date: Thu, 25 Apr 2019 21:23:58 +0100
Message-ID: <1556223838-5176-4-git-send-email-igor.druzhinin@citrix.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1556223838-5176-1-git-send-email-igor.druzhinin@citrix.com>
References: <1556223838-5176-1-git-send-email-igor.druzhinin@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 3/3] OvmfPkg/XenSupport: turn off address
 decoding before BAR sizing
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
Cc: Igor Druzhinin <igor.druzhinin@citrix.com>, ard.biesheuvel@linaro.org,
 jordan.l.justen@intel.com, julien.grall@arm.com, anthony.perard@citrix.com,
 xen-devel@lists.xenproject.org, lersek@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190425202358.zOPcJQ2Ty9uuPTxvYJU9FmJSO_vq0PlesddW4j38C7k@z>

T24gWGVuLCBodm1sb2FkZXIgZmlybXdhcmUgbGVhdmVzIGFkZHJlc3MgZGVjb2RpbmcgZW5hYmxl
ZCBmb3IKZW51bWVyYXRlZCBQQ0kgZGV2aWNlIGJlZm9yZSBqdW1waW5nIGludG8gT1ZNRi4gT1ZN
RiBzZWVtcyB0bwpleHBlY3QgaXQgdG8gYmUgZGlzYWJsZWQgYW5kIHRyaWVzIHRvIHNpemUgUENJ
IEJBUnMgaW4gc2V2ZXJhbCBwbGFjZXMKd2l0aG91dCBkaXNhYmxpbmcgaXQgd2hpY2ggY2F1c2Vz
IEJBUjY0LCBmb3IgZXhhbXBsZSwgYmVpbmcKaW5jb3JyZWN0bHkgcGxhY2VkIGJ5IFFFTVUuCgpG
aXggaXQgYnkgZGlzYWJsaW5nIFBDSSBhZGRyZXNzIGRlY29kaW5nIGV4cGxpY2l0bHkgYmVmb3Jl
IHRoZQpmaXJzdCBhdHRlbXB0IHRvIHNpemUgQkFScyBvbiBYZW4uCgpTaWduZWQtb2ZmLWJ5OiBJ
Z29yIERydXpoaW5pbiA8aWdvci5kcnV6aGluaW5AY2l0cml4LmNvbT4KLS0tCkNoYW5nZXMgaW4g
djM6Ci0gZHJvcHBlZCB1bnVzZWQgYXJndW1lbnRzIGFuZCByZW5hbWUgUGNhdFBjaVJvb3RCcmlk
Z2VEZWNvZGluZyBmdW5jdGlvbgotIG1ha2UgbWFzayBhcHBsaWNhdGlvbiBtb3JlIGNsZWFyIGFz
IHN1Z2dlc3RlZAotLS0KIE92bWZQa2cvTGlicmFyeS9QY2lIb3N0QnJpZGdlTGliL1hlblN1cHBv
cnQuYyB8IDIxICsrKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDIxIGluc2Vy
dGlvbnMoKykKCmRpZmYgLS1naXQgYS9Pdm1mUGtnL0xpYnJhcnkvUGNpSG9zdEJyaWRnZUxpYi9Y
ZW5TdXBwb3J0LmMgYi9Pdm1mUGtnL0xpYnJhcnkvUGNpSG9zdEJyaWRnZUxpYi9YZW5TdXBwb3J0
LmMKaW5kZXggNzZmY2E1My4uYjQxYmQ2YiAxMDA2NDQKLS0tIGEvT3ZtZlBrZy9MaWJyYXJ5L1Bj
aUhvc3RCcmlkZ2VMaWIvWGVuU3VwcG9ydC5jCisrKyBiL092bWZQa2cvTGlicmFyeS9QY2lIb3N0
QnJpZGdlTGliL1hlblN1cHBvcnQuYwpAQCAtNDksNiArNDksMjIgQEAgUGNhdFBjaVJvb3RCcmlk
Z2VCYXJFeGlzdGVkICgKICAgRW5hYmxlSW50ZXJydXB0cyAoKTsKIH0KIAorI2RlZmluZSBQQ0lf
Q09NTUFORF9ERUNPREUgKChVSU5UMTYpKEVGSV9QQ0lfQ09NTUFORF9JT19TUEFDRSB8IFwKKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBFRklfUENJX0NPTU1BTkRfTUVNT1JZ
X1NQQUNFKSkKK1NUQVRJQworVk9JRAorUGNhdFBjaVJvb3RCcmlkZ2VEZWNvZGluZ0Rpc2FibGUg
KAorICBJTiAgVUlOVE4gICAgICAgICAgICAgICAgICAgICAgICAgIEFkZHJlc3MKKyAgKQorewor
ICBVSU5UMTYgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFZhbHVlOworCisgIFZhbHVlID0g
UGNpUmVhZDE2IChBZGRyZXNzKTsKKyAgaWYgKFZhbHVlICYgUENJX0NPTU1BTkRfREVDT0RFKSB7
CisgICAgUGNpV3JpdGUxNiAoQWRkcmVzcywgVmFsdWUgJiB+KFVJTlQzMilQQ0lfQ09NTUFORF9E
RUNPREUpOworICB9Cit9CisKIFNUQVRJQwogVk9JRAogUGNhdFBjaVJvb3RCcmlkZ2VQYXJzZUJh
cnMgKApAQCAtNzUsNiArOTEsMTEgQEAgUGNhdFBjaVJvb3RCcmlkZ2VQYXJzZUJhcnMgKAogICBV
SU5UNjQgICAgICAgICAgICAgICAgICAgICAgICAgICAgTGltaXQ7CiAgIFBDSV9ST09UX0JSSURH
RV9BUEVSVFVSRSAgICAgICAgICAqTWVtQXBlcnR1cmU7CiAKKyAgLy8gRGlzYWJsZSBhZGRyZXNz
IGRlY29kaW5nIGZvciBldmVyeSBkZXZpY2UgYmVmb3JlIE9WTUYgc3RhcnRzIHNpemluZyBpdAor
ICBQY2F0UGNpUm9vdEJyaWRnZURlY29kaW5nRGlzYWJsZSAoCisgICAgUENJX0xJQl9BRERSRVNT
IChCdXMsIERldmljZSwgRnVuY3Rpb24sIFBDSV9DT01NQU5EX09GRlNFVCkKKyAgKTsKKwogICBm
b3IgKE9mZnNldCA9IEJhck9mZnNldEJhc2U7IE9mZnNldCA8IEJhck9mZnNldEVuZDsgT2Zmc2V0
ICs9IHNpemVvZiAoVUlOVDMyKSkgewogICAgIFBjYXRQY2lSb290QnJpZGdlQmFyRXhpc3RlZCAo
CiAgICAgICBQQ0lfTElCX0FERFJFU1MgKEJ1cywgRGV2aWNlLCBGdW5jdGlvbiwgT2Zmc2V0KSwK
LS0gCjIuNy40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
