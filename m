From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 3/3] tools/cpu-policy: Add unit tests and a
 fuzzing harness
Date: Mon, 25 Feb 2019 11:56:05 +0000
Message-ID: <f4bf5277-fa83-2a71-ca35-f81e3343f9b7@citrix.com>
References: <1546616022-32229-1-git-send-email-andrew.cooper3@citrix.com>
 <1546616022-32229-4-git-send-email-andrew.cooper3@citrix.com>
 <5C3335AE020000780020ACBD@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5205316999730317807=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5C3335AE020000780020ACBD@prv1-mh.provo.novell.com>
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
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Xen-devel <xen-devel@lists.xen.org>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

--===============5205316999730317807==
Content-Type: multipart/alternative;
	boundary="------------68C3C4CF66C532EF09D00FB4"
Content-Language: en-GB

--------------68C3C4CF66C532EF09D00FB4
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On 07/01/2019 11:19, Jan Beulich wrote:
>>>> On 04.01.19 at 16:33, <andrew.cooper3@citrix.com> wrote:
>> The AFL harness currently notices that there are cases where we optimse the
>> serialised stream by omitting data beyond the various maximum leaves.
>>
>> Both sets of tests will be extended with further libx86 work.
>>
>> Fix the sorting of the CPUID_GUEST_NR_* constants, noticed while writing the
>> unit tests.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Wei Liu <wei.liu2@citrix.com>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>> CC: Sergey Dyasli <sergey.dyasli@citrix.com>
>> ---
>>  tools/fuzz/cpu-policy/.gitignore          |   1 +
>>  tools/fuzz/cpu-policy/Makefile            |  27 ++++
>>  tools/fuzz/cpu-policy/afl-policy-fuzzer.c | 117 ++++++++++++++
>>  tools/tests/Makefile                      |   1 +
>>  tools/tests/cpu-policy/.gitignore         |   1 +
> Did we somehow come to the conclusion that the central .gitignore
> at the root of the tree is not the way to go in the future?

We've already got several examples in the tree.

andrewcoop@andrewcoop:/local/xen.git$ git ls-files | grep gitignore
.gitignore
tools/tests/vhpet/.gitignore
xen/tools/kconfig/.gitignore
xen/tools/kconfig/lxdialog/.gitignore
xen/xsm/flask/.gitignore

As for the pro's of using split ignores, fewer collisions for backported
changes, and no forgetting to update the root .gitconfig when you move
directories.

