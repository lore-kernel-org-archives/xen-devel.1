From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: Excited for Xen Project in Outreachy
Date: Wed, 14 Feb 2018 14:45:21 -0800 (PST)
Message-ID: <alpine.DEB.2.10.1802141036260.5392@sstabellini-ThinkPad-X260>
References: <4C7AE15B-6A38-4D0B-8E31-2A13DAD04D71@citrix.com>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="8323329-1902870266-1518633483=:5392"
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=gnfp=fi=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1em5np-00065f-TT
 for xen-devel@lists.xenproject.org; Wed, 14 Feb 2018 22:45:25 +0000
In-Reply-To: <4C7AE15B-6A38-4D0B-8E31-2A13DAD04D71@citrix.com>
Content-ID: <alpine.DEB.2.10.1802141442320.5392@sstabellini-ThinkPad-X260>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Lars Kurth <lars.kurth@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, KANIKA SAINI <kanika16047@iiitd.ac.in>, "minios-devel@lists.xenproject.org" <minios-devel@lists.xenproject.org>, xen-devel <xen-devel@lists.xenproject.org>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Simon Kuenzer <simon.kuenzer@neclab.eu>
List-Id: xen-devel@lists.xenproject.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1902870266-1518633483=:5392
Content-Type: TEXT/PLAIN; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.10.1802141442321.5392@sstabellini-ThinkPad-X260>

Hello Kanika,

Thanks for your interest in Xen Project!
One reply inline below.

On Wed, 14 Feb 2018, Lars Kurth wrote:
> Hi Kanika,
> 
> I CC'ed two lists and the mentors of projects. Thank you for your interest in the project.
> 
> > I seek guidance in choosing the suitable sub-project in Xen according to my skill set.
> We have two sets of projects on https://www.outreachy.org/communities/cfp/xen-project/
> * 3 around Unikraft (mentor: Simon the technical side, I on the process/people side). We are both based in UTC+1 - IRC is #unikraft
> * 1 for Xen on ARM (mentors: Stefano & Edgar). Stefano is in UTC-8, Edgar is UTC-7 or 6 (can't quite recall) - IRC is #xendevel
> 
> > I wish to begin my contribution as soon as possible. I request you to connect me to the mentors in case IRC is not the best way to get in touch with them.
> Simon is unfortunately not around this week but will be next week.
> Stefano and Edgar, are around I believe
> 
> For practical reasons:
> * Please sign up to the minios-devel@lists.xenproject.org or xen-devel@lists.xenproject.org (as appropriate)
>    (see http://lists.xenproject.org for instructions: if you use the "subscribe subject pattern" make sure you send the mail to minios-devel-request@lists.xenproject.org, ...) 
> * Please double check time requirements: This is because in the past there frequently were issues with Outreachy and University course time requirements in particular with Universities from India. I believe that there will be extra checks later in the application process, which may require letters from your University. We had one case, where an applicant did a small project, but we were not allowed to accept her due to time requirements.
> * Let us know timezone you are in and when you can hang out on IRC 
> * Your registered IRC nickname (please register your nick - see https://www.xenproject.org/help/irc.html under Netiquette)
> 
> Note that my IRC nick is lars_kurth, Simon's is skuezer, Stefano's is sstabellini, and I am afraid I can't remember Edgar's
> 
> If you are interested in Unikraft
> * Build the hello world unikraft app: see https://wiki.xenproject.org/wiki/Category:Unikraft & http://unikraft.neclab.eu/ and report back
> * Familiarize yourself with the workflow at https://wiki.xenproject.org/wiki/Submitting_Xen_Project_Patches#How_to_Generate.2C_and_Submit_a_Xen_Project_Patch_to_MiniOS_and_Unikraft (please read the entire document) 
> 
> For the ARM project, I will let Stefano and Edgar decide.

For the ARM project, it would be good to get familiar with Xen on ARM,
to learn how to build it:

https://wiki.xenproject.org/wiki/Xen_ARM_with_Virtualization_Extensions#Building_Xen_on_ARM

and use QEMU to emulate an ARM board to run Xen on it, for testing and
development:

https://wiki.xenproject.org/wiki/Xen_ARM_with_Virtualization_Extensions/qemu-system-aarch64

Feel free to ask any questions!


> Regards
> Lars
> 
> 
> From: KANIKA SAINI <kanika16047@iiitd.ac.in>
> Date: Wednesday, 14 February 2018 at 17:25
> To: Lars Kurth <lars.kurth@citrix.com>
> Subject: Excited for Xen Project in Outreachy
> 
> Greetings, Lars.
> 
> I'm Kanika Saini and I'm super excited to begin contributing to Xen!
> 
> I seek guidance in choosing the suitable sub-project in Xen according to my skill set. I'm currently pursuing a course in Operating Systems and hence, have been gaining knowledge in kernel programming by short assignments like the implementation of a system call. I'm familiar with assembly programming in MIPS, ARM and x86 as well. 
> About high-level programming - I have experience with Java and have used it for desktop applications and parallel programming.
> 
> There are certain projects listed on the project page and I'm looking for mentors' suggestion on what could be the best for both me and Xen. I have introduced myself on the #unikraft channel and I'm expecting a reply from the community.
> 
> I wish to begin my contribution as soon as possible. I request you to connect me to the mentors in case IRC is not the best way to get in touch with them.
> 
> Thank you!
> 
> 
> -- 
> Yours sincerely,
> Kanika Saini
> CSE, IIITD Class of 2020
> 
> 
> 
> ‌
> 
> 
--8323329-1902870266-1518633483=:5392
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-1902870266-1518633483=:5392--
