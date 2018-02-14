From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: =?utf-8?b?5Zue5aSNOiBSZTog5Zue5aSNOiBbUEFUQ0hdIHg4?=
 =?utf-8?q?6/spec=5Fctrl=3A_Fix_several_bugs_in_SPEC=5FCTRL=5FENTRY=5FFROM?=
 =?utf-8?b?X0lOVFJfSVNU?=
Date: Wed, 14 Feb 2018 14:28:47 +0000
Message-ID: <d8a2f7c7-c870-fb0d-67fe-f79d034d6562@citrix.com>
References: <1mkff9kgs97wdh0wu9bq2ned.1518613466397@email.android.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6776615759599793225=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1mkff9kgs97wdh0wu9bq2ned.1518613466397@email.android.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "zhenzhong.duan" <zhenzhong.duan@oracle.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

--===============6776615759599793225==
Content-Type: multipart/alternative;
	boundary="------------DB3842313F056435F474CE34"
Content-Language: en-GB

--------------DB3842313F056435F474CE34
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On 14/02/18 13:04, zhenzhong.duan wrote:
>
> 2018年2月14日 20:21于 Andrew Cooper <andrew.cooper3@citrix.com
> <mailto:andrew.cooper3@citrix.com>>写道：
> >
> > On 14/02/18 12:08, zhenzhong.duan wrote:
> > >
> > > > @@ -286,13 +286,13 @@
> > > >      setz %dl
> > > >      and %dl, STACK_CPUINFO_FIELD(use_shadow_spec_ctrl)(%r14)
> > > Is it safe to remove the 'xor %edx, %edx' above? setz set whole
> byte 1
> > > or 0.
> > >
> >
> > It is safe, but it is not a good idea.
> >
> > Using setz is an 8bit operation, which will suffer a register merge
> > stall in the pipeline as we know for certain at this point that the
> > upper bits of %edx are nonzero at this point.  (An encoding which
> > allowed setz %eax would have been far more useful in 64bit code.)
> >
> Thanks for explain. But just curious does processor has ideas the
> whole register is zeroed and avoid a merge?
>

Yes.  See the Zeroing Idioms section in the optimisation manual. 
Tracking which registers are zero helps breaks read-after-write data
dependences in the pipeline.

~Andrew

--------------DB3842313F056435F474CE34
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 14/02/18 13:04, zhenzhong.duan
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:1mkff9kgs97wdh0wu9bq2ned.1518613466397@email.android.com">
      <p dir="ltr">
        2018年2月14日 20:21于 Andrew Cooper &lt;<a
          href="mailto:andrew.cooper3@citrix.com" moz-do-not-send="true">andrew.cooper3@citrix.com</a>&gt;写道：<br>
        &gt;<br>
        &gt; On 14/02/18 12:08, zhenzhong.duan wrote: <br>
        &gt; &gt; <br>
        &gt; &gt; &gt; @@ -286,13 +286,13 @@ <br>
        &gt; &gt; &gt;      setz %dl <br>
        &gt; &gt; &gt;      and %dl,
        STACK_CPUINFO_FIELD(use_shadow_spec_ctrl)(%r14) <br>
        &gt; &gt; Is it safe to remove the 'xor %edx, %edx' above? setz
        set whole byte 1 <br>
        &gt; &gt; or 0. <br>
        &gt; &gt; <br>
        &gt;<br>
        &gt; It is safe, but it is not a good idea. <br>
        &gt;<br>
        &gt; Using setz is an 8bit operation, which will suffer a
        register merge <br>
        &gt; stall in the pipeline as we know for certain at this point
        that the <br>
        &gt; upper bits of %edx are nonzero at this point.  (An encoding
        which <br>
        &gt; allowed setz %eax would have been far more useful in 64bit
        code.) <br>
        &gt;<br>
        Thanks for explain. But just curious does processor has ideas
        the whole register is zeroed and avoid a merge?</p>
    </blockquote>
    <br>
    Yes.  See the Zeroing Idioms section in the optimisation manual. 
    Tracking which registers are zero helps breaks read-after-write data
    dependences in the pipeline.<br>
    <br>
    ~Andrew<br>
  </body>
</html>

--------------DB3842313F056435F474CE34--


--===============6776615759599793225==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6776615759599793225==--
