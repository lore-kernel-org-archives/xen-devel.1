From: Stefano Stabellini <sstabellini@kernel.org>
Subject: null scheduler bug
Date: Wed, 12 Sep 2018 16:03:19 -0700 (PDT)
Message-ID: <alpine.DEB.2.10.1809121559330.4255@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="8323329-27116412-1536793175=:4255"
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=2zmt=l2=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1g0EAM-0004lv-83
 for xen-devel@lists.xenproject.org; Wed, 12 Sep 2018 23:03:22 +0000
Content-ID: <alpine.DEB.2.10.1809121559400.4255@sstabellini-ThinkPad-X260>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: dfaggioli@suse.com
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, milanboberic94@gmail.com
List-Id: xen-devel@lists.xenproject.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-27116412-1536793175=:4255
Content-Type: TEXT/PLAIN; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.10.1809121559401.4255@sstabellini-ThinkPad-X260>

Hi Dario,

Milan has just found a bug in the null scheduler: apparently it is not
possible to start a VM again after it has been destroyed.

My initial suspicion was that the VM wasn't properly destroyed, but I
asked Milan to double check with xl list, and the VM doesn't show in the
list anymore.

Any ideas?

Cheers,

Stefano

On Wed, 12 Sep 2018, Milan Boberic wrote:
> I double checked it, when I remove sched=null and vwfi=native I can create and destroy bare-metal application as many times as I
> want. 
> When I include sched=null and vwfi=native I can create it once and when I destroy it I can't create it again, again the same
> error.
>
> root@uz3eg-iocc-2018-2:~# xl create bm1.cfg
> Parsing config from bm1.cfg
> (XEN) IRQ 48 is already used by domain 1
> libxl: error: libxl_create.c:1278:domcreate_launch_dm: Domain 2:failed give domain access to irq 48: Device or resource busy
> libxl: error: libxl_domain.c:1003:libxl__destroy_domid: Domain 2:Non-existant domain
> libxl: error: libxl_domain.c:962:domain_destroy_callback: Domain 2:Unable to destroy guest
> libxl: error: libxl_domain.c:889:domain_destroy_cb: Domain 2:Destruction of domain failed
--8323329-27116412-1536793175=:4255
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-27116412-1536793175=:4255--
