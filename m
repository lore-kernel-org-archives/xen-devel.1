From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v5 10/14] x86/HVM: do actual CMPXCHG in
	hvmemul_cmpxchg()
Date: Thu, 15 Mar 2018 15:28:32 +0000
Message-ID: <e6de4aab-3cc0-ed7b-18c3-3884a154c214@citrix.com>
References: <5AAA7BAF02000078001B2242@prv-mh.provo.novell.com>
 <5AAA7EBA02000078001B2291@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8574433916266512038=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=h5rp=gf=citrix.com=prvs=605c7d53e=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ewV2e-00053w-FH
 for xen-devel@lists.xenproject.org; Thu, 15 Mar 2018 15:43:44 +0000
In-Reply-To: <5AAA7EBA02000078001B2291@prv-mh.provo.novell.com>
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

--===============8574433916266512038==
Content-Type: multipart/alternative;
	boundary="------------2B2CC44E3CEE93635FE418B5"
Content-Language: en-GB

--------------2B2CC44E3CEE93635FE418B5
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

On 15/03/18 13:10, Jan Beulich wrote:
> ..., at least as far as currently possible, i.e. when a mapping can be
> obtained.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Reviewed-by: Paul Durrant <paul.durrant@citrix.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

--------------2B2CC44E3CEE93635FE418B5
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 15/03/18 13:10, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:5AAA7EBA02000078001B2291@prv-mh.provo.novell.com">
      <pre wrap="">..., at least as far as currently possible, i.e. when a mapping can be
obtained.

Signed-off-by: Jan Beulich <a class="moz-txt-link-rfc2396E" href="mailto:jbeulich@suse.com">&lt;jbeulich@suse.com&gt;</a>
Reviewed-by: Paul Durrant <a class="moz-txt-link-rfc2396E" href="mailto:paul.durrant@citrix.com">&lt;paul.durrant@citrix.com&gt;</a></pre>
    </blockquote>
    <br>
    Acked-by: Andrew Cooper <a class="moz-txt-link-rfc2396E" href="mailto:andrew.cooper3@citrix.com">&lt;andrew.cooper3@citrix.com&gt;</a><br>
  </body>
</html>

--------------2B2CC44E3CEE93635FE418B5--


--===============8574433916266512038==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8574433916266512038==--
