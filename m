From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v3 5/5] x86: remove usage of .skip with
 non-absolute expressions
Date: Tue, 30 Jan 2018 09:23:18 +0000
Message-ID: <20180130092318.uaowitgdroronmvp@MacBook-Pro-de-Roger.local>
References: <20180129122643.13008-1-roger.pau@citrix.com>
 <20180129122643.13008-6-roger.pau@citrix.com>
 <5A6F5F0002000078001A37EE@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=/cio=ez=citrix.com=prvs=561c7975c=roger.pau@srs-us1.protection.inumbo.net>)
 id 1egS8Z-0001BW-ND
 for xen-devel@lists.xenproject.org; Tue, 30 Jan 2018 09:23:31 +0000
Content-Disposition: inline
In-Reply-To: <5A6F5F0002000078001A37EE@prv-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, IanJackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBKYW4gMjksIDIwMTggYXQgMDk6NTA6NTZBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDI5LjAxLjE4IGF0IDEzOjI2LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdy
b3RlOgo+ID4gQ2xhbmcgYXNzZW1ibGVyIGRvZXNuJ3Qgc3VwcG9ydCB1c2luZyAuc2tpcCB3aXRo
IG5vbi1hYnNvbHV0ZQo+ID4gZXhwcmVzc2lvbnM6Cj4gPiAKPiA+IGVudHJ5LlM6MTA5OjE1OiBl
cnJvcjogZXhwZWN0ZWQgYWJzb2x1dGUgZXhwcmVzc2lvbgo+ID4gICAgICAgICAuc2tpcCAuTGNy
NF9hbHRfZW5kIC0gLkxjcjRfYWx0LCAweDkwCj4gPiAgICAgICAgICAgICAgIF4KPiA+IAo+ID4g
VGhpcyB1c2FnZSBvZiAuc2tpcCB3YXMgdG8gZmlsbCBjb2RlIHNlY3Rpb25zIHdpdGggTk9QcyBp
biBvcmRlciBmb3IKPiA+IHRoZW0gdG8gYmUgcGF0Y2hlZCBhdCBydW4gdGltZSBpZiByZXF1aXJl
ZCBieSB0aGUgYWx0ZXJuYXRpdmVzCj4gPiBmcmFtZXdvcmsuIEluc3RlYWQgb2YgdXNpbmcgLnNr
aXAgdXNlIHRoZSBhcHByb3ByaWF0ZSBudW1iZXIgb2YgTk9Qcwo+ID4gdG8gbWF0Y2ggdGhlIHNp
emUgb2YgdGhlIGFsdGVybmF0aXZlIGNvZGUuCj4gCj4gTkFLIC0gSSd2ZSB2b2ljZWQgYSBudW1i
ZXIgb2YgdGltZXMgbXkgb3Bwb3NpdGlvbiB0byBBbmRyZXcgYWRkaW5nCj4gdGhlIHZhcmlvdXMg
QVNNX05PUDxOPiBpbiBoaXMgU3BlY3RyZSB2MiBzZXJpZXMsIGFuZCBJJ20gcGxhbm5pbmcKPiB0
byBlbGltaW5hdGUgdGhlbSBpbiBkdWUgY291cnNlIChieSB1c2luZyAtIHlvdSBndWVzcyBpdCAt
IC5za2lwKS4gSXQKPiBpcyBwcmV0dHkgbXVjaCB1bmFjY2VwdGFibGUgdG8gbWUgdG8gaGF2ZSB0
byBlbmNvZGUgdGhlIHNpemUgb2YKPiBjZXJ0YWluIGluc3RydWN0aW9ucyBpbiBhIHNlY29uZCBw
bGFjZSwgcmlza2luZyB0aGVtIHRvIGdvIG91dCBvZiBzeW5jCj4gd2l0aCB3aGF0IHRoZXkgc2hh
ZG93Lgo+IAo+IElmIHVnbGluZXNzIGxpa2UgdGhpcyBpcyBuZWVkZWQgdG8gc3VwcG9ydCBjbGFu
ZydzIGludGVncmF0ZWQgYXNzZW1ibGVyLAo+IHRoZW4gSSBzZWUgbm8gd2F5IG90aGVyIHRoYW4g
YXZvaWRpbmcgaXRzIHVzZS4KClJpZ2h0LCBJIGFncmVlIHRoaXMgaXMgdWdseSBhbmQgcHJvbmUg
dG8gZXJyb3IuIFRoaXMgc2VlbXMgdG8gYmUgZml4ZWQKaW4gY2xhbmcgdGh1bmssIHNvIEkndmUg
YXNrZWQgZm9yIGEgYmFja3BvcnQgb2YgdGhlIGZpeCB0byA2LjAuCgpSb2dlci4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
