Return-Path: <SRS0=0dJu=SH=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1951C4360F
	for <xen-devel@archiver.kernel.org>; Fri,  5 Apr 2019 14:26:47 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B9CD5205F4
	for <xen-devel@archiver.kernel.org>; Fri,  5 Apr 2019 14:26:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B9CD5205F4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hCPna-0007Rz-Ay; Fri, 05 Apr 2019 14:26:30 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=KiBs=SH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hCPnY-0007Ro-St
 for xen-devel@lists.xenproject.org; Fri, 05 Apr 2019 14:26:28 +0000
X-Inumbo-ID: cbda75ef-57ae-11e9-92d7-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id cbda75ef-57ae-11e9-92d7-bc764e045a96;
 Fri, 05 Apr 2019 14:26:27 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Fri, 05 Apr 2019 08:26:26 -0600
Message-Id: <5CA765920200007800224E5A@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Fri, 05 Apr 2019 08:26:26 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "xen-devel" <xen-devel@lists.xenproject.org>
References: <5CA75E460200007800224E23@prv1-mh.provo.novell.com>
In-Reply-To: <5CA75E460200007800224E23@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [Xen-devel] [PATCH v2 1/2] x86/AMD: correct certain Fam17 checks
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Brian Woods <brian.woods@amd.com>, Wei Liu <wei.liu2@citrix.com>,
 Pu Wen <puwen@hygon.cn>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190405142626.nk6q3_msUU6CT70zbRNJ-wEcZ3BrUGbKvTNE_DO5CsM@z>

