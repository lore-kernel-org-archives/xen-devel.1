From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: Is there any way to read msr in hypervisor code?
Date: Tue, 27 Feb 2018 14:03:19 +0000
Message-ID: <643b7122-c469-dc68-9298-b69a0dd9df4d@citrix.com>
References: <CAFX_q-F=CkRYyH5BgWxNig9G5XFQOKNgwAKoCsNDPO218a1bdQ@mail.gmail.com>
 <fbea2750-f4a6-d72b-8738-4751f0fbf45e@citrix.com>
 <CAFX_q-HtYz=h-kFr_Jbp1WXFaXaa1L1t-zCMY-e1amQNeYq0Rw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0112835176097928335=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <CAFX_q-HtYz=h-kFr_Jbp1WXFaXaa1L1t-zCMY-e1amQNeYq0Rw@mail.gmail.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Minjun Hong <nickeysgo@gmail.com>
Cc: xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

--===============0112835176097928335==
Content-Type: multipart/alternative;
	boundary="------------FD42BBEF795AF9DC074AFEDC"
Content-Language: en-GB

--------------FD42BBEF795AF9DC074AFEDC
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On 27/02/18 12:35, Minjun Hong wrote:
> On Tue, Feb 27, 2018 at 7:00 PM, Andrew Cooper
> <andrew.cooper3@citrix.com <mailto:andrew.cooper3@citrix.com>> wrote:
>
>     On 27/02/2018 09:37, Minjun Hong wrote:
>>     Hello, I've tried to read msr in hypervisor code:
>>
>>         uint64_t reg;  
>>
>>         rdmsr_safe(0x412e, ret);
>>
>>
>>     But, I all failed to read it because the hypervisor is running in
>>     ring-1 CPL as I did googling.
>
>     Xen runs in ring 0, root mode.  Forget terms like "ring -1"
>     because they are not accurate, and not a helpful description of
>     what is going on.
>
>>     When I accessed msr, the crash log is below:
>>
>>
>>             (XEN) ----[ Xen-4.9.0  x86_64  debug=n   Not tainted ]----
>>
>>             (XEN) CPU:    7
>>
>>             (XEN) RIP:    e008:[<ffff82d08024139d>]
>>             mcsched.c#shscan_timer_fn+0xd/0x180
>>
>>             (XEN) RFLAGS: 0000000000010206   CONTEXT: hypervisor
>>
>>             (XEN) rax: ffff83084abfe028   rbx: ffff83084abfe300 
>>              rcx: 000000000000412e
>>
>>             (XEN) rdx: ffff83084abb7fff   rsi: ffff82d080632f00 
>>              rdi: 0000000000000000
>>
>>             (XEN) rbp: ffff82d080241390   rsp: ffff83084abb7e30 
>>              r8:  ffff830868d4bdc0
>>
>>             (XEN) r9:  0000000000000005   r10: 0000012da75b50a5 
>>              r11: ffff8300782f3060
>>
>>             (XEN) r12: 0000000000000000   r13: 0000012d9f9d6e07 
>>              r14: ffff83084abb7fff
>>
>>             (XEN) r15: ffff82d08062ad80   cr0: 000000008005003b 
>>              cr4: 00000000003526e0
>>
>>             (XEN) cr3: 00000003426f3000   cr2: 00007fc3c21d4000
>>
>>             (XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss:
>>             e010   cs: e008
>>
>>             (XEN) Xen code around <ffff82d08024139d>
>>             (mcsched.c#shscan_timer_fn+0xd/0x180):
>>
>>             (XEN)  00 00 41 55 41 54 55 53 <0f> 32 4c 8d 05 0a 79 11
>>             00 48 8d 0d 91 45 14 00
>>
>
>     This is a rdmsr(), not rdmsr_safe(), which is why you are crashing.
>
>     Irrespective of that, 0x412e isn't an MSR which exists on any real
>     hardware, so I'm not sure what other result you were expecting.
>
>     ~Andrew
>
>
> Thanks for your answer, Andrew.
>
> Actually, I intended to get the number of cache-misses from msr and 
> according to "/Figure 18//-1 Layout of IA32_PERFEVTSELx MSRs in Intel®
> 64 and IA-32 Architectures Software Developer’s Manual Volume 3B:
> System Programming Guide/",
> it can be achieved by "0x412e":
>
> Bit Position
>
> CPUID.AH.EBX
>
> 	
>
> Event Name
>
> 	
>
> UMask
>
> 	
>
> Event Select
>
> 0
>
> 	
>
> UnHalted Core Cycles
>
> 	
>
> 00H
>
> 	
>
> 3CH
>
> 1
>
> 	
>
> Instruction Retired
>
> 	
>
> 00H
>
> 	
>
> C0H
>
> 2
>
> 	
>
> UnHalted Reference Cycles
>
> 	
>
> 01H
>
> 	
>
> 3CH
>
> 3
>
> 	
>
> LLC Reference
>
> 	
>
> 4FH
>
> 	
>
> 2EH
>
> *4*
>
> 	
>
> *LLC Misses*
>
> 	
>
> *41H*
>
> 	
>
> *2EH*
>
> 5
>
> 	
>
> Branch Instruction Retired
>
> 	
>
> 00H
>
> 	
>
> C4H
>
> 6
>
> 	
>
> Branch Misses Retired
>
> 	
>
> 00H
>
> 	
>
> C5H
>
>
> I also tried to do that w/ rdmsr_safe() but, I failed to read msr.
> Through the macro that returns a non-zero value, it was easy to see
> that reading msr failed:
>
>     if ( rdmsr_safe(0x412e, ret) ) {
>         printk("cannot read msr!!!\n");  
>     } else {
>         printk("rdmsr: %lu\n", ret);
>     }
>
>
>  I cannot understand why you said "0x412e isn't an MSR which exists on
> any real hardware" so, is it impossible to get the number of
> cache-misses by using msr ??

The bit you highlight above are values you need to write into one of the
PERFEVTSELx MSRs, to cause hardware to track that event.  It does not
mean MSR by that index exists.

~Andrew

--------------FD42BBEF795AF9DC074AFEDC
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 27/02/18 12:35, Minjun Hong wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAFX_q-HtYz=h-kFr_Jbp1WXFaXaa1L1t-zCMY-e1amQNeYq0Rw@mail.gmail.com">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr">
        <div class="gmail_extra">
          <div class="gmail_quote">On Tue, Feb 27, 2018 at 7:00 PM,
            Andrew Cooper <span dir="ltr">&lt;<a
                href="mailto:andrew.cooper3@citrix.com" target="_blank"
                moz-do-not-send="true">andrew.cooper3@citrix.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0px 0px 0px
              0.8ex;border-left:1px solid
              rgb(204,204,204);padding-left:1ex">
              <div bgcolor="#FFFFFF"><span class="gmail-">
                  <div
                    class="gmail-m_-3011046827900447549moz-cite-prefix">On
                    27/02/2018 09:37, Minjun Hong wrote:<br>
                  </div>
                  <blockquote type="cite">
                    <div dir="ltr">Hello, I've tried to read msr in
                      hypervisor code:
                      <div><br>
                      </div>
                      <div>
                        <blockquote class="gmail_quote"
style="color:rgb(34,34,34);font-family:arial,sans-serif;font-size:small;font-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;text-decoration-style:initial;text-decoration-color:initial;margin:0px
                          0px 0px 0.8ex;border-left:1px solid
                          rgb(204,204,204);padding-left:1ex">uint64_t
                          reg;  </blockquote>
                        <blockquote class="gmail_quote"
                          style="margin:0px 0px 0px
                          0.8ex;border-left:1px solid
                          rgb(204,204,204);padding-left:1ex">rdmsr_safe(0x412e,
                          ret);</blockquote>
                      </div>
                      <div><br>
                        <div>But, I all failed to read it because the
                          hypervisor is running in ring-1 CPL as I did
                          googling.</div>
                      </div>
                    </div>
                  </blockquote>
                  <br>
                </span> Xen runs in ring 0, root mode.  Forget terms
                like "ring -1" because they are not accurate, and not a
                helpful description of what is going on.<span
                  class="gmail-"><br>
                  <br>
                  <blockquote type="cite">
                    <div dir="ltr">
                      <div>
                        <div>When I accessed msr, the crash log is
                          below:</div>
                        <div><br>
                        </div>
                        <div><br>
                        </div>
                        <div>
                          <blockquote class="gmail_quote"
                            style="margin:0px 0px 0px
                            0.8ex;border-left:1px solid
                            rgb(204,204,204);padding-left:1ex">
                            <blockquote class="gmail_quote"
                              style="margin:0px 0px 0px
                              0.8ex;border-left:1px solid
                              rgb(204,204,204);padding-left:1ex">(XEN)
                              ----[ Xen-4.9.0  x86_64  debug=n   Not
                              tainted ]----</blockquote>
                            <blockquote class="gmail_quote"
                              style="margin:0px 0px 0px
                              0.8ex;border-left:1px solid
                              rgb(204,204,204);padding-left:1ex">(XEN)
                              CPU:    7</blockquote>
                            <blockquote class="gmail_quote"
                              style="margin:0px 0px 0px
                              0.8ex;border-left:1px solid
                              rgb(204,204,204);padding-left:1ex">(XEN)
                              RIP:    e008:[&lt;ffff82d08024139d&gt;]
                              mcsched.c#shscan_timer_fn+0xd/<wbr>0x180</blockquote>
                            <blockquote class="gmail_quote"
                              style="margin:0px 0px 0px
                              0.8ex;border-left:1px solid
                              rgb(204,204,204);padding-left:1ex">(XEN)
                              RFLAGS: 0000000000010206   CONTEXT:
                              hypervisor</blockquote>
                            <blockquote class="gmail_quote"
                              style="margin:0px 0px 0px
                              0.8ex;border-left:1px solid
                              rgb(204,204,204);padding-left:1ex">(XEN)
                              rax: ffff83084abfe028   rbx:
                              ffff83084abfe300   rcx: 000000000000412e</blockquote>
                            <blockquote class="gmail_quote"
                              style="margin:0px 0px 0px
                              0.8ex;border-left:1px solid
                              rgb(204,204,204);padding-left:1ex">(XEN)
                              rdx: ffff83084abb7fff   rsi:
                              ffff82d080632f00   rdi: 0000000000000000</blockquote>
                            <blockquote class="gmail_quote"
                              style="margin:0px 0px 0px
                              0.8ex;border-left:1px solid
                              rgb(204,204,204);padding-left:1ex">(XEN)
                              rbp: ffff82d080241390   rsp:
                              ffff83084abb7e30   r8:  ffff830868d4bdc0</blockquote>
                            <blockquote class="gmail_quote"
                              style="margin:0px 0px 0px
                              0.8ex;border-left:1px solid
                              rgb(204,204,204);padding-left:1ex">(XEN)
                              r9:  0000000000000005   r10:
                              0000012da75b50a5   r11: ffff8300782f3060</blockquote>
                            <blockquote class="gmail_quote"
                              style="margin:0px 0px 0px
                              0.8ex;border-left:1px solid
                              rgb(204,204,204);padding-left:1ex">(XEN)
                              r12: 0000000000000000   r13:
                              0000012d9f9d6e07   r14: ffff83084abb7fff</blockquote>
                            <blockquote class="gmail_quote"
                              style="margin:0px 0px 0px
                              0.8ex;border-left:1px solid
                              rgb(204,204,204);padding-left:1ex">(XEN)
                              r15: ffff82d08062ad80   cr0:
                              000000008005003b   cr4: 00000000003526e0</blockquote>
                            <blockquote class="gmail_quote"
                              style="margin:0px 0px 0px
                              0.8ex;border-left:1px solid
                              rgb(204,204,204);padding-left:1ex">(XEN)
                              cr3: 00000003426f3000   cr2:
                              00007fc3c21d4000</blockquote>
                            <blockquote class="gmail_quote"
                              style="margin:0px 0px 0px
                              0.8ex;border-left:1px solid
                              rgb(204,204,204);padding-left:1ex">(XEN)
                              ds: 0000   es: 0000   fs: 0000   gs: 0000 
                               ss: e010   cs: e008</blockquote>
                            <blockquote class="gmail_quote"
                              style="margin:0px 0px 0px
                              0.8ex;border-left:1px solid
                              rgb(204,204,204);padding-left:1ex">(XEN)
                              Xen code around &lt;ffff82d08024139d&gt;
                              (mcsched.c#shscan_timer_fn+<wbr>0xd/0x180):</blockquote>
                            <blockquote class="gmail_quote"
                              style="margin:0px 0px 0px
                              0.8ex;border-left:1px solid
                              rgb(204,204,204);padding-left:1ex">(XEN) 
                              00 00 41 55 41 54 55 53 &lt;0f&gt; 32 4c
                              8d 05 0a 79 11 00 48 8d 0d 91 45 14 00</blockquote>
                          </blockquote>
                        </div>
                      </div>
                    </div>
                  </blockquote>
                  <br>
                </span> This is a rdmsr(), not rdmsr_safe(), which is
                why you are crashing.<br>
                <br>
                Irrespective of that, 0x412e isn't an MSR which exists
                on any real hardware, so I'm not sure what other result
                you were expecting.<span class="gmail-HOEnZb"><font
                    color="#888888"><br>
                    <br>
                    ~Andrew<br>
                  </font></span></div>
            </blockquote>
          </div>
          <br>
        </div>
        <div class="gmail_extra">Thanks for your answer, Andrew.</div>
        <div class="gmail_extra"><br>
        </div>
        <div class="gmail_extra">Actually, I intended to get the number
          of cache-misses from msr and 
          <span
style="color:rgb(34,34,34);font-family:arial,sans-serif;font-size:small;font-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:initial;float:none;display:inline">according
            to<span> </span></span><font
style="color:rgb(34,34,34);font-size:small;font-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:initial"
            face="arial, helvetica, sans-serif">"<i><span
                style="font-size:11pt" lang="en-US">Figure<span> </span></span><span
                style="font-size:11pt" lang="en-US">18</span></i><span
              style="font-size:11pt" lang="en-US"><i>-1 Layout of
                IA32_PERFEVTSELx MSRs in <span
style="color:rgb(34,34,34);font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:initial;font-size:11pt"
                  lang="ko">Intel</span><span
style="color:rgb(34,34,34);font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:initial;font-size:11pt"
                  lang="en-US">® 64 and IA-32 Architectures Software
                  Developer’s Manual Volume 3B: System Programming Guide</span></i><span
style="color:rgb(34,34,34);font-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:initial;font-size:11pt"
                lang="en-US">"</span></span>,</font>
        </div>
        <div class="gmail_extra"><font
style="color:rgb(34,34,34);font-size:small;font-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:initial"
            face="arial, helvetica, sans-serif">it can be achieved by
            "0x412e":</font></div>
        <div class="gmail_extra"><br>
        </div>
        <div class="gmail_extra">
          <div style="direction:ltr">
            <table valign="top"
style="direction:ltr;border-collapse:collapse;border-style:solid;border-color:rgb(163,163,163);border-width:1pt"
              border="1" cellspacing="0" cellpadding="0">
              <tbody>
                <tr>
                  <td
style="border-style:solid;border-color:rgb(163,163,163);border-width:1pt;vertical-align:top;width:1.2895in;padding:4pt">
                    <p
                      style="margin:0in;font-family:&quot;\00b9d1\00c740
\00ace0\00b515&quot;;font-size:11pt;color:black;text-align:center"><span
                        style="font-weight:bold">Bit Position</span></p>
                    <p
                      style="margin:0in;font-family:&quot;\00b9d1\00c740
\00ace0\00b515&quot;;font-size:11pt;color:black;text-align:center"><span
                        style="font-weight:bold">CPUID.AH.EBX</span></p>
                  </td>
                  <td
style="border-style:solid;border-color:rgb(163,163,163);border-width:1pt;vertical-align:top;width:2.0916in;padding:4pt">
                    <p
                      style="margin:0in;font-family:&quot;\00b9d1\00c740
\00ace0\00b515&quot;;font-size:11pt;color:black;text-align:center"><span
                        style="font-weight:bold">Event Name</span></p>
                  </td>
                  <td
style="border-style:solid;border-color:rgb(163,163,163);border-width:1pt;vertical-align:top;width:0.7381in;padding:4pt">
                    <p
                      style="margin:0in;font-family:&quot;\00b9d1\00c740
\00ace0\00b515&quot;;font-size:11pt;color:black;text-align:center"><span
                        style="font-weight:bold">UMask</span></p>
                  </td>
                  <td
style="border-style:solid;border-color:rgb(163,163,163);border-width:1pt;vertical-align:top;width:1.0402in;padding:4pt">
                    <p
                      style="margin:0in;font-family:&quot;\00b9d1\00c740
\00ace0\00b515&quot;;font-size:11pt;color:black;text-align:center"><span
                        style="font-weight:bold">Event Select</span></p>
                  </td>
                </tr>
                <tr>
                  <td
style="border-style:solid;border-color:rgb(163,163,163);border-width:1pt;vertical-align:top;width:1.2701in;padding:4pt">
                    <p
                      style="margin:0in;font-family:&quot;\00b9d1\00c740
\00ace0\00b515&quot;;font-size:11pt;color:black;text-align:center">0</p>
                  </td>
                  <td
style="border-style:solid;border-color:rgb(163,163,163);border-width:1pt;vertical-align:top;width:2.0916in;padding:4pt">
                    <p
                      style="margin:0in;font-family:&quot;\00b9d1\00c740
\00ace0\00b515&quot;;font-size:11pt;color:black;text-align:center">UnHalted
                      Core Cycles</p>
                  </td>
                  <td
style="border-style:solid;border-color:rgb(163,163,163);border-width:1pt;vertical-align:top;width:0.7187in;padding:4pt">
                    <p
                      style="margin:0in;font-family:&quot;\00b9d1\00c740
\00ace0\00b515&quot;;font-size:11pt;color:black;text-align:center">00H</p>
                  </td>
                  <td
style="border-style:solid;border-color:rgb(163,163,163);border-width:1pt;vertical-align:top;width:0.9368in;padding:4pt">
                    <p
                      style="margin:0in;font-family:&quot;\00b9d1\00c740
\00ace0\00b515&quot;;font-size:11pt;color:black;text-align:center">3CH</p>
                  </td>
                </tr>
                <tr>
                  <td
style="border-style:solid;border-color:rgb(163,163,163);border-width:1pt;vertical-align:top;width:1.2701in;padding:4pt">
                    <p
                      style="margin:0in;font-family:&quot;\00b9d1\00c740
\00ace0\00b515&quot;;font-size:11pt;color:black;text-align:center">1</p>
                  </td>
                  <td
style="border-style:solid;border-color:rgb(163,163,163);border-width:1pt;vertical-align:top;width:2.0916in;padding:4pt">
                    <p
                      style="margin:0in;font-family:&quot;\00b9d1\00c740
\00ace0\00b515&quot;;font-size:11pt;color:black;text-align:center">Instruction
                      Retired</p>
                  </td>
                  <td
style="border-style:solid;border-color:rgb(163,163,163);border-width:1pt;vertical-align:top;width:0.7187in;padding:4pt">
                    <p
                      style="margin:0in;font-family:&quot;\00b9d1\00c740
\00ace0\00b515&quot;;font-size:11pt;color:black;text-align:center">00H</p>
                  </td>
                  <td
style="border-style:solid;border-color:rgb(163,163,163);border-width:1pt;vertical-align:top;width:0.9368in;padding:4pt">
                    <p
                      style="margin:0in;font-family:&quot;\00b9d1\00c740
\00ace0\00b515&quot;;font-size:11pt;color:black;text-align:center">C0H</p>
                  </td>
                </tr>
                <tr>
                  <td
style="border-style:solid;border-color:rgb(163,163,163);border-width:1pt;vertical-align:top;width:1.2701in;padding:4pt">
                    <p
                      style="margin:0in;font-family:&quot;\00b9d1\00c740
\00ace0\00b515&quot;;font-size:11pt;color:black;text-align:center">2</p>
                  </td>
                  <td
style="border-style:solid;border-color:rgb(163,163,163);border-width:1pt;vertical-align:top;width:2.1111in;padding:4pt">
                    <p
                      style="margin:0in;font-family:&quot;\00b9d1\00c740
\00ace0\00b515&quot;;font-size:11pt;color:black;text-align:center">UnHalted
                      Reference Cycles</p>
                  </td>
                  <td
style="border-style:solid;border-color:rgb(163,163,163);border-width:1pt;vertical-align:top;width:0.7187in;padding:4pt">
                    <p
                      style="margin:0in;font-family:&quot;\00b9d1\00c740
\00ace0\00b515&quot;;font-size:11pt;color:black;text-align:center">01H</p>
                  </td>
                  <td
style="border-style:solid;border-color:rgb(163,163,163);border-width:1pt;vertical-align:top;width:0.9368in;padding:4pt">
                    <p
                      style="margin:0in;font-family:&quot;\00b9d1\00c740
\00ace0\00b515&quot;;font-size:11pt;color:black;text-align:center">3CH</p>
                  </td>
                </tr>
                <tr>
                  <td
style="border-style:solid;border-color:rgb(163,163,163);border-width:1pt;vertical-align:top;width:1.2701in;padding:4pt">
                    <p
                      style="margin:0in;font-family:&quot;\00b9d1\00c740
\00ace0\00b515&quot;;font-size:11pt;color:black;text-align:center">3</p>
                  </td>
                  <td
style="border-style:solid;border-color:rgb(163,163,163);border-width:1pt;vertical-align:top;width:2.0916in;padding:4pt">
                    <p
                      style="margin:0in;font-family:&quot;\00b9d1\00c740
\00ace0\00b515&quot;;font-size:11pt;color:black;text-align:center">LLC
                      Reference</p>
                  </td>
                  <td
style="border-style:solid;border-color:rgb(163,163,163);border-width:1pt;vertical-align:top;width:0.7187in;padding:4pt">
                    <p
                      style="margin:0in;font-family:&quot;\00b9d1\00c740
\00ace0\00b515&quot;;font-size:11pt;color:black;text-align:center">4FH</p>
                  </td>
                  <td
style="border-style:solid;border-color:rgb(163,163,163);border-width:1pt;vertical-align:top;width:0.9368in;padding:4pt">
                    <p
                      style="margin:0in;font-family:&quot;\00b9d1\00c740
\00ace0\00b515&quot;;font-size:11pt;color:black;text-align:center">2EH</p>
                  </td>
                </tr>
                <tr>
                  <td
style="border-style:solid;border-color:rgb(163,163,163);border-width:1pt;vertical-align:top;width:1.2701in;padding:4pt">
                    <p
                      style="margin:0in;font-family:&quot;\00b9d1\00c740
\00ace0\00b515&quot;;font-size:11pt;text-align:center"><b><font
                          color="#ff0000">4</font></b></p>
                  </td>
                  <td
style="border-style:solid;border-color:rgb(163,163,163);border-width:1pt;vertical-align:top;width:2.0916in;padding:4pt">
                    <p
                      style="margin:0in;font-family:&quot;\00b9d1\00c740
\00ace0\00b515&quot;;font-size:11pt;text-align:center"><b><font
                          color="#ff0000">LLC Misses</font></b></p>
                  </td>
                  <td
style="border-style:solid;border-color:rgb(163,163,163);border-width:1pt;vertical-align:top;width:0.7187in;padding:4pt">
                    <p
                      style="margin:0in;font-family:&quot;\00b9d1\00c740
\00ace0\00b515&quot;;font-size:11pt;text-align:center"><b><font
                          color="#ff0000">41H</font></b></p>
                  </td>
                  <td
style="border-style:solid;border-color:rgb(163,163,163);border-width:1pt;vertical-align:top;width:0.9368in;padding:4pt">
                    <p
                      style="margin:0in;font-family:&quot;\00b9d1\00c740
\00ace0\00b515&quot;;font-size:11pt;text-align:center"><b><font
                          color="#ff0000">2EH</font></b></p>
                  </td>
                </tr>
                <tr>
                  <td
style="border-style:solid;border-color:rgb(163,163,163);border-width:1pt;vertical-align:top;width:1.2701in;padding:4pt">
                    <p
                      style="margin:0in;font-family:&quot;\00b9d1\00c740
\00ace0\00b515&quot;;font-size:11pt;color:black;text-align:center">5</p>
                  </td>
                  <td
style="border-style:solid;border-color:rgb(163,163,163);border-width:1pt;vertical-align:top;width:2.1034in;padding:4pt">
                    <p
                      style="margin:0in;font-family:&quot;\00b9d1\00c740
\00ace0\00b515&quot;;font-size:11pt;color:black;text-align:center">Branch
                      Instruction Retired</p>
                  </td>
                  <td
style="border-style:solid;border-color:rgb(163,163,163);border-width:1pt;vertical-align:top;width:0.7187in;padding:4pt">
                    <p
                      style="margin:0in;font-family:&quot;\00b9d1\00c740
\00ace0\00b515&quot;;font-size:11pt;color:black;text-align:center">00H</p>
                  </td>
                  <td
style="border-style:solid;border-color:rgb(163,163,163);border-width:1pt;vertical-align:top;width:0.9368in;padding:4pt">
                    <p
                      style="margin:0in;font-family:&quot;\00b9d1\00c740
\00ace0\00b515&quot;;font-size:11pt;color:black;text-align:center">C4H</p>
                  </td>
                </tr>
                <tr>
                  <td
style="border-style:solid;border-color:rgb(163,163,163);border-width:1pt;vertical-align:top;width:1.2701in;padding:4pt">
                    <p
                      style="margin:0in;font-family:&quot;\00b9d1\00c740
\00ace0\00b515&quot;;font-size:11pt;color:black;text-align:center">6</p>
                  </td>
                  <td
style="border-style:solid;border-color:rgb(163,163,163);border-width:1pt;vertical-align:top;width:2.0916in;padding:4pt">
                    <p
                      style="margin:0in;font-family:&quot;\00b9d1\00c740
\00ace0\00b515&quot;;font-size:11pt;color:black;text-align:center">Branch
                      Misses Retired</p>
                  </td>
                  <td
style="border-style:solid;border-color:rgb(163,163,163);border-width:1pt;vertical-align:top;width:0.7187in;padding:4pt">
                    <p
                      style="margin:0in;font-family:&quot;\00b9d1\00c740
\00ace0\00b515&quot;;font-size:11pt;color:black;text-align:center">00H</p>
                  </td>
                  <td
style="border-style:solid;border-color:rgb(163,163,163);border-width:1pt;vertical-align:top;width:0.9368in;padding:4pt">
                    <p
                      style="margin:0in;font-family:&quot;\00b9d1\00c740
\00ace0\00b515&quot;;font-size:11pt;color:black;text-align:center">C5H</p>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
          <br>
        </div>
        <div class="gmail_extra">I also tried to do that w/ rdmsr_safe()
          but, I failed to read msr.</div>
        <div class="gmail_extra">Through the macro that returns a
          non-zero value, it was easy to see that reading msr failed:</div>
        <div class="gmail_extra"><br>
        </div>
        <div class="gmail_extra">
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">if ( rdmsr_safe(0x412e,
            ret) ) {<br>
                printk("cannot read msr!!!\n");  <br>
            } else {<br>
                printk("rdmsr: %lu\n", ret);<br>
            }</blockquote>
          <div><br>
          </div>
          <div> I cannot understand why you said "<span
style="color:rgb(34,34,34);font-family:arial,sans-serif;font-size:small;font-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:initial;float:none;display:inline">0x412e
              isn't an MSR which exists on any real hardware" so, is it
              impossible to get the number of cache-misses by using msr
              ??</span></div>
        </div>
      </div>
    </blockquote>
    <br>
    The bit you highlight above are values you need to write into one of
    the PERFEVTSELx MSRs, to cause hardware to track that event.  It
    does not mean MSR by that index exists.<br>
    <br>
    ~Andrew<br>
  </body>
</html>

--------------FD42BBEF795AF9DC074AFEDC--


--===============0112835176097928335==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0112835176097928335==--
