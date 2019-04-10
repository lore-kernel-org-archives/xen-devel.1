From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [OSSTEST PATCH 21/62] ts-kernel-build: disable
 host1x, which doesn't build
Date: Wed, 10 Apr 2019 16:47:48 +0100
Message-ID: <23726.4132.637193.17047@mariner.uk.xensource.com>
References: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
 <20190410142408.22848-22-ian.jackson@eu.citrix.com>
 <20190410152749.GA1460@ulmo>	<fd1db931-034d-3de5-439a-d78be62a9517@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xn7x=SM=citrix.com=prvs=996f5bc6d=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hEFS5-0003pU-Io
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 15:47:53 +0000
In-Reply-To: <fd1db931-034d-3de5-439a-d78be62a9517@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Thierry Reding <thierry.reding@gmail.com>, Wei Liu <wei.liu2@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
List-Id: xen-devel@lists.xenproject.org

SnVsaWVuIEdyYWxsIHdyaXRlcyAoIlJlOiBbT1NTVEVTVCBQQVRDSCAyMS82Ml0gdHMta2VybmVs
LWJ1aWxkOiBkaXNhYmxlIGhvc3QxeCwgd2hpY2ggZG9lc24ndCBidWlsZCIpOgo+IElhbiBhcmUg
d2UgdXNpbmcgYSBkaWZmZXJlbnQgY29uZmlnIGJldHdlZW4gSmVzc2llIGFuZCBTdHJldGNoPwoK
Tm90IHZlcnkgWzFdLCBidXQgd2UgKmFyZSogdXNpbmcgYSBkaWZmZXJlbnQgY29tcGlsZXIgKHNp
bmNlIHdlIGp1c3QKdXNlIHRoZSBvbmUgZnJvbSB0aGUgZGlzdHJvKS4KClsxXSBUaGVyZSBhcmUg
c29tZSBjaGFuZ2VzIHRvIGFkZCBzb21lIFRodW5kZXJYIGRyaXZlcnMsIGluIGEgcGF0Y2gKdGhh
dCB5b3Ugc3VnZ2VzdGVkIDotKToKCitzZXRvcHQgQ09ORklHX1BDSV9IT1NUX1RIVU5ERVJfUEVN
PXkKK3NldG9wdCBDT05GSUdfUENJX0hPU1RfVEhVTkRFUl9FQ0FNPXkKK3NldG9wdCBDT05GSUdf
VEhVTkRFUl9OSUNfUEY9bQorc2V0b3B0IENPTkZJR19USFVOREVSX05JQ19WRj1tCitzZXRvcHQg
Q09ORklHX1RIVU5ERVJfTklDX0JHWD1tCitzZXRvcHQgQ09ORklHX1RIVU5ERVJfTklDX1JHWD1t
CitzZXRvcHQgQ09ORklHX01ESU9fVEhVTkRFUj1tCitzZXRvcHQgQ09ORklHX0kyQ19USFVOREVS
WD1tCitzZXRvcHQgQ09ORklHX1NQSV9USFVOREVSWD1tCgpJIGRvdWJ0IHRoZXNlIGFyZSByZWxh
dGVkLgoKSXQncyBuaWNlIHRvIGtub3cgdGhhdCBpdCdzIGZpeGVkIGluIDQuMTguICBJIGRvbid0
IGtub3cgaG93CmRpc3J1cHRpdmUgaXQgd291bGQgYmUgdG8gYmFja3BvcnQgaXQuICBJIGNvdWxk
IHBlcmhhcHMgbWFrZSB0aGUKY29uZmlnIG9wdGlvbiB0byBkaXNhYmxlIGhvc3QxeCBjb25kaXRp
b25hbCBvbiB0aGUgTGludXgga2VybmVsCnZlcnNpb24gYnV0IGl0IHNlZW1zIGVhc2llciB0byBq
dXN0IGxlYXZlIHRoaW5ncyBhcyB0aGV5IGFyZSBhbmQgdGFrZQp0aGUgd29ya2Fyb3VuZCBvdXQg
YXQgc29tZSBwb2ludCBpbiB0aGUgZGlzdGFudCBmdXR1cmUgd2hlbiBhbGwKa2VybmVscyB3ZSBj
YXJlIGFib3V0IGhhdmUgdGhlIGZpeC4KClRoYW5rcyBhbGwsCklhbi4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
