From: Minjun Hong <nickeysgo@gmail.com>
Subject: Re: Is there any way to read msr in hypervisor code?
Date: Wed, 28 Feb 2018 10:25:25 +0900
Message-ID: <CAFX_q-FtHADtSns6Axfp1m+W8ADOZzwo1O9r2ysq9Jmnfsw8aQ@mail.gmail.com>
References: <CAFX_q-F=CkRYyH5BgWxNig9G5XFQOKNgwAKoCsNDPO218a1bdQ@mail.gmail.com>
 <fbea2750-f4a6-d72b-8738-4751f0fbf45e@citrix.com>
 <CAFX_q-HtYz=h-kFr_Jbp1WXFaXaa1L1t-zCMY-e1amQNeYq0Rw@mail.gmail.com>
 <643b7122-c469-dc68-9298-b69a0dd9df4d@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4010647258600717910=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <643b7122-c469-dc68-9298-b69a0dd9df4d@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

--===============4010647258600717910==
Content-Type: multipart/alternative; boundary="94eb2c117a682d8c4505663b9e54"

--94eb2c117a682d8c4505663b9e54
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ah! Now I understand what you said.
Thank you so much, Andrew.

BTW, isn't it possible to use PERFEVTSELx MSR in Xen directly? I eagerly
want to achieve the number of cache-misses.

On Tue, Feb 27, 2018 at 11:03 PM, Andrew Cooper <andrew.cooper3@citrix.com>
wrote:

> On 27/02/18 12:35, Minjun Hong wrote:
>
> On Tue, Feb 27, 2018 at 7:00 PM, Andrew Cooper <andrew.cooper3@citrix.com=
>
> wrote:
>
>> On 27/02/2018 09:37, Minjun Hong wrote:
>>
>> Hello, I've tried to read msr in hypervisor code:
>>
>> uint64_t reg;
>>
>> rdmsr_safe(0x412e, ret);
>>
>>
>> But, I all failed to read it because the hypervisor is running in ring-1
>> CPL as I did googling.
>>
>>
>> Xen runs in ring 0, root mode.  Forget terms like "ring -1" because they
>> are not accurate, and not a helpful description of what is going on.
>>
>> When I accessed msr, the crash log is below:
>>
>>
>> (XEN) ----[ Xen-4.9.0  x86_64  debug=3Dn   Not tainted ]----
>>>
>>> (XEN) CPU:    7
>>>
>>> (XEN) RIP:    e008:[<ffff82d08024139d>] mcsched.c#shscan_timer_fn+0xd/
>>>> 0x180
>>>
>>> (XEN) RFLAGS: 0000000000010206   CONTEXT: hypervisor
>>>
>>> (XEN) rax: ffff83084abfe028   rbx: ffff83084abfe300   rcx:
>>>> 000000000000412e
>>>
>>> (XEN) rdx: ffff83084abb7fff   rsi: ffff82d080632f00   rdi:
>>>> 0000000000000000
>>>
>>> (XEN) rbp: ffff82d080241390   rsp: ffff83084abb7e30   r8:
>>>> ffff830868d4bdc0
>>>
>>> (XEN) r9:  0000000000000005   r10: 0000012da75b50a5   r11:
>>>> ffff8300782f3060
>>>
>>> (XEN) r12: 0000000000000000   r13: 0000012d9f9d6e07   r14:
>>>> ffff83084abb7fff
>>>
>>> (XEN) r15: ffff82d08062ad80   cr0: 000000008005003b   cr4:
>>>> 00000000003526e0
>>>
>>> (XEN) cr3: 00000003426f3000   cr2: 00007fc3c21d4000
>>>
>>> (XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: e010   cs: e008
>>>
>>> (XEN) Xen code around <ffff82d08024139d> (mcsched.c#shscan_timer_fn+0xd
>>>> /0x180):
>>>
>>> (XEN)  00 00 41 55 41 54 55 53 <0f> 32 4c 8d 05 0a 79 11 00 48 8d 0d 91
>>>> 45 14 00
>>>
>>>
>> This is a rdmsr(), not rdmsr_safe(), which is why you are crashing.
>>
>> Irrespective of that, 0x412e isn't an MSR which exists on any real
>> hardware, so I'm not sure what other result you were expecting.
>>
>> ~Andrew
>>
>
> Thanks for your answer, Andrew.
>
> Actually, I intended to get the number of cache-misses from msr and  acco=
rding
> to "*Figure 18**-1 Layout of IA32_PERFEVTSELx MSRs in Intel=C2=AE 64 and =
IA-32
> Architectures Software Developer=E2=80=99s Manual Volume 3B: System Progr=
amming
> Guide*",
> it can be achieved by "0x412e":
>
> Bit Position
>
> CPUID.AH.EBX
>
> Event Name
>
> UMask
>
> Event Select
>
> 0
>
> UnHalted Core Cycles
>
> 00H
>
> 3CH
>
> 1
>
> Instruction Retired
>
> 00H
>
> C0H
>
> 2
>
> UnHalted Reference Cycles
>
> 01H
>
> 3CH
>
> 3
>
> LLC Reference
>
> 4FH
>
> 2EH
>
> *4*
>
> *LLC Misses*
>
> *41H*
>
> *2EH*
>
> 5
>
> Branch Instruction Retired
>
> 00H
>
> C4H
>
> 6
>
> Branch Misses Retired
>
> 00H
>
> C5H
>
> I also tried to do that w/ rdmsr_safe() but, I failed to read msr.
> Through the macro that returns a non-zero value, it was easy to see that
> reading msr failed:
>
> if ( rdmsr_safe(0x412e, ret) ) {
>>     printk("cannot read msr!!!\n");
>> } else {
>>     printk("rdmsr: %lu\n", ret);
>> }
>
>
>  I cannot understand why you said "0x412e isn't an MSR which exists on
> any real hardware" so, is it impossible to get the number of cache-misses
> by using msr ??
>
>
> The bit you highlight above are values you need to write into one of the
> PERFEVTSELx MSRs, to cause hardware to track that event.  It does not mea=
n
> MSR by that index exists.
>
> ~Andrew
>

--94eb2c117a682d8c4505663b9e54
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Ah! Now I understand what you said.<div>Thank you so much,=
 Andrew.</div><div><br></div><div>BTW, isn&#39;t it possible to use PERFEVT=
SELx MSR in Xen directly? I eagerly want to achieve the number of cache-mis=
ses.</div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">O=
n Tue, Feb 27, 2018 at 11:03 PM, Andrew Cooper <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:andrew.cooper3@citrix.com" target=3D"_blank">andrew.cooper3@cit=
rix.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
 =20
   =20
 =20
  <div text=3D"#000000" bgcolor=3D"#FFFFFF"><div><div class=3D"h5">
    <div class=3D"m_-5971452353598360849moz-cite-prefix">On 27/02/18 12:35,=
 Minjun Hong wrote:<br>
    </div>
    <blockquote type=3D"cite">
     =20
      <div dir=3D"ltr">
        <div class=3D"gmail_extra">
          <div class=3D"gmail_quote">On Tue, Feb 27, 2018 at 7:00 PM,
            Andrew Cooper <span dir=3D"ltr">&lt;<a href=3D"mailto:andrew.co=
oper3@citrix.com" target=3D"_blank">andrew.cooper3@citrix.com</a>&gt;</span=
>
            wrote:<br>
            <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
              <div bgcolor=3D"#FFFFFF"><span class=3D"m_-597145235359836084=
9gmail-">
                  <div class=3D"m_-5971452353598360849gmail-m_-301104682790=
0447549moz-cite-prefix">On
                    27/02/2018 09:37, Minjun Hong wrote:<br>
                  </div>
                  <blockquote type=3D"cite">
                    <div dir=3D"ltr">Hello, I&#39;ve tried to read msr in
                      hypervisor code:
                      <div><br>
                      </div>
                      <div>
                        <blockquote class=3D"gmail_quote" style=3D"color:rg=
b(34,34,34);font-family:arial,sans-serif;font-size:small;font-style:normal;=
font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;lett=
er-spacing:normal;text-align:start;text-indent:0px;text-transform:none;whit=
e-space:normal;word-spacing:0px;text-decoration-style:initial;text-decorati=
on-color:initial;margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">uint64_t
                          reg;=C2=A0=C2=A0</blockquote>
                        <blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">r=
dmsr_safe(0x412e,
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
                </span> Xen runs in ring 0, root mode.=C2=A0 Forget terms
                like &quot;ring -1&quot; because they are not accurate, and=
 not a
                helpful description of what is going on.<span class=3D"m_-5=
971452353598360849gmail-"><br>
                  <br>
                  <blockquote type=3D"cite">
                    <div dir=3D"ltr">
                      <div>
                        <div>When I accessed msr, the crash log is
                          below:</div>
                        <div><br>
                        </div>
                        <div><br>
                        </div>
                        <div>
                          <blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>
                            <blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">(XEN)
                              ----[ Xen-4.9.0=C2=A0 x86_64=C2=A0 debug=3Dn=
=C2=A0 =C2=A0Not
                              tainted ]----</blockquote>
                            <blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">(XEN)
                              CPU:=C2=A0 =C2=A0 7</blockquote>
                            <blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">(XEN)
                              RIP:=C2=A0 =C2=A0 e008:[&lt;ffff82d08024139d&=
gt;]
                              mcsched.c#shscan_timer_fn+0xd/<wbr>0x180</blo=
ckquote>
                            <blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">(XEN)
                              RFLAGS: 0000000000010206=C2=A0 =C2=A0CONTEXT:
                              hypervisor</blockquote>
                            <blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">(XEN)
                              rax: ffff83084abfe028=C2=A0 =C2=A0rbx:
                              ffff83084abfe300=C2=A0 =C2=A0rcx: 00000000000=
0412e</blockquote>
                            <blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">(XEN)
                              rdx: ffff83084abb7fff=C2=A0 =C2=A0rsi:
                              ffff82d080632f00=C2=A0 =C2=A0rdi: 00000000000=
00000</blockquote>
                            <blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">(XEN)
                              rbp: ffff82d080241390=C2=A0 =C2=A0rsp:
                              ffff83084abb7e30=C2=A0 =C2=A0r8:=C2=A0 ffff83=
0868d4bdc0</blockquote>
                            <blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">(XEN)
                              r9:=C2=A0 0000000000000005=C2=A0 =C2=A0r10:
                              0000012da75b50a5=C2=A0 =C2=A0r11: ffff8300782=
f3060</blockquote>
                            <blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">(XEN)
                              r12: 0000000000000000=C2=A0 =C2=A0r13:
                              0000012d9f9d6e07=C2=A0 =C2=A0r14: ffff83084ab=
b7fff</blockquote>
                            <blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">(XEN)
                              r15: ffff82d08062ad80=C2=A0 =C2=A0cr0:
                              000000008005003b=C2=A0 =C2=A0cr4: 00000000003=
526e0</blockquote>
                            <blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">(XEN)
                              cr3: 00000003426f3000=C2=A0 =C2=A0cr2:
                              00007fc3c21d4000</blockquote>
                            <blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">(XEN)
                              ds: 0000=C2=A0 =C2=A0es: 0000=C2=A0 =C2=A0fs:=
 0000=C2=A0 =C2=A0gs: 0000=C2=A0
                              =C2=A0ss: e010=C2=A0 =C2=A0cs: e008</blockquo=
te>
                            <blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">(XEN)
                              Xen code around &lt;ffff82d08024139d&gt;
                              (mcsched.c#shscan_timer_fn+0xd<wbr>/0x180):</=
blockquote>
                            <blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">(XEN)=C2=A0
                              00 00 41 55 41 54 55 53 &lt;0f&gt; 32 4c
                              8d 05 0a 79 11 00 48 8d 0d 91 45 14 00</block=
quote>
                          </blockquote>
                        </div>
                      </div>
                    </div>
                  </blockquote>
                  <br>
                </span> This is a rdmsr(), not rdmsr_safe(), which is
                why you are crashing.<br>
                <br>
                Irrespective of that, 0x412e isn&#39;t an MSR which exists
                on any real hardware, so I&#39;m not sure what other result
                you were expecting.<span class=3D"m_-5971452353598360849gma=
il-HOEnZb"><font color=3D"#888888"><br>
                    <br>
                    ~Andrew<br>
                  </font></span></div>
            </blockquote>
          </div>
          <br>
        </div>
        <div class=3D"gmail_extra">Thanks for your answer, Andrew.</div>
        <div class=3D"gmail_extra"><br>
        </div>
        <div class=3D"gmail_extra">Actually, I intended to get the number
          of cache-misses from msr and=C2=A0
          <span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;f=
ont-size:small;font-style:normal;font-variant-ligatures:normal;font-variant=
-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-in=
dent:0px;text-transform:none;white-space:normal;word-spacing:0px;background=
-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-color=
:initial;float:none;display:inline">according
            to<span>=C2=A0</span></span><font style=3D"color:rgb(34,34,34);=
font-size:small;font-style:normal;font-variant-ligatures:normal;font-varian=
t-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-i=
ndent:0px;text-transform:none;white-space:normal;word-spacing:0px;backgroun=
d-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-colo=
r:initial" face=3D"arial, helvetica, sans-serif">&quot;<i><span style=3D"fo=
nt-size:11pt" lang=3D"en-US">Figure<span>=C2=A0</span></span><span style=3D=
"font-size:11pt" lang=3D"en-US">18</span></i><span style=3D"font-size:11pt"=
 lang=3D"en-US"><i>-1 Layout of
                IA32_PERFEVTSELx MSRs in=C2=A0<span style=3D"color:rgb(34,3=
4,34);font-variant-ligatures:normal;font-variant-caps:normal;font-weight:40=
0;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:non=
e;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);tex=
t-decoration-style:initial;text-decoration-color:initial;font-size:11pt" la=
ng=3D"ko">Intel</span><span style=3D"color:rgb(34,34,34);font-variant-ligat=
ures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;=
text-align:start;text-indent:0px;text-transform:none;white-space:normal;wor=
d-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:initi=
al;text-decoration-color:initial;font-size:11pt" lang=3D"en-US">=C2=AE 64 a=
nd IA-32 Architectures Software
                  Developer=E2=80=99s Manual Volume 3B: System Programming =
Guide</span></i><span style=3D"color:rgb(34,34,34);font-style:normal;font-v=
ariant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spa=
cing:normal;text-align:start;text-indent:0px;text-transform:none;white-spac=
e:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration=
-style:initial;text-decoration-color:initial;font-size:11pt" lang=3D"en-US"=
>&quot;</span></span>,</font>
        </div>
        <div class=3D"gmail_extra"><font style=3D"color:rgb(34,34,34);font-=
size:small;font-style:normal;font-variant-ligatures:normal;font-variant-cap=
s:normal;font-weight:400;letter-spacing:normal;text-align:start;text-indent=
:0px;text-transform:none;white-space:normal;word-spacing:0px;background-col=
or:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:ini=
tial" face=3D"arial, helvetica, sans-serif">it can be achieved by
            &quot;0x412e&quot;:</font></div>
        <div class=3D"gmail_extra"><br>
        </div>
        <div class=3D"gmail_extra">
          <div style=3D"direction:ltr">
            <table valign=3D"top" style=3D"direction:ltr;border-collapse:co=
llapse;border-style:solid;border-color:rgb(163,163,163);border-width:1pt" b=
order=3D"1" cellspacing=3D"0" cellpadding=3D"0">
              <tbody>
                <tr>
                  <td style=3D"border-style:solid;border-color:rgb(163,163,=
163);border-width:1pt;vertical-align:top;width:1.2895in;padding:4pt">
                    <p style=3D"margin:0in;font-family:&quot;\00b9d1\00c740=
