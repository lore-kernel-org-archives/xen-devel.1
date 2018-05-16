From: "Jan Beulich" <JBeulich@suse.com>
Subject: backporting considerations (Re: [PATCH v9 0/9] xen/x86:
 various XPTI speedups)
Date: Wed, 16 May 2018 03:06:06 -0600
Message-ID: <5AFBF47E02000078001C3211@prv1-mh.provo.novell.com>
References: <20180426113318.21838-1-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=iqfx=id=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fIsNw-0004W8-8m
 for xen-devel@lists.xenproject.org; Wed, 16 May 2018 09:06:12 +0000
In-Reply-To: <20180426113318.21838-1-jgross@suse.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI2LjA0LjE4IGF0IDEzOjMzLCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBKdWVy
Z2VuIEdyb3NzICg5KToKPiAgIHg4Ni94cHRpOiBhdm9pZCBjb3B5aW5nIEw0IHBhZ2UgdGFibGUg
Y29udGVudHMgd2hlbiBwb3NzaWJsZQo+ICAgeGVuL3g4NjogYWRkIGEgZnVuY3Rpb24gZm9yIG1v
ZGlmeWluZyBjcjMKPiAgIHhlbi94ODY6IHN1cHBvcnQgcGVyLWRvbWFpbiBmbGFnIGZvciB4cHRp
Cj4gICB4ZW4veDg2OiB1c2UgaW52cGNpZCBmb3IgZmx1c2hpbmcgdGhlIFRMQgo+ICAgeGVuL3g4
NjogZGlzYWJsZSBnbG9iYWwgcGFnZXMgZm9yIGRvbWFpbnMgd2l0aCBYUFRJIGFjdGl2ZQo+ICAg
eGVuL3g4NjogdXNlIGZsYWcgYnl0ZSBmb3IgZGVjaXNpb24gd2hldGhlciB4ZW5fY3IzIGlzIHZh
bGlkCj4gICB4ZW4veDg2OiBjb252ZXJ0IHB2X2d1ZXN0X2NyNF90b19yZWFsX2NyNCgpIHRvIGEg
ZnVuY3Rpb24KPiAgIHhlbi94ODY6IGFkZCBzb21lIGNyMyBoZWxwZXJzCj4gICB4ZW4veDg2OiB1
c2UgUENJRCBmZWF0dXJlCgpUaGlzIGJlaW5nIGEgcGVyZm9ybWFuY2UgaW1wcm92ZW1lbnQgcmF0
aGVyIHRoYW4gYSBwbGFpbiBidWcgZml4IHNlcmllcywKSSdtIG5vdCBlbnRpcmVseSBjZXJ0YWlu
IGFib3V0IGJhY2twb3J0aW5nIGhlcmUuIE15IGN1cnJlbnQgdGhpbmtpbmcgaXMgdG8KcHV0IHRo
aXMgaW50byA0LjEwIChKw7xyZ2VuIHdhcyBraW5kIGVub3VnaCB0byBkbyB0aGUgYmFja3BvcnRp
bmcgd29yawphbHJlYWR5KSwgYnV0IG5vdCBpbnRvIGFueSBvbGRlciB0cmVlcy4gT3RvaCBhdCBT
VVNFIHdlIGFscmVhZHkgaGF2ZQp0aGlzIGluIG91ciA0LjktYmFzZWQgYnJhbmNoIGFzIHdlbGws
IGFuZCBpZiBvdGhlciBjb25zdW1lcnMgb2YgdGhhdCBvcgp0aGUgNC44IGJyYW5jaCB3b3VsZCBt
b3N0bHkgYWdyZWUgaXQgc2hvdWxkIGdvIHRoZXJlLCBJIGNvdWxkIGNlcnRhaW5seQpiZSBjb252
aW5jZWQuIEl0IGlzIGltbyBvdXQgb2YgcXVlc3Rpb24gb2YgcHV0dGluZyBpdCBpbnRvIDQuNyBv
ciBvbGRlci4KCkphbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
