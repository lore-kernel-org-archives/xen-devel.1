Return-Path: <SRS0=kLId=UC=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7F96C04AB5
	for <xen-devel@archiver.kernel.org>; Mon,  3 Jun 2019 18:23:05 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 73DBB24B05
	for <xen-devel@archiver.kernel.org>; Mon,  3 Jun 2019 18:23:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZfB+cVMh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 73DBB24B05
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hXrbG-00081v-1I; Mon, 03 Jun 2019 18:22:26 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=yeU6=UC=linuxfoundation.org=gregkh@srs-us1.protection.inumbo.net>)
 id 1hXrbE-00081q-TR
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2019 18:22:24 +0000
X-Inumbo-ID: 883ec874-862c-11e9-8980-bc764e045a96
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 883ec874-862c-11e9-8980-bc764e045a96;
 Mon, 03 Jun 2019 18:22:23 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 49D3F26B4B;
 Mon,  3 Jun 2019 18:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1559585176;
 bh=FYXdJLHo3hHt8L1/DCA879d6zeN9nhzBznMqKmudxhQ=;
 h=Subject:To:From:Date:From;
 b=ZfB+cVMh3EOaO+77faIMq9DP0u17oZ02dkSb8tiu6C2s51PeCW6FDh+wBjH83jGs8
 fkP7y6FrgPOBLGbhBXCM/gsM3bSqYFtgaZMkvusgX56NcgfpKPvg+qwHAAn+vZudAy
 Mvkv3/FB/YikRewBjp5eYY0/HVibXiVaByR1LSZY=
To: gregkh@linuxfoundation.org, boris.ostrovsky@oracle.com, bp@alien8.de,
 hpa@zytor.com, jgross@suse.com, mingo@redhat.com, sstabellini@kernel.org,
 tglx@linutronix.de, x86@kernel.org, xen-devel@lists.xenproject.org
From: <gregkh@linuxfoundation.org>
Date: Mon, 03 Jun 2019 20:05:52 +0200
Message-ID: <1559585152155235@kroah.com>
MIME-Version: 1.0
Subject: [Xen-devel] patch "x86: xen: no need to check return value of
 debugfs_create functions" added to driver-core-next
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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190603180552.QMMhocDRqsJrqziaGxmERt48JT_ptTR8v3YwOX-hZYE@z>