\00ace0\00b515&quot;;font-size:11pt;color:black;text-align:center"><span st=
yle=3D"font-weight:bold">Bit Position</span></p>
                    <p style=3D"margin:0in;font-family:&quot;\00b9d1\00c740=
\00ace0\00b515&quot;;font-size:11pt;color:black;text-align:center"><span st=
yle=3D"font-weight:bold">CPUID.AH.EBX</span></p>
                  </td>
                  <td style=3D"border-style:solid;border-color:rgb(163,163,=
163);border-width:1pt;vertical-align:top;width:2.0916in;padding:4pt">
                    <p style=3D"margin:0in;font-family:&quot;\00b9d1\00c740=
\00ace0\00b515&quot;;font-size:11pt;color:black;text-align:center"><span st=
yle=3D"font-weight:bold">Event Name</span></p>
                  </td>
                  <td style=3D"border-style:solid;border-color:rgb(163,163,=
163);border-width:1pt;vertical-align:top;width:0.7381in;padding:4pt">
                    <p style=3D"margin:0in;font-family:&quot;\00b9d1\00c740=
\00ace0\00b515&quot;;font-size:11pt;color:black;text-align:center"><span st=
yle=3D"font-weight:bold">UMask</span></p>
                  </td>
                  <td style=3D"border-style:solid;border-color:rgb(163,163,=
