Return-Path: <SRS0=4R9G=IO=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B91CC433E0
	for <xen-devel@archiver.kernel.org>; Tue, 16 Mar 2021 22:49:23 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30F1264F2B
	for <xen-devel@archiver.kernel.org>; Tue, 16 Mar 2021 22:49:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 30F1264F2B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=patchew.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.98502.186893 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMIUy-0005m4-PS; Tue, 16 Mar 2021 22:49:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 98502.186893; Tue, 16 Mar 2021 22:49:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMIUy-0005lx-MV; Tue, 16 Mar 2021 22:49:12 +0000
Resent-Date: Tue, 16 Mar 2021 22:49:12 +0000
Resent-Message-Id: <E1lMIUy-0005lx-MV@lists.xenproject.org>
Received: by outflank-mailman (input) for mailman id 98502;
 Tue, 16 Mar 2021 22:49:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OFiz=IO=patchew.org=no-reply@srs-us1.protection.inumbo.net>)
 id 1lMIUw-0005ls-HF
 for xen-devel@lists.xenproject.org; Tue, 16 Mar 2021 22:49:10 +0000
Received: from sender4-of-o53.zoho.com (unknown [136.143.188.53])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1cdb01bf-8e86-473b-b883-332da37dba4a;
 Tue, 16 Mar 2021 22:49:08 +0000 (UTC)
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1615934935641742.6421852983427;
 Tue, 16 Mar 2021 15:48:55 -0700 (PDT)
Resent-From: 
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
X-Inumbo-ID: 1cdb01bf-8e86-473b-b883-332da37dba4a
ARC-Seal: i=1; a=rsa-sha256; t=1615934939; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=bV6BJdS970lmRrZADS3e8UrN1fwkr9UuhISi6DRU+IyX2yOgVCLy2mwKV1kNbgT3S5YnySG5jItaVZNP34sAHBCc/iwJptk3xeVChRV0ddB8DWZqblwIHyHdy/Ev1EuZQsoBPl6kJ2ioHtJrGB6OLZABZ5nZnNhYEMszmr5lFZU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1615934939; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To; 
	bh=tF8oDA4fa83Iw7SEm+BG8QQkhZXDWl7Jec7f/Xk3zOg=; 
	b=HvAeBi49Ca1dFLzo+4aBOqNd4VlsM2OSjdSTM+wahGQUKasJCKir9KyfTQiAhmaI0hHnWyCSdJrrX8z3rx2HVKoNKaFn1Ux2y3enoO2PZvFyeuIqBDifwscNZR9s78TjqI6qr4ZUZpU6zRHB0stwSVwqGwoO6mEgJjxnB8Gmors=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	spf=pass  smtp.mailfrom=no-reply@patchew.org;
	dmarc=pass header.from=<no-reply@patchew.org> header.from=<no-reply@patchew.org>
