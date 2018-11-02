From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] xen: remove size limit of privcmd-buf
 mapping interface
Date: Fri, 2 Nov 2018 10:53:45 +0100
Message-ID: <f1c413ba-f867-1521-86a3-35f00bffe9d3__7508.32324051789$1541152363$gmane$org@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=gwqu=nn=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1gIW9K-0002ok-QI
 for xen-devel@lists.xenproject.org; Fri, 02 Nov 2018 09:53:54 +0000
References: =?UTF-8?B?PDIwMTgxMTAxMTIzMzA3Ljg0MjTvv70x77+9amdyb3NzQHN1c2Uu?=
 =?UTF-8?Q?com=3e_=3c5BDB0B240200007800142507=40prv1=ef=bf=bdmh=2eprovo=2eno?=
 =?UTF-8?B?dmVsbC5jb20+IDxiNjRmN2ZhNO+/vWE1NTPvv71iY2I077+9NjA1Me+/vWM5MTA4?=
 =?UTF-8?Q?0642b8e=40suse=2ecom=3e_=3c5BDB20AB020000780014251B=40suse=2ecom?=
 =?UTF-8?Q?=3e_=3c12dd8625-2cad-f156-8bae-487e909af412=40suse=2ecom=3e_=3c5B?=
 =?UTF-8?Q?DBFC1402000078001F7101=40suse=2ecom=3e?=
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Stefano Stabellini <sstabellini@kernel.org>, lkml <linux-kernel@vger.kernel.org>, stable@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

