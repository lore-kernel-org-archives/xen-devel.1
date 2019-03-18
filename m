From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2] x86/atomic: Improvements and
 simplifications to assembly constraints
Date: Mon, 18 Mar 2019 14:49:42 +0000
Message-ID: <d9bfae5c-cb77-dbed-1535-73af8aabaf10@citrix.com>
References: <1552908441-31533-1-git-send-email-andrew.cooper3@citrix.com>
 <5C8F9B14020000780021FE03@prv1-mh.provo.novell.com>
 <ccb17e4f-2be7-ad19-07e8-9891373badac@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7352400638286957191=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <ccb17e4f-2be7-ad19-07e8-9891373badac@citrix.com>
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
Cc: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

--===============7352400638286957191==
Content-Type: multipart/alternative;
	boundary="------------589A19EF7F8EE1724E230889"
Content-Language: en-GB

--------------589A19EF7F8EE1724E230889
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

On 18/03/2019 14:11, Andrew Cooper wrote:
>
>>> @@ -63,36 +65,38 @@ static always_inline __uint128_t cmpxchg16b_local_(
>>>   * If no fault occurs then _o is updated to the value we saw at _p. If this
>>>   * is the same as the initial value of _o then _n is written to location _p.
>>>   */
>>> -#define __cmpxchg_user(_p,_o,_n,_isuff,_oppre,_regtype)                 \
>>> +#define __cmpxchg_user(_p, _o, _n, _oppre)                              \
>>>      stac();                                                             \
>>>      asm volatile (                                                      \
>>> -        "1: lock; cmpxchg"_isuff" %"_oppre"2,%3\n"                      \
>>> +        "1: lock cmpxchg %"_oppre"[new], %[ptr]\n"                      \
>>>          "2:\n"                                                          \
>>>          ".section .fixup,\"ax\"\n"                                      \
>>> -        "3:     movl $1,%1\n"                                           \
>>> +        "3:     movl $1, %[rc]\n"                                       \
>>>          "       jmp 2b\n"                                               \
>>>          ".previous\n"                                                   \
>>>          _ASM_EXTABLE(1b, 3b)                                            \
>>> -        : "=a" (_o), "=r" (_rc)                                         \
>>> -        : _regtype (_n), "m" (*__xg((volatile void *)_p)), "0" (_o), "1" (0) \
>>> +        : "+a" (_o), [rc] "=r" (_rc),                                   \
>>> +          [ptr] "+m" (*(volatile typeof(*(_p)) *)(_p))                  \
>>> +        : [new] "r" (_n), "[rc]" (0)                                    \
>> Wouldn't it further help readability a little if _rc was initialized to zero
>> right when getting declared, eliminating the last input arg here (the
>> output then would need to be "+r" of course)?
> I can do.

I've got the following incremental fix which I intend to fold in.

diff --git a/xen/include/asm-x86/x86_64/system.h b/xen/include/asm-x86/x86_64/system.h
index 5b6e964..d65562b 100644
--- a/xen/include/asm-x86/x86_64/system.h
+++ b/xen/include/asm-x86/x86_64/system.h
@@ -65,7 +65,7 @@ static always_inline __uint128_t cmpxchg16b_local_(
  * If no fault occurs then _o is updated to the value we saw at _p. If this
  * is the same as the initial value of _o then _n is written to location _p.
  */
-#define __cmpxchg_user(_p, _o, _n, _oppre)                              \
+#define __cmpxchg_user(_p, _o, _n, _rc, _oppre)                         \
     stac();                                                             \
     asm volatile (                                                      \
         "1: lock cmpxchg %"_oppre"[new], %[ptr]\n"                      \
@@ -75,28 +75,29 @@ static always_inline __uint128_t cmpxchg16b_local_(
         "       jmp 2b\n"                                               \
         ".previous\n"                                                   \
         _ASM_EXTABLE(1b, 3b)                                            \
-        : "+a" (_o), [rc] "=r" (_rc),                                   \
+        : "+a" (_o), [rc] "+r" (_rc),                                   \
           [ptr] "+m" (*(volatile typeof(*(_p)) *)(_p))                  \
-        : [new] "r" (_n), "[rc]" (0)                                    \
+        : [new] "r" (_n)                                                \
         : "memory");                                                    \
     clac()
 
 #define cmpxchg_user(_p, _o, _n)                                        \
 ({                                                                      \
-    int _rc;                                                            \
+    int _rc = 0;                                                        \
+                                                                        \
     switch ( sizeof(*(_p)) )                                            \
     {                                                                   \
     case 1:                                                             \
-        __cmpxchg_user(_p, _o, _n, "b");                                \
+        __cmpxchg_user(_p, _o, _n, _rc, "b");                           \
         break;                                                          \
     case 2:                                                             \
-        __cmpxchg_user(_p, _o, _n, "w");                                \
+        __cmpxchg_user(_p, _o, _n, _rc, "w");                           \
         break;                                                          \
     case 4:                                                             \
-        __cmpxchg_user(_p, _o, _n, "k");                                \
+        __cmpxchg_user(_p, _o, _n, _rc, "k");                           \
         break;                                                          \
     case 8:                                                             \
-        __cmpxchg_user(_p, _o, _n, "q");                                \
+        __cmpxchg_user(_p, _o, _n, _rc, "q");                           \
         break;                                                          \
     }                                                                   \
     _rc;                                                                \


--------------589A19EF7F8EE1724E230889
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 18/03/2019 14:11, Andrew Cooper
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:ccb17e4f-2be7-ad19-07e8-9891373badac@citrix.com"><br>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">@@ -63,36 +65,38 @@ static always_inline __uint128_t cmpxchg16b_local_(
  * If no fault occurs then _o is updated to the value we saw at _p. If this
  * is the same as the initial value of _o then _n is written to location _p.
  */
-#define __cmpxchg_user(_p,_o,_n,_isuff,_oppre,_regtype)                 \
+#define __cmpxchg_user(_p, _o, _n, _oppre)                              \
     stac();                                                             \
     asm volatile (                                                      \
-        "1: lock; cmpxchg"_isuff" %"_oppre"2,%3\n"                      \
+        "1: lock cmpxchg %"_oppre"[new], %[ptr]\n"                      \
         "2:\n"                                                          \
         ".section .fixup,\"ax\"\n"                                      \
-        "3:     movl $1,%1\n"                                           \
+        "3:     movl $1, %[rc]\n"                                       \
         "       jmp 2b\n"                                               \
         ".previous\n"                                                   \
         _ASM_EXTABLE(1b, 3b)                                            \
-        : "=a" (_o), "=r" (_rc)                                         \
-        : _regtype (_n), "m" (*__xg((volatile void *)_p)), "0" (_o), "1" (0) \
+        : "+a" (_o), [rc] "=r" (_rc),                                   \
+          [ptr] "+m" (*(volatile typeof(*(_p)) *)(_p))                  \
+        : [new] "r" (_n), "[rc]" (0)                                    \
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">Wouldn't it further help readability a little if _rc was initialized to zero
right when getting declared, eliminating the last input arg here (the
output then would need to be "+r" of course)?
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I can do.</pre>
    </blockquote>
    <br>
    I've got the following incremental fix which I intend to fold in.<br>
    <br>
    <pre>diff --git a/xen/include/asm-x86/x86_64/system.h b/xen/include/asm-x86/x86_64/system.h
index 5b6e964..d65562b 100644
--- a/xen/include/asm-x86/x86_64/system.h
+++ b/xen/include/asm-x86/x86_64/system.h
@@ -65,7 +65,7 @@ static always_inline __uint128_t cmpxchg16b_local_(
  * If no fault occurs then _o is updated to the value we saw at _p. If this
  * is the same as the initial value of _o then _n is written to location _p.
  */
-#define __cmpxchg_user(_p, _o, _n, _oppre)                              \
+#define __cmpxchg_user(_p, _o, _n, _rc, _oppre)                         \
     stac();                                                             \
     asm volatile (                                                      \
         "1: lock cmpxchg %"_oppre"[new], %[ptr]\n"                      \
@@ -75,28 +75,29 @@ static always_inline __uint128_t cmpxchg16b_local_(
         "       jmp 2b\n"                                               \
         ".previous\n"                                                   \
         _ASM_EXTABLE(1b, 3b)                                            \
-        : "+a" (_o), [rc] "=r" (_rc),                                   \
+        : "+a" (_o), [rc] "+r" (_rc),                                   \
           [ptr] "+m" (*(volatile typeof(*(_p)) *)(_p))                  \
-        : [new] "r" (_n), "[rc]" (0)                                    \
+        : [new] "r" (_n)                                                \
         : "memory");                                                    \
     clac()
 
 #define cmpxchg_user(_p, _o, _n)                                        \
 ({                                                                      \
-    int _rc;                                                            \
+    int _rc = 0;                                                        \
+                                                                        \
     switch ( sizeof(*(_p)) )                                            \
     {                                                                   \
     case 1:                                                             \
-        __cmpxchg_user(_p, _o, _n, "b");                                \
+        __cmpxchg_user(_p, _o, _n, _rc, "b");                           \
         break;                                                          \
     case 2:                                                             \
-        __cmpxchg_user(_p, _o, _n, "w");                                \
+        __cmpxchg_user(_p, _o, _n, _rc, "w");                           \
         break;                                                          \
     case 4:                                                             \
-        __cmpxchg_user(_p, _o, _n, "k");                                \
+        __cmpxchg_user(_p, _o, _n, _rc, "k");                           \
         break;                                                          \
     case 8:                                                             \
-        __cmpxchg_user(_p, _o, _n, "q");                                \
+        __cmpxchg_user(_p, _o, _n, _rc, "q");                           \
         break;                                                          \
     }                                                                   \
     _rc;                                                                \

</pre>
  </body>
</html>

--------------589A19EF7F8EE1724E230889--


--===============7352400638286957191==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7352400638286957191==--
