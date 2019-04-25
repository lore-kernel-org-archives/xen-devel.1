From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: Xen 4.11.1: guest uses altp2m to crash host
Date: Thu, 25 Apr 2019 15:17:24 +0300
Message-ID: <5cfd3ea1-b25d-ec0b-1278-d4fdb28486be@bitdefender.com>
References: <CAFLDOk8Egs_gJmx1Yg386eEkmq4gNcbBxVGkjC7Wofhz8zCe1w@mail.gmail.com>
 <1f659428-0dd1-5537-5007-e97ff16a7506@bitdefender.com>
 <CAFLDOk9j1FgXDG2N6rzi0ObO3eip2pxM59_aaTcBjg_F_63A0g@mail.gmail.com>
 <a08d4a56-1da6-b373-f847-3a37197ffb53@bitdefender.com>
 <5CC186320200007800228F32@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aaLI=S3=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1hJdKE-000099-DM
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2019 12:18:02 +0000
In-Reply-To: <5CC186320200007800228F32@prv1-mh.provo.novell.com>
Content-Language: en-US-large
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gNC8yNS8xOSAxOjA0IFBNLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+PiBPbiAxNS4wNC4xOSBh
dCAxNjoxMCwgPHJjb2pvY2FydUBiaXRkZWZlbmRlci5jb20+IHdyb3RlOgo+PiBPbiA0LzE1LzE5
IDU6MDQgUE0sIE1hdHQgTGVpbmhvcyB3cm90ZToKPj4+IFlvdSBhcmUgY29ycmVjdCAtLSBjaGVy
cnkgcGlja2luZyB0aGF0IGNvbW1pdCBpbnRvIFJFTEVBU0UtNC4xMS4xIAo+Pj4gYWRkcmVzc2Vz
IHRoZSBjcmFzaC4gVGhlIHByb2JsZW0gY2Fubm90IGJlIHJlcHJvZHVjZWQgb24gNC4xMi4KPj4+
Cj4+PiBJIGhvcGUgdGhpcyBoZWxwcy4KPj4KPj4gVGhhbmsgeW91IGZvciBjb25maXJtaW5nIHRo
ZSBmaXghCj4+Cj4+IFRvIHRoZSBkZWNpZGVyczogd291bGQgaXQgYmUgcmVhc29uYWJsZSB0byBh
c2sgcGF0Y2hlcyBsaWtlIHRoaXMgdG8gYmUgCj4+IGJhY2twb3J0ZWQgdG8gdGhlIGZ1dHVyZSA0
LjExIHJlbGVhc2U/Cj4gCj4gV2VsbCwgZmlyc3Qgb2YgYWxsIHlvdSBjYW4gYWx3YXlzIHNlbmQg
YSByZXF1ZXN0LiBBbmQgeWVzLCBpbiBnZW5lcmFsCj4gSSdkIGNvbnNpZGVyIHRoaXMgcmVhc29u
YWJsZSwgYnV0IEkgc2F5IHNvIHdpdGhvdXQgaGF2aW5nIGxvb2tlZCBhdAo+IHRoZSBhY3R1YWwg
Y29tbWl0KHMpIGluIHF1ZXN0aW9uLgoKVGhhbmsgeW91IGZvciB0aGUgYW5zd2VyLiBUaGlzIGlz
IHRoZSBjb21taXQgaW4gcXVlc3Rpb246CgpodHRwOi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYi8/
cD14ZW4uZ2l0O2E9Y29tbWl0ZGlmZjtoPTFkZGRmZmY0YzM5ZDNkYjE3ZGZhNzA5YjFjNTdmNDRl
M2VkMzUyZTM7aHA9Njg0NjU5NDRjODFmYTJmYmM0MGJmMjllYzYwODQwNzJhZjVlNDhlYwoKQUZB
SUNUIHRoZXJlJ3Mgbm90aGluZyBjb250cm92ZXJzaWFsIGFib3V0IGl0LCBhbmQgaXQgc2hvdWxk
IGVhc2lseQphcHBseSB0byA0LjExLCBzbyBpZiBwb3NzaWJsZSBJIHByb3Bvc2UgdGhhdCB3ZSBj
b25zaWRlciBiYWNrcG9ydGluZyBpdAp0byB0aGUgbmV4dCA0LjExIHJlbGVhc2UuCgoKVGhhbmtz
LApSYXp2YW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
