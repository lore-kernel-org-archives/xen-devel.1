From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 5/5] x86/dom0: take alignment into account
 when populating p2m in PVH mode
Date: Thu, 27 Dec 2018 20:14:40 +0000
Message-ID: <65ced44d-19ce-74c1-b073-c74af424f354@citrix.com>
References: <20181227152638.41648-1-roger.pau@citrix.com>
 <20181227152638.41648-6-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3496766395972675146=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8dHC=PE=citrix.com=prvs=89228f4dd=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gcc3o-0000bX-6O
 for xen-devel@lists.xenproject.org; Thu, 27 Dec 2018 20:15:16 +0000
In-Reply-To: <20181227152638.41648-6-roger.pau@citrix.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

--===============3496766395972675146==
Content-Type: multipart/alternative;
	boundary="------------BA6F16AE6432E26BB73935F6"
Content-Language: en-GB

--------------BA6F16AE6432E26BB73935F6
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On 27/12/2018 15:26, Roger Pau Monne wrote:
> Current code that allocates memory and populates the p2m for PVH Dom0
> doesn't take the address alignment into account, this can lead to high
> order allocations that start on a non-aligned address to be broken
> down into lower order entries on the p2m page tables.
>
> Fix this by taking into account the p2m page sizes and alignment
> requirements when allocating the memory and populating the p2m.
>
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

I've committed patches 1-4 because they are trivial.

This patch does fix the alignment issue, but does so at a rather large cost.

The sequence (without any of the E820 series) is now:

(XEN) *** Building a PVH Dom0 ***
(XEN) pvh_populate_memory_range(d0, 0, a0)
(XEN) guest_physmap_add_page(d0, 00000, 100be1, 0 = 4kB)
...
(XEN) guest_physmap_add_page(d0, 0009f, 100b42, 0 = 4kB)
(XEN) pvh_populate_memory_range(d0, 100, 360)
(XEN) guest_physmap_add_page(d0, 00100, 100b41, 0 = 4kB)
...
(XEN) guest_physmap_add_page(d0, 001ff, 100a42, 0 = 4kB)
(XEN) guest_physmap_add_page(d0, 00200, 100800, 9 = 2048kB)
(XEN) guest_physmap_add_page(d0, 00400, 100a41, 0 = 4kB)
...
(XEN) guest_physmap_add_page(d0, 0045f, 1007e2, 0 = 4kB)


So overall, the 2M superpage is created in the middle, but all the 4k
entries are made with a single call to guest_physmap_add_page() at a
time, which is going to be very inefficient with the P2M lock.

Ideally, we should make a single order 8 allocation at 1M, then the
order 9 at 2M.

I think it might be better to try and crib from the HVM domainbuilder
code, which copes with collecting together the head and tail of
non-aligned allocations while still making an order > 0 requests where
possible.

~Andrew

--------------BA6F16AE6432E26BB73935F6
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 27/12/2018 15:26, Roger Pau Monne
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20181227152638.41648-6-roger.pau@citrix.com">
      <pre class="moz-quote-pre" wrap="">Current code that allocates memory and populates the p2m for PVH Dom0
doesn't take the address alignment into account, this can lead to high
order allocations that start on a non-aligned address to be broken
down into lower order entries on the p2m page tables.

Fix this by taking into account the p2m page sizes and alignment
requirements when allocating the memory and populating the p2m.

Reported-by: Andrew Cooper <a class="moz-txt-link-rfc2396E" href="mailto:andrew.cooper3@citrix.com">&lt;andrew.cooper3@citrix.com&gt;</a>
Signed-off-by: Roger Pau Monné <a class="moz-txt-link-rfc2396E" href="mailto:roger.pau@citrix.com">&lt;roger.pau@citrix.com&gt;</a></pre>
    </blockquote>
    <br>
    I've committed patches 1-4 because they are trivial.<br>
    <br>
    This patch does fix the alignment issue, but does so at a rather
    large cost.<br>
    <br>
    The sequence (without any of the E820 series) is now:<br>
    <br>
    <pre>(XEN) *** Building a PVH Dom0 ***
(XEN) pvh_populate_memory_range(d0, 0, a0)
(XEN) guest_physmap_add_page(d0, 00000, 100be1, 0 = 4kB)
...
(XEN) guest_physmap_add_page(d0, 0009f, 100b42, 0 = 4kB)
(XEN) pvh_populate_memory_range(d0, 100, 360)
(XEN) guest_physmap_add_page(d0, 00100, 100b41, 0 = 4kB)
...
(XEN) guest_physmap_add_page(d0, 001ff, 100a42, 0 = 4kB)
(XEN) guest_physmap_add_page(d0, 00200, 100800, 9 = 2048kB)
(XEN) guest_physmap_add_page(d0, 00400, 100a41, 0 = 4kB)
...
(XEN) guest_physmap_add_page(d0, 0045f, 1007e2, 0 = 4kB)
</pre>
    <br>
    So overall, the 2M superpage is created in the middle, but all the
    4k entries are made with a single call to guest_physmap_add_page()
    at a time, which is going to be very inefficient with the P2M lock.<br>
    <br>
    Ideally, we should make a single order 8 allocation at 1M, then the
    order 9 at 2M.<br>
    <br>
    I think it might be better to try and crib from the HVM
    domainbuilder code, which copes with collecting together the head
    and tail of non-aligned allocations while still making an order &gt;
    0 requests where possible.<br>
    <br>
    ~Andrew<br>
  </body>
</html>

--------------BA6F16AE6432E26BB73935F6--


--===============3496766395972675146==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3496766395972675146==--
