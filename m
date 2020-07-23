Return-Path: <SRS0=8jzL=BC=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1737C433E1
	for <xen-devel@archiver.kernel.org>; Thu, 23 Jul 2020 15:51:10 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8CC232071A
	for <xen-devel@archiver.kernel.org>; Thu, 23 Jul 2020 15:51:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8CC232071A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jydUo-0007BN-Pb; Thu, 23 Jul 2020 15:50:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9kJt=BC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jydUn-0007BA-FD
 for xen-devel@lists.xenproject.org; Thu, 23 Jul 2020 15:50:57 +0000
X-Inumbo-ID: 4b788902-ccfc-11ea-a2c7-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4b788902-ccfc-11ea-a2c7-12813bfff9fa;
 Thu, 23 Jul 2020 15:50:56 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9A323AC83;
 Thu, 23 Jul 2020 15:51:03 +0000 (UTC)
Subject: [PATCH v3 6/8] x86: generalize padding field handling
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <adb0fe93-c251-b84a-a357-936029af0e9c@suse.com>
Message-ID: <abc2fc97-32be-8886-902e-d6d6e8bab87f@suse.com>
Date: Thu, 23 Jul 2020 17:50:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <adb0fe93-c251-b84a-a357-936029af0e9c@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

The original intention was to ignore padding fields, but the pattern
matched only ones whose names started with an underscore. Also match
fields whose names are in line with the C spec by not having a leading
underscore. (Note that the leading ^ in the sed regexps was pointless
and hence get dropped.)

This requires adjusting some vNUMA macros, to avoid triggering
"enumeration value ... not handled in switch" warnings, which - due to
-Werror - would cause the build to fail. (I have to admit that I find
these padding fields odd, when translation of the containing structure
is needed anyway.)

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
---
While for translation macros skipping padding fields pretty surely is a
reasonable thing to do, we may want to consider not ignoring them when
generating checking macros.

--- a/xen/common/compat/memory.c
+++ b/xen/common/compat/memory.c
@@ -354,10 +354,13 @@ int compat_memory_op(unsigned int cmd, X
                 return -EFAULT;
 
 #define XLAT_vnuma_topology_info_HNDL_vdistance_h(_d_, _s_)		\
+            case XLAT_vnuma_topology_info_vdistance_pad:                \
             guest_from_compat_handle((_d_)->vdistance.h, (_s_)->vdistance.h)
 #define XLAT_vnuma_topology_info_HNDL_vcpu_to_vnode_h(_d_, _s_)		\
+            case XLAT_vnuma_topology_info_vcpu_to_vnode_pad:            \
             guest_from_compat_handle((_d_)->vcpu_to_vnode.h, (_s_)->vcpu_to_vnode.h)
 #define XLAT_vnuma_topology_info_HNDL_vmemrange_h(_d_, _s_)		\
+            case XLAT_vnuma_topology_info_vmemrange_pad:                \
             guest_from_compat_handle((_d_)->vmemrange.h, (_s_)->vmemrange.h)
 
             XLAT_vnuma_topology_info(nat.vnuma, &cmp.vnuma);
--- a/xen/tools/get-fields.sh
+++ b/xen/tools/get-fields.sh
@@ -218,7 +218,7 @@ for line in sys.stdin.readlines():
 				fi
 				;;
 			[\,\;])
-				if [ $level = 2 -a -n "$(echo $id | $SED 's,^_pad[[:digit:]]*,,')" ]
+				if [ $level = 2 -a -n "$(echo $id | $SED 's,_\?pad[[:digit:]]*,,')" ]
 				then
 					if [ $kind = union ]
 					then
@@ -347,7 +347,7 @@ build_body ()
 			fi
 			;;
 		[\,\;])
-			if [ $level = 2 -a -n "$(echo $id | $SED 's,^_pad[[:digit:]]*,,')" ]
+			if [ $level = 2 -a -n "$(echo $id | $SED 's,_\?pad[[:digit:]]*,,')" ]
 			then
 				if [ -z "$array" -a -z "$array_type" ]
 				then
@@ -437,7 +437,7 @@ check_field ()
 				id=$token
 				;;
 			[\,\;])
-				if [ $level = 2 -a -n "$(echo $id | $SED 's,^_pad[[:digit:]]*,,')" ]
+				if [ $level = 2 -a -n "$(echo $id | $SED 's,_\?pad[[:digit:]]*,,')" ]
 				then
 					check_field $1 $2 $3.$id "$fields"
 					test "$token" != ";" || fields= id=
@@ -491,7 +491,7 @@ build_check ()
 			test $level != 2 -o $arrlvl != 1 || id=$token
 			;;
 		[\,\;])
-			if [ $level = 2 -a -n "$(echo $id | $SED 's,^_pad[[:digit:]]*,,')" ]
+			if [ $level = 2 -a -n "$(echo $id | $SED 's,_\?pad[[:digit:]]*,,')" ]
 			then
 				check_field $kind $1 $id "$fields"
 				test "$token" != ";" || fields= id=


