From: Christopher Clark <christopher.w.clark@gmail.com>
Subject: Re: [PATCH v3] firmware/shim : filter output files
 during Xen tree setup
Date: Sun, 29 Jul 2018 18:22:38 -0700
Message-ID: <CACMJ4GYHc6A1FCyjkFGkqgEqbFzb=Cjx66UnJP1=xT-O1NwmLg@mail.gmail.com>
References: <1532639806-21606-1-git-send-email-christopher.w.clark@gmail.com>
 <5B5AD91802000078001D8662@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1341614963986671735=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=/ejs=ko=gmail.com=christopher.w.clark@srs-us1.protection.inumbo.net>)
 id 1fjwtX-0004HW-5h
 for xen-devel@lists.xenproject.org; Mon, 30 Jul 2018 01:22:43 +0000
Received: by mail-lf1-x132.google.com with SMTP id f135-v6so6959913lfg.10
 for <xen-devel@lists.xenproject.org>; Sun, 29 Jul 2018 18:22:40 -0700 (PDT)
In-Reply-To: <5B5AD91802000078001D8662@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Ian Jackson <Ian.Jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

--===============1341614963986671735==
Content-Type: multipart/alternative; boundary="00000000000016a44405722d4c33"

--00000000000016a44405722d4c33
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 27, 2018 at 1:34 AM, Jan Beulich <JBeulich@suse.com> wrote:

> >>> On 26.07.18 at 23:16, <christopher.w.clark@gmail.com> wrote:
> > Exclude named output files from the Xen tree setup.
> >
> > The linkfarm.stamp content will differ between top level "make"
> > and "make install" invocations, due to the introduction of these
> > output files that are produced during the "make" build.
> >
> > Filter these out to prevent an unnecessary rebuild of the shim
> > during "make install", after "make" within a fresh source tree.
> >
> > Excluded from consideration with this change: differences in stamp
> > content when performing incremental builds in an existing tree.
>
> I don't understand this (as well as you most recent remark on the
> v2 thread): The "make install" invocation _is_ an incremental
> rebuild. Hence I don't understand how excluding some but not all
> generated files helps. But I'm not going to exclude that this is
> simply because I don't understand well enough the logic in
> xen-dir/Makefile when to trigger a rebuild.
>
>
>
OK, so "make install" is considered to be an incremental rebuild here -
which makes sense - because in the implementation, it causes almost the
same actions, within the same tree, as the preceding "make":

"make" has the default target of all, which only depends on dist, dist
depends on the dist-<COMPONENT>s, and those each depend on
install-<COMPONENT>s. "make install" depends on install-<COMPONENT>s. A
main difference with "make install" is the destination directories that are
populated with the output.

Here's what's actually going on: it's parallel builds that are not working
correctly ("make -j <N>", where N>1). When multiple threads are available
to build with, the tools build starts before the xen subsystem build
finishes, so the first contents of linkfarm.stamp is a snapshot of a moving
tree, and it ends up missing the final xen subsystem build products.

The reason the v3 patch (mostly) works is that it lists the later build
products of the xen subsystem. The earlier ones, such as the headers, are
added to the xen tree long enough before the tools build gets started, so
they are witnessed and captured in the linkfarm.stamp file. I say the v3
patch mostly works, because I've found that its short exclusion list is
missing "xen.gz.new", which is briefly present as a temporary file and can
end up caught in the linkfarm.stamp file. It would need to be added to the
exclusion list if continuing with that filtering approach.

An alternative approach is to serialize the xen and tools subsystem builds
in the top level Makefile, not allowing the tools build to proceed until
the xen build is complete. I don't currently have a patch to propose to do
this. In the absence of that in place, the workaround is simple: build just
the xen subsystem alone first.

To demonstrate the behaviour described above:
===
With a single-threaded build, which will behave correctly:

make
cp ./tools/firmware/xen-dir/linkfarm.stamp ../linkfarm.stamp.compile
make install
diff -u ../linkfarm.stamp.compile ./tools/firmware/xen-dir/linkfarm.stamp

linkfarm.stamp.compile contents will be populated after the xen subsystem
build is complete, so contents of linkfarm.stamp will not change when
invoking "make install" and the diff will be empty.

===
With a multi-threaded build on an SMP machine (eg. an 8-way build host),
which may show the defect:

JOBS="12"
make -j $JOBS
cp ./tools/firmware/xen-dir/linkfarm.stamp ../linkfarm.stamp.compile
make -j $JOBS install
diff -u ../linkfarm.stamp.compile ./tools/firmware/xen-dir/linkfarm.stamp

linkfarm.stamp.compile contents will likely be populated _before_ the xen
subsystem build is complete, and if so the diff will _not_ be empty. The
shim will then rebuild during the "install" build.

Since this is racey, different results are visible with different numbers
of threads and different load on the machine. In testing, in one test 40
threads actually built just as well as the single threaded case, but each
of 2, 4, 8, 12, 16 threads showed different contents of the incomplete
linkfarm.stamp files after the first compile.

===
Workaround to build with multiple threads and no patch applied: build the
xen subsystem alone first:

make -j $JOBS xen
make -j $JOBS
make -j $JOBS install

===

Christopher

