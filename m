From: Manish Jaggi <mjaggi@caviumnetworks.com>
Subject: Re: [RFC PATCH] arm64: vgic-v3: Add ITS doorbell region
 in Dom0 stage-2
Date: Thu, 18 Jan 2018 22:55:28 +0530
Message-ID: <a9db3e65-7aed-6253-45b8-3aa32ae2bf52@caviumnetworks.com>
References: <20180118061537.27323-1-mjaggi@caviumnetworks.com>
 <a1db662b-24a8-a226-12ef-a64fd138fa11@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3351010798444747186=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=cf4u=en=cavium.com=manish.jaggi@srs-us1.protection.inumbo.net>)
 id 1ecDwn-00006R-Bm
 for xen-devel@lists.xenproject.org; Thu, 18 Jan 2018 17:25:53 +0000
In-Reply-To: <a1db662b-24a8-a226-12ef-a64fd138fa11@linaro.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@linaro.org>, xen-devel@lists.xenproject.org, sameer.goel@linaro.org, andre.przywara@linaro.org
Cc: manish.jaggi@cavium.com
List-Id: xen-devel@lists.xenproject.org

This is a multi-part message in MIME format.
--===============3351010798444747186==
Content-Type: multipart/alternative;
 boundary="------------BFB03FD7D4F1E84167897410"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------BFB03FD7D4F1E84167897410
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit



On 01/18/2018 10:22 PM, Julien Grall wrote:
> Hi Manish,
Hi Julien,
>
> On 18/01/18 06:15, mjaggi@caviumnetworks.com wrote:
>> From: Manish Jaggi <mjaggi@caviumnetworks.com>
>>
>> This patch introduces a function vgic_map_translation_space for mapping
>> ITS 64K translater space for doorbells in dom0 stage-2.
>> It is required as dom0 PCI devices behined SMMU  wont be able to 
>> write MSIs.
>
> s/behined/behind/
>
> also there a two spaces after SMMU. One should be enough.
>
ok
>>
>> This function is called from vgic_v3_its_init_domain only for 
>> hardware domain.
>
> This is really confusing. You mix dom0 and hardware domain in the same 
> commit. Please use only "hardware domain".
I stressed this here as this function is only called for hardware 
domain, if you see line 1550

|if ( is_hardware_domain(d) ) is checked.|

