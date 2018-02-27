From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: Is there any way to read msr in hypervisor code?
Date: Tue, 27 Feb 2018 10:00:49 +0000
Message-ID: <fbea2750-f4a6-d72b-8738-4751f0fbf45e@citrix.com>
References: <CAFX_q-F=CkRYyH5BgWxNig9G5XFQOKNgwAKoCsNDPO218a1bdQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0852864473306774887=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <CAFX_q-F=CkRYyH5BgWxNig9G5XFQOKNgwAKoCsNDPO218a1bdQ@mail.gmail.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Minjun Hong <nickeysgo@gmail.com>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

This is a multi-part message in MIME format.
--===============0852864473306774887==
Content-Type: multipart/alternative;
 boundary="------------7F36471F136C82544670697E"
Content-Language: en-GB

This is a multi-part message in MIME format.
--------------7F36471F136C82544670697E
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

On 27/02/2018 09:37, Minjun Hong wrote:
> Hello, I've tried to read msr in hypervisor code:
>
>     uint64_t reg;  
>
>     rdmsr_safe(0x412e, ret);
>
>
> But, I all failed to read it because the hypervisor is running in
> ring-1 CPL as I did googling.

Xen runs in ring 0, root mode.  Forget terms like "ring -1" because they
are not accurate, and not a helpful description of what is going on.

