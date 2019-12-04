Return-Path: <SRS0=ZD/N=Z2=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6C71C43603
	for <xen-devel@archiver.kernel.org>; Wed,  4 Dec 2019 13:27:33 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A97682077B
	for <xen-devel@archiver.kernel.org>; Wed,  4 Dec 2019 13:27:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A97682077B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icUgX-0007P4-2S; Wed, 04 Dec 2019 13:27:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=+qu5=Z2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1icUgV-0007Oz-RN
 for xen-devel@lists.xenproject.org; Wed, 04 Dec 2019 13:27:15 +0000
X-Inumbo-ID: c821dd60-1699-11ea-a0d2-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c821dd60-1699-11ea-a0d2-bc764e2007e4;
 Wed, 04 Dec 2019 13:27:13 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A99E0B158;
 Wed,  4 Dec 2019 13:27:12 +0000 (UTC)
To: Jeremi Piotrowski <jeremi.piotrowski@gmail.com>
References: <CAHnBbQ8Xt=f_P+sntM27m7+NXft-U=DYXFdTV9hOqJBTU+CXNw@mail.gmail.com>
 <cae8cbfb-270a-6e1f-366c-b0aec3deb06b@suse.com>
 <20191201174714.GA13968@gentoo-tp.home>
 <68a03bc4-2f75-4327-8089-f6724c1d867c@suse.com>
 <20191204071433.GA5806@gentoo-tp.home>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <65509778-2d73-6ed4-1537-95c5ae54e36e@suse.com>
Date: Wed, 4 Dec 2019 14:27:26 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191204071433.GA5806@gentoo-tp.home>
Content-Language: en-US
Subject: Re: [Xen-devel] bug: unable to LZ4 decompress ub1910 installer
 kernel when launching domU
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, Pry Mar <pryorm09@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQuMTIuMjAxOSAwODoxNCwgSmVyZW1pIFBpb3Ryb3dza2kgd3JvdGU6Cj4gQW55IHN1Z2dl
c3Rpb25zIGhvdyB0byBwcm9jZWVkPwoKQWN0dWFsbHkgaGVyZSdzIGEgYmV0dGVyIHZlcnNpb24g
KEkgdGhpbmspLgoKSmFuCgpsejQ6IHJlZmluZSBjb21taXQgOTE0M2E2YzU1ZWY3IGZvciB0aGUg
NjQtYml0IGNhc2UKCkkgY2xlYXJseSB3ZW50IHRvbyBmYXIgdGhlcmU6IFdoaWxlIHRoZSBMWjRf
V0lMRENPUFkoKSBpbnN0YW5jZXMgaW5kZWVkCm5lZWQgcHJpb3IgZ3VhcmRpbmcsIExaNF9TRUNV
UkVDT1BZKCkgbmVlZHMgdGhpcyBvbmx5IGluIHRoZSAzMi1iaXQgY2FzZQood2hlcmUgaXQgc2lt
cGx5IGFsaWFzZXMgTFo0X1dJTERDT1BZKCkpLiAiY3B5IiBjYW4gdmFsaWRseSBwb2ludAooc2xp
Z2h0bHkpIGJlbG93ICJvcCIgaW4gdGhlc2UgY2FzZXMsIGR1ZSB0bwoKCQljcHkgPSBvcCArIGxl
bmd0aCAtIChTVEVQU0laRSAtIDQpOwoKd2hlcmUgbGVuZ3RoIGNhbiBiZSBhcyBsb3cgYXMgMCBh
bmQgU1RFUFNJWkUgaXMgOC4gSG93ZXZlciwgaW5zdGVhZCBvZgpyZW1vdmluZyB0aGUgY2hlY2sg
dmlhICIjaWYgIUxaNF9BUkNINjQiLCByZWZpbmUgaXQgc3VjaCB0aGF0IGl0IHdvdWxkCmFsc28g
cHJvcGVybHkgd29yayBpbiB0aGUgNjQtYml0IGNhc2UsIGFib3J0aW5nIGRlY29tcHJlc3Npb24g
aW5zdGVhZApvZiBjb250aW51aW5nIG9uIGJvZ3VzIGlucHV0LgoKUmVwb3J0ZWQtYnk6IE1hcmsg
UHJ5b3IgPHByeW9ybTA5QGdtYWlsLmNvbT4KUmVwb3J0ZWQtYnk6IEplcmVtaSBQaW90cm93c2tp
IDxqZXJlbWkucGlvdHJvd3NraUBnbWFpbC5jb20+ClNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNo
IDxqYmV1bGljaEBzdXNlLmNvbT4KCi0tLSB1bnN0YWJsZS5vcmlnL3hlbi9jb21tb24vbHo0L2Rl
Y29tcHJlc3MuYworKysgdW5zdGFibGUveGVuL2NvbW1vbi9sejQvZGVjb21wcmVzcy5jCkBAIC0x
NDcsNyArMTQ3LDcgQEAgc3RhdGljIGludCBJTklUIGx6NF91bmNvbXByZXNzKGNvbnN0IHVucwog
CQkJCWdvdG8gX291dHB1dF9lcnJvcjsKIAkJCWNvbnRpbnVlOwogCQl9Ci0JCWlmICh1bmxpa2Vs
eSgodW5zaWduZWQgbG9uZyljcHkgPCAodW5zaWduZWQgbG9uZylvcCkpCisJCWlmICh1bmxpa2Vs
eSgodW5zaWduZWQgbG9uZyljcHkgPCAodW5zaWduZWQgbG9uZylvcCAtIChTVEVQU0laRSAtIDQp
KSkKIAkJCWdvdG8gX291dHB1dF9lcnJvcjsKIAkJTFo0X1NFQ1VSRUNPUFkocmVmLCBvcCwgY3B5
KTsKIAkJb3AgPSBjcHk7IC8qIGNvcnJlY3Rpb24gKi8KQEAgLTI3OSw3ICsyNzksNyBAQCBzdGF0
aWMgaW50IGx6NF91bmNvbXByZXNzX3Vua25vd25vdXRwdXRzCiAJCQkJZ290byBfb3V0cHV0X2Vy
cm9yOwogCQkJY29udGludWU7CiAJCX0KLQkJaWYgKHVubGlrZWx5KCh1bnNpZ25lZCBsb25nKWNw
eSA8ICh1bnNpZ25lZCBsb25nKW9wKSkKKwkJaWYgKHVubGlrZWx5KCh1bnNpZ25lZCBsb25nKWNw
eSA8ICh1bnNpZ25lZCBsb25nKW9wIC0gKFNURVBTSVpFIC0gNCkpKQogCQkJZ290byBfb3V0cHV0
X2Vycm9yOwogCQlMWjRfU0VDVVJFQ09QWShyZWYsIG9wLCBjcHkpOwogCQlvcCA9IGNweTsgLyog
Y29ycmVjdGlvbiAqLwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