163);border-width:1pt;vertical-align:top;width:1.0402in;padding:4pt">
                    <p style=3D"margin:0in;font-family:&quot;\00b9d1\00c740=
\00ace0\00b515&quot;;font-size:11pt;color:black;text-align:center"><span st=
yle=3D"font-weight:bold">Event Select</span></p>
                  </td>
                </tr>
                <tr>
                  <td style=3D"border-style:solid;border-color:rgb(163,163,=
163);border-width:1pt;vertical-align:top;width:1.2701in;padding:4pt">
                    <p style=3D"margin:0in;font-family:&quot;\00b9d1\00c740=
\00ace0\00b515&quot;;font-size:11pt;color:black;text-align:center">0</p>
                  </td>
                  <td style=3D"border-style:solid;border-color:rgb(163,163,=
163);border-width:1pt;vertical-align:top;width:2.0916in;padding:4pt">
                    <p style=3D"margin:0in;font-family:&quot;\00b9d1\00c740=
\00ace0\00b515&quot;;font-size:11pt;color:black;text-align:center">UnHalted
                      Core Cycles</p>
                  </td>
                  <td style=3D"border-style:solid;border-color:rgb(163,163,=
163);border-width:1pt;vertical-align:top;width:0.7187in;padding:4pt">
                    <p style=3D"margin:0in;font-family:&quot;\00b9d1\00c740=