> When I accessed msr, the crash log is below:
>
>
>         (XEN) ----[ Xen-4.9.0  x86_64  debug=n   Not tainted ]----
>
>         (XEN) CPU:    7
>
>         (XEN) RIP:    e008:[<ffff82d08024139d>]
>         mcsched.c#shscan_timer_fn+0xd/0x180
>
>         (XEN) RFLAGS: 0000000000010206   CONTEXT: hypervisor
>
>         (XEN) rax: ffff83084abfe028   rbx: ffff83084abfe300   rcx:
>         000000000000412e
>
>         (XEN) rdx: ffff83084abb7fff   rsi: ffff82d080632f00   rdi:
>         0000000000000000
>
>         (XEN) rbp: ffff82d080241390   rsp: ffff83084abb7e30   r8: 
>         ffff830868d4bdc0
>
>         (XEN) r9:  0000000000000005   r10: 0000012da75b50a5   r11:
>         ffff8300782f3060
>
>         (XEN) r12: 0000000000000000   r13: 0000012d9f9d6e07   r14:
>         ffff83084abb7fff
>
>         (XEN) r15: ffff82d08062ad80   cr0: 000000008005003b   cr4:
>         00000000003526e0
>
>         (XEN) cr3: 00000003426f3000   cr2: 00007fc3c21d4000
>
>         (XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: e010 
>          cs: e008
>
>         (XEN) Xen code around <ffff82d08024139d>
>         (mcsched.c#shscan_timer_fn+0xd/0x180):
>
>         (XEN)  00 00 41 55 41 54 55 53 <0f> 32 4c 8d 05 0a 79 11 00 48
>         8d 0d 91 45 14 00
>

This is a rdmsr(), not rdmsr_safe(), which is why you are crashing.

Irrespective of that, 0x412e isn't an MSR which exists on any real
hardware, so I'm not sure what other result you were expecting.

~Andrew

--------------7F36471F136C82544670697E
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 27/02/2018 09:37, Minjun Hong wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAFX_q-F=CkRYyH5BgWxNig9G5XFQOKNgwAKoCsNDPO218a1bdQ@mail.gmail.com">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr">Hello, I've tried to read msr in hypervisor code:
        <div><br>
        </div>
        <div>
          <blockquote class="gmail_quote"
style="color:rgb(34,34,34);font-family:arial,sans-serif;font-size:small;font-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;text-decoration-style:initial;text-decoration-color:initial;margin:0px
            0px 0px 0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">uint64_t reg;  </blockquote>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">rdmsr_safe(0x412e, ret);</blockquote>
        </div>
        <div><br>
          <div>But, I all failed to read it because the hypervisor is
            running in ring-1 CPL as I did googling.</div>
        </div>
      </div>
    </blockquote>
    <br>
    Xen runs in ring 0, root mode.  Forget terms like "ring -1" because
    they are not accurate, and not a helpful description of what is
    going on.<br>
    <br>
    <blockquote type="cite"
cite="mid:CAFX_q-F=CkRYyH5BgWxNig9G5XFQOKNgwAKoCsNDPO218a1bdQ@mail.gmail.com">
      <div dir="ltr">
        <div>
          <div>When I accessed msr, the crash log is below:</div>
          <div><br>
          </div>
          <div><br>
          </div>
          <div>
            <blockquote class="gmail_quote" style="margin:0px 0px 0px
              0.8ex;border-left:1px solid
              rgb(204,204,204);padding-left:1ex">
              <blockquote class="gmail_quote" style="margin:0px 0px 0px
                0.8ex;border-left:1px solid
                rgb(204,204,204);padding-left:1ex">(XEN) ----[
                Xen-4.9.0  x86_64  debug=n   Not tainted ]----</blockquote>
              <blockquote class="gmail_quote" style="margin:0px 0px 0px
                0.8ex;border-left:1px solid
                rgb(204,204,204);padding-left:1ex">(XEN) CPU:    7</blockquote>
              <blockquote class="gmail_quote" style="margin:0px 0px 0px
                0.8ex;border-left:1px solid
                rgb(204,204,204);padding-left:1ex">(XEN) RIP:   
                e008:[&lt;ffff82d08024139d&gt;]
                mcsched.c#shscan_timer_fn+0xd/0x180</blockquote>
              <blockquote class="gmail_quote" style="margin:0px 0px 0px
                0.8ex;border-left:1px solid
                rgb(204,204,204);padding-left:1ex">(XEN) RFLAGS:
                0000000000010206   CONTEXT: hypervisor</blockquote>
              <blockquote class="gmail_quote" style="margin:0px 0px 0px
                0.8ex;border-left:1px solid
                rgb(204,204,204);padding-left:1ex">(XEN) rax:
                ffff83084abfe028   rbx: ffff83084abfe300   rcx:
                000000000000412e</blockquote>
              <blockquote class="gmail_quote" style="margin:0px 0px 0px
                0.8ex;border-left:1px solid
                rgb(204,204,204);padding-left:1ex">(XEN) rdx:
                ffff83084abb7fff   rsi: ffff82d080632f00   rdi:
                0000000000000000</blockquote>
              <blockquote class="gmail_quote" style="margin:0px 0px 0px
                0.8ex;border-left:1px solid
                rgb(204,204,204);padding-left:1ex">(XEN) rbp:
                ffff82d080241390   rsp: ffff83084abb7e30   r8: 
                ffff830868d4bdc0</blockquote>
              <blockquote class="gmail_quote" style="margin:0px 0px 0px
                0.8ex;border-left:1px solid
                rgb(204,204,204);padding-left:1ex">(XEN) r9: 
                0000000000000005   r10: 0000012da75b50a5   r11:
                ffff8300782f3060</blockquote>
              <blockquote class="gmail_quote" style="margin:0px 0px 0px
                0.8ex;border-left:1px solid
                rgb(204,204,204);padding-left:1ex">(XEN) r12:
                0000000000000000   r13: 0000012d9f9d6e07   r14:
                ffff83084abb7fff</blockquote>
              <blockquote class="gmail_quote" style="margin:0px 0px 0px
                0.8ex;border-left:1px solid
                rgb(204,204,204);padding-left:1ex">(XEN) r15:
                ffff82d08062ad80   cr0: 000000008005003b   cr4:
                00000000003526e0</blockquote>
              <blockquote class="gmail_quote" style="margin:0px 0px 0px
                0.8ex;border-left:1px solid
                rgb(204,204,204);padding-left:1ex">(XEN) cr3:
                00000003426f3000   cr2: 00007fc3c21d4000</blockquote>
              <blockquote class="gmail_quote" style="margin:0px 0px 0px
                0.8ex;border-left:1px solid
                rgb(204,204,204);padding-left:1ex">(XEN) ds: 0000   es:
                0000   fs: 0000   gs: 0000   ss: e010   cs: e008</blockquote>
              <blockquote class="gmail_quote" style="margin:0px 0px 0px
                0.8ex;border-left:1px solid
                rgb(204,204,204);padding-left:1ex">(XEN) Xen code around
                &lt;ffff82d08024139d&gt;
                (mcsched.c#shscan_timer_fn+0xd/0x180):</blockquote>
              <blockquote class="gmail_quote" style="margin:0px 0px 0px
                0.8ex;border-left:1px solid
                rgb(204,204,204);padding-left:1ex">(XEN)  00 00 41 55 41
                54 55 53 &lt;0f&gt; 32 4c 8d 05 0a 79 11 00 48 8d 0d 91
                45 14 00</blockquote>
            </blockquote>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
    This is a rdmsr(), not rdmsr_safe(), which is why you are crashing.<br>
    <br>
    Irrespective of that, 0x412e isn't an MSR which exists on any real
    hardware, so I'm not sure what other result you were expecting.<br>
    <br>
    ~Andrew<br>
  </body>
</html>

--------------7F36471F136C82544670697E--


--===============0852864473306774887==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0852864473306774887==--
