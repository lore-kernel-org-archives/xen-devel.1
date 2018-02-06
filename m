From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] x86/boot: Make alternative patching NMI-safe
Date: Tue, 06 Feb 2018 02:45:36 -0700
Message-ID: <5A79875002000078001A590F@prv-mh.provo.novell.com>
References: <1517826298-5607-1-git-send-email-andrew.cooper3@citrix.com>
 <5A7873A402000078001A543F@prv-mh.provo.novell.com>
 <511f8443-2f21-c288-defe-9a7dbfa91f48@citrix.com>
 <5A78925C02000078001A55A9@prv-mh.provo.novell.com>
 <b4d97216-69b7-18cc-3e6c-17dc40b9cb0e@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <b4d97216-69b7-18cc-3e6c-17dc40b9cb0e@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA1LjAyLjE4IGF0IDE5OjA0LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gQnV0IGFzIHlvdSBjb3JyZWN0bHkgcG9pbnRlZCBvdXQsIGl0IHdhcyBhIHZlcnkgbG9u
ZyB3YXkgZnJvbSBiZWluZwo+IGNvbXBsZXRlLiAgV2UgY3VycmVudGx5IGhhdmUgbm8gaWRlYSB3
aGV0aGVyIHdlIGFyZSBpbiBOTUkgY29udGV4dCwgc28KPiBhcnJhbmdpbmcgbm90IHRvIG5vdCBl
eGVjdXRlIGFuIGlyZXQgaXMgaGFyZC4KCkFzIGxvbmcgYXMgd2UgZG9uJ3QgbWVhbiB0byBwYXRj
aCBleHRyZW1lbHkgZWFybHkgb3IgZXh0cmVtZWx5CmxhdGUgcGFydHMgb2YgdGhlIGhhbmRsZXIs
IHdoeSBjb3VsZG4ndCB0aGUgTk1JIGhhbmRsZXIgc2V0IGEgZmxhZwoob3IgaW5jcmVtZW50IHNv
bWUgc29ydCBvZiBjb3VudGVyOyBwZXJoYXBzIGluIHN0cnVjdCBjcHVfaW5mbyksCndoaWNoIHRo
ZSBleGl0IHBhdGggaW5zcGVjdHMgKGFuZCBjbGVhcnMgdW5kZXIgdGhlIGFwcHJvcHJpYXRlCmNv
bmRpdGlvbnMpPwoKSmFuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
