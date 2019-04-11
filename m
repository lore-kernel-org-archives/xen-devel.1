Return-Path: <SRS0=7RrO=SN=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EC10C10F13
	for <xen-devel@archiver.kernel.org>; Thu, 11 Apr 2019 12:47:39 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 63DF921852
	for <xen-devel@archiver.kernel.org>; Thu, 11 Apr 2019 12:47:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 63DF921852
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEZ71-00084H-6k; Thu, 11 Apr 2019 12:47:27 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=i7IS=SN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hEZ6z-000849-Sk
 for xen-devel@lists.xenproject.org; Thu, 11 Apr 2019 12:47:25 +0000
X-Inumbo-ID: f4674e26-5c57-11e9-92d7-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id f4674e26-5c57-11e9-92d7-bc764e045a96;
 Thu, 11 Apr 2019 12:47:24 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 11 Apr 2019 06:45:23 -0600
Message-Id: <5CAF36E202000078002269BE@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Thu, 11 Apr 2019 06:45:22 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "xen-devel" <xen-devel@lists.xenproject.org>
References: <5CAF2D310200007800226974@prv1-mh.provo.novell.com>
In-Reply-To: <5CAF2D310200007800226974@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [Xen-devel] [PATCH 1/2] core-parking: interact with runtime
 SMT-disabling
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190411124522.a_JBDC_Xk7qwWG2njb5HvmHjJuX0tI_495Ab0Q2SNHk@z>

