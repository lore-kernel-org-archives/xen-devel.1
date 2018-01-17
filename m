From: M A Young <m.a.young@durham.ac.uk>
Subject: Re: [Xen-users] DomU not starting under pvhv2
Date: Wed, 17 Jan 2018 11:08:28 +0000 (GMT)
Message-ID: <alpine.LFD.2.21.1801171101550.2484@algedi.dur.ac.uk>
References: <9b10eb2208a0b269853a8b35e91febb0@randomwebstuff.com>
 <CAFLBxZard4U6D_xZ3YhRM0URKJzgQNscJhuw7x+7qN7+NFutYw@mail.gmail.com>
 <20180117103222.dy4d5nr44nq2islm@MacBook-Pro-de-Roger.local>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="-360637438-537665358-1516187308=:2484"
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=tm8a=em=durham.ac.uk=m.a.young@srs-us1.protection.inumbo.net>)
 id 1eblaZ-0004wC-TZ
 for xen-devel@lists.xenproject.org; Wed, 17 Jan 2018 11:09:03 +0000
In-Reply-To: <20180117103222.dy4d5nr44nq2islm@MacBook-Pro-de-Roger.local>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?ISO-8859-15?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, George Dunlap <dunlapg@umich.edu>, Peter <xen@randomwebstuff.com>
List-Id: xen-devel@lists.xenproject.org

---360637438-537665358-1516187308=:2484
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 8BIT

On Wed, 17 Jan 2018, Roger Pau Monné wrote:

> On Mon, Jan 08, 2018 at 06:01:57PM +0000, George Dunlap wrote:
> > Moving to xen-devel, and cc'ing Roger and Boris (who developed PVH)
> > 
> > On Mon, Jan 8, 2018 at 5:24 AM, Peter <xen@randomwebstuff.com> wrote:
> > > Hi.
> > >
> > > Running Xen 4.10.0
> > 
> > What version of Linux are you using?
> > 
> > >
> > > A VM is not starting with type = 'pvh'.  The VM starts, but exits prior to
> > > any data being read off the domU disk image.
> 
> Can you append earlyprintk=xen to your guest command line and try with
> a debug build of the hypervisor?
> 
> Is there anything relevant in the hypervisor serial console output?
> (xl dmesg if you don't have the serial console hooked up)

Also are you using qemu-xen or qemu-xen-traditional? If it is the former 
and you have the error
xen emulation not implemented (yet)
in the relevant qemu-dm log file in /var/log/xen then you presumably need 
the patch at
https://lists.xenproject.org/archives/html/xen-devel/2018-01/msg01289.html

	Michael Young
---360637438-537665358-1516187308=:2484
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

---360637438-537665358-1516187308=:2484--
