Return-Path: <SRS0=Ywvf=BA=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EE58C433E0
	for <xen-devel@archiver.kernel.org>; Tue, 21 Jul 2020 11:21:12 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CEA6520717
	for <xen-devel@archiver.kernel.org>; Tue, 21 Jul 2020 11:21:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="KOiMS6UH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CEA6520717
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jxqJx-0001zr-Jd; Tue, 21 Jul 2020 11:20:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gK6X=BA=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jxqJv-0001zm-RF
 for xen-devel@lists.xenproject.org; Tue, 21 Jul 2020 11:20:27 +0000
X-Inumbo-ID: 2d1153e0-cb44-11ea-a0a0-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2d1153e0-cb44-11ea-a0a0-12813bfff9fa;
 Tue, 21 Jul 2020 11:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1595330427;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=q06uvYXZcjVkQV0AJJoSUyhD9oUjaHROy1XDVILX0TQ=;
 b=KOiMS6UH6ZT8pduSqq9zHe8meH7JJp6vMlYtl9WXECtPnyy0pJWKK70I
 5XS3dA+qECj+vmOafYeMBJTE9AB536A1pprvExVMrQnv97hnwr9lJhTie
 jLpdr+HspSJ8O04K+S9Z7xyffQss5BDSUUj4Py/QmcbtDlVcNZVKpI7x6 g=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: NusP+3WfHagKGzXDD04jPhhmSSh74RMZ2QVcqVKFtJCO7zCjSRQ+w5PEodj6YXcT6nI5Y5kly6
 x8ISrYcb0RajELKA5YEYWQaqj3kuVDbBROK615lnwhVDS45JBG5827YrE/G8iIx4MEb33uQiex
 DkbZlSQ2fguVtL+R+jGBIROiXm1SKO2EeD0oi145/7UwY6qiwatHS8QrpRqpYnjEURIJ9mh3sF
 oX7+88iCOa8Eh7oHWAwP4imSfzJXMgQYjTd74H3HxcjCDoUlSm5UBApPLf9ylneoj94/+pr4yZ
 l3g=
X-SBRS: 2.7
X-MesageID: 23025163
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,378,1589256000"; d="scan'208";a="23025163"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Subject: [osstest PATCH] freebsd: remove freebsd- hostflags request from guest
 tests
Date: Tue, 21 Jul 2020 13:20:16 +0200
Message-ID: <20200721112016.30133-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: ian.jackson@eu.citrix.com, Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Guest tests shouldn't care about the capabilities or firmware of the
underlying hosts, so drop the request of specific freebsd-<version>
hostflags for FreeBSD guest tests.

While there request the presence of the hvm hostflag since the FreeBSD
guest tests are run in HVM mode.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 make-flight | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/make-flight b/make-flight
index b8942c1c..2ea9ad29 100755
--- a/make-flight
+++ b/make-flight
@@ -241,7 +241,7 @@ do_freebsd_tests () {
       job_create_test test-$xenarch$kern-$dom0arch$qemuu_suffix-freebsd10-$freebsdarch \
                       test-freebsd xl $xenarch $dom0arch freebsd_arch=$freebsdarch \
  freebsd_image=${FREEBSD_IMAGE_PREFIX-FreeBSD-10.1-CUSTOM-}$freebsdarch${FREEBSD_IMAGE_SUFFIX--20150525.raw.xz} \
-                      all_hostflags=$most_hostflags,freebsd-10
+                      all_hostflags=$most_hostflags,hvm
     done
     return
   fi
@@ -251,11 +251,11 @@ do_freebsd_tests () {
     job_create_test test-$xenarch$kern-$dom0arch$qemuu_suffix-freebsd11-$freebsdarch \
                     test-freebsd xl $xenarch $dom0arch freebsd_arch=$freebsdarch \
  freebsd_image=${FREEBSD_IMAGE_PREFIX-FreeBSD-11.3-RELEASE-}$freebsdarch${FREEBSD_IMAGE_SUFFIX-.raw.xz} \
-                    all_hostflags=$most_hostflags,freebsd-11
+                    all_hostflags=$most_hostflags,hvm
     job_create_test test-$xenarch$kern-$dom0arch$qemuu_suffix-freebsd12-$freebsdarch \
                     test-freebsd xl $xenarch $dom0arch freebsd_arch=$freebsdarch \
  freebsd_image=${FREEBSD_IMAGE_PREFIX-FreeBSD-12.1-RELEASE-}$freebsdarch${FREEBSD_IMAGE_SUFFIX-.raw.xz} \
-                    all_hostflags=$most_hostflags,freebsd-12
+                    all_hostflags=$most_hostflags,hvm
   done
 }
 
-- 
2.27.0


