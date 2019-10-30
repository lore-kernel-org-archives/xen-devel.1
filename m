Return-Path: <SRS0=CYfj=YX=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53175CA9EC5
	for <xen-devel@archiver.kernel.org>; Wed, 30 Oct 2019 10:39:54 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2EA52204FD
	for <xen-devel@archiver.kernel.org>; Wed, 30 Oct 2019 10:39:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2EA52204FD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iPlOC-0006uF-Sy; Wed, 30 Oct 2019 10:39:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=iUym=YX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iPlOB-0006tz-DW
 for xen-devel@lists.xenproject.org; Wed, 30 Oct 2019 10:39:43 +0000
X-Inumbo-ID: 94ea80d6-fb01-11e9-beca-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 94ea80d6-fb01-11e9-beca-bc764e2007e4;
 Wed, 30 Oct 2019 10:39:42 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 193F9AD7B;
 Wed, 30 Oct 2019 10:39:42 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <1e714166-ffeb-06a1-9caf-412eb040ac5a@suse.com>
Message-ID: <005a7254-aae8-ec7c-6e65-9dfe06803208@suse.com>
Date: Wed, 30 Oct 2019 11:39:44 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1e714166-ffeb-06a1-9caf-412eb040ac5a@suse.com>
Content-Language: en-US
Subject: [Xen-devel] [PATCH 2/2] x86: explicitly disallow guest access to
 PPIN
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VG8gZnVsZmlsbCB0aGUgInByb3RlY3RlZCIgaW4gaXRzIG5hbWUsIGRvbid0IGxldCB0aGUgcmVh
bCBoYXJkd2FyZQp2YWx1ZXMgInNoaW5lIHRocm91Z2giLiBSZXBvcnQgYSBjb250cm9sIHJlZ2lz
dGVyIHZhbHVlIGV4cHJlc3NpbmcgdGhpcy4KClNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxq
YmV1bGljaEBzdXNlLmNvbT4KLS0tClRCRDogRG8gd2Ugd2FudCB0byBwZXJtaXQgRG9tMCBhY2Nl
c3M/CgotLS0gYS94ZW4vYXJjaC94ODYvbXNyLmMKKysrIGIveGVuL2FyY2gveDg2L21zci5jCkBA
IC0xMzUsNiArMTM1LDggQEAgaW50IGd1ZXN0X3JkbXNyKHN0cnVjdCB2Y3B1ICp2LCB1aW50MzJf
dAogICAgIGNhc2UgTVNSX1RTWF9GT1JDRV9BQk9SVDoKICAgICBjYXNlIE1TUl9BTUQ2NF9MV1Bf
Q0ZHOgogICAgIGNhc2UgTVNSX0FNRDY0X0xXUF9DQkFERFI6CisgICAgY2FzZSBNU1JfUFBJTjoK
KyAgICBjYXNlIE1TUl9BTURfUFBJTjoKICAgICAgICAgLyogTm90IG9mZmVyZWQgdG8gZ3Vlc3Rz
LiAqLwogICAgICAgICBnb3RvIGdwX2ZhdWx0OwogCkBAIC0yMzcsNiArMjM5LDE4IEBAIGludCBn
dWVzdF9yZG1zcihzdHJ1Y3QgdmNwdSAqdiwgdWludDMyX3QKICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgQVJSQVlfU0laRShtc3JzLT5kcl9tYXNrKSldOwogICAgICAgICBicmVh
azsKIAorICAgIGNhc2UgTVNSX1BQSU5fQ1RMOgorICAgICAgICBpZiAoIGQtPmFyY2guY3B1aWQt
Png4Nl92ZW5kb3IgIT0gWDg2X1ZFTkRPUl9JTlRFTCApCisgICAgICAgICAgICBnb3RvIGdwX2Zh
dWx0OworICAgICAgICAqdmFsID0gUFBJTl9MT0NLT1VUOworICAgICAgICBicmVhazsKKworICAg
IGNhc2UgTVNSX0FNRF9QUElOX0NUTDoKKyAgICAgICAgaWYgKCAhY3AtPmV4dGQuYW1kX3BwaW4g
KQorICAgICAgICAgICAgZ290byBncF9mYXVsdDsKKyAgICAgICAgKnZhbCA9IFBQSU5fTE9DS09V
VDsKKyAgICAgICAgYnJlYWs7CisKICAgICAgICAgLyoKICAgICAgICAgICogVE9ETzogSW1wbGVt
ZW50IHdoZW4gd2UgaGF2ZSBiZXR0ZXIgdG9wb2xvZ3kgcmVwcmVzZW50YXRpb24uCiAgICAgY2Fz
ZSBNU1JfSU5URUxfQ09SRV9USFJFQURfQ09VTlQ6CkBAIC0yNzMsMTAgKzI4NywxNCBAQCBpbnQg
Z3Vlc3Rfd3Jtc3Ioc3RydWN0IHZjcHUgKnYsIHVpbnQzMl90CiAgICAgY2FzZSBNU1JfSU5URUxf
Q09SRV9USFJFQURfQ09VTlQ6CiAgICAgY2FzZSBNU1JfSU5URUxfUExBVEZPUk1fSU5GTzoKICAg
ICBjYXNlIE1TUl9BUkNIX0NBUEFCSUxJVElFUzoKKyAgICBjYXNlIE1TUl9QUElOOgorICAgIGNh
c2UgTVNSX0FNRF9QUElOOgogICAgICAgICAvKiBSZWFkLW9ubHkgKi8KICAgICBjYXNlIE1TUl9U
U1hfRk9SQ0VfQUJPUlQ6CiAgICAgY2FzZSBNU1JfQU1ENjRfTFdQX0NGRzoKICAgICBjYXNlIE1T
Ul9BTUQ2NF9MV1BfQ0JBRERSOgorICAgIGNhc2UgTVNSX1BQSU5fQ1RMOgorICAgIGNhc2UgTVNS
X0FNRF9QUElOX0NUTDoKICAgICAgICAgLyogTm90IG9mZmVyZWQgdG8gZ3Vlc3RzLiAqLwogICAg
ICAgICBnb3RvIGdwX2ZhdWx0OwogCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
