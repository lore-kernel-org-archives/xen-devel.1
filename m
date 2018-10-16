From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v3 5/6] xen/arm: zynqmp: implement
 zynqmp_eemi
Date: Tue, 16 Oct 2018 14:48:35 +0800 (CST)
Message-ID: <alpine.DEB.2.10.1810161446200.5150@sstabellini-ThinkPad-X260>
References: <alpine.DEB.2.10.1808101435481.32304@sstabellini-ThinkPad-X260>
 <1533945710-15159-5-git-send-email-sstabellini@kernel.org>
 <01aba56f-4a72-a3bf-bb36-f84b7aa37572@arm.com>
 <alpine.DEB.2.10.1810101537540.436@sstabellini-ThinkPad-X260>
 <f75422fb-a620-4471-b653-7b39738fab87@arm.com>
 <08721368-7795-6f3c-8b55-b4d3add8bc08@arm.com>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="8323329-1793510765-1539672532=:5150"
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <08721368-7795-6f3c-8b55-b4d3add8bc08@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: edgar.iglesias@xilinx.com, Stefano Stabellini <stefanos@xilinx.com>, Stefano Stabellini <stefano.stabellini@xilinx.com>, xen-devel@lists.xen.org, Stefano Stabellini <sstabellini@kernel.org>, nd <nd@arm.com>
List-Id: xen-devel@lists.xenproject.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1793510765-1539672532=:5150
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 15 Oct 2018, Julien Grall wrote:
> (Resending the e-mail using a different smtp)
> 
> On 15/10/2018 08:32, Julien Grall wrote:
> > Hi,
> > 
> > On 10/10/2018 11:49 PM, Stefano Stabellini wrote:
> > > On Tue, 28 Aug 2018, Julien Grall wrote:
> > > > Hi Stefano,
> > > > 
> > > > On 11/08/18 01:01, Stefano Stabellini wrote:
> > > > > From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
> > > > > 
> > > > > From: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> > > > > 
> > > > > zynqmp_eemi uses the defined functions and structs to decide whether
> > > > > to
> > > > > make a call to the firmware, or to simply return a predefined value.
> > > > > 
> > > > > Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> > > > > Signed-off-by: Stefano Stabellini <stefanos@xilinx.com>
> > > > > ---
> > > > >    xen/arch/arm/platforms/xilinx-zynqmp-eemi.c | 143
> > > > > +++++++++++++++++++++++++++-
> > > > >    1 file changed, 142 insertions(+), 1 deletion(-)
> > > > > 
> > > > > diff --git a/xen/arch/arm/platforms/xilinx-zynqmp-eemi.c
> > > > > b/xen/arch/arm/platforms/xilinx-zynqmp-eemi.c
> > > > > index 62cc15c..1dbdf04 100644
> > > > > --- a/xen/arch/arm/platforms/xilinx-zynqmp-eemi.c
> > > > > +++ b/xen/arch/arm/platforms/xilinx-zynqmp-eemi.c
> > > > > @@ -808,7 +808,148 @@ static bool domain_has_mmio_access(struct domain
> > > > > *d,
> > > > >      bool zynqmp_eemi(struct cpu_user_regs *regs)
> > > > >    {
> > > > > -    return false;
> > > > > +    struct arm_smccc_res res;
> > > > > +    bool is_mmio_write = false;
> > > > > +    uint32_t fid = get_user_reg(regs, 0);
> > > > > +    uint32_t nodeid = get_user_reg(regs, 1);
> > > > > +    unsigned int pm_fn = fid & 0xFFFF;
> > > > 
> > > > Here you will receive all the function ID for the SIP subsystem. Can you
> > > > confirm the EEMI can be accessed from both SMC32 and SMC64 convention?
> > > 
> > > Yep
> > 
> > Can you point me to the documentation? For instance, CALL_COUNT, UID and
> > VERSION are only accessible via SMC32.

https://www.xilinx.com/support/documentation/user_guides/ug1200-eemi-api.pdf

I am checking if there is a newer version of it.
--8323329-1793510765-1539672532=:5150
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-1793510765-1539672532=:5150--
