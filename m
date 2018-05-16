From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: Clarification Meltdown for vulnerability between
 64-bit PV guests
Date: Wed, 16 May 2018 13:56:31 +0100
Message-ID: <34b64728-8618-01f0-b83d-f157aa63a8d5@citrix.com>
References: <063ab1cd-bf1f-5753-d3f8-719a1a4a8567@suse.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2905722055377077151=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=6zah=id=citrix.com=prvs=667472785=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1fIvz2-0006ml-Ri
 for xen-devel@lists.xenproject.org; Wed, 16 May 2018 12:56:44 +0000
In-Reply-To: <063ab1cd-bf1f-5753-d3f8-719a1a4a8567@suse.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: John Wang <xgwang@suse.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

--===============2905722055377077151==
Content-Type: multipart/alternative;
	boundary="------------4153FDA19A70D65F6E22A6A8"
Content-Language: en-GB

--------------4153FDA19A70D65F6E22A6A8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On 16/05/18 09:37, John Wang wrote:
>
> Hi:
>
> 64 bit PV guest can attack hypervisor by SP3
>

Yes.

> whether it still can attack others 64 bit PV guest by SP3?
>

Meltdown attacks only operate within a single address space.  You can't
attack a separate address space with it.

That said, the VM => VM attack with Meltdown is due to the fact that
other VMs are mapped into Xen's directmap, so available by attacking the
hypervisor.

~Andrew

--------------4153FDA19A70D65F6E22A6A8
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 16/05/18 09:37, John Wang wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:063ab1cd-bf1f-5753-d3f8-719a1a4a8567@suse.com">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <p>Hi:</p>
      <p>64 bit PV guest can attack hypervisor by SP3</p>
    </blockquote>
    <br>
    Yes.<br>
    <br>
    <blockquote type="cite"
      cite="mid:063ab1cd-bf1f-5753-d3f8-719a1a4a8567@suse.com">
      <p><span class="op_dict_text2">whether</span> it still can attack
        others 64 bit PV guest by SP3?</p>
    </blockquote>
    <br>
    Meltdown attacks only operate within a single address space.  You
    can't attack a separate address space with it.<br>
    <br>
    That said, the VM =&gt; VM attack with Meltdown is due to the fact
    that other VMs are mapped into Xen's directmap, so available by
    attacking the hypervisor.<br>
    <br>
    ~Andrew<br>
  </body>
</html>

--------------4153FDA19A70D65F6E22A6A8--


--===============2905722055377077151==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2905722055377077151==--