In-Reply-To: <20210316224412.11609-1-olaf@aepfle.de>
Reply-To: <qemu-devel@nongnu.org>
Subject: Re: [PATCH v1] piix: fix regression during unplug in Xen HVM domUs
Message-ID: <161593493442.18566.14612876295503290944@c9d4d6fbb2f1>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
From: no-reply@patchew.org
To: olaf@aepfle.de
Cc: xen-devel@lists.xenproject.org, qemu-block@nongnu.org, qemu-devel@nongnu.org, olaf@aepfle.de, jsnow@redhat.com
Date: Tue, 16 Mar 2021 15:48:55 -0700 (PDT)
X-ZohoMailClient: External

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDMxNjIyNDQxMi4xMTYw
OS0xLW9sYWZAYWVwZmxlLmRlLwoKCgpIaSwKClRoaXMgc2VyaWVzIHNlZW1zIHRvIGhhdmUgc29t
ZSBjb2Rpbmcgc3R5bGUgcHJvYmxlbXMuIFNlZSBvdXRwdXQgYmVsb3cgZm9yCm1vcmUgaW5mb3Jt
YXRpb246CgpUeXBlOiBzZXJpZXMKTWVzc2FnZS1pZDogMjAyMTAzMTYyMjQ0MTIuMTE2MDktMS1v
bGFmQGFlcGZsZS5kZQpTdWJqZWN0OiBbUEFUQ0ggdjFdIHBpaXg6IGZpeCByZWdyZXNzaW9uIGR1
cmluZyB1bnBsdWcgaW4gWGVuIEhWTSBkb21VcwoKPT09IFRFU1QgU0NSSVBUIEJFR0lOID09PQoj
IS9iaW4vYmFzaApnaXQgcmV2LXBhcnNlIGJhc2UgPiAvZGV2L251bGwgfHwgZXhpdCAwCmdpdCBj
b25maWcgLS1sb2NhbCBkaWZmLnJlbmFtZWxpbWl0IDAKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYu
cmVuYW1lcyBUcnVlCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLmFsZ29yaXRobSBoaXN0b2dyYW0K
Li9zY3JpcHRzL2NoZWNrcGF0Y2gucGwgLS1tYWlsYmFjayBiYXNlLi4KPT09IFRFU1QgU0NSSVBU
IEVORCA9PT0KClVwZGF0aW5nIDNjOGNmNWE5YzIxZmY4NzgyMTY0ZDFkZWY3ZjQ0YmQ4ODg3MTMz
ODQKRnJvbSBodHRwczovL2dpdGh1Yi5jb20vcGF0Y2hldy1wcm9qZWN0L3FlbXUKIC0gW3RhZyB1
cGRhdGVdICAgICAgcGF0Y2hldy8yMDIxMDMxMTE0Mzk1OC41NjI2MjUtMS1yaWNoYXJkLmhlbmRl
cnNvbkBsaW5hcm8ub3JnIC0+IHBhdGNoZXcvMjAyMTAzMTExNDM5NTguNTYyNjI1LTEtcmljaGFy
ZC5oZW5kZXJzb25AbGluYXJvLm9yZwogKiBbbmV3IHRhZ10gICAgICAgICBwYXRjaGV3LzIwMjEw
MzE2MjI0NDEyLjExNjA5LTEtb2xhZkBhZXBmbGUuZGUgLT4gcGF0Y2hldy8yMDIxMDMxNjIyNDQx
Mi4xMTYwOS0xLW9sYWZAYWVwZmxlLmRlClN3aXRjaGVkIHRvIGEgbmV3IGJyYW5jaCAndGVzdCcK
OWI3ZWMwZiBwaWl4OiBmaXggcmVncmVzc2lvbiBkdXJpbmcgdW5wbHVnIGluIFhlbiBIVk0gZG9t
VXMKCj09PSBPVVRQVVQgQkVHSU4gPT09CkVSUk9SOiBicmFjZXMge30gYXJlIG5lY2Vzc2FyeSBm
b3IgYWxsIGFybXMgb2YgdGhpcyBzdGF0ZW1lbnQKIzQxOiBGSUxFOiBody9pZGUvcGlpeC5jOjEx
MzoKKyAgICBpZiAocGNpX3BpaXgzX3hlbl9pZGVfdW5wbHVnX2RvbmUgPT0gdHJ1ZSkKWy4uLl0K
CnRvdGFsOiAxIGVycm9ycywgMCB3YXJuaW5ncywgMjkgbGluZXMgY2hlY2tlZAoKQ29tbWl0IDli
N2VjMGZlNWQ3YyAocGlpeDogZml4IHJlZ3Jlc3Npb24gZHVyaW5nIHVucGx1ZyBpbiBYZW4gSFZN
IGRvbVVzKSBoYXMgc3R5bGUgcHJvYmxlbXMsIHBsZWFzZSByZXZpZXcuICBJZiBhbnkgb2YgdGhl
c2UgZXJyb3JzCmFyZSBmYWxzZSBwb3NpdGl2ZXMgcmVwb3J0IHRoZW0gdG8gdGhlIG1haW50YWlu
ZXIsIHNlZQpDSEVDS1BBVENIIGluIE1BSU5UQUlORVJTLgo9PT0gT1VUUFVUIEVORCA9PT0KClRl
c3QgY29tbWFuZCBleGl0ZWQgd2l0aCBjb2RlOiAxCgoKVGhlIGZ1bGwgbG9nIGlzIGF2YWlsYWJs
ZSBhdApodHRwOi8vcGF0Y2hldy5vcmcvbG9ncy8yMDIxMDMxNjIyNDQxMi4xMTYwOS0xLW9sYWZA
YWVwZmxlLmRlL3Rlc3RpbmcuY2hlY2twYXRjaC8/dHlwZT1tZXNzYWdlLgotLS0KRW1haWwgZ2Vu
ZXJhdGVkIGF1dG9tYXRpY2FsbHkgYnkgUGF0Y2hldyBbaHR0cHM6Ly9wYXRjaGV3Lm9yZy9dLgpQ
bGVhc2Ugc2VuZCB5b3VyIGZlZWRiYWNrIHRvIHBhdGNoZXctZGV2ZWxAcmVkaGF0LmNvbQ==

