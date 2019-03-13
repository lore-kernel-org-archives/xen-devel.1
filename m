From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v5 08/11] viridian: stop directly calling
 viridian_time_ref_count_freeze/thaw()...
Date: Wed, 13 Mar 2019 06:36:38 -0600
Message-ID: <5C88F956020000780021E174@prv1-mh.provo.novell.com>
References: <20190311134132.20536-1-paul.durrant@citrix.com>
 <20190311134132.20536-9-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=GbKp=RQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1h437i-0005jw-8s
 for xen-devel@lists.xenproject.org; Wed, 13 Mar 2019 12:36:42 +0000
In-Reply-To: <20190311134132.20536-9-paul.durrant@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDExLjAzLjE5IGF0IDE0OjQxLCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+IC4uLmZyb20gYXJjaF9kb21haW5fc2h1dGRvd24vcGF1c2UvdW5wYXVzZSgpLgo+IAo+IEEg
c3Vic2VxdWVudCBwYXRjaCB3aWxsIGludHJvZHVjZSBhbiBpbXBsZW1lbnRhaW9uIG9mIHN5bnRo
ZXRpYyB0aW1lcnMKPiB3aGljaCB3aWxsIGFsc28gbmVlZCBmcmVlemUvdGhhdyBob29rcywgc28g
bWFrZSB0aGUgZXhwb3J0ZWQgaG9va3MgbW9yZQo+IGdlbmVyaWMgYW5kIGNhbGwgdGhyb3VnaCB0
byAocmUtbmFtZWQgYW5kIHN0YXRpYykgdGltZV9yZWZfY291bnRfZnJlZXplL3RoYXcKPiBmdW5j
dGlvbnMuCj4gCj4gTk9URTogVGhpcyBwYXRjaCBhbHNvIGludHJvZHVjZXMgYSBuZXcgdGltZV9y
ZWZfY291bnQoKSBoZWxwZXIgdG8gcmV0dXJuCj4gICAgICAgdGhlIGN1cnJlbnQgY291bnRlciB2
YWx1ZS4gVGhpcyBpcyBjdXJyZW50bHkgb25seSB1c2VkIGJ5IHRoZSBNU1IKPiAgICAgICByZWFk
IGhhbmRsZXIgYnV0IHRoZSBzeW50aGV0aWMgdGltZXIgY29kZSB3aWxsIGFsc28gbmVlZCB0byB1
c2UgaXQuCj4gCj4gU2lnbmVkLW9mZi1ieTogUGF1bCBEdXJyYW50IDxwYXVsLmR1cnJhbnRAY2l0
cml4LmNvbT4KPiBSZXZpZXdlZC1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KPiAt
LS0KPiBDYzogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+IENjOiBBbmRyZXcgQ29v
cGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgo+IENjOiAiUm9nZXIgUGF1IE1vbm7DqSIg
PHJvZ2VyLnBhdUBjaXRyaXguY29tPgo+IC0tLQo+ICB4ZW4vYXJjaC94ODYvZG9tYWluLmMgICAg
ICAgICAgICAgIHwgMTIgKysrKysrLS0tLS0tCgpBY2tlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVs
aWNoQHN1c2UuY29tPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
