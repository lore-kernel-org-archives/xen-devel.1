From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: =?utf-8?b?5Zue5aSNOiBSZTogW1BBVENIXSBDaG9vc2UgcmV0?=
 =?utf-8?q?poline_only_when_it_is_safe_to_use?=
Date: Tue, 6 Feb 2018 11:56:05 +0000
Message-ID: <9de36cbb-11b1-4aa4-0ae2-1ca6dcfe6bff@citrix.com>
References: <a8vim4q7puma7targvkbpbri.1517912981288@email.android.com>
 <a35d9cfe-0feb-bcc7-aaf4-e719943c539f@citrix.com>
 <dabdf330-334a-4ea1-bc32-4143c93557eb@oracle.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0281615165480430162=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <dabdf330-334a-4ea1-bc32-4143c93557eb@oracle.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: zhenzhong.duan@oracle.com
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>, Xen-Devel <xen-devel@lists.xen.org>, JBeulich@suse.com, Srinivas REDDY Eeda <srinivas.eeda@oracle.com>
List-Id: xen-devel@lists.xenproject.org

--===============0281615165480430162==
Content-Type: multipart/alternative;
	boundary="------------555A44DA05A31DDCB0015131"
Content-Language: en-GB

--------------555A44DA05A31DDCB0015131
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On 06/02/18 11:41, Zhenzhong Duan wrote:
> On 2018/2/6 18:50, Andrew Cooper wrote:
>> On 06/02/18 10:29, zhenzhong.duan wrote:
>>>
>>>
>>> 2018年2月6日 17:20于 Andrew Cooper <andrew.cooper3@citrix.com
>>> <mailto:andrew.cooper3@citrix.com>>写道：
>>> >
>>> > On 06/02/2018 09:13, Zhenzhong Duan wrote:
>>> > > 在 2018/2/6 16:59, Andrew Cooper 写道:
>>> > >> On 06/02/2018 08:43, Zhenzhong Duan wrote:
>>> > >>> When ( ibrs && thunk == THUNK_DEFAULT && !retpoline_safe() )
>>> is true,
>>> > >>> thunk is set to THUNK_JMP rather than THUNK_RETPOLINE.
>>> > >>>
>>> > >>> When (!ibrs && thunk == THUNK_DEFAULT && !retpoline_safe() )
>>> is true,
>>> > >>> we should do the same.
>>> > >>>
>>> > >>> Signed-off-by: Zhenzhong Duan <zhenzhong.duan@oracle.com
>>> <mailto:zhenzhong.duan@oracle.com>>
>>> > >> Why?  What improvement is this intended to give?
>>> > > No improvement, I just feel if retpoline isn't safe, THUNK_JMP is
>>> > > better and safer.
>>> > > Above first check is working that way.
>>> >
>>> > If your only two choices are unsafe repoline or plain jumps, then
>>> unsafe
>>> > repoline is far far far safer.
>>> >
>>> > Its unsafe properties only kick in on an RSB underflow, and an
>>> attacker
>>> > would have to do call-depths analysis of the running binary to
>>> identify
>>> > which rets to attempt to poison.
>>> >
>>> Thanks for explaining.
>>> So, for a retpoline safe processor, it just stop using RSB when it's
>>> empty to avoid underflow?
>>>
>>
>> The qualification of whether a processor is retpoline-safe or not is
>> whether an RSB underflow causes a BTB lookup (unsafe) or not (safe).
>>
>> RSB underflows will always occur; you cannot get rid of them, but in
>> most cases (i.e. pre-Skylake) they don't fall back to using a
>> prediction source which can be poisoned by an attacker.
> Understood.
>>
>>> Another question:
>>>
>>> if (opt_thunk == THUNK_DEFAULT && opt_ibrs == -1 &&
>>> CONFIG_INDIRECT_THUNK && !cpu_has_lfence_dispatch && !retpoline_safe())
>>> results in "thunk = THUNK_JMP" regardless of the value of
>>> "boot_cpu_has(X86_FEATURE_IBRSB)"
>>>
>>
>> Your formatting is hard to follow,
> Sorry, sent from mobile.
>> but cpu_has_lfence_dispatch can only be false when virtualised under
>> an SP2-unaware hypervisor on AMD hardware, at which point
>> retpoline_safe() will return true.  Also, AMD don't have IBRS in
>> microcode and their future plans don't appear to involve using that
>> particular CPUID bit.
> That does make sense for AMD. But what about Intel hardware which has
> (!cpu_has_lfence_dispatch && !retpoline_safe() &&
> !boot_cpu_has(X86_FEATURE_IBRSB)), should we  prefer THUNK_RETPOLINE? 

Yes, and we do end up choosing RETPOLINE in those circumstances, as we
hit the default case you originally tried to patch.

~Andrew

