From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH for-4.11] x86/cacheattr: fix
 mtrr_pat_not_equal
Date: Thu, 17 May 2018 05:53:41 -0600
Message-ID: <5AFD6D4502000078001C395A@prv1-mh.provo.novell.com>
References: <20180517094809.80469-1-roger.pau@citrix.com>
 <5AFD5CF402000078001C38BD@suse.com>
 <0e3018de-5b61-9eaf-d3b9-42bd3e75f9d0@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=rtgu=ie=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fJHTd-000687-1N
 for xen-devel@lists.xenproject.org; Thu, 17 May 2018 11:53:45 +0000
In-Reply-To: <0e3018de-5b61-9eaf-d3b9-42bd3e75f9d0@suse.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Juergen Gross <jgross@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE3LjA1LjE4IGF0IDEzOjQ5LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBPbiAx
Ny8wNS8xOCAxMjo0NCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDE3LjA1LjE4IGF0IDEx
OjQ4LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+Pj4gVGhlIGZ1bmN0aW9uIGlzIHN1
cHBvc2VkIHRvIHJldHVybiB3aGV0aGVyIHRoZSBNVFJSIGFuZCBQQVQgc3RhdGUgb2YKPj4+IHR3
byBDUFVzIG1hdGNoLiBDdXJyZW50bHkgdGhpcyBpcyBub3QgcHJvcGVybHkgZG9uZSBiZWNhdXNl
IHRoZSB0ZXN0Cj4+PiBmb3IgdGhlIGRlZnR5cGUgYW5kIHRoZSBlbmFibGUgYml0cyByZXF1aXJl
ZCBib3RoIHRoZSBkZWZ0eXBlIGFuZCB0aGUKPj4+IGVuYWJsZSBiaXRzIHRvIGJlIGRpZmZlcmVu
dCwgd2hpbGUganVzdCBvbmUgb2YgdGhvc2UgZmllbGRzIGJlaW5nCj4+PiBkaWZmZXJlbnQgY2Fu
IGFscmVhZHkgY2F1c2UgdGhlIE1UUlIgc3RhdGVzIG9uIHRoZSB2Q1BVIHRvIG5vdCBtYXRjaC4K
Pj4+Cj4+PiBGaXggdGhpcyBieSBjaGFuZ2luZyB0aGUgQU5EIGludG8gYW4gT1IgaW5zdGVhZCwg
c28gdGhhdCBlaXRoZXIgdGhlCj4+PiBkZWZ0eXBlIG9yIHRoZSBlbmFibGVkIGJpdHMgYmVpbmcg
ZGlmZmVyZW50IHdpbGwgY2F1c2UgdGhlIGZ1bmN0aW9uIHRvCj4+PiByZXR1cm4gbWlzbWF0Y2hp
bmcgc3RhdGUuCj4+IAo+PiBUaGlzIGlzIGJ5IGZhciBub3QgZW5vdWdoLCBidXQgSSBkaWRuJ3Qg
dmlldyB0aGUgZnVuY3Rpb24gYXMgY3JpdGljYWwKPj4gZW5vdWdoIHRvIHdhcnJhbnQgc2VuZGlu
ZyBvdXQgdGhlIHBhdGNoIEkgaGF2ZSByaWdodCBhd2F5Lgo+PiAKPj4gSmFuCj4+IHg4Ni9IVk06
IGNvcnJlY3QgbXRycl9wYXRfbm90X2VxdWFsKCkKPj4gCj4+IFRoZSB0d28gdkNQVS1zIGRpZmZl
cnJpbmcgaW4gTVRSUi1lbmFibGVkIHN0YXRlIG1lYW5zIE1UUlIgc2V0dGluZ3MgYXJlCj4+IG5v
dCBlcXVhbC4gQm90aCB2Q1BVLXMgaGF2aW5nIE1UUlJzIGRpc2FibGVkIG1lYW5zIG9ubHkgUEFU
IG5lZWRzIHRvIGJlCj4+IGNvbXBhcmVkLiBBbG9uZyB0aG9zZSBsaW5lcyBmb3IgZml4ZWQgcmFu
Z2UgTVRSUnMuIERpZmZlcnJpbmcgdmFyaWFibGUKPj4gcmFuZ2UgY291bnRzIGxpa2V3aXNlIG1l
YW4gc2V0dGluZ3MgYXJlIGRpZmZlcmVudCBvdmVyYWxsLgo+PiAKPj4gQ29uc3RpZnkgdHlwZXMg
YW5kIGNvbnZlcnQgYm9vbF90IHRvIGJvb2wuCj4+IAo+PiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4gCj4gTXkgUmFiIHRhZyBmb3IgUm9nZXIncyBwYXRj
aCBpcyBhcHBsaWNhYmxlIGhlcmUsIHRvbzoKPiAKPiBSZWxlYXNlLWFja2VkLWJ5OiBKdWVyZ2Vu
IEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+CgpUaGFua3MsIGJ1dCB0aGF0IGRlcGVuZHMgb24gd2hl
dGhlciBBbmRyZXcgaXMgd2lsbGluZyB0byBhY2sgdGhlCnBhdGNoICh3aXRoIG9yIHdpdGhvdXQg
bWlub3IgbW9kaWZpY2F0aW9ucykuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