Q29tbWl0IDMxNTdiYjRlMTMgKCJBZGQgTVNSIHN1cHBvcnQgZm9yIHZhcmlvdXMgZmVhdHVyZSBB
TUQgcHJvY2Vzc29yCmZhbWlsaWVzIikgY29udmVydGVkIGNlcnRhaW4gY2hlY2tzIGZvciBGYW0x
MSB0byBpbmNsdWRlIGZhbWlsaWVzIGFsbAp0aGUgd2F5IHVwIHRvIEZhbTE3LiBUaGUgY29tbWl0
IGhhdmluZyBubyBkZXNjcmlwdGlvbiwgaXQgaXMgaGFyZCB0bwp0ZWxsIHdoZXRoZXIgdGhpcyB3
YXMgYSBtZWNoYW5pY2FsIGRlYy0+aGV4IGNvbnZlcnNpb24gbWlzdGFrZSwgb3IKaW5kZWVkIGlu
dGVuZGVkLiBJbiBhbnkgZXZlbnQgdGhlIE5CX0NGRyBoYW5kbGluZyBuZWVkcyB0byBiZSByZXN0
cmljdGVkCnRvIEZhbTE2IGFuZCBiZWxvdzogRmFtMTcgZG9lc24ndCByZWFsbHkgaGF2ZSBzdWNo
IGFuIE1TUiBhbnltb3JlLiBBcwpwZXIgb2JzZXJ2YXRpb24gaXQncyByZWFkLXplcm8gLyB3cml0
ZS1kaXNjYXJkIG5vdywgc28gbWFrZSBQViB1bmlmb3JtbHkKKHdpdGggdGhlIGV4Y2VwdGlvbiBv
ZiBwaW5uZWQgRG9tMCB2Q1BVLXMpIGJlaGF2ZSBzbywganVzdCBsaWtlIEhWTQphbHJlYWR5IGRv
ZXMuCgpNaXJyb3IgdGhlIE5CX0NGRyBiZWhhdmlvciB0byBNU1JfRkFNMTBIX01NSU9fQ09ORl9C
QVNFIGFzIHdlbGwsIGV4Y2VwdAp0aGF0IGhlcmUgdGhlIHZlbmRvci9tb2RlbCBjaGVjayBpcyBr
ZXB0IGluIHBsYWNlIChmb3Igbm93IGF0IGxlYXN0KS4KCkEgbm9uLU1NQ0ZHIGV4dGVuZGVkIGNv
bmZpZyBzcGFjZSBhY2Nlc3MgbWVjaGFuaXNtIHN0aWxsIGFwcGVhcnMgdG8KZXhpc3QsIGJ1dCBj
b2RlIHRvIGRlYWwgd2l0aCBpdCB3aWxsIG5lZWQgdG8gYmUgd3JpdHRlbiBkb3duIHRoZSByb2Fk
LAp3aGVuIGl0IGNhbiBhY3R1YWxseSBiZSB0ZXN0ZWQuCgpSZXBvcnRlZC1ieTogUHUgV2VuIDxw
dXdlbkBoeWdvbi5jbj4KU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2Uu
Y29tPgotLS0KdjI6IE1ha2UgTkJfQ0ZHIHJlYWQtemVybyAvIHdyaXRlLWRpc2NhcmQgZm9yIFBW
IERvbVUsIGp1c3QgbGlrZSBIVk0gaGFzCiAgICBpdCBhbHJlYWR5LiBJJ3ZlIG5vdCBhcHBsaWVk
ICJJbiBwcmluY2lwbGUsIEFja2VkLWJ5OiBBbmRyZXcgQ29vcGVyCiAgICA8YW5kcmV3LmNvb3Bl
cjNAY2l0cml4LmNvbT4iLgoKLS0tIGEveGVuL2FyY2gveDg2L2h2bS9pb3JlcS5jCisrKyBiL3hl
bi9hcmNoL3g4Ni9odm0vaW9yZXEuYwpAQCAtMTI4OCw3ICsxMjg4LDcgQEAgc3RydWN0IGh2bV9p
b3JlcV9zZXJ2ZXIgKmh2bV9zZWxlY3RfaW9yZQogICAgICAgICAgICAgIGQtPmFyY2guY3B1aWQt
Png4Nl92ZW5kb3IgPT0gWDg2X1ZFTkRPUl9BTUQgJiYKICAgICAgICAgICAgICAoeDg2X2ZhbSA9
IGdldF9jcHVfZmFtaWx5KAogICAgICAgICAgICAgICAgICBkLT5hcmNoLmNwdWlkLT5iYXNpYy5y
YXdfZm1zLCBOVUxMLCBOVUxMKSkgPiAweDEwICYmCi0gICAgICAgICAgICAgeDg2X2ZhbSA8PSAw
eDE3ICkKKyAgICAgICAgICAgICB4ODZfZmFtIDwgMHgxNyApCiAgICAgICAgIHsKICAgICAgICAg
ICAgIHVpbnQ2NF90IG1zcl92YWw7CiAKLS0tIGEveGVuL2FyY2gveDg2L3B2L2VtdWwtcHJpdi1v
cC5jCisrKyBiL3hlbi9hcmNoL3g4Ni9wdi9lbXVsLXByaXYtb3AuYwpAQCAtMTk1LDcgKzE5NSw3
IEBAIHN0YXRpYyBib29sIHBjaV9jZmdfb2soc3RydWN0IGRvbWFpbiAqY3UKICAgICAvKiBBTUQg
ZXh0ZW5kZWQgY29uZmlndXJhdGlvbiBzcGFjZSBhY2Nlc3M/ICovCiAgICAgaWYgKCBDRjhfQURE
Ul9ISShjdXJyZC0+YXJjaC5wY2lfY2Y4KSAmJgogICAgICAgICAgYm9vdF9jcHVfZGF0YS54ODZf
dmVuZG9yID09IFg4Nl9WRU5ET1JfQU1EICYmCi0gICAgICAgICBib290X2NwdV9kYXRhLng4NiA+
PSAweDEwICYmIGJvb3RfY3B1X2RhdGEueDg2IDw9IDB4MTcgKQorICAgICAgICAgYm9vdF9jcHVf
ZGF0YS54ODYgPj0gMHgxMCAmJiBib290X2NwdV9kYXRhLng4NiA8IDB4MTcgKQogICAgIHsKICAg
ICAgICAgdWludDY0X3QgbXNyX3ZhbDsKIApAQCAtODkzLDYgKzg5MywxNyBAQCBzdGF0aWMgaW50
IHJlYWRfbXNyKHVuc2lnbmVkIGludCByZWcsIHVpCiAgICAgICAgICp2YWwgPSAwOwogICAgICAg
ICByZXR1cm4gWDg2RU1VTF9PS0FZOwogCisgICAgY2FzZSBNU1JfRkFNMTBIX01NSU9fQ09ORl9C
QVNFOgorICAgICAgICBpZiAoIGJvb3RfY3B1X2RhdGEueDg2X3ZlbmRvciAhPSBYODZfVkVORE9S
X0FNRCB8fAorICAgICAgICAgICAgIGJvb3RfY3B1X2RhdGEueDg2IDwgMHgxMCB8fCBib290X2Nw
dV9kYXRhLng4NiA+PSAweDE3ICkKKyAgICAgICAgICAgIGJyZWFrOworICAgICAgICAvKiBmYWxs
IHRocm91Z2ggKi8KKyAgICBjYXNlIE1TUl9BTUQ2NF9OQl9DRkc6CisgICAgICAgIGlmICggaXNf
aHdkb21fcGlubmVkX3ZjcHUoY3VycikgKQorICAgICAgICAgICAgZ290byBub3JtYWw7CisgICAg
ICAgICp2YWwgPSAwOworICAgICAgICByZXR1cm4gWDg2RU1VTF9PS0FZOworCiAgICAgY2FzZSBN
U1JfSUEzMl9NSVNDX0VOQUJMRToKICAgICAgICAgcmRtc3JsKHJlZywgKnZhbCk7CiAgICAgICAg
ICp2YWwgPSBndWVzdF9taXNjX2VuYWJsZSgqdmFsKTsKQEAgLTEwMDMsOSArMTAxNCw2IEBAIHN0
YXRpYyBpbnQgd3JpdGVfbXNyKHVuc2lnbmVkIGludCByZWcsIHUKICAgICAgICAgYnJlYWs7CiAK
ICAgICBjYXNlIE1TUl9BTUQ2NF9OQl9DRkc6Ci0gICAgICAgIGlmICggYm9vdF9jcHVfZGF0YS54
ODZfdmVuZG9yICE9IFg4Nl9WRU5ET1JfQU1EIHx8Ci0gICAgICAgICAgICAgYm9vdF9jcHVfZGF0
YS54ODYgPCAweDEwIHx8IGJvb3RfY3B1X2RhdGEueDg2ID4gMHgxNyApCi0gICAgICAgICAgICBi
cmVhazsKICAgICAgICAgaWYgKCAhaXNfaHdkb21fcGlubmVkX3ZjcHUoY3VycikgKQogICAgICAg
ICAgICAgcmV0dXJuIFg4NkVNVUxfT0tBWTsKICAgICAgICAgaWYgKCAocmRtc3Jfc2FmZShNU1Jf
QU1ENjRfTkJfQ0ZHLCB0ZW1wKSAhPSAwKSB8fApAQCAtMTAxNyw3ICsxMDI1LDcgQEAgc3RhdGlj
IGludCB3cml0ZV9tc3IodW5zaWduZWQgaW50IHJlZywgdQogCiAgICAgY2FzZSBNU1JfRkFNMTBI
X01NSU9fQ09ORl9CQVNFOgogICAgICAgICBpZiAoIGJvb3RfY3B1X2RhdGEueDg2X3ZlbmRvciAh
PSBYODZfVkVORE9SX0FNRCB8fAotICAgICAgICAgICAgIGJvb3RfY3B1X2RhdGEueDg2IDwgMHgx
MCB8fCBib290X2NwdV9kYXRhLng4NiA+IDB4MTcgKQorICAgICAgICAgICAgIGJvb3RfY3B1X2Rh
dGEueDg2IDwgMHgxMCB8fCBib290X2NwdV9kYXRhLng4NiA+PSAweDE3ICkKICAgICAgICAgICAg
IGJyZWFrOwogICAgICAgICBpZiAoICFpc19od2RvbV9waW5uZWRfdmNwdShjdXJyKSApCiAgICAg
ICAgICAgICByZXR1cm4gWDg2RU1VTF9PS0FZOwoKCgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
