From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: Building PVH mini-os with libc support
Date: Thu, 28 Dec 2017 19:18:47 +0000
Message-ID: <16766c4e-bf23-6f7a-9c76-03bd14f87408@citrix.com>
References: <CADNMjEDCKZoeKQ5bEwJo0okmCgm-Jn0OgbP85+qfc1YJfUinfw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7083521178165026373=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=3crk=dy=citrix.com=prvs=528a24e1c=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1eUdhc-0006qp-KE
 for xen-devel@lists.xenproject.org; Thu, 28 Dec 2017 19:18:52 +0000
In-Reply-To: <CADNMjEDCKZoeKQ5bEwJo0okmCgm-Jn0OgbP85+qfc1YJfUinfw@mail.gmail.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Bruno Alvisio <bruno.alvisio@gmail.com>, minios-devel@lists.xenproject.org, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

--===============7083521178165026373==
Content-Type: multipart/alternative;
	boundary="------------15C718042856B32F98A1A91E"
Content-Language: en-GB

--------------15C718042856B32F98A1A91E
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On 28/12/17 18:33, Bruno Alvisio wrote:
> (d360) Bootstrapping...
>
> (XEN) Dom360 callback via changed to Direct Vector 0x20
>
> (d360) Xen Minimal OS (hvm)!
>
> (XEN) d360v0 Triple fault - invoking HVM shutdown action 1
>
> (XEN) *** Dumping Dom360 vcpu#0 state: ***
>
> (XEN) ----[ Xen-4.10.0-rc  x86_64  debug=y   Not tainted ]----
>
> (XEN) CPU:    7
>
> (XEN) RIP:    0008:[<0000000000056fc8>]
>
> (XEN) RFLAGS: 0000000000010006   CONTEXT: hvm guest (d360v0)
>
> (XEN) rax: 00000000000bfe75   rbx: 00000000000bfe75   rcx:
> 0000000000000000
>
> (XEN) rdx: 0000000000000017   rsi: 00000000000bfe60   rdi:
> 0000000000000000
>
> (XEN) rbp: 00000000000bfec0   rsp: 00000000000bfe60   r8: 
> 0000000000000000
>
> (XEN) r9:  0000000000089982   r10: 0000000000000016   r11:
> 0000000000000000
>
> (XEN) r12: 0000000000000017   r13: 0000000000000016   r14:
> 0000000000000000
>
> (XEN) r15: 0d8b4c1575ff8548   cr0: 0000000080000011   cr4:
> 0000000000000220
>
> (XEN) cr3: 0000000000099000   cr2: 0000000000000000
>
> (XEN) fsb: 0000000000000000   gsb: 0000000000000000   gss:
> 0000000000000000
>
> (XEN) ds: 0033   es: 0033   fs: 0033   gs: 0033   ss: 0000   cs: 0008
>
>  
>
>  
>
> Any help on this would be greatly appreciated.
>

You will need to disassemble your minios kernel and see which
instruction is at 0x56fc8.  (Chances are, it will be `jmp %r15`).

The content of %r15 looks like x86 opcode, which is reminiscent of the
XTF relocatability bugs.  Make doubly sure you are compiling with
-fno-pic and link with -no-pie.

~Andrew

