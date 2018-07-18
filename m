From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 2/6] x86: distinguish CPU offlining from
 CPU removal
Date: Wed, 18 Jul 2018 15:35:08 +0100
Message-ID: <5cbce79d-9de3-c9a2-08fe-8806e397e864@citrix.com>
References: <5B4EF70702000078001D53C7@prv1-mh.provo.novell.com>
 <5B4EF81102000078001D53D4@prv1-mh.provo.novell.com>
 <20180718113754.q2cgcev2ctazw67a@mac>
 <5B4F4F2002000078001D57E2@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6510611574803853392=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=dg1m=kc=citrix.com=prvs=730a7d111=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ffnXr-0005D8-Qi
 for xen-devel@lists.xenproject.org; Wed, 18 Jul 2018 14:35:11 +0000
In-Reply-To: <5B4F4F2002000078001D57E2@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

--===============6510611574803853392==
Content-Type: multipart/alternative;
	boundary="------------7BB3149A31BA071B64A75D3F"
Content-Language: en-GB

--------------7BB3149A31BA071B64A75D3F
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

On 18/07/18 15:30, Jan Beulich wrote:
>>> --- a/xen/include/xen/xmalloc.h
>>> +++ b/xen/include/xen/xmalloc.h
>>> @@ -42,6 +42,12 @@
>>>  /* Free any of the above. */
>>>  extern void xfree(void *);
>>>  
>>> +/* Free an allocation, and zero the pointer to it. */
>>> +#define XFREE(p) do { \
>>> +    xfree(p);         \
>>> +    (p) = NULL;       \
>>> +} while ( false )
>> Do you need the do { ... } while construct here? Isn't it enough to
>> use ({ ... })?
> I try to avoid gcc extensions when the same can be achieved without.
> Furthermore I'd prefer if the construct was not usable as rvalue.

Yes - the do { } while ( 0 ) style here is actually more useful than ({
}) to prevent caller (mis)use.

~Andrew

--------------7BB3149A31BA071B64A75D3F
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 18/07/18 15:30, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:5B4F4F2002000078001D57E2@prv1-mh.provo.novell.com">
      <blockquote type="cite" style="color: #000000;">
        <blockquote type="cite" style="color: #000000;">
          <pre wrap="">--- a/xen/include/xen/xmalloc.h
+++ b/xen/include/xen/xmalloc.h
@@ -42,6 +42,12 @@
 /* Free any of the above. */
 extern void xfree(void *);
 
+/* Free an allocation, and zero the pointer to it. */
+#define XFREE(p) do { \
+    xfree(p);         \
+    (p) = NULL;       \
+} while ( false )
</pre>
        </blockquote>
        <pre wrap="">Do you need the do { ... } while construct here? Isn't it enough to
use ({ ... })?
</pre>
      </blockquote>
      <pre wrap="">I try to avoid gcc extensions when the same can be achieved without.
Furthermore I'd prefer if the construct was not usable as rvalue.
</pre>
    </blockquote>
    <br>
    Yes - the do { } while ( 0 ) style here is actually more useful than
    ({ }) to prevent caller (mis)use.<br>
    <br>
    ~Andrew<br>
  </body>
</html>

--------------7BB3149A31BA071B64A75D3F--


--===============6510611574803853392==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6510611574803853392==--
