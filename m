From: Tim Deegan <tim@xen.org>
Subject: Re: [PATCH 2/6] x86/shadow: remove pointless loops over
	all vCPU-s
Date: Wed, 20 Dec 2017 08:06:45 +0000
Message-ID: <20171220080645.GC76516@deinos.phlegethon.org>
References: <5A2FFB8D0200007800196DDF@prv-mh.provo.novell.com>
 <5A2FFE530200007800196E01@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=t+nq=dq=xen.org=tim@srs-us1.protection.inumbo.net>)
 id 1eRZOu-0002tG-O1
 for xen-devel@lists.xenproject.org; Wed, 20 Dec 2017 08:06:52 +0000
Content-Disposition: inline
In-Reply-To: <5A2FFE530200007800196E01@prv-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

QXQgMDg6MDUgLTA3MDAgb24gMTIgRGVjICgxNTEzMDY1OTM5KSwgSmFuIEJldWxpY2ggd3JvdGU6
Cj4gVGhlIHZDUFUgY291bnQgY2FuIGJlIGhhZCBtb3JlIGRpcmVjdGx5Lgo+IAo+IFNpZ25lZC1v
ZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCkFja2VkLWJ5OiBUaW0gRGVl
Z2FuIDx0aW1AeGVuLm9yZz4KCj4gSW4gdGhlIHNoX21ha2Vfc2hhZG93KCkgY2FzZSB0aGUgcXVl
c3Rpb24gaXMgd2hldGhlciBpdCByZWFsbHkgd2FzCj4gaW50ZW5kZWQgdG8gY291bnQgYWxsIHZD
UFUtcywgcmF0aGVyIHRoYW4gZS5nLiBvbmx5IGFsbCBpbml0aWFsaXplZAo+IG9uZXMuIEkgZ3Vl
c3MgdGhlIHByb2JsZW0gd291bGQgYmUgdGhlIHBoYXNlIGJlZm9yZSB0aGUgZ3Vlc3QKPiBhY3R1
YWxseSBzdGFydHMgc2Vjb25kYXJ5IHByb2Nlc3NvcnMsIGJ1dCB0aGF0IGNvdWxkIHBlcmhhcHMg
YmUKPiBjb3ZlcmVkIGJ5IHVzaW5nIC0+bWF4X3ZjcHVzIGlmIG90aGVyd2lzZSAxIHdvdWxkIHJl
c3VsdC4KClllcywgdGhlIGludGVudGlvbiB3YXMgdG8gY291bnQgJ2FjdGl2ZScgdmNwdXMgaW4g
Ym90aCBjYXNlcy4gIEknbSBPSwp3aXRoIHRoZSBjaGFuZ2UgdGhvdWdoLCBhbmQgSSBkb24ndCB0
aGluayBpdCdzIHdvcnRoIG1ha2luZyB0aGluZ3MgYW55Cm1vcmUgY29tcGxleCBoZXJlLgoKQ2hl
ZXJzLAoKVGltLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
