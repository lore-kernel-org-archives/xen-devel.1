Return-Path: <SRS0=dV6x=CK=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81403C433E7
	for <xen-devel@archiver.kernel.org>; Tue,  1 Sep 2020 10:27:44 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4300F20C56
	for <xen-devel@archiver.kernel.org>; Tue,  1 Sep 2020 10:27:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4300F20C56
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kD3Vd-0004B8-7f; Tue, 01 Sep 2020 10:27:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WLfn=CK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kD3Vc-0004AU-Ix
 for xen-devel@lists.xenproject.org; Tue, 01 Sep 2020 10:27:24 +0000
X-Inumbo-ID: 5877bc4d-8abb-4b7f-90b5-05237996fce4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5877bc4d-8abb-4b7f-90b5-05237996fce4;
 Tue, 01 Sep 2020 10:27:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 412F5AEB6;
 Tue,  1 Sep 2020 10:27:23 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] tools: don't use = after "define" in Rules.mk
Message-ID: <1cd1289b-f63a-a74e-a331-b93351781457@suse.com>
Date: Tue, 1 Sep 2020 12:27:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

The assignment operator is optional, and use of it breaks with make 3.81.

Fixes: ded08cdfa72b ("tools: generate most contents of library make variables")
Suggested-by: Juergen Gross <jgross@suse.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/tools/Rules.mk
+++ b/tools/Rules.mk
@@ -94,7 +94,7 @@ INSTALL_DIR_ROOT = [ $$UID -ne 0 ] || $(
 # Consumers of libfoo should not directly use $(SHDEPS_libfoo) or
 # $(SHLIB_libfoo)
 
-define LIB_defs =
+define LIB_defs
  XEN_libxen$(1) = $$(XEN_ROOT)/tools/libs/$(1)
  CFLAGS_libxen$(1) = -I$$(XEN_libxen$(1))/include $$(CFLAGS_xeninclude)
  SHDEPS_libxen$(1) = $$(foreach use,$$(USELIBS_$(1)),$$(SHLIB_libxen$$(use)))

