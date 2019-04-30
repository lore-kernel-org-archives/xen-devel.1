From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [patch 1/2] xen/arm: Free p2m entry if fail to add
 it to RB tree
Date: Tue, 30 Apr 2019 09:19:08 -0700 (PDT)
Message-ID: <alpine.DEB.2.10.1904300916050.27577@sstabellini-ThinkPad-X260>
References: <20190430053719.45D7621670@mail.kernel.org>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="8323329-248116732-1556641148=:27577"
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8ZiC=TA=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hLVTK-0000YX-SQ
 for xen-devel@lists.xenproject.org; Tue, 30 Apr 2019 16:19:10 +0000
In-Reply-To: <20190430053719.45D7621670@mail.kernel.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Hillf Danton <hdanton@sina.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Stefano Stabellini <sstabellini@kernel.org>" <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-248116732-1556641148=:27577
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: 8BIT

Hi Hillf,

Thanks for the patch. Please send emails in plain text, no html. Refer
to Documentation/process/submitting-patches.rst.


On Tue, 30 Apr 2019, Hillf Danton wrote:
> Release the newly allocated p2m entry if we detect a duplicate in the RB tree.

Space damage aside due to html, the patch looks good.
  
 
> Cc: Stefano Stabellini <sstabellini@kernel.org>
> 
> Signed-off-by: Hillf Danton <hdanton@sina.com>
> 
> ---
> 
>  
> 
> --- a/arch/arm/xen/p2m.c 2019-04-30 12:32:05.363768200 +0800
> 
> +++ b/arch/arm/xen/p2m.c    2019-04-30 12:41:29.774041800 +0800
> 
> @@ -156,6 +156,7 @@ bool __set_phys_to_machine_multi(unsigne
> 
>        rc = xen_add_phys_to_mach_entry(p2m_entry);
> 
>        if (rc < 0) {
> 
>              write_unlock_irqrestore(&p2m_lock, irqflags);
> 
> +           kfree(p2m_entry);
> 
>              return false;
> 
>        }
> 
>        write_unlock_irqrestore(&p2m_lock, irqflags);
> 
> --
> 
>  
> 
> 
> 
--8323329-248116732-1556641148=:27577
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-248116732-1556641148=:27577--