--------------555A44DA05A31DDCB0015131
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 06/02/18 11:41, Zhenzhong Duan
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:dabdf330-334a-4ea1-bc32-4143c93557eb@oracle.com">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div class="moz-cite-prefix">On 2018/2/6 18:50, Andrew Cooper
        wrote:<br>
      </div>
      <blockquote type="cite"
        cite="mid:a35d9cfe-0feb-bcc7-aaf4-e719943c539f@citrix.com">
        <div class="moz-cite-prefix">On 06/02/18 10:29, zhenzhong.duan
          wrote:<br>
        </div>
        <blockquote type="cite"
          cite="mid:a8vim4q7puma7targvkbpbri.1517912981288@email.android.com">
          <p dir="ltr"><br>
            2018年2月6日 17:20于 Andrew Cooper &lt;<a
              href="mailto:andrew.cooper3@citrix.com"
              moz-do-not-send="true">andrew.cooper3@citrix.com</a>&gt;写道：<br>
            &gt;<br>
            &gt; On 06/02/2018 09:13, Zhenzhong Duan wrote: <br>
            &gt; &gt; 在 2018/2/6 16:59, Andrew Cooper 写道: <br>
            &gt; &gt;&gt; On 06/02/2018 08:43, Zhenzhong Duan wrote: <br>
            &gt; &gt;&gt;&gt; When ( ibrs &amp;&amp; thunk ==
            THUNK_DEFAULT &amp;&amp; !retpoline_safe() ) is true, <br>
            &gt; &gt;&gt;&gt; thunk is set to THUNK_JMP rather than
            THUNK_RETPOLINE. <br>
            &gt; &gt;&gt;&gt; <br>
            &gt; &gt;&gt;&gt; When (!ibrs &amp;&amp; thunk ==
            THUNK_DEFAULT &amp;&amp; !retpoline_safe() ) is true, <br>
            &gt; &gt;&gt;&gt; we should do the same. <br>
            &gt; &gt;&gt;&gt; <br>
            &gt; &gt;&gt;&gt; Signed-off-by: Zhenzhong Duan &lt;<a
              href="mailto:zhenzhong.duan@oracle.com"
              moz-do-not-send="true">zhenzhong.duan@oracle.com</a>&gt; <br>
            &gt; &gt;&gt; Why?  What improvement is this intended to
            give? <br>
            &gt; &gt; No improvement, I just feel if retpoline isn't
            safe, THUNK_JMP is <br>
            &gt; &gt; better and safer. <br>
            &gt; &gt; Above first check is working that way. <br>
            &gt;<br>
            &gt; If your only two choices are unsafe repoline or plain
            jumps, then unsafe <br>
            &gt; repoline is far far far safer. <br>
            &gt;<br>
            &gt; Its unsafe properties only kick in on an RSB underflow,
            and an attacker <br>
            &gt; would have to do call-depths analysis of the running
            binary to identify <br>
            &gt; which rets to attempt to poison. <br>
            &gt;<br>
            Thanks for explaining.<br>
            So, for a retpoline safe processor, it just stop using RSB
            when it's empty to avoid underflow?</p>
        </blockquote>
        <br>
        The qualification of whether a processor is retpoline-safe or
        not is whether an RSB underflow causes a BTB lookup (unsafe) or
        not (safe).<br>
        <br>
        RSB underflows will always occur; you cannot get rid of them,
        but in most cases (i.e. pre-Skylake) they don't fall back to
        using a prediction source which can be poisoned by an attacker.<br>
      </blockquote>
      Understood.<br>
      <blockquote type="cite"
        cite="mid:a35d9cfe-0feb-bcc7-aaf4-e719943c539f@citrix.com"> <br>
        <blockquote type="cite"
          cite="mid:a8vim4q7puma7targvkbpbri.1517912981288@email.android.com">
          <p dir="ltr">Another question:</p>
          <p dir="ltr">if (opt_thunk == THUNK_DEFAULT &amp;&amp;
            opt_ibrs == -1 &amp;&amp; <br>
            CONFIG_INDIRECT_THUNK &amp;&amp; !cpu_has_lfence_dispatch
            &amp;&amp; !retpoline_safe()) <br>
            results in "thunk = THUNK_JMP" regardless of the value of
            "boot_cpu_has(X86_FEATURE_IBRSB)" </p>
        </blockquote>
        <br>
        Your formatting is hard to follow,</blockquote>
      Sorry, sent from mobile.<br>
      <blockquote type="cite"
        cite="mid:a35d9cfe-0feb-bcc7-aaf4-e719943c539f@citrix.com"> but
        cpu_has_lfence_dispatch can only be false when virtualised under
        an SP2-unaware hypervisor on AMD hardware, at which point
        retpoline_safe() will return true.  Also, AMD don't have IBRS in
        microcode and their future plans don't appear to involve using
        that particular CPUID bit.<br>
      </blockquote>
      That does make sense for AMD. But what about Intel hardware which
      has (!cpu_has_lfence_dispatch &amp;&amp; !retpoline_safe()
      &amp;&amp; !boot_cpu_has(X86_FEATURE_IBRSB)), should we  prefer
      THUNK_RETPOLINE? </blockquote>
    <br>
    Yes, and we do end up choosing RETPOLINE in those circumstances, as
    we hit the default case you originally tried to patch.<br>
    <br>
    ~Andrew<br>
  </body>
</html>

--------------555A44DA05A31DDCB0015131--


--===============0281615165480430162==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0281615165480430162==--
