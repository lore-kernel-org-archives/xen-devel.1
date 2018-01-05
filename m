From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: Xen Project Spectre/Meltdown FAQ
Date: Fri, 5 Jan 2018 19:05:56 +0000
Message-ID: <edec8de6-c678-2aa1-5c50-97533c14f8f6@citrix.com>
References: <B3F5B430-F55E-446C-A7C5-7830F2CEDFCD@gmail.com>
 <888C1DAE-2B56-4D59-8529-D9DEA410BB9E@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1326065759161694564=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=oku2=ea=citrix.com=prvs=536ec9109=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1eXXJd-0001iK-F0
 for xen-devel@lists.xenproject.org; Fri, 05 Jan 2018 19:06:05 +0000
In-Reply-To: <888C1DAE-2B56-4D59-8529-D9DEA410BB9E@gmail.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Rich Persaud <persaur@gmail.com>, Lars Kurth <lars.kurth.xen@gmail.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, George Dunlap <george.dunlap@citrix.com>
List-Id: xen-devel@lists.xenproject.org

--===============1326065759161694564==
Content-Type: multipart/alternative;
	boundary="------------AFA48A2ED81F36CA70168F38"
Content-Language: en-GB

--------------AFA48A2ED81F36CA70168F38
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On 05/01/18 18:16, Rich Persaud wrote:
>> On Jan 5, 2018, at 06:35, Lars Kurth <lars.kurth.xen@gmail.com
>> <mailto:lars.kurth.xen@gmail.com>> wrote:
>> SP2 can be mitigated in two ways, both of which essentially prevent
>> speculative execution of indirect branches. The first is to flush the
>> branch prediction logic on entry into the hypervisor. This requires
>> microcode updates, which Intel and AMD are in the process of
>> preparing, as well as patches to the hypervisor which are also in
>> process and should be available soon.
>
> The Linux kernel's IBRS patchset has a doc link which compares
> retpoline, IBRS Dynamic ("opt-in") and IBRS Always On ("opt-in if more
> paranoid").  
>
> https://lkml.org/lkml/2018/1/4/615
>
> https://docs.google.com/document/d/e/2PACX-1vSMrwkaoSUBAFc6Fjd19F18c1O9pudkfAY-7lGYGOTN8mc9ul-J6pWadcAaBJZcVA7W_3jlLKRtKRbd/pub
>
> Would be nice to have that comparison for other CPU vendors.  Some
> information is aggregated at https://github.com/marcan/speculation-bugs:
>
> "This repo is an attempt to collect information on the class of
> information disclosure vulnerabilities caused by CPU speculative
> execution that were disclosed on January 3rd, 2018.  Existing
> nomenclature is inconsistent and there is no agreed-upon name for the
> entire class of bugs, but the names Spectre and Meltdown have been
> used for subclasses of attacks.  This is a combination of publicly
> available information and educated guesses/ speculation based on the
> nature of the attacks. Pull requests with corrections or discussion
> are welcome."

Prefer the google names.  Spectre in particular is a mix of two quite
different attack techniques.

>
>> Linux’s KPTI series is designed to address SP3 only.  For Xen guests,
>> only 64-bit PV guests are affected by SP3. A KPTI-like approach was
>> explored initially, but required significant ABI changes.  Instead
>> we’ve decided to go with an alternate approach, which is less
>> disruptive and less complex to implement. The chosen approach runs PV
>> guests in a PVH container, which ensures that PV guests continue to
>> behave as before, while providing the isolation that protects the
>> hypervisor from SP3. This works well for Xen 4.8 to Xen 4.10, which
>> is currently our priority.
>
> Since PVH does not yet support PCI passthrough, are there other
> recommended SP3 mitigations for 64-bit PV driver domains?

Lock them down?  Device driver domains, even if not fully trusted, are
going to be part of the system and therefore at least semi-TCB.

If an attacker can't run code in your driver domain (and be aware of
things like server side processing, JIT of SQL, etc as "running code"
methods), they aren't in a position to mount an SP3 attack.

>  Would CPU pinning of an untrusted guest driver domain reduce its
> ability to attack the host?

All of SP1/2/3 can in principle be used to attack Xen, at which point
you have to presume that the entire system is readable.

CPU pinning can be used to prevent certain guests from sharing branch
prediction resources, and thus prevent them from directly attacking each
other using SP1 or SP2.

However, you can't isolate Xen away from the guest, so pinning is no
mitigation against attacks targeting Xen.

> Since 32-bit PV guests are not affected by SP3, will they continue to
> run without a PVH container, so that PCI passthrough continues to
> function?

32bit PV guests are unable to use SP3 to attack Xen, but 32bit PV guest
userspace can still use SP3 to attack the guest kernel.

~Andrew

