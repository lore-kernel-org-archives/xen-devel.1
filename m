Return-Path: <SRS0=/O7i=SW=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC7CEC282DD
	for <xen-devel@archiver.kernel.org>; Sat, 20 Apr 2019 15:25:07 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C2BAD2087B
	for <xen-devel@archiver.kernel.org>; Sat, 20 Apr 2019 15:25:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C2BAD2087B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hHrrJ-0004AS-C1; Sat, 20 Apr 2019 15:24:53 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=lFeN=SW=gmail.com=raistlin.df@srs-us1.protection.inumbo.net>)
 id 1hHrrI-0004AK-0D
 for xen-devel@lists.xenproject.org; Sat, 20 Apr 2019 15:24:52 +0000
X-Inumbo-ID: 702e8544-6380-11e9-92d7-bc764e045a96
Received: from mail-wr1-f65.google.com (unknown [209.85.221.65])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 702e8544-6380-11e9-92d7-bc764e045a96;
 Sat, 20 Apr 2019 15:24:50 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id c12so4224711wrt.8
 for <xen-devel@lists.xenproject.org>; Sat, 20 Apr 2019 08:24:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:date:message-id:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=HdwtS9Q12sY8RiIdCGepx9QrSu+Ygt1WZ4O5X6T9wI0=;
 b=AiOkrZIc77wiWqliNuGunz1NI+3IOE7vUD4lqwUQscaOQgvekn4cIz98As4yxhwwgp
 FNBn3NiE5MPzhw5vMA1R4On6DbjD8g7bo5A3FWS4wmYOvoGyXJIQzuXJoUnTVBiYxVcT
 2eT42qXglKrRJOPQMn7QU41nwAn+QJISZLU6itg47YocTBPLZ7dgIRoIla658U8mGB/T
 2Vi5uZJrkU7Tti/liy3SxNYvFyd2BTT/gFSb5jkNQs32A9BzVsdElTrSknA8VjLHc85t
 nq1+4njB7+wcOkdw7O+saFC5gV8D3cYw7N2ou4eyD5tgcZZGCxKH01JPwfhbASefwZU0
 +gmg==
X-Gm-Message-State: APjAAAV7muYkPUSsCzAN+iRplNOU2SABJRHRQ05cKpv6VrwMPoCJdnfG
 OvsBixswtHTKcQndaUvcD5M=
X-Google-Smtp-Source: APXvYqx3EkjjqVALgHPJoh2cJLbVZN00oylHQa2+zn9b2uliM3IIy7YPVpB+7a99kd2t6JCOy943Dw==
X-Received: by 2002:a5d:4742:: with SMTP id o2mr6291485wrs.298.1555773889569; 
 Sat, 20 Apr 2019 08:24:49 -0700 (PDT)
Received: from [127.0.0.1] (87.78.186.89.cust.ip.kpnqwest.it. [89.186.78.87])
 by smtp.gmail.com with ESMTPSA id
 j3sm10471589wre.51.2019.04.20.08.24.48
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 20 Apr 2019 08:24:48 -0700 (PDT)
From: Dario Faggioli <dfaggioli@suse.com>
To: xen-devel@lists.xenproject.org
Date: Sat, 20 Apr 2019 17:24:47 +0200
Message-ID: <155577388740.25746.3780283868034526234.stgit@wayrath>
In-Reply-To: <155577364571.25746.11988517450711182732.stgit@wayrath>
References: <155577364571.25746.11988517450711182732.stgit@wayrath>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 2/2] xen: sched: we never get into
 context_switch() with prev==next
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
Message-ID: <20190420152447.B3GaMoahuu6AzQ4jzbEb7pgtfRP9AoUOtx2j-uYN3QQ@z>

