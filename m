From: Tim Deegan <tim@xen.org>
Subject: Re: [PATCH v3 25/25] x86/shadow: fold
 sh_x86_emulate_{write, cmpxchg}() into their only callers
Date: Mon, 5 Feb 2018 12:16:33 +0000
Message-ID: <20180205121633.GB33595@deinos.phlegethon.org>
References: <5A29550C020000780019585B@prv-mh.provo.novell.com>
 <5A295BE60200007800195997@prv-mh.provo.novell.com>
 <b5b83e68-fd48-d715-7e75-24e85dcdfbf3@citrix.com>
 <5A78270F02000078001A515D@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=q6hm=e7=xen.org=tim@srs-us1.protection.inumbo.net>)
 id 1eifhX-0001lC-9B
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2018 12:16:47 +0000
Content-Disposition: inline
In-Reply-To: <5A78270F02000078001A515D@prv-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

SGksCgpBdCAwMTo0MiAtMDcwMCBvbiAwNSBGZWIgKDE1MTc3OTQ5NTkpLCBKYW4gQmV1bGljaCB3
cm90ZToKPiA+Pj4gT24gMDIuMDIuMTggYXQgMTc6NTIsIDxhbmRyZXcuY29vcGVyM0BjaXRyaXgu
Y29tPiB3cm90ZToKPiA+IE9uIDA3LzEyLzE3IDE0OjE5LCBKYW4gQmV1bGljaCB3cm90ZToKPiA+
PiArICAgIGNhc2UgMTogcHJldiA9IGNtcHhjaGcoKHVpbnQ4X3QgICopcHRyLCBvbGQsIG5ldyk7
IGJyZWFrOwo+ID4+ICsgICAgY2FzZSAyOiBwcmV2ID0gY21weGNoZygodWludDE2X3QgKilwdHIs
IG9sZCwgbmV3KTsgYnJlYWs7Cj4gPj4gKyAgICBjYXNlIDQ6IHByZXYgPSBjbXB4Y2hnKCh1aW50
MzJfdCAqKXB0ciwgb2xkLCBuZXcpOyBicmVhazsKPiA+PiArICAgIGNhc2UgODogcHJldiA9IGNt
cHhjaGcoKHVpbnQ2NF90ICopcHRyLCBvbGQsIG5ldyk7IGJyZWFrOwo+ID4+ICsgICAgZGVmYXVs
dDoKPiA+PiArICAgICAgICBTSEFET1dfUFJJTlRLKCJjbXB4Y2hnIHNpemUgJXUgaXMgbm90IHN1
cHBvcnRlZFxuIiwgYnl0ZXMpOwo+ID4gCj4gPiBHaXZlbiB0aGUgZWFybGllciBwYXRjaGVzIGlu
IHRoZSBzZXJpZXMsIGlzIGl0IHdvcnRoIGludHJvZHVjaW5nIGNhc2UgMTYKPiA+IGhlcmU/Cj4g
Cj4gSW4gYSBmb2xsb3ctdXAgcGF0Y2ggdGhpcyBjb3VsZCBiZSBhbiBvcHRpb24gKHVubGVzcyBU
aW0ga25vd3MgYQo+IHJlYXNvbiB3aHkgdGhpcyBtaWdodCBiZSBhIGJhZCBpZGVhKSwgYnV0IEkg
Y2VydGFpbmx5IHdvdWxkbid0IHdhbnQKPiB0byBkbyBzbyBoZXJlLgoKSSBhZ3JlZSB0aGF0IGFk
ZGluZyB0aGUgMTYgY2FzZSBzaG91bGRuJ3QgaGFwcGVuIGluIHRoaXMgcGF0Y2gsIGFuZCBJCmRv
bid0IHNlZSBhIG5lZWQgZm9yIGl0LiAgVW5sZXNzIHdlIHRoaW5rIGd1ZXN0IE9TZXMgd2lsbCB1
c2UgMTYtYnl0ZQphdG9taWMgb3BzIHRvIHVwZGF0ZSB0aGVpciA4LWJ5dGUgUFRFcywgdGhlIHNo
YWRvdyBjb2RlIGlzIHByb2JhYmx5CmJldHRlciBvZmYgdGFraW5nIHRoYXQgYXMgYSBoaW50IHRv
IHVuc2hhZG93LgoKQ2hlZXJzLAoKVGltLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
