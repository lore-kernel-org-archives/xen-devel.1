From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 04/13] xen/arm: Add ARCH_WORKAROUND_2 probing
Date: Tue, 29 May 2018 14:35:26 -0700 (PDT)
Message-ID: <alpine.DEB.2.10.1805291430490.5563@sstabellini-ThinkPad-X260>
References: <20180522174254.27551-1-julien.grall@arm.com>
 <20180522174254.27551-5-julien.grall@arm.com>
 <alpine.DEB.2.10.1805231437100.15101@sstabellini-ThinkPad-X260>
 <8c536000-45a9-cb84-8410-6998971bdddf@arm.com>
 <alpine.DEB.2.10.1805251222130.12008@sstabellini-ThinkPad-X260>
 <68d78c21-0404-ec12-e08c-c379db27daf5@citrix.com>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="8323329-54272694-1527629727=:5563"
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=g2yr=iq=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1fNmHB-0006L9-PX
 for xen-devel@lists.xenproject.org; Tue, 29 May 2018 21:35:29 +0000
In-Reply-To: <68d78c21-0404-ec12-e08c-c379db27daf5@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, andre.przywara@arm.com
List-Id: xen-devel@lists.xenproject.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-54272694-1527629727=:5563
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Sat, 26 May 2018, Andrew Cooper wrote:
> On 25/05/2018 21:51, Stefano Stabellini wrote:
> > On Wed, 23 May 2018, Julien Grall wrote:
> >> Hi,
> >>
> >> On 05/23/2018 10:57 PM, Stefano Stabellini wrote:
> >>> On Tue, 22 May 2018, Julien Grall wrote:
> >>>> As for Spectre variant-2, we rely on SMCCC 1.1 to provide the discovery
> >>>> mechanism for detecting the SSBD mitigation.
> >>>>
> >>>> A new capability is also allocated for that purpose, and a config
> >>>> option.
> >>>>
> >>>> This is part of XSA-263.
> >>>>
> >>>> Signed-off-by: Julien Grall <julien.grall@arm.com>
> >>>> ---
> >>>>   xen/arch/arm/Kconfig             | 10 ++++++++++
> >>>>   xen/arch/arm/cpuerrata.c         | 39
> >>>> +++++++++++++++++++++++++++++++++++++++
> >>>>   xen/include/asm-arm/cpuerrata.h  | 21 +++++++++++++++++++++
> >>>>   xen/include/asm-arm/cpufeature.h |  3 ++-
> >>>>   xen/include/asm-arm/smccc.h      |  6 ++++++
> >>>>   5 files changed, 78 insertions(+), 1 deletion(-)
> >>>>
> >>>> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> >>>> index 8174c0c635..0e2d027060 100644
> >>>> --- a/xen/arch/arm/Kconfig
> >>>> +++ b/xen/arch/arm/Kconfig
> >>>> @@ -73,6 +73,16 @@ config SBSA_VUART_CONSOLE
> >>>>   	  Allows a guest to use SBSA Generic UART as a console. The
> >>>>   	  SBSA Generic UART implements a subset of ARM PL011 UART.
> >>>>   +config ARM_SSBD
> >>>> +	bool "Speculative Store Bypass Disable" if EXPERT = "y"
> >>>> +	depends on HAS_ALTERNATIVE
> >>>> +	default y
> >>>> +	help
> >>>> +	  This enables mitigation of bypassing of previous stores by
> >>>> speculative
> >>>> +	  loads.
> >>> I would add a reference to spectre v4. What do you think of:
> >>>
> >>>    This enables the mitigation of Spectre v4 attacks based on bypassing
> >>>    of previous memory stores by speculative loads.
> >> Well, the real name is SSBD (Speculative Store Bypass Disable). AFAIK, Spectre
> >> only refers to variant 1 and 2 so far. This one has no fancy name and the
> >> specifications is using SSBD.
> > Googling for Spectre Variant 4 returns twice as many results as Googling
> > for Speculative Store Bypass Disable. It doesn't matter what is the
> > official name for the security issue, I think we need to include a
> > reference to the most common name for it.
> 
> "Speculative Store Bypass" is the agreed vendor-neutral name for the
> issue.  This is why all the mitigation is SSBD, where the D on the end
> is Disable.
> 
> Google SP4 is a common name (but only covers one reporter of the issue),
> whereas Spectre has nothing to do with this issue, and is definitely
> wrong to use.
> 
> If in doubt, use SSB(D).

I think we should definitely call it SSBD, I was just saying that it
might be helpful to include also "Variant 4" in the description, such
as:

 This is also known as Variant 4.

to help users find the right results on Google. Anyway, given that you
are certainly better informed than me about it, I won't insist on this
point, I am OK without mentioning "Variant 4".
--8323329-54272694-1527629727=:5563
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-54272694-1527629727=:5563--
