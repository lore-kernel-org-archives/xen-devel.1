From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: Ping: [PATCH] x86: improve vCPU selection in
 pagetable_dying()
Date: Tue, 25 Sep 2018 17:22:51 +0100
Message-ID: <15752d56-8300-698d-085a-6795bd75f634@citrix.com>
References: <5B96796B02000078001E6CF4@prv1-mh.provo.novell.com>
 <5BA0F33302000078001E9717@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=gmpq=mh=citrix.com=prvs=79922396b=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1g4qhQ-0002Vf-N7
 for xen-devel@lists.xenproject.org; Tue, 25 Sep 2018 17:00:36 +0000
In-Reply-To: <5BA0F33302000078001E9717@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, George Dunlap <George.Dunlap@eu.citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMTgvMDkvMTggMTM6NDQsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDEwLjA5LjE4IGF0
IDE2OjAyLCA8SkJldWxpY2hAc3VzZS5jb20+IHdyb3RlOgo+PiBSYXRoZXIgdGhhbiB1bmNvbmRp
dGlvbmFsbHkgdXNpbmcgdkNQVSAwLCB1c2UgdGhlIGN1cnJlbnQgdkNQVSBpZiB0aGUKPj4gc3Vi
amVjdCBkb21haW4gaXMgdGhlIGN1cnJlbnQgb25lLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBKYW4g
QmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpXaGF0IGltcHJvdmVtZW50IGlzIHRoaXMgaW50
ZW5kZWQgdG8gYnJpbmc/CgpTaGFkb3dzIGFyZSBwZXItZG9tYWluLCBhbmQgdGhlIGdtZm4gaW4g
cXVlc3Rpb24gaXMgcGFzc2VkIGluIGJ5IHRoZQpjYWxsZXIuwqAgQUZBQ0lULCBpdCBpcyBhIGxv
Z2ljYWwgYnVnIHRoYXQgdGhhdCB0aGUgY2FsbGJhY2sgdGFrZXMgYSB2Y3B1CnJhdGhlciB0aGFu
IGEgZG9tYWluIGluIHRoZSBmaXJzdCBwbGFjZS4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
