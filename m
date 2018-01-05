From: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v2 5/6] xen: Add only xen-sysdev to dynamic
 sysbus device list
Date: Fri, 5 Jan 2018 14:12:01 +0000
Message-ID: <20180105141201.GC1905@perard.uk.xensource.com>
References: <20171125151610.20547-1-ehabkost@redhat.com>
 <20171125151610.20547-6-ehabkost@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=ngrd=ea=citrix.com=prvs=536b6079c=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1eXSj7-0001LM-E6
 for xen-devel@lists.xenproject.org; Fri, 05 Jan 2018 14:12:05 +0000
Content-Disposition: inline
In-Reply-To: <20171125151610.20547-6-ehabkost@redhat.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Eduardo Habkost <ehabkost@redhat.com>
Cc: jgross@suse.com, Thomas Huth <thuth@redhat.com>, sstabellini@kernel.org, qemu-devel@nongnu.org, Marcel Apfelbaum <marcel@redhat.com>, xen-devel@lists.xenproject.org, Laszlo Ersek <lersek@redhat.com>
List-Id: xen-devel@lists.xenproject.org

T24gU2F0LCBOb3YgMjUsIDIwMTcgYXQgMDE6MTY6MDlQTSAtMDIwMCwgRWR1YXJkbyBIYWJrb3N0
IHdyb3RlOgo+IFRoZXJlJ3Mgbm8gbmVlZCB0byBtYWtlIHRoZSBtYWNoaW5lIGFsbG93IGV2ZXJ5
IHBvc3NpYmxlIHN5c2J1cwo+IGRldmljZS4gIFdlIGNhbiBub3cganVzdCBhZGQgeGVuLXN5c2Rl
diB0byB0aGUgYWxsb3dlZCBsaXN0Lgo+IAo+IENjOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFi
ZWxsaW5pQGtlcm5lbC5vcmc+Cj4gQ2M6IEFudGhvbnkgUGVyYXJkIDxhbnRob255LnBlcmFyZEBj
aXRyaXguY29tPgo+IENjOiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKPiBDYzogSnVl
cmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgo+IFNpZ25lZC1vZmYtYnk6IEVkdWFyZG8gSGFi
a29zdCA8ZWhhYmtvc3RAcmVkaGF0LmNvbT4KCkkndmUgdGVzdGVkIHRoZSBwYXRjaCBzZXJpZXMg
d2l0aCBldmVyeSBob3RwbHVnIHRoaW5ncyBJIGNvdWxkIHRoaW5rIG9mLAphbmQgaXQgd29ya2Vk
IGZpbmUuCgpBY2tlZC1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5j
b20+Cgo+IC0tLQo+IENoYW5nZXMgc2VyaWVzIHYxIC0+IHYyOgo+ICogTmV3IHBhdGNoIGFkZGVk
IHRvIHNlcmllcwo+IC0tLQo+ICBody94ZW4veGVuX2JhY2tlbmQuYyB8IDcgKy0tLS0tLQo+ICAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDYgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAt
LWdpdCBhL2h3L3hlbi94ZW5fYmFja2VuZC5jIGIvaHcveGVuL3hlbl9iYWNrZW5kLmMKPiBpbmRl
eCA4MjM4MGVhOWVlLi43NDQ1YjUwNmFjIDEwMDY0NAo+IC0tLSBhL2h3L3hlbi94ZW5fYmFja2Vu
ZC5jCj4gKysrIGIvaHcveGVuL3hlbl9iYWNrZW5kLmMKPiBAQCAtNTY0LDEyICs1NjQsNyBAQCBz
dGF0aWMgdm9pZCB4ZW5fc2V0X2R5bmFtaWNfc3lzYnVzKHZvaWQpCj4gICAgICBPYmplY3RDbGFz
cyAqb2MgPSBvYmplY3RfZ2V0X2NsYXNzKG1hY2hpbmUpOwo+ICAgICAgTWFjaGluZUNsYXNzICpt
YyA9IE1BQ0hJTkVfQ0xBU1Mob2MpOwo+ICAKPiAtICAgIC8qCj4gLSAgICAgKiBFbXVsYXRlIG9s
ZCBtYy0+aGFzX2R5bmFtaWNfc3lzYnVzPXRydWUgYXNzaWdubWVudAo+IC0gICAgICoKPiAtICAg
ICAqVE9ETzogYWRkIG9ubHkgWGVuIGRldmljZXMgdG8gdGhlIGxpc3QKPiAtICAgICAqLwo+IC0g
ICAgbWFjaGluZV9jbGFzc19hbGxvd19keW5hbWljX3N5c2J1c19kZXYobWMsIFRZUEVfU1lTX0JV
U19ERVZJQ0UpOwo+ICsgICAgbWFjaGluZV9jbGFzc19hbGxvd19keW5hbWljX3N5c2J1c19kZXYo
bWMsIFRZUEVfWEVOU1lTREVWKTsKPiAgfQo+ICAKPiAgaW50IHhlbl9iZV9yZWdpc3Rlcihjb25z
dCBjaGFyICp0eXBlLCBzdHJ1Y3QgWGVuRGV2T3BzICpvcHMpCgotLSAKQW50aG9ueSBQRVJBUkQK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