ClRoaXMgaXMgYSBub3RlIHRvIGxldCB5b3Uga25vdyB0aGF0IEkndmUganVzdCBhZGRlZCB0aGUg
cGF0Y2ggdGl0bGVkCgogICAgeDg2OiB4ZW46IG5vIG5lZWQgdG8gY2hlY2sgcmV0dXJuIHZhbHVl
IG9mIGRlYnVnZnNfY3JlYXRlIGZ1bmN0aW9ucwoKdG8gbXkgZHJpdmVyLWNvcmUgZ2l0IHRyZWUg
d2hpY2ggY2FuIGJlIGZvdW5kIGF0CiAgICBnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xp
bnV4L2tlcm5lbC9naXQvZ3JlZ2toL2RyaXZlci1jb3JlLmdpdAppbiB0aGUgZHJpdmVyLWNvcmUt
bmV4dCBicmFuY2guCgpUaGUgcGF0Y2ggd2lsbCBzaG93IHVwIGluIHRoZSBuZXh0IHJlbGVhc2Ug
b2YgdGhlIGxpbnV4LW5leHQgdHJlZQoodXN1YWxseSBzb21ldGltZSB3aXRoaW4gdGhlIG5leHQg
MjQgaG91cnMgZHVyaW5nIHRoZSB3ZWVrLikKClRoZSBwYXRjaCB3aWxsIGFsc28gYmUgbWVyZ2Vk
IGluIHRoZSBuZXh0IG1ham9yIGtlcm5lbCByZWxlYXNlCmR1cmluZyB0aGUgbWVyZ2Ugd2luZG93
LgoKSWYgeW91IGhhdmUgYW55IHF1ZXN0aW9ucyBhYm91dCB0aGlzIHByb2Nlc3MsIHBsZWFzZSBs
ZXQgbWUga25vdy4KCgpGcm9tIGFkMDkxMzc2MzFlNmU1YWNmYWYyODhmM2JhM2Y0YjNhOWY4NTVk
MTYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCkZyb206IEdyZWcgS3JvYWgtSGFydG1hbiA8Z3Jl
Z2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+CkRhdGU6IFR1ZSwgMjIgSmFuIDIwMTkgMTU6MzU6NDIg
KzAxMDAKU3ViamVjdDogeDg2OiB4ZW46IG5vIG5lZWQgdG8gY2hlY2sgcmV0dXJuIHZhbHVlIG9m
IGRlYnVnZnNfY3JlYXRlIGZ1bmN0aW9ucwoKV2hlbiBjYWxsaW5nIGRlYnVnZnMgZnVuY3Rpb25z
LCB0aGVyZSBpcyBubyBuZWVkIHRvIGV2ZXIgY2hlY2sgdGhlCnJldHVybiB2YWx1ZS4gIFRoZSBm
dW5jdGlvbiBjYW4gd29yayBvciBub3QsIGJ1dCB0aGUgY29kZSBsb2dpYyBzaG91bGQKbmV2ZXIg
ZG8gc29tZXRoaW5nIGRpZmZlcmVudCBiYXNlZCBvbiB0aGlzLgoKQ2M6IEJvcmlzIE9zdHJvdnNr
eSA8Ym9yaXMub3N0cm92c2t5QG9yYWNsZS5jb20+CkNjOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNz
dGFiZWxsaW5pQGtlcm5lbC5vcmc+CkNjOiBUaG9tYXMgR2xlaXhuZXIgPHRnbHhAbGludXRyb25p
eC5kZT4KQ2M6IEluZ28gTW9sbmFyIDxtaW5nb0ByZWRoYXQuY29tPgpDYzogQm9yaXNsYXYgUGV0
a292IDxicEBhbGllbjguZGU+CkNjOiAiSC4gUGV0ZXIgQW52aW4iIDxocGFAenl0b3IuY29tPgpD
YzogPHg4NkBrZXJuZWwub3JnPgpDYzogPHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZz4K
UmV2aWV3ZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KU2lnbmVkLW9mZi1i
eTogR3JlZyBLcm9haC1IYXJ0bWFuIDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz4KLS0tCiBh
cmNoL3g4Ni94ZW4vZGVidWdmcy5jIHwgNyArLS0tLS0tCiBhcmNoL3g4Ni94ZW4vcDJtLmMgICAg
IHwgMyAtLS0KIDIgZmlsZXMgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDkgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvYXJjaC94ODYveGVuL2RlYnVnZnMuYyBiL2FyY2gveDg2L3hlbi9kZWJ1
Z2ZzLmMKaW5kZXggMTNkYTg3OTE4YjRmLi41MzI0MTA5OTg2ODQgMTAwNjQ0Ci0tLSBhL2FyY2gv
eDg2L3hlbi9kZWJ1Z2ZzLmMKKysrIGIvYXJjaC94ODYveGVuL2RlYnVnZnMuYwpAQCAtOSwxMyAr
OSw4IEBAIHN0YXRpYyBzdHJ1Y3QgZGVudHJ5ICpkX3hlbl9kZWJ1ZzsKIAogc3RydWN0IGRlbnRy
eSAqIF9faW5pdCB4ZW5faW5pdF9kZWJ1Z2ZzKHZvaWQpCiB7Ci0JaWYgKCFkX3hlbl9kZWJ1Zykg
eworCWlmICghZF94ZW5fZGVidWcpCiAJCWRfeGVuX2RlYnVnID0gZGVidWdmc19jcmVhdGVfZGly
KCJ4ZW4iLCBOVUxMKTsKLQotCQlpZiAoIWRfeGVuX2RlYnVnKQotCQkJcHJfd2FybmluZygiQ291
bGQgbm90IGNyZWF0ZSAneGVuJyBkZWJ1Z2ZzIGRpcmVjdG9yeVxuIik7Ci0JfQotCiAJcmV0dXJu
IGRfeGVuX2RlYnVnOwogfQogCmRpZmYgLS1naXQgYS9hcmNoL3g4Ni94ZW4vcDJtLmMgYi9hcmNo
L3g4Ni94ZW4vcDJtLmMKaW5kZXggOTVjZTliNWJlNDExLi4wYWNiYTJjNzEyYWIgMTAwNjQ0Ci0t
LSBhL2FyY2gveDg2L3hlbi9wMm0uYworKysgYi9hcmNoL3g4Ni94ZW4vcDJtLmMKQEAgLTgxNyw5
ICs4MTcsNiBAQCBzdGF0aWMgaW50IF9faW5pdCB4ZW5fcDJtX2RlYnVnZnModm9pZCkKIHsKIAlz
dHJ1Y3QgZGVudHJ5ICpkX3hlbiA9IHhlbl9pbml0X2RlYnVnZnMoKTsKIAotCWlmIChkX3hlbiA9
PSBOVUxMKQotCQlyZXR1cm4gLUVOT01FTTsKLQogCWRfbW11X2RlYnVnID0gZGVidWdmc19jcmVh
dGVfZGlyKCJtbXUiLCBkX3hlbik7CiAKIAlkZWJ1Z2ZzX2NyZWF0ZV9maWxlKCJwMm0iLCAwNjAw
LCBkX21tdV9kZWJ1ZywgTlVMTCwgJnAybV9kdW1wX2ZvcHMpOwotLSAKMi4yMS4wCgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
