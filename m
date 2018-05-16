From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2 1/3] vpci/msi: fix unbind loop
Date: Wed, 16 May 2018 15:10:17 +0200
Message-ID: <0a7c5f9c-655f-f445-6132-3857bd48bea0@suse.com>
References: <20180515141008.69320-1-roger.pau@citrix.com>
 <20180515141008.69320-2-roger.pau@citrix.com>
 <5AFC281502000078001C336B@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=xwnu=id=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1fIwCD-0008JM-Mw
 for xen-devel@lists.xenproject.org; Wed, 16 May 2018 13:10:21 +0000
In-Reply-To: <5AFC281502000078001C336B@suse.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMTYvMDUvMTggMTQ6NDYsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDE1LjA1LjE4IGF0
IDE2OjEwLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+PiBUaGUgY3VycmVudCB1bmJp
bmQgbG9vcCBvbiBmYWlsdXJlIGluIHZwY2lfbXNpX2VuYWJsZSBpcyB3cm9uZyBhbmQKPj4gd2ls
bCBvbmx5IHdvcmsgY29ycmVjdGx5IGlmIHRoZSBpbml0aWFsIHBpcnEgaXMgMC4gRml4IHRoaXMg
YnkgYWRkaW5nCj4+IGEgcHJvcGVyIGJvdW5kLgo+Pgo+PiBSZXBvcnRlZC1ieTogSmFuIEJldWxp
Y2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+PiBTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOp
IDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPiAKPiBSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpi
ZXVsaWNoQHN1c2UuY29tPgo+IAo+IErDvHJnZW4sCj4gCj4gYW55IHRob3VnaHRzIG9uIHRha2lu
ZyB0aGlzIG9uZSBmb3IgNC4xMT8KClJlbGVhc2UtYWNrZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpn
cm9zc0BzdXNlLmNvbT4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
