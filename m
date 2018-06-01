From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH for-4.11] x86/traps: Fix error handling of
 the pv %dr7 shadow state
Date: Fri, 1 Jun 2018 20:53:30 +0200
Message-ID: <ae238125-f938-0077-cd78-b18f4aa291a4@suse.com>
References: <1527861963-15431-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1527861963-15431-1-git-send-email-andrew.cooper3@citrix.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xen.org>
Cc: Jan Beulich <JBeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDEvMDYvMTggMTY6MDYsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gYy9zICJ4ODYvcHY6IElu
dHJvZHVjZSBhbmQgdXNlIHg4NmVtdWxfd3JpdGVfZHIoKSIgZml4ZWQgYSBidWcgd2l0aCBJTyBz
aGFkb3cKPiBoYW5kbGluZywgaW4gdGhhdCBpdCByZW1haW5lZCBzdGFsZSBhbmQgdmlzaWJsZSB1
bnRpbCAlZHI3LkwvRyBnb3Qgc2V0IGFnYWluLgo+IAo+IEhvd2V2ZXIsIGl0IG5lZ2xlY3RlZCB0
aGUgLUVQRVJNIHJldHVybiBpbmJldHdlZW4gdGhlc2UgdHdvIGh1bmtzLCBpbnRyb2R1Y2luZwo+
IGEgZGlmZmVyZW50IGJ1ZyBpbiB3aGljaCBhIHdyaXRlIHRvICVkcjcgd2hpY2ggdHJpZXMgdG8g
c2V0IElPIGJyZWFrcG9pbnRzCj4gd2l0aG91dCAlY3I0LkRFIGJlaW5nIHNldCBjbG9iYmVycyB0
aGUgSU8gc3RhdGUsIHJhdGhlciB0aGFuIGxlYXZlcyBpdCBhbG9uZS4KPiAKPiBJbnN0ZWFkLCBt
b3ZlIHRoZSB6ZXJvaW5nIHNsaWdodGx5IGxhdGVyLCB3aGljaCBndWFyZW50ZWVzIHRoYXQgdGhl
IHNoYWRvdwo+IGdldHMgd3JpdHRlbiBleGFjdGx5IG9uY2UsIG9uIGEgc3VjY2Vzc2Z1bCB1cGRh
dGUgdG8gJWRyNy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29v
cGVyM0BjaXRyaXguY29tPgoKUmVsZWFzZS1hY2tlZC1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3Nz
QHN1c2UuY29tPgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
