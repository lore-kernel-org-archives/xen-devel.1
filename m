From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] shim: Fix generation of compat/callback.i:
 allow redef of OBJECT vars
Date: Thu, 19 Jul 2018 10:00:45 -0700 (PDT)
Message-ID: <alpine.DEB.2.10.1807190955250.19154@sstabellini-ThinkPad-X260>
References: <1531956796-7465-1-git-send-email-christopher.w.clark@gmail.com>
 <5B5036A802000078001D5AE3@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=gv/7=kd=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1fgCIO-0000FU-MW
 for xen-devel@lists.xenproject.org; Thu, 19 Jul 2018 17:00:52 +0000
In-Reply-To: <5B5036A802000078001D5AE3@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Christopher Clark <christopher.w.clark@gmail.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCAxOSBKdWwgMjAxOCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gPiBTaWduZWQtb2ZmLWJ5
OiBDaHJpc3RvcGhlciBDbGFyayA8Y2hyaXN0b3BoZXIuY2xhcms2QGJhZXN5c3RlbXMuY29tPgo+
ID4gLS0tCj4gPiBQbGVhc2UgdXNlIG15IGdtYWlsIGFkZHJlc3MgZm9yIGFueSBjb3JyZXNwb25k
ZW5jZSB0byBtZS4KPiAKPiBJIHRoaW5rIGl0IGlzIGdlbmVyYWxseSBjb25zaWRlcmVkIGJhZCBw
cmFjdGljZSB0byBoYXZlIEZyb206IGFuZCBTLW8tYgo+IGRpZmZlci4KCldoeT8gVGhhdCBpcyBw
ZXJmZWN0bHkgZmluZS4gU2lnbmVkLW9mZi1ieSBpcyBhYm91dCBjb3B5cmlnaHQgb2YgdGhlCmNv
ZGUgd2hpbGUgRnJvbTogaXMgYWJvdXQgYXV0aG9yc2hpcC4gTW9yZW92ZXIsIGl0IGlzIHN0aWxs
IHBvc3NpYmxlIHRvCnNwZWNpZnkgYW4gYWx0ZXJuYXRpdmUgRnJvbTogYXMgZmlyc3QgbGluZSBv
ZiB0aGUgYm9keS4gU28gQ2hyaXN0b3BoZXIKY291bGQ6CgogIEZyb206IENocmlzdG9waGVyIENs
YXJrIDxjaHJpc3RvcGhlci53LmNsYXJrQGdtYWlsLmNvbT4gKHRoZSBlbWFpbCBoZWFkZXIpIAog
IEZyb206IENocmlzdG9waGVyIENsYXJrIDxjaHJpc3RvcGhlci5jbGFyazZAYmFlc3lzdGVtcy5j
b20+IChpbiB0aGUgYm9keSkKICBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGhlciBDbGFyayA8Y2hy
aXN0b3BoZXIuY2xhcms2QGJhZXN5c3RlbXMuY29tPiAoaW4gdGhlIGJvZHkpCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
