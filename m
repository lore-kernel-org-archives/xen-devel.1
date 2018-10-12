From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH 07/12] tools/xenstore: Re-introduce (fake)
 xs_restrict call to preserve ABI
Date: Fri, 12 Oct 2018 16:38:20 +0100
Message-ID: <20181012153820.a3xwca6sh4wfoxol@zion.uk.xensource.com>
References: <20181012151215.32455-1-ian.jackson@eu.citrix.com>
 <20181012151215.32455-8-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=zta5=my=citrix.com=prvs=8166c57ff=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gAzWB-0005lJ-GV
 for xen-devel@lists.xenproject.org; Fri, 12 Oct 2018 15:38:23 +0000
Content-Disposition: inline
In-Reply-To: <20181012151215.32455-8-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@eu.citrix.com>
Cc: Hans van Kranenburg <hans@knorrie.org>, xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBPY3QgMTIsIDIwMTggYXQgMDQ6MTI6MTBQTSArMDEwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gRnJvbTogSGFucyB2YW4gS3JhbmVuYnVyZyA8aGFuc0Brbm9ycmllLm9yZz4KPiAKPiBs
aWJ4ZW5zdG9yZTMuMCBpbiBYZW4gNC44IGhhZCB0aGlzIGZ1bmN0aW9uLiAgV2UgZG9uJ3QgcmVh
bGx5IHdhbnQgdG8KPiBidW1wIHRoZSBBQkkgdmVyc2lvbiAoc29uYW1lKSBqdXN0IGZvciB0aGlz
LCBzaW5jZSB3ZSBkb24ndCB0aGluawo+IHRoZXJlIGFyZSBhY3R1YWwgY2FsbGVycyBhbnl3aGVy
ZS4gIEJ1dCB0b29scyBjb21wbGFpbiBhYm91dCB0aGUKPiBzeW1ib2wgZ29pbmcgYXdheS4KPiAK
PiBTbywgcHJvdmlkZSBhIGZ1bmN0aW9uIHhzX3Jlc3RyaWN0IHdoaWNoIGNvbmZvcm1zIHRvIHRo
ZSBvcmlnaW5hbAo+IHNlbWFudGljcywgYWx0aG91Z2ggaXQgYWx3YXlzIGZhaWxzLgo+IAo+IEdi
cC1QcTogVG9waWMgeGVuc3RvcmUKPiBHYnAtUHE6IE5hbWUgdG9vbHMtZmFrZS14cy1yZXN0cmlj
dC5wYXRjaAo+IFNpZ25lZC1vZmYtYnk6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRy
aXguY29tPgoKQWNrZWQtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
