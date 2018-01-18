From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: XSA-254 SP2 for ARM (was Re: [PATCH 1/5] xen/arm:
 Introduce enable callback to enable a capabilities on each online CPU)
Date: Thu, 18 Jan 2018 12:28:50 -0800 (PST)
Message-ID: <alpine.DEB.2.10.1801181223270.6440@sstabellini-ThinkPad-X260>
References: <20180116142337.24942-1-julien.grall@linaro.org>
 <20180116142337.24942-2-julien.grall@linaro.org>
 <alpine.DEB.2.10.1801161554390.6440@sstabellini-ThinkPad-X260>
 <3f287ea5-f122-b375-4d98-e33733516816@linaro.org>
 <7F2FA84A-2CBA-45EC-9073-7FC86205BE5A@gmail.com>
 <fbca8a32-b800-dfdc-d3cf-27740d98c9cf@linaro.org>
 <D1C765BC-DE91-439E-B7DE-27EEA33EBD12@gmail.com>
 <alpine.DEB.2.10.1801170914190.6440@sstabellini-ThinkPad-X260>
 <alpine.DEB.2.10.1801171341370.6440@sstabellini-ThinkPad-X260>
 <282e06f6-4c31-9062-05c8-13c084218302@linaro.org>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="8323329-667113087-1516307267=:6440"
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <282e06f6-4c31-9062-05c8-13c084218302@linaro.org>
Content-ID: <alpine.DEB.2.10.1801181228060.6440@sstabellini-ThinkPad-X260>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@linaro.org>
Cc: Lars Kurth <lars.kurth.xen@gmail.com>, Stefano Stabellini <sstabellini@kernel.org>, "security@xenproject.org" <security@xenproject.org>, andre.przywara@linaro.org, xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-667113087-1516307267=:6440
Content-Type: TEXT/PLAIN; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.10.1801181228061.6440@sstabellini-ThinkPad-X260>

On Thu, 18 Jan 2018, Julien Grall wrote:
> (+ Security team)
> 
> Hi Stefano,
> 
> On 17/01/18 21:47, Stefano Stabellini wrote:
> > On Wed, 17 Jan 2018, Stefano Stabellini wrote:
> > > On Wed, 17 Jan 2018, Lars Kurth wrote:
> > > >        Regarding README.source, this is covering file and contain the
> > > > same mention as in the commit message. As this is a single function.
> > > > Isn't the commit message
> > > >        enough?
> > > > 
> > > > 
> > > >  From a legal viewpoint it is enough.
> > > 
> > > If that is enough from a legal viewpoint, then it is enough for me.
> > > 
> > > However, from a legal viewpoint, I thought we needed to explicitly
> > > mention all the original signed-off-bys because Julien is not actually
> > > the copyright holder for that function, hence, we need to add the
> > > signed-off-bys of all the missing copyright holders.
> > 
> > Actually, reading again the Developer’s Certificate of Origin, it
> > states:
> > 
> > "The contribution is based upon previous work that, to the best of my
> > knowledge, is covered under an appropriate open source license and I have
> > the right under that license to submit that work with modifications, whether
> > created in whole or in part by me, under the same open source license
> > (unless I am permitted to submit under a different license), as indicated in
> > the file"
> > 
> > so I think Lars is right. In that case, there is no need to resubmit
> > this series, I'll commit to staging as is. If tests go well, I'll
> > backport it to the stable trees.
> Thank you! I have created branches with patches backported up to Xen 4.8. With
> minor changes:
> 
>    - Xen 4.10: No changes
>    - Xen 4.9:
> 	* minor conflict in some files
> 	* compilation failure in cpuerrata.c (__virt_to_mfn does not exist)
>    - Xen 4.8:
> 	* conflict in some files (one medium as the number of "features" is
> different)
> 	* compilation failure in cpuerrata.c (__virt_to_mfn does not exist)
> 	
> The branches can be found on xenbits [1] : xsa-254-sp2-X.XX where X.XX is the
> version of Xen.
> 
> Xen 4.7 and earlier does not have cpufeature/cpuerrata infrastructure and will
> require backport. The only difficulty here should be finding the list of
> commits required.
> 
> Also, we probably want to update the XSA pointing to the patches. So if
> someone wants to backport to Xen 4.7 (or earlier) they can. Any opinions?

Thank you, Julien. Ideally, I would like to do the backports after
OSSTest passes its tests on those changes. In practice, for the sake of
mitigating SP2 as soon as possible, tomorrow (Friday) I might do the
backports anyway, if OSSTest is still behind on other problems.

I don't think that backporting cpufeature/cpuerrata to 4.7 should be too
convoluted, I'll give that a go as well.

Once done, I'll provide the list of commits to the xen security list so
that the XSA advisory can be updated appropriately.

Cheers,

Stefano


> Cheers,
> 
> [1] https://xenbits.xen.org/git-http/people/julieng/xen-unstable.git
--8323329-667113087-1516307267=:6440
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-667113087-1516307267=:6440--
