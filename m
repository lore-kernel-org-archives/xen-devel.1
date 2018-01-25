From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: XSA-254 SP2 for ARM (was Re: [PATCH 1/5] xen/arm:
 Introduce enable callback to enable a capabilities on each online CPU)
Date: Thu, 25 Jan 2018 09:23:36 -0800 (PST)
Message-ID: <alpine.DEB.2.10.1801250922350.11958@sstabellini-ThinkPad-X260>
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
 <alpine.DEB.2.10.1801241410580.6440@sstabellini-ThinkPad-X260>
 <CAEC2CxpHiEu1fdriiV-gJj=rS+cOp3WHRCwHhsGUGSFShsSiNw@mail.gmail.com>
 <alpine.DEB.2.10.1801241441010.6440@sstabellini-ThinkPad-X260>
 <38c67391-50e2-44c5-a4ae-f43e68993879@linaro.org>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="8323329-1180053735-1516901017=:11958"
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <38c67391-50e2-44c5-a4ae-f43e68993879@linaro.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@linaro.org>
Cc: Lars Kurth <lars.kurth.xen@gmail.com>, Stefano Stabellini <sstabellini@kernel.org>, "security@xenproject.org" <security@xenproject.org>, Andre Przywara <andre.przywara@linaro.org>, xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1180053735-1516901017=:11958
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 25 Jan 2018, Julien Grall wrote:
> Hi,
> 
> On 24/01/18 22:43, Stefano Stabellini wrote:
> > On Wed, 24 Jan 2018, Julien Grall wrote:
> > > Hi Stefano,
> > > 
> > > On 24 January 2018 at 22:14, Stefano Stabellini <sstabellini@kernel.org>
> > > wrote:
> > > > On Thu, 18 Jan 2018, Julien Grall wrote:
> > > > > (+ Security team)
> > > > > 
> > > > > Hi Stefano,
> > > > > 
> > > > > On 17/01/18 21:47, Stefano Stabellini wrote:
> > > > > > On Wed, 17 Jan 2018, Stefano Stabellini wrote:
> > > > > > > On Wed, 17 Jan 2018, Lars Kurth wrote:
> > > > > > > >         Regarding README.source, this is covering file and
> > > > > > > > contain the
> > > > > > > > same mention as in the commit message. As this is a single
> > > > > > > > function.
> > > > > > > > Isn't the commit message
> > > > > > > >         enough?
> > > > > > > > 
> > > > > > > > 
> > > > > > > >   From a legal viewpoint it is enough.
> > > > > > > 
> > > > > > > If that is enough from a legal viewpoint, then it is enough for
> > > > > > > me.
> > > > > > > 
> > > > > > > However, from a legal viewpoint, I thought we needed to explicitly
> > > > > > > mention all the original signed-off-bys because Julien is not
> > > > > > > actually
> > > > > > > the copyright holder for that function, hence, we need to add the
> > > > > > > signed-off-bys of all the missing copyright holders.
> > > > > > 
> > > > > > Actually, reading again the Developer’s Certificate of Origin, it
> > > > > > states:
> > > > > > 
> > > > > > "The contribution is based upon previous work that, to the best of
> > > > > > my
> > > > > > knowledge, is covered under an appropriate open source license and I
> > > > > > have
> > > > > > the right under that license to submit that work with modifications,
> > > > > > whether
> > > > > > created in whole or in part by me, under the same open source
> > > > > > license
> > > > > > (unless I am permitted to submit under a different license), as
> > > > > > indicated in
> > > > > > the file"
> > > > > > 
> > > > > > so I think Lars is right. In that case, there is no need to resubmit
> > > > > > this series, I'll commit to staging as is. If tests go well, I'll
> > > > > > backport it to the stable trees.
> > > > > Thank you! I have created branches with patches backported up to Xen
> > > > > 4.8. With
> > > > > minor changes:
> > > > > 
> > > > >     - Xen 4.10: No changes
> > > > >     - Xen 4.9:
> > > > >        * minor conflict in some files
> > > > >        * compilation failure in cpuerrata.c (__virt_to_mfn does not
> > > > > exist)
> > > > >     - Xen 4.8:
> > > > >        * conflict in some files (one medium as the number of
> > > > > "features" is
> > > > > different)
> > > > >        * compilation failure in cpuerrata.c (__virt_to_mfn does not
> > > > > exist)
> > > > > 
> > > > > The branches can be found on xenbits [1] : xsa-254-sp2-X.XX where X.XX
> > > > > is the
> > > > > version of Xen.
> > > > > 
> > > > > Xen 4.7 and earlier does not have cpufeature/cpuerrata infrastructure
> > > > > and will
> > > > > require backport. The only difficulty here should be finding the list
> > > > > of
> > > > > commits required.
> > > > > 
> > > > > Also, we probably want to update the XSA pointing to the patches. So
> > > > > if
> > > > > someone wants to backport to Xen 4.7 (or earlier) they can. Any
> > > > > opinions?
> > > > 
> > > > These are the commits for the XSA 254 mitigation for the arm64
> > > > architecture:
> > > > 
> > > > staging-4.10
> > > > b829d42829c1ff626a02756acae4dd482fc20c9a
> > > > 0f7a4faafb2d79920cc63457cfca3e03990af4cc
> > > > d1f4283a1d8405a480b4121e1efcfaec8bbdbffa
> > > > cae6e1572f39a1906be0fc3bdaf49fe514c6a9c0
> > > > 928112900e5b4a92ccebb2eea11665fd76aa0f0d
> > > > 728fadb586a2a14a244dabd70463bcc1654ecc85
> > > > 
> > > > staging-4.9
> > > > 2ec7ccbffc6b788f65e55498e4347c1ee3a44b01
> > > > 50450c1f33dc72f2138a671d738934f796be3318
> > > > 3790833ef16b95653424ec9b145e460ec1a56d16
> > > > fba48eff18c02d716c95b92df804a755620be82e
> > > > 9f79e8d846e8413c828f5fc7cc6ac733728dff00
> > > > a2567d6b54b7b187ecc0165021b6dd07dafaf06a
> > > > 
> > > > staging-4.8
> > > > 946dd2eefae2faeecbeb9662e66935c8070f64f5
> > > > 85990bf53addcdb0ce8e458a3d8fad199710ac59
> > > > cf0b584c8c5030588bc47a3614ad860af7482c53
> > > > 44139fed7c794eb4e47a9bb93061e325bd57fe8c
> > > > 6f6786ef0d7f7025860d360f6b1267193ffd1b27
> > > 
> > > Something looks quite odd. The commit message have two cherry-pick commit
> > > ID.
> > > 
> > > Why didn't you just merged the branches I provided?
> > 
> > Basically I did the backports on my own, then I double-checked that they
> > matched your own version of the backports. I did it for safety: this way
> > we can be quite sure that the backports are good, or both of us did
> > exactly the same mistakes :-)
> > It was very helpful to have branches to compare against, thank you for
> > that.
> 
> I also double checked it yesterday because I wasn't sure what you did :).
> 
> > 
> > 
> > > > 
> > > > For staging-4.7, I made the backports and tested them as well. They look
> > > > correct. However, given that it was more complex than initially though,
> > > > I would appreciate if you could give it a look as well (I haven't pushed
> > > > it staging-4.7 yet):
> > > > 
> > > >    git://xenbits.xen.org/people/sstabellini/xen-unstable.git
> > > > staging-4.7-xsa254
> > > 
> > > I will have a look.
> > 
> > Thanks again!
> 
> This looks good to me. Thank you for backporting them to 4.7.

Thank you! I pushed the branch, these are the relevant commits for 4.7:

fd884d6 xen/arm64: Implement branch predictor hardening for affected Cortex-A CPUs
50c68df xen/arm64: Add skeleton to harden the branch predictor aliasing attacks
1bdcc9f xen/arm: cpuerrata: Add MIDR_ALL_VERSIONS
2914ef5 xen/arm64: Add missing MIDR values for Cortex-A72, A73 and A75
62b9706 xen/arm: Introduce enable callback to enable a capabilities on each online CPU
624abdc xen/arm: Detect silicon revision and set cap bits accordingly
d7b73ed xen/arm: cpufeature: Provide an helper to check if a capability is supported
112c49c xen/arm: Add cpu_hwcap bitmap
a5b0fa4 xen/arm: Add macros to handle the MIDR
--8323329-1180053735-1516901017=:11958
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-1180053735-1516901017=:11958--
