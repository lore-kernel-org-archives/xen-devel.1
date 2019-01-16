From: Leo Yan <leo.yan@linaro.org>
Subject: Re: Hikey: Enable Xen + Mainline Linux Kernel
Date: Thu, 17 Jan 2019 07:24:36 +0800
Message-ID: <20190116232436.GA4165@leoy-ThinkPad-X240s>
References: <20190115024958.GC3971@leoy-ThinkPad-X240s>
 <20190115100532.GF3971@leoy-ThinkPad-X240s>
 <CAF3u54CtAtv3+53fuuTH_7XE9KVqoKNHmmyeWiykhaEt_BNExQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=oZey=PY=linaro.org=leo.yan@srs-us1.protection.inumbo.net>)
 id 1gjuY8-000059-B8
 for xen-devel@lists.xenproject.org; Wed, 16 Jan 2019 23:24:44 +0000
Received: by mail-ot1-x342.google.com with SMTP id i20so9479214otl.0
 for <xen-devel@lists.xenproject.org>; Wed, 16 Jan 2019 15:24:42 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <CAF3u54CtAtv3+53fuuTH_7XE9KVqoKNHmmyeWiykhaEt_BNExQ@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@gmail.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

SGkgSnVsaWVuLAoKT24gV2VkLCBKYW4gMTYsIDIwMTkgYXQgMDg6MTM6MjlQTSArMDAwMCwgSnVs
aWVuIEdyYWxsIHdyb3RlOgoKWy4uLl0KCj4gPiBTbyB4ZW5fZ2V0X2RtYV9vcHMoKSB3aWxsIHRy
eSB0byByZXRyaWV2ZSBwb2ludGVyIGZyb20KPiA+ICdkZXYtPmFyY2hkYXRhLmRldl9kbWFfb3Bz
JyBidXQgYmVjYXVzZSBpdCdzIE5VTEwgc28gYXQgdGhlIGVuZAo+ID4gaW50cm9kdWNlcyBrZXJu
ZWwgcGFuaWMgd2lsbCBOVUxMIHBvaW50ZXIuCj4gPgo+ID4gU2VlbXMgdG8gbWUsIHdlIHNob3Vs
ZCBjaGVjayB0d28gcG9pbnRlcnMgaW4gZG1hX2lzX2RpcmVjdCgpLCBvbmUKPiA+IGlzICdkZXYt
PmRtYV9vcHMnIGFuZCBhbm90aGVyIGlzICdkZXYtPmFyY2hkYXRhLmRldl9kbWFfb3BzJywgc2hv
dWxkCj4gPiBib3RoIG9mIHRoZW0gYXJlIG5vdCBOVUxMIHBvaW50ZXJzIHRoZW4gd2UgY2FuIHJ1
biBpbnRvIHhlbl9hbGxvY194eHgKPiA+IHJlbGF0ZWQgZnVuY3Rpb24sIG90aGVyd2lzZSBpdCBz
aG91bGQgZmFsbGJhY2sgdG8gdXNlCj4gPiBkbWFfZGlyZWN0X2FsbG9jKCkgdG8gYWxsb2NhdGUg
ZG1hIHBhZ2VzPwo+ID4KPiA+IEFsc28gdmVyeSB3ZWxjb21lIGlmIHlvdSBjb3VsZCB3b3JrIG9u
IGZvcm1hbCBmaXhpbmcgYW5kIGF0IG15IHNpZGUKPiA+IEkgYW0gZ2xhZCB0byB0ZXN0IGl0IQo+
IAo+IEkgYWN0dWFsbHkgcmVwb3J0ZWQgYSB2ZXJ5IHNpbWlsYXIgYnVnIG9uIGxpbnV4LWlvbW11
IHRvZGF5IFsxXS4gSXQgaGFwcGVucwo+IHRvIGJlIGFuIGlzc3VlIHdpdGggdGhlIHJlY2VudCBj
aGFuZ2UgaW4gdGhlIERNQSBBUEkuIFRoZSBJT01NVQo+IG1haW50YWluZXIgc3VnZ2VzdGVkIGEg
cGF0Y2ggdGhhdCBzaG91bGQgZml4IGJvdGggb2Ygb3VyIGlzc3Vlcy4KPiBJIGhhdmVuJ3QgeWV0
IHRyaWVkIHRoZSBwYXRjaCBbMl0uIFdvdWxkIHlvdSBtaW5kIHRvIGdpdmUgaXQgZ28/CgpUaGFu
a3MgZm9yIHRoZSBpbmZvLgoKVGVzdGVkIHdpdGggcGF0Y2ggWzJdIGF0IG15IHNpZGUgYW5kIGl0
IGRvZXMgZml4IG15IGlzc3VlIDopCgpUaGFua3MsCkxlbyBZYW4KCj4gWzFdIGh0dHBzOi8vbGlz
dHMueGVuLm9yZy9hcmNoaXZlcy9odG1sL3hlbi1kZXZlbC8yMDE5LTAxL21zZzAxMzUxLmh0bWwK
PiBbMl0gaHR0cHM6Ly9saXN0cy54ZW4ub3JnL2FyY2hpdmVzL2h0bWwveGVuLWRldmVsLzIwMTkt
MDEvbXNnMDEzNTguaHRtbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
