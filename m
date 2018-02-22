From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] xen/tools: support Python 2 and Python 3
Date: Thu, 22 Feb 2018 12:54:27 +0000
Message-ID: <30c4e0c3-ad4b-82c2-ba75-44fab36d0d49@citrix.com>
References: <20180222055246.32522-1-cardoe@cardoe.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6725241632052357178=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=i0y4=fq=citrix.com=prvs=5842a8f9a=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1eoqOU-000822-NU
 for xen-devel@lists.xenproject.org; Thu, 22 Feb 2018 12:54:38 +0000
In-Reply-To: <20180222055246.32522-1-cardoe@cardoe.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Doug Goldstein <cardoe@cardoe.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

--===============6725241632052357178==
Content-Type: multipart/alternative;
	boundary="------------6B50B927B2AC13ABE8404A8A"
Content-Language: en-GB

--------------6B50B927B2AC13ABE8404A8A
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On 22/02/18 05:52, Doug Goldstein wrote:
> These changes should make it possible to support modern Pythons as well
> as the oldest Python 2 still supported.
>
> Signed-off-by: Doug Goldstein <cardoe@cardoe.com>

To the overall effect, this is definitely a good thing.  Some queries
however...

> ---
> CC: Andrew Cooper <andrew.cooper3@citrix.com>
> CC: George Dunlap <George.Dunlap@eu.citrix.com>
> CC: Ian Jackson <ian.jackson@eu.citrix.com>
> CC: Jan Beulich <jbeulich@suse.com>
> CC: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Tim Deegan <tim@xen.org>
> CC: Wei Liu <wei.liu2@citrix.com>
> ---
>  xen/tools/compat-build-header.py |  2 +-
>  xen/tools/compat-build-source.py |  2 +-
>  xen/tools/gen-cpuid.py           | 37 +++++++++++++++++++++++++++----------
>  xen/tools/get-fields.sh          |  2 +-
>  4 files changed, 30 insertions(+), 13 deletions(-)
>
> diff --git a/xen/tools/compat-build-header.py b/xen/tools/compat-build-header.py
> index 32421b645b..546371225d 100755
> --- a/xen/tools/compat-build-header.py
> +++ b/xen/tools/compat-build-header.py
> @@ -23,4 +23,4 @@ pats = [
>  for line in sys.stdin.readlines():
>      for pat in pats:
>          line = re.subn(pat[0], pat[1], line)[0]
> -    print line.rstrip()
> +    sys.stdout.write(line.rstrip() + '\n')

Is there anything wrong with print(line.rstrip()) which is the more
common way of doing this?

> diff --git a/xen/tools/compat-build-source.py b/xen/tools/compat-build-source.py
> index 595bc3ff58..8101290ebe 100755
> --- a/xen/tools/compat-build-source.py
> +++ b/xen/tools/compat-build-source.py
> @@ -26,4 +26,4 @@ for pat in pats:
>  for line in sys.stdin.readlines():
>      for pat in pats:
>          line = re.sub(pat[0], pat[1], line)
> -    print line.rstrip()
> +    sys.stdout.write(line.rstrip() + '\n')
> diff --git a/xen/tools/gen-cpuid.py b/xen/tools/gen-cpuid.py
> index 613b909c3d..d64f257816 100755
> --- a/xen/tools/gen-cpuid.py
> +++ b/xen/tools/gen-cpuid.py
> @@ -3,6 +3,13 @@
>  
>  import sys, os, re
>  
> +if (sys.version_info > (3, 0)):
> +    def long(x):
> +        return x

Strictly speaking, return int(x), however...

> +
> +    def xrange(x):
> +        return range(x)
> +
>  class Fail(Exception):
>      pass
>  
> @@ -98,13 +105,13 @@ def parse_definitions(state):
>  def featureset_to_uint32s(fs, nr):
>      """ Represent a featureset as a list of C-compatible uint32_t's """
>  
> -    bitmap = 0L
> +    bitmap = long(0)
>      for f in fs:
> -        bitmap |= 1L << f
> +        bitmap |= long(1) << f

Having tested this out, I think the L suffixes can just be dropped:

Python 2.4.3 (#1, Sep 21 2011, 20:06:00)
[GCC 4.1.2 20080704 (Red Hat 4.1.2-51)] on linux2
Type "help", "copyright", "credits" or "license" for more information.
>>> bitmap = 0
>>> type(bitmap)
<type 'int'>
>>> for x in xrange(80): bitmap |= 1 << x
...
>>> type(bitmap)
<type 'long'>
>>>

I don't recall why I wrote it like this, but I don't think its
necessary.  As a result, you shouldn't need to define long above.

~Andrew

--------------6B50B927B2AC13ABE8404A8A
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 22/02/18 05:52, Doug Goldstein
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20180222055246.32522-1-cardoe@cardoe.com">
      <pre wrap="">These changes should make it possible to support modern Pythons as well
as the oldest Python 2 still supported.

Signed-off-by: Doug Goldstein <a class="moz-txt-link-rfc2396E" href="mailto:cardoe@cardoe.com">&lt;cardoe@cardoe.com&gt;</a></pre>
    </blockquote>
    <br>
    To the overall effect, this is definitely a good thing.  Some
    queries however...<br>
    <br>
    <blockquote type="cite"
      cite="mid:20180222055246.32522-1-cardoe@cardoe.com">
      <pre wrap="">---
CC: Andrew Cooper <a class="moz-txt-link-rfc2396E" href="mailto:andrew.cooper3@citrix.com">&lt;andrew.cooper3@citrix.com&gt;</a>
CC: George Dunlap <a class="moz-txt-link-rfc2396E" href="mailto:George.Dunlap@eu.citrix.com">&lt;George.Dunlap@eu.citrix.com&gt;</a>
CC: Ian Jackson <a class="moz-txt-link-rfc2396E" href="mailto:ian.jackson@eu.citrix.com">&lt;ian.jackson@eu.citrix.com&gt;</a>
CC: Jan Beulich <a class="moz-txt-link-rfc2396E" href="mailto:jbeulich@suse.com">&lt;jbeulich@suse.com&gt;</a>
CC: Konrad Rzeszutek Wilk <a class="moz-txt-link-rfc2396E" href="mailto:konrad.wilk@oracle.com">&lt;konrad.wilk@oracle.com&gt;</a>
CC: Stefano Stabellini <a class="moz-txt-link-rfc2396E" href="mailto:sstabellini@kernel.org">&lt;sstabellini@kernel.org&gt;</a>
CC: Tim Deegan <a class="moz-txt-link-rfc2396E" href="mailto:tim@xen.org">&lt;tim@xen.org&gt;</a>
CC: Wei Liu <a class="moz-txt-link-rfc2396E" href="mailto:wei.liu2@citrix.com">&lt;wei.liu2@citrix.com&gt;</a>
---
 xen/tools/compat-build-header.py |  2 +-
 xen/tools/compat-build-source.py |  2 +-
 xen/tools/gen-cpuid.py           | 37 +++++++++++++++++++++++++++----------
 xen/tools/get-fields.sh          |  2 +-
 4 files changed, 30 insertions(+), 13 deletions(-)

diff --git a/xen/tools/compat-build-header.py b/xen/tools/compat-build-header.py
index 32421b645b..546371225d 100755
--- a/xen/tools/compat-build-header.py
+++ b/xen/tools/compat-build-header.py
@@ -23,4 +23,4 @@ pats = [
 for line in sys.stdin.readlines():
     for pat in pats:
         line = re.subn(pat[0], pat[1], line)[0]
-    print line.rstrip()
+    sys.stdout.write(line.rstrip() + '\n')</pre>
    </blockquote>
    <br>
    Is there anything wrong with print(line.rstrip()) which is the more
    common way of doing this?<br>
    <br>
    <blockquote type="cite"
      cite="mid:20180222055246.32522-1-cardoe@cardoe.com">
      <pre wrap="">diff --git a/xen/tools/compat-build-source.py b/xen/tools/compat-build-source.py
index 595bc3ff58..8101290ebe 100755
--- a/xen/tools/compat-build-source.py
+++ b/xen/tools/compat-build-source.py
@@ -26,4 +26,4 @@ for pat in pats:
 for line in sys.stdin.readlines():
     for pat in pats:
         line = re.sub(pat[0], pat[1], line)
-    print line.rstrip()
+    sys.stdout.write(line.rstrip() + '\n')
diff --git a/xen/tools/gen-cpuid.py b/xen/tools/gen-cpuid.py
index 613b909c3d..d64f257816 100755
--- a/xen/tools/gen-cpuid.py
+++ b/xen/tools/gen-cpuid.py
@@ -3,6 +3,13 @@
 
 import sys, os, re
 
+if (sys.version_info &gt; (3, 0)):
+    def long(x):
+        return x</pre>
    </blockquote>
    <br>
    Strictly speaking, return int(x), however...<br>
    <br>
    <blockquote type="cite"
      cite="mid:20180222055246.32522-1-cardoe@cardoe.com">
      <pre wrap="">+
+    def xrange(x):
+        return range(x)
+
 class Fail(Exception):
     pass
 
@@ -98,13 +105,13 @@ def parse_definitions(state):
 def featureset_to_uint32s(fs, nr):
     """ Represent a featureset as a list of C-compatible uint32_t's """
 
-    bitmap = 0L
+    bitmap = long(0)
     for f in fs:
-        bitmap |= 1L &lt;&lt; f
+        bitmap |= long(1) &lt;&lt; f</pre>
    </blockquote>
    <br>
    Having tested this out, I think the L suffixes can just be dropped:<br>
    <br>
    Python 2.4.3 (#1, Sep 21 2011, 20:06:00) <br>
    [GCC 4.1.2 20080704 (Red Hat 4.1.2-51)] on linux2<br>
    Type "help", "copyright", "credits" or "license" for more
    information.<br>
    &gt;&gt;&gt; bitmap = 0<br>
    &gt;&gt;&gt; type(bitmap)<br>
    &lt;type 'int'&gt;<br>
    &gt;&gt;&gt; for x in xrange(80): bitmap |= 1 &lt;&lt; x<br>
    ... <br>
    &gt;&gt;&gt; type(bitmap)<br>
    &lt;type 'long'&gt;<br>
    &gt;&gt;&gt; <br>
    <br>
    I don't recall why I wrote it like this, but I don't think its
    necessary.  As a result, you shouldn't need to define long above.<br>
    <br>
    ~Andrew
  </body>
</html>

--------------6B50B927B2AC13ABE8404A8A--


--===============6725241632052357178==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6725241632052357178==--