--------------AFA48A2ED81F36CA70168F38
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 05/01/18 18:16, Rich Persaud wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:888C1DAE-2B56-4D59-8529-D9DEA410BB9E@gmail.com">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div><span></span></div>
      <div>
        <div><span></span></div>
        <div>
          <div><span></span></div>
          <div>
            <blockquote type="cite"><span>On Jan 5, 2018, at 06:35, Lars
                Kurth &lt;<a href="mailto:lars.kurth.xen@gmail.com"
                  moz-do-not-send="true">lars.kurth.xen@gmail.com</a>&gt;
                wrote:</span><br>
            </blockquote>
            <blockquote type="cite"><span>SP2 can be mitigated in two
                ways, both of which essentially prevent speculative
                execution of indirect branches. The first is to flush
                the branch prediction logic on entry into the
                hypervisor. This requires microcode updates, which Intel
                and AMD are in the process of preparing, as well as
                patches to the hypervisor which are also in process and
                should be available soon.</span><br>
            </blockquote>
            <div><br>
            </div>
            <div>The Linux kernel's IBRS patchset has a doc link which
              compares retpoline, IBRS Dynamic ("opt-in") and IBRS
              Always On ("opt-in if more paranoid").  </div>
            <div><br>
            </div>
            <div><a href="https://lkml.org/lkml/2018/1/4/615"
                moz-do-not-send="true">https://lkml.org/lkml/2018/1/4/615</a></div>
            <div><br>
            </div>
            <div><a
href="https://docs.google.com/document/d/e/2PACX-1vSMrwkaoSUBAFc6Fjd19F18c1O9pudkfAY-7lGYGOTN8mc9ul-J6pWadcAaBJZcVA7W_3jlLKRtKRbd/pub"
                moz-do-not-send="true">https://docs.google.com/document/d/e/2PACX-1vSMrwkaoSUBAFc6Fjd19F18c1O9pudkfAY-7lGYGOTN8mc9ul-J6pWadcAaBJZcVA7W_3jlLKRtKRbd/pub</a></div>
            <div><br>
            </div>
            <div>Would be nice to have that comparison for other CPU
              vendors.  Some information is aggregated at <a
                href="https://github.com/marcan/speculation-bugs"
                moz-do-not-send="true">https://github.com/marcan/speculation-bugs</a>:</div>
            <div><br>
            </div>
            <div>"<span style="background-color: rgba(255, 255, 255,
                0);">This repo is an attempt to collect information on
                the class of information disclosure vulnerabilities
                caused by CPU speculative execution that were disclosed
                on January 3rd, 2018.  </span><span
                style="background-color: rgba(255, 255, 255, 0);">Existing
                nomenclature is inconsistent and there is no agreed-upon
                name for the entire class of bugs, but the names Spectre
                and Meltdown have been used for subclasses of attacks.  </span><span
                style="background-color: rgba(255, 255, 255, 0);">This
                is a combination of publicly available information and
                educated guesses/ speculation based on the nature of the
                attacks. Pull requests with corrections or discussion
                are welcome."</span></div>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
    Prefer the google names.  Spectre in particular is a mix of two
    quite different attack techniques.<br>
    <br>
    <blockquote type="cite"
      cite="mid:888C1DAE-2B56-4D59-8529-D9DEA410BB9E@gmail.com">
      <div>
        <div>
          <div><br>
            <blockquote type="cite"><span>Linux’s KPTI series is
                designed to address SP3 only.  For Xen guests, only
                64-bit PV guests are affected by SP3. A KPTI-like
                approach was explored initially, but required
                significant ABI changes.  Instead we’ve decided to go
                with an alternate approach, which is less disruptive and
                less complex to implement. The chosen approach runs PV
                guests in a PVH container, which ensures that PV guests
                continue to behave as before, while providing the
                isolation that protects the hypervisor from SP3. This
                works well for Xen 4.8 to Xen 4.10, which is currently
                our priority.</span><br>
            </blockquote>
            <span></span>
            <div><br>
            </div>
            Since PVH does not yet support PCI passthrough, are there
            other recommended SP3 mitigations for 64-bit PV driver
            domains?</div>
        </div>
      </div>
    </blockquote>
    <br>
    Lock them down?  Device driver domains, even if not fully trusted,
    are going to be part of the system and therefore at least semi-TCB.<br>
    <br>
    If an attacker can't run code in your driver domain (and be aware of
    things like server side processing, JIT of SQL, etc as "running
    code" methods), they aren't in a position to mount an SP3 attack.<br>
    <br>
    <blockquote type="cite"
      cite="mid:888C1DAE-2B56-4D59-8529-D9DEA410BB9E@gmail.com">
      <div>
        <div>
          <div>  Would CPU pinning of an untrusted guest driver domain
            reduce its ability to attack the host?</div>
        </div>
      </div>
    </blockquote>
    <br>
    All of SP1/2/3 can in principle be used to attack Xen, at which
    point you have to presume that the entire system is readable.<br>
    <br>
    CPU pinning can be used to prevent certain guests from sharing
    branch prediction resources, and thus prevent them from directly
    attacking each other using SP1 or SP2.<br>
    <br>
    However, you can't isolate Xen away from the guest, so pinning is no
    mitigation against attacks targeting Xen.<br>
    <br>
    <blockquote type="cite"
      cite="mid:888C1DAE-2B56-4D59-8529-D9DEA410BB9E@gmail.com">
      <div>
        <div>
          <div>Since 32-bit PV guests are not affected by SP3, will they
            continue to run without a PVH container, so that PCI
            passthrough continues to function?</div>
        </div>
      </div>
    </blockquote>
    <br>
    32bit PV guests are unable to use SP3 to attack Xen, but 32bit PV
    guest userspace can still use SP3 to attack the guest kernel.<br>
    <br>
    ~Andrew<br>
  </body>
</html>

--------------AFA48A2ED81F36CA70168F38--


--===============1326065759161694564==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1326065759161694564==--
