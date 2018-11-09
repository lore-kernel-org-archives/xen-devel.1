From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 2/6] libx86: Split
 x86_cpuid_policy_fill_native() out of calculate_raw_policy()
Date: Fri, 9 Nov 2018 16:24:06 +0000
Message-ID: <1fd922d8-ec20-1173-a472-579a507c531c@citrix.com>
References: <1541416867-30253-1-git-send-email-andrew.cooper3@citrix.com>
 <1541416867-30253-3-git-send-email-andrew.cooper3@citrix.com>
 <5BE19AA602000078001F89E5@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============9172188827756113419=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5BE19AA602000078001F89E5@prv1-mh.provo.novell.com>
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
Cc: Wei Liu <wei.liu2@citrix.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

--===============9172188827756113419==
Content-Type: multipart/alternative;
	boundary="------------48D9EAA3DAF16E7A59FAE847"
Content-Language: en-GB

--------------48D9EAA3DAF16E7A59FAE847
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On 06/11/18 13:44, Jan Beulich wrote:
>>>> On 05.11.18 at 12:21, <andrew.cooper3@citrix.com> wrote:
>> --- a/xen/include/xen/lib/x86/cpuid.h
>> +++ b/xen/include/xen/lib/x86/cpuid.h
>> @@ -20,6 +20,21 @@ struct cpuid_leaf
>>      uint32_t a, b, c, d;
>>  };
>>  
>> +static inline void cpuid_leaf(uint32_t leaf, struct cpuid_leaf *l)
>> +{
>> +    asm volatile ( "cpuid"
>> +                   : "=a" (l->a), "=b" (l->b), "=c" (l->c), "=d" (l->d)
>> +                   : "a" (leaf) );
>> +}
>> +
>> +static inline void cpuid_count_leaf(
>> +    uint32_t leaf, uint32_t subleaf, struct cpuid_leaf *l)
>> +{
>> +    asm volatile ( "cpuid"
>> +                   : "=a" (l->a), "=b" (l->b), "=c" (l->c), "=d" (l->d)
>> +                   : "a" (leaf), "c" (subleaf) );
>> +}
> Especially with this now being library code (i.e. side effects like
> serialization not being supposed to be of interest): Why
> volatile?

Force of habit, I think.  I'll drop volatile here.

We should probably do the same for Xen, although there is one place in
the Intel ucode handler which would need adjusting to cope.