>
>>
>> This patch is also required for testing
>> [RFC 00/11] acpi: arm: IORT Support for Xen [1]
>> + [2]  [RFC v4 0/8] SMMUv3 driver
>>   [1] 
>> https://lists.xenproject.org/archives/html/xen-devel/2018-01/msg00007.html
>> [2] https://lists.xen.org/archives/html/xen-devel/2017-12/msg01294.html
>
> Anything after "This patch..." does not seem to be relevant in the 
> commit. You might want to add that after --- so it get stripped after 
> committing.
ok
>
>>
>> Signed-off-by: Manish Jaggi <manish.jaggi@cavium.com>
>> ---
>>   xen/arch/arm/vgic-v3-its.c | 26 ++++++++++++++++++++++++++
>>   1 file changed, 26 insertions(+)
>>
>> diff --git a/xen/arch/arm/vgic-v3-its.c b/xen/arch/arm/vgic-v3-its.c
>> index 72a5c70656..a8f8079149 100644
>> --- a/xen/arch/arm/vgic-v3-its.c
>> +++ b/xen/arch/arm/vgic-v3-its.c
>> @@ -1511,6 +1511,30 @@ unsigned int vgic_v3_its_count(const struct 
>> domain *d)
>>       return ret;
>>   }
>>   +static int vgic_map_translation_space(struct domain *d, paddr_t 
>> guest_addr)
>
> This function is quite confusing. What is guest_addr? It looks like it 
> is the base address of the ITS but it is not very clear here.
ok I will change the name.
>
>> +{
>> +    u64 addr, size;
>
> This should be paddr_t.
>
>> +    int ret;
>
> Newline here please.
>
>> +    addr = guest_addr + SZ_64K;
>> +    size = SZ_64K;
>> +
>> +    ret = map_mmio_regions(d,
>> +                           paddr_to_pfn(addr & PAGE_MASK),
>> +                           DIV_ROUND_UP(size, PAGE_SIZE),
>> +                           paddr_to_pfn(addr & PAGE_MASK));
>
> You are assuming a 1:1 mapping in the domain. Nowhere you explain that 
> assumption nor that it will not work for guest. At least you need an 
> ASSERT(is_domain_direct_mapped(d)).
>
> Furthermore, as we discussed yesterday I would expect a big fat 
> comment that this need to be revisited when DomU support will be added 
> as it may not be safe to map the Doorbell in page-tables used by the 
> processor.
I think you didnt read the commit log properly, this function is *only* 
called for hardware domain. So there is no question of DomU.
Request you to please see the code again.

|int vgic_v3_its_init_domain(struct domain *d) { ... if ( 
is_hardware_domain(d) ) { struct host_its *hw_its; 
list_for_each_entry(hw_its, &host_its_list, entry) { ... 
vgic_map_translation_space(d, hw_its->addr); } } ... } |



>
>> +
>> +    if ( ret )
>> +    {
>> +        printk(XENLOG_ERR "Unable to map to dom%d access to"
>> +               " 0x%"PRIx64" - 0x%"PRIx64"\n",
>> +               d->domain_id,
>> +               addr & PAGE_MASK, PAGE_ALIGN(addr + size) - 1);
>> +    }
>> +
>> +    return ret;
>> +
>> +}
>> +
>>   /*
>>    * For a hardware domain, this will iterate over the host ITSes
>>    * and map one virtual ITS per host ITS at the same address.
>> @@ -1541,6 +1565,8 @@ int vgic_v3_its_init_domain(struct domain *d)
>>                   return ret;
>>               else
>>                   d->arch.vgic.has_its = true;
>> +
>> +            vgic_map_translation_space(d, hw_its->addr);
> Your new function may return an error. Therefore you should test it.
yes, I thought we will focus more is this is the right place to add this 
test code.
>
>>           }
>>       }
>>
>
> Cheers,
>


--------------BFB03FD7D4F1E84167897410
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p><br>
    </p>
    <br>
    <div class="moz-cite-prefix">On 01/18/2018 10:22 PM, Julien Grall
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:a1db662b-24a8-a226-12ef-a64fd138fa11@linaro.org">Hi
      Manish,
      <br>
    </blockquote>
    Hi Julien,<br>
    <blockquote type="cite"
      cite="mid:a1db662b-24a8-a226-12ef-a64fd138fa11@linaro.org">
      <br>
      On 18/01/18 06:15, <a class="moz-txt-link-abbreviated" href="mailto:mjaggi@caviumnetworks.com">mjaggi@caviumnetworks.com</a> wrote:
      <br>
      <blockquote type="cite">From: Manish Jaggi
        <a class="moz-txt-link-rfc2396E" href="mailto:mjaggi@caviumnetworks.com">&lt;mjaggi@caviumnetworks.com&gt;</a>
        <br>
        <br>
        This patch introduces a function vgic_map_translation_space for
        mapping
        <br>
        ITS 64K translater space for doorbells in dom0 stage-2.
        <br>
        It is required as dom0 PCI devices behined SMMU  wont be able to
        write MSIs.
        <br>
      </blockquote>
      <br>
      s/behined/behind/
      <br>
      <br>
      also there a two spaces after SMMU. One should be enough.
      <br>
      <br>
    </blockquote>
    ok<br>
    <blockquote type="cite"
      cite="mid:a1db662b-24a8-a226-12ef-a64fd138fa11@linaro.org">
      <blockquote type="cite">
        <br>
        This function is called from vgic_v3_its_init_domain only for
        hardware domain.
        <br>
      </blockquote>
      <br>
      This is really confusing. You mix dom0 and hardware domain in the
      same commit. Please use only "hardware domain".
      <br>
    </blockquote>
    I stressed this here as this function is only called for hardware
    domain, if you see line 1550<br>
    <pre style="padding: 0px; margin: 0px; color: rgb(0, 0, 0); font-size: 13.3333px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;"><code>if ( is_hardware_domain(d) ) is checked.</code></pre>
    <blockquote type="cite"
      cite="mid:a1db662b-24a8-a226-12ef-a64fd138fa11@linaro.org">
      <br>
      <blockquote type="cite">
        <br>
        This patch is also required for testing
        <br>
        [RFC 00/11] acpi: arm: IORT Support for Xen [1]
        <br>
        + [2]  [RFC v4 0/8] SMMUv3 driver
        <br>
          [1]
<a class="moz-txt-link-freetext" href="https://lists.xenproject.org/archives/html/xen-devel/2018-01/msg00007.html">https://lists.xenproject.org/archives/html/xen-devel/2018-01/msg00007.html</a><br>
        [2]
        <a class="moz-txt-link-freetext" href="https://lists.xen.org/archives/html/xen-devel/2017-12/msg01294.html">https://lists.xen.org/archives/html/xen-devel/2017-12/msg01294.html</a>
        <br>
      </blockquote>
      <br>
      Anything after "This patch..." does not seem to be relevant in the
      commit. You might want to add that after --- so it get stripped
      after committing.
      <br>
    </blockquote>
    ok<br>
    <blockquote type="cite"
      cite="mid:a1db662b-24a8-a226-12ef-a64fd138fa11@linaro.org">
      <br>
      <blockquote type="cite">
        <br>
        Signed-off-by: Manish Jaggi <a class="moz-txt-link-rfc2396E" href="mailto:manish.jaggi@cavium.com">&lt;manish.jaggi@cavium.com&gt;</a>
        <br>
        ---
        <br>
          xen/arch/arm/vgic-v3-its.c | 26 ++++++++++++++++++++++++++
        <br>
          1 file changed, 26 insertions(+)
        <br>
        <br>
        diff --git a/xen/arch/arm/vgic-v3-its.c
        b/xen/arch/arm/vgic-v3-its.c
        <br>
        index 72a5c70656..a8f8079149 100644
        <br>
        --- a/xen/arch/arm/vgic-v3-its.c
        <br>
        +++ b/xen/arch/arm/vgic-v3-its.c
        <br>
        @@ -1511,6 +1511,30 @@ unsigned int vgic_v3_its_count(const
        struct domain *d)
        <br>
              return ret;
        <br>
          }
        <br>
          +static int vgic_map_translation_space(struct domain *d,
        paddr_t guest_addr)
        <br>
      </blockquote>
      <br>
      This function is quite confusing. What is guest_addr? It looks
      like it is the base address of the ITS but it is not very clear
      here.
      <br>
    </blockquote>
    ok I will change the name.<br>
    <blockquote type="cite"
      cite="mid:a1db662b-24a8-a226-12ef-a64fd138fa11@linaro.org">
      <br>
      <blockquote type="cite">+{
        <br>
        +    u64 addr, size;
        <br>
      </blockquote>
      <br>
      This should be paddr_t.
      <br>
      <br>
      <blockquote type="cite">+    int ret;
        <br>
      </blockquote>
      <br>
      Newline here please.
      <br>
      <br>
      <blockquote type="cite">+    addr = guest_addr + SZ_64K;
        <br>
        +    size = SZ_64K;
        <br>
        +
        <br>
        +    ret = map_mmio_regions(d,
        <br>
        +                           paddr_to_pfn(addr &amp; PAGE_MASK),
        <br>
        +                           DIV_ROUND_UP(size, PAGE_SIZE),
        <br>
        +                           paddr_to_pfn(addr &amp; PAGE_MASK));
        <br>
      </blockquote>
      <br>
      You are assuming a 1:1 mapping in the domain. Nowhere you explain
      that assumption nor that it will not work for guest. At least you
      need an ASSERT(is_domain_direct_mapped(d)).
      <br>
      <br>
      Furthermore, as we discussed yesterday I would expect a big fat
      comment that this need to be revisited when DomU support will be
      added as it may not be safe to map the Doorbell in page-tables
      used by the processor.
      <br>
    </blockquote>
    I think you didnt read the commit log properly, this function is
    *only* called for hardware domain. So there is no question of DomU.<br>
    Request you to please see the code again.<br>
    <br>
    <pre style="padding: 0px; margin: 0px; color: rgb(0, 0, 0); font-size: 13.3333px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;"><code>int vgic_v3_its_init_domain(struct domain *d)
{
 ...
    if ( is_hardware_domain(d) )
    {
        struct host_its *hw_its;

        list_for_each_entry(hw_its, &amp;host_its_list, entry)
        {
 	   ...
            vgic_map_translation_space(d, hw_its-&gt;addr);
        }
    }
...
}
</code></pre>
    <br>
    <br>
    <blockquote type="cite"
      cite="mid:a1db662b-24a8-a226-12ef-a64fd138fa11@linaro.org">
      <br>
      <blockquote type="cite">+
        <br>
        +    if ( ret )
        <br>
        +    {
        <br>
        +        printk(XENLOG_ERR "Unable to map to dom%d access to"
        <br>
        +               " 0x%"PRIx64" - 0x%"PRIx64"\n",
        <br>
        +               d-&gt;domain_id,
        <br>
        +               addr &amp; PAGE_MASK, PAGE_ALIGN(addr + size) -
        1);
        <br>
        +    }
        <br>
        +
        <br>
        +    return ret;
        <br>
        +
        <br>
        +}
        <br>
        +
        <br>
          /*
        <br>
           * For a hardware domain, this will iterate over the host
        ITSes
        <br>
           * and map one virtual ITS per host ITS at the same address.
        <br>
        @@ -1541,6 +1565,8 @@ int vgic_v3_its_init_domain(struct domain
        *d)
        <br>
                          return ret;
        <br>
                      else
        <br>
                          d-&gt;arch.vgic.has_its = true;
        <br>
        +
        <br>
        +            vgic_map_translation_space(d, hw_its-&gt;addr);
        <br>
      </blockquote>
      Your new function may return an error. Therefore you should test
      it.
      <br>
    </blockquote>
    yes, I thought we will focus more is this is the right place to add
    this test code.<br>
    <blockquote type="cite"
      cite="mid:a1db662b-24a8-a226-12ef-a64fd138fa11@linaro.org">
      <br>
      <blockquote type="cite">          }
        <br>
              }
        <br>
          <br>
      </blockquote>
      <br>
      Cheers,
      <br>
      <br>
    </blockquote>
    <br>
  </body>
</html>

--------------BFB03FD7D4F1E84167897410--


--===============3351010798444747186==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3351010798444747186==--