SW4gc2NoZWR1bGUoKSwgaWYgd2UgcGljaywgYXMgdGhlIG5leHQgdmNwdSB0byBydW4gKG5leHQp
IHRoZSBzYW1lIG9uZQp0aGF0IGlzIHJ1bm5pbmcgYWxyZWFkeSAocHJldiksIHdlIG5ldmVyIGdl
dCB0byBjYWxsIGNvbnRleHRfc3dpdGNoKCkuCgpXZSBjYW4sIHRoZXJlZm9yZSwgZ2V0IHJpZCBv
ZiBhbGwgdGhlIGBpZmAtcyB0ZXN0aW5nIHByZXYgYW5kIG5leHQgYmVpbmcKZGlmZmVyZW50LCB0
cmFkaW5nIHRoZW0gd2l0aCBhbiBBU1NFUlQoKSAob24gQVJNLCB0aGUgQVNTRVJUKCkgd2FzIGV2
ZW4KYWxyZWFkeSB0aGVyZSEpCgpTaWduZWQtb2ZmLWJ5OiBEYXJpbyBGYWdnaW9saSA8ZGZhZ2dp
b2xpQHN1c2UuY29tPgpTdWdnZXN0ZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNv
bT4KLS0tCkNjOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+CkNj
OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgpDYzogSmFuIEJldWxpY2ggPGpi
ZXVsaWNoQHN1c2UuY29tPgpDYzogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4
LmNvbT4KQ2M6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+CkNjOiAiUm9nZXIgUGF1IE1v
bm7DqSIgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgpDYzogR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1
bmxhcEBjaXRyaXguY29tPgpDYzogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgotLS0K
IHhlbi9hcmNoL2FybS9kb21haW4uYyB8ICAgIDMgKy0tCiB4ZW4vYXJjaC94ODYvZG9tYWluLmMg
fCAgIDIyICsrKysrKysrLS0tLS0tLS0tLS0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgOSBpbnNlcnRp
b25zKCspLCAxNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vZG9tYWlu
LmMgYi94ZW4vYXJjaC9hcm0vZG9tYWluLmMKaW5kZXggNmRjNjMzZWQ1MC4uOTE1YWUwYjRjNiAx
MDA2NDQKLS0tIGEveGVuL2FyY2gvYXJtL2RvbWFpbi5jCisrKyBiL3hlbi9hcmNoL2FybS9kb21h
aW4uYwpAQCAtMzQzLDggKzM0Myw3IEBAIHZvaWQgY29udGV4dF9zd2l0Y2goc3RydWN0IHZjcHUg
KnByZXYsIHN0cnVjdCB2Y3B1ICpuZXh0KQogICAgIEFTU0VSVChwcmV2ICE9IG5leHQpOwogICAg
IEFTU0VSVCghdmNwdV9jcHVfZGlydHkobmV4dCkpOwogCi0gICAgaWYgKCBwcmV2ICE9IG5leHQg
KQotICAgICAgICB1cGRhdGVfcnVuc3RhdGVfYXJlYShwcmV2KTsKKyAgICB1cGRhdGVfcnVuc3Rh
dGVfYXJlYShwcmV2KTsKIAogICAgIGxvY2FsX2lycV9kaXNhYmxlKCk7CiAKZGlmZiAtLWdpdCBh
L3hlbi9hcmNoL3g4Ni9kb21haW4uYyBiL3hlbi9hcmNoL3g4Ni9kb21haW4uYwppbmRleCA5ZWFh
OTc4Y2U1Li5kMmQ5ZjJmYzNjIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvZG9tYWluLmMKKysr
IGIveGVuL2FyY2gveDg2L2RvbWFpbi5jCkBAIC0xNzIxLDYgKzE3MjEsNyBAQCB2b2lkIGNvbnRl
eHRfc3dpdGNoKHN0cnVjdCB2Y3B1ICpwcmV2LCBzdHJ1Y3QgdmNwdSAqbmV4dCkKICAgICBjb25z
dCBzdHJ1Y3QgZG9tYWluICpwcmV2ZCA9IHByZXYtPmRvbWFpbiwgKm5leHRkID0gbmV4dC0+ZG9t
YWluOwogICAgIHVuc2lnbmVkIGludCBkaXJ0eV9jcHUgPSBuZXh0LT5kaXJ0eV9jcHU7CiAKKyAg
ICBBU1NFUlQocHJldiAhPSBuZXh0KTsKICAgICBBU1NFUlQobG9jYWxfaXJxX2lzX2VuYWJsZWQo
KSk7CiAKICAgICBnZXRfY3B1X2luZm8oKS0+dXNlX3B2X2NyMyA9IGZhbHNlOwpAQCAtMTczMiwx
MiArMTczMyw5IEBAIHZvaWQgY29udGV4dF9zd2l0Y2goc3RydWN0IHZjcHUgKnByZXYsIHN0cnVj
dCB2Y3B1ICpuZXh0KQogICAgICAgICBmbHVzaF9tYXNrKGNwdW1hc2tfb2YoZGlydHlfY3B1KSwg
RkxVU0hfVkNQVV9TVEFURSk7CiAgICAgfQogCi0gICAgaWYgKCBwcmV2ICE9IG5leHQgKQotICAg
IHsKLSAgICAgICAgX3VwZGF0ZV9ydW5zdGF0ZV9hcmVhKHByZXYpOwotICAgICAgICB2cG11X3N3
aXRjaF9mcm9tKHByZXYpOwotICAgICAgICBucDJtX3NjaGVkdWxlKE5QMk1fU0NIRURMRV9PVVQp
OwotICAgIH0KKyAgICBfdXBkYXRlX3J1bnN0YXRlX2FyZWEocHJldik7CisgICAgdnBtdV9zd2l0
Y2hfZnJvbShwcmV2KTsKKyAgICBucDJtX3NjaGVkdWxlKE5QMk1fU0NIRURMRV9PVVQpOwogCiAg
ICAgaWYgKCBpc19odm1fZG9tYWluKHByZXZkKSAmJiAhbGlzdF9lbXB0eSgmcHJldi0+YXJjaC5o
dm0udG1fbGlzdCkgKQogICAgICAgICBwdF9zYXZlX3RpbWVyKHByZXYpOwpAQCAtMTc5NCwxNCAr
MTc5MiwxMCBAQCB2b2lkIGNvbnRleHRfc3dpdGNoKHN0cnVjdCB2Y3B1ICpwcmV2LCBzdHJ1Y3Qg
dmNwdSAqbmV4dCkKIAogICAgIGNvbnRleHRfc2F2ZWQocHJldik7CiAKLSAgICBpZiAoIHByZXYg
IT0gbmV4dCApCi0gICAgewotICAgICAgICBfdXBkYXRlX3J1bnN0YXRlX2FyZWEobmV4dCk7Ci0K
LSAgICAgICAgLyogTXVzdCBiZSBkb25lIHdpdGggaW50ZXJydXB0cyBlbmFibGVkICovCi0gICAg
ICAgIHZwbXVfc3dpdGNoX3RvKG5leHQpOwotICAgICAgICBucDJtX3NjaGVkdWxlKE5QMk1fU0NI
RURMRV9JTik7Ci0gICAgfQorICAgIF91cGRhdGVfcnVuc3RhdGVfYXJlYShuZXh0KTsKKyAgICAv
KiBNdXN0IGJlIGRvbmUgd2l0aCBpbnRlcnJ1cHRzIGVuYWJsZWQgKi8KKyAgICB2cG11X3N3aXRj
aF90byhuZXh0KTsKKyAgICBucDJtX3NjaGVkdWxlKE5QMk1fU0NIRURMRV9JTik7CiAKICAgICAv
KiBFbnN1cmUgdGhhdCB0aGUgdmNwdSBoYXMgYW4gdXAtdG8tZGF0ZSB0aW1lIGJhc2UuICovCiAg
ICAgdXBkYXRlX3ZjcHVfc3lzdGVtX3RpbWUobmV4dCk7CgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
