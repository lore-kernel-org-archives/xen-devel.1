Return-Path: <SRS0=qyBi=3J=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A70E1C3F68F
	for <xen-devel@archiver.kernel.org>; Mon, 20 Jan 2020 12:21:24 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8497B20678
	for <xen-devel@archiver.kernel.org>; Mon, 20 Jan 2020 12:21:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8497B20678
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1itW3C-0001Am-Ed; Mon, 20 Jan 2020 12:21:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Nhcu=3J=suse.de=tzimmermann@srs-us1.protection.inumbo.net>)
 id 1itW3A-0001Ah-Q8
 for xen-devel@lists.xenproject.org; Mon, 20 Jan 2020 12:21:00 +0000
X-Inumbo-ID: 4eff4ea8-3b7f-11ea-b95e-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4eff4ea8-3b7f-11ea-b95e-12813bfff9fa;
 Mon, 20 Jan 2020 12:20:56 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 22B7CAD5E;
 Mon, 20 Jan 2020 12:20:55 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel@ffwll.ch, kraxel@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, hdegoede@redhat.com,
 david@lechnology.com, noralf@tronnes.org, sean@poorly.run,
 oleksandr_andrushchenko@epam.com, sam@ravnborg.org,
 laurent.pinchart@ideasonboard.com, emil.velikov@collabora.com
Date: Mon, 20 Jan 2020 13:20:50 +0100
Message-Id: <20200120122051.25178-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200120122051.25178-1-tzimmermann@suse.de>
References: <20200120122051.25178-1-tzimmermann@suse.de>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 3/4] drm/ast: Don't set struct
 drm_crtc_state.no_vblank explictly
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

QXMgYXN0IGRvZXMgbm90IGluaXRpYWxpemUgdmJsYW5raW5nLCBhdG9taWMgaGVscGVycyBpbml0
aWFsaXplIHRoZQp2YWx1ZSBvZiBzdHJ1Y3QgZHJtX2NydGNfc3RhdGUubm9fdmJsYW5rIHRvIGJl
IHRydWUuIE5vIG5lZWQgdG8gc2V0Cml0IGZyb20gd2l0aGluIHRoZSBkcml2ZXIuCgpTaWduZWQt
b2ZmLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4KLS0tCiBkcml2
ZXJzL2dwdS9kcm0vYXN0L2FzdF9tb2RlLmMgfCAyIC0tCiAxIGZpbGUgY2hhbmdlZCwgMiBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9tb2RlLmMgYi9k
cml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9tb2RlLmMKaW5kZXggMzQ2MDhmMDQ5OWViLi43ODEwYTg0
ZTdlOWUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X21vZGUuYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9tb2RlLmMKQEAgLTgzMyw4ICs4MzMsNiBAQCBzdGF0aWMg
dm9pZCBhc3RfY3J0Y19oZWxwZXJfYXRvbWljX2ZsdXNoKHN0cnVjdCBkcm1fY3J0YyAqY3J0YywK
IAlzdHJ1Y3QgYXN0X3ZiaW9zX21vZGVfaW5mbyAqdmJpb3NfbW9kZV9pbmZvOwogCXN0cnVjdCBk
cm1fZGlzcGxheV9tb2RlICphZGp1c3RlZF9tb2RlOwogCi0JY3J0Yy0+c3RhdGUtPm5vX3ZibGFu
ayA9IHRydWU7Ci0KIAlhc3Rfc3RhdGUgPSB0b19hc3RfY3J0Y19zdGF0ZShjcnRjLT5zdGF0ZSk7
CiAKIAlmb3JtYXQgPSBhc3Rfc3RhdGUtPmZvcm1hdDsKLS0gCjIuMjQuMQoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
