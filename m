From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] x86/vmx: Avoid using
 domain_crash_syncrhonous() in vmx_vmentry_failure()
Date: Wed, 01 Aug 2018 07:11:12 -0600
Message-ID: <5B61B17002000078001D9E4F@prv1-mh.provo.novell.com>
References: <1533128106-5545-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1533128106-5545-1-git-send-email-andrew.cooper3@citrix.com>
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
Cc: Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAxLjA4LjE4IGF0IDE0OjU1LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gVGhlcmUgaXMgbm8gbmVlZCBmb3IgdGhlIHN5bmNyaG9ub3VzIHZhcmllbnQsIGFzIHRo
ZSB2bWVudHJ5IGZhaWx1cmUgcGF0aCBjYW4KPiBqdXN0IHJldHVybiB0byBwcm9jZXNzaW5nIHNv
ZnRpcnFzLgo+IAo+IFRoaXMgaXMgaW4gYWlkIG9mIHRyeWluZyB0byByZW1vdmUgZG9tYWluX2Ny
YXNoX3N5bmNyaG9ub3VzKCkgZnJvbSB0aGUKPiBjb2RlYmFzZS4KPiAKPiBTaWduZWQtb2ZmLWJ5
OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoKV2l0aCB0aGUgbmFt
ZSBvZiB0aGUgZnVuY3Rpb24gZml4ZWQgaW4gdGl0bGUgYW5kIGRlc2NyaXB0aW9uClJldmlld2Vk
LWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpKYW4KCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
