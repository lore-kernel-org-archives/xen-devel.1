From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v10 05/11] x86/entry: Organise the use of
 MSR_SPEC_CTRL at each entry/exit point
Date: Thu, 25 Jan 2018 14:46:47 +0000
Message-ID: <bb06b5ec-109e-990a-86f1-49fac635547d@citrix.com>
References: <1516799535-5778-1-git-send-email-andrew.cooper3@citrix.com>
 <1516799535-5778-6-git-send-email-andrew.cooper3@citrix.com>
 <5A69E4CA02000078001A25D4@prv-mh.provo.novell.com>
 <7b4f1324-d60b-8fba-35dc-8f6db949b5df@citrix.com>
 <5A69F99102000078001A2685@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5A69F99102000078001A2685@prv-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gMjUvMDEvMTggMTQ6MzYsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDI1LjAxLjE4IGF0
IDE1OjEyLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4+IE9uIDI1LzAxLzE4
IDEzOjA4LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+IEl0IG1heSBhbHNvIGJlIHdvcnRod2hpbGUg
YWdhaW4gdG8gcHVsbCB1cCB0aGUgemVyb2luZyBvZiAlZWR4LAo+Pj4gdXNpbmcgJWRsIGluc3Rl
YWQgb2YgJDAgaW4gdGhlIG1vdmIgKGFuZCBtYXliZSB0aGVuIGFsc28KPj4+IHNpbWlsYXJseSBp
biBET19TUEVDX0NUUkxfRVhJVF9UT19YRU4sIGJ1dCB0aGVyZSBJJ20gbGVzcwo+Pj4gY2VydGFp
biBpdCBjb3VsZG4ndCBoYXZlIGEgbmVnYXRpdmUgZWZmZWN0KS4KPj4gV2hhdCBuZWdhdGl2ZSBl
ZmZlY3RzIGFyZSB5b3Ugd29ycmllZCBhYm91dD8gIFRoZXNlIG1hY3JvcyBhcmUgc2VsZgo+PiBj
b250YWluZWQuCj4gVGhlIHJlc3VsdCBvZiB0aGUgeG9yIHRoZW4gaXMgYW4gaW5wdXQgdG8gdGhl
IGNtcCwgd2hpY2ggbWF5IGJlCj4gb25lIGN5Y2xlIG1vcmUgbGF0ZW5jeSB0aGFuIHdpdGggdGhl
IGltbWVkaWF0ZSB6ZXJvLgoKV2h5P8KgIENtcCB3cml0ZXMgYWxsIGZsYWdzIGFuZCByZWFkcyBu
b25lIG9mIHRoZW0sIHNvIGRvZXNuJ3QgaGF2ZSBhbnkKZmxhZ3MgZGVwZW5kZW5jeSBvbiBlYXJs
aWVyIGluc3RydWN0aW9ucy4KCkl0IGlzIG9ubHkgaW5zdHJ1Y3Rpb25zIHdoaWNoIHBhcnRpYWxs
eSBwcmVzZXJ2ZSBvbGRlciBmbGFnIGJpdHMgKGFuZAp3aGVyZSB1bmRlZmluZWQgYmVoYXZpb3Vy
IGlzIGNvbXBsaWNhdGVkKSB3aGljaCBzdWZmZXIgZmxhZ3MtbWVyZ2UKcGVuYWx0aWVzLgoKfkFu
ZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