--------------15C718042856B32F98A1A91E
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 28/12/17 18:33, Bruno Alvisio wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CADNMjEDCKZoeKQ5bEwJo0okmCgm-Jn0OgbP85+qfc1YJfUinfw@mail.gmail.com">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr"><font size="1"><span
            style="font-family:Menlo;color:black">(d360)
            Bootstrapping...</span></font>
        <p class="gmail-MsoNormal" style="margin:0in 0in
          0.0001pt;font-family:Calibri"><font size="1"><span
              style="font-family:Menlo;color:black">(XEN) Dom360
              callback via
              changed to Direct Vector 0x20</span></font></p>
        <p class="gmail-MsoNormal" style="margin:0in 0in
          0.0001pt;font-family:Calibri"><font size="1"><span
              style="font-family:Menlo;color:black">(d360) Xen Minimal
              OS
              (hvm)!</span></font></p>
        <p class="gmail-MsoNormal" style="margin:0in 0in
          0.0001pt;font-family:Calibri"><font size="1"><span
              style="font-family:Menlo;color:black">(XEN) d360v0 Triple
              fault -
              invoking HVM shutdown action 1</span></font></p>
        <p class="gmail-MsoNormal" style="margin:0in 0in
          0.0001pt;font-family:Calibri"><font size="1"><span
              style="font-family:Menlo;color:black">(XEN) *** Dumping
              Dom360
              vcpu#0 state: ***</span></font></p>
        <p class="gmail-MsoNormal" style="margin:0in 0in
          0.0001pt;font-family:Calibri"><font size="1"><span
              style="font-family:Menlo;color:black">(XEN) ----[
              Xen-4.10.0-rc<span>  </span>x86_64<span>  </span>debug=y<span>  
              </span>Not tainted ]----</span></font></p>
        <p class="gmail-MsoNormal" style="margin:0in 0in
          0.0001pt;font-family:Calibri"><font size="1"><span
              style="font-family:Menlo;color:black">(XEN) CPU:<span>   
              </span>7</span></font></p>
        <p class="gmail-MsoNormal" style="margin:0in 0in
          0.0001pt;font-family:Calibri"><font size="1"><span
              style="font-family:Menlo;color:black">(XEN) RIP:<span>   
              </span>0008:[&lt;0000000000056fc8&gt;]</span></font></p>
        <p class="gmail-MsoNormal" style="margin:0in 0in
          0.0001pt;font-family:Calibri"><font size="1"><span
              style="font-family:Menlo;color:black">(XEN) RFLAGS:
              0000000000010006<span>   </span>CONTEXT: hvm guest
              (d360v0)</span></font></p>
        <p class="gmail-MsoNormal" style="margin:0in 0in
          0.0001pt;font-family:Calibri"><font size="1"><span
              style="font-family:Menlo;color:black">(XEN) rax:
              00000000000bfe75<span>   </span>rbx:
              00000000000bfe75<span>   </span>rcx: 0000000000000000</span></font></p>
        <p class="gmail-MsoNormal" style="margin:0in 0in
          0.0001pt;font-family:Calibri"><font size="1"><span
              style="font-family:Menlo;color:black">(XEN) rdx:
              0000000000000017<span>   </span>rsi:
              00000000000bfe60<span>   </span>rdi: 0000000000000000</span></font></p>
        <p class="gmail-MsoNormal" style="margin:0in 0in
          0.0001pt;font-family:Calibri"><font size="1"><span
              style="font-family:Menlo;color:black">(XEN) rbp:
              00000000000bfec0<span>   </span>rsp:
              00000000000bfe60<span>   </span>r8:<span>  </span>0000000000000000</span></font></p>
        <p class="gmail-MsoNormal" style="margin:0in 0in
          0.0001pt;font-family:Calibri"><font size="1"><span
              style="font-family:Menlo;color:black">(XEN) r9:<span>  </span>0000000000089982<span> 
              </span><span> </span>r10:
              0000000000000016<span>   </span>r11: 0000000000000000</span></font></p>
        <p class="gmail-MsoNormal" style="margin:0in 0in
          0.0001pt;font-family:Calibri"><font size="1"><span
              style="font-family:Menlo;color:black">(XEN) r12:
              0000000000000017<span>   </span>r13:
              0000000000000016<span>   </span>r14: 0000000000000000</span></font></p>
        <p class="gmail-MsoNormal" style="margin:0in 0in
          0.0001pt;font-family:Calibri"><font size="1"><span
              style="font-family:Menlo;color:black">(XEN) r15:
              0d8b4c1575ff8548<span>   </span>cr0:
              0000000080000011<span>   </span>cr4: 0000000000000220</span></font></p>
        <p class="gmail-MsoNormal" style="margin:0in 0in
          0.0001pt;font-family:Calibri"><font size="1"><span
              style="font-family:Menlo;color:black">(XEN) cr3:
              0000000000099000<span>   </span>cr2: 0000000000000000</span></font></p>
        <p class="gmail-MsoNormal" style="margin:0in 0in
          0.0001pt;font-family:Calibri"><font size="1"><span
              style="font-family:Menlo;color:black">(XEN) fsb:
              0000000000000000<span>   </span>gsb:
              0000000000000000<span>   </span>gss: 0000000000000000</span></font></p>
        <p class="gmail-MsoNormal" style="margin:0in 0in
          0.0001pt;font-family:Calibri"><font size="1"><span
              style="font-family:Menlo;color:black">(XEN) ds: 0033<span>  
              </span>es: 0033<span>   </span>fs: 0033<span>   </span>gs:
              0033<span>  
              </span>ss: 0000<span>   </span>cs: 0008</span></font></p>
        <p class="gmail-MsoNormal" style="margin:0in 0in
          0.0001pt;font-family:Calibri"><font size="1"><span
              style="font-family:Menlo;color:black"> </span></font></p>
        <p class="gmail-MsoNormal" style="margin:0in 0in 0.0001pt"><span
            style="font-family:arial,helvetica,sans-serif"><font
              size="1"><span style="color:black"> </span></font></span></p>
        <span style="font-family:arial,helvetica,sans-serif">
        </span>
        <p class="gmail-MsoNormal" style="margin:0in 0in 0.0001pt"><font
            size="2"><span
              style="font-family:arial,helvetica,sans-serif"><span
                style="color:black">Any help on this would be greatly
                appreciated.</span></span></font></p>
      </div>
    </blockquote>
    <br>
    You will need to disassemble your minios kernel and see which
    instruction is at 0x56fc8.  (Chances are, it will be `jmp %r15`).<br>
    <br>
    The content of %r15 looks like x86 opcode, which is reminiscent of
    the XTF relocatability bugs.  Make doubly sure you are compiling
    with -fno-pic and link with -no-pie.<br>
    <br>
    ~Andrew<br>
  </body>
</html>

--------------15C718042856B32F98A1A91E--


--===============7083521178165026373==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7083521178165026373==--
