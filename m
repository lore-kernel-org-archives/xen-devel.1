Return-Path: <SRS0=tzN1=C7=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CED28C4727C
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2020 18:34:59 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 821042065D
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2020 18:34:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="CiiHomFN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 821042065D
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKn7d-0001oO-2E; Tue, 22 Sep 2020 18:34:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J35V=C7=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kKn7c-0001oJ-Fv
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2020 18:34:36 +0000
X-Inumbo-ID: b58b9d75-dd97-46f4-8293-94b653e6d0da
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b58b9d75-dd97-46f4-8293-94b653e6d0da;
 Tue, 22 Sep 2020 18:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1600799675;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=b+c0CfTBNQiJlQlBQvHSife6gvXLhWh6raYBfpFBV5I=;
 b=CiiHomFNVpxsCGjMKLyNXbRx16TRn5nyTKTIwkR+ZlazUCf3VC4lxOtc
 YXLgaZrXyDSpzx3gimw3wLss2x14O0PDVOulLocZtc5W4HUbZ4AxLksCo
 jr3D5PUQVFKRHDDQaKZjNiW6Sh7WAw+wnjqwlMtdJvZRLAcgfsux5xfq8 0=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: Woh/fzD8R2dGQ5igl0Bm4t3Q9PHj5i/c8IhV2mk4RvW9dpXTjtfl82STgG8kUiXF4uTEXnFJSj
 epOGRSvmbLl5bHJaLwsEjjxVjbLzD3noL/2dJXEq+3fuf8z5k6JSE1tWuvyhPnDpnr2CQMsaDS
 XT7dCYVDdqGDJAVhqf1Bko3Zh9IYnSOfQoGByagbXRn/eSAfaZVOPQy470rVOq3zqsw1FsKCU5
 fLVLoj7XDtegf57dqyPDaYhHf2ObG7AYOHQi+W01tTSSYxS3J3f4Z+GJhVqrYbEcL9N9cRcEeO
 /+U=
X-SBRS: 2.7
X-MesageID: 27269883
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,291,1596513600"; d="scan'208";a="27269883"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 11/11] TESTING XTF
Date: Tue, 22 Sep 2020 19:24:44 +0100
Message-ID: <20200922182444.12350-12-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200922182444.12350-1-andrew.cooper3@citrix.com>
References: <20200922182444.12350-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Add an arbitrary "resource type 2" which uses "frames" of a fixed format so
both Xen (for a PVH dom0) and XTF (for a PV dom0) can check the integrity of
the marshalled buffer.

Skip the hypercall preempt check to allow the compat PVH logic a chance to hit
the 1020 limit in the XLAT buffer.

Do not apply.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
 xen/common/memory.c | 39 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 38 insertions(+), 1 deletion(-)

diff --git a/xen/common/memory.c b/xen/common/memory.c
index ec276cb9b1..15a8ed253e 100644
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -1022,11 +1022,33 @@ static unsigned int resource_max_frames(struct domain *d,
     case XENMEM_resource_grant_table:
         return gnttab_resource_max_frames(d, id);
 
+    case 2:
+        return 2900;
+
     default:
         return arch_resource_max_frames(d, type, id);
     }
 }
 
+static int _acquire_2(unsigned int id, unsigned long frame,
+                      unsigned int nr_frames, xen_pfn_t mfn_list[])
+{
+    unsigned int i;
+
+    for ( i = 0; i < nr_frames; ++i )
+    {
+        mfn_list[i] = 0xdead0000 + frame + i;
+
+        /* Simulate some -ERESTARTs */
+        if ( i && ((frame + i) == 22 ||
+                   (frame + i) == 37 ||
+                   (frame + i) == 1040) )
+            break;
+    }
+
+    return i;
+}
+
 /*
  * Returns -errno on error, or positive in the range [1, nr_frames] on
  * success.  Returning less than nr_frames contitutes a request for a
@@ -1041,6 +1063,9 @@ static int _acquire_resource(
     case XENMEM_resource_grant_table:
         return gnttab_acquire_resource(d, id, frame, nr_frames, mfn_list);
 
+    case 2:
+        return _acquire_2(id, frame, nr_frames, mfn_list);
+
     default:
         return arch_acquire_resource(d, type, id, frame, nr_frames, mfn_list);
     }
@@ -1151,6 +1176,18 @@ static int acquire_resource(
 
             for ( i = 0; !rc && i < done; i++ )
             {
+                /*
+                 * For debug type 2, check that the marshalled-in frames are
+                 * correct, rather than actually inserting them into the P2M.
+                 */
+                if ( xmar.type == 2 )
+                {
+                    if ( gfn_list[i] != mfn_list[i] )
+                        panic("gfn %#lx != mfn %#lx, i %lu\n",
+                              gfn_list[i], mfn_list[i], i + xmar.frame);
+                    continue;
+                }
+
                 rc = set_foreign_p2m_entry(currd, gfn_list[i],
                                            _mfn(mfn_list[i]));
                 /* rc should be -EIO for any iteration other than the first */
@@ -1172,7 +1209,7 @@ static int acquire_resource(
          * still got work to do other work is pending.
          */
         if ( done < todo ||
-             (xmar.nr_frames && hypercall_preempt_check()) )
+             (0 && xmar.nr_frames && hypercall_preempt_check()) )
         {
             rc = hypercall_create_continuation(
                 __HYPERVISOR_memory_op, "lh",
-- 
2.11.0


