From: "Srivatsa S. Bhat" <srivatsa@csail.mit.edu>
Subject: Re: [RESEND] Spectre-v2 (IBPB/IBRS) and SSBD fixes for
 4.4.y
Date: Mon, 23 Jul 2018 10:27:10 -0700
Message-ID: <6473ed58-ed67-82a0-0781-20ac7275be0e@csail.mit.edu>
References: <153156030832.10043.13438231886571087086.stgit@srivatsa-ubuntu>
 <20180723112624.GA29710@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=8hlv=kh=csail.mit.edu=srivatsa@srs-us1.protection.inumbo.net>)
 id 1fhedG-0001ys-7M
 for xen-devel@lists.xenproject.org; Mon, 23 Jul 2018 17:28:26 +0000
In-Reply-To: <20180723112624.GA29710@kroah.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Dave Hansen <dave@sr71.net>, Wanpeng Li <kernellwp@gmail.com>, ak@linux.intel.com, linux-tip-commits@vger.kernel.org, Piotr Luc <piotr.luc@intel.com>, Mel Gorman <mgorman@suse.de>, arjan.van.de.ven@intel.com, xen-devel@lists.xenproject.org, Alexander Sergeyev <sergeev917@gmail.com>, Brian Gerst <brgerst@gmail.com>, Andy Lutomirski <luto@kernel.org>, =?UTF-8?B?TWlja2HDq2xTYWxhw7xu?= <mic@digikod.net>, Thomas Gleixner <tglx@linutronix.de>, Joe Konno <joe.konno@linux.intel.com>, Laura Abbott <labbott@fedoraproject.org>, Will Drewry <wad@chromium.org>, Jiri Kosina <jkosina@suse.cz>, linux-kernel@vger.kernel.org, Jia Zhang <qianyue.zj@alibaba-inc.com>, Andrew Morton <akpm@linux-foundation.org>, torvalds@linux-foundation.org, dwmw@amazon.co.uk, karahmed@amazon.de, dave.hansen@linux.intel.com, linux@dominikbrodowski.net, Bo Gan <ganb@vmware.com>, Andrey Ryabinin <ryabinin.a.a@>
List-Id: xen-devel@lists.xenproject.org

