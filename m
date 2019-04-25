From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: Xen 4.11.1: guest uses altp2m to crash host
Date: Thu, 25 Apr 2019 13:53:19 +0100
Message-ID: <b91bc68b-85fc-a5b8-7b40-126a0c6e463f@citrix.com>
References: <CAFLDOk8Egs_gJmx1Yg386eEkmq4gNcbBxVGkjC7Wofhz8zCe1w@mail.gmail.com>
 <1f659428-0dd1-5537-5007-e97ff16a7506@bitdefender.com>
 <CAFLDOk9j1FgXDG2N6rzi0ObO3eip2pxM59_aaTcBjg_F_63A0g@mail.gmail.com>
 <a08d4a56-1da6-b373-f847-3a37197ffb53@bitdefender.com>
 <5CC186320200007800228F32@prv1-mh.provo.novell.com>
 <5cfd3ea1-b25d-ec0b-1278-d4fdb28486be@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PBl1=S3=citrix.com=prvs=0115b8627=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hJdsU-0003Qs-1j
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2019 12:53:26 +0000
In-Reply-To: <5cfd3ea1-b25d-ec0b-1278-d4fdb28486be@bitdefender.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>, Jan Beulich <JBeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMjUvMDQvMjAxOSAxMzoxNywgUmF6dmFuIENvam9jYXJ1IHdyb3RlOgo+IE9uIDQvMjUvMTkg
MTowNCBQTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDE1LjA0LjE5IGF0IDE2OjEwLCA8
cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbT4gd3JvdGU6Cj4+PiBPbiA0LzE1LzE5IDU6MDQgUE0s
IE1hdHQgTGVpbmhvcyB3cm90ZToKPj4+PiBZb3UgYXJlIGNvcnJlY3QgLS0gY2hlcnJ5IHBpY2tp
bmcgdGhhdCBjb21taXQgaW50byBSRUxFQVNFLTQuMTEuMSAKPj4+PiBhZGRyZXNzZXMgdGhlIGNy
YXNoLiBUaGUgcHJvYmxlbSBjYW5ub3QgYmUgcmVwcm9kdWNlZCBvbiA0LjEyLgo+Pj4+Cj4+Pj4g
SSBob3BlIHRoaXMgaGVscHMuCj4+PiBUaGFuayB5b3UgZm9yIGNvbmZpcm1pbmcgdGhlIGZpeCEK
Pj4+Cj4+PiBUbyB0aGUgZGVjaWRlcnM6IHdvdWxkIGl0IGJlIHJlYXNvbmFibGUgdG8gYXNrIHBh
dGNoZXMgbGlrZSB0aGlzIHRvIGJlIAo+Pj4gYmFja3BvcnRlZCB0byB0aGUgZnV0dXJlIDQuMTEg
cmVsZWFzZT8KPj4gV2VsbCwgZmlyc3Qgb2YgYWxsIHlvdSBjYW4gYWx3YXlzIHNlbmQgYSByZXF1
ZXN0LiBBbmQgeWVzLCBpbiBnZW5lcmFsCj4+IEknZCBjb25zaWRlciB0aGlzIHJlYXNvbmFibGUs
IGJ1dCBJIHNheSBzbyB3aXRob3V0IGhhdmluZyBsb29rZWQgYXQKPj4gdGhlIGFjdHVhbCBjb21t
aXQocykgaW4gcXVlc3Rpb24uCj4gVGhhbmsgeW91IGZvciB0aGUgYW5zd2VyLiBUaGlzIGlzIHRo
ZSBjb21taXQgaW4gcXVlc3Rpb246Cj4KPiBodHRwOi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYi8/
cD14ZW4uZ2l0O2E9Y29tbWl0ZGlmZjtoPTFkZGRmZmY0YzM5ZDNkYjE3ZGZhNzA5YjFjNTdmNDRl
M2VkMzUyZTM7aHA9Njg0NjU5NDRjODFmYTJmYmM0MGJmMjllYzYwODQwNzJhZjVlNDhlYwo+Cj4g
QUZBSUNUIHRoZXJlJ3Mgbm90aGluZyBjb250cm92ZXJzaWFsIGFib3V0IGl0LCBhbmQgaXQgc2hv
dWxkIGVhc2lseQo+IGFwcGx5IHRvIDQuMTEsIHNvIGlmIHBvc3NpYmxlIEkgcHJvcG9zZSB0aGF0
IHdlIGNvbnNpZGVyIGJhY2twb3J0aW5nIGl0Cj4gdG8gdGhlIG5leHQgNC4xMSByZWxlYXNlLgoK
SSBoYXZlIGEgcmF0aGVyIGxhcmdlIG51bWJlciBvZiBhbHRwMm0gYmFja3BvcnRzIHRvIFhlbiA0
LjExIGluIHRoZQpYZW5TZXJ2ZXIgcGF0Y2hxdWV1ZSwgd2hpY2ggaW4gcHJhY3RpY2UKCkl0IHdv
dWxkIGNlcnRhaW5seSBtYWtlIG15IGxpZmUgZWFzaWVyIGlmIHRoZXkgd2VyZSB0byBnbyB1cHN0
cmVhbS7CoCBJCmNhbiBwdXQgdG9nZXRoZXIgYSBicmFuY2ggaWYgdGhhdCB3b3VsZCBiZSBoZWxw
ZnVsLgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