V2hlbiBkaXNhYmxpbmcgU01UIGF0IHJ1bnRpbWUsIHNlY29uZGFyeSB0aHJlYWRzIHNob3VsZCBu
byBsb25nZXIgYmUKY2FuZGlkYXRlcyBmb3IgYnJpbmdpbmcgYmFjayB1cCBpbiByZXNwb25zZSB0
byBfUFVEIEFDUEkgZXZlbnRzLiBQdXJnZQp0aGVtIGZyb20gdGhlIHRyYWNraW5nIGFycmF5LgoK
RG9pbmcgc28gaW52b2x2ZXMgYWRkaW5nIGxvY2tpbmcgdG8gZ3VhcmQgYWNjb3VudGluZyBkYXRh
IGluIHRoZSBjb3JlCnBhcmtpbmcgY29kZS4gV2hpbGUgYWRkaW5nIHRoZSBkZWNsYXJhdGlvbiBm
b3IgdGhlIGxvY2sgdGFrZSB0aGUgbGliZXJ0eQp0byBkcm9wIHR3byB1bm5lY2Vzc2FyeSBmb3J3
YXJkIGZ1bmN0aW9uIGRlY2xhcmF0aW9ucy4KClNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxq
YmV1bGljaEBzdXNlLmNvbT4KCi0tLSBhL3hlbi9hcmNoL3g4Ni9zeXNjdGwuYworKysgYi94ZW4v
YXJjaC94ODYvc3lzY3RsLmMKQEAgLTEyOCw2ICsxMjgsOSBAQCBzdGF0aWMgbG9uZyBzbXRfdXBf
ZG93bl9oZWxwZXIodm9pZCAqZGF0CiAgICAgICAgIGlmICggISh4ODZfY3B1X3RvX2FwaWNpZFtj
cHVdICYgc2libGluZ19tYXNrKSApCiAgICAgICAgICAgICBjb250aW51ZTsKIAorICAgICAgICBp
ZiAoICF1cCAmJiBjb3JlX3BhcmtpbmdfcmVtb3ZlKGNwdSkgKQorICAgICAgICAgICAgY29udGlu
dWU7CisKICAgICAgICAgcmV0ID0gdXAgPyBjcHVfdXBfaGVscGVyKF9wKGNwdSkpCiAgICAgICAg
ICAgICAgICAgIDogY3B1X2Rvd25faGVscGVyKF9wKGNwdSkpOwogCi0tLSBhL3hlbi9jb21tb24v
Y29yZV9wYXJraW5nLmMKKysrIGIveGVuL2NvbW1vbi9jb3JlX3BhcmtpbmcuYwpAQCAtMjUsOSAr
MjUsNyBAQAogI2RlZmluZSBDT1JFX1BBUktJTkdfSU5DUkVNRU5UIDEKICNkZWZpbmUgQ09SRV9Q
QVJLSU5HX0RFQ1JFTUVOVCAyCiAKLXN0YXRpYyB1bnNpZ25lZCBpbnQgY29yZV9wYXJraW5nX3Bv
d2VyKHVuc2lnbmVkIGludCBldmVudCk7Ci1zdGF0aWMgdW5zaWduZWQgaW50IGNvcmVfcGFya2lu
Z19wZXJmb3JtYW5jZSh1bnNpZ25lZCBpbnQgZXZlbnQpOwotCitzdGF0aWMgREVGSU5FX1NQSU5M
T0NLKGFjY291bnRpbmdfbG9jayk7CiBzdGF0aWMgdWludDMyX3QgY3VyX2lkbGVfbnVtczsKIHN0
YXRpYyB1bnNpZ25lZCBpbnQgY29yZV9wYXJraW5nX2NwdW51bVtOUl9DUFVTXSA9IHtbMCAuLi4g
TlJfQ1BVUy0xXSA9IC0xfTsKIApAQCAtMTAwLDEwICs5OCwxMCBAQCBzdGF0aWMgdW5zaWduZWQg
aW50IGNvcmVfcGFya2luZ19wZXJmb3JtCiAgICAgYnJlYWs7CiAKICAgICBjYXNlIENPUkVfUEFS
S0lOR19ERUNSRU1FTlQ6Ci0gICAgewotICAgICAgICBjcHUgPSBjb3JlX3BhcmtpbmdfY3B1bnVt
W2N1cl9pZGxlX251bXMgLTFdOwotICAgIH0KLSAgICBicmVhazsKKyAgICAgICAgc3Bpbl9sb2Nr
KCZhY2NvdW50aW5nX2xvY2spOworICAgICAgICBjcHUgPSBjb3JlX3BhcmtpbmdfY3B1bnVtW2N1
cl9pZGxlX251bXMgLSAxXTsKKyAgICAgICAgc3Bpbl91bmxvY2soJmFjY291bnRpbmdfbG9jayk7
CisgICAgICAgIGJyZWFrOwogCiAgICAgZGVmYXVsdDoKICAgICAgICAgYnJlYWs7CkBAIC0xNTgs
MTAgKzE1NiwxMCBAQCBzdGF0aWMgdW5zaWduZWQgaW50IGNvcmVfcGFya2luZ19wb3dlcih1CiAg
ICAgYnJlYWs7CiAKICAgICBjYXNlIENPUkVfUEFSS0lOR19ERUNSRU1FTlQ6Ci0gICAgewotICAg
ICAgICBjcHUgPSBjb3JlX3BhcmtpbmdfY3B1bnVtW2N1cl9pZGxlX251bXMgLTFdOwotICAgIH0K
LSAgICBicmVhazsKKyAgICAgICAgc3Bpbl9sb2NrKCZhY2NvdW50aW5nX2xvY2spOworICAgICAg
ICBjcHUgPSBjb3JlX3BhcmtpbmdfY3B1bnVtW2N1cl9pZGxlX251bXMgLSAxXTsKKyAgICAgICAg
c3Bpbl91bmxvY2soJmFjY291bnRpbmdfbG9jayk7CisgICAgICAgIGJyZWFrOwogCiAgICAgZGVm
YXVsdDoKICAgICAgICAgYnJlYWs7CkBAIC0xODUsNyArMTgzLDExIEBAIGxvbmcgY29yZV9wYXJr
aW5nX2hlbHBlcih2b2lkICpkYXRhKQogICAgICAgICByZXQgPSBjcHVfZG93bihjcHUpOwogICAg
ICAgICBpZiAoIHJldCApCiAgICAgICAgICAgICByZXR1cm4gcmV0OworCisgICAgICAgIHNwaW5f
bG9jaygmYWNjb3VudGluZ19sb2NrKTsKKyAgICAgICAgQlVHX09OKGN1cl9pZGxlX251bXMgPj0g
QVJSQVlfU0laRShjb3JlX3BhcmtpbmdfY3B1bnVtKSk7CiAgICAgICAgIGNvcmVfcGFya2luZ19j
cHVudW1bY3VyX2lkbGVfbnVtcysrXSA9IGNwdTsKKyAgICAgICAgc3Bpbl91bmxvY2soJmFjY291
bnRpbmdfbG9jayk7CiAgICAgfQogCiAgICAgd2hpbGUgKCBjdXJfaWRsZV9udW1zID4gaWRsZV9u
dW1zICkKQEAgLTE5NCwxMiArMTk2LDQzIEBAIGxvbmcgY29yZV9wYXJraW5nX2hlbHBlcih2b2lk
ICpkYXRhKQogICAgICAgICByZXQgPSBjcHVfdXAoY3B1KTsKICAgICAgICAgaWYgKCByZXQgKQog
ICAgICAgICAgICAgcmV0dXJuIHJldDsKLSAgICAgICAgY29yZV9wYXJraW5nX2NwdW51bVstLWN1
cl9pZGxlX251bXNdID0gLTE7CisKKyAgICAgICAgaWYgKCAhY29yZV9wYXJraW5nX3JlbW92ZShj
cHUpICkKKyAgICAgICAgeworICAgICAgICAgICAgcmV0ID0gY3B1X2Rvd24oY3B1KTsKKyAgICAg
ICAgICAgIGlmICggcmV0ID09IC1FRVhJU1QgKQorICAgICAgICAgICAgICAgIHJldCA9IDA7Cisg
ICAgICAgICAgICBpZiAoIHJldCApCisgICAgICAgICAgICAgICAgYnJlYWs7CisgICAgICAgIH0K
ICAgICB9CiAKICAgICByZXR1cm4gcmV0OwogfQogCitib29sIGNvcmVfcGFya2luZ19yZW1vdmUo
dW5zaWduZWQgaW50IGNwdSkKK3sKKyAgICB1bnNpZ25lZCBpbnQgaTsKKyAgICBib29sIGZvdW5k
ID0gZmFsc2U7CisKKyAgICBzcGluX2xvY2soJmFjY291bnRpbmdfbG9jayk7CisKKyAgICBmb3Ig
KCBpID0gMDsgaSA8IGN1cl9pZGxlX251bXM7ICsraSApCisgICAgICAgIGlmICggY29yZV9wYXJr
aW5nX2NwdW51bVtpXSA9PSBjcHUgKQorICAgICAgICB7CisgICAgICAgICAgICBmb3VuZCA9IHRy
dWU7CisgICAgICAgICAgICAtLWN1cl9pZGxlX251bXM7CisgICAgICAgICAgICBicmVhazsKKyAg
ICAgICAgfQorCisgICAgZm9yICggOyBpIDwgY3VyX2lkbGVfbnVtczsgKytpICkKKyAgICAgICAg
Y29yZV9wYXJraW5nX2NwdW51bVtpXSA9IGNvcmVfcGFya2luZ19jcHVudW1baSArIDFdOworCisg
ICAgc3Bpbl91bmxvY2soJmFjY291bnRpbmdfbG9jayk7CisKKyAgICByZXR1cm4gZm91bmQ7Cit9
CisKIHVpbnQzMl90IGdldF9jdXJfaWRsZV9udW1zKHZvaWQpCiB7CiAgICAgcmV0dXJuIGN1cl9p
ZGxlX251bXM7Ci0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvc21wLmgKKysrIGIveGVuL2luY2x1
ZGUvYXNtLXg4Ni9zbXAuaApAQCAtNjMsNiArNjMsNyBAQCBsb25nIGNwdV91cF9oZWxwZXIodm9p
ZCAqZGF0YSk7CiBsb25nIGNwdV9kb3duX2hlbHBlcih2b2lkICpkYXRhKTsKIAogbG9uZyBjb3Jl
X3BhcmtpbmdfaGVscGVyKHZvaWQgKmRhdGEpOworYm9vbCBjb3JlX3BhcmtpbmdfcmVtb3ZlKHVu
c2lnbmVkIGludCBjcHUpOwogdWludDMyX3QgZ2V0X2N1cl9pZGxlX251bXModm9pZCk7CiAKIC8q
CgoKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
