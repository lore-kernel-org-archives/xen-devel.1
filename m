From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 1/2] xen/dom0: Improve documentation for
 dom0= and dom0-iommu=
Date: Fri, 21 Dec 2018 12:44:25 +0000
Message-ID: <e9fce552-7dae-6d67-1879-62e88469bc51@citrix.com>
References: <1545349252-16401-1-git-send-email-andrew.cooper3@citrix.com>
 <1545349252-16401-2-git-send-email-andrew.cooper3@citrix.com>
 <5C1CD7CD0200007800208840@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5754295039877493310=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5C1CD7CD0200007800208840@prv1-mh.provo.novell.com>
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
Cc: Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Xen-devel <xen-devel@lists.xen.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

--===============5754295039877493310==
Content-Type: multipart/alternative;
	boundary="------------C2B209C0977578F9411E302E"
Content-Language: en-GB

--------------C2B209C0977578F9411E302E
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

On 21/12/2018 12:08, Jan Beulich wrote:
>>>> On 21.12.18 at 00:40, <andrew.cooper3@citrix.com> wrote:
>> --- a/docs/misc/xen-command-line.markdown
>> +++ b/docs/misc/xen-command-line.markdown
>> @@ -636,55 +636,76 @@ trace feature is only enabled in debugging builds of Xen.
>>  
>>  Specify the bit width of the DMA heap.
>>  
>> -### dom0 (x86)
>> -> `= List of [ pvh | shadow ]`
>> +### dom0
>> +> `= List of [ pvh=<bool>, shadow=<bool> ]`
>>  
>> -> Sub-options:
>> -
>> -> `pvh`
>> +> Applicability: x86
> Why the new tag, when everything else uses (x86) next to the
> option name?

See the commit message of c/s a3a99df44e5405d2092ec59087681765fa4cdee7

The problem is with the generated HTML anchors when trying to cross
reference the options.

>
>>  ### dom0-iommu
>> -> `= List of [ passthrough | strict | map-inclusive ]`
>> -
>> -This list of booleans controls the iommu usage by Dom0:
>> -
>> -* `passthrough`: disables DMA remapping for Dom0. Default is `false`. Note that
>> -  this option is hard coded to `false` for a PVH Dom0 and any attempt to
>> -  overwrite it from the command line is ignored.
>> -
>> -* `strict`: sets up DMA remapping only for the RAM Dom0 actually got assigned.
>> -  Default is `false` which means Dom0 will get mappings for all the host
>> -  RAM except regions in use by Xen. Note that this option is hard coded to
>> -  `true` for a PVH Dom0 and any attempt to overwrite it from the command line
>> -  is ignored.
>> -
>> -* `map-inclusive`: sets up DMA remapping for all the non-RAM regions below 4GB
>> -  except for unusable ranges. Use this to work around firmware issues providing
>> -  incorrect RMRR/IVMD entries. Rather than only mapping RAM pages for IOMMU
>> -  accesses for Dom0, with this option all pages up to 4GB, not marked as
>> -  unusable in the E820 table, will get a mapping established. Note that this
>> -  option is only applicable to a PV Dom0 and is enabled by default on Intel
>> -  hardware.
>> -
>> -* `map-reserved`: sets up DMA remapping for all the reserved regions in the
>> -  memory map for Dom0. Use this to work around firmware issues providing
>> -  incorrect RMRR/IVMD entries. Rather than only mapping RAM pages for IOMMU
>> -  accesses for Dom0, all memory regions marked as reserved in the memory map
>> -  that don't overlap with any MMIO region from emulated devices will be
>> -  identity mapped. This option maps a subset of the memory that would be
>> -  mapped when using the `map-inclusive` option. This option is available to all
>> -  Dom0 modes and is enabled by default on Intel hardware.
>> +> `= List of [ passthrough=<bool>, strict=<bool>, map-inclusive=<bool>,
>> +>              map-reserved=<bool> ]`
>> +
>> +Controls for the dom0 IOMMU setup.
>> +
>> +*   The `passthrough` boolean is applicable to x86 PV dom0's only and defaults
>> +    to false.  It controls whether the IOMMU is fully disabled for devices
>> +    belonging to dom0 (`passthrough=1`), or whether the IOMMU is set up with
>> +    an identity transform for dom0 (`passthrough=0`) to prevent dom0 from
>> +    DMA'ing outside of its permitted areas.
>> +
>> +    This option is hardwired to false for x86 PVH dom0's (where a non-identity
>> +    transform is required for dom0 to function), and is ignored for ARM.
>> +
>> +*   The `strict` boolean is applicable to x86 PV dom0's only and defaults to
>> +    false.  It controls whether dom0 can have IOMMU mappings for all domain
>> +    RAM in the system, or only for its allocated RAM (and grant mappings etc.)
>> +
>> +    This option is hardwired to true for x86 PVH dom0's (as RAM belonging to
>> +    other domains in the system don't live in a compatible address space), and
>> +    is ignored for ARM.
>> +
>> +*   The `map-inclusive` boolean is applicable to x86 PV dom0's, and sets up DMA
>> +    remapping for all non-RAM regions below 4GB except for unusable ranges.
> I don't thinks this is PV-specific, just its default is.

>From arch_iommu_hwdom_init():

    /* Inclusive mappings are enabled by default for PV. */
    if ( iommu_hwdom_inclusive == -1 )
        iommu_hwdom_inclusive = is_pv_domain(d);
    /* Reserved IOMMU mappings are enabled by default. */
    if ( iommu_hwdom_reserved == -1 )
        iommu_hwdom_reserved = 1;

    if ( iommu_hwdom_inclusive && !is_pv_domain(d) )
    {
        printk(XENLOG_WARNING
               "IOMMU inclusive mappings are only supported on PV Dom0\n");
        iommu_hwdom_inclusive = 0;
    }


