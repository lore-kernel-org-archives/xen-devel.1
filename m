From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 0/3] docs: User oriented documentation
Date: Wed, 20 Mar 2019 16:47:43 +0000
Message-ID: <3a8c7455-e8e8-fb1e-1207-371ea86e1e31@citrix.com>
References: <1553012407-19885-1-git-send-email-andrew.cooper3@citrix.com>
 <20190320112036.GP14641@zion.uk.xensource.com>
 <7bd031df-b291-e9f9-3566-4fb02844eb06@citrix.com>
 <20190320112835.GQ14641@zion.uk.xensource.com>
 <1eeac531-5d94-a55f-1d53-a13faa4f902e@citrix.com>
 <23698.10415.31507.47727@mariner.uk.xensource.com>
 <7863e7f2-bcb4-d46b-1188-9a6941fdb135@citrix.com>
 <23698.28059.770728.572200@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3654251376730275443=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <23698.28059.770728.572200@mariner.uk.xensource.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@citrix.com>
Cc: Lars Kurth <lars.kurth@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@citrix.com>, Xen-devel <xen-devel@lists.xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

--===============3654251376730275443==
Content-Type: multipart/alternative;
	boundary="------------871BEFAD1BC217DC2C581DD8"
Content-Language: en-GB

--------------871BEFAD1BC217DC2C581DD8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

On 20/03/2019 16:43, Ian Jackson wrote:
> Andrew Cooper writes ("Re: [PATCH 0/3] docs: User oriented documentation"):
>> It turns out that I mis-interpreted the compatibility note in
>> https://www.kernel.org/doc/html/latest/doc-guide/sphinx.html# and
>> stretch is probably fine.
> OK, good.
>
> Well, I think we could say that to build this documentation you have
> to have the relevant tools.  sphinx is certainly well-regarded and
> this is probably a worthwhile upgrade.
>
> What do the earlier tools do ?  Should we print some warning and
> disable the build, or will they generate slightly-mangled output, or
> what ?

conf.py has version check in it.

On Jessie with native packages, the result is:

andrewcoop@andrewcoop:/local/xen.git/xen$ make -C ../docs/ sphinx-html
make: Entering directory '/local/xen.git/docs'
sphinx-build -b html . sphinx/html
Running Sphinx v1.2.3

Sphinx version error:
This project needs at least Sphinx v1.4 and therefore cannot be built with this version.
Makefile:55: recipe for target 'sphinx-html' failed
make: *** [sphinx-html] Error 1
make: Leaving directory '/local/xen.git/docs'

~Andrew

--------------871BEFAD1BC217DC2C581DD8
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 20/03/2019 16:43, Ian Jackson wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:23698.28059.770728.572200@mariner.uk.xensource.com">
      <pre class="moz-quote-pre" wrap="">Andrew Cooper writes ("Re: [PATCH 0/3] docs: User oriented documentation"):
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">It turns out that I mis-interpreted the compatibility note in
<a class="moz-txt-link-freetext" href="https://www.kernel.org/doc/html/latest/doc-guide/sphinx.html#">https://www.kernel.org/doc/html/latest/doc-guide/sphinx.html#</a> and
stretch is probably fine.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
OK, good.

Well, I think we could say that to build this documentation you have
to have the relevant tools.  sphinx is certainly well-regarded and
this is probably a worthwhile upgrade.

What do the earlier tools do ?  Should we print some warning and
disable the build, or will they generate slightly-mangled output, or
what ?</pre>
    </blockquote>
    <br>
    conf.py has version check in it.<br>
    <br>
    On Jessie with native packages, the result is:<br>
    <br>
    <pre><a class="moz-txt-link-abbreviated" href="mailto:andrewcoop@andrewcoop:/local/xen.git/xen$">andrewcoop@andrewcoop:/local/xen.git/xen$</a> make -C ../docs/ sphinx-html
make: Entering directory '/local/xen.git/docs'
sphinx-build -b html . sphinx/html
Running Sphinx v1.2.3

Sphinx version error:
This project needs at least Sphinx v1.4 and therefore cannot be built with this version.
Makefile:55: recipe for target 'sphinx-html' failed
make: *** [sphinx-html] Error 1
make: Leaving directory '/local/xen.git/docs'

</pre>
    ~Andrew<br>
  </body>
</html>

--------------871BEFAD1BC217DC2C581DD8--


--===============3654251376730275443==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3654251376730275443==--
