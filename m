From: "John L. Poole" <jlpoole56@gmail.com>
Subject: Re: Xen 4.12.0-rc Hangs Around masked ExtINT on CPU#
Date: Tue, 28 May 2019 08:02:22 -0700
Message-ID: <7dc6fc80-8204-9cf7-25fd-87e1bddacf8e@gmail.com>
References: <25b66cdf-94ad-6af1-de5f-e0f5369ae000@gmail.com>
 <5C9B30D002000078002220F5@prv1-mh.provo.novell.com>
 <1fccf915-9d0b-52ac-4d6d-df16194dabb0@gmail.com>
 <5C9B86FA0200007800222232@prv1-mh.provo.novell.com>
 <daff9af3-5008-42ac-1355-ca8ef94fadb5@gmail.com>
 <20190429120238.b4kjlmkpk5l2t6yb@Air-de-Roger>
 <f4f4007c-4643-aecf-6ab7-811c00156fca@gmail.com>
 <20190429152734.qy34zz56e43pawvf@Air-de-Roger>
 <20190527161832.arry25rh4chyxkio@Air-de-Roger>
 <b00833f8-22a2-3f1e-65f6-7a4178377ee1@gmail.com>
 <20190528074113.4o7e4did46e4yymb@Air-de-Roger>
Reply-To: jlpoole56@gmail.com
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2178899756295332199=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20190528074113.4o7e4did46e4yymb@Air-de-Roger>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Jan Beulich <JBeulich@suse.com>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

