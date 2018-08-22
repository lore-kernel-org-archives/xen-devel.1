From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH] gnttab/ARM: properly implement
 gnttab_create_status_page()
Date: Wed, 22 Aug 2018 16:58:17 +0100
Message-ID: <47869f43-f633-1338-f48b-0866978eab9c@arm.com>
References: <5B73DCDF02000078001DE331@prv1-mh.provo.novell.com>
 <alpine.DEB.2.10.1808151056010.15066@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=cicq=lf=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1fsVWX-0001TO-Eb
 for xen-devel@lists.xenproject.org; Wed, 22 Aug 2018 15:58:21 +0000
In-Reply-To: <alpine.DEB.2.10.1808151056010.15066@sstabellini-ThinkPad-X260>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich <JBeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiAxNS8wOC8xOCAxODo1NywgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+IE9uIFdl
ZCwgMTUgQXVnIDIwMTgsIEphbiBCZXVsaWNoIHdyb3RlOgo+PiBQcmV2ZW50IHRoZSAiQlVHX09O
KHBhZ2VfZ2V0X293bmVyKHBnKSAhPSBkKSIgaW4KPj4gZ250dGFiX3VucG9wdWxhdGVfc3RhdHVz
X2ZyYW1lcygpIGZyb20gdHJpZ2dlcmluZy4KPj4KPj4gUmVwb3J0ZWQtYnk6IOeOi+ejiiA8bGVp
MTkud2FuZ0BzYW1zdW5nLmNvbT4KPj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVs
aWNoQHN1c2UuY29tPgo+Pgo+PiAtLS0KPj4gSXQgbG9va3MgdG8gbWUgYXMgaWYgdGhpcyB3YXMg
dGhlIG9ubHkgcGllY2UgbWlzc2luZyB0byBtYWtlIHYyIGdyYW50Cj4+IHRhYmxlcyB3b3JrIG9u
IEFSTSwgYnV0IHRoaXMgd2FzIGJ1aWxkIHRlc3RlZCBvbmx5IGFueXdheS4KPiAKPiBGb3IgdGhl
IHB1YmxpYyByZWNvcmRzLCBpdCBjYW5ub3QgYmUgdGVzdGVkIHVudGlsIHRoZSBMaW51eCAob3Ig
b3RoZXIKPiBPU2VzIGZ1bmN0aW9uYWxpdGllcykgZ2V0IGltcGxlbWVudGVkLiBTcGVjaWZpY2Fs
bHksCj4gYXJjaF9nbnR0YWJfbWFwX3NoYXJlZCBhbmQgYXJjaF9nbnR0YWJfbWFwX3N0YXR1cyBp
biBMaW51eC4KCkkgaGF2ZSBjcmVhdGVkIFhFTi0xMTUgb24gSmlyYSB0byB0cmFjayB0aGUgd29y
ay4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
