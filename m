From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/pv: Fix construction of 32bit dom0's
Date: Thu, 7 Feb 2019 13:29:18 +0000
Message-ID: <c6657a1e-3f1c-3bd4-6d7a-b0ca761fb664@citrix.com>
References: <1549485670-9273-1-git-send-email-andrew.cooper3@citrix.com>
 <5C5C2B900200007800214A08@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1779225890808848563=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5C5C2B900200007800214A08@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Xen-devel <xen-devel@lists.xen.org>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

--===============1779225890808848563==
Content-Type: multipart/alternative;
	boundary="------------45242EE29C68B518179B102F"
Content-Language: en-GB

--------------45242EE29C68B518179B102F
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On 07/02/2019 12:58, Jan Beulich wrote:
>>>> On 06.02.19 at 21:41, <andrew.cooper3@citrix.com> wrote:
>> Slightly RFC:
>>
>> 1) I've not worked out exactly what the
>>
>>      v->vcpu_info = (void *)&d->shared_info->compat.vcpu_info[0];
>>
>>    line is supposed to be doing and whether it is needed, but it doesn't
>>    appear to matter.  It is perhaps another redundant opencoding.
> Afaict this is just to be independent of the fact that the vcpu_info
> array is first in struct shared_info. I'd be fine with it getting replaced
> by a respective BUILD_BUG_ON(), but I'd like to ask that it not be
> dropped without replacement.

There is some ancillary logic with vcpu_info_mfn (which looks not to be
initialised), which is why I suspect this is some more incorrect
opencoding to begin with.

>
>> 2) The reported
>>
>>      Dom0 alloc.:   000000003e800000->000000003ec00000 (240470 pages to be allocated)
>>
>>    line changes by 1 page because of the alloc_domheap_page() moving ahead of
>>    the printk(), but I'm fairly sure this is benign.  There is a matching
>>    reduction in the length of the constructed m2p which is perhaps less
>>    benign.
> Well, the M2P of course has to be correctly sized. An off-by-one would
> likely result in hard to repro bug reports.

The delta in output (with some of my own debugging) is:

@@ -22,13 +22,13 @@
 (XEN)     p2m_base         = 0xffffffffffffffff
 (XEN)  Xen  kernel: 64-bit, lsb, compat32
 (XEN)  Dom0 kernel: 32-bit, PAE, lsb, paddr 0x100000 -> 0x112000
-(XEN) ** nr_pages 241494
+(XEN) ** nr_pages 241493
 (XEN) PHYSICAL MEMORY ARRANGEMENT:
-(XEN)  Dom0 alloc.:   000000003e800000->000000003ec00000 (240470 pages to be allocated) (tot 1024, nr 241494)
+(XEN)  Dom0 alloc.:   000000003e800000->000000003ec00000 (240469 pages to be allocated) (tot 1024, nr 241493)
 (XEN) VIRTUAL MEMORY ARRANGEMENT:
 (XEN)  Loaded kernel: 0000000000100000->0000000000112000
 (XEN)  Init. ramdisk: 0000000000112000->0000000000112000
-(XEN)  Phys-Mach map: 0000000000112000->00000000001fdd58
+(XEN)  Phys-Mach map: 0000000000112000->00000000001fdd54
 (XEN)  Start info:    00000000001fe000->00000000001fe4b4
 (XEN)  Xenstore ring: 0000000000000000->0000000000000000
 (XEN)  Console ring:  0000000000000000->0000000000000000

I meant the P2M rather than M2P, and it is different by 1 entry which is
expected, given the change by 1 page.  I've positively identified the
1-page change to be the alloc_domheap_page() for the monitor table moving.

