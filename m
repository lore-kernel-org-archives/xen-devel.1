From: "Jan Beulich" <jbeulich@suse.com>
Subject: Re: [PATCH 2/6] xen/sched: Use %*pb[l] instead of
 cpumask_scn{, list}printf()
Date: Mon, 10 Sep 2018 00:39:48 -0600
Message-ID: <5B9611B4020000780013C87B@prv1-mh.provo.novell.com>
References: <1536235696-31359-1-git-send-email-andrew.cooper3@citrix.com>
 <1536235696-31359-3-git-send-email-andrew.cooper3@citrix.com>
 <5B9230E702000078001E62FC@prv1-mh.provo.novell.com>
 <72e89500-dcfc-7d61-cc2f-c5b9401ebfe5@citrix.com>
 <5B92967202000078001E6727@prv1-mh.provo.novell.com>
 <043f38b7-df9f-d4d6-0ddd-31a843dd62b6@citrix.com>
 <5B929F1002000078001E67B5@prv1-mh.provo.novell.com>
 <baf91ce9-4dad-8f32-d84e-2e305734363f@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <baf91ce9-4dad-8f32-d84e-2e305734363f@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: andrew.cooper3@citrix.com, george.dunlap@citrix.com
Cc: George.Dunlap@eu.citrix.com, Robert.VanVossen@dornerworks.com, Dario Faggioli <dfaggioli@suse.com>, josh.whitehead@dornerworks.com, mengxu@cis.upenn.edu, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+IDA5LzA3LzE4IDY6
MDggUE0gPj4+Cj5PbiAwNy8wOS8xOCAxNjo1MywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9u
IDA3LjA5LjE4IGF0IDE3OjM1LCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPiB3cm90ZToKPj4+
IEkgdG9vayBBbmR5J3MgIkl0c1tzaWNdIGJhcmVseSB1c2VkIiBjb21tZW50IHRvIG1lYW4gdGhl
cmUgd2VyZSBsb3RzIG9mCj4+PiBvdGhlciBwbGFjZXMgd2hpY2ggYWxzbyBqdXN0IHBhc3NlZCBh
IGNwdW1hc2tfdCBwb2ludGVyIGRpcmVjdGx5IGludG8KPj4+IHNvbWV0aGluZyBleHBlY3Rpbmcg
YSBiaXRtYXAuICBJZiBhbGwgb3RoZXIgdXNlIGNhc2VzIGVpdGhlciB1c2UKPj4+IGNwdW1hc2tf
Yml0cygpIG9yIC0+Yml0cywgdGhlbiB3ZSBzaG91bGQgZG8gdGhlIHNhbWUgaGVyZS4gIElmIHRo
ZXJlIGFyZQo+Pj4gbG90cyBvZiBwbGFjZXMgd2hlcmUgd2UgYXNzdW1lICh2b2lkICopbWFzayA9
PSAodm9pZCAqKW1hc2stPmJpdHMsIHRoZW4KPj4+IHdlIHNob3VsZCBwcm9iYWJseSBkb2N1bWVu
dCB0aGF0IHRoZSBzdHJ1Y3R1cmUgc2hvdWxkIG1hdGNoIHRoYXQgKGFuZAo+Pj4gbWF5YmUgYWRk
IGEgQlVJTERfQlVHX09OKCkgaWYgd2UgY2FuIG1hbmFnZSBpdCkuCj4+IEknbSB1bmF3YXJlIG9m
IHBsYWNlcyB3aGljaCBkb24ndCBnbyB0aHJvdWdoIC0+Yml0cy4KPgo+QWxsIHRoZSBwcmludGlu
Zywgc2VlaW5nIGFzIEkgZGlkbid0IGhpdCBhIHNpbmdsZSBjcHVtYXNrX2JpdHMoKSBpbiB0aGlz
Cj5zZXJpZXMuCgpUaGF0J3MgYWxsIGJlY2F1c2Ugb2YgLi4uCgoKPlRoZSBjcHVtYXNrIGluZnJh
c3RydWN0dXJlIGl0c2VsZiB1c2VzIC0+Yml0cywgd2hpY2ggaXMgbGVzcyB2ZXJib3NlCj50aGFu
IHRoZSBoZWxwZXIuCgouLi4gaXQncyBwYXJ0IG9mIHRoZSBjcHVtYXNrIGltcGxlbWVudGF0aW9u
LiBUaGUgaGVscGVyIHJlYWxseSBpcyAoaW1vKSBmb3IKY29kZSB0aGF0J3Mgbm90IHBhcnQgb2Yg
dGhlIGNwdW1hc2sgaW5mcmFzdHJ1Y3R1cmUsIGkuZS4gaW4gcGFydGljdWxhciBjYXNlcwpsaWtl
IHRoZSBvbmVzIHlvdSBhZGQuCgoKSmFuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
