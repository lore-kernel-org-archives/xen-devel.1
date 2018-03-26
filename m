From: Manish Jaggi <mjaggi@caviumnetworks.com>
Subject: Re: [PATCH v1 00/15] arm64: Mediate access to GICv3
 sysregs at EL2
Date: Mon, 26 Mar 2018 10:13:19 +0530
Message-ID: <60f4cb6c-869b-3a68-f03c-04bcda986de2@caviumnetworks.com>
References: <cover.1521200294.git.manish.jaggi@cavium.com>
 <c678e388-6d66-a744-d4f6-7cfdc62ff374@arm.com>
 <fa9fcde0-ac40-a950-920e-455815b924c7@caviumnetworks.com>
 <99bcf77a-7603-119b-0711-900f38f8ca55@arm.com>
 <3744eb81-1c57-e87b-d1ff-0d47a70cfa38@caviumnetworks.com>
 <ca515ba7-c53f-62e9-a495-8c330c36c089@arm.com>
 <48b5110b-1a07-a4fb-309c-b0fc4a334e09@caviumnetworks.com>
 <CAEC2CxohC5AiMYAnoDu+=LLs-+QA-HrgpmE9w-fNH8G6qa9AYw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5717323301435731057=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=gmfh=gq=cavium.com=manish.jaggi@srs-us1.protection.inumbo.net>)
 id 1f0Jyx-0001wz-3T
 for xen-devel@lists.xenproject.org; Mon, 26 Mar 2018 04:43:43 +0000
In-Reply-To: <CAEC2CxohC5AiMYAnoDu+=LLs-+QA-HrgpmE9w-fNH8G6qa9AYw@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@linaro.org>
Cc: sstabellini@kernel.org, marc.zyngier@arm.com, andre.przywara@arm.com, "Jaggi, Manish" <Manish.Jaggi@cavium.com>, Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

This is a multi-part message in MIME format.
--===============5717323301435731057==
Content-Type: multipart/alternative;
 boundary="------------5AA67A9B401341F233AEAE31"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------5AA67A9B401341F233AEAE31
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit



On 03/23/2018 12:28 PM, Julien Grall wrote:
> (Sorry for the formatting)
>
> On 23 Mar 2018 14:46, "Manish Jaggi" <mjaggi@caviumnetworks.com 
> <mailto:mjaggi@caviumnetworks.com>> wrote:
>
>
>
>     On 03/21/2018 03:26 PM, Julien Grall wrote:
>
>         Hi Manish,
>
>         On 03/21/2018 09:38 AM, Manish Jaggi wrote:
>
>
>
>             On 03/21/2018 02:15 PM, Julien Grall wrote:
>
>
>
>                 On 03/21/2018 04:58 AM, Manish Jaggi wrote:
>
>
>                     Hi Julien,
>
>                     On 03/20/2018 01:16 PM, Julien Grall wrote:
>
>
>
>                         On 03/16/2018 11:58 AM, Manish Jaggi wrote:
>
>                             This patchset is a Xen port of Marc's
>                             patchset.
>                             arm64: KVM: Mediate access to GICv3
>                             sysregs at EL2 [1]
>
>                             The current RFC patchset is a subset of
>                             [1], as it handleing only Group1 traps
>                             as a PoC. Most of the trap code is added
>                             in vsysreg.c. Trap handler function is kept
>                             independent of the usual guest trap
>                             handling code.
>                             Looking for feedback on this approach.
>
>
>                         This cover letter does not seem to match the
>                         series. Please update it on every time you
>                         send a series.
>
>                     %s/vsysreg.c/vgic-v3-sr..
>
>                     Could you please review the other patches in the
>                     series, so that I can send v2.
>
>
>                 Here the major comments for the series (included patch
>                 not reviewed):
>                     1) You seem to miss some patches from Linux. I
>                 would like to understand why they are not there.
>
>             if code is ported to xen, it is perfectly fine to take
>             only relevant patches.
>
>
>         It is usually expected from the contributor to have some sort
>         of explanation in the cover letter. In particular when you are
>         based on a series from Linux.
>
>         Where I am more worried is there are patch on top in Linux,
>         that you didn't backport. So it would be really nice to
>         understand why those patches are not in Xen.
>
>         A non-exhaustive list:
>             - KVM: arm64: Log an error if trapping a
>         write-to-read-only GICv3 access
>                 - KVM: arm64: Log an error if trapping a
>         read-from-write-only GICv3 access
>
>
>             For instance we are not providing any command line option
>             to individually enable group1 grou0 traps.
>
>
>         I think the command line option could be useful for testing.
>         Developer don't necessarily have a Thunder-X in hand.
>
>                     2) Strangely some commits does not match the Linux
>                 one either in order and content (I am not speaking
>                 about the changes required by Xen). For instance this
>                 is the case of patch #14 "arm64: vgic-v3: Add
>                 ICV_AP(0/1)Rn_EL1 handler". If you port commit from
>                 Linux, then you should follow the same. This help a
>                 lot for review.
>
>             Since we are not doing individually enable of group0/1, it
>             doesnt make sense to have two set of patches for ICV_AP0 /
>             ICV_AP1. So I merged it.
>
>
>         Sorry, but it does not make sense. Looking at the series you
>         pointed. I don't see a patch just for ICV_AP0. Instead it is
>         part of " KVM: arm64: vgic-v3: Enable trapping of Group-0
>         system registers". You ported that patch in Xen.
>
>     If you see this patch, you will find this one specifically for ICV_AP1
>     https://lists.cs.columbia.edu/pipermail/kvmarm/2017-June/026040.html
>     <https://lists.cs.columbia.edu/pipermail/kvmarm/2017-June/026040.html>
>
>
> You didn't get my point...  You still don't explain why you move the 
> ICV_AP0 from "Enable trapping of Group-0 system registers"  to that 
> patch. If you take commit from Linux then don't move code between 
> commit around unless there is a good reason.
I gave a good reason, that it make sense to club two patches as we are 
not individually enabling g0/g1 for 30115 errata.
There is no documented rule that code taken from linux has to be 1:1 
mapping with linux patch.
When complete smmu.c is taken as one file the rule is not applied?

