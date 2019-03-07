From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] trace: fix build with gcc9
Date: Thu, 07 Mar 2019 04:50:43 -0700
Message-ID: <5C810593020000780021C73D@prv1-mh.provo.novell.com>
References: <5C80F39B020000780021C629@prv1-mh.provo.novell.com>
 <f718d316-1085-81bb-09c9-2998e3008d42@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=9kmr=RK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1h1rY4-0007h6-5f
 for xen-devel@lists.xenproject.org; Thu, 07 Mar 2019 11:50:52 +0000
In-Reply-To: <f718d316-1085-81bb-09c9-2998e3008d42@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Juergen Gross <jgross@suse.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA3LjAzLjE5IGF0IDEyOjQwLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMDcvMDMvMjAxOSAxMDozNCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IFdoaWxlIEkn
dmUgbm90IG9ic2VydmVkIHRoaXMgbXlzZWxmLCBnY2MgOSAoaW1vIHZhbGlkbHkpIHJlcG9ydGVk
bHkgbWF5Cj4+IGNvbXBsYWluCj4+Cj4+IHRyYWNlLmM6IEluIGZ1bmN0aW9uICdfX3RyYWNlX2h5
cGVyY2FsbCc6Cj4+IHRyYWNlLmM6ODI2OjE5OiBlcnJvcjogdGFraW5nIGFkZHJlc3Mgb2YgcGFj
a2VkIG1lbWJlciBvZiAnc3RydWN0IDxhbm9ueW1vdXM+JyBtYXkgcmVzdWx0IGluIGFuIHVuYWxp
Z25lZCBwb2ludGVyIHZhbHVlCj4+IFstV2Vycm9yPWFkZHJlc3Mtb2YtcGFja2VkLW1lbWJlcl0K
Pj4gICA4MjYgfCAgICAgdWludDMyX3QgKmEgPSBkLmFyZ3M7Cj4+Cj4+IGFuZCB0aGUgZml4IGlz
IHJhdGhlciBzaW1wbGUgLSByZW1vdmUgdGhlIF9fcGFja2VkIGF0dHJpYnV0ZS4gSW50cm9kdWNl
Cj4+IGEgQlVJTERfQlVHX09OKCkgYXMgcmVwbGFjZW1lbnQsIGZvciB0aGUgdW5saWtlbHkgY2Fz
ZSB0aGF0IFhlbiBtaWdodAo+PiBnZXQgcG9ydGVkIHRvIGFuIGFyY2hpdGVjdHVyZSB3aGVyZSBh
cnJheSBhbGlnbm1lbnQgaGlnaGVyIHRoYXQgdGhhdCBvZgo+PiBpdHMgZWxlbWVudHMuCj4gCj4g
SSByZWFsbHkgZG9uJ3QgdGhpbmsgdGhlIEJVSUxEX0JVR19PTigpIGlzIGhlbHBmdWwuCj4gCj4g
U3VjaCBhIHRoZW9yZXRpY2FsIGFyY2hpdGVjdHVyZSB3aWxsIGFsbW9zdCBjZXJ0YWlubHkgaGF2
ZSBhIGNvbXBpbGVyCj4gdGhhdCBzcG90cyB0aGUgbWlzYWxpZ25tZW50LCBvciB3aWxsIHRha2Ug
YSB0cmFwIHRoZSBmaXJzdCB0aW1lIHhlbnRyYWNlCj4gaXMgZXZlciB1c2VkLgoKV2l0aCB0aGUg
X19wYWNrZWQgZ29uZSB0aGVyZSdzIG5vIG1pc2FsaWdubWVudCB0byBzcG90LiBTdWNoIGEKY29t
cGlsZXIgd291bGQgaW5zZXJ0IGEgcGFkZGluZyBmaWVsZCBpbnN0ZWFkLiBUaGVyZSB3b3VsZCBh
bHNvIGJlIG5vCnRyYXAsIHRoZSB0cmFjZSBkYXRhIGNvbnN1bWVyIHNpbXBseSB3b3VsZCB0YWtl
IDMyIGJpdHMgb2YgZ2FyYmFnZQpmb3IgYWN0dWFsIGRhdGEuCgpKYW4KCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