>
>> @@ -606,23 +598,14 @@ int __init dom0_construct_pv(struct domain *d,
>>      {
>>          maddr_to_page(mpt_alloc)->u.inuse.type_info = PGT_l4_page_table;
>>          l4start = l4tab = __va(mpt_alloc); mpt_alloc += PAGE_SIZE;
>> +        clear_page(l4tab);
>> +        init_xen_l4_slots(l4tab, _mfn(virt_to_mfn(l4start)),
>> +                          d, INVALID_MFN, true);
>> +        v->arch.guest_table = pagetable_from_paddr(__pa(l4start));
>>      }
>>      else
>> -    {
>> -        page = alloc_domheap_page(d, MEMF_no_owner | MEMF_no_scrub);
>> -        if ( !page )
>> -            panic("Not enough RAM for domain 0 PML4\n");
>> -        page->u.inuse.type_info = PGT_l4_page_table|PGT_validated|1;
>> -        l4start = l4tab = page_to_virt(page);
>> -        maddr_to_page(mpt_alloc)->u.inuse.type_info = PGT_l3_page_table;
>> -        l3start = __va(mpt_alloc); mpt_alloc += PAGE_SIZE;
> This one is lost without replacement, but is needed. Commit
> 7a9d764630 ("x86/32-on-64: adjust Dom0 initial page table layout")
> specifically introduced it to make sure the guest-perceived top level
> page table is allocated first (and hence marks the beginning of the
> boot page tables, so Dom0 can later put all of them into general use).

I did call this out specifically in the commit message.  I had no idea
about that commit when editing the code, but I still don't understand
why it is important that the guests top level needs to be first.

~Andrew

--------------45242EE29C68B518179B102F
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 07/02/2019 12:58, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:5C5C2B900200007800214A08@prv1-mh.provo.novell.com">
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">On 06.02.19 at 21:41, <a class="moz-txt-link-rfc2396E" href="mailto:andrew.cooper3@citrix.com">&lt;andrew.cooper3@citrix.com&gt;</a> wrote:
</pre>
          </blockquote>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">Slightly RFC:

1) I've not worked out exactly what the

     v-&gt;vcpu_info = (void *)&amp;d-&gt;shared_info-&gt;compat.vcpu_info[0];

   line is supposed to be doing and whether it is needed, but it doesn't
   appear to matter.  It is perhaps another redundant opencoding.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Afaict this is just to be independent of the fact that the vcpu_info
array is first in struct shared_info. I'd be fine with it getting replaced
by a respective BUILD_BUG_ON(), but I'd like to ask that it not be
dropped without replacement.</pre>
    </blockquote>
    <br>
    There is some ancillary logic with vcpu_info_mfn (which looks not to
    be initialised), which is why I suspect this is some more incorrect
    opencoding to begin with.<br>
    <br>
    <blockquote type="cite"
      cite="mid:5C5C2B900200007800214A08@prv1-mh.provo.novell.com">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">2) The reported

     Dom0 alloc.:   000000003e800000-&gt;000000003ec00000 (240470 pages to be allocated)

   line changes by 1 page because of the alloc_domheap_page() moving ahead of
   the printk(), but I'm fairly sure this is benign.  There is a matching
   reduction in the length of the constructed m2p which is perhaps less
   benign.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Well, the M2P of course has to be correctly sized. An off-by-one would
likely result in hard to repro bug reports.</pre>
    </blockquote>
    <br>
    The delta in output (with some of my own debugging) is:<br>
    <br>
    <pre>@@ -22,13 +22,13 @@
 (XEN)     p2m_base         = 0xffffffffffffffff
 (XEN)  Xen  kernel: 64-bit, lsb, compat32
 (XEN)  Dom0 kernel: 32-bit, PAE, lsb, paddr 0x100000 -&gt; 0x112000
-(XEN) ** nr_pages 241494
+(XEN) ** nr_pages 241493
 (XEN) PHYSICAL MEMORY ARRANGEMENT:
-(XEN)  Dom0 alloc.:   000000003e800000-&gt;000000003ec00000 (240470 pages to be allocated) (tot 1024, nr 241494)
+(XEN)  Dom0 alloc.:   000000003e800000-&gt;000000003ec00000 (240469 pages to be allocated) (tot 1024, nr 241493)
 (XEN) VIRTUAL MEMORY ARRANGEMENT:
 (XEN)  Loaded kernel: 0000000000100000-&gt;0000000000112000
 (XEN)  Init. ramdisk: 0000000000112000-&gt;0000000000112000
-(XEN)  Phys-Mach map: 0000000000112000-&gt;00000000001fdd58
+(XEN)  Phys-Mach map: 0000000000112000-&gt;00000000001fdd54
 (XEN)  Start info:    00000000001fe000-&gt;00000000001fe4b4
 (XEN)  Xenstore ring: 0000000000000000-&gt;0000000000000000
 (XEN)  Console ring:  0000000000000000-&gt;0000000000000000

</pre>
    I meant the P2M rather than M2P, and it is different by 1 entry
    which is expected, given the change by 1 page.  I've positively
    identified the 1-page change to be the alloc_domheap_page() for the
    monitor table moving.<br>
    <br>
    <blockquote type="cite"
      cite="mid:5C5C2B900200007800214A08@prv1-mh.provo.novell.com">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">@@ -606,23 +598,14 @@ int __init dom0_construct_pv(struct domain *d,
     {
         maddr_to_page(mpt_alloc)-&gt;u.inuse.type_info = PGT_l4_page_table;
         l4start = l4tab = __va(mpt_alloc); mpt_alloc += PAGE_SIZE;
+        clear_page(l4tab);
+        init_xen_l4_slots(l4tab, _mfn(virt_to_mfn(l4start)),
+                          d, INVALID_MFN, true);
+        v-&gt;arch.guest_table = pagetable_from_paddr(__pa(l4start));
     }
     else
-    {
-        page = alloc_domheap_page(d, MEMF_no_owner | MEMF_no_scrub);
-        if ( !page )
-            panic("Not enough RAM for domain 0 PML4\n");
-        page-&gt;u.inuse.type_info = PGT_l4_page_table|PGT_validated|1;
-        l4start = l4tab = page_to_virt(page);
-        maddr_to_page(mpt_alloc)-&gt;u.inuse.type_info = PGT_l3_page_table;
-        l3start = __va(mpt_alloc); mpt_alloc += PAGE_SIZE;
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
This one is lost without replacement, but is needed. Commit
7a9d764630 ("x86/32-on-64: adjust Dom0 initial page table layout")
specifically introduced it to make sure the guest-perceived top level
page table is allocated first (and hence marks the beginning of the
boot page tables, so Dom0 can later put all of them into general use).</pre>
    </blockquote>
    <br>
    I did call this out specifically in the commit message.  I had no
    idea about that commit when editing the code, but I still don't
    understand why it is important that the guests top level needs to be
    first.<br>
    <br>
    ~Andrew<br>
  </body>
</html>

--------------45242EE29C68B518179B102F--


--===============1779225890808848563==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1779225890808848563==--
