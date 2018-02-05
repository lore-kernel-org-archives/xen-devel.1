From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v3 25/25] x86/shadow: fold
 sh_x86_emulate_{write, cmpxchg}() into their only callers
Date: Mon, 05 Feb 2018 01:42:39 -0700
Message-ID: <5A78270F02000078001A515D@prv-mh.provo.novell.com>
References: <5A29550C020000780019585B@prv-mh.provo.novell.com>
 <5A295BE60200007800195997@prv-mh.provo.novell.com>
 <b5b83e68-fd48-d715-7e75-24e85dcdfbf3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=do0y=e7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1eicMO-00013q-Vl
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2018 08:42:45 +0000
In-Reply-To: <b5b83e68-fd48-d715-7e75-24e85dcdfbf3@citrix.com>
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Tim Deegan <tim@xen.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAyLjAyLjE4IGF0IDE3OjUyLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMDcvMTIvMTcgMTQ6MTksIEphbiBCZXVsaWNoIHdyb3RlOgo+PiBAQCAtMjk4LDE0
ICszMzIsNDMgQEAgaHZtX2VtdWxhdGVfY21weGNoZyhlbnVtIHg4Nl9zZWdtZW50IHNlZwo+PiAg
ICAgIGlmICggcmMgKQo+PiAgICAgICAgICByZXR1cm4gcmM7Cj4+ICAKPj4gKyAgICAvKiBVbmFs
aWduZWQgd3JpdGVzIGFyZSBvbmx5IGFjY2VwdGFibGUgb24gSFZNICovCj4+ICsgICAgaWYgKCAo
YWRkciAmIChieXRlcyAtIDEpKSAmJiAhaXNfaHZtX3ZjcHUodikgICkKPj4gKyAgICAgICAgcmV0
dXJuIFg4NkVNVUxfVU5IQU5ETEVBQkxFOwo+PiArCj4+ICsgICAgcHRyID0gc2hfZW11bGF0ZV9t
YXBfZGVzdCh2LCBhZGRyLCBieXRlcywgc2hfY3R4dCk7Cj4+ICsgICAgaWYgKCBJU19FUlIocHRy
KSApCj4+ICsgICAgICAgIHJldHVybiB+UFRSX0VSUihwdHIpOwo+PiArCj4+ICAgICAgb2xkID0g
bmV3ID0gMDsKPj4gICAgICBtZW1jcHkoJm9sZCwgcF9vbGQsIGJ5dGVzKTsKPj4gICAgICBtZW1j
cHkoJm5ldywgcF9uZXcsIGJ5dGVzKTsKPj4gIAo+PiAtICAgIHJjID0gdi0+YXJjaC5wYWdpbmcu
bW9kZS0+c2hhZG93Lng4Nl9lbXVsYXRlX2NtcHhjaGcoCj4+IC0gICAgICAgICAgICAgdiwgYWRk
ciwgJm9sZCwgbmV3LCBieXRlcywgc2hfY3R4dCk7Cj4+ICsgICAgcGFnaW5nX2xvY2sodi0+ZG9t
YWluKTsKPj4gKyAgICBzd2l0Y2ggKCBieXRlcyApCj4+ICsgICAgewo+PiArICAgIGNhc2UgMTog
cHJldiA9IGNtcHhjaGcoKHVpbnQ4X3QgICopcHRyLCBvbGQsIG5ldyk7IGJyZWFrOwo+PiArICAg
IGNhc2UgMjogcHJldiA9IGNtcHhjaGcoKHVpbnQxNl90ICopcHRyLCBvbGQsIG5ldyk7IGJyZWFr
Owo+PiArICAgIGNhc2UgNDogcHJldiA9IGNtcHhjaGcoKHVpbnQzMl90ICopcHRyLCBvbGQsIG5l
dyk7IGJyZWFrOwo+PiArICAgIGNhc2UgODogcHJldiA9IGNtcHhjaGcoKHVpbnQ2NF90ICopcHRy
LCBvbGQsIG5ldyk7IGJyZWFrOwo+PiArICAgIGRlZmF1bHQ6Cj4+ICsgICAgICAgIFNIQURPV19Q
UklOVEsoImNtcHhjaGcgc2l6ZSAldSBpcyBub3Qgc3VwcG9ydGVkXG4iLCBieXRlcyk7Cj4gCj4g
R2l2ZW4gdGhlIGVhcmxpZXIgcGF0Y2hlcyBpbiB0aGUgc2VyaWVzLCBpcyBpdCB3b3J0aCBpbnRy
b2R1Y2luZyBjYXNlIDE2Cj4gaGVyZT8KCkluIGEgZm9sbG93LXVwIHBhdGNoIHRoaXMgY291bGQg
YmUgYW4gb3B0aW9uICh1bmxlc3MgVGltIGtub3dzIGEKcmVhc29uIHdoeSB0aGlzIG1pZ2h0IGJl
IGEgYmFkIGlkZWEpLCBidXQgSSBjZXJ0YWlubHkgd291bGRuJ3Qgd2FudAp0byBkbyBzbyBoZXJl
LgoKPiBJcnJlc3BlY3RpdmUsIHRoaXMgZG9lc24ndCBpbnRlcmZlcmUgd2l0aCB0aGUgcHVycG9z
ZSBvZiB0aGUgcGF0Y2gsIHNvCj4gUmV2aWV3ZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5j
b29wZXIzQGNpdHJpeC5jb20+CgpUaGFua3MsIEphbgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