This is a multi-part message in MIME format.
--===============2178899756295332199==
Content-Type: multipart/alternative;
 boundary="------------0599D36274BDEB0F89C51F49"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------0599D36274BDEB0F89C51F49
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 5/28/2019 12:41 AM, Roger Pau Monné wrote:
> On Mon, May 27, 2019 at 03:35:21PM -0700, John L. Poole wrote:
>> On 5/27/2019 9:18 AM, Roger Pau Monné wrote:
>>> On Mon, Apr 29, 2019 at 05:27:34PM +0200, Roger Pau Monné wrote:
>>>> IMO it would be better if you can build directly from the upstream git
>>>> repository [0], that way you could use git-bisect(1) in order to figure
>>>> out which commit broke your system. For example:
>>>>
>>>> # git clone git://xenbits.xen.org/xen.git
>>>> # cd xen
>>>> # git checkout RELEASE-4.7.0
>>>> # make xen -j8
>>>>
>>>> That should give you a set of Xen binaries in the xen/ directory, IIRC
>>>> you are booting from EFI so you likely need xen/xen.efi.
>>>>
>>>> If that works, then you can test RELEASE-4.8.0 and if that fails to
>>>> boot you should have a range of commits that you can bisect in order
>>>> to find the culprit.
>>> FWIW, I've been unable to find a box with the same CPU model (C2750)
>>> that you are using. I've found a couple of old Atom boxes using
>>> different CPUs but they all seem to boot fine using latest
>>> xen-unstable. I've looked on eBay for that CPU but everything
>>> containing it is server-grade and >200$ which I'm sadly not going to
>>> pay.
>>>
>>> Unless you are able to bisect the tree and give us the bad commit
>>> that's causing your issues I'm afraid at least myself I won't be able
>>> to progress this any further, sorry.
>>>
>>> Roger.
>> I attempted to work backwards and ran into a nightmare with Gentoo.   I kept
>> getting compiler errors which I suspect was a result of having a newer
>> version
>> of GCC and other things.  It's not an easy thing to travel
>> back in time in Gentoo because everything keeps getting upgraded.  I just
>> cannot make the time now to unravel this as I have some demands on my time
>> and will be engaged for the next four to six weeks.
> IMO your best bet is to build Xen using Debian stretch, that's used by
> the Xen test system, and is likely to be able to build the different
> Xen versions, stable-* branches tested by osstest should build on
> stretch.
>
> What I've done in the past if that also triggers compiler errors is to
> build a chroot with an older version of Debian and then build Xen
> inside of it. You can do this in a box different from the one you are
> testing, ie: you could create a Debian VM and build Xen from there.
>
> Note that in order to bisect this issue you only need to build the Xen
> kernel (make xen, no need to run ./configure), there's no need to
> build the tools, hence you need almost no dependencies installed on
> the builder.
>
> I've done a build of the stable-4.7 branch myself and uploaded the
> hypervisor binaries to:
>
> http://xenbits.xen.org/people/royger/stable-4.7/
>
> Could you give those a try (I wasn't sure whether you need xen.gz or
> xen.efi so I've uploaded both) and see if you still have issues
> booting?
>
> Testing those binaries should be as simple as placing them in /boot/
> and fixing your bootloader configuration to boot from those. Please
> send the serial log when booting from the provided binaries.
>
>> How much would it cost for you to obtain the machine you need? I may
>> consider paying for it. I bought this Atom server just to economically run
>> Xen so the machine has marginal value to me if I cannot run Xen on it.
> Even if we go that route, there's no guarantee that I would be able to
> fix the issue, and there's also the possibility that the hardware you
> have is somehow broken, and that the new one won't exhibit this issue.
>
> Roger.
Roger,

You have given me an idea.  I have several VMs on my hard disk that are not
backed up.  So, I think what I'll do is remove the current hard disk and 
place
a fresh hard disk in and then try to install a Debian based Xen anew so I
do not risk altering my Gentoo-based hard disk.  This approach should free
me from the entanglement of a bleeding edge distribution, e.g. Gentoo.

I was looking back at my notes.  I acquired this Atom-based server in 
November
of 2016 and installed the Debian Xen to test and it worked.  So I then 
installed
Gentoo and ran into problems with GRUB.  I learned that GRUB was not yet 
ready
to support EFI and Xen, so I used the manual method to drop into an EFI 
shell
and launch my DOM0 instance.  I later tried to upgrade the kernel and 
ran into
problems and aborted an upgrade, I just kept what I had working since I had
already created some Gentoo-based VMs.  During my build process, I had
run into an issue "coff-x86-64 pe-x86-64" which Jan Beulich had assisted 
on and
determined was something worth of the attention of the "binutils folks."

I'll attempt the hard disk swap in a few days after I receive a shipment 
of the new disk.

Thank you,
John



--------------0599D36274BDEB0F89C51F49
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 5/28/2019 12:41 AM, Roger Pau Monné
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20190528074113.4o7e4did46e4yymb@Air-de-Roger">
      <pre class="moz-quote-pre" wrap="">On Mon, May 27, 2019 at 03:35:21PM -0700, John L. Poole wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
On 5/27/2019 9:18 AM, Roger Pau Monné wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">On Mon, Apr 29, 2019 at 05:27:34PM +0200, Roger Pau Monné wrote:
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">IMO it would be better if you can build directly from the upstream git
repository [0], that way you could use git-bisect(1) in order to figure
out which commit broke your system. For example:

# git clone git://xenbits.xen.org/xen.git
# cd xen
# git checkout RELEASE-4.7.0
# make xen -j8

That should give you a set of Xen binaries in the xen/ directory, IIRC
you are booting from EFI so you likely need xen/xen.efi.

If that works, then you can test RELEASE-4.8.0 and if that fails to
boot you should have a range of commits that you can bisect in order
to find the culprit.
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">FWIW, I've been unable to find a box with the same CPU model (C2750)
that you are using. I've found a couple of old Atom boxes using
different CPUs but they all seem to boot fine using latest
xen-unstable. I've looked on eBay for that CPU but everything
containing it is server-grade and &gt;200$ which I'm sadly not going to
pay.

Unless you are able to bisect the tree and give us the bad commit
that's causing your issues I'm afraid at least myself I won't be able
to progress this any further, sorry.

Roger.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">I attempted to work backwards and ran into a nightmare with Gentoo.   I kept
getting compiler errors which I suspect was a result of having a newer
version
of GCC and other things.  It's not an easy thing to travel
back in time in Gentoo because everything keeps getting upgraded.  I just
cannot make the time now to unravel this as I have some demands on my time
and will be engaged for the next four to six weeks.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
IMO your best bet is to build Xen using Debian stretch, that's used by
the Xen test system, and is likely to be able to build the different
Xen versions, stable-* branches tested by osstest should build on
stretch.

What I've done in the past if that also triggers compiler errors is to
build a chroot with an older version of Debian and then build Xen
inside of it. You can do this in a box different from the one you are
testing, ie: you could create a Debian VM and build Xen from there.

Note that in order to bisect this issue you only need to build the Xen
kernel (make xen, no need to run ./configure), there's no need to
build the tools, hence you need almost no dependencies installed on
the builder.

I've done a build of the stable-4.7 branch myself and uploaded the
hypervisor binaries to:

<a class="moz-txt-link-freetext" href="http://xenbits.xen.org/people/royger/stable-4.7/">http://xenbits.xen.org/people/royger/stable-4.7/</a>

Could you give those a try (I wasn't sure whether you need xen.gz or
xen.efi so I've uploaded both) and see if you still have issues
booting?

Testing those binaries should be as simple as placing them in /boot/
and fixing your bootloader configuration to boot from those. Please
send the serial log when booting from the provided binaries.

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">How much would it cost for you to obtain the machine you need? I may
consider paying for it. I bought this Atom server just to economically run
Xen so the machine has marginal value to me if I cannot run Xen on it.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Even if we go that route, there's no guarantee that I would be able to
fix the issue, and there's also the possibility that the hardware you
have is somehow broken, and that the new one won't exhibit this issue.

Roger.
</pre>
    </blockquote>
    <div class="moz-signature"><font size="2"><font face="Verdana">Roger,</font></font></div>
    <div class="moz-signature"><font size="2"><font face="Verdana"><br>
        </font></font></div>
    <div class="moz-signature"><font size="2"><font face="Verdana">You
          have given me an idea.  I have several VMs on my hard disk
          that are not</font></font></div>
    <div class="moz-signature"><font size="2"><font face="Verdana">backed
          up.  So, I think what I'll do is remove the current hard disk
          and place</font></font></div>
    <div class="moz-signature"><font size="2"><font face="Verdana">a
          fresh hard disk in and then try to install a Debian based Xen
          anew so I</font></font></div>
    <div class="moz-signature"><font size="2"><font face="Verdana">do
          not risk altering my Gentoo-based hard disk.  This approach
          should free</font></font></div>
    <div class="moz-signature"><font size="2"><font face="Verdana">me
          from the entanglement of a bleeding edge distribution, e.g.
          Gentoo.<br>
        </font></font></div>
    <div class="moz-signature"><font size="2"><font face="Verdana"><br>
        </font></font></div>
    <div class="moz-signature"><font size="2"><font face="Verdana">I was
          looking back at my notes.  I acquired this Atom-based server
          in November</font></font></div>
    <div class="moz-signature"><font size="2"><font face="Verdana">of
          2016 and installed the Debian Xen to test and it worked.  So I
          then installed</font></font></div>
    <div class="moz-signature"><font size="2"><font face="Verdana">Gentoo
          and ran into problems with GRUB.  I learned that GRUB was not
          yet ready</font></font></div>
    <div class="moz-signature"><font size="2"><font face="Verdana">to
          support EFI and Xen, so I used the manual method to drop into
          an EFI shell</font></font></div>
    <div class="moz-signature"><font size="2"><font face="Verdana">and
          launch my DOM0 instance.  I later tried to upgrade the kernel
          and ran into</font></font></div>
    <div class="moz-signature"><font size="2"><font face="Verdana">problems
          and aborted an upgrade, I just kept what I had working since I
          had</font></font></div>
    <div class="moz-signature"><font size="2"><font face="Verdana">already
          created some Gentoo-based VMs.  During my build process, I had</font></font></div>
    <div class="moz-signature"><font size="2"><font face="Verdana">run
          into an issue "</font></font>coff-x86-64 pe-x86-64<font
        size="2"><font face="Verdana">" which Jan Beulich had assisted
          on and</font></font></div>
    <div class="moz-signature"><font size="2"><font face="Verdana">determined
          was something worth of the attention of the "binutils folks."</font></font></div>
    <div class="moz-signature"><font size="2"><font face="Verdana"><br>
        </font></font></div>
    <div class="moz-signature"><font size="2"><font face="Verdana">I'll
          attempt the hard disk swap in a few days after I receive a
          shipment of the new disk.</font></font></div>
    <div class="moz-signature"><font size="2"><font face="Verdana"><br>
        </font></font></div>
    <div class="moz-signature"><font size="2"><font face="Verdana">Thank
          you,</font></font></div>
    <div class="moz-signature"><font size="2"><font face="Verdana">John</font></font><br>
      <p><font size="2" face="Verdana">
          <br>
        </font></p>
    </div>
  </body>
</html>

--------------0599D36274BDEB0F89C51F49--


--===============2178899756295332199==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2178899756295332199==--
