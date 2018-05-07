From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v3 2/2] SVM: introduce a VM entry helper
Date: Mon, 7 May 2018 08:31:18 +0200
Message-ID: <e75cb5d7-c764-bd73-8e68-d1e05b4deed3@suse.com>
References: <5AEC773002000078001C0BCE@prv1-mh.provo.novell.com>
 <5AEC782902000078001C0BEE@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=25p9=h2=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1fFZg8-0004Nm-IG
 for xen-devel@lists.xenproject.org; Mon, 07 May 2018 06:31:20 +0000
In-Reply-To: <5AEC782902000078001C0BEE@suse.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDQvMDUvMTggMTc6MTEsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE5laXRoZXIgdGhlIHJlZ2lz
dGVyIHZhbHVlcyBjb3B5aW5nIG5vciB0aGUgdHJhY2UgZW50cnkgZ2VuZXJhdGlvbiBuZWVkCj4g
ZG9pbmcgaW4gYXNzZW1ibHkuIFRoZSBWTUxPQUQgaW52b2NhdGlvbiBjYW4gYWxzbyBiZSBmdXJ0
aGVyIGRlZmVycmVkCj4gKGFuZCBjZW50cmFsaXplZCkuIFRoZXJlZm9yZSByZXBsYWNlIHRoZSBz
dm1fYXNpZF9oYW5kbGVfdm1ydW4oKQo+IGludm9jYXRpb24gd2l0aCBvbmUgb2YgdGhlIG5ldyBo
ZWxwZXIuCj4gCj4gU2ltaWxhcmx5IG1vdmUgdGhlIFZNIGV4aXQgc2lkZSByZWdpc3RlciB2YWx1
ZSBjb3B5aW5nIGludG8KPiBzdm1fdm1leGl0X2hhbmRsZXIoKS4KPiAKPiBOb3cgdGhhdCB3ZSBh
bHdheXMgbWFrZSBpdCBvdXQgdG8gZ3Vlc3QgY29udGV4dCBhZnRlciBWTUxPQUQsCj4gc3ZtX3N5
bmNfdm1jYigpIG5vIGxvbmdlciBvdmVycmlkZXMgdm1jYl9uZWVkc192bXNhdmUsIG1ha2luZwo+
IHN2bV92bWV4aXRfaGFuZGxlcigpIHNldHRpbmcgdGhlIGZpZWxkIGVhcmx5IHVubmVjZXNzYXJ5
Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KClJl
bGVhc2UtYWNrZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KCgpKdWVyZ2Vu
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
