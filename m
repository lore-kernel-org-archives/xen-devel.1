Return-Path: <SRS0=7THE=S4=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4911EC43219
	for <xen-devel@archiver.kernel.org>; Fri, 26 Apr 2019 17:22:13 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B49E212F5
	for <xen-devel@archiver.kernel.org>; Fri, 26 Apr 2019 17:22:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1B49E212F5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=tklengyel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hK4Xi-0004Mn-1V; Fri, 26 Apr 2019 17:21:46 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TjWw=S4=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1hK4Xg-0004Mi-VK
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2019 17:21:44 +0000
X-Inumbo-ID: c3205a37-6847-11e9-843c-bc764e045a96
Received: from mail-io1-f67.google.com (unknown [209.85.166.67])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id c3205a37-6847-11e9-843c-bc764e045a96;
 Fri, 26 Apr 2019 17:21:43 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id c3so3562259iok.6
 for <xen-devel@lists.xenproject.org>; Fri, 26 Apr 2019 10:21:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=A9UWGu9rBj7DOnwO13kr7TG5xm4sj9fXYKV4wmxsbgI=;
 b=LzXIkE9kCEhWjhUkPlPFunUS0e5unWKrPNJHfZk6blm7ddPpmmizvngqwSZAugG7F9
 90iliLeMXhtPZ9yi5JsCI087eZ3IhF6sEhy/4Olnk/m+B6FL5Ems21X7JQqVni/0fRQW
 hDaf/mqYYIn0QVZ/O8FWqPqdEAgfqJCFNx42zR23z7Uuys8GBfrgnzTCjlDR3zwLCYfn
 Pj3VEWKhRYvcRIrqP2CcjtPsS6XfMqIac88nJCibo8kY3jwTuaGuCxlgM3MBf8h1IKcr
 GEbXzH5es7IJAnXjTwDrrfR/AjkLR+R0fh5cxDQH9F/In26HY2g8TkzJvtanicug2wyH
 q6QA==
X-Gm-Message-State: APjAAAXEpdgu41YUIPaQkIt/M2bydb7DOJSImtwuN1kmj1IpLiWTuMJL
 +0+So1Xr0pFpBB437BGw9la2fBuX
X-Google-Smtp-Source: APXvYqzI16HRAYQLJ9msmZvsW1tGKUQSLET3a3DJxQzmq3J0YLPlh3SgEYHKchTvemJef6HkJwft6Q==
X-Received: by 2002:a5d:9d84:: with SMTP id 4mr13325746ion.124.1556299303029; 
 Fri, 26 Apr 2019 10:21:43 -0700 (PDT)
Received: from localhost.localdomain (c-71-205-12-124.hsd1.co.comcast.net.
 [71.205.12.124])
 by smtp.gmail.com with ESMTPSA id u16sm3706808iol.66.2019.04.26.10.21.41
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 26 Apr 2019 10:21:41 -0700 (PDT)
From: Tamas K Lengyel <tamas@tklengyel.com>
To: xen-devel@lists.xenproject.org
Date: Fri, 26 Apr 2019 11:21:35 -0600
Message-Id: <20190426172138.14669-1-tamas@tklengyel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 1/4] x86/mem_sharing: reorder when pages are
 unlocked and released
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
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wei.liu2@citrix.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190426172135.pWAts9tvvLLEVyRT_0yqEh9YQgmSe-MxOOMtVGXscWQ@z>

