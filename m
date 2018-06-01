From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH for-4.11] x86/traps: Fix error handling of
 the pv %dr7 shadow state
Date: Fri, 01 Jun 2018 09:41:20 -0600
Message-ID: <5B11692002000078001C78CF@prv1-mh.provo.novell.com>
References: <1527861963-15431-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1527861963-15431-1-git-send-email-andrew.cooper3@citrix.com>
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
Cc: Juergen Gross <jgross@suse.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAxLjA2LjE4IGF0IDE2OjA2LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gYy9zICJ4ODYvcHY6IEludHJvZHVjZSBhbmQgdXNlIHg4NmVtdWxfd3JpdGVfZHIoKSIg
Zml4ZWQgYSBidWcgd2l0aCBJTyBzaGFkb3cKPiBoYW5kbGluZywgaW4gdGhhdCBpdCByZW1haW5l
ZCBzdGFsZSBhbmQgdmlzaWJsZSB1bnRpbCAlZHI3LkwvRyBnb3Qgc2V0IGFnYWluLgo+IAo+IEhv
d2V2ZXIsIGl0IG5lZ2xlY3RlZCB0aGUgLUVQRVJNIHJldHVybiBpbmJldHdlZW4gdGhlc2UgdHdv
IGh1bmtzLCBpbnRyb2R1Y2luZwo+IGEgZGlmZmVyZW50IGJ1ZyBpbiB3aGljaCBhIHdyaXRlIHRv
ICVkcjcgd2hpY2ggdHJpZXMgdG8gc2V0IElPIGJyZWFrcG9pbnRzCj4gd2l0aG91dCAlY3I0LkRF
IGJlaW5nIHNldCBjbG9iYmVycyB0aGUgSU8gc3RhdGUsIHJhdGhlciB0aGFuIGxlYXZlcyBpdCBh
bG9uZS4KPiAKPiBJbnN0ZWFkLCBtb3ZlIHRoZSB6ZXJvaW5nIHNsaWdodGx5IGxhdGVyLCB3aGlj
aCBndWFyZW50ZWVzIHRoYXQgdGhlIHNoYWRvdwo+IGdldHMgd3JpdHRlbiBleGFjdGx5IG9uY2Us
IG9uIGEgc3VjY2Vzc2Z1bCB1cGRhdGUgdG8gJWRyNy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmRy
ZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoKUmV2aWV3ZWQtYnk6IEphbiBC
ZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
