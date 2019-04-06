Return-Path: <SRS0=0ivi=SJ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29C22C282DD
	for <xen-devel@archiver.kernel.org>; Sun,  7 Apr 2019 05:24:03 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E1905213F2
	for <xen-devel@archiver.kernel.org>; Sun,  7 Apr 2019 05:24:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fEnmlIr3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E1905213F2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hD0HO-0004Fj-5m; Sun, 07 Apr 2019 05:23:42 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ShOz=SI=gmail.com=hariprasad.kelam@srs-us1.protection.inumbo.net>)
 id 1hCkRk-0002Lv-8o
 for xen-devel@lists.xenproject.org; Sat, 06 Apr 2019 12:29:20 +0000
X-Inumbo-ID: 992fd36f-5867-11e9-92d7-bc764e045a96
Received: from mail-pg1-x542.google.com (unknown [2607:f8b0:4864:20::542])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 992fd36f-5867-11e9-92d7-bc764e045a96;
 Sat, 06 Apr 2019 12:29:19 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id k3so4539184pga.6
 for <xen-devel@lists.xenproject.org>; Sat, 06 Apr 2019 05:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:subject:message-id:mime-version:content-disposition
 :user-agent; bh=ljzmLp/Rx5JDdQ7QJt3O5yVx/BQTjqg+OOYMyi0keYg=;
 b=fEnmlIr3h70+VFRqNP9aGzq6oA0lKrThXiQwpVePWZc8qpjcKWQGdcGuQp7AlmdNaV
 F1OaiDPLdSvR4RPfeRetnNbVGyvK9wBXFT2pXGmG0j8Bph7qoT2OZbgRWHGbAgGBKihj
 fpU2lK/o3ds4MSsnahRL06aWsfRlATLq8zMVeXx4Aidu89S1hsxfNKEnq8CGD4EGTi/0
 h/Sow9VxQnJAyhQXmTN6O7AAprKsH0O2K0hUCBsGtrI07WRlx8mkmWl5nLjEWTkXOJ45
 IKqc3f03tyRUZhMm8hX+1NVv7r4LFN1LqjY4hdbn2ufIIiD/q5oDJqjbUwwd75wW+cbx
 LWqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=ljzmLp/Rx5JDdQ7QJt3O5yVx/BQTjqg+OOYMyi0keYg=;
 b=V410Qw7fCPysL5ZiEQorXTQnkfqGBXF6cpiVGUtMQI9sPWbF+P+6IPhBYLQyHFHvaQ
 nf+gmOUTbHDFQ3LqEijOI+EU/GO9wxQglXTb0+NaAHJmDjc3o6UQBSH9k5n7zqLsfuK1
 zJu9rRO9/S8OvVdBqOyHjtTF7eigzBwZ6ZHay8vSo5NsU6uLHeBsuPKAsXy5fAnaBp72
 ieoXawUAgDjdiws/E452KvV75pWIUpmHHfoT9UP8T/v2IIaSTRA5A4pQAFOiml7PvwbL
 jiik2uPuzPkkHs4HCx9sbKVLvC6aCuk6P4sADAfo82Lzj0OwiOJevPWU15kFeqG1SN2P
 bF0A==
X-Gm-Message-State: APjAAAUqBvGwsPf0SGF8dLGBsONUqlsS/UAxEE3O5OnxnE/PuZandznF
 cJIpuZkpkPhSFxYYT9mmrLo=
X-Google-Smtp-Source: APXvYqw9p2AA/ltbvwYWi/8jsyrP065X209+CvNUUi4Dt86kiURYSrIPz2Fqz5h5iz/8b3lchZTemw==
X-Received: by 2002:a63:7152:: with SMTP id b18mr17486324pgn.186.1554553758151; 
 Sat, 06 Apr 2019 05:29:18 -0700 (PDT)
Received: from hari-Inspiron-1545 ([183.83.91.90])
 by smtp.gmail.com with ESMTPSA id p26sm55201245pfa.49.2019.04.06.05.29.15
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 06 Apr 2019 05:29:17 -0700 (PDT)
Date: Sat, 6 Apr 2019 17:59:12 +0530
From: Hariprasad Kelam <hariprasad.kelam@gmail.com>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Message-ID: <20190406122912.GA403@hari-Inspiron-1545>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Mailman-Approved-At: Sun, 07 Apr 2019 05:23:41 +0000
Subject: [Xen-devel] [PATCH] xen: xen-pciback: fix warning Using plain
 integer as NULL pointer
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Q2hhbmdlcyBwYXNzaW5nIGZ1bmN0aW9uIGFyZ3VtZW50IDAgdG8gTlVMTCB0byBhdm9pZCBiZWxv
dyBzcGFyc2UKd2FybmluZwoKIENIRUNLICAgZHJpdmVycy94ZW4veGVuLXBjaWJhY2sveGVuYnVz
LmMKZHJpdmVycy94ZW4veGVuLXBjaWJhY2sveGVuYnVzLmM6NzAwOjUxOiB3YXJuaW5nOiBVc2lu
ZyBwbGFpbiBpbnRlZ2VyIGFzCk5VTEwgcG9pbnRlcgoKU2lnbmVkLW9mZi1ieTogSGFyaXByYXNh
ZCBLZWxhbSA8aGFyaXByYXNhZC5rZWxhbUBnbWFpbC5jb20+Ci0tLQogZHJpdmVycy94ZW4veGVu
LXBjaWJhY2sveGVuYnVzLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3hlbi94ZW4tcGNpYmFjay94ZW5i
dXMuYyBiL2RyaXZlcnMveGVuL3hlbi1wY2liYWNrL3hlbmJ1cy5jCmluZGV4IDIzZjdmNmUuLjgz
M2IyZDIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMveGVuL3hlbi1wY2liYWNrL3hlbmJ1cy5jCisrKyBi
L2RyaXZlcnMveGVuL3hlbi1wY2liYWNrL3hlbmJ1cy5jCkBAIC02OTcsNyArNjk3LDcgQEAgc3Rh
dGljIGludCB4ZW5fcGNpYmtfeGVuYnVzX3Byb2JlKHN0cnVjdCB4ZW5idXNfZGV2aWNlICpkZXYs
CiAJLyogV2UgbmVlZCB0byBmb3JjZSBhIGNhbGwgdG8gb3VyIGNhbGxiYWNrIGhlcmUgaW4gY2Fz
ZQogCSAqIHhlbmQgYWxyZWFkeSBjb25maWd1cmVkIHVzIQogCSAqLwotCXhlbl9wY2lia19iZV93
YXRjaCgmcGRldi0+YmVfd2F0Y2gsIE5VTEwsIDApOworCXhlbl9wY2lia19iZV93YXRjaCgmcGRl
di0+YmVfd2F0Y2gsIE5VTEwsIE5VTEwpOwogCiBvdXQ6CiAJcmV0dXJuIGVycjsKLS0gCjIuNy40
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