\00ace0\00b515&quot;;font-size:11pt;color:black;text-align:center">00H</p>
                  </td>
                  <td style=3D"border-style:solid;border-color:rgb(163,163,=
163);border-width:1pt;vertical-align:top;width:0.9368in;padding:4pt">
                    <p style=3D"margin:0in;font-family:&quot;\00b9d1\00c740=
\00ace0\00b515&quot;;font-size:11pt;color:black;text-align:center">3CH</p>
                  </td>
                </tr>
                <tr>
                  <td style=3D"border-style:solid;border-color:rgb(163,163,=
163);border-width:1pt;vertical-align:top;width:1.2701in;padding:4pt">
                    <p style=3D"margin:0in;font-family:&quot;\00b9d1\00c740=
\00ace0\00b515&quot;;font-size:11pt;color:black;text-align:center">1</p>
                  </td>
                  <td style=3D"border-style:solid;border-color:rgb(163,163,=
163);border-width:1pt;vertical-align:top;width:2.0916in;padding:4pt">
                    <p style=3D"margin:0in;font-family:&quot;\00b9d1\00c740=
\00ace0\00b515&quot;;font-size:11pt;color:black;text-align:center">Instruct=
ion
                      Retired</p>
                  </td>
                  <td style=3D"border-style:solid;border-color:rgb(163,163,=
163);border-width:1pt;vertical-align:top;width:0.7187in;padding:4pt">
                    <p style=3D"margin:0in;font-family:&quot;\00b9d1\00c740=
\00ace0\00b515&quot;;font-size:11pt;color:black;text-align:center">00H</p>
                  </td>
                  <td style=3D"border-style:solid;border-color:rgb(163,163,=
163);border-width:1pt;vertical-align:top;width:0.9368in;padding:4pt">
                    <p style=3D"margin:0in;font-family:&quot;\00b9d1\00c740=
\00ace0\00b515&quot;;font-size:11pt;color:black;text-align:center">C0H</p>
                  </td>
                </tr>
                <tr>
                  <td style=3D"border-style:solid;border-color:rgb(163,163,=
163);border-width:1pt;vertical-align:top;width:1.2701in;padding:4pt">
                    <p style=3D"margin:0in;font-family:&quot;\00b9d1\00c740=
\00ace0\00b515&quot;;font-size:11pt;color:black;text-align:center">2</p>
                  </td>
                  <td style=3D"border-style:solid;border-color:rgb(163,163,=
163);border-width:1pt;vertical-align:top;width:2.1111in;padding:4pt">
                    <p style=3D"margin:0in;font-family:&quot;\00b9d1\00c740=
\00ace0\00b515&quot;;font-size:11pt;color:black;text-align:center">UnHalted
                      Reference Cycles</p>
                  </td>
                  <td style=3D"border-style:solid;border-color:rgb(163,163,=
