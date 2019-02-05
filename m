From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v7 02/15] argo: introduce the argo_op
 hypercall boilerplate
Date: Tue, 05 Feb 2019 01:14:47 -0700
Message-ID: <5C5945F70200007800213D6E@prv1-mh.provo.novell.com>
References: <1548908900-1128-1-git-send-email-christopher.w.clark@gmail.com>
 <1548908900-1128-3-git-send-email-christopher.w.clark@gmail.com>
 <alpine.DEB.2.10.1902041608190.22962@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=tSsM=QM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gqvsd-0003N5-6R
 for xen-devel@lists.xenproject.org; Tue, 05 Feb 2019 08:14:55 +0000
In-Reply-To: <alpine.DEB.2.10.1902041608190.22962@sstabellini-ThinkPad-X260>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Juergen Gross <jgross@suse.com>, Tim Deegan <tim@xen.org>, Wei Liu <wei.liu2@citrix.com>, ross.philipson@gmail.com, Jason Andryuk <jandryuk@gmail.com>, Daniel Smith <dpsmith@apertussolutions.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Christopher Clark <christopher.w.clark@gmail.com>, Rich Persaud <persaur@gmail.com>, James McKenzie <james@bromium.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, eric chanudet <eric.chanudet@gmail.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA1LjAyLjE5IGF0IDAxOjM5LCA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4gd3JvdGU6
Cj4gT24gV2VkLCAzMCBKYW4gMjAxOSwgQ2hyaXN0b3BoZXIgQ2xhcmsgd3JvdGU6Cj4+ICsjaW5j
bHVkZSA8eGVuL2Vycm5vLmg+Cj4+ICsjaW5jbHVkZSA8eGVuL2d1ZXN0X2FjY2Vzcy5oPgo+PiAr
Cj4+ICtsb25nCj4+ICtkb19hcmdvX29wKHVuc2lnbmVkIGludCBjbWQsIFhFTl9HVUVTVF9IQU5E
TEVfUEFSQU0odm9pZCkgYXJnMSwKPj4gKyAgICAgICAgICAgWEVOX0dVRVNUX0hBTkRMRV9QQVJB
TSh2b2lkKSBhcmcyLCB1bnNpZ25lZCBsb25nIGFyZzMsCj4+ICsgICAgICAgICAgIHVuc2lnbmVk
IGxvbmcgYXJnNCkKPj4gK3sKPj4gKyAgICByZXR1cm4gLUVOT1NZUzsKPj4gK30KPj4gKwo+PiAr
I2lmZGVmIENPTkZJR19DT01QQVQKPj4gK2xvbmcKPj4gK2NvbXBhdF9hcmdvX29wKHVuc2lnbmVk
IGludCBjbWQsIFhFTl9HVUVTVF9IQU5ETEVfUEFSQU0odm9pZCkgYXJnMSwKPj4gKyAgICAgICAg
ICAgICAgIFhFTl9HVUVTVF9IQU5ETEVfUEFSQU0odm9pZCkgYXJnMiwgdW5zaWduZWQgbG9uZyBh
cmczLAo+PiArICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBhcmc0KQo+PiArewo+PiArICAg
IHJldHVybiAtRU5PU1lTOwo+PiArfQo+PiArI2VuZGlmCj4gCj4gRnJvbSBhbiBBUk0gcGVyc3Bl
Y3RpdmUsIGl0IGlzIG5vdCBhIGdvb2QgaWRlYSB0byB1c2UgdW5zaWduZWQgbG9uZyBhcwo+IGh5
cGVyY2FsbCBwYXJhbWV0ZXJzIGJlY2F1c2UgdGhleSBhcmUgZ29pbmcgdG8gYmUgb2YgZGlmZmVy
ZW50IHNpemUgb24KPiBhcm0zMiBhbmQgYXJtNjQuIE9uIEFSTSwgdGhlcmUgaXMgbm8gQ09NUEFU
IGNvZGUsIGFuZCB3ZSB0cnkgdG8ga2VlcCBhCj4gc2luZ2xlIHN0YWJsZSBBQkkgYWNyb3NzIDMy
Yml0IGFuZCA2NGJpdCBoeXBlcnZpc29ycyAocG9pbnRlcnMgc2l6ZQo+IGJlaW5nIHRoZSBvbmx5
IGV4Y2VwdGlvbiBhbmQgd2UgZGVhbCB3aXRoIHRoYXQgdXNpbmcKPiBYRU5fR1VFU1RfSEFORExF
X1BBUkFNKS4KPiAKPiBGb3IgdGhpcyByZWFzb24sIGdpdmVuIHRoYXQgd2UgZG9uJ3QgbmVlZCBh
cmczIGFuZCBhcmc0IHRvIGFjdHVhbGx5IGJlCj4gNjRiaXQsIGl0IHdvdWxkIGJlIGJlc3QgdG8g
dXNlIGV4cGxpY2l0bHkgc2l6ZWQgaW50ZWdlcnMgaW5zdGVhZC4gSQo+IHdvdWxkIHVzZSB1aW50
MzJfdCBvciB1bnNpZ25lZCBpbnQgZm9yIGFyZzMgYW5kIGFyZzQuIFRoYXQgd2F5LCB0aGVyZQo+
IGFyZSBub3QgZ29pbmcgdG8gYmUgYW55IEFCSSBjb21wYXRpYmlsaXR5IGlzc3VlcyBiZXR3ZWVu
IGFybTMyIGFuZCBhcm02NAo+IGFuZCB3ZSBjb3VsZCBydW4sIGFuZCBldmVuIG1pZ3JhdGUsIDMy
Yml0IGd1ZXN0cyB0byBhIDY0Yml0IGh5cGVydmlzb3IKPiB3aXRob3V0IHByb2JsZW1zLgo+IAo+
IEkga25vdyB0aGF0IEFuZHJldyBleHByZXNzZWQgY29uY2VybnMgYWJvdXQgdXNpbmcgdW5zaWdu
ZWQgaW50IGJlZm9yZSwKPiBidXQgZG9uJ3Qgd2UganVzdCBuZWVkIHRvIG1ha2Ugc3VyZSB3ZSBh
cmUgcHJvcGVybHkgaWdub3JpbmcgdGhlIHRvcAo+IDMyYml0IG9mIGFyZzMgYW5kIGFyZzQgd2hl
biB0aGUgaHlwZXJ2aXNvciBpcyBjb21waWxlZCA2NGJpdD8KCkFyZSB5b3Ugc2F5aW5nIHRoYXQg
aHlwZXJjYWxsIGFyZ3VtZW50cyBtYWRlIGJ5IGEgMzItYml0IGd1ZXN0IG9uIGEKNjQtYml0IGh5
cGVydmlzb3IgZG8gbm90IGdldCB6ZXJvLWV4dGVuZGVkIGJlZm9yZSByZWFjaGluZyB0aGUgQyBs
YXllcgoob3IgbW9yZSBzcGVjaWZpY2FsbHkgdGhlIGluZGl2aWR1YWwgaGFuZGxlcnMsIHNpbmNl
IG9uIHg4NiB3ZSBkZWFsIHdpdGgKdGhlIG5lY2Vzc2FyeSB6ZXJvLWV4dGVuc2lvbiBpbiBDIG5v
d2FkYXlzKT8gV2hhdCBhYm91dApkb19tZW1vcnlfb3AoKSdzIGZpcnN0IHBhcmFtZXRlciB0aGVu
PwoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
