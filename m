From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH RFC 17/49] xen/sched: move some per-vcpu
 items to struct sched_item
Date: Fri, 29 Mar 2019 21:33:20 +0000
Message-ID: <ad9f514b-7325-0759-0a80-c8195e8c0b64@citrix.com>
References: <20190329150934.17694-1-jgross@suse.com>
 <20190329150934.17694-18-jgross@suse.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5347585942441903991=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/vMr=SA=citrix.com=prvs=9848b938e=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1h9z7u-0001JJ-MV
 for xen-devel@lists.xenproject.org; Fri, 29 Mar 2019 21:33:26 +0000
In-Reply-To: <20190329150934.17694-18-jgross@suse.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <ian.jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>, Meng Xu <mengxu@cis.upenn.edu>, Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

--===============5347585942441903991==
Content-Type: multipart/alternative;
	boundary="------------005C9E4F4FB67B328ACE50C2"
Content-Language: en-GB

--------------005C9E4F4FB67B328ACE50C2
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On 29/03/2019 15:09, Juergen Gross wrote:
> diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
> index 8d579e2cf9..5d8f3255cb 100644
> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -15,6 +15,7 @@
>  #include <xen/lib.h>
>  #include <xen/errno.h>
>  #include <xen/sched.h>
> +#include <xen/sched-if.h>
>  #include <xen/domain.h>
>  #include <xen/smp.h>
>  #include <xen/delay.h>

I'm afraid that this feels like a step in the wrong direction.

sched-if.h is (per the comments) supposed to be the schedulers
private.h, with the intention that struct scheduler didn't leak into the
rest of the codebase.  Also the logic for taking scheduler locks, etc,
and lastly for cpumask_scratch, which really is unsafe to use outside of
the scheduler (and has come up in several recent patch series).

Sadly,

andrewcoop@andrewcoop:/local/xen.git/xen$ git grep sched-if
arch/x86/acpi/cpu_idle.c:41:#include <xen/sched-if.h>
arch/x86/cpu/mcheck/mce.c:13:#include <xen/sched-if.h>
arch/x86/cpu/mcheck/mctelem.c:21:#include <xen/sched-if.h>
arch/x86/dom0_build.c:12:#include <xen/sched-if.h>
arch/x86/setup.c:6:#include <xen/sched-if.h>
arch/x86/smpboot.c:28:#include <xen/sched-if.h>
common/cpupool.c:19:#include <xen/sched-if.h>
common/domain.c:13:#include <xen/sched-if.h>
common/domctl.c:14:#include <xen/sched-if.h>
common/sched_arinc653.c:29:#include <xen/sched-if.h>
common/sched_credit.c:18:#include <xen/sched-if.h>
common/sched_credit2.c:21:#include <xen/sched-if.h>
common/sched_null.c:32:#include <xen/sched-if.h>
common/sched_rt.c:23:#include <xen/sched-if.h>
common/schedule.c:26:#include <xen/sched-if.h>
include/asm-x86/cpuidle.h:7:#include <xen/sched-if.h>

and this change is making the situation worse.

If at all possible, I'd prefer to see about disentangling the bits which
actually need external use, and putting them in sched.h, and making
sched-if.h properly private to the schedulers.  I actually even started
a cleanup series which moved all of the scheduler infrastructure into
common/sched/, but found a disappointing quantity of sched-if.h being
referenced externally.

~Andrew

--------------005C9E4F4FB67B328ACE50C2
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 29/03/2019 15:09, Juergen Gross
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20190329150934.17694-18-jgross@suse.com">
      <pre class="moz-quote-pre" wrap="">diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 8d579e2cf9..5d8f3255cb 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -15,6 +15,7 @@
 #include &lt;xen/lib.h&gt;
 #include &lt;xen/errno.h&gt;
 #include &lt;xen/sched.h&gt;
+#include &lt;xen/sched-if.h&gt;
 #include &lt;xen/domain.h&gt;
 #include &lt;xen/smp.h&gt;
 #include &lt;xen/delay.h&gt;</pre>
    </blockquote>
    <br>
    I'm afraid that this feels like a step in the wrong direction.<br>
    <br>
    sched-if.h is (per the comments) supposed to be the schedulers
    private.h, with the intention that struct scheduler didn't leak into
    the rest of the codebase.  Also the logic for taking scheduler
    locks, etc, and lastly for cpumask_scratch, which really is unsafe
    to use outside of the scheduler (and has come up in several recent
    patch series).<br>
    <br>
    Sadly,<br>
    <br>
    <pre><a class="moz-txt-link-abbreviated" href="mailto:andrewcoop@andrewcoop:/local/xen.git/xen$">andrewcoop@andrewcoop:/local/xen.git/xen$</a> git grep sched-if
arch/x86/acpi/cpu_idle.c:41:#include &lt;xen/sched-if.h&gt;
arch/x86/cpu/mcheck/mce.c:13:#include &lt;xen/sched-if.h&gt;
arch/x86/cpu/mcheck/mctelem.c:21:#include &lt;xen/sched-if.h&gt;
arch/x86/dom0_build.c:12:#include &lt;xen/sched-if.h&gt;
arch/x86/setup.c:6:#include &lt;xen/sched-if.h&gt;
arch/x86/smpboot.c:28:#include &lt;xen/sched-if.h&gt;
common/cpupool.c:19:#include &lt;xen/sched-if.h&gt;
common/domain.c:13:#include &lt;xen/sched-if.h&gt;
common/domctl.c:14:#include &lt;xen/sched-if.h&gt;
common/sched_arinc653.c:29:#include &lt;xen/sched-if.h&gt;
common/sched_credit.c:18:#include &lt;xen/sched-if.h&gt;
common/sched_credit2.c:21:#include &lt;xen/sched-if.h&gt;
common/sched_null.c:32:#include &lt;xen/sched-if.h&gt;
common/sched_rt.c:23:#include &lt;xen/sched-if.h&gt;
common/schedule.c:26:#include &lt;xen/sched-if.h&gt;
include/asm-x86/cpuidle.h:7:#include &lt;xen/sched-if.h&gt;

</pre>
    and this change is making the situation worse.<br>
    <br>
    If at all possible, I'd prefer to see about disentangling the bits
    which actually need external use, and putting them in sched.h, and
    making sched-if.h properly private to the schedulers.  I actually
    even started a cleanup series which moved all of the scheduler
    infrastructure into common/sched/, but found a disappointing
    quantity of sched-if.h being referenced externally.<br>
    <br>
    ~Andrew<br>
  </body>
</html>

--------------005C9E4F4FB67B328ACE50C2--


--===============5347585942441903991==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5347585942441903991==--