Q2FsbGluZyBfcHV0X3BhZ2VfdHlwZSB3aGlsZSBhbHNvIGhvbGRpbmcgdGhlIHBhZ2VfbG9jawpm
b3IgdGhhdCBwYWdlIGNhbiBjYXVzZSBhIGRlYWRsb2NrLgoKU2lnbmVkLW9mZi1ieTogVGFtYXMg
SyBMZW5neWVsIDx0YW1hc0B0a2xlbmd5ZWwuY29tPgpDYzogSmFuIEJldWxpY2ggPGpiZXVsaWNo
QHN1c2UuY29tPgpDYzogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4K
Q2M6IEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBAZXUuY2l0cml4LmNvbT4KQ2M6IFdlaSBM
aXUgPHdlaS5saXUyQGNpdHJpeC5jb20+CkNjOiBSb2dlciBQYXUgTW9ubmUgPHJvZ2VyLnBhdUBj
aXRyaXguY29tPgotLS0KdjM6IHNpbXBsaWZpZWQgcGF0Y2ggYnkga2VlcGluZyB0aGUgYWRkaXRp
b25hbCByZWZlcmVuY2VzIGFscmVhZHkgaW4tcGxhY2UKLS0tCiB4ZW4vYXJjaC94ODYvbW0vbWVt
X3NoYXJpbmcuYyB8IDE5ICsrKysrKysrKystLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxMCBp
bnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9t
bS9tZW1fc2hhcmluZy5jIGIveGVuL2FyY2gveDg2L21tL21lbV9zaGFyaW5nLmMKaW5kZXggZGZj
Mjc5ZDM3MS4uZTJmNzRhYzc3MCAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L21tL21lbV9zaGFy
aW5nLmMKKysrIGIveGVuL2FyY2gveDg2L21tL21lbV9zaGFyaW5nLmMKQEAgLTY0OCwxMCArNjQ4
LDYgQEAgc3RhdGljIGludCBwYWdlX21ha2VfcHJpdmF0ZShzdHJ1Y3QgZG9tYWluICpkLCBzdHJ1
Y3QgcGFnZV9pbmZvICpwYWdlKQogICAgICAgICByZXR1cm4gLUVCVVNZOwogICAgIH0KIAotICAg
IC8qIFdlIGNhbiBvbmx5IGNoYW5nZSB0aGUgdHlwZSBpZiBjb3VudCBpcyBvbmUgKi8KLSAgICAv
KiBCZWNhdXNlIHdlIGFyZSBsb2NraW5nIHBhZ2VzIGluZGl2aWR1YWxseSwgd2UgbmVlZCB0byBk
cm9wCi0gICAgICogdGhlIGxvY2sgaGVyZSwgd2hpbGUgdGhlIHBhZ2UgaXMgdHlwZWQuIFdlIGNh
bm5vdCByaXNrIHRoZSAKLSAgICAgKiByYWNlIG9mIHBhZ2VfdW5sb2NrIGFuZCB0aGVuIHB1dF9w
YWdlX3R5cGUuICovCiAgICAgZXhwZWN0ZWRfdHlwZSA9IChQR1Rfc2hhcmVkX3BhZ2UgfCBQR1Rf
dmFsaWRhdGVkIHwgUEdUX2xvY2tlZCB8IDIpOwogICAgIGlmICggcGFnZS0+dS5pbnVzZS50eXBl
X2luZm8gIT0gZXhwZWN0ZWRfdHlwZSApCiAgICAgewpAQCAtNjYwLDEyICs2NTYsMTIgQEAgc3Rh
dGljIGludCBwYWdlX21ha2VfcHJpdmF0ZShzdHJ1Y3QgZG9tYWluICpkLCBzdHJ1Y3QgcGFnZV9p
bmZvICpwYWdlKQogICAgICAgICByZXR1cm4gLUVFWElTVDsKICAgICB9CiAKLSAgICAvKiBEcm9w
IHRoZSBmaW5hbCB0eXBlY291bnQgKi8KLSAgICBwdXRfcGFnZV9hbmRfdHlwZShwYWdlKTsKLQog
ICAgIC8qIE5vdyB0aGF0IHdlJ3ZlIGRyb3BwZWQgdGhlIHR5cGUsIHdlIGNhbiB1bmxvY2sgKi8K
ICAgICBtZW1fc2hhcmluZ19wYWdlX3VubG9jayhwYWdlKTsKIAorICAgIC8qIERyb3AgdGhlIGZp
bmFsIHR5cGVjb3VudCAqLworICAgIHB1dF9wYWdlX2FuZF90eXBlKHBhZ2UpOworCiAgICAgLyog
Q2hhbmdlIHRoZSBvd25lciAqLwogICAgIEFTU0VSVChwYWdlX2dldF9vd25lcihwYWdlKSA9PSBk
b21fY293KTsKICAgICBwYWdlX3NldF9vd25lcihwYWdlLCBkKTsKQEAgLTkwMCw2ICs4OTYsNyBA
QCBzdGF0aWMgaW50IHNoYXJlX3BhZ2VzKHN0cnVjdCBkb21haW4gKnNkLCBnZm5fdCBzZ2ZuLCBz
aHJfaGFuZGxlX3Qgc2gsCiAgICAgcDJtX3R5cGVfdCBzbWZuX3R5cGUsIGNtZm5fdHlwZTsKICAg
ICBzdHJ1Y3QgdHdvX2dmbnMgdGc7CiAgICAgc3RydWN0IHJtYXBfaXRlcmF0b3Igcmk7CisgICAg
dW5zaWduZWQgbG9uZyBwdXRfY291bnQgPSAwOwogCiAgICAgZ2V0X3R3b19nZm5zKHNkLCBzZ2Zu
LCAmc21mbl90eXBlLCBOVUxMLCAmc21mbiwKICAgICAgICAgICAgICAgICAgY2QsIGNnZm4sICZj
bWZuX3R5cGUsIE5VTEwsICZjbWZuLCAwLCAmdGcpOwpAQCAtOTg0LDcgKzk4MSw3IEBAIHN0YXRp
YyBpbnQgc2hhcmVfcGFnZXMoc3RydWN0IGRvbWFpbiAqc2QsIGdmbl90IHNnZm4sIHNocl9oYW5k
bGVfdCBzaCwKICAgICAgICAgICogRG9uJ3QgY2hhbmdlIHRoZSB0eXBlIG9mIHJtYXAgZm9yIHRo
ZSBjbGllbnQgcGFnZS4gKi8KICAgICAgICAgcm1hcF9kZWwoZ2ZuLCBjcGFnZSwgMCk7CiAgICAg
ICAgIHJtYXBfYWRkKGdmbiwgc3BhZ2UpOwotICAgICAgICBwdXRfcGFnZV9hbmRfdHlwZShjcGFn
ZSk7CisgICAgICAgIHB1dF9jb3VudCsrOwogICAgICAgICBkID0gZ2V0X2RvbWFpbl9ieV9pZChn
Zm4tPmRvbWFpbik7CiAgICAgICAgIEJVR19PTighZCk7CiAgICAgICAgIEJVR19PTihzZXRfc2hh
cmVkX3AybV9lbnRyeShkLCBnZm4tPmdmbiwgc21mbikpOwpAQCAtOTk5LDYgKzk5NiwxMCBAQCBz
dGF0aWMgaW50IHNoYXJlX3BhZ2VzKHN0cnVjdCBkb21haW4gKnNkLCBnZm5fdCBzZ2ZuLCBzaHJf
aGFuZGxlX3Qgc2gsCiAgICAgbWVtX3NoYXJpbmdfcGFnZV91bmxvY2soc2Vjb25kcGcpOwogICAg
IG1lbV9zaGFyaW5nX3BhZ2VfdW5sb2NrKGZpcnN0cGcpOwogCisgICAgQlVHX09OKCFwdXRfY291
bnQpOworICAgIHdoaWxlICggcHV0X2NvdW50LS0gKQorICAgICAgICBwdXRfcGFnZV9hbmRfdHlw
ZShjcGFnZSk7CisKICAgICAvKiBGcmVlIHRoZSBjbGllbnQgcGFnZSAqLwogICAgIGlmKHRlc3Rf
YW5kX2NsZWFyX2JpdChfUEdDX2FsbG9jYXRlZCwgJmNwYWdlLT5jb3VudF9pbmZvKSkKICAgICAg
ICAgcHV0X3BhZ2UoY3BhZ2UpOwpAQCAtMTE2Nyw4ICsxMTY4LDggQEAgaW50IF9fbWVtX3NoYXJp
bmdfdW5zaGFyZV9wYWdlKHN0cnVjdCBkb21haW4gKmQsCiAgICAgewogICAgICAgICBpZiAoICFs
YXN0X2dmbiApCiAgICAgICAgICAgICBtZW1fc2hhcmluZ19nZm5fZGVzdHJveShwYWdlLCBkLCBn
Zm5faW5mbyk7Ci0gICAgICAgIHB1dF9wYWdlX2FuZF90eXBlKHBhZ2UpOwogICAgICAgICBtZW1f
c2hhcmluZ19wYWdlX3VubG9jayhwYWdlKTsKKyAgICAgICAgcHV0X3BhZ2VfYW5kX3R5cGUocGFn
ZSk7CiAgICAgICAgIGlmICggbGFzdF9nZm4gKQogICAgICAgICB7CiAgICAgICAgICAgICBpZiAo
ICFnZXRfcGFnZShwYWdlLCBkb21fY293KSApCi0tIAoyLjIwLjEKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
