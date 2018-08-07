From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 6/9] x86: move memory_type_changed to mm.c
Date: Tue, 07 Aug 2018 05:33:35 -0600
Message-ID: <5B69838F02000078001DB82F@prv1-mh.provo.novell.com>
References: <cover.3198a0d9ad2683b74afcc86654a244d17cd8795e.1533636027.git-series.wei.liu2@citrix.com>
 <305664028519f455e05c99c9b1a5c580a0f52ecc.1533636027.git-series.wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=hjto=kw=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fn0F9-0005jd-4t
 for xen-devel@lists.xenproject.org; Tue, 07 Aug 2018 11:33:39 +0000
In-Reply-To: <305664028519f455e05c99c9b1a5c580a0f52ecc.1533636027.git-series.wei.liu2@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA3LjA4LjE4IGF0IDEyOjAwLCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
VGhpcyBmdW5jdGlvbiBpcyBjb21tb24gdG8gYm90aCBQViBhbmQgSFZNLiBNb3ZlIGl0IHRvIHg4
NiBjb21tb24KPiBjb2RlLgoKSSdtIGFmcmFpZCB0aGF0J3MgdGhlIHdyb25nIHdheSByb3VuZDog
cDJtX21lbW9yeV90eXBlX2NoYW5nZWQoKQppcyBIVk0gKGluIGZhY3QgRVBUKSBzcGVjaWZpYy4g
VGhlIG9ubHkgdXNlcyBvZiB0aGUgZnVuY3Rpb24gdGhhdCBhcmVuJ3QKYWxyZWFkeSBIVk0tc3Bl
Y2lmaWMgYXJlIGZyb20gZG9tY3RsLmMgYW5kIGZyb20gaW9tbXVfY29uc3RydWN0KCksCnlldCBJ
IGRvdWJ0IHRoZSBmbHVzaF9hbGwoRkxVU0hfQ0FDSEUpIGhhcyBhbnkgcmVsZXZhbmNlIHRoZXJl
IGluCnRoZSBQViBjYXNlLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