>> --- a/xen/lib/x86/cpuid.c
>> +++ b/xen/lib/x86/cpuid.c
>> @@ -2,6 +2,114 @@
>>  
>>  #include <xen/lib/x86/cpuid.h>
>>  
>> +void x86_cpuid_policy_fill_native(struct cpuid_policy *p)
>> +{
>> +    unsigned int i;
>> +
>> +    cpuid_leaf(0, &p->basic.raw[0]);
>> +    for ( i = 1; i < min(ARRAY_SIZE(p->basic.raw),
>> +                         p->basic.max_leaf + 1ul); ++i )
>> +    {
>> +        switch ( i )
>> +        {
>> +        case 0x4: case 0x7: case 0xb: case 0xd:
>> +            /* Multi-invocation leaves.  Deferred. */
>> +            continue;
>> +        }
>> +
>> +        cpuid_leaf(i, &p->basic.raw[i]);
>> +    }
>> +
>> +    if ( p->basic.max_leaf >= 4 )
>> +    {
>> +        for ( i = 0; i < ARRAY_SIZE(p->cache.raw); ++i )
>> +        {
>> +            union {
>> +                struct cpuid_leaf l;
>> +                struct cpuid_cache_leaf c;
>> +            } u;
>> +
>> +            cpuid_count_leaf(4, i, &u.l);
>> +
>> +            if ( u.c.type == 0 )
>> +                break;
>> +
>> +            p->cache.subleaf[i] = u.c;
>> +        }
>> +
>> +        /*
>> +         * The choice of CPUID_GUEST_NR_CACHE is arbitrary.  It is expected
>> +         * that it will eventually need increasing for future hardware.
>> +         */
>> +#ifdef __XEN__
>> +        if ( i == ARRAY_SIZE(p->cache.raw) )
>> +            printk(XENLOG_WARNING
>> +                   "CPUID: Insufficient Leaf 4 space for this hardware\n");
>> +#endif
> There being another similar instance further down, and possibly
> new ones to appear later, plus such a warning potentially also
> being of interest in the harness - would you mind abstracting
> (could be as simple as making printk() and XENLOG_* available
> where needed, provided there's no consumer which would
> rather not want such logging) this so it can go without #ifdef-ary?

Well - it was this consideration which caused me to omit it.

Realistically, the first situation to hit this message will be someone
booting Xen on a brand new piece of hardware, so I expect changes to the
structure size to come from vendors.

One user is the AFL fuzzer, and that definitely doesn't want to be
spitting out a warning on every fork().  The other current user is the
x86 instruction emulator, where this functionality isn't the interesting
part.  Furthermore, I don't expect the toolstack to be making use of
this itself, so it won't be useful to attempt to plumb the message
through there.

~Andrew

--------------48D9EAA3DAF16E7A59FAE847
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 06/11/18 13:44, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:5BE19AA602000078001F89E5@prv1-mh.provo.novell.com">
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="">On 05.11.18 at 12:21, <a class="moz-txt-link-rfc2396E" href="mailto:andrew.cooper3@citrix.com">&lt;andrew.cooper3@citrix.com&gt;</a> wrote:
</pre>
          </blockquote>
        </blockquote>
        <pre wrap="">--- a/xen/include/xen/lib/x86/cpuid.h
+++ b/xen/include/xen/lib/x86/cpuid.h
@@ -20,6 +20,21 @@ struct cpuid_leaf
     uint32_t a, b, c, d;
 };
 
+static inline void cpuid_leaf(uint32_t leaf, struct cpuid_leaf *l)
+{
+    asm volatile ( "cpuid"
+                   : "=a" (l-&gt;a), "=b" (l-&gt;b), "=c" (l-&gt;c), "=d" (l-&gt;d)
+                   : "a" (leaf) );
+}
+
+static inline void cpuid_count_leaf(
+    uint32_t leaf, uint32_t subleaf, struct cpuid_leaf *l)
+{
+    asm volatile ( "cpuid"
+                   : "=a" (l-&gt;a), "=b" (l-&gt;b), "=c" (l-&gt;c), "=d" (l-&gt;d)
+                   : "a" (leaf), "c" (subleaf) );
+}
</pre>
      </blockquote>
      <pre wrap="">Especially with this now being library code (i.e. side effects like
serialization not being supposed to be of interest): Why
volatile?</pre>
    </blockquote>
    <br>
    Force of habit, I think.  I'll drop volatile here.<br>
    <br>
    We should probably do the same for Xen, although there is one place
    in the Intel ucode handler which would need adjusting to cope.<br>
    <br>
    <blockquote type="cite"
      cite="mid:5BE19AA602000078001F89E5@prv1-mh.provo.novell.com">
      <pre wrap="">
</pre>
      <blockquote type="cite">
        <pre wrap="">--- a/xen/lib/x86/cpuid.c
+++ b/xen/lib/x86/cpuid.c
@@ -2,6 +2,114 @@
 
 #include &lt;xen/lib/x86/cpuid.h&gt;
 
+void x86_cpuid_policy_fill_native(struct cpuid_policy *p)
+{
+    unsigned int i;
+
+    cpuid_leaf(0, &amp;p-&gt;basic.raw[0]);
+    for ( i = 1; i &lt; min(ARRAY_SIZE(p-&gt;basic.raw),
+                         p-&gt;basic.max_leaf + 1ul); ++i )
+    {
+        switch ( i )
+        {
+        case 0x4: case 0x7: case 0xb: case 0xd:
+            /* Multi-invocation leaves.  Deferred. */
+            continue;
+        }
+
+        cpuid_leaf(i, &amp;p-&gt;basic.raw[i]);
+    }
+
+    if ( p-&gt;basic.max_leaf &gt;= 4 )
+    {
+        for ( i = 0; i &lt; ARRAY_SIZE(p-&gt;cache.raw); ++i )
+        {
+            union {
+                struct cpuid_leaf l;
+                struct cpuid_cache_leaf c;
+            } u;
+
+            cpuid_count_leaf(4, i, &amp;u.l);
+
+            if ( u.c.type == 0 )
+                break;
+
+            p-&gt;cache.subleaf[i] = u.c;
+        }
+
+        /*
+         * The choice of CPUID_GUEST_NR_CACHE is arbitrary.  It is expected
+         * that it will eventually need increasing for future hardware.
+         */
+#ifdef __XEN__
+        if ( i == ARRAY_SIZE(p-&gt;cache.raw) )
+            printk(XENLOG_WARNING
+                   "CPUID: Insufficient Leaf 4 space for this hardware\n");
+#endif
</pre>
      </blockquote>
      <pre wrap="">There being another similar instance further down, and possibly
new ones to appear later, plus such a warning potentially also
being of interest in the harness - would you mind abstracting
(could be as simple as making printk() and XENLOG_* available
where needed, provided there's no consumer which would
rather not want such logging) this so it can go without #ifdef-ary?</pre>
    </blockquote>
    <br>
    Well - it was this consideration which caused me to omit it.<br>
    <br>
    Realistically, the first situation to hit this message will be
    someone booting Xen on a brand new piece of hardware, so I expect
    changes to the structure size to come from vendors.<br>
    <br>
    One user is the AFL fuzzer, and that definitely doesn't want to be
    spitting out a warning on every fork().  The other current user is
    the x86 instruction emulator, where this functionality isn't the
    interesting part.  Furthermore, I don't expect the toolstack to be
    making use of this itself, so it won't be useful to attempt to plumb
    the message through there.<br>
    <br>
    ~Andrew<br>
  </body>
</html>

--------------48D9EAA3DAF16E7A59FAE847--


--===============9172188827756113419==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============9172188827756113419==--
