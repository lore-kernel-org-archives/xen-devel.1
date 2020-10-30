Return-Path: <SRS0=Brpk=EF=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A31B8C4363A
	for <xen-devel@archiver.kernel.org>; Fri, 30 Oct 2020 12:04:27 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 073DE2076E
	for <xen-devel@archiver.kernel.org>; Fri, 30 Oct 2020 12:04:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=qubes-os.org header.i=frederic.pierret@qubes-os.org header.b="Baju2x19"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 073DE2076E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=qubes-os.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.15738.38835 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYT8b-00037t-BG; Fri, 30 Oct 2020 12:04:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 15738.38835; Fri, 30 Oct 2020 12:04:09 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYT8b-00037m-7Y; Fri, 30 Oct 2020 12:04:09 +0000
Received: by outflank-mailman (input) for mailman id 15738;
 Fri, 30 Oct 2020 12:04:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+yJr=EF=qubes-os.org=frederic.pierret@srs-us1.protection.inumbo.net>)
 id 1kYT8Z-00037h-Lh
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2020 12:04:07 +0000
Received: from sender4-of-o57.zoho.com (unknown [136.143.188.57])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 88fb0a63-9771-4a42-a02c-f4ab0f034460;
 Fri, 30 Oct 2020 12:04:06 +0000 (UTC)
Received: from localhost.localdomain (92.188.110.153 [92.188.110.153]) by
 mx.zohomail.com with SMTPS id 1604059442132732.8991634265685;
 Fri, 30 Oct 2020 05:04:02 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=+yJr=EF=qubes-os.org=frederic.pierret@srs-us1.protection.inumbo.net>)
	id 1kYT8Z-00037h-Lh
	for xen-devel@lists.xenproject.org; Fri, 30 Oct 2020 12:04:07 +0000
X-Inumbo-ID: 88fb0a63-9771-4a42-a02c-f4ab0f034460
Received: from sender4-of-o57.zoho.com (unknown [136.143.188.57])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 88fb0a63-9771-4a42-a02c-f4ab0f034460;
	Fri, 30 Oct 2020 12:04:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1604059443; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Uv5wG1prpfxm3KYu0+ROQ4jEv0f0V99LjrCOYMi4Gzuy8QdSjOrx7JWZ/cRBvldV4d+/uYlMadmdrump/vPfbqVSW46XgUp1R1skU8XNewf1JoXfnrSCxTQG7bPlIDR/9Iu1Gfy5KRkVBuTzyZMha8vmrHTlWFSS8rFcuJOuHWg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1604059443; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
	bh=tfhoj+r0ujv6sRMVEonbmGPvMviX5L0vNpMhsrP8zmE=; 
	b=GzaYGmut+Mz0IoUBEWJ0LFoZNklQ4X3sq/5Y2A5+SWODH/irtRWA3EG5uTt5e7XuAjl41tzllDAmTnmrZdcWDk5CNj/k4y0GrloI3T9f/QbedMAJ8349jCXgPhQ7h4iKmoIy8jzUo6wwkqGr1vR2L8YWYxuPF49KZghs3IBWkeY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=qubes-os.org;
	spf=pass  smtp.mailfrom=frederic.pierret@qubes-os.org;
	dmarc=pass header.from=<frederic.pierret@qubes-os.org> header.from=<frederic.pierret@qubes-os.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1604059443;
	s=s; d=qubes-os.org; i=frederic.pierret@qubes-os.org;
	h=From:To:Cc:Message-ID:Subject:Date:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=tfhoj+r0ujv6sRMVEonbmGPvMviX5L0vNpMhsrP8zmE=;
	b=Baju2x19M0lxQNVACgkDVIhleh0Tik8UgAYWpa5RIV+RJ1yitpU4GO50zufZbddo
	L/kEfreSZVjY1Yjnydt0TJq4NPdelmA527oww7LEhM2W75GKzO/CDBB28rw8d0xsrRB
	RtXwcA10sZQxcc53vRC34GAQz6mPNjBTz0FzDvBw=
Received: from localhost.localdomain (92.188.110.153 [92.188.110.153]) by mx.zohomail.com
	with SMTPS id 1604059442132732.8991634265685; Fri, 30 Oct 2020 05:04:02 -0700 (PDT)
From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Pierret=20=28fepitre=29?= <frederic.pierret@qubes-os.org>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Pierret=20=28fepitre=29?= <frederic.pierret@qubes-os.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <ian.jackson@eu.citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Message-ID: <cover.1603725003.git.frederic.pierret@qubes-os.org>
Subject: [PATCH v1 0/2] Improve reproducible builds
Date: Fri, 30 Oct 2020 13:03:49 +0100
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ZohoMailClient: External

This two fixes improve reproducibility of resulting Xen binaries

Fr=C3=A9d=C3=A9ric Pierret (fepitre) (2):
  No insert of the build timestamp into the x86 xen efi binary
  xen/common/makefile: remove gzip timestamp

 xen/arch/x86/Makefile | 1 +
 xen/common/Makefile   | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

--=20
2.26.2



