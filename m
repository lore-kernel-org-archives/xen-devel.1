From: Yi Sun <yi.y.sun@linux.intel.com>
Subject: Re: [PATCH v10 00/11] Enable Memory Bandwidth
	Allocation in Xen
Date: Tue, 9 Jan 2018 08:31:52 +0800
Message-ID: <20180109003152.GB31347@yi.y.sun>
References: <1513644142-50972-1-git-send-email-yi.y.sun@linux.intel.com>
 <5A3A37540200007800198C59@prv-mh.provo.novell.com>
 <20180108042858.GA31347@yi.y.sun>
 <20180108122502.pqm4yljz5zd7m4cp@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=2qvq=ee=linux.intel.com=yi.y.sun@srs-us1.protection.inumbo.net>)
 id 1eYhrB-0008ST-F0
 for xen-devel@lists.xenproject.org; Tue, 09 Jan 2018 00:33:33 +0000
Content-Disposition: inline
In-Reply-To: <20180108122502.pqm4yljz5zd7m4cp@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>, xen-devel@lists.xenproject.org, Chao Peng <chao.p.peng@linux.intel.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>, Roger Pau =?utf-8?B?TW9ubu+/vQ==?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTgtMDEtMDggMTI6MjU6MDIsIFdlaSBMaXUgd3JvdGU6Cj4gT24gTW9uLCBKYW4gMDgsIDIw
MTggYXQgMTI6Mjg6NThQTSArMDgwMCwgWWkgU3VuIHdyb3RlOgo+ID4gT24gMTctMTItMjAgMDI6
MTE6MzIsIEphbiBCZXVsaWNoIHdyb3RlOgo+ID4gPiA+Pj4gT24gMTkuMTIuMTcgYXQgMDE6NDIs
IDx5aS55LnN1bkBsaW51eC5pbnRlbC5jb20+IHdyb3RlOgo+ID4gPiA+IFdlIHBsYW4gdG8gYnJp
bmcgYSBuZXcgUFNSIChQbGF0Zm9ybSBTaGFyZWQgUmVzb3VyY2UpIGZlYXR1cmUgY2FsbGVkCj4g
PiA+ID4gSW50ZWwgTWVtb3J5IEJhbmR3aWR0aCBBbGxvY2F0aW9uIChNQkEpIHRvIFhlbi4KPiA+
ID4gPiAKPiA+ID4gPiBCZXNpZGVzIHRoZSBNQkEgZW5hYmxpbmcsIHdlIGNoYW5nZSBzb21lIGlu
dGVyZmFjZXMgdG8gbWFrZSB0aGVtIG1vcmUKPiA+ID4gPiBnZW5lcmFsIGJ1dCBub3Qgb25seSBm
b3IgQ0FULgo+ID4gPiA+IAo+ID4gPiA+IFRoZSBmaXJzdCA1IHBhdGNoZXMgb2YgVjkgaGF2ZW4g
YmVlbiBtZXJnZWQuIFRvIGZpeCBhIGZldyBpc3N1ZXMsIHRoZQo+ID4gPiA+IFYxMCBpcyBzdWJt
aXR0ZWQuCj4gPiA+IAo+ID4gPiBJJ3ZlIGNvbW1pdHRlZCB0aGUgdGhyZWUgaHlwZXJ2aXNvciBw
YXRjaGVzOyBJJ3ZlIG5vdCBkb25lIGFueXRoaW5nCj4gPiA+IHdpdGggdGhlIGVpZ2h0IHRvb2xz
IG9uZXMsIGFzIG9uZSBvZiB0aGVtIG5lZWRzIHRvIGJlIChyZS0pYWNrZWQuIEknbGwKPiA+ID4g
bGVhdmUgdGhhdCBwYXJ0IHRvIG9uZSBvZiB5b3UuCj4gPiA+IAo+ID4gPiBKYW4KPiA+IAo+ID4g
SGksIElhbiBhbmQgV2VpLAo+ID4gCj4gPiBDb3VsZCB5b3UgcGxlYXNlIGhlbHAgdG8gY2hlY2sg
dG9vbHMvIHBhdGNoZXM/IFRoYW5rcyEKPiA+IAo+IAo+IEkganVzdCBhY2tlZCB0aGUgb25lIHBh
dGNoIHRoYXQgbWlzc2VkIGFuIGFjay4gSSB3aWxsIHRyeSB0byBnZXQgYXJvdW5kCj4gdG8gY29t
bWl0IHRoZW0gbGF0ZXIgdGhpcyB3ZWVrLgo+IApUaGFuayB5b3UhIDopCgo+IFdlaS4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
