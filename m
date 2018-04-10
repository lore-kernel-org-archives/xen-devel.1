From: Jia-Ju Bai <baijiaju1990@gmail.com>
Subject: Re: [PATCH 1/4] xen: xen-pciback: Replace GFP_ATOMIC
 with GFP_KERNEL in pcistub_probe
Date: Tue, 10 Apr 2018 22:31:28 +0800
Message-ID: <74fe5dd3-fb85-bed8-82b6-a9fb7a3a376d@gmail.com>
References: <1523286216-26345-1-git-send-email-baijiaju1990@gmail.com>
 <b07f0a27-f09d-1617-ab9e-ebbc761cb3a4@oracle.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3910732310806314489=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=wsdt=g7=gmail.com=baijiaju1990@srs-us1.protection.inumbo.net>)
 id 1f5uJJ-0007zD-3E
 for xen-devel@lists.xenproject.org; Tue, 10 Apr 2018 14:31:49 +0000
Received: by mail-pl0-x22c.google.com with SMTP id c7-v6so4378915plr.5
 for <xen-devel@lists.xenproject.org>; Tue, 10 Apr 2018 07:31:47 -0700 (PDT)
In-Reply-To: <b07f0a27-f09d-1617-ab9e-ebbc761cb3a4@oracle.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, jgross@suse.com, gregkh@linuxfoundation.org
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

This is a multi-part message in MIME format.
--===============3910732310806314489==
Content-Type: multipart/alternative;
 boundary="------------AF3D0B8D06F849620D9261CF"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------AF3D0B8D06F849620D9261CF
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2018/4/10 22:27, Boris Ostrovsky wrote:
> On 04/09/2018 11:03 AM, Jia-Ju Bai wrote:
>> pcistub_probe() is never called in atomic context.
>> This function is only set as ".probe" in struct pci_driver.
>>
>> Despite never getting called from atomic context,
>> pcistub_probe() calls kmalloc() with GFP_ATOMIC,
>> which does not sleep for allocation.
>> GFP_ATOMIC is not necessary and can be replaced with GFP_KERNEL,
>> which can sleep and improve the possibility of sucessful allocation.
>>
>> This is found by a static analysis tool named DCNS written by myself.
>> And I also manually check it.
>>
>> Signed-off-by: Jia-Ju Bai<baijiaju1990@gmail.com>
> What about use of GFP_ATOMIC in pcistub_reg_add()?

Thanks for your reply :)
I find pcistub_reg_add() is called by pcistub_quirk_add().
And pcistub_quirk_add() is called in the macro DRIVER_ATTR().
I am not sure whether DRIVER_ATTR() can make the function called in 
atomic context,
so I do not analyze it in my tool.


Best wishes,
Jia-Ju Bai

--------------AF3D0B8D06F849620D9261CF
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p><br>
    </p>
    <br>
    <div class="moz-cite-prefix">On 2018/4/10 22:27, Boris Ostrovsky
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:b07f0a27-f09d-1617-ab9e-ebbc761cb3a4@oracle.com">
      <pre wrap="">On 04/09/2018 11:03 AM, Jia-Ju Bai wrote:
</pre>
      <blockquote type="cite" style="color: #000000;">
        <pre wrap="">pcistub_probe() is never called in atomic context.
This function is only set as ".probe" in struct pci_driver.

Despite never getting called from atomic context,
pcistub_probe() calls kmalloc() with GFP_ATOMIC,
which does not sleep for allocation.
GFP_ATOMIC is not necessary and can be replaced with GFP_KERNEL,
which can sleep and improve the possibility of sucessful allocation.

This is found by a static analysis tool named DCNS written by myself.
And I also manually check it.

Signed-off-by: Jia-Ju Bai <a class="moz-txt-link-rfc2396E" href="mailto:baijiaju1990@gmail.com" moz-do-not-send="true">&lt;baijiaju1990@gmail.com&gt;</a>
</pre>
      </blockquote>
      <pre wrap="">What about use of GFP_ATOMIC in pcistub_reg_add()?</pre>
    </blockquote>
    <br>
    Thanks for your reply :)<br>
    I find pcistub_reg_add() is called by pcistub_quirk_add().<br>
    And pcistub_quirk_add() is called in the macro DRIVER_ATTR().<br>
    I am not sure whether DRIVER_ATTR() can make the function called in
    atomic context, <br>
    so I do not analyze it in my tool.<br>
    <br>
    <br>
    Best wishes,<br>
    Jia-Ju Bai<br>
  </body>
</html>

--------------AF3D0B8D06F849620D9261CF--


--===============3910732310806314489==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3910732310806314489==--
