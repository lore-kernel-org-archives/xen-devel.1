From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 1/3] x86/pvh-dom0: Remove unnecessary
 function pointer call from modify_identity_mmio()
Date: Wed, 23 Jan 2019 04:22:06 -0700
Message-ID: <5C484E5E0200007800210528@prv1-mh.provo.novell.com>
References: <1548085041-23786-1-git-send-email-andrew.cooper3@citrix.com>
 <1548085041-23786-2-git-send-email-andrew.cooper3@citrix.com>
 <20190121155233.h32aari3tvmzziy7@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20190121155233.h32aari3tvmzziy7@zion.uk.xensource.com>
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
Cc: Juergen Gross <jgross@suse.com>, Xen-devel <xen-devel@lists.xen.org>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIxLjAxLjE5IGF0IDE2OjUyLCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
T24gTW9uLCBKYW4gMjEsIDIwMTkgYXQgMDM6Mzc6MTlQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPj4gRnVuY3Rpb24gcG9pbnRlciBjYWxscyBhcmUgZmFyIG1vcmUgZXhwZW5zaXZlIGlu
IGEgcG9zdC1TcGVjdHJlIHdvcmxkLCBhbmQKPj4gdGhpcyBvbmUgZG9lc24ndCBuZWVkIHRvIGJl
Lgo+PiAKPj4gTm8gZnVuY3Rpb25hbCBjaGFuZ2UuCj4+IAo+PiBTaWduZWQtb2ZmLWJ5OiBBbmRy
ZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgo+IAo+IFJldmlld2VkLWJ5OiBX
ZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgoKQWNrZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1
bGljaEBzdXNlLmNvbT4KCkFyZ3VhYmx5IGEgY29tcGlsZXIgY291bGQgYmUgaW50ZWxsaWdlbnQg
ZW5vdWdoIHRvIHVzZSBkaXJlY3QgY2FsbHMKZGVzcGl0ZSB0aGUgPzogY29uc3RydWN0LCB0aG91
Z2guCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
