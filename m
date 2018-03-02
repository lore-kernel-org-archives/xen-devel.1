From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v3 6/6] xen/arm: disable CPUs with different
 cacheline sizes
Date: Fri, 2 Mar 2018 10:35:45 -0800 (PST)
Message-ID: <alpine.DEB.2.10.1803021034250.4239@sstabellini-ThinkPad-X260>
References: <alpine.DEB.2.10.1803011524530.4239@sstabellini-ThinkPad-X260>
 <1519946795-7191-1-git-send-email-sstabellini@kernel.org>
 <1519946795-7191-6-git-send-email-sstabellini@kernel.org>
 <eefdee3b-9a35-d758-51ce-bdb15a287dbc@arm.com>
 <alpine.DEB.2.10.1803021025000.4239@sstabellini-ThinkPad-X260>
 <12674c97-344c-261a-fae6-0b755cc6acfa@citrix.com>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="8323329-1516584438-1520015746=:4239"
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <12674c97-344c-261a-fae6-0b755cc6acfa@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1516584438-1520015746=:4239
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Fri, 2 Mar 2018, Andrew Cooper wrote:
> On 02/03/18 18:26, Stefano Stabellini wrote:
> >
> >>> Suggested-by: Julien Grall <julien.grall@arm.com>
> >>> Signed-off-by: Stefano Stabellini <sstabellini@kernel.org>
> >>>
> >>> ---
> >>> Changes in v3:
> >>> - new patch
> >>>
> >>> ---
> >>> Interestingly I couldn't find a better way in C89 to printk a size_t
> >>> than casting it to unsigned long.
> >> You can use %zu.
> > It's C99 only :-(
> 
> Sorry for the interjection, but what has C89 got to do with anything? 
> Xen uses -std=gnu99, as per the root Config.mk file.

I remember our discussions about C standard versions, but I take that
they only affected public headers then (unless I am misremembering).
Good!
--8323329-1516584438-1520015746=:4239
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-1516584438-1520015746=:4239--
