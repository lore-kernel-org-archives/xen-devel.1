From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 2/5] x86/domain: Initialise vcpu debug
 registers correctly
Date: Fri, 26 Oct 2018 15:51:53 +0100
Message-ID: <55050c05-ed95-89aa-7f6a-2700a7c113b8@citrix.com>
References: <1539599780-14549-1-git-send-email-andrew.cooper3@citrix.com>
 <1539599780-14549-3-git-send-email-andrew.cooper3@citrix.com>
 <5BD3171402000078001F531D@prv1-mh.provo.novell.com>
 <afe9256a-088c-81d0-dd6d-3a9387e52f46@citrix.com>
 <5BD3269C02000078001F5401@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3342011605689741800=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5BD3269C02000078001F5401@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Xen-devel <xen-devel@lists.xen.org>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

--===============3342011605689741800==
Content-Type: multipart/alternative;
	boundary="------------44DBB5E38316B63240D34EBE"
Content-Language: en-GB

--------------44DBB5E38316B63240D34EBE
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

On 26/10/2018 15:37, Jan Beulich wrote:
>>>> On 26.10.18 at 16:22, <andrew.cooper3@citrix.com> wrote:
>> On 26/10/2018 14:31, Jan Beulich wrote:
>>>>>> On 15.10.18 at 12:36, <andrew.cooper3@citrix.com> wrote:
>>>> --- a/xen/arch/x86/domain.c
>>>> +++ b/xen/arch/x86/domain.c
>>>> @@ -323,6 +323,18 @@ void free_vcpu_struct(struct vcpu *v)
>>>>      free_xenheap_page(v);
>>>>  }
>>>>  
>>>> +/* Initialise various registers to their architectural INIT/RESET state. */
>>>> +void arch_vcpu_regs_init(struct vcpu *v)
>>>> +{
>>>> +    v->arch.user_regs = (typeof(v->arch.user_regs)){
>>>> +        .rflags = X86_EFLAGS_MBS,
>>>> +    };
>>> Sadly this initializer broke the build once again for gcc 4.3.x.
>> Oh - that's unfortunate.  I guess it will need a memset instead.
> Or we finally need to bump the minimum version we're happy with.
>
>>> (As a side note, using .eflags instead of .rflags would have a
>>> fair chance of an omitted REX prefix.)
>> You specifically requested rflags over eflags in your previous review.
> Did I? I haven't been able to find v1 of this patch at all in the archives
> (going back to May), or in my inbox (using just part of the title for
> searching). Was that posted in private, or under a different title? I'm
> trying to figure why I would have asked for that...

<5B17E80A02000078001C8C1D@prv1-mh.provo.novell.com>

This series is the fairly non-controversial parts of the original full series, because there is no point delaying getting it in.  I'm still fighting with the monitor framework, which is a prerequisite to being able to fix #DB injection in the VT-x and SVM code.

~Andrew


--------------44DBB5E38316B63240D34EBE
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 26/10/2018 15:37, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:5BD3269C02000078001F5401@prv1-mh.provo.novell.com">
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">On 26.10.18 at 16:22, <a class="moz-txt-link-rfc2396E" href="mailto:andrew.cooper3@citrix.com">&lt;andrew.cooper3@citrix.com&gt;</a> wrote:
</pre>
          </blockquote>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">On 26/10/2018 14:31, Jan Beulich wrote:
</pre>
        <blockquote type="cite">
          <blockquote type="cite">
            <blockquote type="cite">
              <blockquote type="cite">
                <pre class="moz-quote-pre" wrap="">On 15.10.18 at 12:36, <a class="moz-txt-link-rfc2396E" href="mailto:andrew.cooper3@citrix.com">&lt;andrew.cooper3@citrix.com&gt;</a> wrote:
</pre>
              </blockquote>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -323,6 +323,18 @@ void free_vcpu_struct(struct vcpu *v)
     free_xenheap_page(v);
 }
 
+/* Initialise various registers to their architectural INIT/RESET state. */
+void arch_vcpu_regs_init(struct vcpu *v)
+{
+    v-&gt;arch.user_regs = (typeof(v-&gt;arch.user_regs)){
+        .rflags = X86_EFLAGS_MBS,
+    };
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">Sadly this initializer broke the build once again for gcc 4.3.x.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Oh - that's unfortunate.  I guess it will need a memset instead.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Or we finally need to bump the minimum version we're happy with.

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">(As a side note, using .eflags instead of .rflags would have a
fair chance of an omitted REX prefix.)
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
You specifically requested rflags over eflags in your previous review.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Did I? I haven't been able to find v1 of this patch at all in the archives
(going back to May), or in my inbox (using just part of the title for
searching). Was that posted in private, or under a different title? I'm
trying to figure why I would have asked for that...</pre>
    </blockquote>
    <br>
    <pre><a class="moz-txt-link-rfc2396E" href="mailto:5B17E80A02000078001C8C1D@prv1-mh.provo.novell.com">&lt;5B17E80A02000078001C8C1D@prv1-mh.provo.novell.com&gt;</a>

This series is the fairly non-controversial parts of the original full series, because there is no point delaying getting it in.  I'm still fighting with the monitor framework, which is a prerequisite to being able to fix #DB injection in the VT-x and SVM code.

~Andrew
</pre>
  </body>
</html>

--------------44DBB5E38316B63240D34EBE--


--===============3342011605689741800==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3342011605689741800==--
