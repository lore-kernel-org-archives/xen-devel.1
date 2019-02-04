From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v5 00/15] Argo: hypervisor-mediated
 interdomain communication
Date: Mon, 4 Feb 2019 10:22:10 -0800 (PST)
Message-ID: <alpine.DEB.2.10.1902041020360.22962@sstabellini-ThinkPad-X260>
References: <1548064795-18160-1-git-send-email-christopher.w.clark@gmail.com>
 <20190122141702.h3oxvr25xjxbhjcl@mac>
 <CACMJ4Gbr4dR2B7o=+i_0aCEPiXTA9nF-w477Btvv8vd_B2+mOw@mail.gmail.com>
 <20190131133931.vincqqgf4acywekz@mac>
 <CACMJ4GZ+85Hr4x8Ydt9u8zJWQLnGcDCxnWoHw3WQdqOZaZJ0gQ@mail.gmail.com>
 <20190204100712.idxj4xpvifv7yy6f@mac>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="8323329-2005648092-1549304532=:22962"
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JPi9=QL=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1gqiso-0004dC-Ci
 for xen-devel@lists.xenproject.org; Mon, 04 Feb 2019 18:22:14 +0000
In-Reply-To: <20190204100712.idxj4xpvifv7yy6f@mac>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Lars Kurth <lars.kurth@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Ross Philipson <ross.philipson@gmail.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jason Andryuk <jandryuk@gmail.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Christopher Clark <christopher.w.clark@gmail.com>, Rich Persaud <persaur@gmail.com>, Tim Deegan <tim@xen.org>, Daniel Smith <dpsmith@apertussolutions.com>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <jbeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Daniel De Graaf <dgdegra@tycho.nsa.gov>, James McKenzie <james@bromium.com>, Eric Chanudet <eric.chanudet@gmail.com>
List-Id: xen-devel@lists.xenproject.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-2005648092-1549304532=:22962
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 4 Feb 2019, Roger Pau Monné wrote:
> > Yes, v7 was sent to address Jan and Julien's review comments in parallel
> > with our ongoing discussion on v5 macros. v7 also provided a checkpoint
> > for Argo testers to maximize test coverage as the series converges into
> > a Xen 4.12 merge candidate for Juergen. It addressed:
> > 
> >  - Jan's v6 review comments
> >  - Julien's v1 review comment
> >  - most of your xen-devel and offline review comments
> 
> I think it will benefit the community to give this review in public,
> so other reviewers know whats going on. IMO getting this private
> review makes it harder for me (as a reviewer) to know the motivation
> of some of the changes between versions, and likely also makes it
> harder for you since you have to keep track of comments from multiple
> sources on different channels.

There is one more reason to require public comments which I have only
learned recently: for safety certifications we need to keep a record of
all review comments and patches that address them for traceability.
--8323329-2005648092-1549304532=:22962
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-2005648092-1549304532=:22962--