163);border-width:1pt;vertical-align:top;width:0.7187in;padding:4pt">
                    <p style=3D"margin:0in;font-family:&quot;\00b9d1\00c740=
\00ace0\00b515&quot;;font-size:11pt;color:black;text-align:center">01H</p>
                  </td>
                  <td style=3D"border-style:solid;border-color:rgb(163,163,=
163);border-width:1pt;vertical-align:top;width:0.9368in;padding:4pt">
                    <p style=3D"margin:0in;font-family:&quot;\00b9d1\00c740=
\00ace0\00b515&quot;;font-size:11pt;color:black;text-align:center">3CH</p>
                  </td>
                </tr>
                <tr>
                  <td style=3D"border-style:solid;border-color:rgb(163,163,=
163);border-width:1pt;vertical-align:top;width:1.2701in;padding:4pt">
                    <p style=3D"margin:0in;font-family:&quot;\00b9d1\00c740=
\00ace0\00b515&quot;;font-size:11pt;color:black;text-align:center">3</p>
                  </td>
                  <td style=3D"border-style:solid;border-color:rgb(163,163,=
163);border-width:1pt;vertical-align:top;width:2.0916in;padding:4pt">
                    <p style=3D"margin:0in;font-family:&quot;\00b9d1\00c740=
\00ace0\00b515&quot;;font-size:11pt;color:black;text-align:center">LLC
                      Reference</p>
                  </td>
                  <td style=3D"border-style:solid;border-color:rgb(163,163,=
163);border-width:1pt;vertical-align:top;width:0.7187in;padding:4pt">
                    <p style=3D"margin:0in;font-family:&quot;\00b9d1\00c740=
\00ace0\00b515&quot;;font-size:11pt;color:black;text-align:center">4FH</p>
                  </td>
                  <td style=3D"border-style:solid;border-color:rgb(163,163,=
163);border-width:1pt;vertical-align:top;width:0.9368in;padding:4pt">
                    <p style=3D"margin:0in;font-family:&quot;\00b9d1\00c740=
\00ace0\00b515&quot;;font-size:11pt;color:black;text-align:center">2EH</p>
                  </td>
                </tr>
                <tr>
                  <td style=3D"border-style:solid;border-color:rgb(163,163,=
163);border-width:1pt;vertical-align:top;width:1.2701in;padding:4pt">
                    <p style=3D"margin:0in;font-family:&quot;\00b9d1\00c740=
\00ace0\00b515&quot;;font-size:11pt;text-align:center"><b><font color=3D"#f=
f0000">4</font></b></p>
                  </td>
                  <td style=3D"border-style:solid;border-color:rgb(163,163,=
163);border-width:1pt;vertical-align:top;width:2.0916in;padding:4pt">
                    <p style=3D"margin:0in;font-family:&quot;\00b9d1\00c740=
\00ace0\00b515&quot;;font-size:11pt;text-align:center"><b><font color=3D"#f=
f0000">LLC Misses</font></b></p>
                  </td>
                  <td style=3D"border-style:solid;border-color:rgb(163,163,=
163);border-width:1pt;vertical-align:top;width:0.7187in;padding:4pt">
                    <p style=3D"margin:0in;font-family:&quot;\00b9d1\00c740=
\00ace0\00b515&quot;;font-size:11pt;text-align:center"><b><font color=3D"#f=
f0000">41H</font></b></p>
                  </td>
                  <td style=3D"border-style:solid;border-color:rgb(163,163,=
163);border-width:1pt;vertical-align:top;width:0.9368in;padding:4pt">
                    <p style=3D"margin:0in;font-family:&quot;\00b9d1\00c740=
\00ace0\00b515&quot;;font-size:11pt;text-align:center"><b><font color=3D"#f=
f0000">2EH</font></b></p>
                  </td>
                </tr>
                <tr>
                  <td style=3D"border-style:solid;border-color:rgb(163,163,=
163);border-width:1pt;vertical-align:top;width:1.2701in;padding:4pt">
                    <p style=3D"margin:0in;font-family:&quot;\00b9d1\00c740=
\00ace0\00b515&quot;;font-size:11pt;color:black;text-align:center">5</p>
                  </td>
                  <td style=3D"border-style:solid;border-color:rgb(163,163,=
