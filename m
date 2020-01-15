Return-Path: <SRS0=MzdL=3E=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79373C33CB1
	for <xen-devel@archiver.kernel.org>; Wed, 15 Jan 2020 12:53:02 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5043A206D7
	for <xen-devel@archiver.kernel.org>; Wed, 15 Jan 2020 12:53:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5043A206D7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iriAE-00014n-Uo; Wed, 15 Jan 2020 12:52:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NEZB=3E=suse.de=tzimmermann@srs-us1.protection.inumbo.net>)
 id 1iriAD-00014Q-Fd
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2020 12:52:49 +0000
X-Inumbo-ID: e7167448-3795-11ea-a985-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e7167448-3795-11ea-a985-bc764e2007e4;
 Wed, 15 Jan 2020 12:52:36 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7C2B1AFE1;
 Wed, 15 Jan 2020 12:52:34 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel@ffwll.ch, kraxel@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, hdegoede@redhat.com,
 david@lechnology.com, noralf@tronnes.org, sean@poorly.run,
 oleksandr_andrushchenko@epam.com, sam@ravnborg.org,
 laurent.pinchart@ideasonboard.com, emil.velikov@collabora.com
Date: Wed, 15 Jan 2020 13:52:24 +0100
Message-Id: <20200115125226.13843-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200115125226.13843-1-tzimmermann@suse.de>
References: <20200115125226.13843-1-tzimmermann@suse.de>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 2/4] drm/ast: Set struct
 drm_crtc_state.no_vblank in atomic_check()
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
Cc: xen-devel@lists.xenproject.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Q1JUQyBzdGF0ZSBwcm9wZXJ0aWVzIHNob3VsZCBiZSBjb21wdXRlZCBpbiBhdG9taWNfY2hlY2so
KS4gRG8gc28gZm9yCnRoZSBub192YmxhbmsgZmllbGQuCgpTaWduZWQtb2ZmLWJ5OiBUaG9tYXMg
WmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYXN0
L2FzdF9tb2RlLmMgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfbW9kZS5j
IGIvZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfbW9kZS5jCmluZGV4IDM0NjA4ZjA0OTllYi4uZWY3
YTBiMDhjYzA1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9tb2RlLmMKKysr
IGIvZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfbW9kZS5jCkBAIC04MDAsNiArODAwLDggQEAgc3Rh
dGljIGludCBhc3RfY3J0Y19oZWxwZXJfYXRvbWljX2NoZWNrKHN0cnVjdCBkcm1fY3J0YyAqY3J0
YywKIAkJcmV0dXJuIC1FSU5WQUw7CiAJfQogCisJc3RhdGUtPm5vX3ZibGFuayA9IHRydWU7CisK
IAlhc3Rfc3RhdGUgPSB0b19hc3RfY3J0Y19zdGF0ZShzdGF0ZSk7CiAKIAlmb3JtYXQgPSBhc3Rf
c3RhdGUtPmZvcm1hdDsKQEAgLTgzMyw4ICs4MzUsNiBAQCBzdGF0aWMgdm9pZCBhc3RfY3J0Y19o
ZWxwZXJfYXRvbWljX2ZsdXNoKHN0cnVjdCBkcm1fY3J0YyAqY3J0YywKIAlzdHJ1Y3QgYXN0X3Zi
aW9zX21vZGVfaW5mbyAqdmJpb3NfbW9kZV9pbmZvOwogCXN0cnVjdCBkcm1fZGlzcGxheV9tb2Rl
ICphZGp1c3RlZF9tb2RlOwogCi0JY3J0Yy0+c3RhdGUtPm5vX3ZibGFuayA9IHRydWU7Ci0KIAlh
c3Rfc3RhdGUgPSB0b19hc3RfY3J0Y19zdGF0ZShjcnRjLT5zdGF0ZSk7CiAKIAlmb3JtYXQgPSBh
c3Rfc3RhdGUtPmZvcm1hdDsKLS0gCjIuMjQuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
