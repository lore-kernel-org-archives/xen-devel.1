From: "John L. Poole" <jlpoole56@gmail.com>
Subject: Re: Xen 4.12.0-rc Hangs Around masked ExtINT on CPU#
Date: Tue, 26 Mar 2019 10:21:06 -0700
Message-ID: <25b66cdf-94ad-6af1-de5f-e0f5369ae000@gmail.com>
References: <77de1587-5683-4ddb-19ca-f71c23e6d7c1@gmail.com>
 <20190322075941.bdf6i3veheiblwzs@MacBook-Air-de-Roger.local>
 <9f9c4a21-b426-f0fc-7c09-2f5d392b488c@gmail.com>
 <5C98F95C0200007800221B56@prv1-mh.provo.novell.com>
 <9288a3b8-8c59-c80f-68f3-14aaca9272d4@gmail.com>
 <5C99DD160200007800221D00@prv1-mh.provo.novell.com>
Reply-To: jlpoole56@gmail.com
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4428894362330771891=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5C99DD160200007800221D00@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

This is a multi-part message in MIME format.
--===============4428894362330771891==
Content-Type: multipart/alternative;
 boundary="------------9C62953E51EE22CA4D5AD393"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------9C62953E51EE22CA4D5AD393
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 3/26/2019 1:04 AM, Jan Beulich wrote:
>>>> On 25.03.19 at 18:00, <jlpoole56@gmail.com> wrote:
>> I removed the "maxcpus=1" and attempted seven (7) boots.
>> There were minor variations, they do not seem to get
>> past the first additional processor.  Below is a summary.
> And with "maxcpus=1" in place, is it as stable hanging when trying
> to bring up the 3rd AP? I find it rather surprising that, with you
> already having sync_console on the command line, there's such a
> variation. I wonder whether SMM is somehow getting in the way.
>
> The main difference to bare metal Linux is that we enable VMX
> while they don't (afaict). Since for whatever reason we don't
> (yet) have a command line option to suppress this, could you
> re-build Xen with CONFIG_HVM turned off in xen/.config?
>
> Jan
>
>
# rem'd out CONFIG_HVM=y
make clean
make

7:46 AM 3/26/2019 build of xen w/o HVM
prompted with:
HVM support (HVM) [Y/n/?]
replied: n

cp /boot/efi/gentoo/man_xen.efi /boot/efi/gentoo/man_xen.efi_HVM_yes
cp /usr/local/src/xen/dist/install/usr/lib64/efi/xen-4.13-unstable.efi 
/boot/efi/gentoo/man_xen.efi

cp /boot/efi/gentoo/xen-4.13-unstable.gz 
/boot/efi/gentoo/xen-4.13-unstable.gz_HVM_yes
cp /usr/local/src/xen/dist/install/boot/xen-4.13-unstable.gz 
/boot/efi/gentoo/xen-4.13-unstable.gz

zeta /usr/local/src/xen # cat xen/.config |grep CONFIG_HVM
# CONFIG_HVM is not set
zeta /usr/local/src/xen #

# tried 2 boot attempts
log at: https://pastebin.com/nL4BWJ6Y

Hang points at lines:
298:
(XEN) [2019-03-26 17:14:01] Setting warm reset code and vector.
(XEN) [2019-03-26 17:14:01] 1.
(XEN) [2019-03-26 17:14:01] 2.
(XEN) [2019-03-26 17:14:01] 3.
(XEN) [2019-03-26 17:14:01] Asserting INIT.
(XEN) [2019-03-26 17:14:01] Waiting for send to finish...

599:
(XEN) [2019-03-26 17:16:30] Setting warm reset code and vector.
(XEN) [2019-03-26 17:16:30] 1.
(XEN) [2019-03-26 17:16:30] 2.
(XEN) [2019-03-26 17:16:30] 3.
(XEN) [2019-03-26 17:16:30] Asserting INIT.
(XEN) [2019-03-26 17:16:30] Waiting for send to finish...

--------------9C62953E51EE22CA4D5AD393
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 3/26/2019 1:04 AM, Jan Beulich
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:5C99DD160200007800221D00@prv1-mh.provo.novell.com">
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">On 25.03.19 at 18:00, <a class="moz-txt-link-rfc2396E" href="mailto:jlpoole56@gmail.com">&lt;jlpoole56@gmail.com&gt;</a> wrote:
</pre>
          </blockquote>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">I removed the "maxcpus=1" and attempted seven (7) boots.
There were minor variations, they do not seem to get
past the first additional processor.  Below is a summary.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
And with "maxcpus=1" in place, is it as stable hanging when trying
to bring up the 3rd AP? I find it rather surprising that, with you
already having sync_console on the command line, there's such a
variation. I wonder whether SMM is somehow getting in the way.

The main difference to bare metal Linux is that we enable VMX
while they don't (afaict). Since for whatever reason we don't
(yet) have a command line option to suppress this, could you
re-build Xen with CONFIG_HVM turned off in xen/.config?

Jan


</pre>
    </blockquote>
    <div class="moz-signature"><font size="2"><font face="Verdana">#
          rem'd out CONFIG_HVM=y<br>
          make clean<br>
          make<br>
          <br>
          7:46 AM 3/26/2019 build of xen w/o HVM<br>
          prompted with:<br>
          HVM support (HVM) [Y/n/?] <br>
          replied: n<br>
          <br>
          cp /boot/efi/gentoo/man_xen.efi
          /boot/efi/gentoo/man_xen.efi_HVM_yes<br>
          cp
          /usr/local/src/xen/dist/install/usr/lib64/efi/xen-4.13-unstable.efi
          /boot/efi/gentoo/man_xen.efi<br>
          <br>
          cp /boot/efi/gentoo/xen-4.13-unstable.gz
          /boot/efi/gentoo/xen-4.13-unstable.gz_HVM_yes<br>
          cp /usr/local/src/xen/dist/install/boot/xen-4.13-unstable.gz
          /boot/efi/gentoo/xen-4.13-unstable.gz<br>
          <br>
          zeta /usr/local/src/xen # cat xen/.config |grep CONFIG_HVM<br>
          # CONFIG_HVM is not set<br>
          zeta /usr/local/src/xen #<br>
          <br>
          # tried 2 boot attempts<br>
          log at: <a class="moz-txt-link-freetext" href="https://pastebin.com/nL4BWJ6Y">https://pastebin.com/nL4BWJ6Y</a><br>
          <br>
          Hang points at lines:<br>
          298:<br>
          (XEN) [2019-03-26 17:14:01] Setting warm reset code and
          vector.<br>
          (XEN) [2019-03-26 17:14:01] 1.<br>
          (XEN) [2019-03-26 17:14:01] 2.<br>
          (XEN) [2019-03-26 17:14:01] 3.<br>
          (XEN) [2019-03-26 17:14:01] Asserting INIT.<br>
          (XEN) [2019-03-26 17:14:01] Waiting for send to finish...<br>
          <br>
          599:<br>
          (XEN) [2019-03-26 17:16:30] Setting warm reset code and
          vector.<br>
          (XEN) [2019-03-26 17:16:30] 1.<br>
          (XEN) [2019-03-26 17:16:30] 2.<br>
          (XEN) [2019-03-26 17:16:30] 3.<br>
          (XEN) [2019-03-26 17:16:30] Asserting INIT.<br>
          (XEN) [2019-03-26 17:16:30] Waiting for send to finish...</font></font><br>
    </div>
  </body>
</html>

--------------9C62953E51EE22CA4D5AD393--


--===============4428894362330771891==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4428894362330771891==--