163);border-width:1pt;vertical-align:top;width:2.1034in;padding:4pt">
                    <p style=3D"margin:0in;font-family:&quot;\00b9d1\00c740=
\00ace0\00b515&quot;;font-size:11pt;color:black;text-align:center">Branch
                      Instruction Retired</p>
                  </td>
                  <td style=3D"border-style:solid;border-color:rgb(163,163,=
163);border-width:1pt;vertical-align:top;width:0.7187in;padding:4pt">
                    <p style=3D"margin:0in;font-family:&quot;\00b9d1\00c740=
\00ace0\00b515&quot;;font-size:11pt;color:black;text-align:center">00H</p>
                  </td>
                  <td style=3D"border-style:solid;border-color:rgb(163,163,=
163);border-width:1pt;vertical-align:top;width:0.9368in;padding:4pt">
                    <p style=3D"margin:0in;font-family:&quot;\00b9d1\00c740=
\00ace0\00b515&quot;;font-size:11pt;color:black;text-align:center">C4H</p>
                  </td>
                </tr>
                <tr>
                  <td style=3D"border-style:solid;border-color:rgb(163,163,=
163);border-width:1pt;vertical-align:top;width:1.2701in;padding:4pt">
                    <p style=3D"margin:0in;font-family:&quot;\00b9d1\00c740=
\00ace0\00b515&quot;;font-size:11pt;color:black;text-align:center">6</p>
                  </td>
                  <td style=3D"border-style:solid;border-color:rgb(163,163,=
163);border-width:1pt;vertical-align:top;width:2.0916in;padding:4pt">
                    <p style=3D"margin:0in;font-family:&quot;\00b9d1\00c740=
\00ace0\00b515&quot;;font-size:11pt;color:black;text-align:center">Branch
                      Misses Retired</p>
                  </td>
                  <td style=3D"border-style:solid;border-color:rgb(163,163,=
163);border-width:1pt;vertical-align:top;width:0.7187in;padding:4pt">
                    <p style=3D"margin:0in;font-family:&quot;\00b9d1\00c740=
\00ace0\00b515&quot;;font-size:11pt;color:black;text-align:center">00H</p>
                  </td>
                  <td style=3D"border-style:solid;border-color:rgb(163,163,=
163);border-width:1pt;vertical-align:top;width:0.9368in;padding:4pt">
                    <p style=3D"margin:0in;font-family:&quot;\00b9d1\00c740=
\00ace0\00b515&quot;;font-size:11pt;color:black;text-align:center">C5H</p>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
          <br>
        </div>
        <div class=3D"gmail_extra">I also tried to do that w/ rdmsr_safe()
          but, I failed to read msr.</div>
        <div class=3D"gmail_extra">Through the macro that returns a
          non-zero value, it was easy to see that reading msr failed:</div>
        <div class=3D"gmail_extra"><br>
        </div>
        <div class=3D"gmail_extra">
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">if ( rdmsr_safe=
(0x412e,
            ret) ) {<br>
            =C2=A0 =C2=A0 printk(&quot;cannot read msr!!!\n&quot;);=C2=A0=
=C2=A0<br>
            } else {<br>
            =C2=A0 =C2=A0 printk(&quot;rdmsr: %lu\n&quot;, ret);<br>
            }</blockquote>
          <div><br>
          </div>
          <div>=C2=A0I cannot understand why you said &quot;<span style=3D"=
color:rgb(34,34,34);font-family:arial,sans-serif;font-size:small;font-style=
:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:=
400;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:n=
one;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);t=
ext-decoration-style:initial;text-decoration-color:initial;float:none;displ=
ay:inline">0x412e
              isn&#39;t an MSR which exists on any real hardware&quot; so, =
is it
              impossible to get the number of cache-misses by using msr
              ??</span></div>
        </div>
      </div>
    </blockquote>
    <br></div></div>
    The bit you highlight above are values you need to write into one of
    the PERFEVTSELx MSRs, to cause hardware to track that event.=C2=A0 It
    does not mean MSR by that index exists.<span class=3D"HOEnZb"><font col=
or=3D"#888888"><br>
    <br>
    ~Andrew<br>
  </font></span></div>

</blockquote></div><br></div>

--94eb2c117a682d8c4505663b9e54--


--===============4010647258600717910==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4010647258600717910==--
