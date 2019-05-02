Return-Path: <SRS0=9xPH=TC=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BF3EC43219
	for <xen-devel@archiver.kernel.org>; Thu,  2 May 2019 12:23:05 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4671D2081C
	for <xen-devel@archiver.kernel.org>; Thu,  2 May 2019 12:23:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4671D2081C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hMAjn-0005g8-41; Thu, 02 May 2019 12:22:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=oUxd=TC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hMAjk-0005fe-WC
 for xen-devel@lists.xenproject.org; Thu, 02 May 2019 12:22:53 +0000
X-Inumbo-ID: ffba9de4-6cd4-11e9-950a-db604bc0611a
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ffba9de4-6cd4-11e9-950a-db604bc0611a;
 Thu, 02 May 2019 12:22:49 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 02 May 2019 06:22:48 -0600
Message-Id: <5CCAE116020000780022B316@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Thu, 02 May 2019 06:22:46 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "xen-devel" <xen-devel@lists.xenproject.org>
References: <5CCAD5ED020000780022B2A2@prv1-mh.provo.novell.com>
In-Reply-To: <5CCAD5ED020000780022B2A2@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [Xen-devel] [PATCH 9/9] x86: PCID is unused when !PV
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190502122246.zN1ntuupjJPZHeoZgt4CotB5jT3hS4UHVv8ipPqE9VI@z>

VGhpcyBhbGxvd3MgaW4gcGFydGljdWxhciBzb21lIHN0cmVhbWxpbmluZyBvZiB0aGUgVExCIGZs
dXNoaW5nIGNvZGUKcGF0aHMuCgpTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hA
c3VzZS5jb20+CgotLS0gYS94ZW4vYXJjaC94ODYvZmx1c2h0bGIuYworKysgYi94ZW4vYXJjaC94
ODYvZmx1c2h0bGIuYwpAQCAtMjQsNiArMjQsMTEgQEAKICNkZWZpbmUgV1JBUF9NQVNLICgweDAw
MDAwM0ZGVSkKICNlbmRpZgogCisjaWZuZGVmIENPTkZJR19QVgorIyB1bmRlZiBYODZfQ1I0X1BD
SURFCisjIGRlZmluZSBYODZfQ1I0X1BDSURFIDAKKyNlbmRpZgorCiB1MzIgdGxiZmx1c2hfY2xv
Y2sgPSAxVTsKIERFRklORV9QRVJfQ1BVKHUzMiwgdGxiZmx1c2hfdGltZSk7CiAKLS0tIGEveGVu
L2luY2x1ZGUvYXNtLXg4Ni9wcm9jZXNzb3IuaAorKysgYi94ZW4vaW5jbHVkZS9hc20teDg2L3By
b2Nlc3Nvci5oCkBAIC0yOTQsNyArMjk0LDExIEBAIHN0YXRpYyBpbmxpbmUgdW5zaWduZWQgbG9u
ZyBjcjNfcGEodW5zaWcKIAogc3RhdGljIGlubGluZSB1bnNpZ25lZCBpbnQgY3IzX3BjaWQodW5z
aWduZWQgbG9uZyBjcjMpCiB7CisjaWZkZWYgQ09ORklHX1BWCiAgICAgcmV0dXJuIGNyMyAmIFg4
Nl9DUjNfUENJRF9NQVNLOworI2Vsc2UKKyAgICByZXR1cm4gMDsKKyNlbmRpZgogfQogCiBzdGF0
aWMgaW5saW5lIHVuc2lnbmVkIGxvbmcgcmVhZF9jcjQodm9pZCkKQEAgLTMwNiw4ICszMTAsMTIg
QEAgc3RhdGljIGlubGluZSB2b2lkIHdyaXRlX2NyNCh1bnNpZ25lZCBsbwogewogICAgIHN0cnVj
dCBjcHVfaW5mbyAqaW5mbyA9IGdldF9jcHVfaW5mbygpOwogCisjaWZkZWYgQ09ORklHX1BWCiAg
ICAgLyogTm8gZ2xvYmFsIHBhZ2VzIGluIGNhc2Ugb2YgUENJRHMgZW5hYmxlZCEgKi8KICAgICBB
U1NFUlQoISh2YWwgJiBYODZfQ1I0X1BHRSkgfHwgISh2YWwgJiBYODZfQ1I0X1BDSURFKSk7Cisj
ZWxzZQorICAgIEFTU0VSVCghKHZhbCAmIFg4Nl9DUjRfUENJREUpKTsKKyNlbmRpZgogCiAgICAg
LyoKICAgICAgKiBPbiBoYXJkd2FyZSBzdXBwb3J0aW5nIEZTR1NCQVNFLCB0aGUgdmFsdWUgaW4g
JWNyNCBpcyB0aGUga2VybmVsJ3MKLS0tIGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9wdi9kb21haW4u
aAorKysgYi94ZW4vaW5jbHVkZS9hc20teDg2L3B2L2RvbWFpbi5oCkBAIC01MCw4ICs1MCwxMyBA
QAogICovCiBzdGF0aWMgaW5saW5lIHVuc2lnbmVkIGxvbmcgZ2V0X3BjaWRfYml0cyhjb25zdCBz
dHJ1Y3QgdmNwdSAqdiwgYm9vbCBpc194cHRpKQogeworI2lmZGVmIENPTkZJR19QVgogICAgIHJl
dHVybiBYODZfQ1IzX05PRkxVU0ggfCAoaXNfeHB0aSA/IFBDSURfUFZfWFBUSSA6IDApIHwKICAg
ICAgICAgICAgKCh2LT5hcmNoLmZsYWdzICYgVEZfa2VybmVsX21vZGUpID8gUENJRF9QVl9QUklW
IDogUENJRF9QVl9VU0VSKTsKKyNlbHNlCisgICAgQVNTRVJUX1VOUkVBQ0hBQkxFKCk7CisgICAg
cmV0dXJuIDA7CisjZW5kaWYKIH0KIAogI2lmZGVmIENPTkZJR19QVgoKCgoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
