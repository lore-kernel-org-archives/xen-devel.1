From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 2/2] x86/mtrr: fix build with gcc9
Date: Fri, 15 Mar 2019 16:21:38 +0000
Message-ID: <7520f3cc-1b62-4616-9f93-e061357efa78@citrix.com>
References: <5C80F130020000780021C602@prv1-mh.provo.novell.com>
 <5C80F32C020000780021C626@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4272493776245233758=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=OIle=RS=citrix.com=prvs=970d66146=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1h4pt8-00013l-0X
 for xen-devel@lists.xenproject.org; Fri, 15 Mar 2019 16:40:54 +0000
In-Reply-To: <5C80F32C020000780021C626@prv1-mh.provo.novell.com>
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
Cc: Charles Arnold <CARNOLD@suse.com>, Juergen Gross <jgross@suse.com>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

--===============4272493776245233758==
Content-Type: multipart/alternative;
	boundary="------------C25D6C616C74E039AAFEC904"
Content-Language: en-GB

--------------C25D6C616C74E039AAFEC904
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On 07/03/2019 10:32, Jan Beulich wrote:
> generic.c: In function ‘print_mtrr_state’:
> generic.c:210:11: error: ‘%0*lx’ directive output between 1 and 1073741823 bytes may cause result to exceed
> ‘INT_MAX’ [-Werror=format-overflow=]
>   210 |    printk("%s  %u base %0*"PRIx64"000 mask %0*"PRIx64"000 %s\n",
>       |           ^~~~~~~~~~~~~~~~~
> generic.c:210:44: note: format string is defined here
>   210 |    printk("%s  %u base %0*"PRIx64"000 mask %0*"PRIx64"000 %s\n",
> generic.c:210:11: note: directive argument in the range [0, 4503599627370495]
>   210 |    printk("%s  %u base %0*"PRIx64"000 mask %0*"PRIx64"000 %s\n",
>       |           ^~~~~~~~~~~~~~~~~
> generic.c:210:11: note: assuming directive output of 1 byte
>
> Restrict the width of the variable "width" controlling the number of
> address digits output.
>
> Reported-by: Charles Arnold <carnold@suse.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

This is because GCC doesn't know the value of paddr_bits, and has
concluded that

width = (paddr_bits - PAGE_SHIFT + 3) / 4;

can result in some insane values, which is true.

However, this logic to unnecessarily complicated for something which is
only printed in a verbose or error case.

I'd prefer this as an alternative:

diff --git a/xen/arch/x86/cpu/mtrr/generic.c b/xen/arch/x86/cpu/mtrr/generic.c
index 8f9cf1b..566396f 100644
--- a/xen/arch/x86/cpu/mtrr/generic.c
+++ b/xen/arch/x86/cpu/mtrr/generic.c
@@ -182,7 +182,6 @@ static void __init print_fixed(unsigned int base, unsigned int step,
 static void __init print_mtrr_state(const char *level)
 {
        unsigned int i;
-       int width;
 
        printk("%sMTRR default type: %s\n", level,
               mtrr_attrib_to_str(mtrr_state.def_type));
@@ -203,14 +202,13 @@ static void __init print_mtrr_state(const char *level)
        }
        printk("%sMTRR variable ranges %sabled:\n", level,
               mtrr_state.enabled ? "en" : "dis");
-       width = (paddr_bits - PAGE_SHIFT + 3) / 4;
 
        for (i = 0; i < num_var_ranges; ++i) {
                if (mtrr_state.var_ranges[i].mask & MTRR_PHYSMASK_VALID)
-                       printk("%s  %u base %0*"PRIx64"000 mask %0*"PRIx64"000 %s\n",
+                       printk("%s  %u base %013"PRIx64"000 mask %013"PRIx64"000 %s\n",
                               level, i,
-                              width, mtrr_state.var_ranges[i].base >> 12,
-                              width, mtrr_state.var_ranges[i].mask >> 12,
+                              mtrr_state.var_ranges[i].base >> 12,
+                              mtrr_state.var_ranges[i].mask >> 12,
                               mtrr_attrib_to_str(mtrr_state.var_ranges[i].base &
                                                  MTRR_PHYSBASE_TYPE_MASK));
                else


--------------C25D6C616C74E039AAFEC904
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 07/03/2019 10:32, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:5C80F32C020000780021C626@prv1-mh.provo.novell.com">
      <pre class="moz-quote-pre" wrap="">generic.c: In function ‘print_mtrr_state’:
generic.c:210:11: error: ‘%0*lx’ directive output between 1 and 1073741823 bytes may cause result to exceed
‘INT_MAX’ [-Werror=format-overflow=]
  210 |    printk("%s  %u base %0*"PRIx64"000 mask %0*"PRIx64"000 %s\n",
      |           ^~~~~~~~~~~~~~~~~
generic.c:210:44: note: format string is defined here
  210 |    printk("%s  %u base %0*"PRIx64"000 mask %0*"PRIx64"000 %s\n",
generic.c:210:11: note: directive argument in the range [0, 4503599627370495]
  210 |    printk("%s  %u base %0*"PRIx64"000 mask %0*"PRIx64"000 %s\n",
      |           ^~~~~~~~~~~~~~~~~
generic.c:210:11: note: assuming directive output of 1 byte

Restrict the width of the variable "width" controlling the number of
address digits output.

Reported-by: Charles Arnold <a class="moz-txt-link-rfc2396E" href="mailto:carnold@suse.com">&lt;carnold@suse.com&gt;</a>
Signed-off-by: Jan Beulich <a class="moz-txt-link-rfc2396E" href="mailto:jbeulich@suse.com">&lt;jbeulich@suse.com&gt;</a></pre>
    </blockquote>
    <br>
    This is because GCC doesn't know the value of paddr_bits, and has
    concluded that<br>
    <br>
    width = (paddr_bits - PAGE_SHIFT + 3) / 4;<br>
    <br>
    can result in some insane values, which is true.<br>
    <br>
    However, this logic to unnecessarily complicated for something which
    is only printed in a verbose or error case.<br>
    <br>
    I'd prefer this as an alternative:<br>
    <br>
    <pre>diff --git a/xen/arch/x86/cpu/mtrr/generic.c b/xen/arch/x86/cpu/mtrr/generic.c
index 8f9cf1b..566396f 100644
--- a/xen/arch/x86/cpu/mtrr/generic.c
+++ b/xen/arch/x86/cpu/mtrr/generic.c
@@ -182,7 +182,6 @@ static void __init print_fixed(unsigned int base, unsigned int step,
 static void __init print_mtrr_state(const char *level)
 {
        unsigned int i;
-       int width;
 
        printk("%sMTRR default type: %s\n", level,
               mtrr_attrib_to_str(mtrr_state.def_type));
@@ -203,14 +202,13 @@ static void __init print_mtrr_state(const char *level)
        }
        printk("%sMTRR variable ranges %sabled:\n", level,
               mtrr_state.enabled ? "en" : "dis");
-       width = (paddr_bits - PAGE_SHIFT + 3) / 4;
 
        for (i = 0; i &lt; num_var_ranges; ++i) {
                if (mtrr_state.var_ranges[i].mask &amp; MTRR_PHYSMASK_VALID)
-                       printk("%s  %u base %0*"PRIx64"000 mask %0*"PRIx64"000 %s\n",
+                       printk("%s  %u base %013"PRIx64"000 mask %013"PRIx64"000 %s\n",
                               level, i,
-                              width, mtrr_state.var_ranges[i].base &gt;&gt; 12,
-                              width, mtrr_state.var_ranges[i].mask &gt;&gt; 12,
+                              mtrr_state.var_ranges[i].base &gt;&gt; 12,
+                              mtrr_state.var_ranges[i].mask &gt;&gt; 12,
                               mtrr_attrib_to_str(mtrr_state.var_ranges[i].base &amp;
                                                  MTRR_PHYSBASE_TYPE_MASK));
                else

</pre>
  </body>
</html>

--------------C25D6C616C74E039AAFEC904--


--===============4272493776245233758==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4272493776245233758==--
