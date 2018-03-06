From: Manish Jaggi <manish.jaggi@linaro.org>
Subject: Re: [RFC 06/11] fwnode xen spacific changes
Date: Tue, 6 Mar 2018 19:13:11 +0530
Message-ID: <e83d1ac0-48c1-92f9-590f-b894bc1f43f0@linaro.org>
References: <20180102092809.1841-1-manish.jaggi@linaro.org>
 <20180102092809.1841-7-manish.jaggi@linaro.org>
 <521998b8-1179-bc87-db7b-a4e3aee0c644@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0104517590773740308=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=decx=f4=linaro.org=manish.jaggi@srs-us1.protection.inumbo.net>)
 id 1etCsF-0004b2-Ag
 for xen-devel@lists.xenproject.org; Tue, 06 Mar 2018 13:43:23 +0000
Received: by mail-pf0-x236.google.com with SMTP id a16so8723160pfn.9
 for <xen-devel@lists.xenproject.org>; Tue, 06 Mar 2018 05:43:21 -0800 (PST)
In-Reply-To: <521998b8-1179-bc87-db7b-a4e3aee0c644@linaro.org>
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
Cc: Jan Beulich <JBeulich@suse.com>, manish.jaggi@cavium.com
List-Id: xen-devel@lists.xenproject.org

This is a multi-part message in MIME format.
--===============0104517590773740308==
Content-Type: multipart/alternative;
 boundary="------------42828D510658E72ACF5E840E"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------42828D510658E72ACF5E840E
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Julien,


On 01/19/2018 12:21 AM, Julien Grall wrote:
>> diff --git a/xen/include/asm-arm/device.h b/xen/include/asm-arm/device.h
>> index 6734ae8efd..f78482ca0c 100644
>> --- a/xen/include/asm-arm/device.h
>> +++ b/xen/include/asm-arm/device.h
>> @@ -6,6 +6,8 @@
>>   enum device_type
>>   {
>>       DEV_DT,
>> +    DEV_ACPI,
>
> You don't use DEV_ACPI in this patch. So why is there?
>
>> +    DEV_PCI,
>>   };
>>     struct dev_archdata {
>> @@ -18,8 +20,13 @@ struct device
>>       enum device_type type;
>>   #ifdef CONFIG_HAS_DEVICE_TREE
>>       struct dt_device_node *of_node; /* Used by drivers imported 
>> from Linux */
>
> As said on Sameer's patches, I was expecting a todo in the code after 
> the discussion about leave of_node here. 
I think you are referring to https://patchwork.kernel.org/patch/9963109/
Could you please add what TODO you wish to add ?

I could not find  any discussion on of_node in the mail chain


-Regards
Manish

--------------42828D510658E72ACF5E840E
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>Hi Julien,<br>
    </p>
    <br>
    <div class="moz-cite-prefix">On 01/19/2018 12:21 AM, Julien Grall
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:521998b8-1179-bc87-db7b-a4e3aee0c644@linaro.org">
      <blockquote type="cite" style="color: #000000;">diff --git
        a/xen/include/asm-arm/device.h b/xen/include/asm-arm/device.h
        <br>
        index 6734ae8efd..f78482ca0c 100644
        <br>
        --- a/xen/include/asm-arm/device.h
        <br>
        +++ b/xen/include/asm-arm/device.h
        <br>
        @@ -6,6 +6,8 @@
        <br>
          enum device_type
        <br>
          {
        <br>
              DEV_DT,
        <br>
        +    DEV_ACPI,
        <br>
      </blockquote>
      <br>
      You don't use DEV_ACPI in this patch. So why is there?
      <br>
      <br>
      <blockquote type="cite" style="color: #000000;">+    DEV_PCI,
        <br>
          };
        <br>
            struct dev_archdata {
        <br>
        @@ -18,8 +20,13 @@ struct device
        <br>
              enum device_type type;
        <br>
          #ifdef CONFIG_HAS_DEVICE_TREE
        <br>
              struct dt_device_node *of_node; /* Used by drivers
        imported from Linux */
        <br>
      </blockquote>
      <br>
      As said on Sameer's patches, I was expecting a todo in the code
      after the discussion about leave of_node here.
    </blockquote>
    I think you are referring to
    <a class="moz-txt-link-freetext" href="https://patchwork.kernel.org/patch/9963109/">https://patchwork.kernel.org/patch/9963109/</a><br>
    Could you please add what TODO you wish to add ?<br>
    <br>
    I could not find  any discussion on of_node in the mail chain<br>
    <br>
    <br>
    -Regards<br>
    Manish<br>
  </body>
</html>

--------------42828D510658E72ACF5E840E--


--===============0104517590773740308==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0104517590773740308==--