T24gNy8yMy8xOCA0OjI2IEFNLCBHcmVnIEtIIHdyb3RlOgo+IE9uIFNhdCwgSnVsIDE0LCAyMDE4
IGF0IDAyOjI1OjQzQU0gLTA3MDAsIFNyaXZhdHNhIFMuIEJoYXQgd3JvdGU6Cj4+IEhpIEdyZWcs
Cj4+Cj4+IFRoaXMgcGF0Y2ggc2VyaWVzIGlzIGEgYmFja3BvcnQgb2YgdGhlIFNwZWN0cmUtdjIg
Zml4ZXMgKElCUEIvSUJSUykKPj4gYW5kIHBhdGNoZXMgZm9yIHRoZSBTcGVjdWxhdGl2ZSBTdG9y
ZSBCeXBhc3MgdnVsbmVyYWJpbGl0eSB0byA0LjQueQo+PiAodGhleSBhcHBseSBjbGVhbmx5IG9u
IHRvcCBvZiA0LjQuMTQwKS4KPj4KPj4gSSB1c2VkIDQuOS55IGFzIG15IHJlZmVyZW5jZSB3aGVu
IGJhY2twb3J0aW5nIHRvIDQuNC55IChhcyBJIHRob3VnaHQKPj4gdGhhdCB3b3VsZCBtaW5pbWl6
ZSB0aGUgYW1vdW50IG9mIGZpeGluZyB1cCBuZWNlc3NhcnkpLiBVbmZvcnR1bmF0ZWx5Cj4+IEkg
aGFkIHRvIHNraXAgdGhlIEtWTSBmaXhlcyBmb3IgdGhlc2UgdnVsbmVyYWJpbGl0aWVzLCBhcyB0
aGUgS1ZNCj4+IGNvZGViYXNlIGlzIGRyYXN0aWNhbGx5IGRpZmZlcmVudCBpbiA0LjQgYXMgY29t
cGFyZWQgdG8gNC45LiAoSSB0cmllZAo+PiBteSBiZXN0IHRvIGJhY2twb3J0IHRoZW0gaW5pdGlh
bGx5LCBidXQgd2Fzbid0IGNvbmZpZGVudCB0aGF0IHRoZXkKPj4gd2VyZSBjb3JyZWN0LCBzbyBJ
IGRlY2lkZWQgdG8gZHJvcCB0aGVtIGZyb20gdGhpcyBzZXJpZXMpLgo+Pgo+PiBZb3UnbGwgbm90
aWNlIHRoYXQgdGhlIGluaXRpYWwgZmV3IHBhdGNoZXMgaW4gdGhpcyBzZXJpZXMgaW5jbHVkZQo+
PiBjbGVhbnVwcyBldGMuLCB0aGF0IGFyZSBub24tY3JpdGljYWwgdG8gSUJQQi9JQlJTL1NTQkQu
IE1vc3Qgb2YgdGhlc2UKPj4gcGF0Y2hlcyBhcmUgYWltZWQgYXQgZ2V0dGluZyB0aGUgY3B1ZmVh
dHVyZS5oIHZzIGNwdWZlYXR1cmVzLmggc3BsaXQKPj4gaW50byA0LjQsIHNpbmNlIGEgbG90IG9m
IHRoZSBzdWJzZXF1ZW50IHBhdGNoZXMgdXBkYXRlIHRoZXNlIGhlYWRlcnMuCj4+IE9uIG15IGZp
cnN0IGF0dGVtcHQgdG8gYmFja3BvcnQgdGhlc2UgcGF0Y2hlcyB0byA0LjQueSwgSSBoYWQgYWN0
dWFsbHkKPj4gdHJpZWQgdG8gZG8gYWxsIHRoZSB1cGRhdGVzIG9uIHRoZSBjcHVmZWF0dXJlLmgg
ZmlsZSBpdHNlbGYsIGJ1dCBpdAo+PiBzdGFydGVkIGdldHRpbmcgdmVyeSBjdW1iZXJzb21lLCBz
byBJIHJlc29ydGVkIHRvIGJhY2twb3J0aW5nIHRoZQo+PiBjcHVmZWF0dXJlLmggdnMgY3B1ZmVh
dHVyZXMuaCBzcGxpdCBhbmQgdGhlaXIgZGVwZW5kZW5jaWVzIGFzIHdlbGwuIEkKPj4gdGhpbmsg
YXBhcnQgZnJvbSB0aGVzZSBpbml0aWFsIHBhdGNoZXMsIHRoZSByZXN0IG9mIHRoZSBwYXRjaHNl
dAo+PiBkb2Vzbid0IGhhdmUgYWxsIHRoYXQgbXVjaCBub2lzZS4gCj4+Cj4+IFRoaXMgcGF0Y2hz
ZXQgaGFzIGJlZW4gdGVzdGVkIG9uIGJvdGggSW50ZWwgYW5kIEFNRCBtYWNoaW5lcyAoSW50ZWwK
Pj4gWGVvbiBDUFUgRTUtMjY2MCB2NCBhbmQgQU1EIEVQWUMgNzI4MSAxNi1Db3JlIFByb2Nlc3Nv
ciwgcmVzcGVjdGl2ZWx5KQo+PiB3aXRoIHVwZGF0ZWQgbWljcm9jb2RlLiBBbGwgdGhlIHBhdGNo
IGJhY2twb3J0cyBoYXZlIGJlZW4KPj4gaW5kZXBlbmRlbnRseSByZXZpZXdlZCBieSBNYXR0IEhl
bHNsZXksIEFsZXhleSBNYWtoYWxvdiBhbmQgQm8gR2FuLgo+Pgo+PiBJIHdvdWxkIGFwcHJlY2lh
dGUgaWYgeW91IGNvdWxkIGtpbmRseSBjb25zaWRlciB0aGVzZSBwYXRjaGVzIGZvcgo+PiByZXZp
ZXcgYW5kIGluY2x1c2lvbiBpbiBhIGZ1dHVyZSA0LjQueSByZWxlYXNlLgo+IAo+IEdpdmVuIG5v
IG9uZSBoYXMgY29tcGxhaW5lZCBhYm91dCB0aGVzZSB5ZXQsIEkndmUgcXVldWVkIHRoZW0gYWxs
IHVwLAo+IGluY2x1ZGluZyB0aGUgMiBleHRyYSBvbmVzIHlvdSBzZW50IGFmdGVyd2FyZC4KPgpH
cmVhdCEgVGhhbmsgeW91IHZlcnkgbXVjaCEKCj4gTGV0J3Mgc2VlIHdoYXQgYnJlYWtzIDopCj4g
CgpIZWhlIDopCgpSZWdhcmRzLApTcml2YXRzYQpWTXdhcmUgUGhvdG9uIE9TCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
