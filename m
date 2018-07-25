From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] tools/helpers: don't hardcode domain type
 for dom0 and xenstore domain
Date: Wed, 25 Jul 2018 14:31:19 +0100
Message-ID: <20180725133119.l3wkwbyquvrdcbzm@citrix.com>
References: <20180725132526.16961-1-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=m8ai=kj=citrix.com=prvs=737e41906=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fiJsz-0002TE-0S
 for xen-devel@lists.xenproject.org; Wed, 25 Jul 2018 13:31:25 +0000
Content-Disposition: inline
In-Reply-To: <20180725132526.16961-1-jgross@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, ian.jackson@eu.citrix.com, wei.liu2@citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBKdWwgMjUsIDIwMTggYXQgMDM6MjU6MjZQTSArMDIwMCwgSnVlcmdlbiBHcm9zcyB3
cm90ZToKPiBUb2RheSB3aGVuIHNldHRpbmcgdXAgYSBtaW5pbWFsIGRvbWFpbiBjb25maWd1cmF0
aW9uIGZpbGUgZm9yIGRvbTAgYW5kCj4gZXZlbnR1YWxseSB4ZW5zdG9yZS1kb21haW4gdGhlIGRv
bWFpbiB0eXBlIGlzIGhhcmNvZGVkIGFzIFBWLiBDaGFuZ2UKPiB0aGF0IGJ5IGFza2luZyB0aGUg
aHlwZXJ2aXNvciBmb3IgdGhlIGNvcnJlY3QgdHlwZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKdWVy
Z2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Cgo+IC0tLQo+ICB0b29scy9oZWxwZXJzL2luaXQt
ZG9tLWpzb24uYyB8IDE0ICsrKysrKysrKysrKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNl
cnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS90b29scy9oZWxwZXJz
L2luaXQtZG9tLWpzb24uYyBiL3Rvb2xzL2hlbHBlcnMvaW5pdC1kb20tanNvbi5jCj4gaW5kZXgg
OTFiMWZkZjNkYi4uM2JjZjY5N2VjZiAxMDA2NDQKPiAtLS0gYS90b29scy9oZWxwZXJzL2luaXQt
ZG9tLWpzb24uYwo+ICsrKyBiL3Rvb2xzL2hlbHBlcnMvaW5pdC1kb20tanNvbi5jCj4gQEAgLTEz
LDYgKzEzLDcgQEAgaW50IGdlbl9zdHViX2pzb25fY29uZmlnKHVpbnQzMl90IGRvbWlkKQo+ICAg
ICAgeGVudG9vbGxvZ19sb2dnZXJfc3RkaW9zdHJlYW0gKmxvZ2dlcjsKPiAgICAgIGxpYnhsX2N0
eCAqY3R4Owo+ICAgICAgbGlieGxfZG9tYWluX2NvbmZpZyBkb21fY29uZmlnOwo+ICsgICAgbGli
eGxfZG9taW5mbyBkb21pbmZvOwo+ICAgICAgY2hhciAqanNvbiA9IE5VTEw7Cj4gIAo+ICAgICAg
bG9nZ2VyID0geHRsX2NyZWF0ZWxvZ2dlcl9zdGRpb3N0cmVhbShzdGRlcnIsIFhUTF9FUlJPUiwg
MCk7Cj4gQEAgLTI1LDEyICsyNiwxOSBAQCBpbnQgZ2VuX3N0dWJfanNvbl9jb25maWcodWludDMy
X3QgZG9taWQpCj4gICAgICAgICAgZ290byBvdXRsb2c7Cj4gICAgICB9Cj4gIAo+ICsgICAgbGli
eGxfZG9taW5mb19pbml0KCZkb21pbmZvKTsKPiArICAgIGlmIChsaWJ4bF9kb21haW5faW5mbyhj
dHgsICZkb21pbmZvLCBkb21pZCkpIHsKPiArICAgICAgICBmcHJpbnRmKHN0ZGVyciwgImNhbm5v
dCBnZXQgZG9tYWluIHR5cGVcbiIpOwo+ICsgICAgICAgIGdvdG8gb3V0ZGlzcG9zZTsKPiArICAg
IH0KPiArCj4gICAgICBsaWJ4bF9kb21haW5fY29uZmlnX2luaXQoJmRvbV9jb25maWcpOwoKWW91
IHNob3VsZCBtb3ZlIHRoaXMgYmVmb3JlIHRoZSBkb21pbmZvIGluaXRpYWxpc2F0aW9uLCBvdGhl
cndpc2UKb3V0ZGlzcG9zZSBwYXRoIGlzIHdyb25nLgoKV2VpLgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
