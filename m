Return-Path: <SRS0=w6oi=S3=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4DB3C43219
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 16:45:14 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F11F206BF
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 16:45:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2F11F206BF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hJhUT-000886-Ga; Thu, 25 Apr 2019 16:44:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PBl1=S3=citrix.com=prvs=0115b8627=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hJhUS-000881-1D
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2019 16:44:52 +0000
X-Inumbo-ID: 7087484e-6779-11e9-af66-ef0685a7421a
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7087484e-6779-11e9-af66-ef0685a7421a;
 Thu, 25 Apr 2019 16:44:49 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,394,1549929600"; d="scan'208";a="84423919"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Thu, 25 Apr 2019 17:44:45 +0100
Message-ID: <1556210685-2549-1-git-send-email-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] x86/vvmx: Simplify per-CPU memory allocations
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
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>,
 Jan Beulich <JBeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190425164445.OijokPn9UU_PJ9hpRCwET3jvV6ufDVwkphYItK7veK8@z>

ICogVXNlIFhGUkVFKCkgaW5zdGVhZCBvZiBvcGVuY29kaW5nIGl0IGluIG52bXhfY3B1X2RlYWQo
KQogKiBBdm9pZCByZWR1bmRhbnQgZXZhbHVhdGlvbnMgb2YgcGVyX2NwdSgpCiAqIERvbid0IGFs
bG9jYXRlIHZ2bWNzX2J1ZiBhdCBhbGwgaWYgaXQgaXNuJ3QgZ29pbmcgdG8gYmUgdXNlZC4gIEl0
IGlzIG5ldmVyCiAgIHRvdWNoZWQgb24gaGFyZHdhcmUgbGFja2luZyB0aGUgVk1DUyBTaGFkb3dp
bmcgZmVhdHVyZS4KClNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIz
QGNpdHJpeC5jb20+Ci0tLQpDQzogSmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1c2UuY29tPgpDQzog
V2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KQ0M6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2Vy
LnBhdUBjaXRyaXguY29tPgpDQzogSnVuIE5ha2FqaW1hIDxqdW4ubmFrYWppbWFAaW50ZWwuY29t
PgpDQzogS2V2aW4gVGlhbiA8a2V2aW4udGlhbkBpbnRlbC5jb20+Ci0tLQogeGVuL2FyY2gveDg2
L2h2bS92bXgvdnZteC5jIHwgMjAgKysrKysrKysrKysrLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2Vk
LCAxMiBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNo
L3g4Ni9odm0vdm14L3Z2bXguYyBiL3hlbi9hcmNoL3g4Ni9odm0vdm14L3Z2bXguYwppbmRleCA5
OTE0NDVlLi43YmNhNTcyIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvaHZtL3ZteC92dm14LmMK
KysrIGIveGVuL2FyY2gveDg2L2h2bS92bXgvdnZteC5jCkBAIC00MCwyMSArNDAsMjUgQEAgc3Rh
dGljIGJvb2wgbnZteF92Y3B1X2luX3ZteChjb25zdCBzdHJ1Y3QgdmNwdSAqdikKIAogaW50IG52
bXhfY3B1X3VwX3ByZXBhcmUodW5zaWduZWQgaW50IGNwdSkKIHsKLSAgICBpZiAoIHBlcl9jcHUo
dnZtY3NfYnVmLCBjcHUpICE9IE5VTEwgKQotICAgICAgICByZXR1cm4gMDsKKyAgICB1aW50NjRf
dCAqKnZ2bWNzX2J1ZjsKIAotICAgIHBlcl9jcHUodnZtY3NfYnVmLCBjcHUpID0geHphbGxvY19h
cnJheSh1NjQsIFZNQ1NfQlVGX1NJWkUpOworICAgIGlmICggY3B1X2hhc192bXhfdm1jc19zaGFk
b3dpbmcgJiYKKyAgICAgICAgICh2dm1jc19idWYgPSAmcGVyX2NwdSh2dm1jc19idWYsIGNwdSkp
ID09IE5VTEwgKQorICAgIHsKKyAgICAgICAgdm9pZCAqcHRyID0geHphbGxvY19hcnJheSh1aW50
NjRfdCwgVk1DU19CVUZfU0laRSk7CiAKLSAgICBpZiAoIHBlcl9jcHUodnZtY3NfYnVmLCBjcHUp
ICE9IE5VTEwgKQotICAgICAgICByZXR1cm4gMDsKKyAgICAgICAgaWYgKCAhcHRyICkKKyAgICAg
ICAgICAgIHJldHVybiAtRU5PTUVNOwogCi0gICAgcmV0dXJuIC1FTk9NRU07CisgICAgICAgICp2
dm1jc19idWYgPSBwdHI7CisgICAgfQorCisgICAgcmV0dXJuIDA7CiB9CiAKIHZvaWQgbnZteF9j
cHVfZGVhZCh1bnNpZ25lZCBpbnQgY3B1KQogewotICAgIHhmcmVlKHBlcl9jcHUodnZtY3NfYnVm
LCBjcHUpKTsKLSAgICBwZXJfY3B1KHZ2bWNzX2J1ZiwgY3B1KSA9IE5VTEw7CisgICAgWEZSRUUo
cGVyX2NwdSh2dm1jc19idWYsIGNwdSkpOwogfQogCiBpbnQgbnZteF92Y3B1X2luaXRpYWxpc2Uo
c3RydWN0IHZjcHUgKnYpCi0tIAoyLjEuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
