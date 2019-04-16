From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: booting domU guest as pvh works in xen-4.11.1 but
 fails in 4.12
Date: Tue, 16 Apr 2019 14:23:01 +0100
Message-ID: <293280a7-5011-e5a1-da53-80587b7b9a94@citrix.com>
References: <CAHnBbQ8u+MywkV4+qmxhkA8216knGhGZjcy1Sz6Ukv3=PJZmXQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1360447192044942743=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=19lK=SS=citrix.com=prvs=002fb28a9=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hGO3U-0007S7-VD
 for xen-devel@lists.xenproject.org; Tue, 16 Apr 2019 13:23:20 +0000
In-Reply-To: <CAHnBbQ8u+MywkV4+qmxhkA8216knGhGZjcy1Sz6Ukv3=PJZmXQ@mail.gmail.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Pry Mar <pryorm09@gmail.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: M A Young <m.a.young@durham.ac.uk>
List-Id: xen-devel@lists.xenproject.org

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

>From the log:
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
