From: M A Young <m.a.young@durham.ac.uk>
Subject: Re: Build issues with newer iasl (was: Re: Status of
 comet-4.10 branch)
Date: Sat, 16 Jun 2018 09:03:11 +0100 (BST)
Message-ID: <alpine.DEB.2.11.1806160843290.10068@procyon.dur.ac.uk>
References: <23331.59553.257203.856866@mariner.uk.xensource.com>
 <alpine.LFD.2.21.1806151905040.3035@austen3.home>
 <20180616072625.ozrkmawu7p3xbp66@mac>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="8323329-256476968-1529136191=:10068"
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=sbub=jc=durham.ac.uk=m.a.young@srs-us1.protection.inumbo.net>)
 id 1fU6BV-0000ez-Q3
 for xen-devel@lists.xenproject.org; Sat, 16 Jun 2018 08:03:45 +0000
In-Reply-To: <20180616072625.ozrkmawu7p3xbp66@mac>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?ISO-8859-15?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Cc: Ian Jackson <ian.jackson@citrix.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-256476968-1529136191=:10068
Content-Type: TEXT/PLAIN; charset=ISO-8859-15
Content-Transfer-Encoding: 8BIT

On Sat, 16 Jun 2018, Roger Pau Monné wrote:

> On Fri, Jun 15, 2018 at 07:26:14PM +0100, Michael Young wrote:
> > context (this hasn't reached Fedora yet as the build is broken, I think due
> > to updates to Fedora's acpica-tools package which provides iasl).
> 
> I've recently experienced the same on FreeBSD, you might want to try:
> 
> http://xenbits.xen.org/gitweb/?p=xen.git;a=commit;h=858dbaaeda33b05c1ac80aea0ba9a03924e09005

Thanks for that, though I worked out an inferior version of that fix 
myself since my email. I didn't think to look upstream, which I should 
have done as I now realize my recent test build of xen 4.11 rc6 succeeded 
with the with the updated iasl.

	Michael Young
--8323329-256476968-1529136191=:10068
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-256476968-1529136191=:10068--
