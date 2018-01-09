From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: Xen Project Spectre/Meltdown FAQ
Date: Mon, 8 Jan 2018 18:04:48 -0800 (PST)
Message-ID: <alpine.DEB.2.10.1801081804150.4603@sstabellini-ThinkPad-X260>
References: <B3F5B430-F55E-446C-A7C5-7830F2CEDFCD@gmail.com>
 <888C1DAE-2B56-4D59-8529-D9DEA410BB9E@gmail.com>
 <edec8de6-c678-2aa1-5c50-97533c14f8f6@citrix.com>
 <20180107150029.GA2935@mail-itl>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="8323329-843168309-1515463489=:4603"
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=igen=ee=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1eYjHe-00019c-L3
 for xen-devel@lists.xenproject.org; Tue, 09 Jan 2018 02:04:58 +0000
In-Reply-To: <20180107150029.GA2935@mail-itl>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: Lars Kurth <lars.kurth.xen@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Rich Persaud <persaur@gmail.com>, George Dunlap <george.dunlap@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-843168309-1515463489=:4603
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Sun, 7 Jan 2018, Marek Marczykowski-Górecki wrote:
> On Fri, Jan 05, 2018 at 07:05:56PM +0000, Andrew Cooper wrote:
> > On 05/01/18 18:16, Rich Persaud wrote:
> > >> On Jan 5, 2018, at 06:35, Lars Kurth <lars.kurth.xen@gmail.com
> > >> <mailto:lars.kurth.xen@gmail.com>> wrote:
> > >> Linux’s KPTI series is designed to address SP3 only.  For Xen guests,
> > >> only 64-bit PV guests are affected by SP3. A KPTI-like approach was
> > >> explored initially, but required significant ABI changes.  
> 
> Is some partial KPTI-like approach feasible? Like unmapping memory owned
> by other guests, but keeping Xen areas mapped? This will still allow
> leaking Xen memory, but there are very few secrets there (vCPUs state,
> anything else?), so overall impact will be much lower.

+1
--8323329-843168309-1515463489=:4603
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-843168309-1515463489=:4603--
