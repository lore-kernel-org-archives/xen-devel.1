From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [RFC PATCH 0/4] Add missing default labels to
 switch statements
Date: Fri, 22 Feb 2019 14:38:42 -0800 (PST)
Message-ID: <alpine.DEB.2.10.1902221436200.30151@sstabellini-ThinkPad-X260>
References: <20190222095721.24764-1-andr2000@gmail.com>
 <6e297f93-0c34-18df-63bb-6ef77b0615f3@citrix.com>
 <a30ca582-0993-9652-112e-467f49605405@arm.com>
 <f3438c56-1e7c-88fa-fb0e-b770eccf6d88@gmail.com>
 <bbc8f1bc-c8dd-6784-fbe4-0667127d37af@arm.com>
 <63101f28-a1ad-bffd-158a-c7e1380f6e18@gmail.com>
 <547c3711-02a3-9071-5bb1-494ca45eb4a6@arm.com>
 <alpine.DEB.2.10.1902221253050.30151@sstabellini-ThinkPad-X260>
 <b405a7ae-174f-c8d9-41cc-ec511fb69c77@citrix.com>
 <alpine.DEB.2.10.1902221351310.30151@sstabellini-ThinkPad-X260>
 <2e9ced0f-398f-e8c2-d465-195f565c7ff0@arm.com>
 <2ca21664-20ff-4b5f-0fde-5bf20ca50374@citrix.com>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="8323329-1910572976-1550875124=:30151"
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=O0ff=Q5=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1gxJTP-0000BL-DR
 for xen-devel@lists.xenproject.org; Fri, 22 Feb 2019 22:39:15 +0000
In-Reply-To: <2ca21664-20ff-4b5f-0fde-5bf20ca50374@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: "Artem_Mygaiev@epam.com" <Artem_Mygaiev@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, "Andrii_Anisov@epam.com" <Andrii_Anisov@epam.com>, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, Oleksandr Andrushchenko <andr2000@gmail.com>, Julien Grall <Julien.Grall@arm.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, nd <nd@arm.com>
List-Id: xen-devel@lists.xenproject.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1910572976-1550875124=:30151
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Fri, 22 Feb 2019, Andrew Cooper wrote:
> On 22/02/2019 22:11, Julien Grall wrote:
> > Hi Stefano,
> >
> > On 22/02/2019 21:58, Stefano Stabellini wrote:
> >> On Fri, 22 Feb 2019, Andrew Cooper wrote:
> >>> On 22/02/2019 21:00, Stefano Stabellini wrote:
> >>>> On Fri, 22 Feb 2019, Julien Grall wrote:
> >>>>>>>> BTW, I checked the series with -Wswitch-default:
> >>>>>>>> -Wswitch-default
> >>>>>>>> Warn whenever a switch statement does not have a default case.
> >>>>>>>>> Furthermore, using BUG() is a pretty bad idea in switch.
> >>>>>>>> It is and not only in the switch. The reason I put BUG is that I tried
> >>>>>>>> to follow
> >>>>>>>> the existing "error handling" at those places.
> >>>>>>> It is not because BUG() is been used today in some places that we need to
> >>>>>>> continue to spread it.
> >>>>>>>
> >>>>>>>> Use of BUG() itself is another topic which will also need to be
> >>>>>>>> addressed
> >>>>>>> So we should not add more of them...
> >>>>>> Again, I see this as a dedicated change. So, in the current series I think
> >>>>>> it is
> >>>>>> acceptable to use the existing way of error handling if any at all.
> >>>>> That's not how it works in upstream. If you know some constructs are wrong, it
> >>>>> is best to try to address partially the problem directly then having so you
> >>>>> reduce the amounts of change afterwards.
> >>>>>
> >>>>> So please try to not introduce more BUG() in the code base.
> >>>> Hi Oleksandr, Julien,
> >>>>
> >>>> Julien's right that we should not introduce any more BUG()s. In fact,
> >>>> each of them makes the code less safe, not more safe! The purpose of
> >>>> MISRAC 16.4 is "defensive programming": write the code in a way that is
> >>>> more (not less!) resilient to failure.
> >>>>
> >>>> So, I think it is a good idea to introduce a default label because it
> >>>> can help us spot unexpected issues. Instead of calling BUG() in the
> >>>> default handler, which is detrimental, we should return an error when
> >>>> possible, or just print a warning.
> >>> domain_crash() is almost always better than BUG().  It is very obvious
> >>> if it gets hit, and wont crash Xen.
> >> That's a good suggestion.
> >>
> >>
> >>>> As 16.4 clearly state, even a simple comment would be enough to address
> >>>> the rule. We just need to explain why a default label is not needed.
> >>>> Such as:
> >>>>
> >>>>    default:
> >>>>    /* unreachable because blah and blah */
> >>> What a simple comment doesn't do is avoid breaking -Wswitch.
> >> I don't know how to reconcile 16.4 with -Wswitch. One could argue that
> >> -Wswitch could be a good way to address 16.4, but then we introduce a
> >> compiler specific requirement. Typically gcc is not the compiler of
> >> choice for these environments, unfortunately forcing gcc is not an
> >> option.
> > Well, you could build with GCC and then build with your custom 
> > compiler... But, GCC is pretty much the only choice for Xen on Arm today 
> > as we don't build with clang and I pretty doubt we can build with compcert.
> 
> So the suggestion I had was to have an overall CONFIG_MISRA which we can
> hide some of this nonsense behind, and then
> 
> #ifdef CONFIG_MISRA
> #define MISRA_BLE_DEFAULT default:
> #else
> #define MISRA_BLE_DEFAULT
> #endif
> 
> So when you disable CONFIG_MISRA, your compiler starts being able to
> help you again.

This is actually a good way to make progress which could make everybody
happy. (And it wouldn't require a slow back-and-forth with third parties
to ask difficult questions.)


> TBH, it would also be nice to hide the SYMBOL nonsense behind, so we can
> continue doing it the efficient way for ~100% of the time.

--8323329-1910572976-1550875124=:30151
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-1910572976-1550875124=:30151--
