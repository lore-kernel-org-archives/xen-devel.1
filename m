From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: Enhancing Xen's Kconfig infrastructure to support
 tailored solutions
Date: Fri, 15 Feb 2019 09:36:20 -0800 (PST)
Message-ID: <alpine.DEB.2.10.1902150933330.5641@sstabellini-ThinkPad-X260>
References: <a49643ec-6bbe-04be-1ae2-b1d731da92cf@gmail.com>
 <20190213182544.2tguperv3yliejch@zion.uk.xensource.com>
 <alpine.DEB.2.10.1902131110270.5641@sstabellini-ThinkPad-X260>
 <A2C0B65C-32D0-4243-8A14-73B8331AC386@citrix.com>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="8323329-1137491989-1550252064=:5641"
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <A2C0B65C-32D0-4243-8A14-73B8331AC386@citrix.com>
Content-ID: <alpine.DEB.2.10.1902150934350.5641@sstabellini-ThinkPad-X260>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <George.Dunlap@citrix.com>
Cc: James McKenzie <james.mckenzie@bromium.com>, =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, "Suthikulpanit,
 Suravee" <Suravee.Suthikulpanit@amd.com>, "Daniel P. Smith" <dpsmith@apertussolutions.com>, "robin.randhawa@arm.com" <robin.randhawa@arm.com>, Doug Goldstein <cardoe@cardoe.com>, Christopher Clark <christopher.w.clark@gmail.com>, Xen-devel <xen-devel@lists.xen.org>, "Daniel P. Smith" <dpsmith.dev@gmail.com>, Lars Kurth <lars.kurth.xen@gmail.com>, Paul Durrant <Paul.Durrant@citrix.com>, "committers@xenproject.org" <committers@xenproject.org>, Jun Nakajima <jun.nakajima@intel.com>, Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>
List-Id: xen-devel@lists.xenproject.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1137491989-1550252064=:5641
Content-Type: TEXT/PLAIN; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.10.1902150934351.5641@sstabellini-ThinkPad-X260>

On Fri, 15 Feb 2019, George Dunlap wrote:
> > On Feb 13, 2019, at 7:11 PM, Stefano Stabellini <sstabellini@kernel.org> wrote:
> > 
> > On Wed, 13 Feb 2019, Wei Liu wrote:
> >> On Tue, Feb 12, 2019 at 09:34:25PM -0500, Daniel P. Smith wrote:
> >>> Greetings,
> >>> 
> >>> On the 11/14/18 Xen x86 community call a discussion was initiated about
> >>> using Kconfig to build minimized versions of Xen for security, safety
> >>> and other certification requirements. After some offline discussions
> >>> with Xen contributors I realized that a variety of efforts each with
> >>> their own respective goals are underway,
> >>> 
> >>> - nested virtualization
> >>> - mixed criticality architectures
> >>> - reducing trusted componentary
> >>> - combining hardware protection of virtualization with performance and
> >>> ease-of-use of containers
> >>> 
> >>> These efforts use hypervisors in different roles, all which Xen is
> >>> capable of meeting. Today Xen's utility comes at the expense of carrying
> >>> features necessary for one role to be present in another role where it
> >>> is not required, e.g. PV interfaces that may not be essential in an ARM
> >>> mixed criticality deployment.
> >>> 
> >>> The initial focus will be to explore and document the range of possible
> >>> use cases that are of interest to the Xen community. This will be the
> >>> input to a design document that is crafted in conjunction with the Xen
> >>> maintainers, to identify possible approaches to extend the existing
> >>> Kconfig infrastructure to produce tailored instances of Xen.
> >>> 
> >>> If you are interested in participating in this effort, please reply to
> >>> this thread to outline possible use cases, design constraints and other
> >>> considerations for improving Xen's Kconfig infrastructure to support
> >>> tailoring for specific use cases.
> >>> 
> >> 
> >> My impression from the community call is that you want to provide
> >> smallish configurations for different use cases.
> >> 
> >> The Kconfig infrastructure is already able to do what you want as far as
> >> I can tell.  You can easily feed it a base config file -- see files
> >> under automation/configs/x86/.  What sort of extension is needed in your
> >> opinion?
> >> 
> >> As use case goes, it would be a good start if you just submit something
> >> you care about.
> > 
> > I mentioned on the call that a good first start could be a kconfig that
> > allows to build an hypervisor binary with only support for PVH and only
> > support for recent Intel machines, with the goal of minimizing the code
> > base to less than 100K LOC.
> 
> I think one thing that might be helpful is a sort of “feature document” for each defconfig we’re looking at creating.  This would include:
> 
> * What the “target use case” for each defconfig would be
> * The end goal in terms of functionality / LoC / whatever
> * The current state, work items yet to do
> * What potential variations there are (i.e., how to enable shadow if you want, or switch from Intel-only to AMD-only)
> 
> I’ve sort of been using docs/design/qemu-deprivilege.md in this way: Saying where we want to go, and moving things from “to do” to “done” as they get implemented.  That would make it easier to have in-progress things in the tree, make it easier for people to collaborate / enhance defconfigs, and also be a starting point for talking about testing and support status.

+1

Just to set the expectations right on this thread: I am just trying to
provide feedback from the field, things I know are important to the Xen
on x86 embedded user community. I am not going to take this on as a work
item.  But somebody else might? Daniel Smith, I am looking at you :-)
--8323329-1137491989-1550252064=:5641
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-1137491989-1550252064=:5641--
