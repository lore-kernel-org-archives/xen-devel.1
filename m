From: Michael Young <m.a.young@durham.ac.uk>
Subject: Re: [PATCH 1/2] make xen ocaml safe-strings compliant
Date: Tue, 13 Feb 2018 00:35:18 +0000 (GMT)
Message-ID: <alpine.LFD.2.21.1802130014001.2835@austen3.home>
References: <alpine.LFD.2.21.1801302254440.2952@austen3.home>
 <1518112198.5629.68.camel@suse.com>
 <20180208180348.moi3fujoq22fkkqg@citrix.com>
 <20180208182400.g4qlkiaetnvqhuo6@citrix.com>
 <EAB71B74-BDA5-49CD-9C55-6BB3BCDC3FB1@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323328-767733497-1518480999=:2835"
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=suqu=fh=durham.ac.uk=m.a.young@srs-us1.protection.inumbo.net>)
 id 1elOZK-0002XJ-BT
 for xen-devel@lists.xenproject.org; Tue, 13 Feb 2018 00:35:34 +0000
In-Reply-To: <EAB71B74-BDA5-49CD-9C55-6BB3BCDC3FB1@citrix.com>
Content-ID: <alpine.LFD.2.21.1802130017080.2835@austen3.home>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Christian Lindig <christian.lindig@citrix.com>
Cc: Wei Liu <wei.liu2@citrix.com>, John Thomson <git@johnthomson.fastmail.com.au>, Dario Faggioli <dfaggioli@suse.com>, Marcello Seri <marcello.seri@citrix.com>, David Scott <dave@recoil.org>, Xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-767733497-1518480999=:2835
Content-Type: text/plain; CHARSET=ISO-8859-7; format=flowed
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.LFD.2.21.1802130017081.2835@austen3.home>

On Fri, 9 Feb 2018, Christian Lindig wrote:

> Sorry, I can¢t make a promise because of my other obligations. I do 
> wonder, though: this patch did not come out of nowhere but supposedly 
> was working - what is different here?

The patch was from Fedora and is broken there too! It fixes the build 
issues but it doesn't look like anyone tested it (I use xenstored).

I have been trying to narrow down where the problem is and I think there 
are actually two issues;
one in tools/ocaml/xenstored/utils.ml which I think causes an error like 
Fatal error: exception Failure("int_of_string")
and one in tools/ocaml/libs/xb/xb.ml which I think causes an error like
Fatal error: exception Failure("evtchn bind_interdomain failed")

 	Michael Young
--8323328-767733497-1518480999=:2835
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323328-767733497-1518480999=:2835--
