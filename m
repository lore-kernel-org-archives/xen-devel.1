From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH] x86/CPUID: don't override tool stack decision
 to hide STIBP
Date: Thu, 24 May 2018 17:44:50 +0100
Message-ID: <2f901854-77d3-2d28-08cc-97d62630fc13@citrix.com>
References: <5B03F1F202000078001C4942@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8813566297236706610=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=bvjw=il=citrix.com=prvs=675476172=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1fLtMF-0004rW-6q
 for xen-devel@lists.xenproject.org; Thu, 24 May 2018 16:44:55 +0000
In-Reply-To: <5B03F1F202000078001C4942@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Juergen Gross <jgross@suse.com>
List-Id: xen-devel@lists.xenproject.org

--===============8813566297236706610==
Content-Type: multipart/alternative;
	boundary="------------C169E6C0F7576E0E7025AD42"
Content-Language: en-GB

--------------C169E6C0F7576E0E7025AD42
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On 22/05/18 11:33, Jan Beulich wrote:
> Other than in the feature sets, where we indeed want to offer the
> feature even if not enumerated on hardware, we shouldn't dictate the
> feature being available if tool stack or host admin have decided not
> to expose it (for whatever [questionable?] reason).
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> This is effectively accompanying the discussion rooted at the 4.8/4.7
> patch at
> https://lists.xenproject.org/archives/html/xen-devel/2018-05/msg01028.html 
> dealing with a feature leveling issue.
>
> --- a/xen/arch/x86/cpuid.c
> +++ b/xen/arch/x86/cpuid.c
> @@ -642,14 +642,6 @@ void recalculate_cpuid_policy(struct dom
>      recalculate_xstate(p);
>      recalculate_misc(p);
>  
> -    /*
> -     * Override STIBP to match IBRS.  Guests can safely use STIBP
> -     * functionality on non-HT hardware, but can't necesserily protect
> -     * themselves from SP2/Spectre/Branch Target Injection if STIBP is hidden
> -     * on HT-capable hardware.
> -     */
> -    p->feat.stibp = p->feat.ibrsb;

You've deleted a comment explaining why this is needed for safety
reasons, without addressing the safety argument.  Simply "because we
shouldn't override the toolstack" isn't a reasonable argument.

With the SP2 microcode, we have the following situations which can occur:
 * No mitigations
 * IBRSB visible
 * IBRSB and STIBP visible

IBSRB enumerates MSR_SPEC_CTRL, MSR_SPEC_CTRL.IBRS, and MSR_PRED_CMD.
STIBP enumerates MSR_SPEC_CTRL.STIBP

SPEC_CTRL.STIBP is specified as usable (albeit, as a nop) even if STIBP
isn't enumerated.  This is deliberately and explicitly for heterogeneous
migration scenarios, as it won't be a nop on other processors.  In
practice, this is so hypervisors can offer the feature unilaterally, and
have it usable on non-HT hardware.

However, to safely level it, dom0 needs to see it set in the information
used to construct the guest policies.  In principle, this should just be
in the guest policy which needs adjusting.

However, due to still not having got the CPUID policy improvements
finished, dom0 is still excluded from cpuid faulting for the exclusive
benefit of the CPUID logic in the domain builder, because it uses native
CPUID to construct the guests CPUID policy.  Therefore, dom0 is unable
to create a safe CPUID policy for the guest, and Xen must override the
setting.

If you try and make this change, you will introduce a guest security
issue on some hardware by hiding STIBP which is necessary for safety.

~Andrew

--------------C169E6C0F7576E0E7025AD42
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 22/05/18 11:33, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:5B03F1F202000078001C4942@prv1-mh.provo.novell.com">
      <pre wrap="">Other than in the feature sets, where we indeed want to offer the
feature even if not enumerated on hardware, we shouldn't dictate the
feature being available if tool stack or host admin have decided not
to expose it (for whatever [questionable?] reason).

Signed-off-by: Jan Beulich <a class="moz-txt-link-rfc2396E" href="mailto:jbeulich@suse.com">&lt;jbeulich@suse.com&gt;</a>
---
This is effectively accompanying the discussion rooted at the 4.8/4.7
patch at
<a class="moz-txt-link-freetext" href="https://lists.xenproject.org/archives/html/xen-devel/2018-05/msg01028.html">https://lists.xenproject.org/archives/html/xen-devel/2018-05/msg01028.html</a> 
dealing with a feature leveling issue.

--- a/xen/arch/x86/cpuid.c
+++ b/xen/arch/x86/cpuid.c
@@ -642,14 +642,6 @@ void recalculate_cpuid_policy(struct dom
     recalculate_xstate(p);
     recalculate_misc(p);
 
-    /*
-     * Override STIBP to match IBRS.  Guests can safely use STIBP
-     * functionality on non-HT hardware, but can't necesserily protect
-     * themselves from SP2/Spectre/Branch Target Injection if STIBP is hidden
-     * on HT-capable hardware.
-     */
-    p-&gt;feat.stibp = p-&gt;feat.ibrsb;
</pre>
    </blockquote>
    <br>
    You've deleted a comment explaining why this is needed for safety
    reasons, without addressing the safety argument.  Simply "because we
    shouldn't override the toolstack" isn't a reasonable argument.<br>
    <br>
    With the SP2 microcode, we have the following situations which can
    occur:<br>
     * No mitigations<br>
     * IBRSB visible<br>
     * IBRSB and STIBP visible<br>
    <br>
    IBSRB enumerates MSR_SPEC_CTRL, MSR_SPEC_CTRL.IBRS, and
    MSR_PRED_CMD.<br>
    STIBP enumerates MSR_SPEC_CTRL.STIBP<br>
    <br>
    SPEC_CTRL.STIBP is specified as usable (albeit, as a nop) even if
    STIBP isn't enumerated.  This is deliberately and explicitly for
    heterogeneous migration scenarios, as it won't be a nop on other
    processors.  In practice, this is so hypervisors can offer the
    feature unilaterally, and have it usable on non-HT hardware.<br>
    <br>
    However, to safely level it, dom0 needs to see it set in the
    information used to construct the guest policies.  In principle,
    this should just be in the guest policy which needs adjusting.<br>
    <br>
    However, due to still not having got the CPUID policy improvements
    finished, dom0 is still excluded from cpuid faulting for the
    exclusive benefit of the CPUID logic in the domain builder, because
    it uses native CPUID to construct the guests CPUID policy. 
    Therefore, dom0 is unable to create a safe CPUID policy for the
    guest, and Xen must override the setting.<br>
    <br>
    If you try and make this change, you will introduce a guest security
    issue on some hardware by hiding STIBP which is necessary for
    safety.<br>
    <br>
    ~Andrew<br>
  </body>
</html>

--------------C169E6C0F7576E0E7025AD42--


--===============8813566297236706610==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8813566297236706610==--