>
> Please try to make the review a bit easier...
>
> Cheers,
>


--------------5AA67A9B401341F233AEAE31
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p><br>
    </p>
    <br>
    <div class="moz-cite-prefix">On 03/23/2018 12:28 PM, Julien Grall
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAEC2CxohC5AiMYAnoDu+=LLs-+QA-HrgpmE9w-fNH8G6qa9AYw@mail.gmail.com">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="auto">
        <div>(Sorry for the formatting)<br>
          <div class="gmail_extra"><br>
            <div class="gmail_quote">On 23 Mar 2018 14:46, "Manish
              Jaggi" &lt;<a href="mailto:mjaggi@caviumnetworks.com"
                target="_blank" moz-do-not-send="true">mjaggi@caviumnetworks.com</a>&gt;
              wrote:<br type="attribution">
              <blockquote class="m_-8161047757412401661quote"
                style="margin:0 0 0 .8ex;border-left:1px #ccc
                solid;padding-left:1ex">
                <div class="m_-8161047757412401661elided-text"><br>
                  <br>
                  On 03/21/2018 03:26 PM, Julien Grall wrote:<br>
                  <blockquote class="gmail_quote" style="margin:0 0 0
                    .8ex;border-left:1px #ccc solid;padding-left:1ex">
                    Hi Manish,<br>
                    <br>
                    On 03/21/2018 09:38 AM, Manish Jaggi wrote:<br>
                    <blockquote class="gmail_quote" style="margin:0 0 0
                      .8ex;border-left:1px #ccc solid;padding-left:1ex">
                      <br>
                      <br>
                      On 03/21/2018 02:15 PM, Julien Grall wrote:<br>
                      <blockquote class="gmail_quote" style="margin:0 0
                        0 .8ex;border-left:1px #ccc
                        solid;padding-left:1ex">
                        <br>
                        <br>
                        On 03/21/2018 04:58 AM, Manish Jaggi wrote:<br>
                        <blockquote class="gmail_quote" style="margin:0
                          0 0 .8ex;border-left:1px #ccc
                          solid;padding-left:1ex">
                          <br>
                          Hi Julien,<br>
                          <br>
                          On 03/20/2018 01:16 PM, Julien Grall wrote:<br>
                          <blockquote class="gmail_quote"
                            style="margin:0 0 0 .8ex;border-left:1px
                            #ccc solid;padding-left:1ex">
                            <br>
                            <br>
                            On 03/16/2018 11:58 AM, Manish Jaggi wrote:<br>
                            <blockquote class="gmail_quote"
                              style="margin:0 0 0 .8ex;border-left:1px
                              #ccc solid;padding-left:1ex">
                              This patchset is a Xen port of Marc's
                              patchset.<br>
                              arm64: KVM: Mediate access to GICv3
                              sysregs at EL2 [1]<br>
                              <br>
                              The current RFC patchset is a subset of
                              [1], as it handleing only Group1 traps<br>
                              as a PoC. Most of the trap code is added
                              in vsysreg.c. Trap handler function is
                              kept<br>
                              independent of the usual guest trap
                              handling code.<br>
                              Looking for feedback on this approach.<br>
                            </blockquote>
                            <br>
                            This cover letter does not seem to match the
                            series. Please update it on every time you
                            send a series.<br>
                          </blockquote>
                          %s/vsysreg.c/vgic-v3-sr..<br>
                          <br>
                          Could you please review the other patches in
                          the series, so that I can send v2.<br>
                        </blockquote>
                        <br>
                        Here the major comments for the series (included
                        patch not reviewed):<br>
                            1) You seem to miss some patches from Linux.
                        I would like to understand why they are not
                        there.<br>
                      </blockquote>
                      if code is ported to xen, it is perfectly fine to
                      take only relevant patches.<br>
                    </blockquote>
                    <br>
                    It is usually expected from the contributor to have
                    some sort of explanation in the cover letter. In
                    particular when you are based on a series from
                    Linux.<br>
                    <br>
                    Where I am more worried is there are patch on top in
                    Linux, that you didn't backport. So it would be
                    really nice to understand why those patches are not
                    in Xen.<br>
                    <br>
                    A non-exhaustive list:<br>
                        - KVM: arm64: Log an error if trapping a
                    write-to-read-only GICv3 access<br>
                            - KVM: arm64: Log an error if trapping a
                    read-from-write-only GICv3 access<br>
                    <br>
                    <br>
                    <blockquote class="gmail_quote" style="margin:0 0 0
                      .8ex;border-left:1px #ccc solid;padding-left:1ex">
                      For instance we are not providing any command line
                      option to individually enable group1 grou0 traps.<br>
                    </blockquote>
                    <br>
                    I think the command line option could be useful for
                    testing. Developer don't necessarily have a
                    Thunder-X in hand.<br>
                    <br>
                    <blockquote class="gmail_quote" style="margin:0 0 0
                      .8ex;border-left:1px #ccc solid;padding-left:1ex">
                      <blockquote class="gmail_quote" style="margin:0 0
                        0 .8ex;border-left:1px #ccc
                        solid;padding-left:1ex">
                            2) Strangely some commits does not match the
                        Linux one either in order and content (I am not
                        speaking about the changes required by Xen). For
                        instance this is the case of patch #14 "arm64:
                        vgic-v3: Add ICV_AP(0/1)Rn_EL1 handler". If you
                        port commit from Linux, then you should follow
                        the same. This help a lot for review.<br>
                      </blockquote>
                      Since we are not doing individually enable of
                      group0/1, it doesnt make sense to have two set of
                      patches for ICV_AP0 / ICV_AP1. So I merged it.<br>
                    </blockquote>
                    <br>
                    Sorry, but it does not make sense. Looking at the
                    series you pointed. I don't see a patch just for
                    ICV_AP0. Instead it is part of " KVM: arm64:
                    vgic-v3: Enable trapping of Group-0 system
                    registers". You ported that patch in Xen.<br>
                    <br>
                  </blockquote>
                </div>
                If you see this patch, you will find this one
                specifically for ICV_AP1<br>
                <a
