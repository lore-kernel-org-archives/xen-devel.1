From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] libx86: Work around GCC bug with ebx output
 constrants
Date: Mon, 19 Nov 2018 14:33:06 +0000
Message-ID: <b4d259ec-0d51-ac29-4341-a94bd78163ef@citrix.com>
References: <1542633088-11101-1-git-send-email-andrew.cooper3@citrix.com>
 <5BF2BFDE02000078001FD7D2@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4248395736723255128=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5BF2BFDE02000078001FD7D2@prv1-mh.provo.novell.com>
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

--===============4248395736723255128==
Content-Type: multipart/alternative;
	boundary="------------6C03F2E0CE8765280FDCC1D6"
Content-Language: en-GB

--------------6C03F2E0CE8765280FDCC1D6
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

On 19/11/2018 13:51, Jan Beulich wrote:
>>  static inline void cpuid_leaf(uint32_t leaf, struct cpuid_leaf *l)
>>  {
>> -    asm ( "cpuid"
>> -          : "=a" (l->a), "=b" (l->b), "=c" (l->c), "=d" (l->d)
>> +    asm ( XCHG_BX
>> +          "cpuid;"
>> +          XCHG_BX
>> +          : "=a" (l->a), BX_CON (l->b), "=c" (l->c), "=d" (l->d)
> Strictly speaking all other outputs also need to use =& in the
> 32-bit case. But I wouldn't insist on such an adjustment. With
> the others done
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Using =& for the constraints which also have inputs results "operand has
impossible constraints"

It should only matter for the output-only operands, to prevent GCC
allocating %[er]dx for the bx constraint, but that shouldn't matter
anyway because =&r can't be allocated to conflict with =d

~Andrew

--------------6C03F2E0CE8765280FDCC1D6
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 19/11/2018 13:51, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:5BF2BFDE02000078001FD7D2@prv1-mh.provo.novell.com">
      <blockquote type="cite" style="color: #000000;">
        <pre class="moz-quote-pre" wrap=""> static inline void cpuid_leaf(uint32_t leaf, struct cpuid_leaf *l)
 {
-    asm ( "cpuid"
-          : "=a" (l-&gt;a), "=b" (l-&gt;b), "=c" (l-&gt;c), "=d" (l-&gt;d)
+    asm ( XCHG_BX
+          "cpuid;"
+          XCHG_BX
+          : "=a" (l-&gt;a), BX_CON (l-&gt;b), "=c" (l-&gt;c), "=d" (l-&gt;d)
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">Strictly speaking all other outputs also need to use =&amp; in the
32-bit case. But I wouldn't insist on such an adjustment. With
the others done
Reviewed-by: Jan Beulich <a class="moz-txt-link-rfc2396E" href="mailto:jbeulich@suse.com" moz-do-not-send="true">&lt;jbeulich@suse.com&gt;</a>
</pre>
    </blockquote>
    <br>
    Using =&amp; for the constraints which also have inputs results
    "operand has impossible constraints"<br>
    <br>
    It should only matter for the output-only operands, to prevent GCC
    allocating %[er]dx for the bx constraint, but that shouldn't matter
    anyway because =&amp;r can't be allocated to conflict with =d<br>
    <br>
    ~Andrew<br>
  </body>
</html>

--------------6C03F2E0CE8765280FDCC1D6--


--===============4248395736723255128==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4248395736723255128==--
