Return-Path: <SRS0=kbZc=SS=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9624C10F13
	for <xen-devel@archiver.kernel.org>; Tue, 16 Apr 2019 13:23:45 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF4ED2077C
	for <xen-devel@archiver.kernel.org>; Tue, 16 Apr 2019 13:23:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AF4ED2077C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hGO3W-0007SC-7L; Tue, 16 Apr 2019 13:23:22 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=19lK=SS=citrix.com=prvs=002fb28a9=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hGO3U-0007S7-VD
 for xen-devel@lists.xenproject.org; Tue, 16 Apr 2019 13:23:20 +0000
X-Inumbo-ID: cbe1830a-604a-11e9-92d7-bc764e045a96
Received: from SMTP.EU.CITRIX.COM (unknown [185.25.65.24])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id cbe1830a-604a-11e9-92d7-bc764e045a96;
 Tue, 16 Apr 2019 13:23:18 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,357,1549929600"; d="scan'208,217";a="88897685"
To: Pry Mar <pryorm09@gmail.com>, xen-devel <xen-devel@lists.xenproject.org>
References: <CAHnBbQ8u+MywkV4+qmxhkA8216knGhGZjcy1Sz6Ukv3=PJZmXQ@mail.gmail.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <293280a7-5011-e5a1-da53-80587b7b9a94@citrix.com>
Date: Tue, 16 Apr 2019 14:23:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAHnBbQ8u+MywkV4+qmxhkA8216knGhGZjcy1Sz6Ukv3=PJZmXQ@mail.gmail.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Cc: M A Young <m.a.young@durham.ac.uk>
Content-Type: multipart/mixed; boundary="===============1360447192044942743=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190416132301.Pi2CfD704qvyaNWJVuhEvOwIPNVYpxtk8rxL5rzMtzI@z>

--===============1360447192044942743==
Content-Type: multipart/alternative;
	boundary="------------02201C337423A74AF69E1BD3"
Content-Language: en-GB

--------------02201C337423A74AF69E1BD3
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On 16/04/2019 00:18, Pry Mar wrote:
> Hello,
>
> https://paste.debian.net/1077718/
>
> I get a kernel panic as shown in the paste above no matter how I
> launch pvh, with bootloader (pygrub), kernel direct (4.18+), or
> pvgrub2 (i386-xen_pvh support).

From the log:
> traps: modprobe[48] trap invalid opcode ip:7f797dc7bb95 sp:7ffe3099cdb8 error:0 in ld-2.29.so[7f797dc61000+21000]

Can you disassemble ld-2.29.so and find out what that instruction is? 
It is almost certainly a related factor.

> [    1.127818] Run /init as init process
> [    1.130195] Kernel panic - not syncing: Attempted to kill init! exitcode=0x00000004
> [    1.130230] CPU: 0 PID: 1 Comm: init Not tainted 5.0.0-8-generic #9-Ubuntu
> [    1.130243] Call Trace:
> [    1.130284]  dump_stack+0x63/0x8a
> [    1.130296]  panic+0x101/0x2a7
> [    1.130306]  do_exit.cold.24+0x26/0x75
> [    1.130315]  do_group_exit+0x43/0xb0
> [    1.130325]  get_signal+0x139/0x6d0
> [    1.130336]  do_signal+0x34/0x710
> [    1.130345]  ? do_trap+0xda/0xe0
> [    1.130375]  exit_to_usermode_loop+0x8e/0x100
> [    1.130387]  prepare_exit_to_usermode+0x5a/0x80
> [    1.130399]  ? invalid_op+0xa/0x20
> [    1.130408]  retint_user+0x8/0x8
> [    1.130418] RIP: 0033:0x7feef6fe4b95
> [    1.130433] Code: Bad RIP value.
> [    1.130441] RSP: 002b:00007ffdda330e78 EFLAGS: 00010246
> [    1.130452] RAX: 000000000000000c RBX: 0000000000000001 RCX: 000000000000000b
> [    1.130466] RDX: 0000000000000042 RSI: 00007feef6fecd75 RDI: 0000000000000000
> [    1.130479] RBP: 000055c1b07f7040 R08: 0000000000000019 R09: 0000000000000001
> [    1.130493] R10: 0000000000000000 R11: 000000000000004d R12: 000000000000000b
> [    1.130507] R13: 00007feef6fcb810 R14: 0000000000000000 R15: 00007ffdda331119
> [    1.130733] Kernel Offset: 0x2400000 from 0xffffffff81000000 (relocation range: 0xffffffff80000000-0xffffffffbfffffff)