Attempting to use this option with a PVH dom0 will cause Xen to force it
off.

~Andrew

--------------C2B209C0977578F9411E302E
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 21/12/2018 12:08, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:5C1CD7CD0200007800208840@prv1-mh.provo.novell.com">
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">On 21.12.18 at 00:40, <a class="moz-txt-link-rfc2396E" href="mailto:andrew.cooper3@citrix.com">&lt;andrew.cooper3@citrix.com&gt;</a> wrote:
</pre>
          </blockquote>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">--- a/docs/misc/xen-command-line.markdown
+++ b/docs/misc/xen-command-line.markdown
@@ -636,55 +636,76 @@ trace feature is only enabled in debugging builds of Xen.
 
 Specify the bit width of the DMA heap.
 
-### dom0 (x86)
-&gt; `= List of [ pvh | shadow ]`
+### dom0
+&gt; `= List of [ pvh=&lt;bool&gt;, shadow=&lt;bool&gt; ]`
 
-&gt; Sub-options:
-
-&gt; `pvh`
+&gt; Applicability: x86
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Why the new tag, when everything else uses (x86) next to the
option name?</pre>
    </blockquote>
    <br>
    See the commit message of c/s
    a3a99df44e5405d2092ec59087681765fa4cdee7<br>
    <br>
    The problem is with the generated HTML anchors when trying to cross
    reference the options.<br>
    <br>
    <blockquote type="cite"
      cite="mid:5C1CD7CD0200007800208840@prv1-mh.provo.novell.com">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap=""> ### dom0-iommu
-&gt; `= List of [ passthrough | strict | map-inclusive ]`
-
-This list of booleans controls the iommu usage by Dom0:
-
-* `passthrough`: disables DMA remapping for Dom0. Default is `false`. Note that
-  this option is hard coded to `false` for a PVH Dom0 and any attempt to
-  overwrite it from the command line is ignored.
-
-* `strict`: sets up DMA remapping only for the RAM Dom0 actually got assigned.
-  Default is `false` which means Dom0 will get mappings for all the host
-  RAM except regions in use by Xen. Note that this option is hard coded to
-  `true` for a PVH Dom0 and any attempt to overwrite it from the command line
-  is ignored.
-
-* `map-inclusive`: sets up DMA remapping for all the non-RAM regions below 4GB
-  except for unusable ranges. Use this to work around firmware issues providing
-  incorrect RMRR/IVMD entries. Rather than only mapping RAM pages for IOMMU
-  accesses for Dom0, with this option all pages up to 4GB, not marked as
-  unusable in the E820 table, will get a mapping established. Note that this
-  option is only applicable to a PV Dom0 and is enabled by default on Intel
-  hardware.
-
-* `map-reserved`: sets up DMA remapping for all the reserved regions in the
-  memory map for Dom0. Use this to work around firmware issues providing
-  incorrect RMRR/IVMD entries. Rather than only mapping RAM pages for IOMMU
-  accesses for Dom0, all memory regions marked as reserved in the memory map
-  that don't overlap with any MMIO region from emulated devices will be
-  identity mapped. This option maps a subset of the memory that would be
-  mapped when using the `map-inclusive` option. This option is available to all
-  Dom0 modes and is enabled by default on Intel hardware.
+&gt; `= List of [ passthrough=&lt;bool&gt;, strict=&lt;bool&gt;, map-inclusive=&lt;bool&gt;,
+&gt;              map-reserved=&lt;bool&gt; ]`
+
+Controls for the dom0 IOMMU setup.
+
+*   The `passthrough` boolean is applicable to x86 PV dom0's only and defaults
+    to false.  It controls whether the IOMMU is fully disabled for devices
+    belonging to dom0 (`passthrough=1`), or whether the IOMMU is set up with
+    an identity transform for dom0 (`passthrough=0`) to prevent dom0 from
+    DMA'ing outside of its permitted areas.
+
+    This option is hardwired to false for x86 PVH dom0's (where a non-identity
+    transform is required for dom0 to function), and is ignored for ARM.
+
+*   The `strict` boolean is applicable to x86 PV dom0's only and defaults to
+    false.  It controls whether dom0 can have IOMMU mappings for all domain
+    RAM in the system, or only for its allocated RAM (and grant mappings etc.)
+
+    This option is hardwired to true for x86 PVH dom0's (as RAM belonging to
+    other domains in the system don't live in a compatible address space), and
+    is ignored for ARM.
+
+*   The `map-inclusive` boolean is applicable to x86 PV dom0's, and sets up DMA
+    remapping for all non-RAM regions below 4GB except for unusable ranges.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I don't thinks this is PV-specific, just its default is.</pre>
    </blockquote>
    <br>
    From arch_iommu_hwdom_init():<br>
    <br>
    <pre>    /* Inclusive mappings are enabled by default for PV. */
    if ( iommu_hwdom_inclusive == -1 )
        iommu_hwdom_inclusive = is_pv_domain(d);
    /* Reserved IOMMU mappings are enabled by default. */
    if ( iommu_hwdom_reserved == -1 )
        iommu_hwdom_reserved = 1;

    if ( iommu_hwdom_inclusive &amp;&amp; !is_pv_domain(d) )
    {
        printk(XENLOG_WARNING
               "IOMMU inclusive mappings are only supported on PV Dom0\n");
        iommu_hwdom_inclusive = 0;
    }
</pre>
    <br>
    Attempting to use this option with a PVH dom0 will cause Xen to
    force it off.<br>
    <br>
    ~Andrew<br>
  </body>
</html>

--------------C2B209C0977578F9411E302E--


--===============5754295039877493310==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5754295039877493310==--
