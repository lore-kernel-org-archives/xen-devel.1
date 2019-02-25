From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [RFC PATCH 0/4] Add missing default labels to
 switch statements
Date: Mon, 25 Feb 2019 09:38:38 -0800 (PST)
Message-ID: <alpine.DEB.2.10.1902250932170.4000@sstabellini-ThinkPad-X260>
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
 <alpine.DEB.2.10.1902221416190.30151@sstabellini-ThinkPad-X260>
 <c9abf6b0-4875-19ec-e83d-cecbcce7ad2a@arm.com>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="8323329-1251961962-1551116325=:4000"
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rX0y=RA=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1gyKDk-0003wo-HI
 for xen-devel@lists.xenproject.org; Mon, 25 Feb 2019 17:39:16 +0000
In-Reply-To: <c9abf6b0-4875-19ec-e83d-cecbcce7ad2a@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <Julien.Grall@arm.com>
Cc: "Artem_Mygaiev@epam.com" <Artem_Mygaiev@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, "Andrii_Anisov@epam.com" <Andrii_Anisov@epam.com>, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, Oleksandr Andrushchenko <andr2000@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, nd <nd@arm.com>
List-Id: xen-devel@lists.xenproject.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1251961962-1551116325=:4000
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Fri, 22 Feb 2019, Julien Grall wrote:
> On 22/02/2019 22:34, Stefano Stabellini wrote:
> > On Fri, 22 Feb 2019, Julien Grall wrote:
> >> Hi Stefano,
> >>
> >> On 22/02/2019 21:58, Stefano Stabellini wrote:
> >>> On Fri, 22 Feb 2019, Andrew Cooper wrote:
> >>>> On 22/02/2019 21:00, Stefano Stabellini wrote:
> >>>>> On Fri, 22 Feb 2019, Julien Grall wrote:
> >>>>>>>>> BTW, I checked the series with -Wswitch-default:
> >>>>>>>>> -Wswitch-default
> >>>>>>>>> Warn whenever a switch statement does not have a default case.
> >>>>>>>>>> Furthermore, using BUG() is a pretty bad idea in switch.
> >>>>>>>>> It is and not only in the switch. The reason I put BUG is that I tried
> >>>>>>>>> to follow
> >>>>>>>>> the existing "error handling" at those places.
> >>>>>>>> It is not because BUG() is been used today in some places that we need to
> >>>>>>>> continue to spread it.
> >>>>>>>>
> >>>>>>>>> Use of BUG() itself is another topic which will also need to be
> >>>>>>>>> addressed
> >>>>>>>> So we should not add more of them...
> >>>>>>> Again, I see this as a dedicated change. So, in the current series I think
> >>>>>>> it is
> >>>>>>> acceptable to use the existing way of error handling if any at all.
> >>>>>> That's not how it works in upstream. If you know some constructs are wrong, it
> >>>>>> is best to try to address partially the problem directly then having so you
> >>>>>> reduce the amounts of change afterwards.
> >>>>>>
> >>>>>> So please try to not introduce more BUG() in the code base.
> >>>>> Hi Oleksandr, Julien,
> >>>>>
> >>>>> Julien's right that we should not introduce any more BUG()s. In fact,
> >>>>> each of them makes the code less safe, not more safe! The purpose of
> >>>>> MISRAC 16.4 is "defensive programming": write the code in a way that is
> >>>>> more (not less!) resilient to failure.
> >>>>>
> >>>>> So, I think it is a good idea to introduce a default label because it
> >>>>> can help us spot unexpected issues. Instead of calling BUG() in the
> >>>>> default handler, which is detrimental, we should return an error when
> >>>>> possible, or just print a warning.
> >>>>
> >>>> domain_crash() is almost always better than BUG().  It is very obvious
> >>>> if it gets hit, and wont crash Xen.
> >>>
> >>> That's a good suggestion.
> >>>
> >>>
> >>>>> As 16.4 clearly state, even a simple comment would be enough to address
> >>>>> the rule. We just need to explain why a default label is not needed.
> >>>>> Such as:
> >>>>>
> >>>>>     default:
> >>>>>     /* unreachable because blah and blah */
> >>>>
> >>>> What a simple comment doesn't do is avoid breaking -Wswitch.
> >>>
> >>> I don't know how to reconcile 16.4 with -Wswitch. One could argue that
> >>> -Wswitch could be a good way to address 16.4, but then we introduce a
> >>> compiler specific requirement. Typically gcc is not the compiler of
> >>> choice for these environments, unfortunately forcing gcc is not an
> >>> option.
> >>
> >> Well, you could build with GCC and then build with your custom
> >> compiler...
> > 
> > This suggestion is problematic: as an individual interested in MISRA-C
> > compliance, I only have the MISRA-C rules in my hands. I don't know how
> > to deal with suggestions like this one, that don't comply to the Rules,
> > but it tries to address the same issue in a different manner.
> 
> Are you suggesting we will have to abide to all the rules even if they 
> doesn't make things worst? I was under the impression we don't necessary 
> need to follow a rule if we have justification for it.

No, I am not saying we should follow all MISRAC rules to the letter. I
am saying that one thing we need to decide is what to do with "creative
suggestions": if MISRAC tells us to do XXX because of YYY, and a
maintainer suggests to do ZZZ instead, where ZZZ kind goes in the same
direction as XXX but it is not the same.

Neither the contributor nor the maintainer actually know the impact on
safety certification of ZZZ. There is no simple way to address such a
suggestion without involving MISRAC compliance experts, and I don't know
if we want that as a community.


> > I cannot rule out that it wouldn't work, but also I cannot be sure that
> > it would work. In short, I have no way to make progress or to find out
> > how to move forward. I guess as a contributor I would be forced to go
> > back to the MISRAC compliance experts and ask for their opinion. (One
> > non-technical issue is who is going to pay them for spending their time
> > on this.) But what if they say it is not acceptable for compliance?
> > 
> > This is a great topic to discuss in March and decide what to do in these
> > situations.
> > 
> > 
> >> But, GCC is pretty much the only choice for Xen on Arm today
> >> as we don't build with clang and I pretty doubt we can build with compcert.
> > 
> > Obviously, this has to change if we want to make progress on safety
> > certifications.
> 
> I am curious to know what is plan for this. I mean that if no-one is 
> planning to make Xen build with other compilers. Then what would be the 
> benefits of this?

This is a multi-years effort, and making Xen build with other compilers
has to be one of the required work items.
--8323329-1251961962-1551116325=:4000
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-1251961962-1551116325=:4000--