This looks to be related to the #UD from above, but rather more fatal.

~Andrew

--------------02201C337423A74AF69E1BD3
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 16/04/2019 00:18, Pry Mar wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAHnBbQ8u+MywkV4+qmxhkA8216knGhGZjcy1Sz6Ukv3=PJZmXQ@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">Hello,

<a class="moz-txt-link-freetext" href="https://paste.debian.net/1077718/">https://paste.debian.net/1077718/</a>

I get a kernel panic as shown in the paste above no matter how I
launch pvh, with bootloader (pygrub), kernel direct (4.18+), or
pvgrub2 (i386-xen_pvh support).</pre>
    </blockquote>
    <br>
    From the log:<br>
    <blockquote type="cite">
      <pre>traps: modprobe[48] trap invalid opcode ip:7f797dc7bb95 sp:7ffe3099cdb8 error:0 in ld-2.29.so[7f797dc61000+21000]</pre>
    </blockquote>
    <br>
    Can you disassemble ld-2.29.so and find out what that instruction
    is?  It is almost certainly a related factor.<br>
    <br>
    <blockquote type="cite">
      <pre>[    1.127818] Run /init as init process
[    1.130195] Kernel panic - not syncing: Attempted to kill init! exitcode=0x00000004
[    1.130230] CPU: 0 PID: 1 Comm: init Not tainted 5.0.0-8-generic #9-Ubuntu
[    1.130243] Call Trace:
[    1.130284]  dump_stack+0x63/0x8a
[    1.130296]  panic+0x101/0x2a7
[    1.130306]  do_exit.cold.24+0x26/0x75
[    1.130315]  do_group_exit+0x43/0xb0
[    1.130325]  get_signal+0x139/0x6d0
[    1.130336]  do_signal+0x34/0x710
[    1.130345]  ? do_trap+0xda/0xe0
[    1.130375]  exit_to_usermode_loop+0x8e/0x100
[    1.130387]  prepare_exit_to_usermode+0x5a/0x80
[    1.130399]  ? invalid_op+0xa/0x20
[    1.130408]  retint_user+0x8/0x8
[    1.130418] RIP: 0033:0x7feef6fe4b95
[    1.130433] Code: Bad RIP value.
[    1.130441] RSP: 002b:00007ffdda330e78 EFLAGS: 00010246
[    1.130452] RAX: 000000000000000c RBX: 0000000000000001 RCX: 000000000000000b
[    1.130466] RDX: 0000000000000042 RSI: 00007feef6fecd75 RDI: 0000000000000000
[    1.130479] RBP: 000055c1b07f7040 R08: 0000000000000019 R09: 0000000000000001
[    1.130493] R10: 0000000000000000 R11: 000000000000004d R12: 000000000000000b
[    1.130507] R13: 00007feef6fcb810 R14: 0000000000000000 R15: 00007ffdda331119
[    1.130733] Kernel Offset: 0x2400000 from 0xffffffff81000000 (relocation range: 0xffffffff80000000-0xffffffffbfffffff)</pre>
    </blockquote>
    <br>
    This looks to be related to the #UD from above, but rather more
    fatal.<br>
    <br>
    ~Andrew<br>
  </body>
</html>

--------------02201C337423A74AF69E1BD3--


--===============1360447192044942743==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1360447192044942743==--

