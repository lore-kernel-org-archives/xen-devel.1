Return-Path: <SRS0=kbZc=SS=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6AF2C10F13
	for <xen-devel@archiver.kernel.org>; Tue, 16 Apr 2019 22:18:11 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D5AC20880
	for <xen-devel@archiver.kernel.org>; Tue, 16 Apr 2019 22:18:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8D5AC20880
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=durham.ac.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hGWOo-0008V8-Au; Tue, 16 Apr 2019 22:17:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TLMa=SS=durham.ac.uk=m.a.young@srs-us1.protection.inumbo.net>)
 id 1hGWOn-0008Ub-34
 for xen-devel@lists.xenproject.org; Tue, 16 Apr 2019 22:17:53 +0000
X-Inumbo-ID: 77d476de-6095-11e9-bfda-ff2b8427c622
Received: from hermes1.dur.ac.uk (unknown [129.234.7.138])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 77d476de-6095-11e9-bfda-ff2b8427c622;
 Tue, 16 Apr 2019 22:17:49 +0000 (UTC)
Received: from smtphost4.dur.ac.uk (smtphost4.dur.ac.uk [129.234.7.146])
 by hermes1.dur.ac.uk (8.14.4/8.14.4) with ESMTP id x3GMHU4I044154;
 Tue, 16 Apr 2019 23:17:34 +0100
Received: from procyon.dur.ac.uk (procyon.dur.ac.uk [129.234.250.129])
 by smtphost4.dur.ac.uk (8.14.4/8.14.4) with ESMTP id x3GMHMij047335
 (version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NO);
 Tue, 16 Apr 2019 23:17:23 +0100
Received: from dcl0may (helo=localhost)
 by procyon.dur.ac.uk with local-esmtp (Exim 4.84_2)
 (envelope-from <dcl0may@procyon.dur.ac.uk>)
 id 1hGWOD-000BS2-7G; Tue, 16 Apr 2019 23:17:17 +0100
Date: Tue, 16 Apr 2019 23:17:17 +0100 (BST)
From: M A Young <m.a.young@durham.ac.uk>
To: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <293280a7-5011-e5a1-da53-80587b7b9a94@citrix.com>
Message-ID: <alpine.DEB.2.11.1904162258280.33856@procyon.dur.ac.uk>
References: <CAHnBbQ8u+MywkV4+qmxhkA8216knGhGZjcy1Sz6Ukv3=PJZmXQ@mail.gmail.com>
 <293280a7-5011-e5a1-da53-80587b7b9a94@citrix.com>
User-Agent: Alpine 2.11 (DEB 23 2013-08-11)
MIME-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="8323329-215549301-1555453037=:33856"
X-DurhamAcUk-MailScanner: Found to be clean, Found to be clean
X-DurhamAcUk-MailScanner-ID: x3GMHU4I044154
Subject: Re: [Xen-devel] booting domU guest as pvh works in xen-4.11.1 but
 fails in 4.12
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190416221717.-xGgD0pWJucVwuGatTB77xLW_kvlJv12U9-YRc94jXo@z>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-215549301-1555453037=:33856
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: 8BIT

On Tue, 16 Apr 2019, Andrew Cooper wrote:

> From the log:
> 
> traps: modprobe[48] trap invalid opcode ip:7f797dc7bb95 sp:7ffe3099cdb8 erro
> r:0 in ld-2.29.so[7f797dc61000+21000]
> 
> 
> Can you disassemble ld-2.29.so and find out what that instruction is?  It is
> almost certainly a related factor.

I get lines like
[    1.384356] traps: modprobe[36] trap invalid opcode ip:7f57448af179 
sp:7fff8fc3a938 error:0 in ld-2.29.so[7f5744895000+20000]

I am guessing the right place to look in ld-2.29.so is 
0x7f57448af179-0x7f57448950000-20000 = 86873 in which case I get
(gdb) x/10i 86873
   0x15359 <_dl_close_worker+3593>:	mov    (%rsi,%rcx,8),%r8
   0x1535d <_dl_close_worker+3597>:	testb  $0x20,0x31d(%r8)
   0x15365 <_dl_close_worker+3605>:	jne    0x15375 
<_dl_close_worker+3621>
   0x15367 <_dl_close_worker+3607>:	cmp    %ecx,%edx
   0x15369 <_dl_close_worker+3609>:	je     0x15372 
<_dl_close_worker+3618>
   0x1536b <_dl_close_worker+3611>:	mov    %edx,%r9d
   0x1536e <_dl_close_worker+3614>:	mov    %r8,(%rsi,%r9,8)
   0x15372 <_dl_close_worker+3618>:	add    $0x1,%edx
   0x15375 <_dl_close_worker+3621>:	add    $0x1,%rcx
   0x15379 <_dl_close_worker+3625>:	cmp    %ecx,%eax

Some more lines like this are
[    1.571479] traps: modprobe[41] trap invalid opcode ip:7f3e3628d179 
sp:7ffc86abbe08 error:0 in ld-2.29.so[7f3e36273000+20000]
[    1.630562] traps: modprobe[43] trap invalid opcode ip:7f227b39a179 
sp:7ffdfd943198 error:0 in ld-2.29.so[7f227b380000+20000]
which all seem to get to the same place. Is this useful or am I looking in 
the wrong place?

	Michael Young
--8323329-215549301-1555453037=:33856
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-215549301-1555453037=:33856--

