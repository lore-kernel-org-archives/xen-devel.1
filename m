From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v9 0/9] xen/x86: various XPTI speedups
Date: Fri, 4 May 2018 15:59:35 +0100
Message-ID: <20180504145935.aoz77ude4ufmjmuf@citrix.com>
References: <20180426113318.21838-1-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=lzaf=hx=citrix.com=prvs=6550d3289=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fEcBQ-0004Sw-C7
 for xen-devel@lists.xenproject.org; Fri, 04 May 2018 14:59:40 +0000
Content-Disposition: inline
In-Reply-To: <20180426113318.21838-1-jgross@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, tim@xen.org, Wei Liu <wei.liu2@citrix.com>, jbeulich@suse.com, andrew.cooper3@citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBBcHIgMjYsIDIwMTggYXQgMDE6MzM6MDlQTSArMDIwMCwgSnVlcmdlbiBHcm9zcyB3
cm90ZToKPiBKdWVyZ2VuIEdyb3NzICg5KToKPiAgIHg4Ni94cHRpOiBhdm9pZCBjb3B5aW5nIEw0
IHBhZ2UgdGFibGUgY29udGVudHMgd2hlbiBwb3NzaWJsZQo+ICAgeGVuL3g4NjogYWRkIGEgZnVu
Y3Rpb24gZm9yIG1vZGlmeWluZyBjcjMKPiAgIHhlbi94ODY6IHN1cHBvcnQgcGVyLWRvbWFpbiBm
bGFnIGZvciB4cHRpCj4gICB4ZW4veDg2OiB1c2UgaW52cGNpZCBmb3IgZmx1c2hpbmcgdGhlIFRM
Qgo+ICAgeGVuL3g4NjogZGlzYWJsZSBnbG9iYWwgcGFnZXMgZm9yIGRvbWFpbnMgd2l0aCBYUFRJ
IGFjdGl2ZQo+ICAgeGVuL3g4NjogdXNlIGZsYWcgYnl0ZSBmb3IgZGVjaXNpb24gd2hldGhlciB4
ZW5fY3IzIGlzIHZhbGlkCj4gICB4ZW4veDg2OiBjb252ZXJ0IHB2X2d1ZXN0X2NyNF90b19yZWFs
X2NyNCgpIHRvIGEgZnVuY3Rpb24KPiAgIHhlbi94ODY6IGFkZCBzb21lIGNyMyBoZWxwZXJzCj4g
ICB4ZW4veDg2OiB1c2UgUENJRCBmZWF0dXJlCgpUaGVyZSBhcmUgY29uZmxpY3RzIGluIHhlbi1j
b21tYW5kLWxpbmUuIEkgZml4ZWQgdGhlbSB1cCBhbmQgcHVzaGVkIHRoaXMKc2VyaWVzIHRvIHN0
YWdpbmcuIFBsZWFzZSBjaGVjayBpZiB0aGUgcmVzdWx0IGlzIGNvcnJlY3QuCgpXZWkuCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
