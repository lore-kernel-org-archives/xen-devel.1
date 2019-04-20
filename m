Return-Path: <SRS0=/O7i=SW=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E63DC282DD
	for <xen-devel@archiver.kernel.org>; Sat, 20 Apr 2019 15:24:59 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D8F42087B
	for <xen-devel@archiver.kernel.org>; Sat, 20 Apr 2019 15:24:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6D8F42087B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hHrr5-00048v-Ll; Sat, 20 Apr 2019 15:24:39 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=lFeN=SW=gmail.com=raistlin.df@srs-us1.protection.inumbo.net>)
 id 1hHrr3-00048q-Qf
 for xen-devel@lists.xenproject.org; Sat, 20 Apr 2019 15:24:37 +0000
X-Inumbo-ID: 67a50a1d-6380-11e9-92d7-bc764e045a96
Received: from mail-wr1-f45.google.com (unknown [209.85.221.45])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 67a50a1d-6380-11e9-92d7-bc764e045a96;
 Sat, 20 Apr 2019 15:24:36 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id f14so9806577wrj.5
 for <xen-devel@lists.xenproject.org>; Sat, 20 Apr 2019 08:24:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:date:message-id:user-agent
 :mime-version:content-transfer-encoding;
 bh=WRbzoFPZ8izuuZKQ770RtptDI95dckCrDRHEINKf9Hk=;
 b=UrVIwxGjtLNw8sz7VKqDwfqVCD3SF9xu09rR+655dRU2KsS7hDkcM6SVcGVjEbo7R+
 ceu3zWOXlvjaT/2+eUiPOq7n1rnEdp70Wnuu7FmtjKll8BcRl4VNULzfjoJGgkk6fLc6
 Qr334TAktnGBXhQcF5OHHa3keZJrkgKLd6c9bYEqWp0PZG2Q3UyS7Y0SWvrdxbty0GFq
 gJcsM3LLgtkRSZxNa7CKssd/hu4hi3W4KVSe4m1Zny9tLgnDx1vE9L9UsNFnaAcSXYSp
 m3XFdF8RHNjtjoUYTGTsGmUd9f2uTR3pkRKZuZjsShfddzRbXOezbyU+dVltF3cry8bo
 gfXg==
X-Gm-Message-State: APjAAAXJrNOwxB3A00GecENbB2bEnsp2NlOYJeiDTdjgdZv7K31sE8Wv
 vzXDcMyMH3g/+C1PLdI4xaQ=
X-Google-Smtp-Source: APXvYqwM/DqAswnmiJaR3yc855v3DgdhZR6dniXaSsA5GRXpqt5O8i37/BfjSOq2J1iADIjga2dYMQ==
X-Received: by 2002:adf:de0f:: with SMTP id b15mr6638554wrm.308.1555773875083; 
 Sat, 20 Apr 2019 08:24:35 -0700 (PDT)
Received: from [127.0.0.1] (87.78.186.89.cust.ip.kpnqwest.it. [89.186.78.87])
 by smtp.gmail.com with ESMTPSA id
 z14sm12642946wro.81.2019.04.20.08.24.33
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 20 Apr 2019 08:24:34 -0700 (PDT)
From: Dario Faggioli <dfaggioli@suse.com>
To: xen-devel@lists.xenproject.org
Date: Sat, 20 Apr 2019 17:24:32 +0200
Message-ID: <155577364571.25746.11988517450711182732.stgit@wayrath>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 0/2] xen: sched/Credit2: small and trivial
 improvements
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>,
 Roger Pau =?utf-8?b?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190420152432.RywGdLAPTBNCngZ4HuBl6vpOe2vlMS4yytHFIc7XYQk@z>

TmFtZWx5OgoxLiBnZXQgcmlkIG9mIGNwdW1hc2tfd2VpZ2h0KCkgaW4gaG90IHBhdGhzLCBpbiBD
cmVkaXQyOwoyLiBjaGVja2luZyB3aGV0aGVyIHByZXY9PW5leHQgaW4gY29udGV4dF9zd2l0Y2go
KSBpcyBwb2ludGxlc3MuCgpSZWdhcmRzLApEYXJpbwotLS0KRGFyaW8gRmFnZ2lvbGkgKDIpOgog
ICAgICB4ZW46IGNyZWRpdDI6IGF2b2lkIHVzaW5nIGNwdW1hc2tfd2VpZ2h0KCkgaW4gaG90LXBh
dGhzCiAgICAgIHhlbjogc2NoZWQ6IHdlIG5ldmVyIGdldCBpbnRvIGNvbnRleHRfc3dpdGNoKCkg
d2l0aCBwcmV2PT1uZXh0CgogeGVuL2FyY2gvYXJtL2RvbWFpbi5jICAgICAgfCAgICAzICstLQog
eGVuL2FyY2gveDg2L2RvbWFpbi5jICAgICAgfCAgIDIyICsrKysrKysrLS0tLS0tLS0tLS0tLS0K
IHhlbi9jb21tb24vc2NoZWRfY3JlZGl0Mi5jIHwgICAyMSArKysrKysrKysrKysrKysrLS0tLS0K
IDMgZmlsZXMgY2hhbmdlZCwgMjUgaW5zZXJ0aW9ucygrKSwgMjEgZGVsZXRpb25zKC0pCgotLQpE
YXJpbyBGYWdnaW9saSwgUGguRApodHRwOi8vYWJvdXQubWUvZGFyaW8uZmFnZ2lvbGkKVmlydHVh
bGl6YXRpb24gU29mdHdhcmUgRW5naW5lZXIKU1VTRSBMYWJzLCBTVVNFIGh0dHBzOi8vd3d3LnN1
c2UuY29tLwotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tCjw8VGhpcyBoYXBwZW5zIGJlY2F1c2UgX0lfIGNob29zZSBpdCB0
byBoYXBwZW4hPj4gKFJhaXN0bGluIE1hamVyZSkKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
