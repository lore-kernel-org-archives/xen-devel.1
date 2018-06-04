From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 00/11] Fixes to debugging facilities
Date: Mon, 4 Jun 2018 18:18:06 +0100
Message-ID: <68c430ab-331b-3e4e-bc93-a1e73d91b257@citrix.com>
References: <1528120755-17455-1-git-send-email-andrew.cooper3@citrix.com>
 <15dba408-9b01-f1ae-7f2e-51714b31d246@citrix.com>
 <2c1e2d82-2445-9259-c7a9-1ee835ef1d2c@bitdefender.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3359396354965514960=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <2c1e2d82-2445-9259-c7a9-1ee835ef1d2c@bitdefender.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>, Xen-devel <xen-devel@lists.xen.org>
Cc: Kevin Tian <kevin.tian@intel.com>, Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, Tim Deegan <tim@xen.org>, Jun Nakajima <jun.nakajima@intel.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Brian Woods <brian.woods@amd.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

--===============3359396354965514960==
Content-Type: multipart/alternative;
	boundary="------------BBC13AA8D3C911D1CA4E4CD2"
Content-Language: en-GB

--------------BBC13AA8D3C911D1CA4E4CD2
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On 04/06/18 18:09, Razvan Cojocaru wrote:
> On 06/04/2018 06:39 PM, Andrew Cooper wrote:
>> On 04/06/18 14:59, Andrew Cooper wrote:
>>> So this started as a small fix for the vmentry failure (penultimate patch),
>>> and has snowballed...
>>>
>>> I'm fairly confident that everything involving DEBUGCTL.BTF is broken, and
>>> there are definitely bugs with configuring DEBUGCTL.RTM (which really isn't
>>> helped by the fact that the GCC TSX intrinsics render the resulting code
>>> un-debuggable.)  I'll defer fixing these swamps for now.
>>>
>>> The first 4 patches probably want backporting to the stable trees, so I've
>>> taken care to move them ahead of patch 6 for backport reasons.  While all
>>> fixes would ideally be backported, I can't find a way of fixing %dr6 merging
>>> (as it needs to be done precicely once) without a behavioural change in the
>>> monitor subsystem.
>>>
>>> Patch 8 probably breaks introspection, so can't be taken at this point.  See
>>> that patch for discussion of the problem and my best guess at a solution.
>> As spotted by Razvan, I forgot to mention that this series is built on
>> top of "x86/vmx: Fix handing of MSR_DEBUGCTL on VMExit".  It can be
>> found in git form here:
>>
>> http://xenbits.xen.org/gitweb/?p=people/andrewcoop/xen.git;a=shortlog;h=refs/heads/debug-fixes-v1
> FWIW, you're exactly right about the recursive injection vm_events. I've
> tested this with xen-access and the test-hvm64-swint-emulation XTF test:
>
> 1. xl create xl create -p ./test-hvm64-swint-emulation.cfg
> 2. xen-access <DOMID> breakpoint
> 3. xl unpause <DOMID>
>
> The test domain will not be able to finish until xen-access is stopped
> (with ^C).
>
> So this does indeed break introspection the way it is now implemented.

Ack.  I'm attempting to implement the "performing agent-caused action"
boolean as discussed.

Another issue I've encountered is that the changes to #DB injection
require that pending_dbg gets sent to the introspection agent so it can
be fed back suitably in xc_hvm_inject_trap().  OTOH, this does mean that
in principle, introspection of debug exceptions could become selective
on the exact source if that is a feature anyone is interested in.

~Andrew

--------------BBC13AA8D3C911D1CA4E4CD2
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 04/06/18 18:09, Razvan Cojocaru
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:2c1e2d82-2445-9259-c7a9-1ee835ef1d2c@bitdefender.com">
      <pre wrap="">On 06/04/2018 06:39 PM, Andrew Cooper wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="">On 04/06/18 14:59, Andrew Cooper wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="">So this started as a small fix for the vmentry failure (penultimate patch),
and has snowballed...

I'm fairly confident that everything involving DEBUGCTL.BTF is broken, and
there are definitely bugs with configuring DEBUGCTL.RTM (which really isn't
helped by the fact that the GCC TSX intrinsics render the resulting code
un-debuggable.)  I'll defer fixing these swamps for now.

The first 4 patches probably want backporting to the stable trees, so I've
taken care to move them ahead of patch 6 for backport reasons.  While all
fixes would ideally be backported, I can't find a way of fixing %dr6 merging
(as it needs to be done precicely once) without a behavioural change in the
monitor subsystem.

Patch 8 probably breaks introspection, so can't be taken at this point.  See
that patch for discussion of the problem and my best guess at a solution.
</pre>
        </blockquote>
        <pre wrap="">
As spotted by Razvan, I forgot to mention that this series is built on
top of "x86/vmx: Fix handing of MSR_DEBUGCTL on VMExit".  It can be
found in git form here:

<a class="moz-txt-link-freetext" href="http://xenbits.xen.org/gitweb/?p=people/andrewcoop/xen.git;a=shortlog;h=refs/heads/debug-fixes-v1">http://xenbits.xen.org/gitweb/?p=people/andrewcoop/xen.git;a=shortlog;h=refs/heads/debug-fixes-v1</a>
</pre>
      </blockquote>
      <pre wrap="">
FWIW, you're exactly right about the recursive injection vm_events. I've
tested this with xen-access and the test-hvm64-swint-emulation XTF test:

1. xl create xl create -p ./test-hvm64-swint-emulation.cfg
2. xen-access &lt;DOMID&gt; breakpoint
3. xl unpause &lt;DOMID&gt;

The test domain will not be able to finish until xen-access is stopped
(with ^C).

So this does indeed break introspection the way it is now implemented.
</pre>
    </blockquote>
    <br>
    Ack.  I'm attempting to implement the "<span class="c-message__body">performing
      agent-caused action" boolean as discussed.<br>
      <br>
      Another issue I've encountered is that the changes to #DB
      injection require that pending_dbg gets sent to the introspection
      agent so it can be fed back suitably in xc_hvm_inject_trap(). 
      OTOH, this does mean that in principle, introspection of debug
      exceptions could become selective on the exact source if that is a
      feature anyone is interested in.<br>
      <br>
      ~Andrew<br>
    </span>
  </body>
</html>

--------------BBC13AA8D3C911D1CA4E4CD2--


--===============3359396354965514960==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3359396354965514960==--
