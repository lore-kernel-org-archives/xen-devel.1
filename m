From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 1/5] xen/arm: Introduce enable callback to
 enable a capabilities on each online CPU
Date: Wed, 17 Jan 2018 13:47:02 -0800 (PST)
Message-ID: <alpine.DEB.2.10.1801171341370.6440@sstabellini-ThinkPad-X260>
References: <20180116142337.24942-1-julien.grall@linaro.org>
 <20180116142337.24942-2-julien.grall@linaro.org>
 <alpine.DEB.2.10.1801161554390.6440@sstabellini-ThinkPad-X260>
 <3f287ea5-f122-b375-4d98-e33733516816@linaro.org>
 <7F2FA84A-2CBA-45EC-9073-7FC86205BE5A@gmail.com>
 <fbca8a32-b800-dfdc-d3cf-27740d98c9cf@linaro.org>
 <D1C765BC-DE91-439E-B7DE-27EEA33EBD12@gmail.com>
 <alpine.DEB.2.10.1801170914190.6440@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="8323329-820927268-1516225349=:6440"
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <alpine.DEB.2.10.1801170914190.6440@sstabellini-ThinkPad-X260>
Content-ID: <alpine.DEB.2.10.1801171346330.6440@sstabellini-ThinkPad-X260>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Lars Kurth <lars.kurth.xen@gmail.com>, Julien Grall <julien.grall@linaro.org>, andre.przywara@linaro.org, xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-820927268-1516225349=:6440
Content-Type: TEXT/PLAIN; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.10.1801171346331.6440@sstabellini-ThinkPad-X260>

On Wed, 17 Jan 2018, Stefano Stabellini wrote:
> On Wed, 17 Jan 2018, Lars Kurth wrote:
> >       Regarding README.source, this is covering file and contain the same mention as in the commit message. As this is a single function. Isn't the commit message
> >       enough?
> > 
> > 
> > From a legal viewpoint it is enough.
> 
> If that is enough from a legal viewpoint, then it is enough for me.
> 
> However, from a legal viewpoint, I thought we needed to explicitly
> mention all the original signed-off-bys because Julien is not actually
> the copyright holder for that function, hence, we need to add the
> signed-off-bys of all the missing copyright holders.

Actually, reading again the Developer’s Certificate of Origin, it
states:

"The contribution is based upon previous work that, to the best of my knowledge, is covered under an appropriate open source license and I have the right under that license to submit that work with modifications, whether created in whole or in part by me, under the same open source license (unless I am permitted to submit under a different license), as indicated in the file"

so I think Lars is right. In that case, there is no need to resubmit
this series, I'll commit to staging as is. If tests go well, I'll
backport it to the stable trees.
--8323329-820927268-1516225349=:6440
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-820927268-1516225349=:6440--
