From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH] docs/qemu-deprivilege: Revise and update
 with status and future plans
Date: Tue, 27 Mar 2018 15:36:36 +0100
Message-ID: <23226.22260.207702.968821@mariner.uk.xensource.com>
References: <20180322182437.936-1-george.dunlap@citrix.com>
 <23225.8997.574938.415857@mariner.uk.xensource.com>
 <87f60317-7913-a3ad-58eb-59928b8d7d61@citrix.com>
 <23226.18455.602635.161530@mariner.uk.xensource.com>
 <1a845c55-df25-1754-3e14-bdc47e658da8@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=2rlr=gr=citrix.com=prvs=617832343=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1f0pkq-0002kt-VZ
 for xen-devel@lists.xenproject.org; Tue, 27 Mar 2018 14:39:16 +0000
In-Reply-To: <1a845c55-df25-1754-3e14-bdc47e658da8@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <george.dunlap@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, Ross Lagerwall <ross.lagerwall@citrix.com>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

R2VvcmdlIER1bmxhcCB3cml0ZXMgKCJSZTogW1BBVENIXSBkb2NzL3FlbXUtZGVwcml2aWxlZ2U6
IFJldmlzZSBhbmQgdXBkYXRlIHdpdGggc3RhdHVzIGFuZCBmdXR1cmUgcGxhbnMiKToKPiBPbiAw
My8yNy8yMDE4IDAyOjMzIFBNLCBJYW4gSmFja3NvbiB3cm90ZToKPiA+IEFueXdheSBJTU8gd2Ug
c2hvdWxkIHNldCBSTElNSVRfTlBST0MgYWZ0ZXIgZm9yayBhbmQgYmVmb3JlIGV4ZWN2ZS4KPiA+
IElmIHRoaXMgY2F1c2VzIHNldHVpZCB0byBmYWlsIGluIHFlbXUsIHFlbXUgd2lsbCBjcmFzaC4g
IEJ1dCB0aGlzCj4gPiBjb3VsZCBvbmx5IGJlIHRoZSBjYXNlIGlmIHRoZSBuZXcgdWlkIGFscmVh
ZHkgaGFzIG90aGVyIHByb2Nlc3NlcywKPiA+IHdoaWNoIGl0IHNob3VsZG4ndCBkby4gIChJZiBp
dCBkb2VzLCB0aGUgbmV3IHVpZCBpcyBwcm9iYWJseQo+ID4gY29udGFtaW5hdGVkIGJ5IGEgcHJl
dmlvdXMgZG9tYWluIHdpdGggdGhlIHNhbWUgZG9taWQuKQo+IAo+IEkgd2FzIG1vcmUgd29ycmll
ZCBhYm91dCB0aGUgbGltaXQgbm90IGhhdmluZyB0aGUgZXhwZWN0ZWQgZWZmZWN0IGFmdGVyCj4g
dGhlIHNldHVpZCgpLgoKSSB0aGluayB3ZSBjYW4gc2FmZWx5IHJ1bGUgdGhhdCBvdXQuCgo+ID4g
SSBjb3VsZCBmaW5kIG5vdGhpbmcgaW4gU3VTIGV4cGxhaW5pbmcgd2hlbiBwcm9jZXNzIEEgbWF5
IHNlbmQgc2lnbmFscwo+ID4gdG8gcHJvY2VzcyBCLiAgU28gSSByZXNvcnRlZCB0byB0aGUgQlNE
IG1hbnBhZ2VzOgo+ID4gCj4gPiAgIGh0dHBzOi8vd3d3LnVuaXguY29tL21hbi1wYWdlL2ZyZWVi
c2QvMi9raWxsLwo+ID4gCj4gPiAgIEZvciBhIHByb2Nlc3MgdG8gaGF2ZSBwZXJtaXNzaW9uIHRv
IHNlbmQgYSBzaWduYWwgdG8gYSBwcm9jZXNzCj4gPiAgIGRlc2lnbmF0ZWQgYnkgcGlkLCB0aGUg
dXNlciBtdXN0IGJlIHRoZSBzdXBlci11c2VyLCBvciB0aGUgcmVhbCBvcgo+ID4gICBzYXZlZCB1
c2VyIElEIG9mIHRoZSByZWNlaXZpbmcgcHJvY2VzcyBtdXN0IG1hdGNoIHRoZSByZWFsIG9yCj4g
PiAgIGVmZmVjdGl2ZSB1c2VyIElEIG9mIHRoZSBzZW5kaW5nIHByb2Nlc3MuCj4gCj4gVGhlIHRl
eHQgb2YgYm90aCB0aGUgRnJlZUJTRCBhbmQgTGludXggbWFuIHBhZ2VzIGxvb2tzIHRvIGJlIGNv
cGllZAo+IHZlcmJhdGltIGZyb20gWzFdLgo+IAo+IFsxXSBodHRwOi8vcHVicy5vcGVuZ3JvdXAu
b3JnL29ubGluZXB1YnMvOTY5OTkxOTc5OS9mdW5jdGlvbnMva2lsbC5odG1sCgpJIGRvbid0IGtu
b3cgaG93IEkgbWlzc2VkIHRoYXQuICBJdCdzIHRoZSAybmQgcGFyYWdyYXBoIQoKPiA+IGBwZXQn
IGNvdWxkIGJlIGEgdWlkIGFzc29jaWF0ZWQgd2l0aCBhIHJlc2VydmVkIGRvbWlkLCBlZyBkb20w
Lgo+IAo+IFJpZ2h0IC0tIGl0IGxvb2tzIGxpa2UgdGhhdCBjb3VsZCB3b3JrLiAgSSBoYWRuJ3Qg
aW5pdGlhbGx5IG5vdGljZWQgdGhlCj4ge1JVSUQsIFNVSUR9ID0+IHtSVUlELCBFVUlEfSBkaXN0
aW5jdGlvbi4KPiAKPiBJdCdzIGtpbmQgb2YgaGFyZCB0byBiZWxpZXZlIHRoaXMgaXMgc28gZGlm
ZmljdWx0IHRvIHB1bGwgb2ZmLgoKWWVzIQoKPiBTaG91bGQgd2UgcG9zdCB0aGlzIHRvIHRoYXQg
Zm9ydW0sIGZvciB0aGUgYmVuZWZpdCBvZiBvdGhlciBwZW9wbGUgd2hvCj4gZW5kIHVwIGZpbmRp
bmcgdGhlIHNhbWUgZGlzY3Vzc2lvbj8gOi0pCgpUZW1wdGluZy4gIExldCdzIHdhaXQgdW50aWwg
d2Ugc2VlIGlmIGl0IHdvcmtzLCBmaXJzdCAuLi4KCklhbi4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