T24gMDIvMTEvMjAxOCAwODoyNiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMDEuMTEuMTgg
YXQgMTc6MjcsIDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3RlOgo+PiBPbiAwMS8xMS8yMDE4IDE2OjUw
LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4+IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNv
bT4gMTEvMDEvMTggMzoyMyBQTSA+Pj4KPj4+PiBPbiAwMS8xMS8yMDE4IDE1OjE4LCBKYW4gQmV1
bGljaCB3cm90ZToKPj4+Pj4+Pj4gSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPiAxMS8w
MS8xOCAxOjM0IFBNID4+Pgo+Pj4+Pj4gQ3VycmVudGx5IHRoZSBzaXplIG9mIGh5cGVyY2FsbCBi
dWZmZXJzIGFsbG9jYXRlZCB2aWEKPj4+Pj4+IC9kZXYveGVuL2h5cGVyY2FsbCBpcyBsaW1pdGVk
IHRvIGEgZGVmYXVsdCBvZiA2NCBtZW1vcnkgcGFnZXMuIEZvciBsaXZlCj4+Pj4+PiBtaWdyYXRp
b24gb2YgZ3Vlc3RzIHRoaXMgbWlnaHQgYmUgdG9vIHNtYWxsIGFzIHRoZSBwYWdlIGRpcnR5IGJp
dG1hc2sKPj4+Pj4+IG5lZWRzIHRvIGJlIHNpemVkIGFjY29yZGluZyB0byB0aGUgc2l6ZSBvZiB0
aGUgZ3Vlc3QuIFRoaXMgbWVhbnMKPj4+Pj4+IG1pZ3JhdGluZyBhIDhHQiBzaXplZCBndWVzdCBp
cyBhbHJlYWR5IGV4aGF1c3RpbmcgdGhlIGRlZmF1bHQgYnVmZmVyCj4+Pj4+PiBzaXplIGZvciB0
aGUgZGlydHkgYml0bWFwLgo+Pj4+Pj4KPj4+Pj4+IFRoZXJlIGlzIG5vIHNlbnNpYmxlIHdheSB0
byBzZXQgYSBzYW5lIGxpbWl0LCBzbyBqdXN0IHJlbW92ZSBpdAo+Pj4+Pj4gY29tcGxldGVseS4g
VGhlIGRldmljZSBub2RlJ3MgdXNhZ2UgaXMgbGltaXRlZCB0byByb290IGFueXdheSwgc28gdGhl
cmUKPj4+Pj4+IGlzIG5vIGFkZGl0aW9uYWwgRE9TIHNjZW5hcmlvIGFkZGVkIGJ5IGFsbG93aW5n
IHVubGltaXRlZCBidWZmZXJzLgo+Pj4+Pgo+Pj4+PiBCdXQgaXMgdGhpcyBzZXR0aW5nIG9mIHBl
cm1pc3Npb25zIHdoYXQgd2Ugd2FudCBsb25nIHRlcm0/IFdoYXQgYWJvdXQgYQo+Pj4+PiBkZS1w
cml2aWxlZ2VkIHFlbXUsIHdoaWNoIHN0aWxsIG5lZWRzIHRvIGJlIGFibGUgdG8gaXNzdWUgYXQg
bGVhc3QgZG0tb3AKPj4+Pj4gaHlwZXJjYWxscz8KPj4+Pgo+Pj4+IFdvdWxkbid0IHRoYXQgcWVt
dSBoYXZlIG9wZW5lZCB0aGUgbm9kZSB3aGlsZSBzdGlsbCBiZWluZyBwcml2aWxlZ2VkPwo+Pj4K
Pj4+IFBvc3NpYmx5LCBidXQgaG93IGRvZXMgdGhpcyBoZWxwPyBBcyBzb29uIGFzIGl0J3MgdW5w
cml2aWxlZ2VkIGl0IG11c3Qgbm90Cj4+PiBiZSBhYmxlIHRvIGhvZyByZXNvdXJjZXMgYW55bW9y
ZS4KPj4+Cj4+PiBBbnl3YXksIHdpdGggQW5kcmV3J3MgcmVwbHkgbXkgcG9pbnQgbWF5IGJlIGly
cmVsZXZhbnQsIGJ1dCBJIGhhdmUgdG8KPj4+IGFkbWl0IEknbSBub3QgZW50aXJlbHkgc3VyZS4K
Pj4KPj4gSSBndWVzcyB3ZSB3YW50IFhlbiB0b29scyB0byBjbG9zZSAvZGV2L3hlbi9oeXBlcmNh
bGwgKG9yIG1vcmUgcHJlY2lzZToKPj4gZG9uJ3QgZHVwMigpIGl0KSB3aGVuIHFlbXUgaXMgZGUt
cHJpdmlsZWdpbmcgaXRzZWxmLiBUaGlzIHdpbGwgbWFrZSBpdAo+PiB2ZXJ5IGNsZWFyIHRoYXQg
aXQgY2FuJ3QgaG9nIG1lbW9yeSB2aWEgbW1hcCgpLgo+Pgo+PiBXaGVuIHlvdSBhcmUgZmluZSB3
aXRoIHRoYXQgSSdsbCBzZW5kIGEgWGVuIHBhdGNoIGZvciB0aGlzLgo+IAo+IElmIHRoYXQgZG9l
c24ndCBwcmV2ZW50IHRoZSBwcm9jZXNzIGZyb20gbWFraW5nIHRoZSBoeXBlcmNhbGxzIGl0Cj4g
aXMgcGVybWl0dGVkIHRvIGRvIChJIGhhdmUgdG8gYWRtaXQgSSBkb24ndCByZWNhbGwgaWYgdGhl
cmUgYXJlIGFueQo+IHN0aWxsIG5lZWRlZCBiZXNpZGVzIHRoZSBkbW9wIG9uZXMpLCBzdXJlLgoK
VHVybnMgb3V0IHRoYXQgaXMgYWxyZWFkeSBkb25lOiB0aGUgcmVzdHJpY3RfYWxsIGNhbGxiYWNr
IG9mIGxpYnhlbmNhbGwKd2lsbCBhc3NvY2lhdGUgL2Rldi9udWxsIHdpdGggdGhlIGZpbGUgZGVz
Y3JpcHRvciBvZiAvZGV2L3hlbi9oeXBlcmNhbGwuCgoKSnVlcmdlbgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
