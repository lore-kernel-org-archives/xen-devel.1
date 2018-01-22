From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v9 09/11] x86/ctxt: Issue a speculation
 barrier between vcpu contexts
Date: Mon, 22 Jan 2018 03:15:20 -0700
Message-ID: <5A65C7C802000078001A0FAC@prv-mh.provo.novell.com>
References: <1516290370-14958-1-git-send-email-andrew.cooper3@citrix.com>
 <1516290370-14958-10-git-send-email-andrew.cooper3@citrix.com>
 <5A61FFEF02000078001A0602@prv-mh.provo.novell.com>
 <f11f726d-c750-b604-4119-1734fb3391df@citrix.com>
 <5A6217AA02000078001A06CA@prv-mh.provo.novell.com>
 <1516446629.5087.94.camel@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1516446629.5087.94.camel@infradead.org>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIwLjAxLjE4IGF0IDEyOjEwLCA8ZHdtdzJAaW5mcmFkZWFkLm9yZz4gd3JvdGU6Cj4g
T24gRnJpLCAyMDE4LTAxLTE5IGF0IDA4OjA3IC0wNzAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4g
SSB1bmRlcnN0YW5kIHRoYXQsIGJ1dCB0aGVyZSB3YXMgbm8gZXhwbGFuYXRpb24gd2hhdHNvZXZl
ciBhcwo+PiB0byB3aHkgdGhhdCBpcy4KPiAKPiBMb29rcyBsaWtlIHdlIHNldCBwZXJfY3B1KGN1
cnJfdmNwdSk9bmV4dCBldmVyeSB0aW1lIHdlIHN3aXRjaCwgZXZlbiBpZgo+IHdlIGFyZSBzd2l0
Y2hpbmcgdG8gdGhlIGlkbGUgZG9tYWluLgoKSSBjYW4ndCBzZWUgdGhhdCAtIHRoZSBvbmx5IHBs
YWNlIGl0IGlzIGJlaW5nIHVwZGF0ZWQgaXMgYXQgdGhlIGVuZCBvZgpfX2NvbnRleHRfc3dpdGNo
KCksIHdoaWNoIGlzbid0IGJlaW5nIGNhbGxlZCBpbiB0aGUgbm9ybWFsIGNhc2UKd2hlbiBjb250
ZXh0X3N3aXRjaCgpIGZpbmRzIGlzX2lkbGVfZG9tYWluKG5leHRkKS4KCkphbgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