--00000000000016a44405722d4c33
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Fri, Jul 27, 2018 at 1:34 AM, Jan Beulich <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:JBeulich@suse.com" target=3D"_blank">JBeulich@suse.com</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><span =
class=3D"gmail-">&gt;&gt;&gt; On 26.07.18 at 23:16, &lt;<a href=3D"mailto:c=
hristopher.w.clark@gmail.com">christopher.w.clark@gmail.com</a><wbr>&gt; wr=
ote:<br>
&gt; Exclude named output files from the Xen tree setup.<br>
&gt; <br>
&gt; The linkfarm.stamp content will differ between top level &quot;make&qu=
ot;<br>
&gt; and &quot;make install&quot; invocations, due to the introduction of t=
hese<br>
&gt; output files that are produced during the &quot;make&quot; build.<br>
&gt; <br>
&gt; Filter these out to prevent an unnecessary rebuild of the shim<br>
&gt; during &quot;make install&quot;, after &quot;make&quot; within a fresh=
 source tree.<br>
&gt; <br>
&gt; Excluded from consideration with this change: differences in stamp<br>
&gt; content when performing incremental builds in an existing tree.<br>
<br>
</span>I don&#39;t understand this (as well as you most recent remark on th=
e<br>
v2 thread): The &quot;make install&quot; invocation _is_ an incremental<br>
rebuild. Hence I don&#39;t understand how excluding some but not all<br>
generated files helps. But I&#39;m not going to exclude that this is<br>
simply because I don&#39;t understand well enough the logic in<br>
xen-dir/Makefile when to trigger a rebuild.<br>
<span class=3D"gmail-"><br></span><span class=3D"gmail-HOEnZb"><font color=
=3D"#888888"><br></font></span></blockquote><div><br></div><div>OK, so &quo=
t;make install&quot; is considered to be an incremental rebuild here - whic=
h makes sense - because in the implementation, it causes almost the same ac=
tions, within the same tree, as the preceding &quot;make&quot;:</div><div><=
br></div><div>&quot;make&quot; has the default target of all, which only de=
pends on dist, dist depends on the dist-&lt;COMPONENT&gt;s, and those each =
depend on install-&lt;COMPONENT&gt;s. &quot;make install&quot; depends on i=
nstall-&lt;COMPONENT&gt;s. A main difference with &quot;make install&quot; =
is the destination directories that are populated with the output.</div><di=
v><br></div><div>Here&#39;s what&#39;s actually going on: it&#39;s parallel=
 builds that are not working correctly (&quot;make -j &lt;N&gt;&quot;, wher=
e N&gt;1). When multiple threads are available to build with, the tools bui=
ld starts before the xen subsystem build finishes, so the first contents of=
 linkfarm.stamp is a snapshot of a moving tree, and it ends up missing the =
final xen subsystem build products.</div><div><br></div><div>The reason the=
 v3 patch (mostly) works is that it lists the later build products of the x=
en subsystem. The earlier ones, such as the headers, are added to the xen t=
ree long enough before the tools build gets started, so they are witnessed =
and captured in the linkfarm.stamp file. I say the v3 patch mostly works, b=
ecause I&#39;ve found that its short exclusion list is missing &quot;xen.gz=
.new&quot;, which is briefly present as a temporary file and can end up cau=
ght in the linkfarm.stamp file. It would need to be added to the exclusion =
list if continuing with that filtering approach.</div><div><br></div><div>A=
n alternative approach is to serialize the xen and tools subsystem builds i=
n the top level Makefile, not allowing the tools build to proceed until the=
 xen build is complete. I don&#39;t currently have a patch to propose to do=
 this. In the absence of that in place, the workaround is simple: build jus=
t the xen subsystem alone first.</div><div><br></div><div>To demonstrate th=
e behaviour described above:</div><div>=3D=3D=3D</div><div>With a single-th=
readed build, which will behave correctly:</div><div><br></div><div>make</d=
iv><div>cp ./tools/firmware/xen-dir/linkfarm.stamp ../linkfarm.stamp.compil=
e</div><div>make install</div><div>diff -u ../linkfarm.stamp.compile ./tool=
s/firmware/xen-dir/linkfarm.stamp</div><div><br></div><div>linkfarm.stamp.c=
ompile contents will be populated after the xen subsystem build is complete=
, so contents of linkfarm.stamp will not change when invoking &quot;make in=
stall&quot; and the diff will be empty.</div><div><br></div><div>=3D=3D=3D<=
/div><div>With a multi-threaded build on an SMP machine (eg. an 8-way build=
 host), which may show the defect:</div><div><br></div><div>JOBS=3D&quot;12=
&quot;</div><div>make -j $JOBS</div><div>cp ./tools/firmware/xen-dir/linkfa=
rm.stamp ../linkfarm.stamp.compile</div><div>make -j $JOBS install</div><di=
v>diff -u ../linkfarm.stamp.compile ./tools/firmware/xen-dir/linkfarm.stamp=
</div><div><br></div><div>linkfarm.stamp.compile contents will likely be po=
pulated _before_ the xen subsystem build is complete, and if so the diff wi=
ll _not_ be empty. The shim will then rebuild during the &quot;install&quot=
; build.</div><div><br></div><div>Since this is racey, different results ar=
e visible with different numbers of threads and different load on the machi=
ne. In testing, in one test 40 threads actually built just as well as the s=
ingle threaded case, but each of 2, 4, 8, 12, 16 threads showed different c=
ontents of the incomplete linkfarm.stamp files after the first compile.</di=
v><div><br></div><div>=3D=3D=3D</div><div>Workaround to build with multiple=
 threads and no patch applied: build the xen subsystem alone first:</div><d=
iv><br></div><div>make -j $JOBS xen</div><div>make -j $JOBS</div><div>make =
-j $JOBS install</div><div><br></div><div>=3D=3D=3D</div><div><br></div><di=
v>Christopher</div><div><br></div></div><br></div></div>

--00000000000016a44405722d4c33--


--===============1341614963986671735==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1341614963986671735==--
