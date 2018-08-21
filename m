From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v4 15/32] libxl_json: Enable
 yajl_allow_trailing_garbage
Date: Tue, 21 Aug 2018 09:26:12 +0100
Message-ID: <20180821082612.db2z5ilit7lddifq@citrix.com>
References: <20180727140614.13256-1-anthony.perard@citrix.com>
 <20180727140614.13256-16-anthony.perard@citrix.com>
 <20180802100123.dvtbc4qbys44mbxf@mac>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=7kme=le=citrix.com=prvs=7644f7420=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fs205-0004QI-1e
 for xen-devel@lists.xenproject.org; Tue, 21 Aug 2018 08:26:53 +0000
Content-Disposition: inline
In-Reply-To: <20180802100123.dvtbc4qbys44mbxf@mac>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBBdWcgMDIsIDIwMTggYXQgMTI6MDE6MjNQTSArMDIwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPiBPbiBGcmksIEp1bCAyNywgMjAxOCBhdCAwMzowNTo1N1BNICswMTAwLCBBbnRo
b255IFBFUkFSRCB3cm90ZToKPiA+IFRoaXMgYWxsb3cgdG8gcGFyc2UgYSBzdHJpbmcgdGhhdCBp
cyBub3QgTlVMLXRlcm1pbmF0ZWQuIFdpdGggdGhhdAo+ICAgICAgICBeIGFsbG93cwo+ID4gb3B0
aW9ucyBkaXNhYmxlZCwgWUFKTCB2MiB3b3VsZCBsb29rIGFoZWFkIG9uIGNvbXBsZXRpb24gdG8g
ZmluZCBvdXQgaWYKPiAgIF4gb3B0aW9uCj4gPiB0aGVyZSBpcyBtb3JlIHRvIHBhcnNlLgo+ID4g
Cj4gPiBZQUpMIHYxIGRvZXNuJ3QgaGF2ZSB0aGlzIGJlaGF2aW9yLgo+ID4gCj4gPiBBbnkgZnVu
Y3Rpb24gZnVuY3Rpb24gdGhhdCBhbGxvY2F0ZSBhIHlhamxfaGFuZGxlIHZpYSB0aGlzIGZ1bmN0
aW9uCj4gICAgICAgXiBkdXBsaWNhdGVkICAgICAgICAgICBeIGFsbG9jYXRlcwo+ID4gZWl0aGVy
IHBhcnNlIGEgTlVMLXRlcm1pbmF0ZWQgc3RyaW5nLCBvciBkbyBwcm92aWRlIHByb3BlciBsZW5n
dGguIFNvCj4gPiBjaGFuZ2UgdGhlIGRlZmF1bHQgYW5kIGFsbG93IGdhcmJhZ2UgKGxpa2UgYSBk
aWZmZXJlbnQgSlNPTiBkb2N1bWVudCkKPiA+IGFmdGVyIHRoZSBlbmQgb2YgdGhlIGRhdGEgdG8g
cGFyc2UuCj4gPiAKPiA+IFRoaXMgaXMgaW1wb3J0YW5kIGZvciB0aGUgUU1QIGNsaWVudCwgYXMg
dGhlcmUgY291bGQgYmUgbW9yZSB0aGFuIG9uZQo+ICAgICAgICAgICBeIGltcG9ydGFudAo+ID4g
bWVzc2FnZSB0byBwYXJzZSwgYW5kIFlBSkwgd291bGQgY29uc2lkZXIgdGhlIG5leHQgbWVzc2Fn
ZSB0byBiZQo+ID4gZ2FyYmFnZSBhbmQgdGhyb3cgYW4gZXJyb3IuCj4gPiAKPiA+IFNpZ25lZC1v
ZmYtYnk6IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPgo+IAo+IFJl
dmlld2VkLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPiAKCldp
dGggY29tbWl0IG1lc3NhZ2UgZml4ZWQ6CgpBY2tlZC1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0
cml4LmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
