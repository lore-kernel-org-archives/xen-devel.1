From: Lars Kurth <lars.kurth.xen@gmail.com>
Subject: Re: [BUG] docs: our man page generation uses
 http://man.he.net/ by default which causes broken links. It should be
 changed to point to a relative path
Date: Fri, 11 Jan 2019 14:15:14 +0000
Message-ID: <1D083D7F-2572-4B9E-9CC9-00973D7F8A5E@xenproject.org>
References: <24902838-BA23-4032-8FCC-384CA51C0A4E@citrix.com>
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Fcdb=PT=gmail.com=lars.kurth.xen@srs-us1.protection.inumbo.net>)
 id 1ghxah-0002f9-OM
 for xen-devel@lists.xenproject.org; Fri, 11 Jan 2019 14:15:19 +0000
Received: by mail-wr1-x434.google.com with SMTP id u4so15362851wrp.3
 for <xen-devel@lists.xenproject.org>; Fri, 11 Jan 2019 06:15:17 -0800 (PST)
In-Reply-To: <24902838-BA23-4032-8FCC-384CA51C0A4E@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Lars Kurth <lars.kurth@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, "committers@xenproject.org" <committers@xenproject.org>
List-Id: xen-devel@lists.xenproject.org

UGluZyEKQWRkaW5nIElhbiBKYWNrc29uIHNwZWNpZmljYWxseSAtIHdlIHNob3VsZCByZWFsbHkg
Zml4IHRoaXMgZm9yIDQuMTIKUmVnYXJkcwpMYXJzCgo+IE9uIDIgQXVnIDIwMTgsIGF0IDEyOjI0
LCBMYXJzIEt1cnRoIDxsYXJzLmt1cnRoQGNpdHJpeC5jb20+IHdyb3RlOgo+IAo+IEhpIGFsbCwK
PiAKPiBtb3N0IG9mIG91ciBtYW4gcGFnZXMgb24gcHJldHR5IG11Y2ggYWxsIHJlbGVhc2VzIGZy
b20gNC4yIGNvbnRhaW4gYnJva2VuIGxpbmtzLiAKPiAKPiBGb3IgZXhhbXBsZToKPiBJbiBodHRw
czovL3hlbmJpdHMueGVuLm9yZy9kb2NzL3Vuc3RhYmxlL21hbi94bC5jZmcuNS5odG1sIHRoZSBz
b3VyY2UgY29udGFpbnM6Cj4gCj4gIkZvciBtb3JlIGRldGFpbHMsIHNlZSBMPHhsLW51bWEtcGxh
Y2VtZW50KDcpPi4iIAo+IE1hcHMgb250byBodHRwOi8vbWFuLmhlLm5ldC9tYW43L3hsLW51bWEt
cGxhY2VtZW50ICAoZG9lcyBub3QgZXhpc3QpCj4gCj4g4oCcU2VlIEw8aHR0cDovL21hbi5oZS5u
ZXQvbWFuNS94bC1kaXNrLWNvbmZpZ3VyYXRpb24+IGZvciBtb3JlIGRldGFpbHMu4oCdIAo+IE1h
cHMgb250byBodHRwOi8vbWFuLmhlLm5ldC9tYW41L3hsLWRpc2stY29uZmlndXJhdGlvbiAoZG9l
cyBub3QgZXhpc3QpCj4gCj4gRXRjLgo+IAo+IFRoZXJlIHNlZW0gdG8gYmUgdHdvIGlzc3VlczoK
PiAqIFRoZSByb290IHBhdGggaHR0cDovL21hbi5oZS5uZXQsIHdoaWNoIGlzIGluY29ycmVjdAo+
ICogVGhlIHJlc29sdXRpb24gb2YgZmlsZW5hbWVzIHRvIG1hbjx4Pi88bmFtZT46IHNob3VsZCBi
ZSBtYW4vPG5hbWU+Ljx4Pi5odG1sCj4gCj4gUHJvYmFibHkgd2UgbmVlZCB0byBmZWVkIHNvbWUg
YXJndW1lbnRzIHRvIHByb2JhYmx5IHdlIG5lZWQgdG8gZmVlZCBzb21lIGFyZ3VtZW50cyAKPiB0
byBwb2QyaHRtbCBpbiBvcmRlciB0byBnZW5lcmF0ZSB0aGUgY29ycmVjdCB1cmxzLiBTZWUgIGh0
dHBzOi8vcGVybGRvYy5wZXJsLm9yZy9wb2QyaHRtbC5odG1sIAo+IChtYXliZSB3ZSBuZWVkIHdl
IG5lZWQg4oCTaHRtbGRpcikuIEZvciBvdXIgZG9jcyBidWlsZCwgdGhpcyBzaG91bGQgcHJvYmFi
bHkgZ28gdG8gCj4gaHR0cHM6Ly94ZW5iaXRzLnhlbi5vcmcvZG9jcy91bnN0YWJsZS9tYW4vIHdo
aWxlIGZvciBsb2NhbCBpbnN0YWxscyB0byAKPiAke3ByZWZpeH0vc2hhcmUvZG9jL3hlbi9odG1s
L21hbiBvciBzb21ldGhpbmcgbGlrZSBpdC4KPiAKPiBJIGhhZCBhIGxvb2sgdG8gc2VlIHdoZXRo
ZXIgSSBjYW4gZml4IHRoaXMsIGJ1dCB0aGF0IHNlZW1zIGEgbGl0dGxlIHRvbyBjb21wbGV4IGZv
ciBtZQo+IAo+IFJlZ2FyZHMKPiBMYXJzCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KPiBYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Cj4gWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCj4gaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
