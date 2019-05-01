From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [RFC PATCH 2/7] x86/boot: Remove gratuitous call
 back into low-memory code
Date: Wed, 1 May 2019 13:25:05 +0100
Message-ID: <94292241-fbdb-3e56-38fe-ea6687461c85@citrix.com>
References: <cover.1556708225.git.dwmw2@infradead.org>
 <c252e7b1f675f5fb0df9c0c90423fc7fc0bc5736.1556708226.git.dwmw2@infradead.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5134683414390356600=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2zDm=TB=citrix.com=prvs=017a1499b=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hLoIh-0000fJ-Fv
 for xen-devel@lists.xenproject.org; Wed, 01 May 2019 12:25:27 +0000
In-Reply-To: <c252e7b1f675f5fb0df9c0c90423fc7fc0bc5736.1556708226.git.dwmw2@infradead.org>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: David Woodhouse <dwmw2@infradead.org>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

--===============5134683414390356600==
Content-Type: multipart/alternative;
	boundary="------------45CEA9DC24A385A9D6820A04"
Content-Language: en-GB

--------------45CEA9DC24A385A9D6820A04
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

On 01/05/2019 12:17, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
>
> We appear to have implemented a memcpy() in the low-memory trampoline
> which we then call into from __start_xen(), for no adequately defined
> reason.
>
> Kill it with fire.

Absolutely.

> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>

With the following fixup folded:

diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 213a1bd..e607a85 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -673,13 +673,11 @@ static char * __init cmdline_cook(char *p, const char *loader_name)
     return p;
 }
 
-static int copy_bios_e820(struct e820entry *map, unsigned int limit)
+static unsigned int copy_bios_e820(struct e820entry *map, unsigned int limit)
 {
-    unsigned int n = bootsym(bios_e820nr);
-    if (n > limit)
-        n = limit;
+    unsigned int n = min(bootsym(bios_e820nr), limit);
 
-    if (n)
+    if ( n )
         memcpy(map, bootsym(bios_e820map), sizeof(*map) * n);
 
     return n;

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Interestingly, the version with min() results in surprisingly better code:

add/remove: 0/0 grow/shrink: 0/1 up/down: 0/-21 (-21)
Function                                     old     new   delta
__start_xen                                13807   13786     -21
Total: Before=3363289, After=3363268, chg -0.00%


--------------45CEA9DC24A385A9D6820A04
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 01/05/2019 12:17, David Woodhouse
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:c252e7b1f675f5fb0df9c0c90423fc7fc0bc5736.1556708226.git.dwmw2@infradead.org">
      <pre class="moz-quote-pre" wrap="">From: David Woodhouse <a class="moz-txt-link-rfc2396E" href="mailto:dwmw@amazon.co.uk">&lt;dwmw@amazon.co.uk&gt;</a>

We appear to have implemented a memcpy() in the low-memory trampoline
which we then call into from __start_xen(), for no adequately defined
reason.

Kill it with fire.</pre>
    </blockquote>
    <br>
    Absolutely.<br>
    <br>
    <blockquote type="cite"
cite="mid:c252e7b1f675f5fb0df9c0c90423fc7fc0bc5736.1556708226.git.dwmw2@infradead.org">
      <pre class="moz-quote-pre" wrap="">Signed-off-by: David Woodhouse <a class="moz-txt-link-rfc2396E" href="mailto:dwmw@amazon.co.uk">&lt;dwmw@amazon.co.uk&gt;</a></pre>
    </blockquote>
    <br>
    With the following fixup folded:<br>
    <br>
    <pre>diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 213a1bd..e607a85 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -673,13 +673,11 @@ static char * __init cmdline_cook(char *p, const char *loader_name)
     return p;
 }
 
-static int copy_bios_e820(struct e820entry *map, unsigned int limit)
+static unsigned int copy_bios_e820(struct e820entry *map, unsigned int limit)
 {
-    unsigned int n = bootsym(bios_e820nr);
-    if (n &gt; limit)
-        n = limit;
+    unsigned int n = min(bootsym(bios_e820nr), limit);
 
-    if (n)
+    if ( n )
         memcpy(map, bootsym(bios_e820map), sizeof(*map) * n);
 
     return n;

</pre>
    Acked-by: Andrew Cooper <a class="moz-txt-link-rfc2396E" href="mailto:andrew.cooper3@citrix.com">&lt;andrew.cooper3@citrix.com&gt;</a><br>
    <br>
    Interestingly, the version with min() results in surprisingly better
    code:<br>
    <br>
    <pre>add/remove: 0/0 grow/shrink: 0/1 up/down: 0/-21 (-21)
Function                                     old     new   delta
__start_xen                                13807   13786     -21
Total: Before=3363289, After=3363268, chg -0.00%</pre>
  </body>
</html>

--------------45CEA9DC24A385A9D6820A04--


--===============5134683414390356600==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5134683414390356600==--
