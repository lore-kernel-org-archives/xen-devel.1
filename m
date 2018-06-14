From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v6 11/13] xen: support the Null scheduler
Date: Thu, 14 Jun 2018 13:20:02 -0700 (PDT)
Message-ID: <alpine.DEB.2.10.1806141318080.14695@sstabellini-ThinkPad-X260>
References: <alpine.DEB.2.10.1806131409300.14695@sstabellini-ThinkPad-X260>
 <1528924492-6579-11-git-send-email-sstabellini@kernel.org>
 <5B22706A02000078001CB4C2@prv1-mh.provo.novell.com>
 <3881fbda-d34b-caf2-23d7-5f6e0a956748@citrix.com>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="8323329-1990844677-1529007602=:14695"
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <3881fbda-d34b-caf2-23d7-5f6e0a956748@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Artem Mygaiev <artem_mygaiev@epam.com>, Lars Kurth <lars.kurth@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, "andrii_anisov@epam.com" <andrii_anisov@epam.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, xen-devel@lists.xen.org, Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>, Dario Faggioli <dfaggioli@suse.com>
List-Id: xen-devel@lists.xenproject.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1990844677-1529007602=:14695
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 14 Jun 2018, Andrew Cooper wrote:
> On 14/06/18 14:40, Jan Beulich wrote:
> >>>> On 13.06.18 at 23:14, <sstabellini@kernel.org> wrote:
> >> The Null scheduler has been in the tree long enough to be marked
> >> supported.
> > Wasn't there at least one problem pointed out with it that last time
> > is was proposed to mark it supported (not overly long ago)?
> 
> The PV-shim work has identified that there are definitely functional
> problems with the Null scheduler.  ISTR that after a while, vcpus just
> ceased to be scheduled.
> 
> I don't think its reasonable to alter the support status with this issue
> outstanding.

I completely missed this report, probably because I haven't paid
attention to PV-shim. Do you have any more information about this? The
report is a bit vague. If I can't repro it, I can't fix it.

Couldn't it be that is normal because after a while you ran out of
pcpus?

Dario, do you have any opinion on this?
--8323329-1990844677-1529007602=:14695
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-1990844677-1529007602=:14695--