href="https://lists.cs.columbia.edu/pipermail/kvmarm/2017-June/026040.html"
                  rel="noreferrer" target="_blank"
                  moz-do-not-send="true">https://lists.cs.columbia.edu/<wbr>pipermail/kvmarm/2017-June/026<wbr>040.html</a></blockquote>
            </div>
          </div>
        </div>
        <div dir="auto"><br>
        </div>
        <div dir="auto">You didn't get my point...  You still don't
          explain why you move the ICV_AP0 from "Enable trapping of
          Group-0 system registers"  to that patch. If you take commit
          from Linux then don't move code between commit around unless
          there is a good reason.</div>
      </div>
    </blockquote>
    I gave a good reason, that it make sense to club two patches as we
    are not individually enabling g0/g1 for 30115 errata.<br>
    There is no documented rule that code taken from linux has to be 1:1
    mapping with linux patch.<br>
    When complete smmu.c is taken as one file the rule is not applied?<br>
    <br>
    <blockquote type="cite"
cite="mid:CAEC2CxohC5AiMYAnoDu+=LLs-+QA-HrgpmE9w-fNH8G6qa9AYw@mail.gmail.com">
      <div dir="auto">
        <div dir="auto"><br>
        </div>
        <div dir="auto">Please try to make the review a bit easier...</div>
        <div dir="auto"><br>
        </div>
        <div dir="auto">Cheers,</div>
        <div dir="auto"><br>
        </div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------5AA67A9B401341F233AEAE31--


--===============5717323301435731057==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5717323301435731057==--
