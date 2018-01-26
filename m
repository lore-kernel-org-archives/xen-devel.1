From: M A Young <m.a.young@durham.ac.uk>
Subject: Re: [PATCH RFC] ocaml: Fix compile with ocaml 4.06,
 use unsafe strings
Date: Fri, 26 Jan 2018 09:09:08 +0000 (GMT)
Message-ID: <alpine.LFD.2.21.1801260903220.28542@algedi.dur.ac.uk>
References: <20180126085208.15212-1-git@johnthomson.fastmail.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=k166=ev=durham.ac.uk=m.a.young@srs-us1.protection.inumbo.net>)
 id 1ef018-0003kf-EN
 for xen-devel@lists.xenproject.org; Fri, 26 Jan 2018 09:09:50 +0000
In-Reply-To: <20180126085208.15212-1-git@johnthomson.fastmail.com.au>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: John Thomson <git@johnthomson.fastmail.com.au>
Cc: xen-devel@lists.xenproject.org, christian.lindig@citrix.com, dave@recoil.org
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCAyNiBKYW4gMjAxOCwgSm9obiBUaG9tc29uIHdyb3RlOgoKPiBVc2UgYXV0b2NvbmYg
dG8gdGVzdCBpZiBvY2FtbCB2ZXJzaW9uID49IDQuMDIKPiBJZiBzbywgdXNlIC11bnNhZmUtc3Ry
aW5nIGZvciBvY2FtbG9wdCBhbmQgb2NhbWxjCj4gCj4gQnl0ZXMgJiBzYWZlLXN0cmluZyB3ZXJl
IGludHJvZHVjZWQgaW4gb2NhbWwgNC4wMiAoMjAxNS0wNy0yNykKPiAKPiBXaXRoIG9jYW1sIDQu
MDYsIC1zYWZlLXN0cmluZyBpcyBub3cgZGVmYXVsdAo+IFRoaXMgc2VwYXJhdGVzIHRoZSB0eXBl
cyBieXRlcyAobXV0YWJsZSBzdHJpbmcpIGFuZCBzdHJpbmcKCkZvciBGZWRvcmEgUmF3aGlkZSwg
d2hpY2ggaGFzIG9jYW1sIDQuMDYsIHdlIGNhbWUgdXAgd2l0aCBhIHBhdGNoIHRvIG1ha2UgCnhl
biBvY2FtbCBzYWZlLXN0cmluZ3MgY29tcGxpYW50ICh3aGljaCBJIGhhdmVuJ3QgZ290IGFyb3Vu
ZCB0byBzdWJtaXR0aW5nIAp0byB0aGlzIGxpc3QgeWV0KS4KClRoZSBwYXRjaCBpcyBhdApodHRw
czovL3NyYy5mZWRvcmFwcm9qZWN0Lm9yZy9ycG1zL3hlbi9ibG9iL21hc3Rlci9mL3hlbi5vY2Ft
bC5zYWZlLXN0cmluZ3MucGF0Y2gKd2l0aCB0aGUgcmVsYXRlZCBGZWRvcmEgYnVnIGF0Cmh0dHBz
Oi8vYnVnemlsbGEucmVkaGF0LmNvbS9zaG93X2J1Zy5jZ2k/aWQ9MTUyNjcwMwoKCU1pY2hhZWwg
WW91bmcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