>
>> --- /dev/null
>> +++ b/tools/tests/cpu-policy/test-cpu-policy.c
>> @@ -0,0 +1,247 @@
>> +#include <assert.h>
>> +#include <errno.h>
>> +#include <stdbool.h>
>> +#include <stdint.h>
>> +#include <stdio.h>
>> +#include <stdlib.h>
>> +#include <string.h>
>> +
>> +#include <xen-tools/libs.h>
>> +#include <xen/lib/x86/cpuid.h>
>> +#include <xen/lib/x86/msr.h>
>> +#include <xen/domctl.h>
>> +
>> +static void test_cpuid_serialise_success(void)
>> +{
>> +    static const struct test {
>> +        struct cpuid_policy p;
>> +        const char *name;
>> +        unsigned int nr_leaves;
>> +    } tests[] = {
>> +        {
>> +            .name = "empty policy",
>> +            .nr_leaves = 4,
>> +        },
>> +    };
>> +    unsigned int i;
>> +
>> +    printf("Testing CPUID serialise success:\n");
>> +
>> +    for ( i = 0; i < ARRAY_SIZE(tests); ++i )
>> +    {
>> +        const struct test *t = &tests[i];
>> +        unsigned int nr = t->nr_leaves;
>> +        xen_cpuid_leaf_t *leaves = malloc(nr * sizeof(*leaves));
>> +        int rc;
>> +
>> +        if ( !leaves )
>> +            goto test_done;
> Shouldn't you leave some indication of the test not having got run?

I've swapped this for a hard error.  Its not going to fail in practice.

>
>> +static void test_cpuid_deserialise_failure(void)
>> +{
>> +    static const struct test {
>> +        const char *name;
>> +        xen_cpuid_leaf_t leaf;
>> +    } tests[] = {
>> +        {
>> +            .name = "incorrect basic subleaf",
>> +            .leaf = { .leaf = 0, .subleaf = 0 },
>> +        },
>> +        {
>> +            .name = "incorrect hv1 subleaf",
>> +            .leaf = { .leaf = 0x40000000, .subleaf = 0 },
>> +        },
>> +        {
>> +            .name = "incorrect hv2 subleaf",
>> +            .leaf = { .leaf = 0x40000100, .subleaf = 0 },
>> +        },
>> +        {
>> +            .name = "incorrect extd subleaf",
>> +            .leaf = { .leaf = 0x80000000, .subleaf = 0 },
>> +        },
>> +        {
>> +            .name = "OoB basic leaf",
>> +            .leaf = { .leaf = CPUID_GUEST_NR_BASIC },
>> +        },
>> +        {
>> +            .name = "OoB cache leaf",
>> +            .leaf = { .leaf = 0x4, .subleaf = CPUID_GUEST_NR_CACHE },
>> +        },
>> +        {
>> +            .name = "OoB feat leaf",
>> +            .leaf = { .leaf = 0x7, .subleaf = CPUID_GUEST_NR_FEAT },
>> +        },
>> +        {
>> +            .name = "OoB topo leaf",
>> +            .leaf = { .leaf = 0xb, .subleaf = CPUID_GUEST_NR_TOPO },
>> +        },
>> +        {
>> +            .name = "OoB xstate leaf",
>> +            .leaf = { .leaf = 0xd, .subleaf = CPUID_GUEST_NR_XSTATE },
>> +        },
>> +        {
>> +            .name = "OoB extd leaf",
>> +            .leaf = { .leaf = 0x80000000 | CPUID_GUEST_NR_EXTD },
>> +        },
>> +    };
>> +    unsigned int i;
>> +
>> +    printf("Testing CPUID deserialise failure:\n");
>> +
>> +    for ( i = 0; i < ARRAY_SIZE(tests); ++i )
>> +    {
>> +        const struct test *t = &tests[i];
>> +        uint32_t err_leaf = ~0u, err_subleaf = ~0u;
>> +        int rc;
>> +
>> +        rc = x86_cpuid_copy_from_buffer(NULL, &t->leaf, 1,
>> +                                        &err_leaf, &err_subleaf);
>> +
>> +        if ( rc != -ERANGE )
>> +        {
>> +            printf("  Test %s, expected rc %d, got %d\n",
>> +                   t->name, -ERANGE, rc);
>> +            continue;
> Perhaps drop this? The subsequent test ought to apply regardless
> of error code.

The common case is no failures at all.  However, once something has gone
wrong, spewing cascade errors gets in the way, rather than being helpful.

~Andrew

--------------68C3C4CF66C532EF09D00FB4
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 07/01/2019 11:19, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:5C3335AE020000780020ACBD@prv1-mh.provo.novell.com">
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">On 04.01.19 at 16:33, <a class="moz-txt-link-rfc2396E" href="mailto:andrew.cooper3@citrix.com">&lt;andrew.cooper3@citrix.com&gt;</a> wrote:
</pre>
          </blockquote>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">The AFL harness currently notices that there are cases where we optimse the
serialised stream by omitting data beyond the various maximum leaves.

Both sets of tests will be extended with further libx86 work.

Fix the sorting of the CPUID_GUEST_NR_* constants, noticed while writing the
unit tests.

Signed-off-by: Andrew Cooper <a class="moz-txt-link-rfc2396E" href="mailto:andrew.cooper3@citrix.com">&lt;andrew.cooper3@citrix.com&gt;</a>
---
CC: Jan Beulich <a class="moz-txt-link-rfc2396E" href="mailto:JBeulich@suse.com">&lt;JBeulich@suse.com&gt;</a>
CC: Wei Liu <a class="moz-txt-link-rfc2396E" href="mailto:wei.liu2@citrix.com">&lt;wei.liu2@citrix.com&gt;</a>
CC: Roger Pau Monné <a class="moz-txt-link-rfc2396E" href="mailto:roger.pau@citrix.com">&lt;roger.pau@citrix.com&gt;</a>
CC: Sergey Dyasli <a class="moz-txt-link-rfc2396E" href="mailto:sergey.dyasli@citrix.com">&lt;sergey.dyasli@citrix.com&gt;</a>
---
 tools/fuzz/cpu-policy/.gitignore          |   1 +
 tools/fuzz/cpu-policy/Makefile            |  27 ++++
 tools/fuzz/cpu-policy/afl-policy-fuzzer.c | 117 ++++++++++++++
 tools/tests/Makefile                      |   1 +
 tools/tests/cpu-policy/.gitignore         |   1 +
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Did we somehow come to the conclusion that the central .gitignore
at the root of the tree is not the way to go in the future?</pre>
    </blockquote>
    <br>
    We've already got several examples in the tree.<br>
    <br>
    <pre><a class="moz-txt-link-abbreviated" href="mailto:andrewcoop@andrewcoop:/local/xen.git$">andrewcoop@andrewcoop:/local/xen.git$</a> git ls-files | grep gitignore
.gitignore
tools/tests/vhpet/.gitignore
xen/tools/kconfig/.gitignore
xen/tools/kconfig/lxdialog/.gitignore
xen/xsm/flask/.gitignore

</pre>
    As for the pro's of using split ignores, fewer collisions for
    backported changes, and no forgetting to update the root .gitconfig
    when you move directories.<br>
    <br>
    <blockquote type="cite"
      cite="mid:5C3335AE020000780020ACBD@prv1-mh.provo.novell.com">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">--- /dev/null
+++ b/tools/tests/cpu-policy/test-cpu-policy.c
@@ -0,0 +1,247 @@
+#include &lt;assert.h&gt;
+#include &lt;errno.h&gt;
+#include &lt;stdbool.h&gt;
+#include &lt;stdint.h&gt;
+#include &lt;stdio.h&gt;
+#include &lt;stdlib.h&gt;
+#include &lt;string.h&gt;
+
+#include &lt;xen-tools/libs.h&gt;
+#include &lt;xen/lib/x86/cpuid.h&gt;
+#include &lt;xen/lib/x86/msr.h&gt;
+#include &lt;xen/domctl.h&gt;
+
+static void test_cpuid_serialise_success(void)
+{
+    static const struct test {
+        struct cpuid_policy p;
+        const char *name;
+        unsigned int nr_leaves;
+    } tests[] = {
+        {
+            .name = "empty policy",
+            .nr_leaves = 4,
+        },
+    };
+    unsigned int i;
+
+    printf("Testing CPUID serialise success:\n");
+
+    for ( i = 0; i &lt; ARRAY_SIZE(tests); ++i )
+    {
+        const struct test *t = &amp;tests[i];
+        unsigned int nr = t-&gt;nr_leaves;
+        xen_cpuid_leaf_t *leaves = malloc(nr * sizeof(*leaves));
+        int rc;
+
+        if ( !leaves )
+            goto test_done;
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Shouldn't you leave some indication of the test not having got run?</pre>
    </blockquote>
    <br>
    I've swapped this for a hard error.  Its not going to fail in
    practice.<br>
    <br>
    <blockquote type="cite"
      cite="mid:5C3335AE020000780020ACBD@prv1-mh.provo.novell.com">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+static void test_cpuid_deserialise_failure(void)
+{
+    static const struct test {
+        const char *name;
+        xen_cpuid_leaf_t leaf;
+    } tests[] = {
+        {
+            .name = "incorrect basic subleaf",
+            .leaf = { .leaf = 0, .subleaf = 0 },
+        },
+        {
+            .name = "incorrect hv1 subleaf",
+            .leaf = { .leaf = 0x40000000, .subleaf = 0 },
+        },
+        {
+            .name = "incorrect hv2 subleaf",
+            .leaf = { .leaf = 0x40000100, .subleaf = 0 },
+        },
+        {
+            .name = "incorrect extd subleaf",
+            .leaf = { .leaf = 0x80000000, .subleaf = 0 },
+        },
+        {
+            .name = "OoB basic leaf",
+            .leaf = { .leaf = CPUID_GUEST_NR_BASIC },
+        },
+        {
+            .name = "OoB cache leaf",
+            .leaf = { .leaf = 0x4, .subleaf = CPUID_GUEST_NR_CACHE },
+        },
+        {
+            .name = "OoB feat leaf",
+            .leaf = { .leaf = 0x7, .subleaf = CPUID_GUEST_NR_FEAT },
+        },
+        {
+            .name = "OoB topo leaf",
+            .leaf = { .leaf = 0xb, .subleaf = CPUID_GUEST_NR_TOPO },
+        },
+        {
+            .name = "OoB xstate leaf",
+            .leaf = { .leaf = 0xd, .subleaf = CPUID_GUEST_NR_XSTATE },
+        },
+        {
+            .name = "OoB extd leaf",
+            .leaf = { .leaf = 0x80000000 | CPUID_GUEST_NR_EXTD },
+        },
+    };
+    unsigned int i;
+
+    printf("Testing CPUID deserialise failure:\n");
+
+    for ( i = 0; i &lt; ARRAY_SIZE(tests); ++i )
+    {
+        const struct test *t = &amp;tests[i];
+        uint32_t err_leaf = ~0u, err_subleaf = ~0u;
+        int rc;
+
+        rc = x86_cpuid_copy_from_buffer(NULL, &amp;t-&gt;leaf, 1,
+                                        &amp;err_leaf, &amp;err_subleaf);
+
+        if ( rc != -ERANGE )
+        {
+            printf("  Test %s, expected rc %d, got %d\n",
+                   t-&gt;name, -ERANGE, rc);
+            continue;
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Perhaps drop this? The subsequent test ought to apply regardless
of error code.</pre>
    </blockquote>
    <br>
    The common case is no failures at all.  However, once something has
    gone wrong, spewing cascade errors gets in the way, rather than
    being helpful.<br>
    <br>
    ~Andrew<br>
  </body>
</html>

--------------68C3C4CF66C532EF09D00FB4--


--===============5205316999730317807==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5205316999730317807==--
