From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH for-next RFC 4/4] pygrub: make it build with
 python 3
Date: Tue, 5 Mar 2019 17:42:07 +0000
Message-ID: <8f0a909e-3cdc-6867-e295-99734e91237c@citrix.com>
References: <20190305164206.6793-1-wei.liu2@citrix.com>
 <20190305164206.6793-5-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8421380795406602582=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rxLf=RI=citrix.com=prvs=96038945f=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1h1E84-0005sH-RO
 for xen-devel@lists.xenproject.org; Tue, 05 Mar 2019 17:45:24 +0000
In-Reply-To: <20190305164206.6793-5-wei.liu2@citrix.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>, xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@eu.citrix.com>, Anthony PERARD <anthony.perard@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

--===============8421380795406602582==
Content-Type: multipart/alternative;
	boundary="------------9D81265E54E2DD9A20EA9328"
Content-Language: en-GB

--------------9D81265E54E2DD9A20EA9328
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On 05/03/2019 16:42, Wei Liu wrote:
> With the help of two porting guides and cpython source code:
>
> 1. Use PyUnicode to replace PyString counterparts.
> 2. Use PyVarObject_HEAD_INIT and provide compatibility for 2.5 and
>    earlier.
> 3. Remove usage of Py_FindMethod.
> 4. Use new module initialisation routine.
>
> For #3, Py_FindMethod was removed, yet an alternative wasn't
> documented.  The code is the result of reverse-engineering cpython
> commit 6116d4a1d1
>
> https://docs.python.org/3/howto/cporting.html
> http://python3porting.com/cextensions.html
>
> Signed-off-by: Wei Liu <wei.liu2@citrix.com>

Marek already made the tools/python/* libraries compatible with Py2 and Py3

The following commits are the relevant ones:

* be6b316 - python: handle long type in scripts (2 years ago) <Marek Marczykowski-Górecki>
* e16c705 - python: adjust module initalization for Python3 (2 years ago) <Marek Marczykowski-Górecki>
* dd986cd - python: use PyLong_* for constructing 'int' type in Python3 (2 years ago) <Marek Marczykowski-Górecki>
* 121d9d4 - python: use PyBytes/PyUnicode instead of PyString (2 years ago) <Marek Marczykowski-Górecki>
* 0c8981f - python: initialize specific fields of PyTypeObject (2 years ago) <Marek Marczykowski-Górecki>
* 7b1e5f7 - python: use Py_TYPE instead of looking directly into PyObject_HEAD (2 years ago) <Marek Marczykowski-Górecki>
* 96d1ee6 - python: drop tp_getattr implementation (2 years ago) <Marek Marczykowski-Górecki>
* 6b28df3 - python: check return value of PyErr_NewException (2 years ago) <Marek Marczykowski-Górecki>

Which in particular handle strings differently in the Py2 case.

~Andrew

--------------9D81265E54E2DD9A20EA9328
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 05/03/2019 16:42, Wei Liu wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20190305164206.6793-5-wei.liu2@citrix.com">
      <pre class="moz-quote-pre" wrap="">With the help of two porting guides and cpython source code:

1. Use PyUnicode to replace PyString counterparts.
2. Use PyVarObject_HEAD_INIT and provide compatibility for 2.5 and
   earlier.
3. Remove usage of Py_FindMethod.
4. Use new module initialisation routine.

For #3, Py_FindMethod was removed, yet an alternative wasn't
documented.  The code is the result of reverse-engineering cpython
commit 6116d4a1d1

<a class="moz-txt-link-freetext" href="https://docs.python.org/3/howto/cporting.html">https://docs.python.org/3/howto/cporting.html</a>
<a class="moz-txt-link-freetext" href="http://python3porting.com/cextensions.html">http://python3porting.com/cextensions.html</a>

Signed-off-by: Wei Liu <a class="moz-txt-link-rfc2396E" href="mailto:wei.liu2@citrix.com">&lt;wei.liu2@citrix.com&gt;</a></pre>
    </blockquote>
    <br>
    Marek already made the tools/python/* libraries compatible with Py2
    and Py3<br>
    <br>
    The following commits are the relevant ones:<br>
    <br>
    <pre>* be6b316 - python: handle long type in scripts (2 years ago) &lt;Marek Marczykowski-Górecki&gt;
* e16c705 - python: adjust module initalization for Python3 (2 years ago) &lt;Marek Marczykowski-Górecki&gt;
* dd986cd - python: use PyLong_* for constructing 'int' type in Python3 (2 years ago) &lt;Marek Marczykowski-Górecki&gt;
* 121d9d4 - python: use PyBytes/PyUnicode instead of PyString (2 years ago) &lt;Marek Marczykowski-Górecki&gt;
* 0c8981f - python: initialize specific fields of PyTypeObject (2 years ago) &lt;Marek Marczykowski-Górecki&gt;
* 7b1e5f7 - python: use Py_TYPE instead of looking directly into PyObject_HEAD (2 years ago) &lt;Marek Marczykowski-Górecki&gt;
* 96d1ee6 - python: drop tp_getattr implementation (2 years ago) &lt;Marek Marczykowski-Górecki&gt;
* 6b28df3 - python: check return value of PyErr_NewException (2 years ago) &lt;Marek Marczykowski-Górecki&gt;

</pre>
    Which in particular handle strings differently in the Py2 case.<br>
    <br>
    ~Andrew<br>
  </body>
</html>

--------------9D81265E54E2DD9A20EA9328--


--===============8421380795406602582==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8421380795406602582==--
